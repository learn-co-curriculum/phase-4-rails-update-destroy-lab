# Rails Update and Destroy Lab

## Learning Goals

- Generate `update` and `destroy` routes for one resource

## Introduction

In this lab, we'll continue building an API for the plant store! The code for
this is separated into two folders:

- `plantsy-api`: our Rails API server
- `plantsy-frontend`: our React frontend

The code for the frontend application is done. Your job is to create the Rails
API so that the `fetch` requests on the frontend work successfully.

## Instructions

To set up and run the frontend, `cd` into the `plantsy-frontend` directory and
run:

```sh
npm install
npm start
```

This will run your frontend in the browser on port 4000.

To set up your backend, in a new terminal, `cd` into the `plantsy-api`
directory and run:

```sh
bundle install
```

You can run `learn test` to test the code for your deliverables as you go.
You're also encouraged to use Postman, and to test your backend routes by
interacting with the API from your frontend.

## Deliverables

### Routes

Your API should have the following routes, which each returns the appropriate
JSON data:

#### Update Route

Making a PATCH request to this route with an object in the body should update one
plant, and return the updated plant in the response. You should use strong
params to handle the update.

```txt
PATCH /plants/:id


Headers
-------
Content-Type: application/json


Request Body
------
{
  "is_in_stock": false
}


Response Body
-------
{
  "id": 1,
  "name": "Aloe",
  "image": "./images/aloe.jpg",
  "price": 11.50,
  "is_in_stock": false
}
```

#### Destroy Route

Making a DELETE request to this route should delete one plant from the database.
You should return a response of `head :no_content` to indicate a successful
deletion.

```txt
DELETE /plants/:id


Response Body
------
no content
```
