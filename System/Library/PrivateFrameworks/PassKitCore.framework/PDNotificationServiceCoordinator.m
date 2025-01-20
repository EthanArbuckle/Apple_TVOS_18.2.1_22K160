@interface PDNotificationServiceCoordinator
- (BOOL)_processMessageDictionary:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 performTruncation:(BOOL)a6;
- (BOOL)_processTransactionDictionary:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 performTruncation:(BOOL)a6 isInitialUpdate:(BOOL)a7;
- (BOOL)_validateBalanceResult:(id)a3;
- (BOOL)_validatePlanResult:(id)a3;
- (PDNotificationServiceCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 userNotificationManager:(id)a5 paymentTransactionProcessor:(id)a6 paymentWebServiceCoordinator:(id)a7;
- (PDPassTileManager)passTileManager;
- (id)_dictionaryKeyForTask:(id)a3;
- (id)_partnerAccountIdentifierWithPaymentApplication:(id)a3 passUniqueIdentifier:(id)a4;
- (id)_updatePaymentTransaction:(id)a3 withPassUniqueIdentifier:(id)a4 forPaymentApplication:(id)a5 insertionMode:(unint64_t)a6 performTruncation:(BOOL)a7;
- (id)pushNotificationTopics;
- (void)_cancelAllTasksForPaymentApplication:(id)a3 notificationService:(id)a4;
- (void)_clearStoredDataForPassUniqueIdentifier:(id)a3 notificationService:(id)a4;
- (void)_invokeAndClearHandlerForTask:(id)a3 withResult:(BOOL)a4;
- (void)_isMerchantTokenTransaction:(id)a3 forPass:(id)a4 completion:(id)a5;
- (void)_notificationUpdatesTaskSucceeded:(id)a3 withResult:(id)a4;
- (void)_performDeregistrationForPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 notificationService:(id)a5;
- (void)_performRegistrationForPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 notificationService:(id)a5 isInitialRegistration:(BOOL)a6;
- (void)_performRegistrationTaskForPaymentApplication:(id)a3 notificationService:(id)a4 completionTask:(id)a5;
- (void)_recalculatePushTopics;
- (void)_registrationTaskSucceeded:(id)a3 withAuthenticationToken:(id)a4;
- (void)_transactionAuthenticationTaskSucceeded:(id)a3 withResponse:(id)a4;
- (void)_updateRegistrationStatusForPass:(id)a3 notificationService:(id)a4 requestedRegistrationStatus:(unint64_t)a5 refreshRegistrationIfPossible:(BOOL)a6;
- (void)_updateRegistrationStatusForPass:(id)a3 notificationService:(id)a4 requestedRegistrationStatus:(unint64_t)a5 refreshRegistrationIfPossible:(BOOL)a6 requestUpdateWhenAlreadyRegistered:(BOOL)a7;
- (void)applyPushNotificationToken:(id)a3;
- (void)cancelAutoTopUpFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 accountIdentifier:(id)a5 balance:(id)a6 completion:(id)a7;
- (void)connect;
- (void)dealloc;
- (void)handleDeletionOfPass:(id)a3 withNotificationService:(id)a4;
- (void)handleInsertionOfPass:(id)a3 withNotificationService:(id)a4;
- (void)handlePostBalanceTaskWithNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 balance:(id)a7;
- (void)handlePushDisabledForPass:(id)a3 withNotificationService:(id)a4;
- (void)handlePushEnabledForPass:(id)a3 withNotificationService:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)handleUpdateOfPass:(id)a3 toPass:(id)a4 oldNotificationService:(id)a5 newNotificationService:(id)a6;
- (void)nukeTasks;
- (void)removeLowBalanceNotificationForBalance:(id)a3 withPassUniqueIdentifier:(id)a4;
- (void)requestUpdatesFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4;
- (void)requestUpdatesFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 forceUpdate:(BOOL)a5;
- (void)sendLowBalanceNotificationForBalance:(id)a3 withReminder:(id)a4 passUniqueIdentifier:(id)a5;
- (void)sendLowBalanceNotificationIfNecessaryForUpdatedBalances:(id)a3 startingBalances:(id)a4 passUniqueIdentifier:(id)a5;
- (void)setPassTileManager:(id)a3;
- (void)submitTransactionAuthenticationResultsData:(id)a3 signature:(id)a4 forPass:(id)a5 transactionServiceIdentifier:(id)a6 notificationService:(id)a7 completion:(id)a8;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4;
- (void)taskFailed:(id)a3;
- (void)taskRequestedReauthentication:(id)a3;
- (void)taskSucceeded:(id)a3;
- (void)updateLowBalanceNotificationForBalance:(id)a3 withPassUniqueIdentifier:(id)a4;
@end

@implementation PDNotificationServiceCoordinator

- (PDNotificationServiceCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 userNotificationManager:(id)a5 paymentTransactionProcessor:(id)a6 paymentWebServiceCoordinator:(id)a7
{
  id v28 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PDNotificationServiceCoordinator;
  v17 = -[PDNotificationServiceCoordinator init](&v29, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    objc_storeStrong((id *)&v18->_userNotificationManager, a5);
    objc_storeStrong((id *)&v18->_paymentTransactionProcessor, a6);
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a7);
    v19 = objc_alloc_init(&OBJC_CLASS___PKSecureElement);
    secureElement = v18->_secureElement;
    v18->_secureElement = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    taskToHandlerMap = v18->_taskToHandlerMap;
    v18->_taskToHandlerMap = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    taskToResponseMap = v18->_taskToResponseMap;
    v18->_taskToResponseMap = v23;

    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    taskToErrorMap = v18->_taskToErrorMap;
    v18->_taskToErrorMap = v25;

    -[PDDatabaseManager setNotificationServicesDelegate:]( v18->_databaseManager,  "setNotificationServicesDelegate:",  v18);
  }

  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDNotificationServiceCoordinator;
  -[PDNotificationServiceCoordinator dealloc](&v3, "dealloc");
}

- (void)connect
{
  if (!self->_taskManager)
  {
    objc_super v3 = -[PDNetworkTaskManager initWithDelegate:archiveName:]( objc_alloc(&OBJC_CLASS___PDNetworkTaskManager),  "initWithDelegate:archiveName:",  self,  @"NotificationServiceTasks");
    taskManager = self->_taskManager;
    self->_taskManager = v3;
  }

- (void)nukeTasks
{
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing all notification service tasks",  v5,  2u);
  }

  -[PDNetworkTaskManager nukeArchive](self->_taskManager, "nukeArchive");
}

