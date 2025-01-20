@interface KTAccountStateTracker
- (BOOL)firstCKAccountFetch;
- (BOOL)forceReload;
- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3;
- (CKAccountInfo)currentCKAccountInfo;
- (CKContainer)container;
- (Class)nsnotificationCenterClass;
- (KTCondition)ckAccountInfoInitialized;
- (KTCondition)finishedInitialDispatches;
- (KTNearFutureScheduler)fetchCKAccountStatusScheduler;
- (NSMapTable)ckChangeListeners;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)checkForAllDeliveries;
- (id)descriptionInternal:(id)a3;
- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4;
- (id)notifyCKAccountStatusChange:(id)a3;
- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3;
- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4;
- (void)_onqueueDeliverCurrentCloudKitState:(id)a3 listenerQueue:(id)a4 oldStatus:(id)a5 group:(id)a6;
- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4;
- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4;
- (void)dealloc;
- (void)notifyCKAccountStatusChangeAndWaitForSignal;
- (void)performInitialDispatches;
- (void)recheckCKAccountStatus;
- (void)setCkAccountInfoInitialized:(id)a3;
- (void)setCkChangeListeners:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentCKAccountInfo:(id)a3;
- (void)setFinishedInitialDispatches:(id)a3;
- (void)setFirstCKAccountFetch:(BOOL)a3;
- (void)setForceReload:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation KTAccountStateTracker

- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4
{
  id v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___KTAccountStateTracker;
  v8 = -[KTAccountStateTracker init](&v29, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nsnotificationCenterClass, a4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    ckChangeListeners = v9->_ckChangeListeners;
    v9->_ckChangeListeners = (NSMapTable *)v10;

    currentCKAccountInfo = v9->_currentCKAccountInfo;
    v9->_currentCKAccountInfo = 0LL;

    v13 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    ckAccountInfoInitialized = v9->_ckAccountInfoInitialized;
    v9->_ckAccountInfoInitialized = v13;

    objc_storeStrong((id *)&v9->_container, a3);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("ck-account-state", v16);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v17;

    *(_WORD *)&v9->_firstCKAccountFetch = 0;
    v9->_reloadLock._os_unfair_lock_opaque = 0;
    v19 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    finishedInitialDispatches = v9->_finishedInitialDispatches;
    v9->_finishedInitialDispatches = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class defaultCenter]( -[KTAccountStateTracker nsnotificationCenterClass](v9, "nsnotificationCenterClass"),  "defaultCenter"));
    if (qword_1002EEAB0 != -1) {
      dispatch_once(&qword_1002EEAB0, &stru_100285400);
    }
    v22 = (os_log_s *)qword_1002EEAB8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Registering with notification center %@",  buf,  0xCu);
    }

    [v21 addObserver:v9 selector:"notifyCKAccountStatusChange:" name:CKAccountChangedNotification object:0];
    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, v9);
    v23 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100167444;
    v27[3] = &unk_100276D20;
    objc_copyWeak(&v28, (id *)buf);
    v24 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v23,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"ckstatus-refetch",  5000000000LL,  600000000000LL,  0LL,  0LL,  v27,  1.1);
    fetchCKAccountStatusScheduler = v9->_fetchCKAccountStatusScheduler;
    v9->_fetchCKAccountStatusScheduler = v24;

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

- (void)performInitialDispatches
{
  v3 = objc_autoreleasePoolPush();
  id v4 = -[KTAccountStateTracker notifyCKAccountStatusChange:](self, "notifyCKAccountStatusChange:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker finishedInitialDispatches](self, "finishedInitialDispatches"));
  [v5 fulfill];

  objc_autoreleasePoolPop(v3);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class defaultCenter]( -[KTAccountStateTracker nsnotificationCenterClass](self, "nsnotificationCenterClass"),  "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KTAccountStateTracker;
  -[KTAccountStateTracker dealloc](&v4, "dealloc");
}

- (id)descriptionInternal:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@: %@>", v4, v5));

  return v6;
}

- (NSString)description
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker descriptionInternal:](self, "descriptionInternal:", v4));

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___KTAccountStateTracker;
  id v3 = -[KTAccountStateTracker description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker descriptionInternal:](self, "descriptionInternal:", v4));

  return (NSString *)v5;
}

- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100167764;
  block[3] = &unk_100279558;
  block[4] = self;
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
  id location = 0LL;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100167D68;
  v17[3] = &unk_1002854C8;
  objc_copyWeak(&v19, &location);
  v6 = v5;
  v18 = v6;
  objc_super v7 = objc_retainBlock(v17);
  os_unfair_lock_lock(&self->_reloadLock);
  unsigned int v8 = -[KTAccountStateTracker forceReload](self, "forceReload");
  -[KTAccountStateTracker setForceReload:](self, "setForceReload:", 0LL);
  os_unfair_lock_unlock(&self->_reloadLock);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker container](self, "container"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100168120;
    v13[3] = &unk_100285510;
    objc_copyWeak(&v16, &location);
    v14 = v6;
    dispatch_queue_attr_t v15 = v7;
    [v9 reloadAccountWithCompletionHandler:v13];

    objc_destroyWeak(&v16);
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker container](self, "container"));
    [v10 accountInfoWithCompletionHandler:v7];
  }

  v11 = v6;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4
{
  id v6 = a3;
  objc_super v7 = (dispatch_semaphore_s *)a4;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = dispatch_group_create();
  if (v9)
  {
    -[KTAccountStateTracker _onqueueUpdateAccountState:dispatchGroup:]( self,  "_onqueueUpdateAccountState:dispatchGroup:",  v6,  v9);
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10016846C;
    block[3] = &unk_100276740;
    id v13 = v7;
    dispatch_group_notify(v9, v10, block);
  }

  else
  {
    if (qword_1002EEAB0 != -1) {
      dispatch_once(&qword_1002EEAB0, &stru_100285530);
    }
    v11 = (os_log_s *)qword_1002EEAB8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAB8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Unable to get dispatch group.", buf, 2u);
    }

    dispatch_semaphore_signal(v7);
  }
}

- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  unsigned int v10 = [v9 isEqual:v6];

  if (!v10)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
    v18 = (void *)v17;
    if (!v6 || v17)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
      if ((id)v19 == v6)
      {

LABEL_16:
        goto LABEL_17;
      }

      v20 = (void *)v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
      unsigned __int8 v22 = [v21 isEqual:v6];

      if ((v22 & 1) != 0) {
        goto LABEL_17;
      }
    }

    if (qword_1002EEAB0 != -1) {
      dispatch_once(&qword_1002EEAB0, &stru_100285570);
    }
    v23 = (void *)qword_1002EEAB8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAB8, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker container](self, "container"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 options]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accountOverrideInfo]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 altDSID]);
      int v30 = 138412546;
      v31 = v28;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "moving to CK Account info(altDSID: %@): %@",  (uint8_t *)&v30,  0x16u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
    -[KTAccountStateTracker setCurrentCKAccountInfo:](self, "setCurrentCKAccountInfo:", v6);
    objc_super v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker ckAccountInfoInitialized](self, "ckAccountInfoInitialized"));
    [v29 fulfill];

    -[KTAccountStateTracker _onqueueDeliverCloudKitStateChanges:dispatchGroup:]( self,  "_onqueueDeliverCloudKitStateChanges:dispatchGroup:",  v18,  v7);
    goto LABEL_16;
  }

  if (qword_1002EEAB0 != -1) {
    dispatch_once(&qword_1002EEAB0, &stru_100285550);
  }
  v11 = (void *)qword_1002EEAB8;
  if (os_log_type_enabled((os_log_t)qword_1002EEAB8, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker container](self, "container"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 options]);
    dispatch_queue_attr_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountOverrideInfo]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 altDSID]);
    int v30 = 138412546;
    v31 = v16;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "received another notification of CK Account State(altDSID: %@) %@",  (uint8_t *)&v30,  0x16u);
  }

- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker ckChangeListeners](self, "ckChangeListeners"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyEnumerator]);

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker ckChangeListeners](self, "ckChangeListeners"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

      -[KTAccountStateTracker _onqueueDeliverCurrentCloudKitState:listenerQueue:oldStatus:group:]( self,  "_onqueueDeliverCurrentCloudKitState:listenerQueue:oldStatus:group:",  v13,  v11,  v15,  v6);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 nextObject]);

      v11 = (void *)v14;
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
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id location = 0LL;
  objc_initWeak(&location, v13);

  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001689EC;
    v15[3] = &unk_100276C18;
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
  p_reloadLock = &self->_reloadLock;
  os_unfair_lock_lock(&self->_reloadLock);
  -[KTAccountStateTracker setForceReload:](self, "setForceReload:", 1LL);
  os_unfair_lock_unlock(p_reloadLock);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker fetchCKAccountStatusScheduler](self, "fetchCKAccountStatusScheduler"));
  [v4 trigger];
}

- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3
{
  id v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[KTAccountStateTracker notifyCKAccountStatusChange:]( self,  "notifyCKAccountStatusChange:",  0LL));
  dispatch_time_t v5 = dispatch_time(0LL, a3);
  LOBYTE(a3) = dispatch_semaphore_wait(v4, v5) == 0;

  return a3;
}

- (void)notifyCKAccountStatusChangeAndWaitForSignal
{
}

- (id)checkForAllDeliveries
{
  dispatch_group_t v3 = dispatch_group_create();
  if (v3)
  {
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100168C40;
    v9[3] = &unk_1002777A0;
    v9[4] = self;
    dispatch_time_t v5 = v3;
    uint64_t v10 = v5;
    dispatch_sync(v4, v9);

    id v6 = v5;
  }

  else
  {
    if (qword_1002EEAB0 != -1) {
      dispatch_once(&qword_1002EEAB0, &stru_100285590);
    }
    id v7 = (os_log_s *)qword_1002EEAB8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAB8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Unable to get dispatch group.", buf, 2u);
    }
  }

  return v3;
}

- (KTCondition)finishedInitialDispatches
{
  return (KTCondition *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFinishedInitialDispatches:(id)a3
{
}

- (CKAccountInfo)currentCKAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCurrentCKAccountInfo:(id)a3
{
}

- (KTCondition)ckAccountInfoInitialized
{
  return (KTCondition *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCkAccountInfoInitialized:(id)a3
{
}

- (KTNearFutureScheduler)fetchCKAccountStatusScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 40LL, 1);
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 48LL, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMapTable)ckChangeListeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCkChangeListeners:(id)a3
{
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setContainer:(id)a3
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

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (void).cxx_destruct
{
}

@end