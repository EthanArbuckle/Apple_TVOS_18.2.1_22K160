@interface PDCloudStoreTransactionSourceController
- (PDCloudStoreTransactionSourceController)initWithDatabaseManager:(id)a3 accountManager:(id)a4 peerPaymentWebServiceCoordinator:(id)a5 cloudStoreNotificationCoordinator:(id)a6;
- (void)_hasScheduledActivityWithCompletion:(id)a3;
- (void)_queue_allRelevantTransactionSourceIdentifiersWithCompletion:(id)a3;
- (void)_queue_backgroundRecordChangeSyncWithCompletion:(id)a3;
- (void)_queue_filterRelevantTransactionSourceIdentifiersThatCanSyncWithCloudKit:(id)a3 completion:(id)a4;
- (void)_queue_performDailyTransactionSyncFromDate:(id)a3 returnRecords:(BOOL)a4 formReport:(BOOL)a5 completion:(id)a6;
- (void)_queue_relevantTransactionSourceIdentifiersToSyncForPaymentApplication:(id)a3 onPaymentPass:(id)a4 completion:(id)a5;
- (void)_scheduleActivityWithIdentifier:(id)a3;
- (void)_updateScheduledActivityIfNeccessary;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)didAddPaymentApplication:(id)a3 forPaymentPass:(id)a4;
- (void)didAddPaymentApplication:(id)a3 forPaymentPass:(id)a4 groupNameSuffix:(id)a5 ignoreExistingRecordHash:(BOOL)a6 completion:(id)a7;
- (void)passDidDisappear:(id)a3;
- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3;
- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PDCloudStoreTransactionSourceController

- (PDCloudStoreTransactionSourceController)initWithDatabaseManager:(id)a3 accountManager:(id)a4 peerPaymentWebServiceCoordinator:(id)a5 cloudStoreNotificationCoordinator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDCloudStoreTransactionSourceController;
  v15 = -[PDCloudStoreTransactionSourceController init](&v23, "init");
  if (v15)
  {
    v15->_isInternalBuild = os_variant_has_internal_ui(PKOSVariantSubsystem);
    objc_storeStrong((id *)&v15->_databaseManager, a3);
    objc_storeStrong((id *)&v15->_accountManager, a4);
    -[PDAccountManager registerObserver:](v15->_accountManager, "registerObserver:", v15);
    objc_storeStrong((id *)&v15->_peerPaymentWebServiceCoordinator, a5);
    -[PDPeerPaymentWebServiceCoordinator registerObserver:]( v15->_peerPaymentWebServiceCoordinator,  "registerObserver:",  v15);
    objc_storeStrong((id *)&v15->_cloudStoreNotificationCoordinator, a6);
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passd.CloudStoreTransactionSourceController.work", v17);
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passd.CloudStoreTransactionSourceController.reply", v17);
    replyQueue = v15->_replyQueue;
    v15->_replyQueue = (OS_dispatch_queue *)v20;

    PDScheduledActivityClientRegister(@"CloudStoreTransactionSourceClientIdentifier", v15, v15->_workQueue);
    -[PDCloudStoreTransactionSourceController _updateScheduledActivityIfNeccessary]( v15,  "_updateScheduledActivityIfNeccessary");
  }

  return v15;
}

- (void)_updateScheduledActivityIfNeccessary
{
  unsigned __int8 v3 = -[PDDatabaseManager hasAnyAccount](self->_databaseManager, "hasAnyAccount");
  unsigned __int8 v4 = -[PDDatabaseManager hasPeerPaymentAccount](self->_databaseManager, "hasPeerPaymentAccount");
  if ((v3 & 1) != 0 || (v4 & 1) != 0)
  {
    uint64_t v7 = PDScheduledActivityExists( @"CloudStoreTransactionSourceClientIdentifier",  @"CloudStoreTransactionSourceSync");
    if ((v7 & 1) == 0) {
      uint64_t v7 = (uint64_t)-[PDCloudStoreTransactionSourceController _scheduleActivityWithIdentifier:]( self,  "_scheduleActivityWithIdentifier:",  @"CloudStoreTransactionSourceSync");
    }
    if (PKIsWatch(v7)
      && (PDScheduledActivityExists( @"CloudStoreTransactionSourceClientIdentifier",  @"CloudStoreTransactionSourceBGRecordChanges") & 1) == 0)
    {
      -[PDCloudStoreTransactionSourceController _scheduleActivityWithIdentifier:]( self,  "_scheduleActivityWithIdentifier:",  @"CloudStoreTransactionSourceBGRecordChanges");
    }

    if (self->_isInternalBuild
      && (PDScheduledActivityExists( @"CloudStoreTransactionSourceClientIdentifier",  @"CloudStoreTransactionSourceChangeEventPurge") & 1) == 0)
    {
      -[PDCloudStoreTransactionSourceController _scheduleActivityWithIdentifier:]( self,  "_scheduleActivityWithIdentifier:",  @"CloudStoreTransactionSourceChangeEventPurge");
    }
  }

  else
  {
    PDScheduledActivityRemove( @"CloudStoreTransactionSourceClientIdentifier",  @"CloudStoreTransactionSourceSync");
    PDScheduledActivityRemove( @"CloudStoreTransactionSourceClientIdentifier",  @"CloudStoreTransactionSourceBGRecordChanges");
    PDScheduledActivityRemove( @"CloudStoreTransactionSourceClientIdentifier",  @"CloudStoreTransactionSourceChangeEventPurge");
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not scheduling CloudStoreTransactionSourceSync since there are no accounts on device",  v8,  2u);
    }
  }

