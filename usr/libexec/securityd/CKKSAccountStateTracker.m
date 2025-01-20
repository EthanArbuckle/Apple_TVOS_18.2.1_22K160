@interface CKKSAccountStateTracker
+ (id)getCircleStatus;
+ (id)stringFromAccountStatus:(int64_t)a3;
+ (void)fetchCirclePeerID:(id)a3;
- (BOOL)firstCKAccountFetch;
- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3;
- (CKAccountInfo)currentCKAccountInfo;
- (CKContainer)container;
- (CKKSCondition)accountCirclePeerIDInitialized;
- (CKKSCondition)cdpCapableiCloudAccountInitialized;
- (CKKSCondition)ckAccountInfoInitialized;
- (CKKSCondition)ckdeviceIDInitialized;
- (CKKSCondition)finishedInitialDispatches;
- (CKKSCondition)octagonInformationInitialized;
- (CKKSNearFutureScheduler)fetchCKAccountStatusScheduler;
- (Class)nsnotificationCenterClass;
- (NSError)accountCirclePeerIDError;
- (NSError)ckdeviceIDError;
- (NSMapTable)ckChangeListeners;
- (NSString)accountCirclePeerID;
- (NSString)ckdeviceID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)octagonPeerID;
- (OS_dispatch_queue)queue;
- (OTCliqueStatusWrapper)octagonStatus;
- (SOSAccountStatus)currentCircleStatus;
- (id)checkForAllDeliveries;
- (id)descriptionInternal:(id)a3;
- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4;
- (id)notifyCKAccountStatusChange:(id)a3;
- (id)notifyCircleChange:(id)a3;
- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3;
- (int64_t)cdpCapableiCloudAccountStatus;
- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4;
- (void)_onqueueDeliverCurrentCloudKitState:(id)a3 listenerQueue:(id)a4 oldStatus:(id)a5 group:(id)a6;
- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4;
- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4;
- (void)_onqueueUpdateCKDeviceID:(id)a3;
- (void)_onqueueUpdateCirclePeerID:(id)a3;
- (void)dealloc;
- (void)notifyCKAccountStatusChangeAndWaitForSignal;
- (void)notifyCircleStatusChangeAndWaitForSignal;
- (void)performInitialDispatches;
- (void)recheckCKAccountStatus;
- (void)setAccountCirclePeerID:(id)a3;
- (void)setAccountCirclePeerIDError:(id)a3;
- (void)setAccountCirclePeerIDInitialized:(id)a3;
- (void)setCDPCapableiCloudAccountStatus:(int64_t)a3;
- (void)setCdpCapableiCloudAccountInitialized:(id)a3;
- (void)setCdpCapableiCloudAccountStatus:(int64_t)a3;
- (void)setCkAccountInfoInitialized:(id)a3;
- (void)setCkChangeListeners:(id)a3;
- (void)setCkdeviceID:(id)a3;
- (void)setCkdeviceIDError:(id)a3;
- (void)setCkdeviceIDInitialized:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentCKAccountInfo:(id)a3;
- (void)setCurrentCircleStatus:(id)a3;
- (void)setFinishedInitialDispatches:(id)a3;
- (void)setFirstCKAccountFetch:(BOOL)a3;
- (void)setOctagonInformationInitialized:(id)a3;
- (void)setOctagonPeerID:(id)a3;
- (void)setOctagonStatus:(id)a3;
- (void)setQueue:(id)a3;
- (void)triggerOctagonStatusFetch;
@end

@implementation CKKSAccountStateTracker

- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4
{
  id v7 = a3;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___CKKSAccountStateTracker;
  v8 = -[CKKSAccountStateTracker init](&v48, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nsnotificationCenterClass, a4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    ckChangeListeners = v9->_ckChangeListeners;
    v9->_ckChangeListeners = (NSMapTable *)v10;

    currentCKAccountInfo = v9->_currentCKAccountInfo;
    v9->_currentCKAccountInfo = 0LL;

    v13 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    ckAccountInfoInitialized = v9->_ckAccountInfoInitialized;
    v9->_ckAccountInfoInitialized = v13;

    v15 = -[SOSAccountStatus init:error:](objc_alloc(&OBJC_CLASS___SOSAccountStatus), "init:error:", 0xFFFFFFFFLL, 0LL);
    currentCircleStatus = v9->_currentCircleStatus;
    v9->_currentCircleStatus = v15;

    objc_storeStrong((id *)&v9->_container, a3);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("ck-account-state", v18);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v19;

    v9->_firstCKAccountFetch = 0;
    v21 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    finishedInitialDispatches = v9->_finishedInitialDispatches;
    v9->_finishedInitialDispatches = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    ckdeviceIDInitialized = v9->_ckdeviceIDInitialized;
    v9->_ckdeviceIDInitialized = v23;

    v25 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    octagonInformationInitialized = v9->_octagonInformationInitialized;
    v9->_octagonInformationInitialized = v25;

    v9->_cdpCapableiCloudAccountStatus = 0LL;
    v27 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    cdpCapableiCloudAccountInitialized = v9->_cdpCapableiCloudAccountInitialized;
    v9->_cdpCapableiCloudAccountInitialized = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class defaultCenter]( -[CKKSAccountStateTracker nsnotificationCenterClass](v9, "nsnotificationCenterClass"),  "defaultCenter"));
    id v30 = sub_1000AA6AC(@"ckksaccount", 0LL);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 138412290;
      *(void *)&location[4] = v29;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "Registering with notification center %@",  location,  0xCu);
    }

    [v29 addObserver:v9 selector:"notifyCKAccountStatusChange:" name:CKAccountChangedNotification object:0];
    *(void *)location = 0xAAAAAAAAAAAAAAAALL;
    id inited = objc_initWeak((id *)location, v9);
    if (-[OTSOSActualAdapter sosEnabled]_0((uint64_t)inited, v33))
    {
      int out_token = 0;
      v34 = (const char *)kSOSCCCircleChangedNotification;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
      v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000384E4;
      handler[3] = &unk_1002913A0;
      objc_copyWeak(&v46, (id *)location);
      notify_register_dispatch(v34, &out_token, v36, handler);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10003851C;
      block[3] = &unk_100291A38;
      objc_copyWeak(&v44, (id *)location);
      dispatch_async(v36, block);

      objc_destroyWeak(&v44);
      objc_destroyWeak(&v46);
    }

    v37 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100038568;
    v41[3] = &unk_100291A38;
    objc_copyWeak(&v42, (id *)location);
    v38 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v37,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"ckstatus-refetch",  5000000000LL,  600000000000LL,  0LL,  0LL,  v41,  1.1);
    fetchCKAccountStatusScheduler = v9->_fetchCKAccountStatusScheduler;
    v9->_fetchCKAccountStatusScheduler = v38;

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)location);
  }

  return v9;
}

- (void)performInitialDispatches
{
  v3 = objc_autoreleasePoolPush();
  id v4 = -[CKKSAccountStateTracker notifyCKAccountStatusChange:](self, "notifyCKAccountStatusChange:", 0LL);
  id v5 = -[CKKSAccountStateTracker notifyCircleChange:](self, "notifyCircleChange:", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker finishedInitialDispatches](self, "finishedInitialDispatches"));
  [v6 fulfill];

  objc_autoreleasePoolPop(v3);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class defaultCenter]( -[CKKSAccountStateTracker nsnotificationCenterClass](self, "nsnotificationCenterClass"),  "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CKKSAccountStateTracker;
  -[CKKSAccountStateTracker dealloc](&v4, "dealloc");
}

- (id)descriptionInternal:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  int64_t v6 = -[CKKSAccountStateTracker cdpCapableiCloudAccountStatus](self, "cdpCapableiCloudAccountStatus");
  id v7 = @"available";
  if (v6 == 3) {
    id v7 = @"no account";
  }
  if (!v6) {
    id v7 = @"unknown";
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@, cdp capable: %@>",  v4,  v5,  v7));

  return v8;
}

- (NSString)description
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker descriptionInternal:](self, "descriptionInternal:", v4));

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CKKSAccountStateTracker;
  id v3 = -[CKKSAccountStateTracker description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker descriptionInternal:](self, "descriptionInternal:", v4));

  return (NSString *)v5;
}

- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  int64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003819C;
  block[3] = &unk_100290578;
  void block[4] = self;
  id v13 = v4;
  objc_super v7 = v5;
  v14 = v7;
  id v8 = v4;
  dispatch_async(v6, block);

  v9 = v14;
  uint64_t v10 = v7;

  return v10;
}

