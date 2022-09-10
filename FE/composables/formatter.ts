export const formatCompactNumber = (n: number): string => {
  const formatter = Intl.NumberFormat('en', { notation: "compact" })
  return formatter.format(n);
}

export const formatTimeAgo = (targetDate: Date, comparisonDate?: Date): string => {
  const DIVISIONS: { amount: number, name: RelativeTimeFormatUnit }[] = [
    { amount: 60, name: 'seconds' },
    { amount: 60, name: 'minutes' },
    { amount: 24, name: 'hours' },
    { amount: 7, name: 'days' },
    { amount: 4.34524, name: 'weeks' },
    { amount: 12, name: 'months' },
    { amount: Number.POSITIVE_INFINITY, name: 'years' }
  ]

  type RelativeTimeFormatUnit =
    | "years"
    | "months"
    | "weeks"
    | "days"
    | "hours"
    | "minutes"
    | "seconds";

  const formatter = new Intl.RelativeTimeFormat('en', { numeric: 'auto' });
  comparisonDate = comparisonDate || new Date()
  let duration = (targetDate.valueOf() - comparisonDate.valueOf() ) / 1000

  for (let i = 0; i <= DIVISIONS.length; i++) {
    const division = DIVISIONS[i]
    if (Math.abs(duration) < division.amount) {
      return formatter.format(Math.round(duration), division.name)
    }
    duration /= division.amount
  }
}

