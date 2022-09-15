import { ContentType } from "./enums"

declare global {
    interface NpmPackage {
        title: string;
        description: string;
        version: string;
        latestRelease: Date;
        link: string;
        weeklyDownloads: number;
        githubStars: number;
    }

    interface Content {
        title: string,
        contentType : ContentType,
        date: string,
        author: string,
        thumbnailAlt: string,
        thumbnailUrl: string,
        tags: string,
        link: string,
    }

    interface HelpfulMaterial {
        title: string,
        content: {
            title: string,
            link: string,
        }[],
    }


    type SectionIds =
        "home" |
        "feature" |
        "content" |
        "twitter" |
        "tiktok" |
        "reddit" |
        "helpful" |
        "about"

}

export { }