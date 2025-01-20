@interface MRDPreemptiveRemoteControlConnectionManager
+ (id)sharedManager;
- (MRAVEndpoint)groupLeader;
- (MRAVEndpoint)preferredClusterLeader;
- (NSHashTable)observers;
- (NSOperationQueue)clusterLeaderOperations;
- (NSOperationQueue)groupLeaderOperations;
- (NSString)debugDescription;
- (NSString)previousClusterLeaderID;
- (NSString)previousGroupID;
- (OS_dispatch_queue)queue;
- (id)_init;
- (void)_clearPendingClusterLeaderOperations;
- (void)_clearPendingGroupLeaderOperations;
- (void)_reevaluateClusterLeaderConnectionWithDeviceInfo:(id)a3;
- (void)_reevaluateGroupLeaderConnectionWithDeviceInfo:(id)a3;
- (void)_reevaluateWithReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setClusterLeaderOperations:(id)a3;
- (void)setGroupLeader:(id)a3;
- (void)setGroupLeaderOperations:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreferredClusterLeader:(id)a3;
- (void)setPreviousClusterLeaderID:(id)a3;
- (void)setPreviousGroupID:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MRDPreemptiveRemoteControlConnectionManager

- (id)_init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDPreemptiveRemoteControlConnectionManager;
  v2 = -[MRDPreemptiveRemoteControlConnectionManager init](&v17, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaRemote.MRDPreemptiveRemoteControlConnectionManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v8 = kMRDeviceInfoDidChangeNotification;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10013654C;
    v15[3] = &unk_10039B878;
    v9 = v2;
    v16 = v9;
    id v10 = [v7 addObserverForName:v8 object:0 queue:0 usingBlock:v15];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](v9, "queue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100136634;
    v13[3] = &unk_100399250;
    v14 = v9;
    sub_10013D6FC(v11, v13);
  }

  return v2;
}

+ (id)sharedManager
{
  if (qword_1003FE188 != -1) {
    dispatch_once(&qword_1003FE188, &stru_1003A22E0);
  }
  return (id)qword_1003FE180;
}

- (NSString)debugDescription
{
  dispatch_queue_attr_t v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100136794;
  block[3] = &unk_100398E60;
  block[4] = self;
  dispatch_queue_t v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, block);

  -[NSMutableString appendString:](v5, "appendString:", @"}>");
  v6 = v10;
  v7 = v5;

  return &v7->super;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100136930;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100136A44;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setPreviousGroupID:(id)a3
{
  dispatch_queue_t v5 = (NSString *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  previousGroupID = self->_previousGroupID;
  p_previousGroupID = (id *)&self->_previousGroupID;
  v9 = previousGroupID;
  if (v9 == v5)
  {
  }

  else
  {
    id v10 = v9;
    unsigned __int8 v11 = -[NSString isEqual:](v9, "isEqual:", v5);

    if ((v11 & 1) == 0)
    {
      id v13 = *p_previousGroupID;
      uint64_t v14 = _MRLogForCategory(0LL, v12);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v16)
        {
          objc_super v17 = (NSString *)*p_previousGroupID;
          int v21 = 138544130;
          v22 = @"PreemptiveRemoteControlConnectionManager";
          __int16 v23 = 2114;
          v24 = @"previousGroupID";
          __int16 v25 = 2112;
          v26 = v17;
          __int16 v27 = 2112;
          v28 = v5;
          v18 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
          v19 = v15;
          uint32_t v20 = 42;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, v20);
        }
      }

      else if (v16)
      {
        int v21 = 138543874;
        v22 = @"PreemptiveRemoteControlConnectionManager";
        __int16 v23 = 2114;
        v24 = @"previousGroupID";
        __int16 v25 = 2112;
        v26 = v5;
        v18 = "Set: %{public}@ setting %{public}@ to <%@>";
        v19 = v15;
        uint32_t v20 = 32;
        goto LABEL_9;
      }

      objc_storeStrong(p_previousGroupID, a3);
    }
  }
}

