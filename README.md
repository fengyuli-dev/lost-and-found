# Lost & Found at Cornell
A lost & found iOS app built during Cornell Appdev's Hack Challenge FA21.
## The Team
- Soleil Su: Designer
- [Zou Haoxuan](https://github.com/PORRIDGE-ZOU): iOS frontend developer
- [Vivian Fan](https://github.com/Vivian0913): iOS frontend developer
- [Li Fengyu](https://github.com/fengyuli2002): backend developer
## Summary
To be finished.
## Databases
This project contains a SQL database with three tables: user, lost, and found. Table "user" has one-to-many relationships with "lost" and "found".
## API Documentation
A HTTP status code of 500 indicates internal server error and should be reported to the backend developer.  
For post methods, the field time should be in the format: TBD.
### `GET /api/lost/`
Retrieve all lost items.   
Response:
```
<HTTP STATUS CODE 200>
{
    "lost": [ <SERIALIZED LOST ITEMS>, ... ]
}
```
### `GET /api/found/`
Retrieve all found items.   
Response:
```
<HTTP STATUS CODE 200>
{
    "found": [ <SERIALIZED FOUND ITEMS>, ... ]
}
```
### `GET /api/lost/{lost_id}/`
Retrive one lost item that matches the given id.  
Response if there exists such item:
```
<HTTP STATUS CODE 200>
{
    "id": <ID>,
    "name": <NAME OF THE LOST ITEM, NOT NULL>,
    "description": <DESCRPTION OF THE LOST ITEM, COULD BE NULL>,
    "time": <TIME WHEN THE ITEM WAS LOST, COULD BE NULL>,
    "location": <WHERE THE ITEM WAS LOST, COULD BE NULL>,
    "user": <SERIALIZED USER, NOT NULL>
}
```
Response if there is no such item:
```
<HTTP STATUS CODE 404>
{
    "error": true
}
```
### `GET /api/found/{found_id}/`
Retrive one found item that matches the given id.  
Response if there exists such item:
```
<HTTP STATUS CODE 200>
{
    "id": <ID>,
    "name": <NAME OF THE FOUND ITEM, NOT NULL>,
    "description": <DESCRPTION OF THE FOUND ITEM, COULD BE NULL>,
    "time": <TIME WHEN THE ITEM WAS FOUND, COULD BE NULL>,
    "location": <WHERE THE ITEM WAS FOUND, COULD BE NULL>,
    "user": <SERIALIZED USER, NOT NULL>
}
```
Response if there is no such item:
```
<HTTP STATUS CODE 404>
{
    "error": true
}
```
### `GET /api/lost/{user_id}/`
Retrive all lost items that belong to a user with the given id.  
Response if there exists such item:
```
<HTTP STATUS CODE 200>
{
    "lost": [ <SERIALIZED LOST ITEMS>, ... ]
}
```
Response if there is no such item:
```
<HTTP STATUS CODE 404>
{
    "error": true
}
```
### `GET /api/found/{user_id}/`
Retrive all items that are found by a user with the given id.  
Response if there exists such item:
```
<HTTP STATUS CODE 200>
{
    "found": [ <SERIALIZED FOUND ITEMS>, ... ]
}
```
Response if there is no such item:
```
<HTTP STATUS CODE 404>
{
    "error": true
}
```
### `POST /api/lost/{user_id}/`
Let a user post that a item is lost.  
Request:
```
{
    "name": <NAME, NOT NULL>,
    "description": <DISCRIPTION>,
    "time": <TIME>,
    "location": <LOCATION>
}
```
Response:  
Same as `GET /api/lost/{lost_id}/` except that a success post returns HTTP status code 201.  
If the request does not have a name, the response is 
```
<HTTP STATUS CODE 400>
{
    "error": true
}
```
If there is no such user, the response is also:
```
<HTTP STATUS CODE 404>
{
    "error": true
}
```
### `POST /api/found/{user_id}/`
Let a user post that a item is found.  
Request:
```
{
    "name": <NAME, NOT NULL>,
    "description": <DISCRIPTION>,
    "time": <TIME>,
    "location": <LOCATION>
}
```
Response:  
Same as `GET /api/found/{found_id}/` except that a success post returns HTTP status code 201.  
If the request does not have a name, the response is 
```
<HTTP STATUS CODE 400>
{
    "error": true
}
```
If there is no such user, the response is also:
```
<HTTP STATUS CODE 404>
{
    "error": true
}
```
### `DELETE /api/lost/{lost_id}/`
Delete a specific lost item.  
Response:  
Same as `GET /api/lost/{lost_id}/` 
### `DELETE /api/found/{found_id}/`
Delete a specific found item.  
Response:  
Same as `GET /api/found/{found_id}/`
