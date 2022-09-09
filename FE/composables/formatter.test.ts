import { formatCompactNumber, formatTimeAgo } from './formatter';
import { it, expect, describe } from "vitest"

describe("Formatter", () => {
    it("should compact numbers", () => {
        const tenThousand = 10000
        const hundredThousand = 100000
        const million = 1000000
        expect(formatCompactNumber(tenThousand)).toEqual('10K')
        expect(formatCompactNumber(hundredThousand)).toEqual('100K')
        expect(formatCompactNumber(million)).toEqual('1M')
    })

    it("should format date to X ago", () => {
        let targetDate = new Date("2022-01-02T06:00:00")

        const dates: { dateAgo: Date, expected: string }[] = [
            { dateAgo: new Date("2022-01-02T05:59:30"), expected: "30 seconds ago" },
            { dateAgo: new Date("2022-01-02T05:59:00"), expected: "1 minute ago" },
            { dateAgo: new Date("2022-01-02T01:00:00"), expected: "5 hours ago" },
            { dateAgo: new Date("2021-12-31T05:00:00"), expected: "2 days ago" },
            { dateAgo: new Date("2021-12-01T06:00:00"), expected: "last month" },
            { dateAgo: new Date("2019-01-01T06:00:00"), expected: "3 years ago" },
        ]

        for (let date of dates) {
            expect(formatTimeAgo(date.dateAgo, targetDate)).toEqual(date.expected)
        }
    })
})

