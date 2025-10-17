module storage 'storage.bicep' = {
  name:'StorageModule'
}

@description('Storage account string')
var storageConnectionString string = storage.outputs.connectionstr

module keyvault 'keyvault.bicep' = {
  name:'KvModule'
  params:{
    storageConnectionString:storageConnectionString
  }
}

//Outputs 

output storageAccountNameFormatted string = 'Storage Account name: ${storage.outputs.storageAccountName}'
output storageAccountIdFormatted string = 'Stoage Account ID: ${storage.outputs.storageAccountId}'
output storageAccountConnectionstrFormatted string = 'Storage Account Connection String: ${storage.outputs.connectionstr}'
output keyVaultNameFormatted string = 'Key Vault name: ${keyvault.outputs.KeyVaultName}'