- (id)notifyCKAccountStatusChange:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100037E90;
  v11[3] = &unk_100283CC8;
  objc_copyWeak(&v13, &location);
  int64_t v6 = v5;
  v12 = v6;
  objc_super v7 = objc_retainBlock(v11);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker container](self, "container"));
  [v8 accountInfoWithCompletionHandler:v7];

  v9 = v6;
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (void)_onqueueUpdateCKDeviceID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([v4 accountStatus] == (id)1)
  {
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker container](self, "container"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100037B78;
    v8[3] = &unk_100285148;
    objc_copyWeak(&v9, &location);
    [v6 fetchCurrentDeviceIDWithCompletionHandler:v8];

    objc_destroyWeak(&v9);
  }

  else
  {
    -[CKKSAccountStateTracker setCkdeviceID:](self, "setCkdeviceID:", 0LL);
    -[CKKSAccountStateTracker setCkdeviceIDError:](self, "setCkdeviceIDError:", 0LL);
    objc_super v7 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    -[CKKSAccountStateTracker setCkdeviceIDInitialized:](self, "setCkdeviceIDInitialized:", v7);
  }

  objc_destroyWeak(&location);
}

- (id)notifyCircleChange:(id)a3
{
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAccountStateTracker getCircleStatus](&OBJC_CLASS___CKKSAccountStateTracker, "getCircleStatus"));
  int64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037A1C;
  block[3] = &unk_100290578;
  void block[4] = self;
  id v13 = v5;
  objc_super v7 = v4;
  v14 = v7;
  id v8 = v5;
  dispatch_sync(v6, block);

  id v9 = v14;
  uint64_t v10 = v7;

  return v10;
}

- (void)_onqueueUpdateCirclePeerID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([v4 status])
  {
    id v6 = sub_1000AA6AC(@"ckks-sos", 0LL);
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "out of circle(%@): resetting peer ID",  buf,  0xCu);
    }

    -[CKKSAccountStateTracker setAccountCirclePeerID:](self, "setAccountCirclePeerID:", 0LL);
    -[CKKSAccountStateTracker setAccountCirclePeerIDError:](self, "setAccountCirclePeerIDError:", 0LL);
    id v8 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    -[CKKSAccountStateTracker setAccountCirclePeerIDInitialized:](self, "setAccountCirclePeerIDInitialized:", v8);
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10003772C;
    v9[3] = &unk_100285148;
    objc_copyWeak(&v10, &location);
    +[CKKSAccountStateTracker fetchCirclePeerID:](&OBJC_CLASS___CKKSAccountStateTracker, "fetchCirclePeerID:", v9);
    objc_destroyWeak(&v10);
  }

  objc_destroyWeak(&location);
}

- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4
{
  id v6 = a3;
  objc_super v7 = (dispatch_semaphore_s *)a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = dispatch_group_create();
  if (v9)
  {
    -[CKKSAccountStateTracker _onqueueUpdateAccountState:dispatchGroup:]( self,  "_onqueueUpdateAccountState:dispatchGroup:",  v6,  v9);
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100037724;
    block[3] = &unk_1002927F0;
    v14 = v7;
    dispatch_group_notify(v9, v10, block);
  }

  else
  {
    id v11 = sub_1000AA6AC(@"ckksaccount", 0LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to get dispatch group.", buf, 2u);
    }

    dispatch_semaphore_signal(v7);
  }
}

- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  unsigned int v10 = [v9 isEqual:v6];

  if (v10)
  {
    id v11 = sub_1000AA6AC(@"ckksaccount", 0LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker container](self, "container"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 options]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountOverrideInfo]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 altDSID]);
      int v29 = 138412546;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "received another notification of CK Account State(altDSID: %@) %@",  (uint8_t *)&v29,  0x16u);
    }

    goto LABEL_12;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  v12 = (os_log_s *)v17;
  if (v6 && !v17) {
    goto LABEL_8;
  }
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  if ((id)v18 == v6)
  {

LABEL_12:
    goto LABEL_13;
  }

  dispatch_queue_t v19 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  unsigned __int8 v21 = [v20 isEqual:v6];

  if ((v21 & 1) == 0)
  {
LABEL_8:
    id v22 = sub_1000AA6AC(@"ckksaccount", 0LL);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker container](self, "container"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 options]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountOverrideInfo]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 altDSID]);
      int v29 = 138412546;
      id v30 = v27;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "moving to CK Account info(altDSID: %@): %@",  (uint8_t *)&v29,  0x16u);
    }

    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
    -[CKKSAccountStateTracker setCurrentCKAccountInfo:](self, "setCurrentCKAccountInfo:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker ckAccountInfoInitialized](self, "ckAccountInfoInitialized"));
    [v28 fulfill];

    -[CKKSAccountStateTracker _onqueueUpdateCKDeviceID:](self, "_onqueueUpdateCKDeviceID:", v6);
    -[CKKSAccountStateTracker _onqueueDeliverCloudKitStateChanges:dispatchGroup:]( self,  "_onqueueDeliverCloudKitStateChanges:dispatchGroup:",  v12,  v7);
    goto LABEL_12;
  }

- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker ckChangeListeners](self, "ckChangeListeners"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyEnumerator]);

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
  if (v10)
  {
    id v11 = (void *)v10;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker ckChangeListeners](self, "ckChangeListeners"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

      -[CKKSAccountStateTracker _onqueueDeliverCurrentCloudKitState:listenerQueue:oldStatus:group:]( self,  "_onqueueDeliverCurrentCloudKitState:listenerQueue:oldStatus:group:",  v13,  v11,  v15,  v6);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 nextObject]);

      id v11 = (void *)v14;
    }

    while (v14);
  }
}

- (void)_onqueueDeliverCurrentCloudKitState:(id)a3 listenerQueue:(id)a4 oldStatus:(id)a5 group:(id)a6
{
  uint64_t v10 = (dispatch_queue_s *)a4;
  id v11 = a5;
  v12 = (dispatch_group_s *)a6;
  id v13 = a3;
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v13);

  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000376CC;
    v15[3] = &unk_100291A60;
    objc_copyWeak(&v18, &location);
    id v16 = v11;
    uint64_t v17 = self;
    dispatch_group_async(v12, v10, v15);

    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&location);
}

- (void)recheckCKAccountStatus
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker fetchCKAccountStatusScheduler](self, "fetchCKAccountStatusScheduler"));
  [v2 trigger];
}

- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3
{
  id v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CKKSAccountStateTracker notifyCKAccountStatusChange:]( self,  "notifyCKAccountStatusChange:",  0LL));
  dispatch_time_t v5 = dispatch_time(0LL, a3);
  LOBYTE(a3) = dispatch_semaphore_wait(v4, v5) == 0;

  return a3;
}

- (void)notifyCKAccountStatusChangeAndWaitForSignal
{
}

- (void)notifyCircleStatusChangeAndWaitForSignal
{
  id v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker notifyCircleChange:](self, "notifyCircleChange:", 0LL));
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)checkForAllDeliveries
{
  dispatch_group_t v3 = dispatch_group_create();
  if (v3)
  {
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100037438;
    v10[3] = &unk_100290788;
    v10[4] = self;
    dispatch_time_t v5 = v3;
    id v11 = v5;
    dispatch_sync(v4, v10);

    id v6 = v5;
  }

  else
  {
    id v7 = sub_1000AA6AC(@"ckksaccount", 0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to get dispatch group.", buf, 2u);
    }
  }

  return v3;
}

- (void)triggerOctagonStatusFetch
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_100037020;
  v10[4] = sub_100037030;
  id v11 = 0LL;
  dispatch_group_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037038;
  block[3] = &unk_1002916D0;
  void block[4] = self;
  void block[5] = v10;
  dispatch_sync(v3, block);

  id v4 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  [v4 setTimeoutWaitForCKAccount:100000000];
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v6 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000370BC;
  v7[3] = &unk_100283D40;
  objc_copyWeak(&v8, &location);
  v7[4] = v10;
  [v5 fetchTrustStatus:v6 configuration:v4 reply:v7];

  objc_destroyWeak(&v8);
  _Block_object_dispose(v10, 8);

  objc_destroyWeak(&location);
}

