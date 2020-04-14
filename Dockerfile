FROM mcr.microsoft.com/powershell:6.1.0-ubuntu-18.04

RUN apt-get update && apt-get install -y git

COPY "entrypoint.ps1" /usr/bin/entrypoint
ENTRYPOINT ["pwsh", "/usr/bin/entrypoint/entrypoint.ps1"]