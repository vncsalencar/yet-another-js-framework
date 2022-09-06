export const formatNumber = (n: number): string => {
    const formatter = Intl.NumberFormat('en', { notation: "compact" })
    return formatter.format(n);
}