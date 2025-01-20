@interface RMPredicateStatusUpdater
+ (RMPredicateStatusUpdater)sharedUpdater;
- (BOOL)_updatePredicateStatusWithFetchPredicate:(id)a3;
- (BOOL)notifyPredicateStatusDidChangeForManagementSourceIdentifier:(id)a3;
- (NSPersistentContainer)persistentContainer;
- (RMPredicateStatusUpdater)initWithPersistentContainer:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation RMPredicateStatusUpdater

+ (RMPredicateStatusUpdater)sharedUpdater
{
  if (qword_1000CF2D8 != -1) {
    dispatch_once(&qword_1000CF2D8, &stru_1000BA650);
  }
  return (RMPredicateStatusUpdater *)(id)qword_1000CF2D0;
}

- (RMPredicateStatusUpdater)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMPredicateStatusUpdater;
  v6 = -[RMPredicateStatusUpdater init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

- (BOOL)notifyPredicateStatusDidChangeForManagementSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog predicateStatusUpdater](&OBJC_CLASS___RMLog, "predicateStatusUpdater"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Posting notification for management source: %{public}@",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %@",  @"identifier",  v4));
  BOOL v7 = -[RMPredicateStatusUpdater _updatePredicateStatusWithFetchPredicate:]( self,  "_updatePredicateStatusWithFetchPredicate:",  v6);

  return v7;
}

- (BOOL)_updatePredicateStatusWithFetchPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateStatusUpdater persistentContainer](self, "persistentContainer"));
  id v7 = [v6 newBackgroundContext];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100053258;
  v21[3] = &unk_1000B90A0;
  id v8 = v4;
  id v22 = v8;
  objc_super v9 = v5;
  v23 = v9;
  [v7 performBlockAndWait:v21];
  id v10 = -[NSMutableSet count](v9, "count");
  if (v10)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog predicateStatusUpdater](&OBJC_CLASS___RMLog, "predicateStatusUpdater"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100053454((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v24 = @"RMUserInfoKeyPredicateUpdatedManagementSourceObjectIDs";
    v25 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    [v18 postNotificationName:@"RMPredicateStatusUpdaterDidChangeNotification" object:self userInfo:v19];
  }

  return v10 != 0LL;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end