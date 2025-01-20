@interface SHLLibraryStore
- (SHLCloudContainerTransformer)containerTransformer;
- (SHLLibraryCache)currentCache;
- (SHLLibraryStore)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (void)setConfiguration:(id)a3;
- (void)setContainerTransformer:(id)a3;
- (void)setCurrentCache:(id)a3;
@end

@implementation SHLLibraryStore

- (SHLLibraryStore)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHLLibraryStore;
  v6 = -[SHLLibraryStore init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = -[SHLCloudContainerTransformer initWithScope:]( [SHLCloudContainerTransformer alloc],  "initWithScope:",  [v5 sessionScope]);
    containerTransformer = v7->_containerTransformer;
    v7->_containerTransformer = v8;
  }

  return v7;
}

- (SHLLibraryCache)currentCache
{
  currentCache = self->_currentCache;
  if (!currentCache)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryStore configuration](self, "configuration"));
    id v5 = [v4 sessionType];

    if (!v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryStore containerTransformer](self, "containerTransformer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudBackedContainer]);

      v10 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryStore configuration](self, "configuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 callingProcessIdentifier]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 container]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 containerIdentifier]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryStore configuration](self, "configuration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionIdentifier]);
      v6 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v10,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v12,  v14,  v16);

      return (SHLLibraryCache *)v6;
    }

    currentCache = self->_currentCache;
  }

  v6 = currentCache;
  return (SHLLibraryCache *)v6;
}

- (void)setCurrentCache:(id)a3
{
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SHLCloudContainerTransformer)containerTransformer
{
  return self->_containerTransformer;
}

- (void)setContainerTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end