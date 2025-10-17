//Parameters

@description('Storage account connection string')
param storageConnectionString string 

@description('Secret name')
param secretname string = 'StorageConnectionString'

@description('Key vault name')
param kvname string = 'keyvault${uniqueString(resourceGroup().id)}'

@description('Key vault location')
param kvlocation string = resourceGroup().location

@description('Tenant id')
param tenantId string = subscription().tenantId

@description('SKU of the key vault')
@allowed([
  'standard'
  'premium'
])
param kvsku string = 'standard'

//Resources

resource kv 'Microsoft.KeyVault/vaults@2024-11-01' = {
  name:kvname
  location:kvlocation
  properties:{
    sku:{
      name:kvsku
      family:'A'
    }
    tenantId:tenantId
  }
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2024-11-01' = {
  name:secretname
  parent:kv
  properties:{
    value:storageConnectionString
  }
}

//Outputs

output KeyVaultName string = kvname



