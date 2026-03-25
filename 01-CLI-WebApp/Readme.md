
# az version

# az login

# az account list -o table
# az account show

# az account set -s "subcription_id"

# Create azure resource group
\$ az group create -n rg-azure-cli-webapp -l westeurope

# Create App service plan
\$ az appservice plan create --name azure-cli-plan \
--resource-group rg-azure-cli-webapp --is-linux --sku B1

# Create the app service
\$ az webapp create --name azure-cli-webapp-01 --resource-group rg-azure-cli-webapp \
--plan azure-cli-plan --runtime "JAVA:11-java11"

\$ az group list -o table
\$ az resource list --resource-group rg-azure-cli-webapp -o table

\$ az webapp show --name azure-cli-webapp-01 --resource-group rg-azure-cli-webapp --query hostNames[0]

\$ az group delete -n rg-azure-cli-webapp