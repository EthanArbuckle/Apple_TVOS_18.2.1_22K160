@interface TUCloudCallingDevice
- (TUCloudCallingDevice)initWithIDSDevice:(id)a3;
@end

@implementation TUCloudCallingDevice

- (TUCloudCallingDevice)initWithIDSDevice:(id)a3
{
  id v4 = a3;
  v5 = -[TUCloudCallingDevice init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    -[TUCloudCallingDevice setName:](v5, "setName:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 modelIdentifier]);
    -[TUCloudCallingDevice setModelIdentifier:](v5, "setModelIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDOverride]);
    -[TUCloudCallingDevice setUniqueID:](v5, "setUniqueID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 linkedUserURIs]);
    -[TUCloudCallingDevice setLinkedUserURIs:](v5, "setLinkedUserURIs:", v9);

    -[TUCloudCallingDevice setDefaultPairedDevice:]( v5,  "setDefaultPairedDevice:",  [v4 isDefaultPairedDevice]);
    -[TUCloudCallingDevice setSupportsRestrictingSecondaryCalling:]( v5,  "setSupportsRestrictingSecondaryCalling:",  [v4 supportsRestrictingSecondaryCalling]);
  }

  return v5;
}

@end