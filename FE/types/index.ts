import {ContentType} from "./enums"

declare global {
    interface FeaturedFramework {
        title: string;
        description: string;
        version: string;
        latestRelease: string;
        link: string;
        weeklyDownloads: number;
        githubStars: number;
    }

    interface Content {
        title: string,
        type: ContentType,
        date: string,
        author: string,
        thumbnail?: {
            url: string,
            alt: string
        },
        tags: string[],
        link: string,
    }

  
}

export { }