- (void)setGroupLeader:(id)a3
{
  dispatch_queue_t v5 = (MRAVEndpoint *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  p_groupLeader = &self->_groupLeader;
  id v8 = self->_groupLeader;
  if (v8 == v5)
  {

    goto LABEL_12;
  }

  v9 = v8;
  unsigned __int8 v10 = -[MRAVEndpoint isEqual:](v8, "isEqual:", v5);

  if ((v10 & 1) == 0)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](*p_groupLeader, "debugName"));

    uint64_t v13 = _MRLogForCategory(0LL, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v15) {
        goto LABEL_10;
      }
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](*p_groupLeader, "debugName"));
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v5, "debugName"));
      *(_DWORD *)buf = 138544130;
      __int16 v25 = @"PreemptiveRemoteControlConnectionManager";
      __int16 v26 = 2114;
      __int16 v27 = @"groupLeader";
      __int16 v28 = 2112;
      v29 = v16;
      __int16 v30 = 2112;
      v31 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ from <%@> to <%@>",  buf,  0x2Au);
    }

    else
    {
      if (!v15) {
        goto LABEL_10;
      }
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v5, "debugName"));
      *(_DWORD *)buf = 138543874;
      __int16 v25 = @"PreemptiveRemoteControlConnectionManager";
      __int16 v26 = 2114;
      __int16 v27 = @"groupLeader";
      __int16 v28 = 2112;
      v29 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  buf,  0x20u);
    }

LABEL_10:
    objc_storeStrong((id *)&self->_groupLeader, a3);
    if (v5)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100136EB8;
      block[3] = &unk_100398F40;
      id v21 = v18;
      v22 = self;
      __int16 v23 = v5;
      id v19 = v18;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (void)setPreviousClusterLeaderID:(id)a3
{
  dispatch_queue_t v5 = (NSString *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  previousClusterLeaderID = self->_previousClusterLeaderID;
  p_previousClusterLeaderID = (id *)&self->_previousClusterLeaderID;
  v9 = previousClusterLeaderID;
  if (v9 == v5)
  {
  }

  else
  {
    unsigned __int8 v10 = v9;
    unsigned __int8 v11 = -[NSString isEqual:](v9, "isEqual:", v5);

    if ((v11 & 1) == 0)
    {
      id v13 = *p_previousClusterLeaderID;
      uint64_t v14 = _MRLogForCategory(0LL, v12);
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v16)
        {
          objc_super v17 = (NSString *)*p_previousClusterLeaderID;
          int v21 = 138544130;
          v22 = @"PreemptiveRemoteControlConnectionManager";
          __int16 v23 = 2114;
          v24 = @"previousClusterLeaderID";
          __int16 v25 = 2112;
          __int16 v26 = v17;
          __int16 v27 = 2112;
          __int16 v28 = v5;
          v18 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
          id v19 = v15;
          uint32_t v20 = 42;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, v20);
        }
      }

      else if (v16)
      {
        int v21 = 138543874;
        v22 = @"PreemptiveRemoteControlConnectionManager";
        __int16 v23 = 2114;
        v24 = @"previousClusterLeaderID";
        __int16 v25 = 2112;
        __int16 v26 = v5;
        v18 = "Set: %{public}@ setting %{public}@ to <%@>";
        id v19 = v15;
        uint32_t v20 = 32;
        goto LABEL_9;
      }

      objc_storeStrong(p_previousClusterLeaderID, a3);
    }
  }
}

