@interface MAAsset
- (id)description;
@end

@implementation MAAsset

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset assetType](self, "assetType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset assetId](self, "assetId"));
  id v5 = -[MAAsset state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset attributes](self, "attributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset getLocalUrl](self, "getLocalUrl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset getLocalFileUrl](self, "getLocalFileUrl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset assetServerUrl](self, "assetServerUrl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MobileAsset type %@, ID %@, state %ld, attributes %@, local URL %@, local file URL %@, asset server URL %@",  v3,  v4,  v5,  v6,  v7,  v8,  v9));

  return v10;
}

@end