#/bin/bash
#------------------------------------------------------
# ----                READ BEFORE RUNNING!!!!
#------------------------------------------------------

# Your git environment must be configured for package management before any scriptlet in this script will work.
# 1. Generate a package read/write enabled personal access token (PAT) in the Github Settings screen for your user
#       This can be created  in your github settings->developer settings 
# 2. Modify your ~/.bash_profile script to export your Github PAT  as an environment variable
#       export GITHUB_PAT=<your personal acccess token>
# 3. Make sure your ~/.nuget/NuGet/Nuget.Config has the Github Tropare Package repo added as the first source for packages, above the NugetRepo

# ---------------- Github Package Repo Management ----------------------
# -- delete --- WARNING -- Github doesnt support commandline package removal. You must use the Git Web ui to remove packages ---
#dotnet nuget delete ZeroMQ 4.1.0.32-tropare -s github --non-interactive -k $GITHUB_PAT

# -- clean
dotnet clean ZeroMQ.netcore.csproj
rm -rf ./nupkg

# -- pack
dotnet pack ZeroMQ.netcore.csproj -p:NuspecFile=ZeroMQ.tropare.nuspec -p:PackageOutputPath=./nupkg --configuration Release
#dotnet pack -v n -p:RepositoryUrl=https://github.com/tropare/vdf-transform -p:RepositoryType=git

# -- publish
dotnet nuget push nupkg/*.nupkg -s github  -k $GITHUB_PAT


# -- consuume
dotnet add package ZeroMQ --version 4.1.0.31-tropare

# ---------------- Github Package Repo Management ----------------------



#dotnet restore src/NetMQ
# dotnet build ZeroMQ.netcore.csproj --configuration Release
# donet build ZeroMQ.netcore.csproj -p:Version=4.1.0.33-tropare --configuration Release
# dotnet pack ZeroMQ.netcore.csproj -p:Version=4.1.0.33-tropare -p:NuspecFile=ZeroMQ.nuspec --configuration Release






# -------- Dotnet package manager tool installation instructions -----
# - Build tool package
#dotnet pack
#dotnet pack -p:NuspecFile=msg-bus.nuspec 


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