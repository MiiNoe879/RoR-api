# Incentives REST API

## Setup

### Prerequisites

* Ruby (version 2.4.2)
* Postgres (https://postgresapp.com/)

### DB setup

Create the databases
`rails db:create`

Load the schema and add some data
`rails db:setup`

## Run

Start the server on port 3000 `rails server`

Check if everything is ok by opening localhost:3000/api/v1/tenants/