- (void)applyPushNotificationToken:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager notificationServices](self->_databaseManager, "notificationServices"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100077FF4;
    v6[3] = &unk_10063E030;
    id v7 = v5;
    v8 = self;
    [v4 enumerateObjectsUsingBlock:v6];
  }
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v58 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDNotificationServiceCoordinator: processing push for topic %@.",  buf,  0xCu);
  }

  v34 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v36 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager notificationServicesForPushTopic:]( self->_databaseManager,  "notificationServicesForPushTopic:",  v6));
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = v10;
  id v40 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v53;
    v39 = v8;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v11;
        v12 = *(void **)(*((void *)&v52 + 1) + 8 * v11);
        context = objc_autoreleasePoolPush();
        id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesForNotificationService:]( self->_databaseManager,  "passesForNotificationService:",  v12));
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        id v15 = [v14 countByEnumeratingWithState:&v48 objects:v63 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v49;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v49 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
              if ([v19 passType] == (id)1)
              {
                uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 partnerAccountIdentifier]);
                v21 = (void *)v20;
                if (v20) {
                  v22 = (void *)v20;
                }
                else {
                  v22 = v9;
                }
                -[NSMutableSet addObject:](v13, "addObject:", v22);
              }

              else
              {
                -[NSMutableSet addObject:](v13, "addObject:", v9);
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v48 objects:v63 count:16];
          }

          while (v16);
        }

        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v14 count];
          v24 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceURL]);
          *(_DWORD *)buf = 134218498;
          id v58 = v23;
          __int16 v59 = 2112;
          v60 = v14;
          __int16 v61 = 2112;
          v62 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDNotificationServiceCoordinator: matched %lu passes (%@) for service url %@.",  buf,  0x20u);
        }

        v41 = v14;

        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        v25 = v13;
        id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v44,  v56,  16LL);
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v45;
          do
          {
            for (j = 0LL; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v45 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)j);
              if (v30 == v9) {
                v30 = 0LL;
              }
              taskManager = self->_taskManager;
              id v32 = v30;
              v33 = (void *)objc_claimAutoreleasedReturnValue( +[PDNotificationServiceGetUpdatesTask getUpdatesTaskWithNotificationService:accountIdentifier:]( &OBJC_CLASS___PDNotificationServiceGetUpdatesTask,  "getUpdatesTaskWithNotificationService:accountIdentifier:",  v12,  v32));
              -[PDNetworkTaskManager performTask:](taskManager, "performTask:", v33);
            }

            id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v44,  v56,  16LL);
          }

          while (v27);
        }

        objc_autoreleasePoolPop(context);
        uint64_t v11 = v43 + 1;
        v8 = v39;
      }

      while ((id)(v43 + 1) != v40);
      id v40 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
    }

    while (v40);
  }

  objc_autoreleasePoolPop(v34);
}

- (id)pushNotificationTopics
{
  if (!self->_pushTopics)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager notificationServices](self->_databaseManager, "notificationServices"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000786AC;
    v12[3] = &unk_10063E030;
    v12[4] = self;
    id v5 = v3;
    id v13 = v5;
    [v4 enumerateObjectsUsingBlock:v12];

    pushTopics = self->_pushTopics;
    self->_pushTopics = v5;
    id v7 = v5;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_pushTopics;
    *(_DWORD *)buf = 138412290;
    id v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Enabled Notification Services Push Topics: %@",  buf,  0xCu);
  }

  return self->_pushTopics;
}

- (void)handlePushEnabledForPass:(id)a3 withNotificationService:(id)a4
{
}

- (void)handlePushDisabledForPass:(id)a3 withNotificationService:(id)a4
{
}

- (void)handleInsertionOfPass:(id)a3 withNotificationService:(id)a4
{
}

- (void)handleDeletionOfPass:(id)a3 withNotificationService:(id)a4
{
}

- (void)handleUpdateOfPass:(id)a3 toPass:(id)a4 oldNotificationService:(id)a5 newNotificationService:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11 && ([v11 matchesNotificationService:v12] & 1) == 0) {
    -[PDNotificationServiceCoordinator _updateRegistrationStatusForPass:notificationService:requestedRegistrationStatus:refreshRegistrationIfPossible:]( self,  "_updateRegistrationStatusForPass:notificationService:requestedRegistrationStatus:refreshRegistrationIfPossible:",  v25,  v11,  2LL,  0LL);
  }
  if (v12)
  {
    if ([v12 serviceType])
    {
      uint64_t v13 = 0LL;
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v25 paymentPass]);
      HIDWORD(v24) = [v14 supportsDPANNotifications];

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v25 paymentPass]);
      LODWORD(v24) = [v15 supportsFPANNotifications];

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentPass]);
      LODWORD(v15) = [v16 supportsDPANNotifications];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentPass]);
      unsigned int v18 = [v17 supportsFPANNotifications];

      v19 = (void *)objc_claimAutoreleasedReturnValue([v25 paymentPass]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
      unsigned int v21 = [v19 hasActiveVirtualCardAccordingToWebService:v20];

      v22 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentPass]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
      LODWORD(v14) = [v22 hasActiveVirtualCardAccordingToWebService:v23];

      uint64_t v13 = HIDWORD(v24) ^ v15 | v24 ^ v18 | v14 & ~v21;
    }

    -[PDNotificationServiceCoordinator _updateRegistrationStatusForPass:notificationService:requestedRegistrationStatus:refreshRegistrationIfPossible:]( self,  "_updateRegistrationStatusForPass:notificationService:requestedRegistrationStatus:refreshRegistrationIfPossible:",  v10,  v12,  1LL,  v13,  v24);
  }
}

- (void)cancelAutoTopUpFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 accountIdentifier:(id)a5 balance:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager primaryPaymentApplicationForPassUniqueIdentifier:]( self->_databaseManager,  "primaryPaymentApplicationForPassUniqueIdentifier:",  v13));
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dpanIdentifier]);
    if (v18)
    {
      unint64_t v19 = -[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "registrationStatusForNotificationServiceType:passUniqueIdentifier:",  [v12 serviceType],  v13);
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v19 == 1)
      {
        v36 = v17;
        if (v22)
        {
          *(_DWORD *)buf = 134218754;
          uint64_t v43 = 1LL;
          __int16 v44 = 2112;
          unint64_t v45 = (unint64_t)v13;
          __int16 v46 = 2112;
          __int128 v47 = v18;
          __int16 v48 = 2112;
          id v49 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Registration status: %lu - Perform cancel auto top up task for pass: %@, DPAN ID: %@, and notification service: [%@]",  buf,  0x2Au);
        }

        id v35 = (void *)objc_claimAutoreleasedReturnValue( +[PDNotificationServicePostBalanceTask postBalanceTaskWithNotificationService:dpanIdentifier:accountIdentifier:transactionSequenceNumber:autoTopUpDisabled:balance:]( &OBJC_CLASS___PDNotificationServicePostBalanceTask,  "postBalanceTaskWithNotificationService:dpanIdentifier:accountIdentifier:transactionSequenceNum ber:autoTopUpDisabled:balance:",  v12,  v18,  v14,  0LL,  1LL,  v15));
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceCoordinator _dictionaryKeyForTask:](self, "_dictionaryKeyForTask:", v35));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_100078CE0;
        v37[3] = &unk_10063E058;
        id v41 = v16;
        v37[4] = self;
        id v38 = v23;
        id v39 = v15;
        id v40 = v13;
        id v24 = v23;
        id v34 = v14;
        id v25 = objc_retainBlock(v37);
        taskToHandlerMap = self->_taskToHandlerMap;
        id v27 = v18;
        id v28 = v15;
        objc_super v29 = objc_retainBlock(v25);
        -[NSMutableDictionary setObject:forKey:](taskToHandlerMap, "setObject:forKey:", v29, v24);

        id v15 = v28;
        unsigned int v18 = v27;
        -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v35);

        id v14 = v34;
        uint64_t v17 = v36;
        goto LABEL_15;
      }

      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = (uint64_t)v13;
        __int16 v44 = 2048;
        unint64_t v45 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Cannot perform cancel auto top up task for pass: %@, registration status: %lu",  buf,  0x16u);
      }

      if (!v16) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v32 = PKLogFacilityTypeGetObject(6LL);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = (uint64_t)v13;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Cannot perform cancel auto top up task for pass: %@, no DPAN Identifier",  buf,  0xCu);
      }

      if (!v16) {
        goto LABEL_15;
      }
    }

    (*((void (**)(id, void))v16 + 2))(v16, 0LL);
