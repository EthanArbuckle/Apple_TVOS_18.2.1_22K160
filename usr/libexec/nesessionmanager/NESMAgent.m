@interface NESMAgent
- (BOOL)isLocal;
- (BOOL)isPerUser;
- (NESMAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation NESMAgent

- (NESMAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NESMAgent;
  return -[NEAgent initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:]( &v8,  "initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:",  a3,  a4,  a5,  a6,  a7);
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000B4B4();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_100004F44;
  v16 = &unk_1000BD478;
  v17 = self;
  id v18 = v4;
  id v7 = v4;
  objc_super v8 = self;
  v9 = &v13;
  if (v6)
  {
    if (v8) {
      int64_t pluginClass = v8->super._pluginClass;
    }
    else {
      int64_t pluginClass = 0LL;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NELaunchServices pluginClassToExtensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginClassToExtensionPoint:",  pluginClass,  v13,  v14));
    if (v11)
    {
      v12 = (dispatch_queue_s *)v6[1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000C408;
      block[3] = &unk_1000BD5B0;
      block[4] = v6;
      v20 = v8;
      id v21 = v11;
      v22 = v9;
      dispatch_async(v12, block);
    }

    else
    {
      v15((uint64_t)v9, 0, 0LL, 0LL);
    }
  }
}

- (BOOL)isPerUser
{
  return 0;
}

- (BOOL)isLocal
{
  return 1;
}

- (void).cxx_destruct
{
}

@end