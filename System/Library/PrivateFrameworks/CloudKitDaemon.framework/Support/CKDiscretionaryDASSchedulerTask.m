@interface CKDiscretionaryDASSchedulerTask
+ (unint64_t)_priorityForState:(unint64_t)a3;
- (BOOL)requiresPastBuddy;
- (BOOL)rescheduling;
- (BOOL)running;
- (CKDiscretionaryDASSchedulerTask)initWithOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11;
- (CKDiscretionaryOptions)options;
- (NSDate)startAfter;
- (NSDate)startBefore;
- (NSString)bundleID;
- (NSString)group;
- (NSString)operationID;
- (OS_dispatch_queue)queue;
- (OS_os_activity)osActivity;
- (_DASActivity)dasActivity;
- (id)_activityName;
- (id)_nwEndpointDefault;
- (id)_nwParametersWithAllowsCellularAccess:(BOOL)a3 allowsExpensiveNetworkAccess:(BOOL)a4;
- (id)startHandler;
- (id)suspendHandler;
- (void)_schedule;
- (void)cancel;
- (void)finish;
- (void)setBundleID:(id)a3;
- (void)setDasActivity:(id)a3;
- (void)setGroup:(id)a3;
- (void)setOperationID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOsActivity:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequiresPastBuddy:(BOOL)a3;
- (void)setRescheduling:(BOOL)a3;
- (void)setRunning:(BOOL)a3;
- (void)setStartAfter:(id)a3;
- (void)setStartBefore:(id)a3;
- (void)setStartHandler:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSuspendHandler:(id)a3;
@end

@implementation CKDiscretionaryDASSchedulerTask

- (CKDiscretionaryDASSchedulerTask)initWithOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11
{
  id v37 = a3;
  id v36 = a4;
  id v35 = a5;
  id v39 = a7;
  id v34 = a9;
  id v38 = a10;
  id v17 = a11;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___CKDiscretionaryDASSchedulerTask;
  v18 = -[CKDiscretionarySchedulerTask init](&v41, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_operationID, a3);
    objc_storeStrong((id *)&v19->_group, a4);
    objc_storeStrong((id *)&v19->_queue, a9);
    objc_storeStrong((id *)&v19->_bundleID, a5);
    v19->_requiresPastBuddy = a6;
    objc_storeStrong((id *)&v19->_options, a7);
    v40.receiver = v19;
    v40.super_class = (Class)&OBJC_CLASS___CKDiscretionaryDASSchedulerTask;
    -[CKDiscretionarySchedulerTask setState:](&v40, "setState:", a8);
    id v20 = [v38 copy];
    id startHandler = v19->_startHandler;
    v19->_id startHandler = v20;

    id v22 = [v17 copy];
    id suspendHandler = v19->_suspendHandler;
    v19->_id suspendHandler = v22;

    v24 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    startAfter = v19->_startAfter;
    v19->_startAfter = v24;
    v26 = v24;

    [v39 timeoutIntervalForResource];
    v27 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v26, "dateByAddingTimeInterval:"));
    startBefore = v19->_startBefore;
    v19->_startBefore = v27;
    v29 = v27;

    os_activity_t v30 = _os_activity_create( (void *)&_mh_execute_header,  "internal/das-scheduler-task",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v19->_osActivity;
    v19->_osActivity = v30;
  }

  return v19;
}

- (id)_activityName
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ckdiscretionaryd.%@.%@",  self->_bundleID,  self->_operationID);
}

+ (unint64_t)_priorityForState:(unint64_t)a3
{
  if (a3 >= 3)
  {
    if (a3 == 3)
    {
      v3 = (unint64_t *)&_DASSchedulingPriorityBackground;
    }

    else
    {
      if (a3 != 4) {
        return result;
      }
      v3 = (unint64_t *)&_DASSchedulingPriorityMaintenance;
    }
  }

  else
  {
    v3 = (unint64_t *)&_DASSchedulingPriorityUserInitiated;
  }

  return *v3;
}

