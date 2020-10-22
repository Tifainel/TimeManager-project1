## /users route

1. **GET /users/:userID :**
*Gets one user using their user id*

    * Response body : 
```json
{
    "data": {
        "email": "string",
        "id": 0,
        "role": 1,
        "username": "string"
    }
}
```

2. **GET /users?email={email}&username={username} :**
*Gets one user using their email and username*

    * Response body : 
```json
{
    "email": "string",
    "id": 0,
    "role": 0,
    "username": "string"
}
```

3. **POST /users :**
*Adds one user*.
    * Request body : 
```json
{
    "user": {
        "username": "string",
        "email": "string",
        "role": 0 (optional)
        }
}
```

    * Response body : 
```json
{
    "data": {
        "email": "string",
        "id": 0,
        "role": 0,
        "username": "string"
    }
}
```

4. **PUT /users/:userID :**
*Modifies one user using their user id*.
    * Request body : 
```json
{
    "user": {
        "username": "string",
        "email": "string",
        "role": 0 (optional)
        }
}
```
    * Response body : 
```json
{
    "data": {
        "email": "string",
        "id": 0,
        "role": 0,
        "username": "string"
    }
}
```

5. **DELETE /users/:userID :**
*Deletes one user using their user id*

## /workingtimes route

1. **GET /workingtimes/:userID?start={datetime}&end={datetime} :**
*Gets all the workingtimes of a user using their user id, within a start and an end date*

    * Response body : 
```json
[
    {
        "end": "2020-10-12T15:18:12.000000",
        "id": 0,
        "start": "2020-10-10T15:17:12.000000"
    }  
]
```

2. **GET workingtimes/:userID/:workingtimeID :**
*Gets one workingtime using its working time id and user id*

    * Response body : 
```json
{
    "end": "2020-10-12T15:18:12.000000",
    "id": 0,
    "start": "2020-10-10T15:17:12.000000"
}
```

3. **POST /workingtimes/:userID :**
*Adds one workingtime for a user*.
    * Request body : 
```json
{
    "start": "2020-10-20T15:19:12Z",
    "end":"2020-10-20T15:19:12"
}
```
    * Response body : 
```json
{
    "end": "2020-10-12T15:18:12.000000",
    "id": 0,
    "start": "2020-10-10T15:17:12.000000",
    "user_id": 0
}
```

4. **PUT /workingtimes/:workingtimeID :**
*Modifies one workingtime using its id*.

    * Request body : 
```json
{ 
    "workingtime": {
        "start": "2020-10-10T15:17:12Z",
        "end":"2020-10-20T16:19:12",
        "user_id": 0 (optional)
    }
}
```
    * Response body : 
```json
{
    "data": {
        "end": "2020-10-20T16:19:12Z",
        "id": 0,
        "start": "2020-10-10T15:17:12Z",
        "user_id": 0
    }
}
```

5. **DELETE /workingtimes/:workingtimeID :**
*Deletes one user using their user id*

## /clocks route

1. **GET /clocks/:userID :**
*Gets all the clocks of a user using their user id*

    * Response body : 
```json
[
    {
        "id": 0,
        "status": true,
        "time": "2020-10-12T15:18:12.000000",
        "user_id": 0
    }
]
```

2. **POST /clocks/:userID :**
*Adds one clock for a user using their user id*

    * Request body : 
```json
{ 
    "time": "2020-10-12T15:18:12Z",
    "status":"false"
}
```

    * Response body :
```json
{
    "data": {
        "id": 0,
        "status": true,
        "time": "2020-10-12T15:18:12Z"
    }
}
```


