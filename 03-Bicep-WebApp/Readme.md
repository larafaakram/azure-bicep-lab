
# create resource group
\$ az group create --name rg-bicep-webapp -l westeurope 

# preview change
\$ az deployment group what-if --resource-group rg-bicep-webapp --template-file main.bicep --parameters webAppName="bicep-013"

# Create AppService
\$ az deployment group create --resource-group rg-bicep-webapp --template-file main.bicep --parameters webAppName="bicep-013"

# Show resources
\$ az resource list --resource-group rg-arm-webapp -o table

# delete resource group
\$ az group delete --resource-group rg-arm-webapp