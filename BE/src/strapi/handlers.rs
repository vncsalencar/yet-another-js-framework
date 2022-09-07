use crate::api_state::{State, StrapiState};

use super::types::{ContentWeLiked, StrapiApiResponse};
use actix_web::{get, web, HttpResponse, Responder, Scope};

#[get("/{content_type}")]
async fn list(
    content_type: web::Path<String>,
    shared: web::Data<State>,
    strapi: web::Data<StrapiState>,
) -> actix_web::Result<impl Responder> {
    let client = &shared.client;
    let url = format!("{}/api/{}", strapi.url, content_type);

    match client.get(url).bearer_auth(&strapi.token).send().await {
        Ok(response) => match response.json::<StrapiApiResponse<ContentWeLiked>>().await {
            Ok(data) => Ok(HttpResponse::Ok().json(data)),
            Err(e) => Err(actix_web::error::ErrorInternalServerError(e)),
        },
        Err(e) => Err(actix_web::error::ErrorInternalServerError(e)),
    }
}

pub fn handlers() -> Scope {
    web::scope("").service(list)
}
