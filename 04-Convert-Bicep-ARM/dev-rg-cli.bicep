param actionGroups_DevGA_name string
param sshPublicKeys_my_first_instance_key_name string
param storageAccounts_mystorageaccount7604_name string

resource sshPublicKeys_my_first_instance_key_name_resource 'Microsoft.Compute/sshPublicKeys@2025-04-01' = {
  location: 'eastus'
  name: sshPublicKeys_my_first_instance_key_name
  properties: {
    publicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwrFzDQwJEeghD1nAneBQXfGoYDHZoltSrRzNNKZYdsnKGvAjgwwHTBdZzzYVvnxtV4CuteprdW1D3XvmJpe9UQ3WUtj7smduf2FkUq5h5urNjMNTLidkqUvpqlYLjnm2rvxkS8/MNe7UMDFFeXkOgdYuAJgoy6MJvex758fw7qSRQmyH+eC0aEtnaz8eEb7R3c3fwI5EljP0jLp7FlvOOwCcFq/wBpJumgviE+g8h72nmIL5Z5QpmaQ7RyYlYRTZF2EmaUU68bPk/MKOTJ8q9xbI8uwLjpcxsWxkRe/9MSaldAEDB/YVkLjGqSpPZvf0C7mmmOOU9CNs3sObJFr0zaD4VlOpSDt7gOkcKkUgWjhbww03Scm9iW7gkcVGUXfMiPIoy+foTjsnAwKNWO5dbpG4GWhK2y5f0RKcOcgq1fDFKzI347U8RGHd27S2ahqtC9UQyO5KDfb9ui3evh3iP8PnDuQbSRe76j1SJ50XJHF7hBkd9bk24ijF+1A40/P0= generated-by-azure'
  }
  tags: {
    instance: 'web'
  }
}

resource actionGroups_DevGA_name_resource 'microsoft.insights/actionGroups@2024-10-01-preview' = {
  location: 'eastus'
  name: actionGroups_DevGA_name
  properties: {
    armRoleReceivers: []
    automationRunbookReceivers: []
    azureAppPushReceivers: []
    azureFunctionReceivers: []
    emailReceivers: [
      {
        emailAddress: 'larafa.akram@hotmail.fr'
        name: '${actionGroups_DevGA_name}_-EmailAction-'
        useCommonAlertSchema: false
      }
    ]
    enabled: true
    eventHubReceivers: []
    groupShortName: 'DevGrpAct'
    itsmReceivers: []
    logicAppReceivers: []
    smsReceivers: []
    voiceReceivers: []
    webhookReceivers: []
  }
  tags: {
    env: 'dev'
  }
}

resource storageAccounts_mystorageaccount7604_name_resource 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  kind: 'StorageV2'
  location: 'eastus'
  name: storageAccounts_mystorageaccount7604_name
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    allowCrossTenantReplication: false
    encryption: {
      keySource: 'Microsoft.Storage'
      services: {
        blob: {
          enabled: true
          keyType: 'Account'
        }
        file: {
          enabled: true
          keyType: 'Account'
        }
      }
    }
    minimumTlsVersion: 'TLS1_0'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
      ipv6Rules: []
      virtualNetworkRules: []
    }
    supportsHttpsTrafficOnly: true
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource storageAccounts_mystorageaccount7604_name_default 'Microsoft.Storage/storageAccounts/blobServices@2025-06-01' = {
  parent: storageAccounts_mystorageaccount7604_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: false
    }
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_mystorageaccount7604_name_default 'Microsoft.Storage/storageAccounts/fileServices@2025-06-01' = {
  parent: storageAccounts_mystorageaccount7604_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    protocolSettings: {
      smb: {}
    }
    shareDeleteRetentionPolicy: {
      days: 7
      enabled: true
    }
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_mystorageaccount7604_name_default 'Microsoft.Storage/storageAccounts/queueServices@2025-06-01' = {
  parent: storageAccounts_mystorageaccount7604_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_mystorageaccount7604_name_default 'Microsoft.Storage/storageAccounts/tableServices@2025-06-01' = {
  parent: storageAccounts_mystorageaccount7604_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource storageAccounts_mystorageaccount7604_name_default_aks_deployment 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = {
  parent: storageAccounts_mystorageaccount7604_name_default
  name: 'aks-deployment'
  properties: {
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    immutableStorageWithVersioning: {
      enabled: false
    }
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mystorageaccount7604_name_resource
  ]
}

resource storageAccounts_mystorageaccount7604_name_default_akstfstate 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = {
  parent: storageAccounts_mystorageaccount7604_name_default
  name: 'akstfstate'
  properties: {
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    immutableStorageWithVersioning: {
      enabled: false
    }
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mystorageaccount7604_name_resource
  ]
}

resource storageAccounts_mystorageaccount7604_name_default_mydata 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = {
  parent: storageAccounts_mystorageaccount7604_name_default
  name: 'mydata'
  properties: {
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    immutableStorageWithVersioning: {
      enabled: false
    }
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mystorageaccount7604_name_resource
  ]
}

resource storageAccounts_mystorageaccount7604_name_default_tfstate 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = {
  parent: storageAccounts_mystorageaccount7604_name_default
  name: 'tfstate'
  properties: {
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    immutableStorageWithVersioning: {
      enabled: false
    }
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mystorageaccount7604_name_resource
  ]
}
