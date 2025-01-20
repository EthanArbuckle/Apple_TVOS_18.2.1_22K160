@interface SHLCloudFetchTaskScheduler
- (BOOL)cloudBackedZones:(id)a3 containsZone:(id)a4;
- (NSArray)preconditions;
- (SHLCloudFetchTaskScheduler)initWithConfiguration:(id)a3;
- (SHLCloudFetchTaskTransformer)fetchTaskTransformer;
- (SHLCloudSubscriptionTransformer)subscriptionTaskTransformer;
- (void)scheduleFetchTask:(id)a3;
- (void)setFetchTaskTransformer:(id)a3;
- (void)setSubscriptionTaskTransformer:(id)a3;
@end

@implementation SHLCloudFetchTaskScheduler

- (SHLCloudFetchTaskScheduler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHLCloudFetchTaskScheduler;
  v5 = -[SHLCloudTaskScheduler initWithConfiguration:](&v11, "initWithConfiguration:", v4);
  if (v5)
  {
    v6 = -[SHLCloudFetchTaskTransformer initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SHLCloudFetchTaskTransformer),  "initWithConfiguration:",  v4);
    fetchTaskTransformer = v5->_fetchTaskTransformer;
    v5->_fetchTaskTransformer = v6;

    v8 = -[SHLCloudSubscriptionTransformer initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SHLCloudSubscriptionTransformer),  "initWithConfiguration:",  v4);
    subscriptionTaskTransformer = v5->_subscriptionTaskTransformer;
    v5->_subscriptionTaskTransformer = v8;
  }

  return v5;
}

- (NSArray)preconditions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = objc_alloc(&OBJC_CLASS___SHLCloudAccountStatusPrecondition);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler containerTransformer](self, "containerTransformer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudBackedContainer]);
  v7 = -[SHLCloudAccountStatusPrecondition initWithContainer:](v4, "initWithContainer:", v6);

  [v3 addObject:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler configuration](self, "configuration"));
  id v9 = [v8 sessionScope];

  if (v9 == (id)1)
  {
    v10 = objc_alloc(&OBJC_CLASS___SHLCloudEncryptionPrecondition);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler containerTransformer](self, "containerTransformer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudBackedContainer]);
    v13 = -[SHLCloudEncryptionPrecondition initWithContainer:](v10, "initWithContainer:", v12);

    [v3 addObject:v13];
  }

  id v14 = [v3 copy];

  return (NSArray *)v14;
}

- (void)scheduleFetchTask:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler containerTransformer](self, "containerTransformer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudBackedContainer]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskScheduler fetchTaskTransformer](self, "fetchTaskTransformer"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000268E0;
  v26[3] = &unk_10006D750;
  v26[4] = self;
  id v8 = v4;
  id v27 = v8;
  id v9 = v6;
  id v28 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v7 cloudBackedDatabaseChangesOperationFromFetchTask:v8 container:v9 completion:v26]);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler cache](self, "cache"));
  id v25 = 0LL;
  unsigned __int8 v12 = [v11 storeTask:v8 ofType:0 error:&v25];
  id v13 = v25;

  if ((v12 & 1) == 0)
  {
    id v14 = sub_10002D0D8();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to store the inflight task in the fetch task scheduler with error %{public}@",  buf,  0xCu);
    }
  }

  id v16 = sub_10002D0D8();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = (objc_class *)objc_opt_class(v8, v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    *(_DWORD *)buf = 138543618;
    id v30 = v21;
    __int16 v31 = 2112;
    v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "<task: %{public}@ %@> is scheduled", buf, 0x16u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SHLOperationQueue defaultQueue](&OBJC_CLASS___SHLOperationQueue, "defaultQueue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 operation]);
  [v23 addOperation:v24 waitUntilFinished:1];
}

- (BOOL)cloudBackedZones:(id)a3 containsZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) zone]);
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
        unsigned __int8 v15 = [v12 isEqual:v14];

        if ((v15 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (SHLCloudFetchTaskTransformer)fetchTaskTransformer
{
  return self->_fetchTaskTransformer;
}

- (void)setFetchTaskTransformer:(id)a3
{
}

- (SHLCloudSubscriptionTransformer)subscriptionTaskTransformer
{
  return self->_subscriptionTaskTransformer;
}

- (void)setSubscriptionTaskTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end