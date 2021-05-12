#/bin/bash

# READ BEFORE RUNNING!!!!
# This script relies on you having a GITHUB_PAT variable set in your environment.
# The GITHUB_PAT is your GITHUB personal access token with rights to publish and read packages from github
# This can be created  in your github settings->developer settings and then set in your environment by running:
#    export GITHUB_PAT=<your personal acccess token>

#dotnet restore src/NetMQ
# dotnet build ZeroMQ.netcore.csproj --configuration Release
# donet build ZeroMQ.netcore.csproj -p:Version=4.1.0.33-tropare --configuration Release
# dotnet pack ZeroMQ.netcore.csproj -p:Version=4.1.0.33-tropare -p:NuspecFile=ZeroMQ.nuspec --configuration Release

dotnet pack ZeroMQ.netcore.csproj -p:NuspecFile=ZeroMQ.tropare.nuspec --configuration Release
dotnet nuget push ./bin/Release/ZeroMQ.4.1.0.33-tropare.nupkg -s https://nuget.pkg.github.com/tropare/index.json -k $GITHUB_PAT


# OBSOLETE - Delete local package repo item
# dotnet nuget delete NetMQ 4.1.0.32-tropare -s ~/.nuget/packages/ --non-interactive


# -------- Dotnet package manager tool installation instructions -----
# - Build tool package
#dotnet pack
#dotnet pack -p:NuspecFile=msg-bus.nuspec 
#dotnet pack -v n -p:RepositoryUrl=https://github.com/tropare/vdf-transform -p:RepositoryType=git

# - Uninstall a tool
#dotnet -d tool uninstall msg-bus
#dotnet tool uninstall --tool-path ~/bin  msg-bus

# - Install tool from named package repo directoory
#dotnet tool install --tool-path ~/bin -v n --add-source ./nupkg msg-bus
#dotnet tool install --tool-path ~/bin -v n msg-bus

# - Push tool to github repo -
# dotnet nuget push nupkg/msg-bus.1.0.0.nupkg -s https://nuget.pkg.github.com/tropare/index.json -k $GITHUB_PAT


# - Turn on dotnetcore tracing
#COREHOST_TRACE=1
#COREHOST_TRACEFILE=/tmp/host_trace.txt