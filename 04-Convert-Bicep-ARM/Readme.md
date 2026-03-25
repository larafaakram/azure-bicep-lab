# Install Bicep CLI
az bicep install

# Decompile an ARM template into Bicep using Bicep CLI
az bicep decompile --file webapp.json

# Convert Bicep into ARM template using Bicep CLI
az bicep build --file webapp.bicep --outfile built-bicep.json

# Export an ARM template from Azure resources and decompile it into Bicep
az group export --name "your_resource_group_name" > exported.json
az bicep decompile --file exported.json