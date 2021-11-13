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
Unless otherwise specified in the API documentation, all table fields are not null.
## API Documentation
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
    "name": <NAME OF THE LOST ITEM>,
    "description": <DESCRPTION OF THE LOST ITEM, COULD BE NULL>,
    "time": <TIME WHEN THE ITEM WAS LOST>,
    "location": <WHERE THE ITEM WAS LOST, COULD BE NULL>,
    "owner": <SERIALIZED USER>
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
    "name": <NAME OF THE FOUND ITEM>,
    "description": <DESCRPTION OF THE FOUND ITEM, COULD BE NULL>,
    "time": <TIME WHEN THE ITEM WAS FOUND>,
    "location": <WHERE THE ITEM WAS FOUND>,
    "owner": <SERIALIZED USER>
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
### `GET /api/found/{user_id}/`
### `POST /api/lost/{user_id}/`
### `POST /api/found/{user_id}/`
### `DELETE /api/lost/{lost_id}/`
### `DELETE /api/found/{found_id}/`
