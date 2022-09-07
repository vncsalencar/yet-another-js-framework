use std::env;

pub struct State {
    pub client: reqwest::Client,
}

impl Default for State {
    fn default() -> Self {
        Self {
            client: reqwest::Client::new(),
        }
    }
}

pub struct StrapiState {
    pub url: String,
    pub token: String,
}

impl Default for StrapiState {
    fn default() -> Self {
        Self {
            url: env::var("STRAPI_URL").expect("STRAPI_URL must be set"),
            token: env::var("STRAPI_TOKEN").expect("STRAPI_URL must be set"),
        }
    }
}
