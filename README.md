<img src="https://github.com/EricSchrock/bugjet/blob/main/images/logo.jpg" width="50" />

# Overview

Script to merge transactions from multiple financial accounts.

# Instructions

## Installation

```sh
pip install virtualenv
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
```

## Usage

First, export your transaction data from your financial accounts to `xlsx` files. The first row should be a header describing each column of data. You may need to download the data in `csv` format, open the `csv` file in excel, and "save as" into the `xlsx` format.

Second, create a config file for each financial account that describes how to extract the date, description, and amount of each transaction from the exported data. The `examples` directory has several examples of exported data and the associated config files.

Third, run the script once for each set of exported data.

```sh
source venv/bin/activate
python parse_transactions.py input1.xlsx config1.json output.xlsx
python parse_transactions.py input2.xlsx config2.json output.xlsx
python parse_transactions.py input3.xlsx config3.json output.xlsx
deactivate
```

Notice that all calls to `parse_transactions.py` use the same output file. If the file does not exist, the script will create it. If it does exist, the script will append the transactions from the input file to the existing output file, skipping duplicate transactions.

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
