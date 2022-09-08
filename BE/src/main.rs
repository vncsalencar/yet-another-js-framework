mod api;
mod api_state;
mod strapi;

use actix_web::{web, App, HttpServer};
use api::build_api;
use dotenv::dotenv;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();
    let port = std::env::var("BE_PORT")
        .unwrap_or_else(|_| "8088".to_string())
        .parse::<u16>()
        .expect("PORT must be a number");

    dbg!("Starting server on port {port}");

    HttpServer::new(|| {
        App::new()
            .route("/ping", web::get().to(|| async { "pong" }))
            .configure(build_api)
    })
    .bind(("0.0.0.0", port))?
    .run()
    .await
}
