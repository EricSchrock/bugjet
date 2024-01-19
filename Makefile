.PHONY: all test clean

all: test

test:
	python parse_transactions.py examples/3rivers-fcu.xlsx            examples/3rivers-fcu.json test.xlsx
	python parse_transactions.py examples/3rivers-fcu-duplicates.xlsx examples/3rivers-fcu.json test.xlsx

clean:
	rm test.xlsx
