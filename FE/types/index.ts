import { ContentTypeEnum } from "./enums"

declare global {
    interface Page<T> {
        data: T[],
        meta: {
            pagination: {
                page: number,
                pageCount: number,
                pageSize: number,
                total: number
            }
        }
    }
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
        contentType: ContentTypeEnum,
        date: string,
        author: string,
        thumbnailAlt?: string,
        thumbnailUrl?: string,
        tags?: string,
        link: string,
    }



    interface HelpfulMaterial {
        title: string,
        materials: {
            title: string,
            link: string,
        }[],
    }

    interface AnsweredQuestion {
        id: string,
        correct: boolean
    }

    interface GithubTrending {
        title: string,
        description: string,
        stars: number,
        starsToday: number,
        forks: number,
        language: string
    }

    interface ChangePagePayload {
        pageClicked?: number;
        nextPage?: boolean;
        previousPage?: boolean
    }
}

export { }