LABEL_15:

    goto LABEL_16;
  }

  uint64_t v30 = PKLogFacilityTypeGetObject(6LL);
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v43 = (uint64_t)v13;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Cannot perform cancel auto top up task for pass: %@, no notification service",  buf,  0xCu);
  }

  if (v16) {
    (*((void (**)(id, void))v16 + 2))(v16, 0LL);
  }
LABEL_16:
}

- (void)handlePostBalanceTaskWithNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 balance:(id)a7
{
  id v12 = a3;
  id v13 = (os_log_s *)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager primaryPaymentApplicationForPassUniqueIdentifier:]( self->_databaseManager,  "primaryPaymentApplicationForPassUniqueIdentifier:",  v13));
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dpanIdentifier]);
    id v27 = v14;
    if (v18)
    {
      unint64_t v19 = -[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "registrationStatusForNotificationServiceType:passUniqueIdentifier:",  [v12 serviceType],  v13);
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        unint64_t v29 = v19;
        __int16 v30 = 2112;
        v31 = v13;
        __int16 v32 = 2112;
        v33 = v18;
        __int16 v34 = 2112;
        id v35 = v15;
        __int16 v36 = 2112;
        id v37 = v16;
        __int16 v38 = 2112;
        id v39 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Registration status: %lu - Perform post balance task for pass: %@, DPAN ID: %@, transactionSequenceNumber %@, balance, %@, and notification service: [%@]",  buf,  0x3Eu);
      }

      BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[PDNotificationServicePostBalanceTask postBalanceTaskWithNotificationService:dpanIdentifier:accountIdentifier:transactionSequenceNumber:autoTopUpDisabled:balance:]( &OBJC_CLASS___PDNotificationServicePostBalanceTask,  "postBalanceTaskWithNotificationService:dpanIdentifier:accountIdentifier:transactionSequenceN umber:autoTopUpDisabled:balance:",  v12,  v18,  v14,  v15,  0LL,  v16));
      if (v19 == 1)
      {
        -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v22);
      }

      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v29 = (unint64_t)v13;
          __int16 v30 = 2112;
          v31 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Register pass with unique identifier: %@ and post balance completion task: [%@]",  buf,  0x16u);
        }

        id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 pushToken]);
        if (!v25)
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDPushNotificationManager pushToken](self->_pushNotificationManager, "pushToken"));
          [v12 setPushToken:v26];

          -[PDDatabaseManager updateNotificationService:](self->_databaseManager, "updateNotificationService:", v12);
        }

        -[PDNotificationServiceCoordinator _performRegistrationTaskForPaymentApplication:notificationService:completionTask:]( self,  "_performRegistrationTaskForPaymentApplication:notificationService:completionTask:",  v17,  v12,  v22);
      }
    }

    else
    {
      uint64_t v24 = PKLogFacilityTypeGetObject(6LL);
      BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v29 = (unint64_t)v13;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Cannot perform post balance task for pass: %@, no DPAN Identifier",  buf,  0xCu);
      }
    }

    id v14 = v27;
  }

  else
  {
    uint64_t v23 = PKLogFacilityTypeGetObject(6LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v29 = (unint64_t)v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "Cannot perform post balance task for pass: %@, no notification service",  buf,  0xCu);
    }
  }
}

- (void)task:(id)a3 gotResult:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = (void *)PDOSTransactionCreate("PDNotificationServiceCoordinator");
  v8 = objc_autoreleasePoolPush();
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceRegistrationTask, v9);
  if ((objc_opt_isKindOfClass(v15, v10) & 1) != 0)
  {
    if ([v15 requestedStatus] == (id)1) {
      -[PDNotificationServiceCoordinator _registrationTaskSucceeded:withAuthenticationToken:]( self,  "_registrationTaskSucceeded:withAuthenticationToken:",  v15,  v6);
    }
  }

  else
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceGetUpdatesTask, v11);
    if ((objc_opt_isKindOfClass(v15, v12) & 1) != 0)
    {
      -[PDNotificationServiceCoordinator _notificationUpdatesTaskSucceeded:withResult:]( self,  "_notificationUpdatesTaskSucceeded:withResult:",  v15,  v6);
    }

    else
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceTransactionAuthenticationTask, v13);
      if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
        -[PDNotificationServiceCoordinator _transactionAuthenticationTaskSucceeded:withResponse:]( self,  "_transactionAuthenticationTaskSucceeded:withResponse:",  v15,  v6);
      }
    }
  }

  objc_autoreleasePoolPop(v8);
}

- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4
{
  id v6 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    double v12 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ will retry after %g seconds",  (uint8_t *)&v9,  0x16u);
  }

  -[PDNotificationServiceCoordinator _invokeAndClearHandlerForTask:withResult:]( self,  "_invokeAndClearHandlerForTask:withResult:",  v6,  0LL);
}

- (void)taskSucceeded:(id)a3
{
}

- (void)taskFailed:(id)a3
{
}

- (void)task:(id)a3 encounteredError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = PDErrorDescription(v7);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138412290;
    id v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[PDNotificationServiceCoordinator _dictionaryKeyForTask:](self, "_dictionaryKeyForTask:", v6));
  uint64_t v13 = (void *)v12;
  if (v7 && v12) {
    -[NSMutableDictionary setObject:forKey:](self->_taskToErrorMap, "setObject:forKey:", v7, v12);
  }
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
}

- (void)taskRequestedReauthentication:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceGetUpdatesTask, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___PDNotificationServicePostBalanceTask, v7),
        (objc_opt_isKindOfClass(v4, v8) & 1) != 0))
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceGetSpecificUpdatesTask, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___PDNotificationServicePostBalanceTask, v10);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) == 0)
      {
        int v14 = 0LL;
        goto LABEL_11;
      }
    }

    databaseManager = self->_databaseManager;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 dpanIdentifier]);
    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationWithDPANIdentifier:]( databaseManager,  "paymentApplicationWithDPANIdentifier:",  v13));

    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 dpanIdentifier]);
      int v23 = 138412290;
      id v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Re-Authenticating for dpanIdentifier: %@",  (uint8_t *)&v23,  0xCu);
    }
  }

  else
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceTransactionAuthenticationTask, v7);
    if ((objc_opt_isKindOfClass(v4, v18) & 1) == 0) {
      goto LABEL_14;
    }
    unint64_t v19 = self->_databaseManager;
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 dpanIdentifier]);
    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationWithDPANIdentifier:]( v19,  "paymentApplicationWithDPANIdentifier:",  v16));
  }

LABEL_11:
  uint64_t v20 = PKLogFacilityTypeGetObject(6LL);
  unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Re-Authenticating due to Request from Previous Task:%@",  (uint8_t *)&v23,  0xCu);
  }

  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationService]);
  -[PDNotificationServiceCoordinator _performRegistrationTaskForPaymentApplication:notificationService:completionTask:]( self,  "_performRegistrationTaskForPaymentApplication:notificationService:completionTask:",  v14,  v22,  v4);

LABEL_14:
}

- (void)requestUpdatesFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4
{
}

