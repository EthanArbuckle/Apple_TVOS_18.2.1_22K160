@interface MRDGroupSessionEligibilityMonitor
+ (id)sharedMonitor;
- (BOOL)isCarPlay;
- (CUSystemMonitor)systemMonitor;
- (IDSAccountController)accountController;
- (MRDGroupSessionEligibilityMonitor)init;
- (MRGroupSessionEligibilityStatus)eligibilityStatus;
- (NSHashTable)observers;
- (NSString)description;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)queue;
- (unint64_t)bestHostingStateForUserStates:(id)a3 reason:(id *)a4;
- (unint64_t)hostingStateForEligibilityStatus:(id)a3 reason:(id *)a4;
- (unint64_t)hostingStateForUserState:(id)a3 reason:(id *)a4;
- (unint64_t)joiningStateForEligibilityStatus:(id)a3 reason:(id *)a4;
- (unsigned)pickedRouteType;
- (void)_onQueue_notifyObservers:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handleCloudStateChangeNotification:(id)a3;
- (void)handleDeviceInfoChangeNotification:(id)a3;
- (void)handleEndpointNotification:(id)a3;
- (void)initializeObserversAndState;
- (void)reevaluateState;
- (void)removeObserver:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setEligibilityStatus:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation MRDGroupSessionEligibilityMonitor

+ (id)sharedMonitor
{
  if (qword_1003FE1D0 != -1) {
    dispatch_once(&qword_1003FE1D0, &stru_1003A2AE8);
  }
  return (id)qword_1003FE1D8;
}

- (MRDGroupSessionEligibilityMonitor)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MRDGroupSessionEligibilityMonitor;
  v2 = -[MRDGroupSessionEligibilityMonitor init](&v21, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UNSPECIFIED, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MRDGroupSessionEligibilityMonitor.queue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UNSPECIFIED, 0);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MRDGroupSessionEligibilityMonitor.notification", v12);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v15;

    v17 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001447C0;
    block[3] = &unk_100399250;
    v20 = v2;
    dispatch_async(v17, block);
  }

  return v2;
}

- (void)initializeObserversAndState
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = MRAVEndpointDidAddOutputDeviceNotification;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
  [v3 addObserver:self selector:"handleEndpointNotification:" name:v4 object:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = MRAVEndpointDidChangeOutputDeviceNotification;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
  [v6 addObserver:self selector:"handleEndpointNotification:" name:v7 object:v8];

  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v10 = MRAVEndpointDidRemoveOutputDeviceNotification;
  dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
  [v9 addObserver:self selector:"handleEndpointNotification:" name:v10 object:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 addObserver:self selector:"handleDeviceInfoChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

  dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v13 addObserver:self selector:"handleCloudStateChangeNotification:" name:@"MRDMusicUserStateCenterCloudStateDidUpdateNotification" object:0];

  v14 = objc_alloc(&OBJC_CLASS___IDSAccountController);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSService mr_sharedGroupSessionServiceName]( &OBJC_CLASS___IDSService,  "mr_sharedGroupSessionServiceName"));
  v16 = -[IDSAccountController initWithService:](v14, "initWithService:", v15);
  accountController = self->_accountController;
  self->_accountController = v16;

  -[IDSAccountController addDelegate:queue:](self->_accountController, "addDelegate:queue:", self, self->_queue);
  v18 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v18;

  -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_queue);
  v20 = self->_systemMonitor;
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100144B54;
  v31[3] = &unk_10039D050;
  objc_super v21 = v20;
  v32 = v21;
  objc_copyWeak(&v33, &location);
  -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v31);
  v22 = self->_systemMonitor;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100144C14;
  v28[3] = &unk_10039D050;
  v23 = v21;
  v29 = v23;
  objc_copyWeak(&v30, &location);
  -[CUSystemMonitor activateWithCompletion:](v22, "activateWithCompletion:", v28);
  uint64_t v25 = _MRLogForCategory(12LL, v24);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v27 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionEligibilityMonitor] Initialized",  (uint8_t *)&v27,  2u);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&location);
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionEligibilityMonitor] Dealloc",  buf,  2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDGroupSessionEligibilityMonitor;
  -[MRDGroupSessionEligibilityMonitor dealloc](&v5, "dealloc");
}

- (NSString)description
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionEligibilityMonitor eligibilityStatus](self, "eligibilityStatus"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@: eligibility: %@>", v4, v5);

  return v6;
}

- (MRGroupSessionEligibilityStatus)eligibilityStatus
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_queue_attr_t v9 = sub_100144E88;
  uint64_t v10 = sub_100144E98;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100144EA0;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRGroupSessionEligibilityStatus *)v3;
}

