FROM mcr.microsoft.com/windows/servercore:ltsc2022

LABEL maintainer "Pangaea Information Technologies, Ltd."

# Download Links:
ENV setup "https://go.microsoft.com/fwlink/?linkid=2215158"

ENV sa_password="_" \
    attach_dbs="[]" \
    ACCEPT_EULA="_"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# make install files accessible
COPY start.ps1 /
WORKDIR /

RUN Invoke-WebRequest -Uri $env:setup -OutFile SQL1.exe
RUN .\SQL1.exe /qs /ACTION=Install /INSTANCENAME=MSSQLSERVER /FEATURES=SQLEngine,FullText /UPDATEENABLED=0 /SQLSVCACCOUNT='NT AUTHORITY\NETWORK SERVICE' /SQLSYSADMINACCOUNTS='BUILTIN\ADMINISTRATORS' /TCPENABLED=1 /NPENABLED=0 /IACCEPTSQLSERVERLICENSETERMS /SAPWD=qGH6RFvq /SECURITYMODE=SQL /SQLSVCSTARTUPTYPE=Automatic 
RUN Remove-Item -Recurse -Force SQL1.exe

RUN stop-service MSSQLSERVER 
RUN set-itemproperty -path 'HKLM:\software\microsoft\microsoft sql server\mssql14.MSSQLSERVER\mssqlserver\supersocketnetlib\tcp\ipall' -name tcpdynamicports -value ''
RUN set-itemproperty -path 'HKLM:\software\microsoft\microsoft sql server\mssql14.MSSQLSERVER\mssqlserver\supersocketnetlib\tcp\ipall' -name tcpport -value 1433
RUN set-itemproperty -path 'HKLM:\software\microsoft\microsoft sql server\mssql14.MSSQLSERVER\mssqlserver\' -name LoginMode -value 2

HEALTHCHECK CMD [ "sqlcmd", "-Q", "select 1" ]

CMD .\start -sa_password $env:sa_password -ACCEPT_EULA $env:ACCEPT_EULA -attach_dbs \"$env:attach_dbs\" -Verbose