- (void)requestUpdatesFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 forceUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager primaryPaymentApplicationForPassUniqueIdentifier:]( self->_databaseManager,  "primaryPaymentApplicationForPassUniqueIdentifier:",  v9));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dpanIdentifier]);
    if ((id)-[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "registrationStatusForNotificationServiceType:passUniqueIdentifier:",  [v8 serviceType],  v9) == (id)1)
    {
      id v12 = [v8 serviceType];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager lastUpdatedDateForNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "lastUpdatedDateForNotificationServiceType:passUniqueIdentifier:",  v12,  v9));
      int v14 = v13;
      if (!v13
        || (id v15 = [v13 timeIntervalSinceNow], fabs(v16) > 86400.0)
        || (PKDisableNotificationPullTimeout(v15) & 1) != 0
        || v5)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager lastUpdatedTagForNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "lastUpdatedTagForNotificationServiceType:passUniqueIdentifier:",  v12,  v9));
        if (v11)
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceCoordinator _partnerAccountIdentifierWithPaymentApplication:passUniqueIdentifier:]( self,  "_partnerAccountIdentifierWithPaymentApplication:passUniqueIdentifier:",  v10,  v9));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
          unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 context]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 configuration]);

          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[PDNotificationServiceGetSpecificUpdatesTask getSpecificUpdatesTaskWithNotificationService:dpanIdentifier:credentialType:lastUpdatedTag:accountIdentifier:webServiceConfiguration:]( PDNotificationServiceGetSpecificUpdatesTask,  "getSpecificUpdatesTaskWithNotificationService:dpanIdentifier:credentialType:lastUpdatedTag:a ccountIdentifier:webServiceConfiguration:",  v8,  v11,  [v10 paymentNetworkIdentifier],  v17,  v27,  v20));
          -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v21);
        }
      }
    }

    else
    {
      taskManager = self->_taskManager;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100079B14;
      v28[3] = &unk_10063E0C0;
      id v23 = v8;
      id v29 = v23;
      id v30 = v11;
      if (!-[PDNetworkTaskManager containsTaskPassingTest:](taskManager, "containsTaskPassingTest:", v28))
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v9));
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v9;
          __int16 v33 = 2112;
          id v34 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Restarting Registration Task for Pass: %@ Notification Service: [%@]",  buf,  0x16u);
        }

        -[PDNotificationServiceCoordinator _updateRegistrationStatusForPass:notificationService:requestedRegistrationStatus:refreshRegistrationIfPossible:]( self,  "_updateRegistrationStatusForPass:notificationService:requestedRegistrationStatus:refreshRegistrationIfPossible:",  v24,  v23,  1LL,  0LL);
      }
    }
  }
}

- (void)submitTransactionAuthenticationResultsData:(id)a3 signature:(id)a4 forPass:(id)a5 transactionServiceIdentifier:(id)a6 notificationService:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = (void (**)(void, void, void))v19;
  if (v18)
  {
    databaseManager = self->_databaseManager;
    id v22 = [v18 serviceType];
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
    id v24 = -[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:]( databaseManager,  "registrationStatusForNotificationServiceType:passUniqueIdentifier:",  v22,  v23);

    if (v24 == (id)1)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceAccountIdentifier]);
      id v33 = v15;
      id v36 = v14;
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[PDNotificationServiceTransactionAuthenticationTask transactionAuthenticationTaskWithNotificationService:dpanIdentifier:transactionServiceIdentifier:authenticationResultsData:signature:]( &OBJC_CLASS___PDNotificationServiceTransactionAuthenticationTask,  "transactionAuthenticationTaskWithNotificationService:dpanIdentifier:transactionServiceIdentifier :authenticationResultsData:signature:",  v18,  v25,  v17,  v14,  v15));

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_100079E54;
      v37[3] = &unk_10063E0E8;
      id v38 = (id)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceCoordinator _dictionaryKeyForTask:](self, "_dictionaryKeyForTask:", v26));
      id v39 = v20;
      v37[4] = self;
      id v27 = v38;
      id v28 = objc_retainBlock(v37);
      taskToHandlerMap = self->_taskToHandlerMap;
      id v30 = objc_retainBlock(v28);
      -[NSMutableDictionary setObject:forKey:](taskToHandlerMap, "setObject:forKey:", v30, v27);

      -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v26);
LABEL_9:

      id v15 = v33;
      id v14 = v36;
      goto LABEL_10;
    }

    if (v20)
    {
      id v35 = v15;
      v31 = PKPassKitErrorDomain;
      NSErrorUserInfoKey v42 = NSDebugDescriptionErrorKey;
      uint64_t v43 = @"Transaction notification service is not registered.";
      id v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL,  v35,  v14);
      goto LABEL_8;
    }
  }

  else if (v19)
  {
    id v34 = v15;
    v31 = PKPassKitErrorDomain;
    NSErrorUserInfoKey v40 = NSDebugDescriptionErrorKey;
    id v41 = @"No notification service to submit authentication results for.";
    id v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL,  v34,  v14);
LABEL_8:
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v32);
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v31,  -1LL,  v26));
    ((void (**)(void, void, id))v20)[2](v20, 0LL, v27);
    goto LABEL_9;
  }

- (void)_updateRegistrationStatusForPass:(id)a3 notificationService:(id)a4 requestedRegistrationStatus:(unint64_t)a5 refreshRegistrationIfPossible:(BOOL)a6
{
}

- (void)_updateRegistrationStatusForPass:(id)a3 notificationService:(id)a4 requestedRegistrationStatus:(unint64_t)a5 refreshRegistrationIfPossible:(BOOL)a6 requestUpdateWhenAlreadyRegistered:(BOOL)a7
{
  BOOL v7 = a7;
  HIDWORD(v39) = a6;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 paymentPass]);
  __int16 v44 = v12;
  id v14 = [v12 serviceType];
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
  id v16 = self;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager primaryPaymentApplicationForPassUniqueIdentifier:]( self->_databaseManager,  "primaryPaymentApplicationForPassUniqueIdentifier:",  v15));
  uint64_t IsPersonalized = PKPaymentApplicationStateIsPersonalized([v17 state]);
  int v19 = IsPersonalized;
  if ((PKHandsOnDemoModeEnabled(IsPersonalized) & 1) != 0 || (PKUIOnlyDemoModeEnabled() & 1) != 0)
  {
    unint64_t v20 = 2LL;
  }

  else if (PKStoreDemoModeEnabled())
  {
    unint64_t v20 = 2LL;
  }

  else
  {
    unint64_t v20 = a5;
  }

  NSErrorUserInfoKey v42 = v17;
  uint64_t v43 = v13;
  LODWORD(v39) = v7;
  if (v14)
  {
    if (v14 == (id)1)
    {
      unsigned int v21 = v44 != 0LL;
      int v22 = -[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( v16->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  64LL,  v15);
      BOOL v23 = 0;
    }

    else
    {
      BOOL v23 = 0;
      int v22 = 0;
      unsigned int v21 = 0;
    }
  }

  else
  {
    else {
      unsigned int v21 = [v13 supportsFPANNotifications];
    }
    unsigned int v24 = -[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( v16->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  8LL,  v15,  v39);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v11 paymentPass]);
    id v26 = v11;
    unsigned int v27 = [v25 shouldIgnoreTransactionUpdatesSwitch];

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v13 transactionServiceRegistrationURL]);
    BOOL v23 = v28 != 0LL;

    int v22 = v24 | v27;
    id v11 = v26;
  }

  if (v19) {
    uint64_t v29 = v20;
  }
  else {
    uint64_t v29 = 2LL;
  }
  if (((v21 | v23) & v22) != 0) {
    unint64_t v30 = v29;
  }
  else {
    unint64_t v30 = 2LL;
  }
  unint64_t v31 = -[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:]( v16->_databaseManager,  "registrationStatusForNotificationServiceType:passUniqueIdentifier:",  objc_msgSend(v44, "serviceType", v39),  v15);
  if (v31) {
    unint64_t v32 = v31;
  }
  else {
    unint64_t v32 = 2LL;
  }
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    if (v32 > 2) {
      id v35 = 0LL;
    }
    else {
      id v35 = off_10063E2E8[v32];
    }
    if (v30 > 2) {
      id v36 = 0LL;
    }
    else {
      id v36 = off_10063E2E8[v30];
    }
    *(_DWORD *)buf = 138413058;
    __int16 v46 = v15;
    __int16 v47 = 2112;
    __int16 v48 = v44;
    __int16 v49 = 2112;
    __int128 v50 = v35;
    __int16 v51 = 2112;
    __int128 v52 = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Received registration status update request for Pass with Unique Identifier: %@ with Notification Service: [%@] from: %@ to %@",  buf,  0x2Au);
  }

  if (v30 == 2)
  {
    id v38 = v42;
    -[PDNotificationServiceCoordinator _cancelAllTasksForPaymentApplication:notificationService:]( v16,  "_cancelAllTasksForPaymentApplication:notificationService:",  v42,  v44);
    if (v32 == 1)
    {
      -[PDNotificationServiceCoordinator _performDeregistrationForPassUniqueIdentifier:paymentApplication:notificationService:]( v16,  "_performDeregistrationForPassUniqueIdentifier:paymentApplication:notificationService:",  v15,  v42,  v44);
      if (!PKPaymentApplicationStateIsSuspended([v42 state])) {
        -[PDNotificationServiceCoordinator _clearStoredDataForPassUniqueIdentifier:notificationService:]( v16,  "_clearStoredDataForPassUniqueIdentifier:notificationService:",  v15,  v44);
      }
    }
  }

  else
  {
    BOOL v37 = v30 == 1;
    id v38 = v42;
    if (v37)
    {
      if (v32 == 2 || v41)
      {
        -[PDNotificationServiceCoordinator _performRegistrationForPassUniqueIdentifier:paymentApplication:notificationService:isInitialRegistration:]( v16,  "_performRegistrationForPassUniqueIdentifier:paymentApplication:notificationService:isInitialRegistration:",  v15,  v42,  v44,  v32 == 2);
      }

      else if (v40)
      {
        -[PDNotificationServiceCoordinator requestUpdatesFromNotificationService:passUniqueIdenitifer:forceUpdate:]( v16,  "requestUpdatesFromNotificationService:passUniqueIdenitifer:forceUpdate:",  v44,  v15,  1LL);
      }
    }
  }
}

