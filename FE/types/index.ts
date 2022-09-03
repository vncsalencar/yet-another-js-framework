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
}

export { }