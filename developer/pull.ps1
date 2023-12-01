function Invoke-PullImage
{
    param
    (
        [string]$Tag
    )

    docker pull pangaeatech/mssql-server-ltsc2022:$Tag
}

function Invoke-PullVersion
{
    param
    (
        [string]$Tag
    )

    Invoke-PullImage $Tag
}

Invoke-PullVersion '2022-latest'