- (void)setPreferredClusterLeader:(id)a3
{
  dispatch_queue_t v5 = (MRAVEndpoint *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  p_preferredClusterLeader = &self->_preferredClusterLeader;
  id v8 = self->_preferredClusterLeader;
  if (v8 == v5)
  {

    goto LABEL_12;
  }

  v9 = v8;
  unsigned __int8 v10 = -[MRAVEndpoint isEqual:](v8, "isEqual:", v5);

  if ((v10 & 1) == 0)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](*p_preferredClusterLeader, "debugName"));

    uint64_t v13 = _MRLogForCategory(0LL, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v15) {
        goto LABEL_10;
      }
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](*p_preferredClusterLeader, "debugName"));
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v5, "debugName"));
      *(_DWORD *)buf = 138544130;
      __int16 v25 = @"PreemptiveRemoteControlConnectionManager";
      __int16 v26 = 2114;
      __int16 v27 = @"clusterLeader";
      __int16 v28 = 2112;
      v29 = v16;
      __int16 v30 = 2112;
      v31 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ from <%@> to <%@>",  buf,  0x2Au);
    }

    else
    {
      if (!v15) {
        goto LABEL_10;
      }
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v5, "debugName"));
      *(_DWORD *)buf = 138543874;
      __int16 v25 = @"PreemptiveRemoteControlConnectionManager";
      __int16 v26 = 2114;
      __int16 v27 = @"clusterLeader";
      __int16 v28 = 2112;
      v29 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  buf,  0x20u);
    }

LABEL_10:
    objc_storeStrong((id *)&self->_preferredClusterLeader, a3);
    if (v5)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100137408;
      block[3] = &unk_100398F40;
      id v21 = v18;
      v22 = self;
      __int16 v23 = v5;
      id v19 = v18;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (void)_reevaluateWithReason:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100137590;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_reevaluateGroupLeaderConnectionWithDeviceInfo:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10013785C;
  v27[3] = &unk_1003A2308;
  id v6 = v4;
  id v28 = v6;
  id v7 = sub_10013785C((uint64_t)v27);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ([v8 result])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001378D8;
    v25[3] = &unk_1003A2330;
    v25[4] = self;
    id v9 = v6;
    id v26 = v9;
    id v10 = sub_1001378D8((uint64_t)v25);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ([v11 result])
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 groupUID]);
      -[MRDPreemptiveRemoteControlConnectionManager setPreviousGroupID:](self, "setPreviousGroupID:", v12);
      -[MRDPreemptiveRemoteControlConnectionManager _clearPendingGroupLeaderOperations]( self,  "_clearPendingGroupLeaderOperations");
      uint64_t v13 = -[MRDConenctToGroupLeaderOperation initWithGroupID:]( objc_alloc(&OBJC_CLASS___MRDConenctToGroupLeaderOperation),  "initWithGroupID:",  v12);
      objc_initWeak(&location, v13);
      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      uint32_t v20 = sub_1001379E8;
      id v21 = &unk_10039B590;
      objc_copyWeak(&v23, &location);
      v22 = self;
      -[MRDConenctToGroupLeaderOperation setCompletionBlock:](v13, "setCompletionBlock:", &v18);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPreemptiveRemoteControlConnectionManager groupLeaderOperations]( self,  "groupLeaderOperations",  v18,  v19,  v20,  v21));

      if (!v14)
      {
        BOOL v15 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
        -[MRDPreemptiveRemoteControlConnectionManager setGroupLeaderOperations:](self, "setGroupLeaderOperations:", v15);

        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPreemptiveRemoteControlConnectionManager groupLeaderOperations]( self,  "groupLeaderOperations"));
        [v16 setMaxConcurrentOperationCount:3];
      }

      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPreemptiveRemoteControlConnectionManager groupLeaderOperations]( self,  "groupLeaderOperations"));
      [v17 addOperation:v13];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    -[MRDPreemptiveRemoteControlConnectionManager _clearPendingGroupLeaderOperations]( self,  "_clearPendingGroupLeaderOperations");
    -[MRDPreemptiveRemoteControlConnectionManager setPreviousGroupID:](self, "setPreviousGroupID:", 0LL);
    -[MRDPreemptiveRemoteControlConnectionManager setGroupLeader:](self, "setGroupLeader:", 0LL);
  }
}

