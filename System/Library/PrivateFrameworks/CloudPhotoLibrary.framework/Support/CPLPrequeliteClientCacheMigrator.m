@interface CPLPrequeliteClientCacheMigrator
+ (id)platformImplementationProtocol;
- (CPLEngineStore)engineStore;
- (CPLPlatformObject)platformObject;
- (CPLPrequeliteClientCacheMigrator)initWithStore:(id)a3;
- (CPLPrequeliteStore)store;
- (NSString)description;
- (NSString)name;
@end

@implementation CPLPrequeliteClientCacheMigrator

- (CPLPrequeliteClientCacheMigrator)initWithStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLPrequeliteClientCacheMigrator;
  v6 = -[CPLPrequeliteClientCacheMigrator init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_store, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPlatform currentPlatform](&OBJC_CLASS___CPLPlatform, "currentPlatform"));
    v9 = (CPLPlatformObject *)[v8 newPlatformImplementationForObject:v7];
    platformObject = v7->_platformObject;
    v7->_platformObject = v9;

    if (!v7->_platformObject) {
      sub_10019C188((uint64_t)v7, (uint64_t)a2);
    }
  }

  return v7;
}

+ (id)platformImplementationProtocol
{
  return &OBJC_PROTOCOL___CPLEngineClientCacheImplementation;
}

- (CPLEngineStore)engineStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained abstractObject]);

  return (CPLEngineStore *)v3;
}

- (NSString)name
{
  return (NSString *)@"clientCache";
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteClientCacheMigrator name](self, "name"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@ %@]", v3, v4));

  return (NSString *)v5;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (CPLPrequeliteStore)store
{
  return (CPLPrequeliteStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (void).cxx_destruct
{
}

@end