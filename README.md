## Featured Tags

### Windows images only

|Tags|Collation|
|--- |---|
|2022-latest|```SQL_Latin1_General_CP1_CI_AS```|

### SQL Server Developer Edition only

|Tags prefix|Product|Version|Release date|
|--- |--- |--- |---|
|2022-latest...|SQL Server 2022 CU8|16.0.4075.1|2023-09-14|

## Configuration
Requires the following environment flags:
- ```ACCEPT_EULA=Y```
- ```MSSQL_SA_PASSWORD=```

## Build

All images are based on [.NET Framework Runtime](https://hub.docker.com/_/microsoft-dotnet-framework-runtime) in particular:

|Product|Base image|Release date|
|--- |--- |---|
|SQL Server 2022|mcr.microsoft.com/dotnet/framework/runtime:<br/>4.8.1-20230808-windowsservercore-ltsc2022|2023-08-08|
