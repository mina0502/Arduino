### MicroORM Dapper를 사용하여 Repository 구성

```
Model Class
Mapping(dt-> model)
	
	↓
Dapper(Micro ORM)

*ADO.NET Capsulation


```
### PEOCEDURE
```
CREATE PROCEDURE [dbo].[SP_Student_Add]
	@StudentName varchar(50),
	@Address varchar(200)
AS
	INSERT INTO
		TB_Student
		(
			StudentName,
			Address
		)
		VALUES
		(
			@StudentName,
			@Address
		)

```

```
IDbConnection -> Extended Method 
```