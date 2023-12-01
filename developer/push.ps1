function Push-Image
{
    param
    (
        [string]$Tag
    )

    docker push pangaeatech/mssql-server-ltsc2022:$Tag
}

function Push-Version
{
    param
    (
        [string]$Tag
    )

    Push-Image $Tag
}

Push-Version '2022-latest'
