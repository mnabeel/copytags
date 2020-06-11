# CopyTags

## An easier way to copy tags from one resource group to another resource group


The CopyTags.ps1 allows you to copy tags between resource groups. The source resource group is the resource group that we want the tags to be copied from and target resource group is the resource group that we intend the tag to be copied to.

### Features

1. The script does not overwrite any tags that are already present in the target resource group.
2. The script will only copy those tags that are present in the source resource group and not present in the target resource group.
3. If the same tag (with same tag name) exists in both source and target resources groups, then the script will not overwrite the existing tag in the target resource group. This gives great flexibility of using this script without the concern of overwriting existing valuable tag information.

### Usage

This script requires two parameters. These are sourceResourceGroup and targetResourceGroup.

Example:

```powershell
.\CopyTags "[Source Resource Group Name]", "[Target Resource Group Name]"
```

### Steps

1. Login to your subscription using powershell commands.
    Example: Connect-AzAccount -Subscription "[Your subscription name]"
2. Run the script as shown in the above example.
