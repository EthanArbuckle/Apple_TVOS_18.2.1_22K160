@interface SHLCloudTaskScheduler
- (SHLCloudContainerTransformer)containerTransformer;
- (SHLCloudLibraryCache)cache;
- (SHLCloudModifyZoneTransformer)zoneTransformer;
- (SHLCloudTaskScheduler)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (void)setCache:(id)a3;
- (void)setContainerTransformer:(id)a3;
- (void)setZoneTransformer:(id)a3;
@end

@implementation SHLCloudTaskScheduler

- (SHLCloudTaskScheduler)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHLCloudTaskScheduler;
  v6 = -[SHLCloudTaskScheduler init](&v11, "init");
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

- (SHLCloudModifyZoneTransformer)zoneTransformer
{
  zoneTransformer = self->_zoneTransformer;
  if (!zoneTransformer)
  {
    v4 = objc_alloc(&OBJC_CLASS___SHLCloudModifyZoneTransformer);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler configuration](self, "configuration"));
    v6 = -[SHLCloudModifyZoneTransformer initWithConfiguration:](v4, "initWithConfiguration:", v5);
    v7 = self->_zoneTransformer;
    self->_zoneTransformer = v6;

    zoneTransformer = self->_zoneTransformer;
  }

  return zoneTransformer;
}

- (void)setZoneTransformer:(id)a3
{
}

- (SHLCloudLibraryCache)cache
{
  cache = self->_cache;
  if (!cache)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler containerTransformer](self, "containerTransformer"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudBackedContainer]);

    v6 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callingProcessIdentifier]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 container]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containerIdentifier]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionIdentifier]);
    v13 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v6,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v8,  v10,  v12);
    v14 = self->_cache;
    self->_cache = v13;

    cache = self->_cache;
  }

  return cache;
}

- (void)setCache:(id)a3
{
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
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