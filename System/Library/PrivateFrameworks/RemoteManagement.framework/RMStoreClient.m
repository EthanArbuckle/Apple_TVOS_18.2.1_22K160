@interface RMStoreClient
- (NSString)storeIdentifier;
- (RMActivationEngine)activationEngine;
- (RMStatusEngine)statusEngine;
- (RMStoreClient)initWithActivationEngine:(id)a3 statusEngine:(id)a4 storeIdentifier:(id)a5;
- (RMStoreClient)initWithManagementSourceObjectID:(id)a3 storeIdentifier:(id)a4 statusQuerier:(id)a5 persistentContainer:(id)a6;
- (void)_sendStatusData:(id)a3;
- (void)_sendStatusOnlyIfNeeded:(BOOL)a3;
- (void)create;
- (void)remove;
- (void)setActivationEngine:(id)a3;
- (void)setStatusEngine:(id)a3;
- (void)start;
- (void)statusEngineHasUnacknowledgedSubscription:(id)a3;
- (void)syncWithCompletionHandler:(id)a3;
@end

@implementation RMStoreClient

- (RMStoreClient)initWithManagementSourceObjectID:(id)a3 storeIdentifier:(id)a4 statusQuerier:(id)a5 persistentContainer:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v11 newBackgroundContext];
  [v14 setAutomaticallyMergesChangesFromParent:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"conduit",  v10));
  [v14 setTransactionAuthor:v15];

  id v16 = v10;
  id v17 = [v11 newBackgroundContext];
  [v17 setAutomaticallyMergesChangesFromParent:1];
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"engine",  v16));

  [v17 setTransactionAuthor:v18];
  v19 = -[RMActivationEngine initWithManagementSourceObjectID:context:]( objc_alloc(&OBJC_CLASS___RMActivationEngine),  "initWithManagementSourceObjectID:context:",  v13,  v17);
  v20 = -[RMStatusEngine initWithManagementSourceObjectID:statusQuerier:inContext:]( objc_alloc(&OBJC_CLASS___RMStatusEngine),  "initWithManagementSourceObjectID:statusQuerier:inContext:",  v13,  v12,  v14);

  v21 = -[RMStoreClient initWithActivationEngine:statusEngine:storeIdentifier:]( self,  "initWithActivationEngine:statusEngine:storeIdentifier:",  v19,  v20,  v16);
  return v21;
}

- (RMStoreClient)initWithActivationEngine:(id)a3 statusEngine:(id)a4 storeIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RMStoreClient;
  id v12 = -[RMStoreClient init](&v15, "init");
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activationEngine, a3);
    objc_storeStrong((id *)&v13->_statusEngine, a4);
    objc_storeStrong((id *)&v13->_storeIdentifier, a5);
  }

  return v13;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreClient statusEngine](self, "statusEngine"));
  [v3 setDelegate:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreClient statusEngine](self, "statusEngine"));
  [v4 start];

  -[RMStoreClient _sendStatusOnlyIfNeeded:](self, "_sendStatusOnlyIfNeeded:", 1LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RMStoreClient activationEngine](self, "activationEngine"));
  [v5 syncWithCompletionHandler:&stru_1000BAAB0];
}

- (void)create
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreClient statusEngine](self, "statusEngine"));
  v9[0] = RMModelStatusItemManagementClientCapabilities;
  v9[1] = RMModelStatusItemManagementDeclarations;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
  [v3 implicitlySubscribeToStatusKeyPaths:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreClient statusEngine](self, "statusEngine"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 queryForUnacknowledgedStatusSubscriptions]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreClient statusEngine](self, "statusEngine"));
  [v8 acknowledgeStatusSubscriptions:v7];
}

- (void)remove
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RMStoreClient activationEngine](self, "activationEngine"));
  [v2 removeReturningError:0];
}

- (void)syncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreClient activationEngine](self, "activationEngine"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100065DDC;
  v7[3] = &unk_1000BAAD8;
  id v8 = v4;
  id v6 = v4;
  [v5 syncWithCompletionHandler:v7];
}

- (void)statusEngineHasUnacknowledgedSubscription:(id)a3
{
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeClient](&OBJC_CLASS___RMLog, "storeClient", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10006616C(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  -[RMStoreClient _sendStatusOnlyIfNeeded:](self, "_sendStatusOnlyIfNeeded:", 1LL);
}

- (void)_sendStatusOnlyIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreClient statusEngine](self, "statusEngine"));
  id v6 = +[RMStatusReporter newStatusReporterWithStatusEngine:onlyIfNeeded:]( &OBJC_CLASS___RMStatusReporter,  "newStatusReporterWithStatusEngine:onlyIfNeeded:",  v5,  v3);

  id v17 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 statusReportReturningError:&v17]);
  id v8 = v17;
  if (v8)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeClient](&OBJC_CLASS___RMLog, "storeClient"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000661D4();
    }
  }

  else
  {
    if (v7)
    {
      -[RMStoreClient _sendStatusData:](self, "_sendStatusData:", v7);
      [v6 acknowledgeStatusSent];
      goto LABEL_7;
    }

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeClient](&OBJC_CLASS___RMLog, "storeClient"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000661A0(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

LABEL_7:
}

- (void)_sendStatusData:(id)a3
{
  id v3 = a3;
  id v4 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);

  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeClient](&OBJC_CLASS___RMLog, "storeClient"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100066234();
  }
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (RMActivationEngine)activationEngine
{
  return self->_activationEngine;
}

- (void)setActivationEngine:(id)a3
{
}

- (RMStatusEngine)statusEngine
{
  return self->_statusEngine;
}

- (void)setStatusEngine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end