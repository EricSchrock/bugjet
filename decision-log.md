# Decision Log

## Decision Templates

### Y-statement[^1]

```
In the context of <use case>,
facing <non-functional concern>,
we decided for <option>
and neglected <options>,
to achieve <quality>,
accepting downside <consequence>.
```

[^1]: https://ozimmer.ch/practices/2020/04/27/ArchitectureDecisionMaking.html

### Architecture Haiku[^2]

```
<x> is a priority,
so we chose design <y>,
accepting downside <z>.
```

[^2]: https://www.georgefairbanks.com/blog/comparch-wicsa-2011-panel-discussion-and-haiku-tutorial/

## Decision 1: Transaction import format

Supporting transaction data that includes commas is a priority,
so I chose to export transactions from financial accounts in `xlsx` format instead of `csv`,
accepting that `xlsx` is more complicated to work with than `csv`.

## Decision 2: Transaction database format

Simplicity and the ability to manually edit data are priorities,
so I chose to use a spreadsheet to store imported transactions instead of something like an `SQL` database.

## Decision 3: Transaction metadata source

Keeping manual editing of transaction metadata, like "category" and "comments", in just one place is a priority,
so I chose the transaction database as the entry point for this metadata, instead of the spreadsheets exported from financial accounts,
accepting that this requires the database to be persistent, rather fully regenerated at each import, to avoid losing the added metadata,
and accepting that this requires extra logic to avoid multiple imports causing duplicate transactions in the database.

## Decision 4: Transaction post-processing

Manually reviewing each transaction is a priority,
so I chose to forgo the added complexity of adding a regex based config file to auto-categorize transactions.

## Decision 5: Config file format

Minimizing 3rd-party dependencies is a priority,
so I chose to use JSON instead of YAML for the config file,
accepting that JSON is slightly less human readable.
