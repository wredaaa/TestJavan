# TESTJAVAN

`Step by Step run application`

1. Rename or duplicate `.env.example` to `.env` 
2. Setting `DB_CONNECTION` in `.env`
3. Execute script SQL
4. run `go run all` to run application


## Doc API

#### Login

```http
  POST /api/login
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `email` | `string` | **Required**. |
| `password` | `string` | **Required**. |


#### Create a data family

```http
  POST /api/family
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `parent_id` | `int` | **Required**. |
| `name` | `string` | **Required**. |
| `gender` | `int` | **Required**. 1 for male, 2 for female|
| `Token`      | `string` | **Required**. add Token in Headers |


#### Update a data family

```http
  PUT /api/family/{id}
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `parent_id` | `int` | **Required**. |
| `name` | `string` | **Required**. |
| `gender` | `int` | **Required**. 1 for male, 2 for female|
| `Token`      | `string` | **Required**. add Token in Headers |


#### Delete a data family

```http
  DELETE /api/family/{id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Token`      | `string` | **Required**. add Berear Token |


#### Create Asset

```http
  POST /api/asset
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `family_id` | `int` | **Required**. id parent|
| `person_id` | `int` | **Required**. id personal|
| `name` | `string` | **Required**. name asset|
| `price` | `float` | **Required**. price asset|
| `Token`      | `string` | **Required**. add Token in Headers |


#### Update asset

```http
  PUT /api/asset/{id}
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `family_id` | `int` | **Required**. id parent|
| `person_id` | `int` | **Required**. id personal|
| `name` | `string` | **Required**. name asset|
| `price` | `float` | **Required**. price asset|
| `Token`      | `string` | **Required**. add Token in Headers |


#### Delete asset

```http
  DELETE /api/asset/{id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Token`      | `string` | **Required**. add Berear Token |


#### GET total price

```http
  GET /api/asset
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `Token`      | `string` | **Required**. add Berear Token |