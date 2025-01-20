@interface MSDDemoUnitServer
- (MSDDemoUnitServer)init;
- (NSString)hmacKey;
- (id)taskInfoFromCommandRequest:(id)a3;
- (void)findMyHub:(id)a3;
- (void)setHmacKey:(id)a3;
@end

@implementation MSDDemoUnitServer

- (MSDDemoUnitServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDDemoUnitServer;
  v2 = -[MSDDemoUnitServer init](&v6, "init");
  if (v2)
  {
    v3 = -[MSDSession initWithCellularAccess:](objc_alloc(&OBJC_CLASS___MSDFMHSession), "initWithCellularAccess:", 1LL);
    -[MSDServer setSession:](v2, "setSession:", v3);

    -[MSDDemoUnitServer setHmacKey:]( v2,  "setHmacKey:",  @"5ff0cc558c0b18b1563e6f53591cf2ee7d18f0cc66c1b76696885f10b42b9b2df1");
    v4 = v2;
  }

  return v2;
}

- (void)findMyHub:(id)a3
{
  id v4 = a3;
  [v4 logicSync];
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 getUrl]);
  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  v5,  1LL,  3LL);
}

- (id)taskInfoFromCommandRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___MSDFMHSessionTaskInfo);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 server]);
  -[MSDHubSessionTaskInfo setServer:](v5, "setServer:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 port]);
  -[MSDHubSessionTaskInfo setPort:](v5, "setPort:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUnitServer hmacKey](self, "hmacKey"));
  -[MSDHubSessionTaskInfo setHmacKey:](v5, "setHmacKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceUDID]);
  -[MSDHubSessionTaskInfo setDeviceUDID:](v5, "setDeviceUDID:", v9);

  -[MSDFMHSessionTaskInfo setUseBAAAuthentication:]( v5,  "setUseBAAAuthentication:",  [v4 useBAAAuthentication]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 urlOverride]);

  -[MSDFMHSessionTaskInfo setFmhURLOverride:](v5, "setFmhURLOverride:", v10);
  return v5;
}

- (NSString)hmacKey
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHmacKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end