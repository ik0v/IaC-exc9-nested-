# $tenantid = "02feabb9-444e-4f66-9c13-6a8f04b75c2f" 
# # $subscribtionid = "efc1e7b1-5729-4eea-b33e-12cc6b1c0183"
# $subscribtionid = "e057be74-c85b-46f3-8f29-2e415b78a00b"
# $credentials = Get-Credential
# Connect-AzAccount -Credential $credentials -TenantId $tenantid -Environment AzureCloud -SubscriptionId $subscribtionid


$rg = "arm-demo-rg-ik0v-pub003"
$location = "West Europe"
New-AzResourceGroup -Name $rg -Location $location -Force

$storageAccount = New-AzStorageAccount -ResourceGroupName $rg `
  -Name "ik0vstorgpub004" `
  -SkuName Standard_LRS `
  -Location $location 

$ctx = $storageAccount.Context

$containerName = "ikovpublicblob111"
New-AzStorageContainer -Name $containerName -Context $ctx -Permission blob

Set-AzStorageBlobContent -File "C:\code\arm-nested\arm-public.json" `
-Container $containerName `
  -Blob "arm-public.json" `
  -Context $ctx `
  -StandardBlobTier Hot