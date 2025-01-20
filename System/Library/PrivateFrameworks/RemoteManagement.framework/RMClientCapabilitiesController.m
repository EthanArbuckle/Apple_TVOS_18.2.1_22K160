@interface RMClientCapabilitiesController
+ (RMClientCapabilitiesController)sharedController;
+ (void)start;
- (NSSet)supportedKeyPaths;
- (RMClientCapabilitiesController)initWithSubscribedStatusKeyPathUpdater:(id)a3;
- (RMSubscribedStatusKeyPathUpdater)subscribedStatusUpdater;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (void)_notifyChangesIfNeeded;
- (void)setSubscribedStatusUpdater:(id)a3;
@end

@implementation RMClientCapabilitiesController

+ (RMClientCapabilitiesController)sharedController
{
  if (qword_1000CEFC0 != -1) {
    dispatch_once(&qword_1000CEFC0, &stru_1000B9058);
  }
  return (RMClientCapabilitiesController *)(id)qword_1000CEFB8;
}

- (RMClientCapabilitiesController)initWithSubscribedStatusKeyPathUpdater:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMClientCapabilitiesController;
  v6 = -[RMClientCapabilitiesController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscribedStatusUpdater, a3);
  }

  return v7;
}

+ (void)start
{
  if (qword_1000CEFC8 != -1) {
    dispatch_once(&qword_1000CEFC8, &stru_1000B9078);
  }
}

- (void)_notifyChangesIfNeeded
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMPersistentController sharedController](&OBJC_CLASS___RMPersistentController, "sharedController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentContainer]);
  id v6 = [v5 newBackgroundContext];

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100010504;
  v13 = &unk_1000B90A0;
  v7 = v3;
  v14 = v7;
  id v8 = v6;
  id v15 = v8;
  [v8 performBlockAndWait:&v10];
  if (-[NSMutableDictionary count](v7, "count", v10, v11, v12, v13))
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientCapabilitiesController subscribedStatusUpdater](self, "subscribedStatusUpdater"));
    [v9 notifyStatusDidChangeForKeyPathsByManagementSourceObjectID:v7];
  }

  else
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog clientCapabilitiesController](&OBJC_CLASS___RMLog, "clientCapabilitiesController"));
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
      sub_100010A0C((os_log_t)v9);
    }
  }
}

- (NSSet)supportedKeyPaths
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", RMModelStatusItemManagementClientCapabilities);
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5
{
  id v6 = a4;
  uint64_t v7 = RMModelStatusItemManagementClientCapabilities;
  if ([a3 containsObject:RMModelStatusItemManagementClientCapabilities])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RMCapabilities capabilitiesForEnrollmentType:scope:protocolType:]( RMCapabilities,  "capabilitiesForEnrollmentType:scope:protocolType:",  [v6 type],  +[RMBundle managementScope](RMBundle, "managementScope"),  objc_msgSend(v6, "protocolType")));
    uint64_t v13 = v7;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 status]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serializeWithType:1]);
    v14 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  }

  else
  {
    uint64_t v11 = &__NSDictionary0__struct;
  }

  return v11;
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  return -[RMClientCapabilitiesController queryForStatusWithKeyPaths:onBehalfOfManagementChannel:error:]( self,  "queryForStatusWithKeyPaths:onBehalfOfManagementChannel:error:",  a3,  a5,  a6);
}

- (RMSubscribedStatusKeyPathUpdater)subscribedStatusUpdater
{
  return self->_subscribedStatusUpdater;
}

- (void)setSubscribedStatusUpdater:(id)a3
{
}

- (void).cxx_destruct
{
}

@end