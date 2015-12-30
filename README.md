# Spot Hyper
Spot Hyper shares where you are and what you working on in realtime with other team members, right from any slack channel. Spot Hyper runs Rails 5.0.0 Beta on Ruby 2.3.

## Usage
```
/spotme [message with hashtags]
Example: /spotme Working on #myshop #oslo #office
```

## System dependencies

Spot Hyper requires the following softwares:

* Ruby (2.3)
* PostgreSQL (9.4.5)

The versions listed are tested and confirmed to work, but the software may also be
compatible with earlier versions.

### Running

	$ bundle exec rails db:create db:migrate
  $ bundle exec rails console
  $ bundle exec rails s
