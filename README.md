# scripts

Create directory and add directory to Path environment variable. <br>

## add_efc
Currently supports sqlite and postgreSQL (npgsql)

### Without provider

If no provider paramter is provided, then only Microsoft.EntityFrameworkCore and Microsoft.EntityFrameworkCore.Design will be added. <br>
Run in directory with csproj file

```bash
add_efc
```

### With provider

```bash
add_efc -provider sqlite
```

```bash
add_efc -provider psql
```