- (void)_scheduleActivityWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKRandomIntegerInRange(18LL, 36LL);
  uint64_t v5 = PKRandomIntegerInRange(0LL, 60LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:(double)v5 * 60.0 + (double)v4 * 3600.0]);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v7));
  [v8 setRepeating:0];
  [v8 setRequireNetworkConnectivity:1];
  [v8 setRequireScreenSleep:1];
  [v8 setRequireMainsPower:1];
  PDScheduledActivityRegister(@"CloudStoreTransactionSourceClientIdentifier", v3, v8);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v3;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Scheduled %{public}@ with start time %{public}@",  (uint8_t *)&v11,  0x16u);
  }
}

- (void)didAddPaymentApplication:(id)a3 forPaymentPass:(id)a4
{
}

- (void)didAddPaymentApplication:(id)a3 forPaymentPass:(id)a4 groupNameSuffix:(id)a5 ignoreExistingRecordHash:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000EA6B8;
  v21[3] = &unk_100643428;
  id v22 = v12;
  id v23 = v13;
  BOOL v27 = a6;
  v24 = self;
  id v25 = v14;
  id v26 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async((dispatch_queue_t)workQueue, v21);
}

- (void)passDidDisappear:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 paymentPass]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedAccountServiceAccountIdentifier]);
  id v6 = [v5 length];

  if (v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EAE8C;
    block[3] = &unk_100639300;
    block[4] = self;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }

- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EAF3C;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EB1F8;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EB2AC;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000EB3A4;
  v8[3] = &unk_1006392B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workQueue, v8);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EB704;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EB764;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EB7C4;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDCloudStoreTransactionSourceController starting activity: %{public}@",  buf,  0xCu);
  }

  id v10 = (__CFString *)v6;
  int v11 = v10;
  if (v10 == @"CloudStoreTransactionSourceSync")
  {
LABEL_6:
    if (self->_performingBackgroundSync)
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_25;
      }

      *(_WORD *)buf = 0;
      id v13 = "A cloud store transaction background sync activity is already running";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_10;
    }

    self->_performingBackgrounduint64_t Sync = 1;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:-604800.0]);

    uint64_t Sync = PDCloudStoreTransactionSourceControllerLastSync();
    id v17 = (void *)objc_claimAutoreleasedReturnValue(Sync);
    if (v17)
    {
      id v18 = v17;
      if ([v17 compare:v15] != (id)-1)
      {
LABEL_24:
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_1000EBB64;
        v31[3] = &unk_10063F0A0;
        v31[4] = self;
        -[PDCloudStoreTransactionSourceController _queue_performDailyTransactionSyncFromDate:returnRecords:formReport:completion:]( self,  "_queue_performDailyTransactionSyncFromDate:returnRecords:formReport:completion:",  v18,  0LL,  1LL,  v31);

        goto LABEL_25;
      }

      id v19 = v15;

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v33 = v19;
        __int16 v34 = 2114;
        id v35 = v19;
        id v20 = "Last transaction record sync date defined is older than %{public}@. Setting last sync date as %{public}@";
        v21 = v9;
        uint32_t v22 = 22;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }

    else
    {
      id v26 = v15;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v33 = v26;
        id v20 = "No transaction record last sync date defined. Setting last sync date as %{public}@";
        v21 = v9;
        uint32_t v22 = 12;
        goto LABEL_22;
      }
    }

    id v18 = v15;
    goto LABEL_24;
  }

  if (v10)
  {
    unsigned int v12 = -[__CFString isEqualToString:]( v10,  "isEqualToString:",  @"CloudStoreTransactionSourceSync");

    if (v12) {
      goto LABEL_6;
    }
    id v23 = v11;
    if (v23 == @"CloudStoreTransactionSourceBGRecordChanges"
      || (v24 = v23,
          unsigned int v25 = -[__CFString isEqualToString:]( v23,  "isEqualToString:",  @"CloudStoreTransactionSourceBGRecordChanges"),  v24,  v25))
    {
      if (!self->_performingBackgroundRecordChangesSync)
      {
        self->_performingBackgroundRecordChangesuint64_t Sync = 1;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_1000EBE78;
        v30[3] = &unk_10063A790;
        v30[4] = self;
        -[PDCloudStoreTransactionSourceController _queue_backgroundRecordChangeSyncWithCompletion:]( self,  "_queue_backgroundRecordChangeSyncWithCompletion:",  v30);
        goto LABEL_25;
      }

      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      id v13 = "A cloud store background record changes sync is already running";
      goto LABEL_9;
    }

    BOOL v27 = v24;
    if (v27 == @"CloudStoreTransactionSourceChangeEventPurge"
      || (v28 = v27,
          unsigned int v29 = -[__CFString isEqualToString:]( v27,  "isEqualToString:",  @"CloudStoreTransactionSourceChangeEventPurge"),  v28,  v29))
    {
      -[PDDatabaseManager purgeOldCloudStoreContainerChangeEventEntires]( self->_databaseManager,  "purgeOldCloudStoreContainerChangeEventEntires");
      -[PDCloudStoreTransactionSourceController _updateScheduledActivityIfNeccessary]( self,  "_updateScheduledActivityIfNeccessary");
    }
  }

- (void)_queue_performDailyTransactionSyncFromDate:(id)a3 returnRecords:(BOOL)a4 formReport:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Running daily transaction sync task from date %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  if (v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator applePayContainer]( self->_cloudStoreNotificationCoordinator,  "applePayContainer"));
    id v15 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x3032000000LL;
    v32 = sub_1000EA960;
    id v33 = sub_1000EA970;
    id v34 = 0LL;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000EC188;
    v27[3] = &unk_10063BBC8;
    v27[4] = self;
    v27[5] = &buf;
    [v15 addOperation:v27];
    dispatch_queue_attr_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000EC3CC;
    v20[3] = &unk_1006434F0;
    v20[4] = self;
    p___int128 buf = &buf;
    id v17 = v14;
    id v21 = v17;
    id v22 = v10;
    BOOL v25 = a4;
    BOOL v26 = a5;
    id v23 = v11;
    id v18 = [v15 evaluateWithInput:v16 completion:v20];

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EC16C;
    block[3] = &unk_10063A830;
    id v29 = v11;
    dispatch_async((dispatch_queue_t)replyQueue, block);
    id v17 = v29;
  }
}

- (void)_queue_backgroundRecordChangeSyncWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Running background record change sync", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator applePayContainer]( self->_cloudStoreNotificationCoordinator,  "applePayContainer"));
  id v8 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  *(void *)__int128 buf = 0LL;
  v24 = buf;
  uint64_t v25 = 0x3032000000LL;
  BOOL v26 = sub_1000EA960;
  BOOL v27 = sub_1000EA970;
  id v28 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x3032000000LL;
  v21[3] = sub_1000EA960;
  void v21[4] = sub_1000EA970;
  id v22 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000EC8F4;
  v20[3] = &unk_10063BBC8;
  v20[4] = self;
  void v20[5] = buf;
  [v8 addOperation:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000ECB38;
  v16[3] = &unk_100643568;
  v16[4] = self;
  id v18 = buf;
  id v9 = v7;
  id v17 = v9;
  id v19 = v21;
  [v8 addOperation:v16];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000ECEBC;
  v13[3] = &unk_100643590;
  v13[4] = self;
  id v15 = v21;
  id v11 = v4;
  id v14 = v11;
  id v12 = [v8 evaluateWithInput:v10 completion:v13];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_queue_allRelevantTransactionSourceIdentifiersWithCompletion:(id)a3
{
  id v15 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x3032000000LL;
  v29[3] = sub_1000EA960;
  v29[4] = sub_1000EA970;
  v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 devicePrimaryPaymentApplication]);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1000ED2E8;
        v21[3] = &unk_1006433B0;
        void v21[4] = self;
        id v11 = v10;
        id v22 = v11;
        id v23 = v9;
        v24 = v29;
        [v4 addOperation:v21];
      }

      id v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v6);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000ED558;
  v20[3] = &unk_10063BBC8;
  v20[4] = self;
  void v20[5] = v29;
  [v4 addOperation:v20];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000ED840;
  v17[3] = &unk_100643590;
  v17[4] = self;
  id v19 = v29;
  id v13 = v15;
  id v18 = v13;
  id v14 = [v4 evaluateWithInput:v12 completion:v17];

  _Block_object_dispose(v29, 8);
}

