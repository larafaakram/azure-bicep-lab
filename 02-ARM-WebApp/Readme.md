
# Create Resource group
\$ az group create rg-arm-webapp -l westeurope

# See preview
\$ az deployment group what-if --resource-group rg-arm-webapp --template-file webapp-linux.json --parameters webapp-linux.json webAppName='arm-011'

# Create App Service with ARM template through Cli
\$ az deployment group create --resource-group rg-arm-webapp --template-file webapp-linux.json --parameters webapp-linux.json webAppName='arm-011'

# Show resources
\$ az resource list --resource-group rg-arm-webapp -o table

# delete resource group
\$ az group delete --resource-group rg-arm-webapp