- (void)_reevaluateClusterLeaderConnectionWithDeviceInfo:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100137CE0;
  v26[3] = &unk_1003A2308;
  id v6 = v4;
  id v27 = v6;
  id v7 = sub_100137CE0((uint64_t)v26);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ([v8 result])
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100137D90;
    v24[3] = &unk_1003A2330;
    v24[4] = self;
    id v9 = v6;
    id v25 = v9;
    id v10 = sub_100137D90((uint64_t)v24);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ([v11 result])
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 clusterLeaderID]);
      -[MRDPreemptiveRemoteControlConnectionManager setPreviousClusterLeaderID:]( self,  "setPreviousClusterLeaderID:",  v12);
      -[MRDPreemptiveRemoteControlConnectionManager _clearPendingClusterLeaderOperations]( self,  "_clearPendingClusterLeaderOperations");
      uint64_t v13 = -[MRDConenctToClusterLeaderOperation initWithClusterLeaderID:]( objc_alloc(&OBJC_CLASS___MRDConenctToClusterLeaderOperation),  "initWithClusterLeaderID:",  v12);
      objc_initWeak(&location, v13);
      objc_super v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      uint64_t v19 = sub_100137EA0;
      uint32_t v20 = &unk_10039B590;
      objc_copyWeak(&v22, &location);
      id v21 = self;
      -[MRDConenctToClusterLeaderOperation setCompletionBlock:](v13, "setCompletionBlock:", &v17);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPreemptiveRemoteControlConnectionManager clusterLeaderOperations]( self,  "clusterLeaderOperations",  v17,  v18,  v19,  v20));

      if (!v14)
      {
        BOOL v15 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
        -[MRDPreemptiveRemoteControlConnectionManager setClusterLeaderOperations:]( self,  "setClusterLeaderOperations:",  v15);
      }

      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPreemptiveRemoteControlConnectionManager clusterLeaderOperations]( self,  "clusterLeaderOperations"));
      [v16 addOperation:v13];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    -[MRDPreemptiveRemoteControlConnectionManager _clearPendingClusterLeaderOperations]( self,  "_clearPendingClusterLeaderOperations");
    -[MRDPreemptiveRemoteControlConnectionManager setPreferredClusterLeader:](self, "setPreferredClusterLeader:", 0LL);
  }
}

- (void)_clearPendingGroupLeaderOperations
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager groupLeaderOperations](self, "groupLeaderOperations"));
  id v5 = [v4 operationCount];

  if (v5)
  {
    uint64_t v7 = _MRLogForCategory(0LL, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PreemptiveRemoteControlConnectionManager] Cancelling pending groupLeaderOperations",  v10,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager groupLeaderOperations](self, "groupLeaderOperations"));
    [v9 cancelAllOperations];
  }

- (void)_clearPendingClusterLeaderOperations
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPreemptiveRemoteControlConnectionManager clusterLeaderOperations](self, "clusterLeaderOperations"));
  id v5 = [v4 operationCount];

  if (v5)
  {
    uint64_t v7 = _MRLogForCategory(0LL, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PreemptiveRemoteControlConnectionManager] Cancelling Pending clusterLeaderOperations",  v10,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPreemptiveRemoteControlConnectionManager clusterLeaderOperations]( self,  "clusterLeaderOperations"));
    [v9 cancelAllOperations];
  }

- (MRAVEndpoint)groupLeader
{
  return self->_groupLeader;
}

- (MRAVEndpoint)preferredClusterLeader
{
  return self->_preferredClusterLeader;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSString)previousGroupID
{
  return self->_previousGroupID;
}

- (NSOperationQueue)groupLeaderOperations
{
  return self->_groupLeaderOperations;
}

- (void)setGroupLeaderOperations:(id)a3
{
}

- (NSString)previousClusterLeaderID
{
  return self->_previousClusterLeaderID;
}

- (NSOperationQueue)clusterLeaderOperations
{
  return self->_clusterLeaderOperations;
}

- (void)setClusterLeaderOperations:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end