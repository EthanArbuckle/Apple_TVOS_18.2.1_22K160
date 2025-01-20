@interface RMAssetPayloadReference
- (id)reportDetails;
@end

@implementation RMAssetPayloadReference

- (id)reportDetails
{
  v14[0] = @"asset";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAssetPayloadReference asset](self, "asset"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 identifier]);
  v5 = (void *)v4;
  if (v4) {
    v6 = (const __CFString *)v4;
  }
  else {
    v6 = @"(not present)";
  }
  v15[0] = v6;
  v14[1] = @"configuration";
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMAssetPayloadReference configuration](self, "configuration"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 identifier]);
  v9 = (void *)v8;
  if (v8) {
    v10 = (const __CFString *)v8;
  }
  else {
    v10 = @"(not present)";
  }
  v15[1] = v10;
  v14[2] = @"assetIdentifier";
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMAssetPayloadReference assetIdentifier](self, "assetIdentifier"));
  v15[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));

  return v12;
}

@end