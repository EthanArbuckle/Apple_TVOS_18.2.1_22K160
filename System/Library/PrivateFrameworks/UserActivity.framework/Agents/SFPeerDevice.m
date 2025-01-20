@interface SFPeerDevice
+ (id)deviceTypeForModelIdentifier:(id)a3;
+ (id)peerForSelf;
+ (id)testPeerForModel:(id)a3;
- (NSString)deviceType;
- (id)copy;
@end

@implementation SFPeerDevice

+ (id)peerForSelf
{
  v2 = objc_alloc_init(&OBJC_CLASS___SFPeerDevice);
  id v3 = sub_10000FFB0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  -[SFPeerDevice setUniqueID:](v2, "setUniqueID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13.machine,  4LL));
  -[SFPeerDevice setModelIdentifier:](v2, "setModelIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProductName"]);
  -[SFPeerDevice setProductName:](v2, "setProductName:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProductVersion"]);
  -[SFPeerDevice setProductVersion:](v2, "setProductVersion:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProductBuildVersion"]);
  -[SFPeerDevice setProductBuildVersion:](v2, "setProductBuildVersion:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13.nodename,  4LL));
  -[SFPeerDevice setName:](v2, "setName:", v11);

  -[SFPeerDevice setDeviceColor:](v2, "setDeviceColor:", &stru_1000BE738);
  -[SFPeerDevice setEnclosureColor:](v2, "setEnclosureColor:", &stru_1000BE738);

  return v2;
}

+ (id)testPeerForModel:(id)a3
{
  id v4 = a3;
  uname(&v14);
  v5 = objc_alloc_init(&OBJC_CLASS___SFPeerDevice);
  id v6 = sub_10000FFB0();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  -[SFPeerDevice setUniqueID:](v5, "setUniqueID:", v9);

  -[SFPeerDevice setModelIdentifier:](v5, "setModelIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ProductName"]);
  -[SFPeerDevice setProductName:](v5, "setProductName:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ProductVersion"]);
  -[SFPeerDevice setProductVersion:](v5, "setProductVersion:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ProductBuildVersion"]);
  -[SFPeerDevice setProductBuildVersion:](v5, "setProductBuildVersion:", v12);

  -[SFPeerDevice setName:](v5, "setName:", @"UA Test Peer");
  -[SFPeerDevice setDeviceColor:](v5, "setDeviceColor:", &stru_1000BE738);
  -[SFPeerDevice setEnclosureColor:](v5, "setEnclosureColor:", &stru_1000BE738);

  return v5;
}

- (id)copy
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SFPeerDevice);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice uniqueID](self, "uniqueID"));
  id v5 = [v4 copy];
  -[SFPeerDevice setUniqueID:](v3, "setUniqueID:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice modelIdentifier](self, "modelIdentifier"));
  id v7 = [v6 copy];
  -[SFPeerDevice setModelIdentifier:](v3, "setModelIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice productName](self, "productName"));
  id v9 = [v8 copy];
  -[SFPeerDevice setProductName:](v3, "setProductName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice productVersion](self, "productVersion"));
  id v11 = [v10 copy];
  -[SFPeerDevice setProductVersion:](v3, "setProductVersion:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice productBuildVersion](self, "productBuildVersion"));
  id v13 = [v12 copy];
  -[SFPeerDevice setProductBuildVersion:](v3, "setProductBuildVersion:", v13);

  utsname v14 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice name](self, "name"));
  id v15 = [v14 copy];
  -[SFPeerDevice setName:](v3, "setName:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice deviceColor](self, "deviceColor"));
  id v17 = [v16 copy];
  -[SFPeerDevice setDeviceColor:](v3, "setDeviceColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice enclosureColor](self, "enclosureColor"));
  id v19 = [v18 copy];
  -[SFPeerDevice setEnclosureColor:](v3, "setEnclosureColor:", v19);

  return v3;
}

- (NSString)deviceType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SFPeerDevice modelIdentifier](self, "modelIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SFPeerDevice deviceTypeForModelIdentifier:]( &OBJC_CLASS___SFPeerDevice,  "deviceTypeForModelIdentifier:",  v2));

  return (NSString *)v3;
}

+ (id)deviceTypeForModelIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UTType _typeWithDeviceModelCode:](&OBJC_CLASS___UTType, "_typeWithDeviceModelCode:", v3));
    if ([v4 conformsToType:_UTTypeAppleDevice]
      && (id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 identifier])) != 0)
    {
      id v6 = v5;
      if (-[__CFString isEqualToString:](v5, "isEqualToString:", @"com.apple.ipod"))
      {

        id v6 = @"com.apple.ipod-touch";
      }
    }

    else
    {
      id v6 = @"public.device";
    }
  }

  else
  {
    id v6 = @"public.device";
  }

  return v6;
}

@end