- (void)_queue_relevantTransactionSourceIdentifiersToSyncForPaymentApplication:(id)a3 onPaymentPass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    if (v8 && v9)
    {
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v8 transactionSourceIdentifier]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedAccountServiceAccountIdentifier]);
      id v13 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v64[0] = 0LL;
      v64[1] = v64;
      v64[2] = 0x3032000000LL;
      v64[3] = sub_1000EA960;
      v64[4] = sub_1000EA970;
      id v65 = 0LL;
      v62[0] = 0LL;
      v62[1] = v62;
      v62[2] = 0x3032000000LL;
      v62[3] = sub_1000EA960;
      v62[4] = sub_1000EA970;
      id v63 = 0LL;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
      dispatch_queue_attr_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 organizationName]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Payment Pass: %@, %@",  v15,  v16));

      -[NSMutableDictionary safelySetObject:forKey:](v14, "safelySetObject:forKey:", v31, v32);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_1000EDE24;
      v57[3] = &unk_100643680;
      id v17 = v12;
      id v58 = v17;
      v59 = self;
      v61 = v62;
      id v18 = v9;
      id v60 = v18;
      [v13 addOperation:v57];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_1000EE3A4;
      v54[3] = &unk_10063CB08;
      id v19 = v18;
      id v55 = v19;
      v56 = self;
      [v13 addOperation:v54];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_1000EE56C;
      v50[3] = &unk_10063EC90;
      id v20 = v19;
      id v51 = v20;
      v52 = self;
      id v21 = v14;
      v53 = v21;
      [v13 addOperation:v50];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_1000EE790;
      v46[3] = &unk_10063EC90;
      id v22 = v17;
      id v47 = v22;
      v48 = self;
      id v23 = v21;
      v49 = v23;
      [v13 addOperation:v46];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_1000EEB4C;
      v41[3] = &unk_100643720;
      id v24 = v22;
      v45 = v62;
      id v42 = v24;
      v43 = self;
      __int128 v25 = v23;
      v44 = v25;
      [v13 addOperation:v41];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1000EEEA0;
      v37[3] = &unk_10063B5A8;
      __int128 v26 = v25;
      v38 = v26;
      v39 = self;
      v40 = v64;
      [v13 addOperation:v37];
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000EF128;
      v33[3] = &unk_100643770;
      v33[4] = self;
      id v34 = v20;
      v36 = v64;
      id v35 = v11;
      id v28 = [v13 evaluateWithInput:v27 completion:v33];

      _Block_object_dispose(v62, 8);
      _Block_object_dispose(v64, 8);

      id v29 = (void *)v32;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000EDE0C;
      block[3] = &unk_10063A830;
      id v67 = v10;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v29 = v67;
    }
  }
}

- (void)_queue_filterRelevantTransactionSourceIdentifiersThatCanSyncWithCloudKit:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator applePayContainer]( self->_cloudStoreNotificationCoordinator,  "applePayContainer"));
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_1000EA960;
  v23[4] = sub_1000EA970;
  id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000EF508;
  v18[3] = &unk_1006437E8;
  id v10 = v8;
  id v19 = v10;
  id v11 = v9;
  id v20 = v11;
  id v21 = self;
  id v22 = v23;
  [v6 enumerateKeysAndObjectsUsingBlock:v18];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000EF850;
  v15[3] = &unk_100643810;
  v15[4] = self;
  id v13 = v7;
  id v16 = v13;
  id v17 = v23;
  id v14 = [v10 evaluateWithInput:v12 completion:v15];

  _Block_object_dispose(v23, 8);
}

- (void)_hasScheduledActivityWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EF98C;
  block[3] = &unk_10063A830;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void).cxx_destruct
{
}

@end