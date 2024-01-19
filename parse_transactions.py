from typing import List

class Transaction:
    def __init__(self, date, id, source, description, amount):
        self.date = date
        self.id = id,
        self.source = source
        self.description = description
        self.amount = amount

    def __str__(self):
        return f"{self.date},{self.id},{self.source},{self.description},{self.amount},"

if __name__ == "__main__":
    # Read imported transactions
    # Sanity check and filter imported transactions
    # Add imported transactions to the transaction database (check transaction dates and hashes to avoid adding duplicates)

    # Implement arg parsing for input, config, and output
    # Make transaction parsing configurable for different inputs
    # Add instructions and examples to the README
    # Add simple testing

    pass
