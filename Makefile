.PHONY: all test

all: test

test:
	rm -f examples/merged-transactions.xlsx
	python parse_transactions.py examples/a.xlsx            configs/a.json examples/merged-transactions.xlsx
	python parse_transactions.py examples/a-duplicates.xlsx configs/a.json examples/merged-transactions.xlsx
	python parse_transactions.py examples/b.xlsx            configs/b.json examples/merged-transactions.xlsx
	python parse_transactions.py examples/c.xlsx            configs/c.json examples/merged-transactions.xlsx
