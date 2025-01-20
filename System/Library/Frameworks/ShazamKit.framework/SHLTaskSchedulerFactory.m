@interface SHLTaskSchedulerFactory
- (SHLFetchTaskScheduler)fetchTaskScheduler;
- (SHLModifyTaskScheduler)modifyTaskScheduler;
- (SHLSyncSessionConfiguration)configuration;
- (SHLTaskSchedulerFactory)initWithConfiguration:(id)a3;
- (id)createTransaction;
- (void)setConfiguration:(id)a3;
@end

@implementation SHLTaskSchedulerFactory

- (SHLTaskSchedulerFactory)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHLTaskSchedulerFactory;
  v6 = -[SHLTaskSchedulerFactory init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (SHLModifyTaskScheduler)modifyTaskScheduler
{
  v3 = (SHLCloudModifyTaskScheduler *)objc_claimAutoreleasedReturnValue(-[SHLTaskSchedulerFactory configuration](self, "configuration"));
  id v4 = -[SHLCloudModifyTaskScheduler sessionType](v3, "sessionType");

  if (!v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___SHLCloudModifyTaskScheduler);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLTaskSchedulerFactory configuration](self, "configuration"));
    v3 = -[SHLCloudModifyTaskScheduler initWithConfiguration:](v5, "initWithConfiguration:", v6);
  }

  return (SHLModifyTaskScheduler *)v3;
}

- (SHLFetchTaskScheduler)fetchTaskScheduler
{
  v3 = (SHLCloudFetchTaskScheduler *)objc_claimAutoreleasedReturnValue(-[SHLTaskSchedulerFactory configuration](self, "configuration"));
  id v4 = -[SHLCloudFetchTaskScheduler sessionType](v3, "sessionType");

  if (!v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___SHLCloudFetchTaskScheduler);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLTaskSchedulerFactory configuration](self, "configuration"));
    v3 = -[SHLCloudFetchTaskScheduler initWithConfiguration:](v5, "initWithConfiguration:", v6);
  }

  return (SHLFetchTaskScheduler *)v3;
}

- (id)createTransaction
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLTaskSchedulerFactory configuration](self, "configuration"));
  id v5 = [v4 sessionType];

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SHLCloudContext sharedContext](&OBJC_CLASS___SHLCloudContext, "sharedContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLTaskSchedulerFactory configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerWithScope:", objc_msgSend(v7, "sessionScope")));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 containerIdentifier]);

    v10 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLTaskSchedulerFactory configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 callingProcessIdentifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHLTaskSchedulerFactory configuration](self, "configuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionIdentifier]);
    v2 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v10,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v12,  v9,  v14);
  }

  return v2;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end