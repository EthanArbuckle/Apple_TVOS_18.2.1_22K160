@interface Ace3RestoreInfoFirmwareCopierOS
- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4;
@end

@implementation Ace3RestoreInfoFirmwareCopierOS

- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[Ace3SoCRestoreInfoHelperOS verboseLog:]( self,  "verboseLog:",  @"%s",  "-[Ace3RestoreInfoFirmwareCopierOS firmwareKeyFromBuildIdentityDict:deviceInfo:]");
  if (v7)
  {
    [v7 objectForKeyedSubscript:@"ManifestPrefix"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 keyWithPrefix:v8];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Error: Could not find device info dictionary");
    v9 = 0LL;
  }

  return v9;
}

@end