import { Thumbnail } from './../.nuxt/components.d';
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
        type: string,
        date: string,
        author: string,
        thumbnail: {
            url: string,
            alt: string
        },
        tags: string[],
        link: string,
    }

    enum ContentType {
        Article = "Article",
        Video = "Video",
        Project = "Project"
    }
}

export { }