- (void)_performRegistrationForPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 notificationService:(id)a5 isInitialRegistration:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Attempting to register Pass with Unique Identifier: %@ with Notification Service: [%@]",  (uint8_t *)&v24,  0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager lastUpdatedTagForNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "lastUpdatedTagForNotificationServiceType:passUniqueIdentifier:",  [v12 serviceType],  v10));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 pushToken]);

  if (!v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDPushNotificationManager pushToken](self->_pushNotificationManager, "pushToken"));
    [v12 setPushToken:v17];

    -[PDDatabaseManager updateNotificationService:](self->_databaseManager, "updateNotificationService:", v12);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceCoordinator _partnerAccountIdentifierWithPaymentApplication:passUniqueIdentifier:]( self,  "_partnerAccountIdentifierWithPaymentApplication:passUniqueIdentifier:",  v11,  v10));
  int v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 context]);
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 configuration]);

  int v22 = (void *)objc_claimAutoreleasedReturnValue([v11 dpanIdentifier]);
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[PDNotificationServiceGetSpecificUpdatesTask getSpecificUpdatesTaskWithNotificationService:dpanIdentifier:credentialType:lastUpdatedTag:accountIdentifier:webServiceConfiguration:]( PDNotificationServiceGetSpecificUpdatesTask,  "getSpecificUpdatesTaskWithNotificationService:dpanIdentifier:credentialType:lastUpdatedTag:accountId entifier:webServiceConfiguration:",  v12,  v22,  [v11 paymentNetworkIdentifier],  v15,  v18,  v21));

  [v23 setInitialUpdatesTask:v6];
  -[PDNotificationServiceCoordinator _performRegistrationTaskForPaymentApplication:notificationService:completionTask:]( self,  "_performRegistrationTaskForPaymentApplication:notificationService:completionTask:",  v11,  v12,  v23);
}

- (void)_performRegistrationTaskForPaymentApplication:(id)a3 notificationService:(id)a4 completionTask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 pushToken]);
  uint64_t v12 = PKAccountHash();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v13 hexEncoding]);

  if (v11 && v35)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v34 setObject:v11 forKey:@"pushToken"];
    [v34 setObject:v35 forKey:@"accountHash"];
    uint64_t v48 = 0LL;
    __int16 v49 = &v48;
    uint64_t v50 = 0x3032000000LL;
    __int16 v51 = sub_10007A9AC;
    __int128 v52 = sub_10007A9BC;
    id v14 = v8;
    id v53 = v14;
    if (!v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationsForNotificationService:]( self->_databaseManager,  "paymentApplicationsForNotificationService:",  v9));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10007A9C4;
      v45[3] = &unk_10063E138;
      v45[4] = self;
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v46 = v16;
      __int16 v47 = &v48;
      [v15 enumerateObjectsUsingBlock:v45];
      if ([v16 count]) {
        [v34 setObject:v16 forKey:@"dpanIdentifiers"];
      }
    }

    if ([v14 supportsPartnerSpecificIdentifier])
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithPaymentApplication:]( self->_databaseManager,  "passWithPaymentApplication:",  v49[5]));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 paymentPass]);
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 partnerAccountIdentifier]);

      if (v19) {
        [v34 setObject:v19 forKey:@"accountIdentifier"];
      }
    }

    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v34,  0LL,  0LL));
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 SHA256Hash]);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10007AB2C;
    v39[3] = &unk_10063E160;
    id v33 = v20;
    id v40 = v33;
    id v41 = v14;
    id v42 = v9;
    id v43 = v10;
    __int16 v44 = self;
    int v22 = objc_retainBlock(v39);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v55 = v34;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Signing Registration Data: %@", buf, 0xCu);
    }

    id v25 = v9;
    __int16 v26 = v11;
    id v27 = v10;
    id v28 = v8;
    secureElement = self->_secureElement;
    uint64_t v30 = v49[5];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10007AE70;
    v36[3] = &unk_10063E188;
    v36[4] = self;
    id v31 = v21;
    id v37 = v31;
    unint64_t v32 = v22;
    id v38 = v32;
    -[PKSecureElement signChallenge:forPaymentApplication:withCompletion:]( secureElement,  "signChallenge:forPaymentApplication:withCompletion:",  v31,  v30,  v36);

    id v8 = v28;
    id v10 = v27;
    id v11 = v26;
    id v9 = v25;

    _Block_object_dispose(&v48, 8);
  }
}

- (void)_performDeregistrationForPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 notificationService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to de-register Pass with Unique Identifier: %@ with Notification Service: [%@]",  (uint8_t *)&v15,  0x16u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 dpanIdentifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PDNotificationServiceSpecificRegistrationTask deregisterTaskWithNotificationService:dpanIdentifier:]( &OBJC_CLASS___PDNotificationServiceSpecificRegistrationTask,  "deregisterTaskWithNotificationService:dpanIdentifier:",  v10,  v13));

  -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v14);
  -[PDDatabaseManager updateRegistrationStatus:forNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "updateRegistrationStatus:forNotificationServiceType:passUniqueIdentifier:",  2,  [v10 serviceType],  v8);
  if (!-[PDDatabaseManager notificationServiceIsEnabledForAnyPasses:]( self->_databaseManager,  "notificationServiceIsEnabledForAnyPasses:",  v10))
  {
    -[PDDatabaseManager updateAuthenticationToken:forNotificationService:]( self->_databaseManager,  "updateAuthenticationToken:forNotificationService:",  0LL,  v10);
    [v10 setAuthenticationToken:0];
  }

  -[PDNotificationServiceCoordinator _recalculatePushTopics](self, "_recalculatePushTopics");
}

