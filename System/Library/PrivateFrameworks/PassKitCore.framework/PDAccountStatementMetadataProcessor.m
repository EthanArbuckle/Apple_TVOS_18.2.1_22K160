@interface PDAccountStatementMetadataProcessor
- (BOOL)_queue_isAccountEligible:(id)a3;
- (PDAccountStatementMetadataProcessor)initWithDatabaseManager:(id)a3 accountManager:(id)a4 cloudStoreNotificationCoordinator:(id)a5;
- (id)_queue_eligibleAccounts;
- (void)_addRequestToProcessQueue:(id)a3;
- (void)_executeNextRequestIfPossible;
- (void)_executeNextStatementMetadataProcessingRequest:(id)a3 completion:(id)a4;
- (void)_queue_updateScheduledActivityIfNeccessary;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 statementsChangedForAccountIdentifier:(id)a4;
- (void)passAdded:(id)a3;
- (void)passRemoved:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5;
@end

@implementation PDAccountStatementMetadataProcessor

- (PDAccountStatementMetadataProcessor)initWithDatabaseManager:(id)a3 accountManager:(id)a4 cloudStoreNotificationCoordinator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PDAccountStatementMetadataProcessor;
  v12 = -[PDAccountStatementMetadataProcessor init](&v26, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_accountManager, a4);
    objc_storeStrong((id *)&v13->_cloudStoreNotificationCoordinator, a5);
    -[PDAccountManager registerObserver:](v13->_accountManager, "registerObserver:", v13);
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    requestList = v13->_requestList;
    v13->_requestList = v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passd.PDAccountStatementMetadataProcessor.work", v17);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passd.PDAccountStatementMetadataProcessor.reply", v17);
    replyQueue = v13->_replyQueue;
    v13->_replyQueue = (OS_dispatch_queue *)v20;

    v13->_requestLock._os_unfair_lock_opaque = 0;
    v22 = (dispatch_queue_s *)v13->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100039910;
    block[3] = &unk_100639300;
    v25 = v13;
    dispatch_async(v22, block);
  }

  return v13;
}

- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[PDAccountStatementMetadataProcessorRequest initWithAccountIdentifier:statementIdentifier:reason:completion:]( objc_alloc(&OBJC_CLASS___PDAccountStatementMetadataProcessorRequest),  "initWithAccountIdentifier:statementIdentifier:reason:completion:",  v10,  v9,  1LL,  v8);

  -[PDAccountStatementMetadataProcessor _addRequestToProcessQueue:](self, "_addRequestToProcessQueue:", v11);
}

- (void)accountManager:(id)a3 statementsChangedForAccountIdentifier:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    v6 = -[PDAccountStatementMetadataProcessorRequest initWithAccountIdentifier:statementIdentifier:reason:completion:]( objc_alloc(&OBJC_CLASS___PDAccountStatementMetadataProcessorRequest),  "initWithAccountIdentifier:statementIdentifier:reason:completion:",  v5,  0LL,  0LL,  0LL);

    -[PDAccountStatementMetadataProcessor _addRequestToProcessQueue:](self, "_addRequestToProcessQueue:", v6);
  }

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039A80;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039AE0;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039B40;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)passAdded:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100039BC4;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)passRemoved:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100039CCC;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)_executeNextStatementMetadataProcessingRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039E00;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_runningScheduledActivity)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Not running AccountStatementMetadataActivity task since one is already running",  buf,  2u);
    }

- (void)_addRequestToProcessQueue:(id)a3
{
  id v4 = (os_log_s *)a3;
  if (v4)
  {
    id v5 = v4;
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Statement metadata process request incoming %@",  buf,  0xCu);
    }

    os_unfair_lock_lock(&self->_requestLock);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v8 = self->_requestList;
    id v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(os_log_s **)(*((void *)&v14 + 1) + 8LL * (void)i);
          if (-[os_log_s coalesceWithRequest:](v13, "coalesceWithRequest:", v5, (void)v14))
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              dispatch_queue_t v20 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Statement metadata process request coalesced onto %@",  buf,  0xCu);
            }

            id v7 = v5;
            goto LABEL_18;
          }
        }

        id v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v10) {
          continue;
        }
        break;
      }
    }

    -[NSMutableOrderedSet addObject:](self->_requestList, "addObject:", v5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Statement metadata process request queued %@",  buf,  0xCu);
    }

    id v8 = (NSMutableOrderedSet *)v5;
LABEL_18:

    os_unfair_lock_unlock(&self->_requestLock);
    -[PDAccountStatementMetadataProcessor _executeNextRequestIfPossible](self, "_executeNextRequestIfPossible");
  }

