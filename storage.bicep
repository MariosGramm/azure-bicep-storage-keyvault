//Parameters

@description('Storage account SKU')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Premium_LRS'
])
param accountsku string = 'Standard_LRS'

@description('Storage account type')
@allowed([
  'Blob_Storage'
  'StorageV2'
  'FileStorage'
])
param accounttype string = 'StorageV2'

@description('Storage account location')
param accountlocation string = resourceGroup().location

@description('Storage account name')
param accountname string = 'storage${uniqueString(resourceGroup().id)}'

//Resource 

resource storageacct 'Microsoft.Storage/storageAccounts@2025-01-01'= {
  name:accountname
  location:accountlocation
  sku:{
    name:accountsku
  }
  kind:accounttype
  properties:{}
} 

//Outputs

output storageAccountName string = accountname
output storageAccountId string = storageacct.id
output connectionstr string = 'DefaultEndpointsProtocol=https;AccountName=${storageacct.name};AccountKey=${listKeys(storageacct.id,'2025-01-01').keys[0].value};EndpointSuffix=core.windows.net'