- (void)reevaluateState
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MRGroupSessionEligibilityStatus);
  -[MRGroupSessionEligibilityStatus setIsManateeEnabled:]( v3,  "setIsManateeEnabled:",  -[CUSystemMonitor manateeAvailable](self->_systemMonitor, "manateeAvailable"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAccount mr_activeGroupSessionAccount](&OBJC_CLASS___IDSAccount, "mr_activeGroupSessionAccount"));
  -[MRGroupSessionEligibilityStatus setIdsAccountIsValid:](v3, "setIdsAccountIsValid:", v4 != 0LL);

  -[MRGroupSessionEligibilityStatus setRouteType:]( v3,  "setRouteType:",  -[MRDGroupSessionEligibilityMonitor pickedRouteType](self, "pickedRouteType"));
  -[MRGroupSessionEligibilityStatus setRouteIsValidForHosting:]( v3,  "setRouteIsValidForHosting:",  -[MRGroupSessionEligibilityStatus routeType](v3, "routeType") != 0);
  -[MRGroupSessionEligibilityStatus setMediaAccountHostingState:](v3, "setMediaAccountHostingState:", 0LL);
  -[MRGroupSessionEligibilityStatus setMediaAccountJoiningState:](v3, "setMediaAccountJoiningState:", 0LL);
  if (-[MRGroupSessionEligibilityStatus idsAccountIsValid](v3, "idsAccountIsValid")
    && -[MRGroupSessionEligibilityStatus routeIsValidForHosting](v3, "routeIsValidForHosting"))
  {
    unsigned int v5 = -[MRGroupSessionEligibilityStatus isManateeEnabled](v3, "isManateeEnabled");
  }

  else
  {
    unsigned int v5 = 0;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter"));
  unsigned __int8 v7 = [v6 cachedStateLoaded];

  if ((v7 & 1) != 0 || v5)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localActiveUserState]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 frameworkState]);
    -[MRGroupSessionEligibilityStatus setCurrentMediaUserState:](v3, "setCurrentMediaUserState:", v12);

    dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localUserStates]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "msv_map:", &stru_1003A2B28));
    -[MRGroupSessionEligibilityStatus setMediaUserStates:](v3, "setMediaUserStates:", v15);

    id v39 = 0LL;
    unint64_t v16 = -[MRDGroupSessionEligibilityMonitor hostingStateForEligibilityStatus:reason:]( self,  "hostingStateForEligibilityStatus:reason:",  v3,  &v39);
    dispatch_queue_attr_t v9 = (MRGroupSessionEligibilityStatus *)v39;
    -[MRGroupSessionEligibilityStatus setMediaAccountHostingState:](v3, "setMediaAccountHostingState:", v16);
    id v38 = 0LL;
    unint64_t v17 = -[MRDGroupSessionEligibilityMonitor joiningStateForEligibilityStatus:reason:]( self,  "joiningStateForEligibilityStatus:reason:",  v3,  &v38);
    uint64_t v8 = (MRGroupSessionEligibilityStatus *)v38;
    -[MRGroupSessionEligibilityStatus setMediaAccountJoiningState:](v3, "setMediaAccountJoiningState:", v17);
  }

  else
  {
    uint64_t v8 = 0LL;
    dispatch_queue_attr_t v9 = 0LL;
  }

  BOOL v18 = -[MRGroupSessionEligibilityStatus isManateeEnabled](v3, "isManateeEnabled")
  -[MRGroupSessionEligibilityStatus setIsEligibleForJoiningGroupSession:]( v3,  "setIsEligibleForJoiningGroupSession:",  v18);
  BOOL v19 = -[MRGroupSessionEligibilityStatus routeIsValidForHosting](v3, "routeIsValidForHosting")
     && -[MRGroupSessionEligibilityStatus idsAccountIsValid](v3, "idsAccountIsValid")
  -[MRGroupSessionEligibilityStatus setIsEligibleForHostingGroupSessionExcludingAcknowledgements:]( v3,  "setIsEligibleForHostingGroupSessionExcludingAcknowledgements:",  v19);
  if (-[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements]( v3,  "isEligibleForHostingGroupSessionExcludingAcknowledgements")) {
    BOOL v20 = -[MRGroupSessionEligibilityStatus mediaAccountHostingState](v3, "mediaAccountHostingState") == (id)6;
  }
  else {
    BOOL v20 = 0LL;
  }
  -[MRGroupSessionEligibilityStatus setIsEligibleForHostingGroupSession:]( v3,  "setIsEligibleForHostingGroupSession:",  v20);
  objc_super v21 = self->_eligibilityStatus;
  if (v3 == v21)
  {
  }

  else
  {
    v22 = v21;
    v23 = v3;
    unsigned __int8 v24 = -[MRGroupSessionEligibilityStatus isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
    {
      uint64_t v26 = _MRLogForCategory(12LL, v25);
      __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionEligibilityMonitor] Eligibility status changed: %{public}@",  buf,  0xCu);
      }

      if (v9)
      {
        uint64_t v29 = _MRLogForCategory(12LL, v28);
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionEligibilityMonitor] \tHosting state reason: %{public}@",  buf,  0xCu);
        }
      }

      if (v8)
      {
        uint64_t v31 = _MRLogForCategory(12LL, v28);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionEligibilityMonitor] \tJoining state reason: %{public}@",  buf,  0xCu);
        }
      }

      uint64_t v33 = _MRLogForCategory(12LL, v28);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (MRGroupSessionEligibilityStatus *)objc_claimAutoreleasedReturnValue( -[MRGroupSessionEligibilityStatus differenceFrom:]( v23,  "differenceFrom:",  self->_eligibilityStatus));
        *(_DWORD *)buf = 138412290;
        v41 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionEligibilityMonitor] Eligibility changes: %@",  buf,  0xCu);
      }

      v36 = (MRGroupSessionEligibilityStatus *)-[MRGroupSessionEligibilityStatus copy](v23, "copy");
      eligibilityStatus = self->_eligibilityStatus;
      self->_eligibilityStatus = v36;

      -[MRDGroupSessionEligibilityMonitor _onQueue_notifyObservers:](self, "_onQueue_notifyObservers:", v23);
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100145424;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100145564;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_onQueue_notifyObservers:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100145620;
  block[3] = &unk_100398F40;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(notificationQueue, block);
}

