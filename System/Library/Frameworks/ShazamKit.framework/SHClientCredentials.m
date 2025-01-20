@interface SHClientCredentials
- (BOOL)canEnableSpectralOutput;
- (BOOL)isEntitledForSource:(int64_t)a3;
- (SHAttribution)attribution;
- (SHClientCredentials)initWithConnection:(id)a3;
- (SHClientCredentials)initWithEntitlements:(id)a3 attribution:(id)a4;
- (SHEntitlements)entitlements;
- (int64_t)audioTapClient;
- (int64_t)clientType;
@end

@implementation SHClientCredentials

- (SHClientCredentials)initWithConnection:(id)a3
{
  id v4 = a3;
  v5 = -[SHAttribution initWithConnection:](objc_alloc(&OBJC_CLASS___SHAttribution), "initWithConnection:", v4);
  v6 = -[SHEntitlements initWithConnection:](objc_alloc(&OBJC_CLASS___SHEntitlements), "initWithConnection:", v4);

  v7 = -[SHClientCredentials initWithEntitlements:attribution:](self, "initWithEntitlements:attribution:", v6, v5);
  return v7;
}

- (SHClientCredentials)initWithEntitlements:(id)a3 attribution:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHClientCredentials;
  v9 = -[SHClientCredentials init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attribution, a4);
    objc_storeStrong((id *)&v10->_entitlements, a3);
  }

  return v10;
}

- (int64_t)clientType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHClientCredentials entitlements](self, "entitlements"));
  else {
    int64_t v3 = 2LL;
  }

  return v3;
}

- (BOOL)isEntitledForSource:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHClientCredentials entitlements](self, "entitlements", a3));
  unsigned __int8 v4 = [v3 isEntitledForMicrophone];

  return v4;
}

- (int64_t)audioTapClient
{
  v9[0] = @"com.apple.assistant_service";
  v9[1] = @"com.apple.WorkflowKit.BackgroundShortcutRunner";
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHClientCredentials attribution](self, "attribution"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  unsigned int v6 = [v3 containsObject:v5];

  if (v6) {
    int64_t v7 = 2LL;
  }
  else {
    int64_t v7 = 1LL;
  }

  return v7;
}

- (BOOL)canEnableSpectralOutput
{
  return (id)-[SHClientCredentials clientType](self, "clientType") == (id)1;
}

- (SHAttribution)attribution
{
  return self->_attribution;
}

- (SHEntitlements)entitlements
{
  return self->_entitlements;
}

- (void).cxx_destruct
{
}

@end