- (void)setState:(unint64_t)a3
{
  v5 = (os_activity_s *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask osActivity](self, "osActivity"));
  os_activity_scope_enter(v5, &state);

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CKDiscretionaryDASSchedulerTask;
  if (-[CKDiscretionarySchedulerTask state](&v8, "state") != a3)
  {
    if (-[CKDiscretionaryDASSchedulerTask running](self, "running"))
    {
      if (a3 == 3) {
        -[CKDiscretionaryDASSchedulerTask cancel](self, "cancel");
      }
    }

    else
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___CKDiscretionaryDASSchedulerTask;
      -[CKDiscretionarySchedulerTask setState:](&v7, "setState:", a3);
      -[CKDiscretionaryDASSchedulerTask setRescheduling:](self, "setRescheduling:", 1LL);
      -[CKDiscretionaryDASSchedulerTask _schedule](self, "_schedule");
    }
  }

  os_activity_scope_leave(&state);
}

- (void)cancel
{
  v3 = (os_activity_s *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask osActivity](self, "osActivity"));
  os_activity_scope_enter(v3, &v8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask dasActivity](self, "dasActivity"));
  if (v4)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask queue](self, "queue"));
    dispatch_assert_queue_V2(v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](&OBJC_CLASS____DASScheduler, "sharedScheduler"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask dasActivity](self, "dasActivity"));
    [v6 activityCanceled:v7];

    -[CKDiscretionaryDASSchedulerTask setDasActivity:](self, "setDasActivity:", 0LL);
  }

  os_activity_scope_leave(&v8);
}

- (void)finish
{
  v3 = (os_activity_s *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask osActivity](self, "osActivity"));
  os_activity_scope_enter(v3, &v8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask dasActivity](self, "dasActivity"));
  if (v4)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask queue](self, "queue"));
    dispatch_assert_queue_V2(v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](&OBJC_CLASS____DASScheduler, "sharedScheduler"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask dasActivity](self, "dasActivity"));
    [v6 activityCompleted:v7];

    -[CKDiscretionaryDASSchedulerTask setDasActivity:](self, "setDasActivity:", 0LL);
  }

  os_activity_scope_leave(&v8);
}

- (id)_nwEndpointDefault
{
  nw_endpoint_t host = nw_endpoint_create_host("www.apple.com", "443");
  nw_endpoint_t v3 = host;
  if (host) {
    v4 = host;
  }

  return v3;
}

- (id)_nwParametersWithAllowsCellularAccess:(BOOL)a3 allowsExpensiveNetworkAccess:(BOOL)a4
{
  v6 = nw_parameters_create();
  objc_super v7 = v6;
  if (v6)
  {
    if (!a3) {
      nw_parameters_prohibit_interface_type(v6, nw_interface_type_cellular);
    }
    if (!a4) {
      nw_parameters_set_prohibit_expensive(v7, 1);
    }
    os_activity_scope_state_s v8 = v7;
  }

  return v7;
}

