
#
# Usage
# 1. Login to your subscription using Connect-AzAccount -Subscription "[Your subscription name]"
# 2. Execute powershell file as shown below:
#           .\CopyTags "Source Resource Group Name", "Target Resource Group Name"

param ($sourceResourceGroup, $targetResourceGroup)

$sourceTags = (Get-AzResourceGroup -Name $sourceResourceGroup).Tags

$targetTags = (Get-AzResourceGroup -Name $targetResourceGroup).Tags

$sourceTagsKeys = $sourceTags.Keys
$targetTagsKeys = $targetTags.Keys


$tagsToBeCopied = $sourceTagsKeys | Where-Object -FilterScript { $_ -notin $targetTagsKeys }


Foreach($tagToBeCopied in $tagsToBeCopied) { 
    $correspondingSourceTagValue = $sourceTags[$tagToBeCopied]
    $tagToBeApplied = @{$tagToBeCopied=$correspondingSourceTagValue}
    Write-Output "Adding new tags: " $tagToBeApplied
    $targetTags.Add($tagToBeCopied, $correspondingSourceTagValue)
}

Set-AzResourceGroup -Name $targetResourceGroup `
    -Tag $targetTags
