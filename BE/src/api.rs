use actix_web::web;

use crate::api_state;
use crate::strapi;
use api_state::{State, StrapiState};

pub fn build_api(cfg: &mut web::ServiceConfig) {
    cfg.app_data(web::Data::new(State::default()));

    cfg.app_data(web::Data::new(StrapiState::default()));
    cfg.service(web::scope("/api/strapi").service(strapi::handlers::handlers()));
}
