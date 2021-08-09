# Documentação API

## URL

`https://encontre-sua-biblioteca-api.herokuapp.com/v1/`


## Endpoints

### Healthcheck

This path allow see health application

#### [GET] /

```
    { message: 'Welcome' }
```

### Libraries

#### [POST] /libraries

- Headers:
    - Content-Type: application/json

Body JSON Parameters

##### Body

```
{
    "name": "Library Martin Luther King Jr.",
    "description": "Library any books",
    "image_src": "http://image.com/jpg.jpg",
    "latitude": -36.656565,
    "longitude": -35.65656
}
```

##### Response

###### Created - 201

```
{
    "id": 1,
    "name": "Library Martin Luther King Jr.",
    "description": "Library any books",
    "image_src": "http://image.com/jpg.jpg",
    "latitude": -36.656565,
    "longitude": -35.65656
}
```

###### Bad Request - 400

#### [GET] /libraries

- Headers:
    - Content-Type: application/json

##### Parameters

Query Parameters

```
    {
        "latitude": -36.656565,
        "longitude": -36.656565
    }
```

##### Response

###### OK - 200

```
[
    { ... },
    {
        "id": 1,
        "name": "Library Martin Luther King Jr.",
        "description": "Library any books",
        "image_src": "http://image.com/jpg.jpg",
        "latitude": -36.656565,
        "longitude": -35.65656
    },
    { ... }
]
```

###### Not Found - 404

```
    []
```

###### Bad Request - 400

```
    []
```