- (void)setCDPCapableiCloudAccountStatus:(int64_t)a3
{
  if (a3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker cdpCapableiCloudAccountInitialized](self, "cdpCapableiCloudAccountInitialized"));
    [v7 fulfill];
  }

  else
  {
    dispatch_time_t v5 = objc_alloc(&OBJC_CLASS___CKKSCondition);
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker cdpCapableiCloudAccountInitialized](self, "cdpCapableiCloudAccountInitialized"));
    id v6 = -[CKKSCondition initToChain:](v5, "initToChain:");
    -[CKKSAccountStateTracker setCdpCapableiCloudAccountInitialized:]( self,  "setCdpCapableiCloudAccountInitialized:",  v6);
  }
}

- (NSString)octagonPeerID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOctagonPeerID:(id)a3
{
}

- (CKKSCondition)finishedInitialDispatches
{
  return (CKKSCondition *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFinishedInitialDispatches:(id)a3
{
}

- (CKKSNearFutureScheduler)fetchCKAccountStatusScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 32LL, 1);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setContainer:(id)a3
{
}

- (CKAccountInfo)currentCKAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCurrentCKAccountInfo:(id)a3
{
}

- (CKKSCondition)ckAccountInfoInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCkAccountInfoInitialized:(id)a3
{
}

- (NSString)ckdeviceID
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCkdeviceID:(id)a3
{
}

- (NSError)ckdeviceIDError
{
  return (NSError *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCkdeviceIDError:(id)a3
{
}

- (CKKSCondition)ckdeviceIDInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setCkdeviceIDInitialized:(id)a3
{
}

- (SOSAccountStatus)currentCircleStatus
{
  return (SOSAccountStatus *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCurrentCircleStatus:(id)a3
{
}

- (NSString)accountCirclePeerID
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setAccountCirclePeerID:(id)a3
{
}

- (NSError)accountCirclePeerIDError
{
  return (NSError *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setAccountCirclePeerIDError:(id)a3
{
}

- (CKKSCondition)accountCirclePeerIDInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setAccountCirclePeerIDInitialized:(id)a3
{
}

- (OTCliqueStatusWrapper)octagonStatus
{
  return (OTCliqueStatusWrapper *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setOctagonStatus:(id)a3
{
}

- (CKKSCondition)octagonInformationInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setOctagonInformationInitialized:(id)a3
{
}

- (int64_t)cdpCapableiCloudAccountStatus
{
  return self->_cdpCapableiCloudAccountStatus;
}

- (void)setCdpCapableiCloudAccountStatus:(int64_t)a3
{
  self->_cdpCapableiCloudAccountStatus = a3;
}

- (CKKSCondition)cdpCapableiCloudAccountInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setCdpCapableiCloudAccountInitialized:(id)a3
{
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 152LL, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMapTable)ckChangeListeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setCkChangeListeners:(id)a3
{
}

- (BOOL)firstCKAccountFetch
{
  return self->_firstCKAccountFetch;
}

- (void)setFirstCKAccountFetch:(BOOL)a3
{
  self->_firstCKAccountFetch = a3;
}

- (void).cxx_destruct
{
}

+ (void)fetchCirclePeerID:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_time_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000389F0;
  block[3] = &unk_100283CF0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

+ (id)getCircleStatus
{
  id v9 = 0LL;
  uint64_t v2 = SOSCCThisDeviceIsInCircle(&v9, a2);
  if (!v9) {
    return -[SOSAccountStatus init:error:](objc_alloc(&OBJC_CLASS___SOSAccountStatus), "init:error:", v2, 0LL);
  }
  id v3 = sub_1000AA6AC(@"ckks-sos", 0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "error getting circle status: %@", buf, 0xCu);
  }

  dispatch_time_t v5 = objc_alloc(&OBJC_CLASS___SOSAccountStatus);
  id v6 = v9;
  id v7 = -[SOSAccountStatus init:error:](v5, "init:error:", 0xFFFFFFFFLL, v9);

  return v7;
}

+ (id)stringFromAccountStatus:(int64_t)a3
{
  id v3 = @"account state unknown";
  if (a3 == 1) {
    id v3 = @"logged in";
  }
  if (a3 == 3) {
    return @"no account";
  }
  else {
    return (id)v3;
  }
}

@end