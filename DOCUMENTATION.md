# USERS

## GET Retrieve an user

* Retrieve an user object using ID specified in the request path

http://localhost:3000/users/:id


## GET List all users

* Returns a list of users objects for a workspace

http://localhost:3000/users


## POST Create user

* Create an user with request params and retrieve the new object

http://localhost:3000/users/

json_params:

user: {
  name: STRING
}

## PUT Update user

* Update an user using ID specified in the request path and parameters specified in request params. Then retrieve the updated object

http://localhost:3000/users/:id

json_params:

user: {
  name: STRING
}
