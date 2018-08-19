# Notifications API

A service for processing social media posts and keeping track of word frequencies per social media account.

## API Reference

This is a RESTFUL JSON-based API.

### Accepting new Notifications Web Hook
### POST `/api/v1/web_hooks/notifications` 

Request body:

```json
{
  "message": {
    "account_name": "alevee",
    "text": "Hello world!",
    "timestamp": "2018-08-18T21:00:11Z"
  }
}
```

Returns 200 OK when received.

## Installation

Ensure you have Ruby version 2.4 before continuing.

1. Clone the project
2. Run `bundle install`
3. Ensure you have Postgres installed on your machine
4. Create your database.yml file from the database.yml.example
5. Create development database `rake db:create && rake db:migrate`
6. Create test database `rake db:create RAILS_ENV=test && rake db:migrate RAILS_ENV=test`

## Launching the server

Run the following command in the root directory.

```bash
rails s
```

## Testing

To run the test suite, run the following command in the root directory.

```bash
rspec spec
```