- (unint64_t)joiningStateForEligibilityStatus:(id)a3 reason:(id *)a4
{
  *a4 = @"Platform does not support joining";
  return 1LL;
}

- (unint64_t)hostingStateForEligibilityStatus:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  if (MSVDeviceIsAudioAccessory(v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaUserStates]);

    unint64_t v8 = -[MRDGroupSessionEligibilityMonitor bestHostingStateForUserStates:reason:]( self,  "bestHostingStateForUserStates:reason:",  v7,  a4);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentMediaUserState]);

    unint64_t v8 = -[MRDGroupSessionEligibilityMonitor hostingStateForUserState:reason:]( self,  "hostingStateForUserState:reason:",  v7,  a4);
  }

  unint64_t v9 = v8;

  return v9;
}

- (unint64_t)bestHostingStateForUserStates:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100145968;
    v21[3] = &unk_1003A2B50;
    v21[4] = self;
    id v7 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", @"{");
    v22 = v7;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mr_map:", v21));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      unint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)i) integerValue];
        }

        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }

      while (v10);
    }

    else
    {
      unint64_t v11 = 0LL;
    }

    uint64_t v15 = v7;
    *a4 = v15;
  }

  else
  {
    *a4 = @"No media user states";
    unint64_t v11 = 1LL;
  }

  return v11;
}

- (unint64_t)hostingStateForUserState:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
    if ([v7 isFullSubscriber])
    {
      id v9 = [v7 isMinor];
      id v10 = [v7 groupSessionsSupportedForAccountRegion];
      id v11 = v10;
      if ((v9 & 1) != 0 || !(_DWORD)v10)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
        unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Restricted: ageRestricted=%@, regionRestricted=%@",  v23,  v24));

        unint64_t v22 = 4LL;
      }

      else
      {
        if (v8)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
          dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"hasIdentity=%@, ageRestricted=%@, sub=%@, validRegion=%@",  v12,  v13,  v14,  v15));

          if (-[MRDGroupSessionEligibilityMonitor needsAcknowledgement](self, "needsAcknowledgement"))
          {
            id v17 = [v7 hasAcceptedPrivacyAcknowledgement];
            id v18 = [v7 hasAcceptedDisplayNameAcknowledgement];
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17));
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v18));
            objc_super v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"privacyAck=%@, displayNameAck=%@",  v19,  v20));

            if (!(_DWORD)v17 || (v18 & 1) == 0)
            {
              *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing acknowledgements: %@",  v21));

              unint64_t v22 = 5LL;
              goto LABEL_16;
            }

            [v16 appendFormat:@", %@", v21];
          }

          *a4 = v16;
          unint64_t v22 = 6LL;
LABEL_16:

          goto LABEL_17;
        }

        *a4 = @"Missing identity";
        unint64_t v22 = 3LL;
      }
    }

    else
    {
      *a4 = @"Not a subscriber";
      unint64_t v22 = 2LL;
    }

- (unsigned)pickedRouteType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v3 = [v2 startGroupSessionsForAllRoutes];

  if (v3)
  {
    else {
      return 11;
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDeviceInfoRequest localDeviceInfo](&OBJC_CLASS___MRDeviceInfoRequest, "localDeviceInfo"));
    if ([v6 isAirPlayActive])
    {
      unsigned __int8 v5 = 0;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 outputDevices]);
      unsigned __int8 v5 = MRGroupSessionRouteTypeForOutputDevices();
    }
  }

  return v5;
}

- (BOOL)isCarPlay
{
  return 0;
}

- (void)handleCloudStateChangeNotification:(id)a3
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionEligibilityMonitor queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100145DEC;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleEndpointNotification:(id)a3
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionEligibilityMonitor queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100145E60;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleDeviceInfoChangeNotification:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v6 = MRGetDeviceInfoFromUserInfo(v4, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDeviceInfoRequest localDeviceInfo](&OBJC_CLASS___MRDeviceInfoRequest, "localDeviceInfo"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100145F50;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)setEligibilityStatus:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (IDSAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end