- (void)_schedule
{
  nw_endpoint_t v3 = (os_activity_s *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask osActivity](self, "osActivity"));
  os_activity_scope_enter(v3, &state);

  -[CKDiscretionaryDASSchedulerTask cancel](self, "cancel");
  id v5 = objc_msgSend( (id)objc_opt_class(self, v4),  "_priorityForState:",  -[CKDiscretionarySchedulerTask state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask _activityName](self, "_activityName"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask startAfter](self, "startAfter"));
  os_activity_scope_state_s v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask startBefore](self, "startBefore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:]( &OBJC_CLASS____DASActivity,  "activityWithName:priority:duration:startingAfter:startingBefore:",  v6,  v5,  v5,  v7,  v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask queue](self, "queue"));
  [v9 setHandlerQueue:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask options](self, "options"));
  LOBYTE(v7) = [v11 requiresNetworkAccess];

  if ((v7 & 1) != 0)
  {
    [v9 setRequiresNetwork:1];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask options](self, "options"));
    objc_msgSend( v9,  "setRequiresInexpensiveNetworking:",  objc_msgSend(v12, "allowsExpensiveNetworkAccess") ^ 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask options](self, "options"));
    id v14 = [v13 allowsCellularAccess];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask options](self, "options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[CKDiscretionaryDASSchedulerTask _nwParametersWithAllowsCellularAccess:allowsExpensiveNetworkAccess:]( self,  "_nwParametersWithAllowsCellularAccess:allowsExpensiveNetworkAccess:",  v14,  [v15 allowsExpensiveNetworkAccess]));

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NWParameters parametersWithCParameters:]( &OBJC_CLASS___NWParameters,  "parametersWithCParameters:",  v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask _nwEndpointDefault](self, "_nwEndpointDefault"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NWEndpoint endpointWithCEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithCEndpoint:", v18));
    id v20 = (void *)v19;
    if (v19)
    {
      v44[0] = kNWEndpointKey;
      v44[1] = kNWParametersKey;
      v45[0] = v19;
      v45[1] = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
      [v9 setUserInfo:v21];
    }
  }

  else
  {
    [v9 setRequiresNetwork:0];
  }

  objc_msgSend( v9,  "setRequiresBuddyComplete:",  -[CKDiscretionaryDASSchedulerTask requiresPastBuddy](self, "requiresPastBuddy"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[_DASFileProtection completeUntilFirstUserAuthentication]( &OBJC_CLASS____DASFileProtection,  "completeUntilFirstUserAuthentication"));
  [v9 setFileProtection:v22];

  [v9 setCancelAfterDeadline:0];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask options](self, "options"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 applicationBundleIdentifierOverride]);
  v25 = v24;
  if (!v24) {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask bundleID](self, "bundleID"));
  }
  [v9 setBundleId:v25];
  if (!v24) {

  }
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleId]);
  -[NSMutableArray addObject:](v26, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask options](self, "options"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 secondarySourceApplicationBundleId]);

  if (v29)
  {
    os_activity_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask options](self, "options"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 secondarySourceApplicationBundleId]);
    -[NSMutableArray addObject:](v26, "addObject:", v31);
  }

  [v9 setRelatedApplications:v26];
  -[CKDiscretionaryDASSchedulerTask setDasActivity:](self, "setDasActivity:", v9);
  -[CKDiscretionaryDASSchedulerTask setRescheduling:](self, "setRescheduling:", 0LL);
  objc_initWeak(&location, self);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10000808C;
  v40[3] = &unk_1000105C8;
  objc_copyWeak(&v41, &location);
  [v9 setStartHandler:v40];
  id v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472LL;
  id v37 = sub_100008214;
  id v38 = &unk_1000105C8;
  objc_copyWeak(&v39, &location);
  [v9 setSuspendHandler:&v35];
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](&OBJC_CLASS____DASScheduler, "sharedScheduler", v35, v36, v37, v38));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryDASSchedulerTask group](self, "group"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( &OBJC_CLASS____DASActivityGroup,  "groupWithName:maxConcurrent:",  v33,  3LL));
  [v32 submitActivity:v9 inGroup:v34];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

  os_activity_scope_leave(&state);
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)requiresPastBuddy
{
  return self->_requiresPastBuddy;
}

- (void)setRequiresPastBuddy:(BOOL)a3
{
  self->_requiresPastBuddy = a3;
}

- (CKDiscretionaryOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSDate)startAfter
{
  return self->_startAfter;
}

- (void)setStartAfter:(id)a3
{
}

- (NSDate)startBefore
{
  return self->_startBefore;
}

- (void)setStartBefore:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)rescheduling
{
  return self->_rescheduling;
}

- (void)setRescheduling:(BOOL)a3
{
  self->_rescheduling = a3;
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
}

- (id)suspendHandler
{
  return self->_suspendHandler;
}

- (void)setSuspendHandler:(id)a3
{
}

- (_DASActivity)dasActivity
{
  return self->_dasActivity;
}

- (void)setDasActivity:(id)a3
{
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end