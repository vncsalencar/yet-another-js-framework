use std::collections::HashMap;

use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, Serialize, Deserialize)]
struct JavaScriptQuestionAlternative {
    alternative: String,
    text: String,
    correct: bool,
}

impl JavaScriptQuestionAlternative {
    fn new(alternative: String, text: String, correct: bool) -> JavaScriptQuestionAlternative {
        JavaScriptQuestionAlternative {
            alternative,
            text,
            correct,
        }
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
struct JavaScriptQuestion {
    text: String,
    snippet: String,
    alternatives: Vec<JavaScriptQuestionAlternative>,
    explanation: String,
    #[serde(skip_serializing)]
    answer: String,
    language: String,
}

impl Default for JavaScriptQuestion {
    fn default() -> Self {
        JavaScriptQuestion {
            text: String::new(),
            snippet: String::new(),
            alternatives: Vec::new(),
            explanation: String::new(),
            answer: String::new(),
            language: String::from("JavaScript"),
        }
    }
}

impl JavaScriptQuestion {
    fn clear(&mut self) {
        self.text.clear();
        self.snippet.clear();
        self.alternatives.clear();
        self.explanation.clear();
        self.answer.clear();
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let url = "https://raw.githubusercontent.com/lydiahallie/javascript-questions/master/README.md";
    let response = reqwest::get(url).await.unwrap();

    if response.status() != 200 {
        println!("Could not download JavaScript questions markdown file.");
        dbg!(response);
        return Ok(());
    }

    let body = response.text().await.unwrap();
    let lines = body.lines().skip(46);

    let mut questions = Vec::new();
    let mut question = JavaScriptQuestion::default();
    let mut parsing_snippet = false;
    let mut parsing_answer_details = false;

    for line in lines {
        if line.starts_with("######") {
            let mut split_line = line.split(".");
            let title = split_line.nth(1).unwrap().trim();
            question.text = title.to_string();
            continue;
        }

        if line.starts_with("```") {
            parsing_snippet = !parsing_snippet;
            continue;
        }

        if parsing_snippet {
            question.snippet.push_str(&(line.to_string() + "\n"));
            continue;
        }

        if line.starts_with("####") {
            let answer = line.split(":").nth(1).unwrap();
            question.answer = answer.trim().to_string();
            parsing_answer_details = true;
            continue;
        }

        if line.starts_with("- ") && line.contains(":") && line.contains("`") {
            let mut split = line.split(":");
            let alternative = split.next().unwrap();
            let alternative = alternative.replace("-", "").trim().to_string();
            let text = split.next().unwrap().trim();

            question
                .alternatives
                .push(JavaScriptQuestionAlternative::new(
                    alternative.clone(),
                    text.to_string().clone(),
                    false,
                ));

            continue;
        }

        if line.starts_with("</p>") {
            parsing_answer_details = false;
            continue;
        }

        if parsing_answer_details {
            question
                .explanation
                .push_str(&(line.to_string() + "\n").trim());
        }

        if line.starts_with("</details>") {
            question.alternatives = question
                .alternatives
                .into_iter()
                .map(|mut alternative| {
                    alternative.correct = alternative.alternative == question.answer;
                    alternative.to_owned()
                })
                .collect::<Vec<JavaScriptQuestionAlternative>>();

            questions.push(question.clone());
            question.clear();
            continue;
        }
    }

    let client = reqwest::Client::new();
    let url = format!(
        "{}/api/quiz-questions",
        std::env::var("STRAPI_URL").unwrap()
    );
    let authorization = format!("Bearer {}", std::env::var("STRAPI_TOKEN").unwrap());

    let mut count = 0;
    for question in questions.iter() {
        let mut body = HashMap::new();
        body.insert("data", question);
        let res = client
            .post(&url)
            .header("Authorization", &authorization)
            .json(&body)
            .send()
            .await?;
        count += 1;
        dbg!(count);
    }
    Ok(())
}
