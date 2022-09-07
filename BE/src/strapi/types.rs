use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct StrapiApiResponseMetadataPagination {
    page: i32,
    page_size: i32,
    page_count: i32,
    total: i32,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct StrapiApiResponseMetadata {
    pagination: StrapiApiResponseMetadataPagination,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct StrapiApiData<T> {
    id: i32,
    attributes: T,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct StrapiApiResponse<T> {
    data: Vec<StrapiApiData<T>>,
    meta: StrapiApiResponseMetadata,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ContentWeLiked {
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
