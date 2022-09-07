use actix_web::{get, web, App, HttpResponse, HttpServer, Responder};
use dotenv::dotenv;
use serde::{Deserialize, Serialize};
use std::env;

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct StrapiApiResponseMetadataPagination {
    page: i32,
    page_size: i32,
    page_count: i32,
    total: i32,
}
#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct StrapiApiResponseMetadata {
    pagination: StrapiApiResponseMetadataPagination,
}
#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct StrapiApiData<T> {
    id: i32,
    attributes: T,
}
#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct StrapiApiResponse<T> {
    data: Vec<StrapiApiData<T>>,
    meta: StrapiApiResponseMetadata,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct ContentWeLiked {
    content_type: String,
    title: String,
    author: String,
    date: String,
    tags: String,
    link: Option<String>,
    thumbnail_url: Option<String>,
    thumbnail_alt: Option<String>,
    created_at: String,
    updated_at: String,
    published_at: String,
}

struct AppState {
    client: reqwest::Client,
    base_url: String,
    strapi_token: String,
}

#[get("/strapi/{content_type}")]
async fn strapi_list(
    content_type: web::Path<String>,
    data: web::Data<AppState>,
) -> actix_web::Result<impl Responder> {
    let client = &data.client;
    let url = format!("{}/api/{}", data.base_url, content_type);

    match client.get(url).bearer_auth(&data.strapi_token).send().await {
        // TODO(@vncsalencar): handle response with .json() using deserialing + structs and handle errors
        Ok(response) => match response.json::<StrapiApiResponse<ContentWeLiked>>().await {
            Ok(data) => Ok(HttpResponse::Ok().json(data)),
            Err(e) => Err(actix_web::error::ErrorInternalServerError(e)),
        },
        Err(e) => Err(actix_web::error::ErrorInternalServerError(e)),
    }
}

#[actix_web::main] // or #[tokio::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    HttpServer::new(|| {
        let strapi_url = env::var("STRAPI_URL").expect("STRAPI_URL must be set");
        let strapi_token = env::var("STRAPI_TOKEN").expect("STRAPI_TOKEN must be set");

        App::new()
            .app_data(web::Data::new(AppState {
                client: reqwest::Client::new(),
                base_url: strapi_url,
                strapi_token,
            }))
            .route("/ping", web::get().to(|| async { "pong" }))
            .service(web::scope("/api").service(strapi_list))
    })
    .bind(("0.0.0.0", 8088))?
    .run()
    .await
}
