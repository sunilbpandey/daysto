# daysto

`daysto` calculates the number of days from today to a specified date or between two dates.

## Installation

```
cabal install daysto
```

## Usage

```
daysto [from] to

OPTIONS
    from    Optional start date. If omitted, today's date is used.
    to      End date.

Both dates must be in YYYY-MM-DD format.
```

## Examples

```
daysto 2038-01-19
```

```
daysto 2021-01-01 2024-05-19
```