- (void)_clearStoredDataForPassUniqueIdentifier:(id)a3 notificationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Clearing stored state for Pass with Unique Identifier: %@ with Notification Service: [%@]",  (uint8_t *)&v14,  0x16u);
  }

  id v10 = [v7 serviceType];
  -[PDDatabaseManager updateLastUpdatedDate:forNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "updateLastUpdatedDate:forNotificationServiceType:passUniqueIdentifier:",  0LL,  v10,  v6);
  -[PDDatabaseManager updateLastUpdatedTag:forNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "updateLastUpdatedTag:forNotificationServiceType:passUniqueIdentifier:",  0LL,  v10,  v6);
  if (!-[PDDatabaseManager notificationServiceIsEnabledForAnyPasses:]( self->_databaseManager,  "notificationServiceIsEnabledForAnyPasses:",  v7))
  {
    [v7 setLastUpdatedTag:0];
    [v7 setLastUpdatedDate:0];
    -[PDDatabaseManager updateNotificationService:](self->_databaseManager, "updateNotificationService:", v7);
  }

  if (v10)
  {
    -[PDDatabaseManager deleteAllMessagesFromPaymentPassWithUniqueIdentifier:]( self->_databaseManager,  "deleteAllMessagesFromPaymentPassWithUniqueIdentifier:",  v6);
  }

  else
  {
    -[PDUserNotificationManager removeUserNotificationsForPassUniqueIdentifier:ofType:]( self->_userNotificationManager,  "removeUserNotificationsForPassUniqueIdentifier:ofType:",  v6,  4LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v6));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 paymentPass]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceTransactionSourceIdentifiers]);

    -[PDDatabaseManager deleteAllTransactionsFromTransactionSourceIdentifiers:]( self->_databaseManager,  "deleteAllTransactionsFromTransactionSourceIdentifiers:",  v13);
  }
}

- (void)_registrationTaskSucceeded:(id)a3 withAuthenticationToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 notificationService]);
  [v8 setAuthenticationToken:v7];

  -[PDDatabaseManager updateNotificationService:](self->_databaseManager, "updateNotificationService:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 completionTask]);

  if (v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 completionTask]);
      *(_DWORD *)buf = 138412290;
      __int16 v26 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Performing Completion Task After Successful Registration: %@",  buf,  0xCu);
    }

    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10007B4B8;
    v23[3] = &unk_1006392B0;
    v23[4] = self;
    id v24 = v6;
    dispatch_async(v15, v23);
  }

  uint64_t v16 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceSpecificRegistrationTask, v10);
  if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 dpanIdentifier]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationWithDPANIdentifier:]( self->_databaseManager,  "paymentApplicationWithDPANIdentifier:",  v17));
    int v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithPaymentApplication:]( self->_databaseManager,  "passWithPaymentApplication:",  v18));
    databaseManager = self->_databaseManager;
    id v21 = [v8 serviceType];
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueID]);
    -[PDDatabaseManager updateRegistrationStatus:forNotificationServiceType:passUniqueIdentifier:]( databaseManager,  "updateRegistrationStatus:forNotificationServiceType:passUniqueIdentifier:",  1LL,  v21,  v22);

    -[PDNotificationServiceCoordinator _recalculatePushTopics](self, "_recalculatePushTopics");
  }
}

- (void)_notificationUpdatesTaskSucceeded:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceGetSpecificUpdatesTask, v8);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 notificationService]);
  id v12 = [v11 serviceType];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUpdatedTag]);
  v66 = v11;
  v67 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
  if ((isKindOfClass & 1) != 0)
  {
    id v63 = v7;
    id v14 = v6;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dpanIdentifier]);
    v65 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationWithDPANIdentifier:]( self->_databaseManager,  "paymentApplicationWithDPANIdentifier:",  v15));
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithPaymentApplication:]( self->_databaseManager,  "passUniqueIdentifierWithPaymentApplication:"));
    id v17 = v13;
    databaseManager = self->_databaseManager;
    int v19 = (void *)v16;
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v21 = databaseManager;
    uint64_t v13 = v17;
    -[PDDatabaseManager updateLastUpdatedDate:forNotificationServiceType:passUniqueIdentifier:]( v21,  "updateLastUpdatedDate:forNotificationServiceType:passUniqueIdentifier:",  v20,  v12,  v19);

    if (v17) {
      -[PDDatabaseManager updateLastUpdatedTag:forNotificationServiceType:passUniqueIdentifier:]( self->_databaseManager,  "updateLastUpdatedTag:forNotificationServiceType:passUniqueIdentifier:",  v17,  v12,  v19);
    }

    id v11 = v66;
    id v7 = v63;
    if (!v63) {
      goto LABEL_42;
    }
LABEL_9:
    id v58 = v13;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 authenticationToken]);
    v64 = (void *)objc_claimAutoreleasedReturnValue([v7 appLaunchToken]);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v7 balances]);
    __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v7 plans]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 notifications]);
    if ([v24 length])
    {
      [v11 setAuthenticationToken:v24];
      -[PDDatabaseManager updateAuthenticationToken:forNotificationService:]( self->_databaseManager,  "updateAuthenticationToken:forNotificationService:",  v24,  v11);
    }

    v57 = v24;
    char v26 = isKindOfClass & 1;
    if ([v64 length]) {
      -[PDDatabaseManager updateAppLaunchToken:forNotificationService:]( self->_databaseManager,  "updateAppLaunchToken:forNotificationService:",  v64,  v11);
    }
    if (v12)
    {
      if (v12 != (id)1) {
        goto LABEL_19;
      }
      id v27 = @"messageDate";
    }

    else
    {
      id v27 = @"transactionDate";
    }

    uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v27,  0LL));
    if (v28)
    {
      __int128 v55 = (void *)v28;
      uint64_t v91 = v28;
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v91, 1LL));
      uint64_t v30 = objc_claimAutoreleasedReturnValue([v25 sortedArrayUsingDescriptors:v29]);

      id v25 = (void *)v30;
