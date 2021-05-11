#/bin/bash
#dotnet restore src/NetMQ
#dotnet build src/NetMQ
dotnet pack ZeroMQ.netcore.csproj -p:Version=4.1.0.32-tropare

dotnet nuget push bin/Debug/ZeroMQ.4.1.0.32-tropare.nupkg
dotnet nuget delete NetMQ 4.1.0.32-tropare -s ~/.nuget/packages/ --non-interactive