- (void)_executeNextRequestIfPossible
{
  p_requestLock = &self->_requestLock;
  os_unfair_lock_lock(&self->_requestLock);
  id v4 = self->_currentRequest;
  if (v4
    || (uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](self->_requestList, "firstObject"))) == 0)
  {
    os_unfair_lock_unlock(p_requestLock);
  }

  else
  {
    id v6 = (void *)v5;
    -[NSMutableOrderedSet removeObjectAtIndex:](self->_requestList, "removeObjectAtIndex:", 0LL);
    id v7 = v6;
    objc_storeStrong((id *)&self->_currentRequest, v6);
    os_unfair_lock_unlock(p_requestLock);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10003C524;
    v8[3] = &unk_10063BB28;
    v8[4] = self;
    id v9 = v7;
    id v4 = (PDAccountStatementMetadataProcessorRequest *)v7;
    -[PDAccountStatementMetadataProcessor _executeNextStatementMetadataProcessingRequest:completion:]( self,  "_executeNextStatementMetadataProcessingRequest:completion:",  v4,  v8);
  }
}

- (id)_queue_eligibleAccounts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager accounts](self->_databaseManager, "accounts"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003C6B4;
  v6[3] = &unk_10063BB50;
  v6[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsPassingTest:v6]);

  return v4;
}

- (BOOL)_queue_isAccountEligible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
  id v6 = (char *)[v4 type];
  uint64_t v7 = PKAccountTypeToString(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    __int128 v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Checking if accountID %@, type %@ is eligible for supportsStatementMetadata.",  (uint8_t *)&v16,  0x16u);
  }

  if ([v4 supportsStatementMetadata])
  {
    if (PKAccountStateIsTerminal([v4 state]))
    {
      BOOL v11 = 0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        __int128 v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        unsigned int v12 = "Account identifier: %@, type: %@, is not eligible for supportsStatementMetadata since state is terminal.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);
        BOOL v11 = 0;
      }
    }

    else if ((unint64_t)(v6 - 2) >= 2 && v6)
    {
      if (v6 == (char *)1)
      {
        databaseManager = self->_databaseManager;
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedPassUniqueID]);
        LOBYTE(databaseManager) = -[PDDatabaseManager passExistsWithUniqueID:]( databaseManager,  "passExistsWithUniqueID:",  v14);

        if ((databaseManager & 1) == 0)
        {
          BOOL v11 = 0;
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          int v16 = 138412546;
          __int128 v17 = v5;
          __int16 v18 = 2112;
          uint64_t v19 = v8;
          unsigned int v12 = "Account identifier: %@, type: %@, is not eligible for supportsStatementMetadata since there is no account on device.";
          goto LABEL_18;
        }
      }

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        __int128 v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Account identifier: %@, type: %@, is eligible for supportsStatementMetadata.",  (uint8_t *)&v16,  0x16u);
      }

      BOOL v11 = 1;
    }

    else
    {
      BOOL v11 = 0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        __int128 v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        unsigned int v12 = "Account identifier: %@, type: %@, is not eligible for supportsStatementMetadata since the account type is not supported.";
        goto LABEL_18;
      }
    }
  }

  else
  {
    BOOL v11 = 0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      __int128 v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      unsigned int v12 = "Account identifier: %@, type: %@, is not eligible for supportsStatementMetadata since its not a supported feature.";
      goto LABEL_18;
    }
  }

- (void)_queue_updateScheduledActivityIfNeccessary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountStatementMetadataProcessor _queue_eligibleAccounts](self, "_queue_eligibleAccounts"));
  id v4 = [v3 count];

  if (v4)
  {
    if (PDScheduledActivityExists( @"AccountStatementMetadataProcessor",  @"AccountStatementMetadataActivity"))
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        uint64_t v7 = "Not scheduling AccountStatementMetadataActivity since one already exists";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v15, 2u);
      }
    }

    else
    {
      uint64_t v9 = PKRandomIntegerInRange(18LL, 36LL);
      uint64_t v10 = PKRandomIntegerInRange(0LL, 60LL);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 dateByAddingTimeInterval:(double)v10 * 60.0 + (double)v9 * 3600.0]);

      PDScheduledActivityClientRegister(@"AccountStatementMetadataProcessor", self, self->_workQueue);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v6));
      [v12 setRepeating:0];
      [v12 setRequireNetworkConnectivity:1];
      [v12 setRequireScreenSleep:1];
      [v12 setRequireMainsPower:1];
      PDScheduledActivityRegister( @"AccountStatementMetadataProcessor",  @"AccountStatementMetadataActivity",  v12);
      uint64_t v13 = PKLogFacilityTypeGetObject(9LL);
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        int v16 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Scheduled AccountStatementMetadataActivity with start time %@",  (uint8_t *)&v15,  0xCu);
      }
    }
  }

  else
  {
    PDScheduledActivityRemove(@"AccountStatementMetadataProcessor", @"AccountStatementMetadataActivity");
    uint64_t v8 = PKLogFacilityTypeGetObject(14LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      uint64_t v7 = "Not scheduling AccountStatementMetadataActivity since there are no applicable accounts on device";
      goto LABEL_7;
    }
  }
}

- (void).cxx_destruct
{
}

@end