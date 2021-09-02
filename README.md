# Rails Update and Destroy Lab

## Learning Goals

- Generate `update` and `destroy` routes for one resource

## Introduction

In this lab, we'll continue building an API for the plant store! The code for
the frontend React application is done; you can find it in the `client`
directory. Your job is to create the Rails API so that the `fetch` requests on
the frontend work successfully.

## Instructions

To set up the frontend and backend dependencies, from the root directory, run:

```console
$ npm install --prefix client
$ bundle install
$ rails db:migrate db:seed
```

To see how the React application and Rails API are interacting, you can run the
Rails application in one terminal by running:

```console
$ rails s
```

Then, **open another terminal** and run React:

```console
$ npm start --prefix client
```

Each application will run on its own port on `localhost`:

- React: [http://localhost:4000](http://localhost:4000)
- Rails: [http://localhost:3000](http://localhost:3000)

## Deliverables

### Routes

Your API should have the following routes as well as the associated controller
actions that return the appropriate JSON data:

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
