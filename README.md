# Lannister

PoC of a simple accounting system using Clean Architecture

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lannister'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lannister

## Usage
Print money (adds money to an account):

```ruby
Lannister.print_money(account_id: 42)
```

Get balance:

```ruby
Lannister.get_balance(account_id: 42)
```

Transfer money:

```ruby
Lannister.transfer_money(source_account_id: 42,
                        destination_account_id: 22,
                        amount: 100_000)
```

## Data Repository

This gem uses a trade repository that must answer to:

### .balance(account_id: 1) => responds` a decimal with the account's current balance 

### .debit(account_id: 1, amount: 100) => debits the account
### .credit(account_id: 1, amount: 100) => credits the account