LABEL_20:
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472LL;
      v83[2] = sub_10007BC00;
      v83[3] = &unk_10063E1B0;
      v83[4] = self;
      id v60 = v12;
      id v87 = v12;
      v84 = v67;
      char v88 = v26;
      id v85 = v25;
      id v59 = v6;
      id v86 = v6;
      id v56 = v85;
      [v85 enumerateObjectsUsingBlock:v83];
      id v31 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      if ([v62 count])
      {
        unint64_t v32 = v19;
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472LL;
        v81[2] = sub_10007BE64;
        v81[3] = &unk_10063E1D8;
        v81[4] = self;
        id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        id v82 = v33;
        [v62 enumerateObjectsUsingBlock:v81];
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        id v34 = v33;
        id v35 = [v34 countByEnumeratingWithState:&v77 objects:v90 count:16];
        if (v35)
        {
          id v36 = v35;
          uint64_t v37 = *(void *)v78;
          do
          {
            for (i = 0LL; i != v36; i = (char *)i + 1)
            {
              if (*(void *)v78 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void *)(*((void *)&v77 + 1) + 8LL * (void)i);
              id v40 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentBalancesForPassUniqueIdentifier:]( self->_databaseManager,  "paymentBalancesForPassUniqueIdentifier:",  v39));
              id v41 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:v39]);
              -[PDNotificationServiceCoordinator sendLowBalanceNotificationIfNecessaryForUpdatedBalances:startingBalances:passUniqueIdentifier:]( self,  "sendLowBalanceNotificationIfNecessaryForUpdatedBalances:startingBalances:passUniqueIdentifier:",  v41,  v40,  v39);
              -[PDDatabaseManager updatePaymentBalances:forPassUniqueIdentifier:]( self->_databaseManager,  "updatePaymentBalances:forPassUniqueIdentifier:",  v41,  v39);
            }

            id v36 = [v34 countByEnumeratingWithState:&v77 objects:v90 count:16];
          }

          while (v36);
        }

        id v31 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      }

      else
      {
        unint64_t v32 = v19;
        if (v19 && !v60) {
          -[PDDatabaseManager updatePaymentBalances:forPassUniqueIdentifier:]( self->_databaseManager,  "updatePaymentBalances:forPassUniqueIdentifier:",  &__NSArray0__struct,  v19);
        }
      }

      id v42 = objc_alloc_init((Class)v31[391]);
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472LL;
      v75[2] = sub_10007C0FC;
      v75[3] = &unk_10063E1D8;
      v75[4] = self;
      id v43 = v42;
      id v76 = v43;
      [v61 enumerateObjectsUsingBlock:v75];
      __int128 v74 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v71 = 0u;
      id v44 = v43;
      id v45 = [v44 countByEnumeratingWithState:&v71 objects:v89 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v72;
        do
        {
          for (j = 0LL; j != v46; j = (char *)j + 1)
          {
            if (*(void *)v72 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)j);
            uint64_t v50 = self->_databaseManager;
            __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v49]);
            -[PDDatabaseManager updatePaymentPlans:forPassUniqueIdentifier:]( v50,  "updatePaymentPlans:forPassUniqueIdentifier:",  v51,  v49);
          }

          id v46 = [v44 countByEnumeratingWithState:&v71 objects:v89 count:16];
        }

        while (v46);
      }

      if (!v60)
      {
        __int128 v52 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v53 = (void *)objc_claimAutoreleasedReturnValue([v7 tileConfigurations]);
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472LL;
        v69[2] = sub_10007C2A4;
        v69[3] = &unk_10063E1D8;
        v69[4] = self;
        v70 = v52;
        __int128 v54 = v52;
        [v53 enumerateObjectsUsingBlock:v69];

        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_10007C4C4;
        v68[3] = &unk_10063E228;
        v68[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v54, "enumerateKeysAndObjectsUsingBlock:", v68);
      }

      uint64_t v13 = v58;
      id v6 = v59;
      id v11 = v66;
      int v19 = v32;
      goto LABEL_42;
    }

- (void)_transactionAuthenticationTaskSucceeded:(id)a3 withResponse:(id)a4
{
  if (a4)
  {
    taskToResponseMap = self->_taskToResponseMap;
    id v7 = a4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceCoordinator _dictionaryKeyForTask:](self, "_dictionaryKeyForTask:", a3));
    -[NSMutableDictionary setObject:forKey:](taskToResponseMap, "setObject:forKey:", v7, v8);
  }

- (void)sendLowBalanceNotificationIfNecessaryForUpdatedBalances:(id)a3 startingBalances:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v40 = a4;
  id v9 = a5;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v48;
    *(void *)&__int128 v11 = 138412802LL;
    __int128 v35 = v11;
    id v36 = self;
    id v37 = v8;
    uint64_t v38 = *(void *)v48;
    id v39 = v9;
    do
    {
      id v14 = 0LL;
      id v41 = v12;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v8);
        }
        id v42 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v14);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifiers", v35));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 anyObject]);

        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager balanceReminderThresholdForBalanceIdentifier:withPassUniqueIdentifier:]( self->_databaseManager,  "balanceReminderThresholdForBalanceIdentifier:withPassUniqueIdentifier:",  v16,  v9));
        id v18 = v17;
        if (v17 && [v17 isEnabled])
        {
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          id v19 = v40;
          id v20 = [v19 countByEnumeratingWithState:&v43 objects:v57 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v44;
LABEL_10:
            uint64_t v23 = 0LL;
            while (1)
            {
              if (*(void *)v44 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v43 + 1) + 8 * v23);
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifiers]);
              unsigned __int8 v26 = [v25 containsObject:v16];

              if ((v26 & 1) != 0) {
                break;
              }
              if (v21 == (id)++v23)
              {
                id v21 = [v19 countByEnumeratingWithState:&v43 objects:v57 count:16];
                if (v21) {
                  goto LABEL_10;
                }
                id v27 = v19;
                self = v36;
                id v8 = v37;
                id v9 = v39;
                goto LABEL_27;
              }
            }

            id v27 = v24;

            self = v36;
            id v8 = v37;
            uint64_t v13 = v38;
            id v9 = v39;
            id v12 = v41;
            if (!v27) {
              goto LABEL_29;
            }
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v18 threshold]);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v42 value]);
            id v30 = [v29 compare:v28];
            uint64_t Object = PKLogFacilityTypeGetObject(6LL);
            unint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v35;
              __int128 v52 = v18;
              __int16 v53 = 2112;
              __int128 v54 = v29;
              __int16 v55 = 2112;
              id v56 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "PDNotificationServiceCoordiantor: lowBalance threshold: %@, updatedBalance: %@, oldBalance: %@",  buf,  0x20u);
            }

            if (v30 == (id)-1LL)
            {
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v27 value]);
              id v34 = [v33 compare:v28];

              if (v34 == (id)-1LL)
              {
                id v9 = v39;
                -[PDNotificationServiceCoordinator updateLowBalanceNotificationForBalance:withPassUniqueIdentifier:]( v36,  "updateLowBalanceNotificationForBalance:withPassUniqueIdentifier:",  v42,  v39);
              }

              else
              {
                id v9 = v39;
                -[PDNotificationServiceCoordinator sendLowBalanceNotificationForBalance:withReminder:passUniqueIdentifier:]( v36,  "sendLowBalanceNotificationForBalance:withReminder:passUniqueIdentifier:",  v42,  v18,  v39);
              }
            }

            else
            {
              id v9 = v39;
              -[PDNotificationServiceCoordinator removeLowBalanceNotificationForBalance:withPassUniqueIdentifier:]( v36,  "removeLowBalanceNotificationForBalance:withPassUniqueIdentifier:",  v42,  v39);
            }

LABEL_27:
            uint64_t v13 = v38;
          }

          else
          {
            id v27 = v19;
          }

          id v12 = v41;
        }

- (void)sendLowBalanceNotificationForBalance:(id)a3 withReminder:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currencyCode]);
  id v12 = objc_alloc(&OBJC_CLASS___PDPassLowBalanceReminderUserNotification);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);
  id v14 = [v10 exponent];
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 threshold]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 anyObject]);
  id v18 = -[PDPassLowBalanceReminderUserNotification initWithCurrentBalance:balanceCurrency:exponent:reminderAmount:reminderCurrency:passUniqueIdentifier:balanceIdentifier:]( v12,  "initWithCurrentBalance:balanceCurrency:exponent:reminderAmount:reminderCurrency:passUniqueIdentifier:balanceIdentifier:",  v13,  v11,  v14,  v15,  v11,  v8,  v17);

  -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v18);
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v18;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "PDNotificationServiceCoordiantor: send lowBalance notification %@ for pass %@",  buf,  0x16u);
  }
}

- (void)updateLowBalanceNotificationForBalance:(id)a3 withPassUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);

  userNotificationManager = self->_userNotificationManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007CD50;
  v14[3] = &unk_10063A4B8;
  id v15 = v9;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  -[PDUserNotificationManager userNotificationsForPassUniqueIdentifier:ofType:completion:]( userNotificationManager,  "userNotificationsForPassUniqueIdentifier:ofType:completion:",  v11,  7LL,  v14);
}

