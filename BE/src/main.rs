mod api;
mod api_state;
mod strapi;

use actix_web::{web, App, HttpServer};
use api::build_api;
use dotenv::dotenv;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    HttpServer::new(|| {
        App::new()
            .route("/ping", web::get().to(|| async { "pong" }))
            .configure(build_api)
    })
    .bind(("0.0.0.0", 8088))?
    .run()
    .await
}
