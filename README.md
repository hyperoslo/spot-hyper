# Spot Hyper
Spot Hyper shares where you are and what you working on in realtime with other team members, right from any slack channel. Spot Hyper runs Rails 5.0.0 Beta on Ruby 2.3.

## Usage
```
/spotme [message with hashtags]
Example: /spotme Working on #myshop #oslo #office
```

## Development
```
git clone repo-url
cd /directory 
bundle
./start (from terminal). If you get permission error, just do chmod 777 start
```

## System dependencies

Spot Hyper requires the following softwares:

* Ruby (2.3)
* PostgreSQL (9.4.5)

The versions listed are tested and confirmed to work, but the software may also be
compatible with earlier versions.

## TODO
* Pagination - infinite scroll
* More filter option - day wise  

### Running
```bash
	$ bundle exec rails db:create db:migrate
	$ bundle exec rails console
	$ ./start from terminal
```