- (void)removeLowBalanceNotificationForBalance:(id)a3 withPassUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 identifiers]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);

  userNotificationManager = self->_userNotificationManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007D004;
  v12[3] = &unk_10063E250;
  id v13 = v8;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  -[PDUserNotificationManager userNotificationsForPassUniqueIdentifier:ofType:completion:]( userNotificationManager,  "userNotificationsForPassUniqueIdentifier:ofType:completion:",  v10,  7LL,  v12);
}

- (BOOL)_validateBalanceResult:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);

  if (!v4)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      id v10 = "Balance missing identifier";
      id v11 = (uint8_t *)&v18;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }

- (BOOL)_validatePlanResult:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  if (!v4)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Plan missing identifier", buf, 2u);
    }

    goto LABEL_8;
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdateDate]);

  if (!v5)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(6LL);
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Plan missing lastUpdate, synthesizing",  v11,  2u);
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v3 setLastUpdateDate:v8];
LABEL_8:
  }

  return v4 != 0LL;
}

- (void)_isMerchantTokenTransaction:(id)a3 forPass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassLibrary sharedInstance](&OBJC_CLASS___PKPassLibrary, "sharedInstance"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 panIdentifier]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 passWithFPANIdentifier:v12]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 panIdentifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 passWithDPANIdentifier:v14]);

  uint64_t v16 = objc_claimAutoreleasedReturnValue([v8 panIdentifier]);
  id v17 = (void *)v16;
  if (v13 || v15 || !v16)
  {
    v10[2](v10, &__kCFBooleanFalse);
  }

  else
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
    id v19 = objc_alloc_init(&OBJC_CLASS___PKRetrieveMerchantTokensRequest);
    [v19 setPass:v9];
    [v19 setMerchantTokenId:v17];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10007D5E4;
    v20[3] = &unk_10063E278;
    uint64_t v22 = v10;
    id v21 = v8;
    [v18 retrieveMerchantTokensWithRequest:v19 completion:v20];
  }
}

- (id)_updatePaymentTransaction:(id)a3 withPassUniqueIdentifier:(id)a4 forPaymentApplication:(id)a5 insertionMode:(unint64_t)a6 performTruncation:(BOOL)a7
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager insertOrUpdatePaymentTransaction:withPassUniqueIdentifier:paymentApplication:insertionMode:performTruncation:insertedTransaction:]( self->_databaseManager,  "insertOrUpdatePaymentTransaction:withPassUniqueIdentifier:paymentApplication:insertionMode:performTru ncation:insertedTransaction:",  a3,  a4,  a5,  a6,  a7,  0LL));
  paymentTransactionProcessor = self->_paymentTransactionProcessor;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 transactionSourceIdentifier]);
  -[PDPaymentTransactionProcessor processPaymentTransaction:forTransactionSourceIdentifier:]( paymentTransactionProcessor,  "processPaymentTransaction:forTransactionSourceIdentifier:",  v8,  v10);

  return v8;
}

- (BOOL)_processTransactionDictionary:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 performTruncation:(BOOL)a6 isInitialUpdate:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v33 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 PKNumberForKey:@"invalidated"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 PKStringForKey:@"completion"]);
    if (v14 && ([v14 BOOLValue] & 1) != 0)
    {
      uint64_t v16 = 2LL;
    }

    else if (v15)
    {
      else {
        uint64_t v16 = 0LL;
      }
    }

    else
    {
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v12));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 paymentPass]);

  id v19 = PKPaymentPassUnitDictionary(v18);
  uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
  id v21 = PKPaymentPassBalanceLabelDictionary(v18);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v23 = PKPaymentPassPlanLabelDictionary(v18);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  unint64_t v32 = (void *)v20;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[PKPaymentTransaction paymentTransactionWithSource:dictionary:unitDictionary:balanceLabelDictionary:planLabelDictionary:hasNotificationServiceData:]( &OBJC_CLASS___PKPaymentTransaction,  "paymentTransactionWithSource:dictionary:unitDictionary:balanceLabelDictionary:planLabelDictionary:ha sNotificationServiceData:",  0LL,  v11,  v20,  v22,  v24,  1LL));
  [v25 addUpdateReasons:64];
  if (v7) {
    [v25 addUpdateReasons:4096];
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10007DAC8;
  v34[3] = &unk_10063E2A0;
  id v35 = (id)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceCoordinator _updatePaymentTransaction:withPassUniqueIdentifier:forPaymentApplication:insertionMode:performTruncation:]( self,  "_updatePaymentTransaction:withPassUniqueIdentifier:forPaymentApplication:insertionMode:performTruncation:",  v25,  v12,  v13,  v16,  v33));
  id v36 = self;
  id v37 = v12;
  id v38 = v13;
  uint64_t v39 = v16;
  BOOL v40 = v33;
  id v26 = v13;
  id v27 = v12;
  id v28 = v35;
  -[PDNotificationServiceCoordinator _isMerchantTokenTransaction:forPass:completion:]( self,  "_isMerchantTokenTransaction:forPass:completion:",  v28,  v18,  v34);
  if (v28) {
    BOOL v29 = v16 == 0;
  }
  else {
    BOOL v29 = 0;
  }
  BOOL v30 = v29;

  return v30;
}

- (BOOL)_processMessageDictionary:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 performTruncation:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PKPaymentMessage paymentMessageWithDictionary:]( &OBJC_CLASS___PKPaymentMessage,  "paymentMessageWithDictionary:",  a3));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager insertOrUpdatePaymentMessage:forPassUniqueIdentifier:paymentApplication:performTruncation:]( self->_databaseManager,  "insertOrUpdatePaymentMessage:forPassUniqueIdentifier:paymentApplication:performTruncation:",  v12,  v11,  v10,  v6));

  return v13 != 0LL;
}

- (void)_cancelAllTasksForPaymentApplication:(id)a3 notificationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationsForNotificationService:]( self->_databaseManager,  "paymentApplicationsForNotificationService:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pk_setByRemovingObject:", v6));
  BOOL v10 = [v9 count] != 0;

  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  taskManager = self->_taskManager;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007DD80;
  v16[3] = &unk_10063E2C8;
  id v12 = v7;
  id v17 = v12;
  BOOL v20 = v10;
  id v13 = v6;
  id v18 = v13;
  id v19 = &v21;
  -[PDNetworkTaskManager cancelTasksPassingTest:](taskManager, "cancelTasksPassingTest:", v16);
  if (*((_BYTE *)v22 + 24))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cancelled All Tasks for Payment Application: [%@], Notification Service: [%@]",  buf,  0x16u);
    }
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_recalculatePushTopics
{
  pushTopics = self->_pushTopics;
  self->_pushTopics = 0LL;

  -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
}

- (void)_invokeAndClearHandlerForTask:(id)a3 withResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceCoordinator _dictionaryKeyForTask:](self, "_dictionaryKeyForTask:", a3));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_taskToHandlerMap, "objectForKey:"));
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v4);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_taskToHandlerMap, "removeObjectForKey:", v8);
  -[NSMutableDictionary removeObjectForKey:](self->_taskToResponseMap, "removeObjectForKey:", v8);
  -[NSMutableDictionary removeObjectForKey:](self->_taskToErrorMap, "removeObjectForKey:", v8);
}

- (id)_dictionaryKeyForTask:(id)a3
{
  return +[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", a3);
}

- (id)_partnerAccountIdentifierWithPaymentApplication:(id)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a4;
  if ([a3 supportsPartnerSpecificIdentifier])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 paymentPass]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 partnerAccountIdentifier]);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (PDPassTileManager)passTileManager
{
  return self->_passTileManager;
}

- (void)setPassTileManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end