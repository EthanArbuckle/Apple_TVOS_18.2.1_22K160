@interface NEAgentLSProxySession
- (void)fetchLSBundleProxyForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchLSPluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 completionHandler:(id)a7;
@end

@implementation NEAgentLSProxySession

- (void)fetchLSBundleProxyForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v8 = 0LL;
  v5 = (void (**)(id, void *, id))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NELaunchServices lookupIdentifier:plugins:]( &OBJC_CLASS___NELaunchServices,  "lookupIdentifier:plugins:",  a3,  &v8));
  id v7 = v8;
  v5[2](v5, v6, v7);
}

- (void)fetchLSPluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 completionHandler:(id)a7
{
  v17 = (void (**)(id, id))a7;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  a3,  a4,  a5,  a6));
  if (v11)
  {
    id v12 = objc_alloc(&OBJC_CLASS___NEBundleProxy);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleURL]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 machOUUIDs]);
    id v16 = [v12 initWithIdentifier:v13 url:v14 machOUUIDs:v15 name:0 appGroups:0];

    v17[2](v17, v16);
  }

  else
  {
    v17[2](v17, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end