import { formatNumber } from './formatter';
import { it, expect, describe } from "vitest"

describe("Formatter", () => {
    it("should compact numbers", () => {
        let tenThousand = 10000
        let hundredThousand = 100000
        let million = 1000000
        expect(formatNumber(tenThousand)).toEqual('10K')
        expect(formatNumber(hundredThousand)).toEqual('100K')
        expect(formatNumber(million)).toEqual('1M')
    })
})

