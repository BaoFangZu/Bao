# Bao

docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql


用户服务
	user

id name phone email headicon place createTime 

POST /users
GET /users
GET /users/user_id
DELETE /users/user_id
PUT /users/user_id

文章服务
	article
id title content author path createTime updateTime 

POST /articles
GET /articles
GET /articles/_id
DELETE /articles/_id
PUT /article/_id

评论点赞服务
	comment
id targetId userId content createTime

POST /comments
GET /comments
GET /comments/_id
DELETE /comments/_id

	like
id targetId userId 

POST /likes
DELETE /likes?target_id=&user_id=

收藏服务
	favorite
id targetId userId 

POST /favorites
GET /favorites
DELETE /favorites?target_id=&user_id=


附件服务
	attachment
id targetId path sequence
POST /attachments
GET /attachments?target_id=
DELETE /attachments/_id

分享服务
	share
爆房服务
	expose
id articleId type position price creator createTime updateTime

POST /exposures
GET /exposures
GET /exposures/_id
DELETE /exposures/_id
PUT /exposures/_id

网关服务
	gateway

