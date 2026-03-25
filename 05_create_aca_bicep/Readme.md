

$RESOURCE_GROUP="rg-aca-app-bicep"

# create new resource group
az group create --name $RESOURCE_GROUP --location westeurope

# preview the changes
az deployment group what-if `
              --name aca-demo-bicep `
              --resource-group $RESOURCE_GROUP `
              --template-file main.bicep

# apply the changes
az deployment group create `
              --name aca-demo-bicep `
              --resource-group $RESOURCE_GROUP `
              --template-file main.bicep