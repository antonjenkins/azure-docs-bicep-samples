param rgLocation string = resourceGroup().location
param storages array = [
  {
    name: 'contoso'
    skuName: 'Standard_LRS'
  }
  {
    name: 'fabrikam'
    skuName: 'Premium_LRS'
  }
]

resource createStorages 'Microsoft.Storage/storageAccounts@2021-06-01' = [for storage in storages: {
  name: '${storage.name}storage${uniqueString(resourceGroup().id)}'
  location: rgLocation
  sku: {
    name: storage.skuName
  }
  kind: 'StorageV2'
}]
