# scripts

Create directory and add directory to Path environment variable. <br>

## efc_add
Currently supports sqlite and postgreSQL (npgsql)

### Without provider

If no provider paramter is provided, then only Microsoft.EntityFrameworkCore and Microsoft.EntityFrameworkCore.Design will be added. <br>
Run in directory with csproj file

```sh
efc_add
```

### With provider

```sh
efc_add -provider sqlite
```

```sh
efc_add -provider psql
```

## efc_migrate_update

```sh
efc_migrate_update -name 0_InitialCreate
```
