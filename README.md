<img src="https://github.com/EricSchrock/bugjet/blob/master/images/logo.jpg" width="100" />

Bugjet is a tool for merging transactions from multiple financial accounts into a common format. I created it to automate a portion of my budgeting process.

## Instructions

### Install dependencies

```sh
pip install virtualenv
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
```

### Export transaction data

Export your transaction data from your financial accounts to `xlsx` files. The first row should be a header describing each column of data. You may need to download the data in `csv` format, open the `csv` file in excel, and "save as" into the `xlsx` format.

### Create config files

Create a `json` config file for each financial account that describes how to extract the date, description, and amount of each transaction from the exported data. See the `examples` and `configs` directories for examples of config files for different transaction data formats.

### Run Bugjet

Run Bugjet once for each set of exported data.

```sh
source venv/bin/activate
python parse_transactions.py input1.xlsx config1.json output.xlsx
python parse_transactions.py input2.xlsx config2.json output.xlsx
python parse_transactions.py input3.xlsx config3.json output.xlsx
deactivate
```

Notice that all calls to `parse_transactions.py` use the same output file. If the file does not exist, the script will create it. If it does exist, the script will append the transactions from the input file to the existing output file, **skipping duplicate transactions**.

### Example

Below is an example of four inputs and the corresponding merged output. Notice that the first two inputs have duplicate transactions, which are not duplicated in the output. Notice also that Bugjet can handle debits and credits being in the same column or in different columns and can handle different meanings for positive and negative amounts.

#### Inputs

![A](/images/a.png)
![A (duplicates)](/images/a-duplicates.png)
![B](/images/b.png)
![C](/images/c.png)

#### Output

![Merged Transactions](/images/merged-transactions.png)
