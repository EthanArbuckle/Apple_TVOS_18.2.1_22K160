@interface CKKSKeychainViewState
- (BOOL)ckksManagedView;
- (BOOL)isEqual:(id)a3;
- (BOOL)priorityView;
- (BOOL)readyNotificationArmed;
- (CKKSKeychainViewState)initWithZoneID:(id)a3 forContextID:(id)a4 ckksManagedView:(BOOL)a5 priorityView:(BOOL)a6 notifyViewChangedScheduler:(id)a7 notifyViewReadyScheduler:(id)a8;
- (CKKSNearFutureScheduler)notifyViewChangedScheduler;
- (CKKSNearFutureScheduler)notifyViewReadyScheduler;
- (CKRecordZoneID)zoneID;
- (NSDictionary)keyHierarchyConditions;
- (NSMutableDictionary)mutableStateConditions;
- (NSOperationQueue)operationQueue;
- (NSSet)allowableStates;
- (NSString)contextID;
- (NSString)zoneName;
- (OS_dispatch_queue)queue;
- (OctagonStateString)viewKeyHierarchyState;
- (SecLaunchSequence)launch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)armReadyNotification;
- (void)launchComplete;
- (void)setAllowableStates:(id)a3;
- (void)setLaunch:(id)a3;
- (void)setMutableStateConditions:(id)a3;
- (void)setNotifyViewChangedScheduler:(id)a3;
- (void)setNotifyViewReadyScheduler:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReadyNotificationArmed:(BOOL)a3;
- (void)setViewKeyHierarchyState:(id)a3;
@end

@implementation CKKSKeychainViewState

- (CKKSKeychainViewState)initWithZoneID:(id)a3 forContextID:(id)a4 ckksManagedView:(BOOL)a5 priorityView:(BOOL)a6 notifyViewChangedScheduler:(id)a7 notifyViewReadyScheduler:(id)a8
{
  id v15 = a3;
  id v34 = a4;
  id v16 = a7;
  id v17 = a8;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CKKSKeychainViewState;
  v18 = -[CKKSKeychainViewState init](&v37, "init");
  if (v18)
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName", v34));
    zoneName = v18->_zoneName;
    v18->_zoneName = (NSString *)v19;

    objc_storeStrong((id *)&v18->_zoneID, a3);
    objc_storeStrong((id *)&v18->_contextID, a4);
    v18->_priorityView = a6;
    v18->_ckksManagedView = a5;
    dispatch_queue_t v21 = dispatch_queue_create("key-state", 0LL);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = v23;

    objc_storeStrong((id *)&v18->_notifyViewChangedScheduler, a7);
    objc_storeStrong((id *)&v18->_notifyViewReadyScheduler, a8);
    if (qword_1002DE940 != -1) {
      dispatch_once(&qword_1002DE940, &stru_1002849A8);
    }
    objc_storeStrong((id *)&v18->_allowableStates, (id)qword_1002DE938);
    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mutableStateConditions = v18->_mutableStateConditions;
    v18->_mutableStateConditions = v25;

    allowableStates = v18->_allowableStates;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10015F630;
    v35[3] = &unk_100290E30;
    v28 = v18;
    v36 = v28;
    -[NSSet enumerateObjectsUsingBlock:](allowableStates, "enumerateObjectsUsingBlock:", v35);
    -[CKKSKeychainViewState setViewKeyHierarchyState:](v28, "setViewKeyHierarchyState:", @"initializing");
    v29 = -[SecLaunchSequence initWithRocketName:]( objc_alloc(&OBJC_CLASS___SecLaunchSequence),  "initWithRocketName:",  @"com.apple.security.ckks.launch");
    launch = v28->_launch;
    v28->_launch = v29;

    v31 = v28->_launch;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
    -[SecLaunchSequence addAttribute:value:](v31, "addAttribute:value:", @"view", v32);

    v28->_readyNotificationArmed = 0;
  }

  return v18;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState contextID](self, "contextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState zoneName](self, "zoneName"));
  if (-[CKKSKeychainViewState ckksManagedView](self, "ckksManagedView")) {
    v5 = @"ckks";
  }
  else {
    v5 = @"ext";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState viewKeyHierarchyState](self, "viewKeyHierarchyState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSKeychainViewState(%@): %@(%@), %@>",  v3,  v4,  v5,  v6));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___CKKSKeychainViewState);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState zoneID](self, "zoneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState contextID](self, "contextID"));
  BOOL v7 = -[CKKSKeychainViewState ckksManagedView](self, "ckksManagedView");
  BOOL v8 = -[CKKSKeychainViewState priorityView](self, "priorityView");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState notifyViewReadyScheduler](self, "notifyViewReadyScheduler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState notifyViewReadyScheduler](self, "notifyViewReadyScheduler"));
  v11 = -[CKKSKeychainViewState initWithZoneID:forContextID:ckksManagedView:priorityView:notifyViewChangedScheduler:notifyViewReadyScheduler:]( v4,  "initWithZoneID:forContextID:ckksManagedView:priorityView:notifyViewChangedScheduler:notifyViewReadyScheduler:",  v5,  v6,  v7,  v8,  v9,  v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState viewKeyHierarchyState](self, "viewKeyHierarchyState"));
  -[CKKSKeychainViewState setViewKeyHierarchyState:](v11, "setViewKeyHierarchyState:", v12);

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState zoneName](self, "zoneName"));
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState contextID](self, "contextID"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKKSKeychainViewState);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState zoneName](self, "zoneName"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
    if ([v7 isEqualToString:v8]
      && (unsigned int v9 = -[CKKSKeychainViewState ckksManagedView](self, "ckksManagedView"),
          v9 == [v6 ckksManagedView]))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState viewKeyHierarchyState](self, "viewKeyHierarchyState"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 viewKeyHierarchyState]);
      if ([v11 isEqualToString:v12])
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState contextID](self, "contextID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID]);
        unsigned __int8 v10 = [v13 isEqualToString:v14];
      }

      else
      {
        unsigned __int8 v10 = 0;
      }
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (OctagonStateString)viewKeyHierarchyState
{
  return self->_viewKeyHierarchyState;
}

- (void)setViewKeyHierarchyState:(id)a3
{
  id v5 = a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015F3B8;
  block[3] = &unk_100291850;
  id v9 = v5;
  unsigned __int8 v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_sync(v6, block);
}

- (NSDictionary)keyHierarchyConditions
{
  uint64_t v7 = 0LL;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned __int8 v10 = sub_10015F350;
  SEL v11 = sub_10015F360;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10015F368;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)launchComplete
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState launch](self, "launch"));
  [v3 launch];

  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015F2EC;
  block[3] = &unk_1002927F0;
  void block[4] = self;
  dispatch_sync(v4, block);
}

- (void)armReadyNotification
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015F2E0;
  block[3] = &unk_1002927F0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (SecLaunchSequence)launch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLaunch:(id)a3
{
}

- (BOOL)ckksManagedView
{
  return self->_ckksManagedView;
}

- (BOOL)priorityView
{
  return self->_priorityView;
}

- (CKKSNearFutureScheduler)notifyViewChangedScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setNotifyViewChangedScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)notifyViewReadyScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setNotifyViewReadyScheduler:(id)a3
{
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAllowableStates:(id)a3
{
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setMutableStateConditions:(id)a3
{
}

- (BOOL)readyNotificationArmed
{
  return self->_readyNotificationArmed;
}

- (void)setReadyNotificationArmed:(BOOL)a3
{
  self->_readyNotificationArmed = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end