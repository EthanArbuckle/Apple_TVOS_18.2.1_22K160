@interface CoreMLModelSecurityXPCFeatureProvider
- (CoreMLModelSecurityServiceToClientProtocol)clientProxy;
- (CoreMLModelSecurityXPCFeatureProvider)initWithRemoteProvider:(id)a3 clientProxy:(id)a4;
- (NSMutableDictionary)resolvedFeaturesDict;
- (NSNumber)uniqueKeyForProvider;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setResolvedFeaturesDict:(id)a3;
- (void)setUniqueKeyForProvider:(id)a3;
@end

@implementation CoreMLModelSecurityXPCFeatureProvider

- (CoreMLModelSecurityXPCFeatureProvider)initWithRemoteProvider:(id)a3 clientProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CoreMLModelSecurityXPCFeatureProvider;
  v9 = -[CoreMLModelSecurityXPCFeatureProvider init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueKeyForProvider, a3);
    objc_storeStrong((id *)&v10->_clientProxy, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    resolvedFeaturesDict = v10->_resolvedFeaturesDict;
    v10->_resolvedFeaturesDict = (NSMutableDictionary *)v11;
  }

  return v10;
}

- (NSSet)featureNames
{
  p_featureNames = &self->_featureNames;
  featureNames = self->_featureNames;
  if (!featureNames)
  {
    uint64_t v9 = 0LL;
    v10 = &v9;
    uint64_t v11 = 0x3032000000LL;
    v12 = sub_1000051A4;
    v13 = sub_1000051B4;
    id v14 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurityXPCFeatureProvider clientProxy](self, "clientProxy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurityXPCFeatureProvider uniqueKeyForProvider](self, "uniqueKeyForProvider"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000051BC;
    v8[3] = &unk_10000C3A8;
    v8[4] = &v9;
    [v5 clientFeatureNames:v6 withReply:v8];

    objc_storeStrong((id *)p_featureNames, (id)v10[5]);
    _Block_object_dispose(&v9, 8);

    featureNames = *p_featureNames;
  }

  return featureNames;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_1000051A4;
  v24 = sub_1000051B4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurityXPCFeatureProvider resolvedFeaturesDict](self, "resolvedFeaturesDict"));
  id v25 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  v6 = (void *)v21[5];
  if (v6)
  {
    id v7 = v6;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurityXPCFeatureProvider clientProxy](self, "clientProxy"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurityXPCFeatureProvider uniqueKeyForProvider](self, "uniqueKeyForProvider"));
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_100005440;
    v17 = &unk_10000C3D0;
    id v10 = v4;
    id v18 = v10;
    v19 = &v20;
    [v8 clientFeatureValueForName:v10 uniqueKeyForProvider:v9 withReply:&v14];

    uint64_t v11 = v21[5];
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[CoreMLModelSecurityXPCFeatureProvider resolvedFeaturesDict]( self,  "resolvedFeaturesDict",  v14,  v15,  v16,  v17));
    [v12 setObject:v11 forKeyedSubscript:v10];

    id v7 = (id)v21[5];
  }

  _Block_object_dispose(&v20, 8);

  return v7;
}

- (NSNumber)uniqueKeyForProvider
{
  return self->_uniqueKeyForProvider;
}

- (void)setUniqueKeyForProvider:(id)a3
{
}

- (CoreMLModelSecurityServiceToClientProtocol)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (NSMutableDictionary)resolvedFeaturesDict
{
  return self->_resolvedFeaturesDict;
}

- (void)setResolvedFeaturesDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end