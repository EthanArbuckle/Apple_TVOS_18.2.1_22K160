@interface PDWebServicesCoordinator
+ (void)initialize;
+ (void)initializeConfigurationDefaults;
- (PDDatabaseManager)databaseManager;
- (PDNetworkTaskManager)taskManager;
- (PDWebServicesCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 cardFileManager:(id)a5;
- (double)_updatedFrequencyScoreForScore:(double)a3 lastPushDate:(id)a4 zeroInterval:(double)a5;
- (double)_zeroIntervalForPassTypeID:(id)a3;
- (id)_nextUpdateDateWithLastUpdateDate:(id)a3 rateLimitLevel:(int64_t)a4;
- (id)_userNotificationParametersForPassTypeID:(id)a3;
- (id)pushNotificationTopics;
- (int64_t)_rateLimitLevelForFrequencyScore:(double)a3;
- (void)_aggdLogTaskErrorCode:(int64_t)a3 passTypeID:(id)a4;
- (void)_aggdLogTaskWarningCode:(int64_t)a3 passTypeID:(id)a4;
- (void)_aggdLogWebServiceErrorCode:(int64_t)a3 passTypeID:(id)a4;
- (void)_cancelAllTasksForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)_cancelAutomaticUpdateTasksForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)_cancelWhatChangedTasksForPassTypeIdentifier:(id)a3;
- (void)_getPassTask:(id)a3 gotResult:(id)a4;
- (void)_getSerialNumbersTask:(id)a3 gotResult:(id)a4;
- (void)_invokeAndClearHandlerForTask:(id)a3 withResult:(BOOL)a4;
- (void)_personalizePassTask:(id)a3 gotResult:(id)a4;
- (void)_presentUnregistrationAlertForPassTypeID:(id)a3;
- (void)_recalculatePushTopics;
- (void)_registerWithSerialNumber:(id)a3 authToken:(id)a4 webService:(id)a5;
- (void)_registrationTaskSucceeded:(id)a3;
- (void)_requestPassesTask:(id)a3 gotResult:(id)a4;
- (void)_scheduleUpdateForPassTypeIdentifier:(id)a3 afterDate:(id)a4;
- (void)_unregisterPassesOfType:(id)a3;
- (void)_updatePassTypeIdentifier:(id)a3;
- (void)_whatChangedTaskSucceeded:(id)a3;
- (void)adjustStateForIncomingPushNotification:(id)a3 andComputeNextUpdateDate:(id *)a4;
- (void)applyPushNotificationToken:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)handleDeletion:(id)a3 authToken:(id)a4 webService:(id)a5 pushEnabled:(BOOL)a6;
- (void)handleInsertion:(id)a3 authToken:(id)a4 webService:(id)a5 pushEnabled:(BOOL)a6 source:(int64_t)a7;
- (void)handleModification:(id)a3 webService:(id)a4 pushEnabled:(BOOL)a5 source:(int64_t)a6;
- (void)handlePushDisabled:(id)a3 authToken:(id)a4 webService:(id)a5;
- (void)handlePushEnabled:(id)a3 authToken:(id)a4 webService:(id)a5;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)nukeTasks;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)personalizePassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8;
- (void)reportAbandonedTask:(id)a3 passTypeID:(id)a4;
- (void)reportError:(id)a3 webService:(id)a4 logToService:(BOOL)a5;
- (void)reportIgnoredIfModifiedSince:(id)a3 forSerialNumber:(id)a4 webService:(id)a5;
- (void)reportMissingLastModifiedForSerialNumber:(id)a3 webService:(id)a4;
- (void)reportMissingTagWithRequestedSerialNumbers:(id)a3 forWebService:(id)a4;
- (void)reportPushRateLimitLevel:(int64_t)a3 forPassTypeID:(id)a4;
- (void)reportPushWithNoSerialNumbersFromTasks:(id)a3;
- (void)reportUnchangedPassForPersonalizationTask:(id)a3;
- (void)reportUnchangedPassForServerRequestedUpdateTask:(id)a3;
- (void)reportUnmodifiedTag:(id)a3 withRequestedSerialNumbers:(id)a4 forWebService:(id)a5;
- (void)reportUpdateRequestForNonPushEnabledSerialNumber:(id)a3 forWebService:(id)a4;
- (void)reportWarnings:(id)a3 webService:(id)a4 logToService:(BOOL)a5;
- (void)requestPassesForIssuerBindingData:(id)a3 handler:(id)a4;
- (void)resetPushFrequencyStateForPassTypeID:(id)a3;
- (void)sendPassLifecycleEventForUniqueIdentifier:(id)a3 state:(unint64_t)a4;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4;
- (void)taskFailed:(id)a3;
- (void)taskSucceeded:(id)a3;
- (void)updatePassWithUniqueIdentifier:(id)a3 handler:(id)a4;
@end

@implementation PDWebServicesCoordinator

+ (void)initialize
{
}

- (PDWebServicesCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 cardFileManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDWebServicesCoordinator;
  v12 = -[PDWebServicesCoordinator init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a4);
    objc_storeStrong((id *)&v13->_cardFileManager, a5);
    objc_storeStrong((id *)&v13->_pushNotificationManager, a3);
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    taskToHandlerMap = v13->_taskToHandlerMap;
    v13->_taskToHandlerMap = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    taskToResultMap = v13->_taskToResultMap;
    v13->_taskToResultMap = v16;

    -[PDDatabaseManager setWebServicesDelegate:](v13->_databaseManager, "setWebServicesDelegate:", v13);
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDWebServicesCoordinator;
  -[PDWebServicesCoordinator dealloc](&v3, "dealloc");
}

- (void)connect
{
  if (!self->_taskManager)
  {
    objc_super v3 = -[PDNetworkTaskManager initWithDelegate:archiveName:]( objc_alloc(&OBJC_CLASS___PDNetworkTaskManager),  "initWithDelegate:archiveName:",  self,  @"WebServiceTasks");
    taskManager = self->_taskManager;
    self->_taskManager = v3;
  }

  id v5 = PDDefaultQueue();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  PDScheduledActivityClientRegister(@"PDWebServicesCoordinator", self, v6);
}

- (void)updatePassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  databaseManager = self->_databaseManager;
  id v15 = 0LL;
  id v16 = 0LL;
  unsigned int v8 = -[PDDatabaseManager getWebService:updateContext:forPassWithUniqueID:]( databaseManager,  "getWebService:updateContext:forPassWithUniqueID:",  &v16,  &v15,  a3);
  id v9 = v16;
  id v10 = v15;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDGetPassTask taskWithWebService:updateContext:source:]( &OBJC_CLASS___PDGetPassTask,  "taskWithWebService:updateContext:source:",  v9,  v10,  1LL));
    [v11 setUserRequested:1];
    if (v6 && v11)
    {
      taskToHandlerMap = self->_taskToHandlerMap;
      id v13 = [v6 copy];
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", v11));
      -[NSMutableDictionary setObject:forKey:](taskToHandlerMap, "setObject:forKey:", v13, v14);
    }

    -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v11);
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (void)personalizePassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  databaseManager = self->_databaseManager;
  id v32 = 0LL;
  id v33 = 0LL;
  unsigned int v18 = -[PDDatabaseManager getWebService:updateContext:forPassWithUniqueID:]( databaseManager,  "getWebService:updateContext:forPassWithUniqueID:",  &v33,  &v32,  a3);
  id v19 = v33;
  id v20 = v32;
  if (v18)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[PDPersonalizePassTask taskWithWebService:updateContext:contact:personalizationToken:requiredPersonalizationFields:personalizationSource:]( &OBJC_CLASS___PDPersonalizePassTask,  "taskWithWebService:updateContext:contact:personalizationToken:requiredPersonalizationFields:person alizationSource:",  v19,  v20,  v14,  v15,  a6,  a7));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10017CA74;
    v27[3] = &unk_1006453A8;
    id v28 = v19;
    id v29 = v20;
    v30 = self;
    id v31 = v16;
    v22 = objc_retainBlock(v27);
    v23 = v22;
    if (v21 && v22)
    {
      taskToHandlerMap = self->_taskToHandlerMap;
      id v24 = [v22 copy];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", v21));
      -[NSMutableDictionary setObject:forKey:](taskToHandlerMap, "setObject:forKey:", v24, v25);
    }

    -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v21);
  }

  else
  {
    (*((void (**)(id, void))v16 + 2))(v16, 0LL);
  }
}

- (void)requestPassesForIssuerBindingData:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_alloc_init(&OBJC_CLASS___PDWebService);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callbackURL]);
  -[PDWebService setServiceURL:](v13, "setServiceURL:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PDRequestPassesTask taskWithWebService:issuerBindingData:]( &OBJC_CLASS___PDRequestPassesTask,  "taskWithWebService:issuerBindingData:",  v13,  v7));
  taskToHandlerMap = self->_taskToHandlerMap;
  id v11 = [v6 copy];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", v9));
  -[NSMutableDictionary setObject:forKey:](taskToHandlerMap, "setObject:forKey:", v11, v12);

  -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v9);
}

- (void)sendPassLifecycleEventForUniqueIdentifier:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  databaseManager = self->_databaseManager;
  id v15 = 0LL;
  id v16 = 0LL;
  unsigned int v8 = -[PDDatabaseManager getWebService:updateContext:forPassWithUniqueID:]( databaseManager,  "getWebService:updateContext:forPassWithUniqueID:",  &v16,  &v15,  v6);
  id v9 = v16;
  id v10 = v15;
  id v11 = v10;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 serialNumber]);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[PDReportLifecycleEventTask taskWithWebService:serialNumber:state:]( &OBJC_CLASS___PDReportLifecycleEventTask,  "taskWithWebService:serialNumber:state:",  v9,  v12,  a4));

    -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v13);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(2LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to fetch web service for pass with unique id: %@",  buf,  0xCu);
    }
  }
}

- (void)nukeTasks
{
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing all web service tasks", v5, 2u);
  }

  -[PDNetworkTaskManager nukeArchive](self->_taskManager, "nukeArchive");
}

- (void)handleInsertion:(id)a3 authToken:(id)a4 webService:(id)a5 pushEnabled:(BOOL)a6 source:(int64_t)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pushToken]);

  if (!v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDPushNotificationManager pushToken](self->_pushNotificationManager, "pushToken"));
    [v13 setPushToken:v15];

    [v13 generateNewDeviceIdentifier];
    -[PDDatabaseManager updateWebService:](self->_databaseManager, "updateWebService:", v13);
  }

  if ((unint64_t)(a7 - 3) <= 0xFFFFFFFFFFFFFFFDLL) {
    -[PDDatabaseManager updateLastModifiedTag:forSerialNumber:webService:]( self->_databaseManager,  "updateLastModifiedTag:forSerialNumber:webService:",  0LL,  v16,  v13);
  }
  if (v8) {
    -[PDWebServicesCoordinator handlePushEnabled:authToken:webService:]( self,  "handlePushEnabled:authToken:webService:",  v16,  v12,  v13);
  }
}

- (void)handleDeletion:(id)a3 authToken:(id)a4 webService:(id)a5 pushEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 passTypeIdentifier]);
  -[PDWebServicesCoordinator _cancelAllTasksForPassTypeIdentifier:serialNumber:]( self,  "_cancelAllTasksForPassTypeIdentifier:serialNumber:",  v12,  v13);

  if (v6) {
    -[PDWebServicesCoordinator handlePushDisabled:authToken:webService:]( self,  "handlePushDisabled:authToken:webService:",  v13,  v10,  v11);
  }
}

- (void)handleModification:(id)a3 webService:(id)a4 pushEnabled:(BOOL)a5 source:(int64_t)a6
{
  BOOL v7 = a5;
  id v13 = a3;
  id v10 = a4;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    -[PDDatabaseManager updateLastModifiedTag:forSerialNumber:webService:]( self->_databaseManager,  "updateLastModifiedTag:forSerialNumber:webService:",  0LL,  v13,  v10);
    if (a6 != 3 && a6 != 5 && v7)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUpdateContextForSerialNumber:webService:]( self->_databaseManager,  "passUpdateContextForSerialNumber:webService:",  v13,  v10));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDGetPassTask taskWithWebService:updateContext:source:]( &OBJC_CLASS___PDGetPassTask,  "taskWithWebService:updateContext:source:",  v10,  v11,  1LL));
      -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v12);
    }
  }
}

- (void)handlePushEnabled:(id)a3 authToken:(id)a4 webService:(id)a5
{
}

- (void)handlePushDisabled:(id)a3 authToken:(id)a4 webService:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[PDRegistrationTask unregisterTaskWithWebService:serialNumber:authToken:]( &OBJC_CLASS___PDRegistrationTask,  "unregisterTaskWithWebService:serialNumber:authToken:",  v8,  v9,  a4));
  -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:");
  -[PDWebServicesCoordinator _recalculatePushTopics](self, "_recalculatePushTopics");
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 passTypeIdentifier]);

  -[PDWebServicesCoordinator _cancelAutomaticUpdateTasksForPassTypeIdentifier:serialNumber:]( self,  "_cancelAutomaticUpdateTasksForPassTypeIdentifier:serialNumber:",  v10,  v9);
  if (!-[NSSet containsObject:](self->_pushTopics, "containsObject:", v10)) {
    -[PDWebServicesCoordinator _cancelWhatChangedTasksForPassTypeIdentifier:]( self,  "_cancelWhatChangedTasksForPassTypeIdentifier:",  v10);
  }
}

- (void)applyPushNotificationToken:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager webServices](self->_databaseManager, "webServices"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10017D1F8;
    v6[3] = &unk_100647C50;
    id v7 = v5;
    id v8 = self;
    [v4 enumerateObjectsUsingBlock:v6];
  }
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  id v7 = 0LL;
  -[PDWebServicesCoordinator adjustStateForIncomingPushNotification:andComputeNextUpdateDate:]( self,  "adjustStateForIncomingPushNotification:andComputeNextUpdateDate:",  v5,  &v7);
  id v6 = v7;
  if (v6) {
    -[PDWebServicesCoordinator _scheduleUpdateForPassTypeIdentifier:afterDate:]( self,  "_scheduleUpdateForPassTypeIdentifier:afterDate:",  v5,  v6);
  }
}

- (id)pushNotificationTopics
{
  pushTopics = self->_pushTopics;
  if (!pushTopics)
  {
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager pushEnabledPassTypeIDs](self->_databaseManager, "pushEnabledPassTypeIDs"));
    id v5 = self->_pushTopics;
    self->_pushTopics = v4;

    pushTopics = self->_pushTopics;
  }

  return pushTopics;
}

- (void)task:(id)a3 gotResult:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PDGetSerialNumbersTask, v7);
  if ((objc_opt_isKindOfClass(v15, v8) & 1) != 0)
  {
    -[PDWebServicesCoordinator _getSerialNumbersTask:gotResult:](self, "_getSerialNumbersTask:gotResult:", v15, v6);
  }

  else
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___PDGetPassTask, v9);
    if ((objc_opt_isKindOfClass(v15, v10) & 1) != 0)
    {
      -[PDWebServicesCoordinator _getPassTask:gotResult:](self, "_getPassTask:gotResult:", v15, v6);
    }

    else
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v11);
      if ((objc_opt_isKindOfClass(v15, v12) & 1) != 0)
      {
        -[PDWebServicesCoordinator _personalizePassTask:gotResult:](self, "_personalizePassTask:gotResult:", v15, v6);
      }

      else
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___PDRequestPassesTask, v13);
        if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
          -[PDWebServicesCoordinator _requestPassesTask:gotResult:](self, "_requestPassesTask:gotResult:", v15, v6);
        }
      }
    }
  }
}

- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4
{
  id v6 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2048;
    double v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ will retry after %g seconds",  (uint8_t *)&v19,  0x16u);
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___PDGetPassTask, v16);
  BOOL v18 = (objc_opt_isKindOfClass(v6, v17) & 1) != 0 && [v6 source] == (id)2;
  -[PDWebServicesCoordinator _invokeAndClearHandlerForTask:withResult:]( self,  "_invokeAndClearHandlerForTask:withResult:",  v6,  v18);
}

- (void)taskSucceeded:(id)a3
{
  id v8 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PDRegistrationTask, v4);
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
  {
    -[PDWebServicesCoordinator _registrationTaskSucceeded:](self, "_registrationTaskSucceeded:", v8);
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___PDWhatChangedTask, v6);
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      -[PDWebServicesCoordinator _whatChangedTaskSucceeded:](self, "_whatChangedTaskSucceeded:", v8);
    }
  }

  -[PDWebServicesCoordinator _invokeAndClearHandlerForTask:withResult:]( self,  "_invokeAndClearHandlerForTask:withResult:",  v8,  1LL);
}

- (void)taskFailed:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ failed for good", (uint8_t *)&v8, 0xCu);
  }

  if ((objc_opt_respondsToSelector(v4, "passTypeIdentifier") & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    -[PDWebServicesCoordinator reportAbandonedTask:passTypeID:](self, "reportAbandonedTask:passTypeID:", v4, v7);
  }

  -[PDWebServicesCoordinator _invokeAndClearHandlerForTask:withResult:]( self,  "_invokeAndClearHandlerForTask:withResult:",  v4,  0LL);
}

- (void)task:(id)a3 encounteredError:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PDWebServiceConnectionTask, v7);
  if ((objc_opt_isKindOfClass(v15, v8) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___PDLogTask, v9);
    int isKindOfClass = objc_opt_isKindOfClass(v15, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    else {
      BOOL v13 = 1;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v15 webService]);
    -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v6,  v14,  v13 & ~isKindOfClass);
  }
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PDWebServiceConnectionTask, v7);
  if ((objc_opt_isKindOfClass(v13, v8) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___PDLogTask, v9);
    char isKindOfClass = objc_opt_isKindOfClass(v13, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v13 webService]);
    -[PDWebServicesCoordinator reportWarnings:webService:logToService:]( self,  "reportWarnings:webService:logToService:",  v6,  v12,  (isKindOfClass & 1) == 0);
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  if ([v6 hasPrefix:@"UpdatePassTypeIdentifier."])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", objc_msgSend(@"UpdatePassTypeIdentifier.", "length")));
    -[PDWebServicesCoordinator _updatePassTypeIdentifier:](self, "_updatePassTypeIdentifier:", v5);
  }
}

- (void)_invokeAndClearHandlerForTask:(id)a3 withResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", v6));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_taskToResultMap, "objectForKey:"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDRequestPassesTask, v8);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v9);

  if (!v7)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_taskToHandlerMap, "objectForKey:", v15));
    uint64_t v11 = (void (**)(void, void, void))v14;
    if ((isKindOfClass & 1) == 0)
    {
      if (v14) {
        (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, v4);
      }
      goto LABEL_11;
    }

    if (v14)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PDTaskErrorDomain",  6LL,  0LL));
      ((void (**)(void, void, void *))v11)[2](v11, 0LL, v12);
      goto LABEL_8;
    }

- (void)_recalculatePushTopics
{
  objc_super v3 = (NSSet *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager pushEnabledPassTypeIDs](self->_databaseManager, "pushEnabledPassTypeIDs"));
  pushTopics = self->_pushTopics;
  self->_pushTopics = v3;

  -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
}

- (void)_registerWithSerialNumber:(id)a3 authToken:(id)a4 webService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pushToken]);

  if (v11)
  {
    id v12 = PDDefaultQueue();
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10017DCA8;
    v14[3] = &unk_10063B060;
    id v15 = v10;
    id v16 = v8;
    id v17 = v9;
    BOOL v18 = self;
    dispatch_async(v13, v14);
  }
}

- (void)_registrationTaskSucceeded:(id)a3
{
  id v18 = a3;
  id v4 = [v18 requestedStatus];
  databaseManager = self->_databaseManager;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v18 serialNumber]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v18 webService]);
  -[PDDatabaseManager updateRegistrationStatus:date:forSerialNumber:webService:]( databaseManager,  "updateRegistrationStatus:date:forSerialNumber:webService:",  v4,  v6,  v7,  v8);

  id v9 = v18;
  if (v4 == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v18 webService]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v18 serialNumber]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager lastUpdatedTagForWebService:]( self->_databaseManager,  "lastUpdatedTagForWebService:",  v10));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager tagLastUpdateDateForWebService:]( self->_databaseManager,  "tagLastUpdateDateForWebService:",  v10));
    taskManager = self->_taskManager;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PDGetSerialNumbersTask taskWithWebService:lastUpdatedTag:tagLastUpdateDate:]( &OBJC_CLASS___PDGetSerialNumbersTask,  "taskWithWebService:lastUpdatedTag:tagLastUpdateDate:",  v10,  v12,  v13));
    -[PDNetworkTaskManager performTask:](taskManager, "performTask:", v15);

    if (v12)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUpdateContextForSerialNumber:webService:]( self->_databaseManager,  "passUpdateContextForSerialNumber:webService:",  v11,  v10));
      if (v16)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[PDGetPassTask taskWithWebService:updateContext:source:]( &OBJC_CLASS___PDGetPassTask,  "taskWithWebService:updateContext:source:",  v10,  v16,  1LL));
        -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:", v17);
      }
    }

    id v9 = v18;
  }
}

- (void)_whatChangedTaskSucceeded:(id)a3
{
  id v5 = a3;
  if (([v5 gotUpdates] & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 subtasks]);
    -[PDWebServicesCoordinator reportPushWithNoSerialNumbersFromTasks:]( self,  "reportPushWithNoSerialNumbersFromTasks:",  v4);
  }
}

- (void)_getSerialNumbersTask:(id)a3 gotResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 webService]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lastUpdatedTag]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUpdatedTag]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 serialNumbers]);
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v10;
    __int16 v36 = 2112;
    v37 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Get serial numbers task completed with update tag %@, serial numbers %@",  buf,  0x16u);
  }

  if ([v11 count])
  {
    if (v10)
    {
      if (v9 && [v10 isEqualToString:v9]) {
        -[PDWebServicesCoordinator reportUnmodifiedTag:withRequestedSerialNumbers:forWebService:]( self,  "reportUnmodifiedTag:withRequestedSerialNumbers:forWebService:",  v9,  v11,  v8);
      }
      -[PDDatabaseManager updateLastUpdatedTag:forWebService:]( self->_databaseManager,  "updateLastUpdatedTag:forWebService:",  v10,  v8);
    }

    else
    {
      -[PDWebServicesCoordinator reportMissingTagWithRequestedSerialNumbers:forWebService:]( self,  "reportMissingTagWithRequestedSerialNumbers:forWebService:",  v11,  v8);
    }

    v23 = v9;
    uint64_t v14 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v11);
    databaseManager = self->_databaseManager;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10017E1F4;
    v29[3] = &unk_100647C78;
    v29[4] = self;
    id v16 = v14;
    v30 = v16;
    id v24 = v8;
    id v17 = v8;
    id v31 = v17;
    BOOL v32 = v9 != 0LL;
    -[PDDatabaseManager enumeratePassUpdateContextsForWebService:withHandler:]( databaseManager,  "enumeratePassUpdateContextsForWebService:withHandler:",  v17,  v29);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v18 = v16;
    id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        double v22 = 0LL;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          -[PDWebServicesCoordinator reportUpdateRequestForNonPushEnabledSerialNumber:forWebService:]( self,  "reportUpdateRequestForNonPushEnabledSerialNumber:forWebService:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v22),  v17,  v23);
          double v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
      }

      while (v20);
    }

    id v9 = v23;
    id v8 = v24;
  }

  else if (v10)
  {
    -[PDDatabaseManager updateLastUpdatedTag:forWebService:]( self->_databaseManager,  "updateLastUpdatedTag:forWebService:",  v10,  v8);
  }
}

- (void)_getPassTask:(id)a3 gotResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pass]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastModifiedTag]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 manifestHash]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 manifestHash]);
    unsigned int v14 = [v11 isEqualToData:v13];

    if (v14)
    {
      if ([v6 serverRequested]) {
        -[PDWebServicesCoordinator reportUnchangedPassForServerRequestedUpdateTask:]( self,  "reportUnchangedPassForServerRequestedUpdateTask:",  v6);
      }
      if (v10)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 webService]);
        -[PDWebServicesCoordinator reportIgnoredIfModifiedSince:forSerialNumber:webService:]( self,  "reportIgnoredIfModifiedSince:forSerialNumber:webService:",  v10,  v15,  v16);
      }
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 lastModified]);

    if (!v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 webService]);
      -[PDWebServicesCoordinator reportMissingLastModifiedForSerialNumber:webService:]( self,  "reportMissingLastModifiedForSerialNumber:webService:",  v18,  v19);
    }

    databaseManager = self->_databaseManager;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 passTypeIdentifier]);
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
    LODWORD(databaseManager) = -[PDDatabaseManager passExistsWithPassTypeID:serialNumber:]( databaseManager,  "passExistsWithPassTypeID:serialNumber:",  v21,  v22);

    if ((_DWORD)databaseManager)
    {
      if (v14)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(2LL);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 passTypeIdentifier]);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
          int v39 = 138412546;
          v40 = v25;
          __int16 v41 = 2112;
          v42 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Get pass task succeeded (%@/%@) but pass did not change",  (uint8_t *)&v39,  0x16u);
        }

        __int128 v27 = self->_databaseManager;
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v7 lastModified]);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v6 webService]);
        -[PDDatabaseManager updateLastModifiedTag:forSerialNumber:webService:]( v27,  "updateLastModifiedTag:forSerialNumber:webService:",  v28,  v29,  v30);
      }

      else if (-[PDCardFileManager writeCard:source:error:]( self->_cardFileManager,  "writeCard:source:error:",  v8,  [v6 source],  0))
      {
        v35 = self->_databaseManager;
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v7 lastModified]);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v6 webService]);
        -[PDDatabaseManager updateLastModifiedTag:forSerialNumber:webService:]( v35,  "updateLastModifiedTag:forSerialNumber:webService:",  v36,  v37,  v38);

        if ([v6 source] == (id)2)
        {
          if (PKValueAddedServicesAutomaticSelectionDefaultForPass(v8)) {
            -[PDDatabaseManager updateSettings:forPass:]( self->_databaseManager,  "updateSettings:forPass:",  (unint64_t)[v8 settings] | 0x10,  v8);
          }
        }
      }
    }

    else
    {
      uint64_t v31 = PKLogFacilityTypeGetObject(2LL);
      BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v6 passTypeIdentifier]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
        int v39 = 138412546;
        v40 = v33;
        __int16 v41 = 2112;
        v42 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Get pass task succeeded (%@/%@) but pass has been deleted, so ignoring result.",  (uint8_t *)&v39,  0x16u);
      }
    }
  }

  else if ([v6 serverRequested])
  {
    -[PDWebServicesCoordinator reportUnchangedPassForServerRequestedUpdateTask:]( self,  "reportUnchangedPassForServerRequestedUpdateTask:",  v6);
  }
}

- (void)_personalizePassTask:(id)a3 gotResult:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v10 = (id)objc_claimAutoreleasedReturnValue([v6 passTypeIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 personalizationToken]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 encodedSignature]);

    id v9 = [v6 personalizationSource];
    PKPassPersonalizationReport(v10, v7, v8, v9);
  }

- (void)_requestPassesTask:(id)a3 gotResult:(id)a4
{
  if (a4)
  {
    taskToResultMap = self->_taskToResultMap;
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", a3));
    -[NSMutableDictionary setObject:forKey:](taskToResultMap, "setObject:forKey:", v6, v7);
  }

- (void)_cancelAllTasksForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  taskManager = self->_taskManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017E8B0;
  v11[3] = &unk_10063E0C0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[PDNetworkTaskManager cancelTasksPassingTest:](taskManager, "cancelTasksPassingTest:", v11);
}

- (void)_cancelAutomaticUpdateTasksForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  taskManager = self->_taskManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017E9D0;
  v11[3] = &unk_10063E0C0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[PDNetworkTaskManager cancelTasksPassingTest:](taskManager, "cancelTasksPassingTest:", v11);
}

- (void)_cancelWhatChangedTasksForPassTypeIdentifier:(id)a3
{
  id v4 = a3;
  taskManager = self->_taskManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10017EAB8;
  v7[3] = &unk_100647CA0;
  id v8 = v4;
  id v6 = v4;
  -[PDNetworkTaskManager cancelTasksPassingTest:](taskManager, "cancelTasksPassingTest:", v7);
}

- (void)_scheduleUpdateForPassTypeIdentifier:(id)a3 afterDate:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 >= 60.0)
  {
    if (v6) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = &stru_100662310;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([@"UpdatePassTypeIdentifier." stringByAppendingString:v11]);
    if ((PDScheduledActivityExists(@"PDWebServicesCoordinator", v12) & 1) == 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v7));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:600.0]);
      [v13 setEndDate:v14];

      uint64_t v15 = PDScheduledActivityRegister(@"PDWebServicesCoordinator", v12, v13);
      if (PKDeveloperLoggingEnabled(v15)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100441E10();
      }

      uint64_t Object = PKLogFacilityTypeGetObject(2LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        id v19 = v6;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Rate limiting for %@ is in effect - deferring update until %@",  (uint8_t *)&v18,  0x16u);
      }
    }
  }

  else
  {
    -[PDWebServicesCoordinator _updatePassTypeIdentifier:](self, "_updatePassTypeIdentifier:", v6);
  }
}

- (void)_updatePassTypeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager webServicesForPassTypeID:](self->_databaseManager, "webServicesForPassTypeID:", v4));
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        if (-[PDDatabaseManager hasPushEnabledPassesForWebService:]( self->_databaseManager,  "hasPushEnabledPassesForWebService:",  v11))
        {
          [v5 addObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v8);
  }

  if ([v5 count])
  {
    databaseManager = self->_databaseManager;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v27 = v4;
    -[PDDatabaseManager updateLastUpdateDate:forPassTypeID:]( databaseManager,  "updateLastUpdateDate:forPassTypeID:",  v13,  v4);

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v5 count]));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v26 = v5;
    id v15 = v5;
    id v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)j);
          id v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager lastUpdatedTagForWebService:]( self->_databaseManager,  "lastUpdatedTagForWebService:",  v20,  v26));
          double v22 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager tagLastUpdateDateForWebService:]( self->_databaseManager,  "tagLastUpdateDateForWebService:",  v20));
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[PDGetSerialNumbersTask taskWithWebService:lastUpdatedTag:tagLastUpdateDate:]( &OBJC_CLASS___PDGetSerialNumbersTask,  "taskWithWebService:lastUpdatedTag:tagLastUpdateDate:",  v20,  v21,  v22));
          [v14 addObject:v23];
        }

        id v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }

      while (v17);
    }

    taskManager = self->_taskManager;
    id v4 = v27;
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[PDWhatChangedTask taskWithPassTypeIdentifier:subtasks:]( &OBJC_CLASS___PDWhatChangedTask,  "taskWithPassTypeIdentifier:subtasks:",  v27,  v14));
    -[PDNetworkTaskManager performTask:](taskManager, "performTask:", v25);

    id v5 = v26;
  }
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDNetworkTaskManager)taskManager
{
  return self->_taskManager;
}

- (void).cxx_destruct
{
}

+ (void)initializeConfigurationDefaults
{
  v9[0] = @"PDWebServicesStandardZeroInterval";
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 7200.0));
  v10[0] = v2;
  v9[1] = @"PDWebServicesMinimumZeroInterval";
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 1800.0));
  v10[1] = v3;
  v10[2] = &off_1006905A8;
  v9[2] = @"PDWebServicesMildRateLimitThreshold";
  v9[3] = @"PDWebServicesModerateRateLimitThreshold";
  v10[3] = &off_1006905C0;
  v10[4] = &off_1006905D8;
  v9[4] = @"PDWebServicesSevereRateLimitThreshold";
  v9[5] = @"PDWebServicesPushCutoffThreshold";
  v10[5] = &off_1006905F0;
  v9[6] = @"PDWebServicesMildRateLimitInterval";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 120.0));
  v10[6] = v4;
  v9[7] = @"PDWebServicesModerateRateLimitInterval";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 600.0));
  v10[7] = v5;
  v9[8] = @"PDWebServicesSevereRateLimitInterval";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 3600.0));
  v10[8] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  9LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v8 registerDefaults:v7];
}

- (void)adjustStateForIncomingPushNotification:(id)a3 andComputeNextUpdateDate:(id *)a4
{
  id v6 = a3;
  double v18 = 0.0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager"));
  id v16 = 0LL;
  id v17 = 0LL;
  [v7 getLastPushDate:&v17 lastUpdateDate:&v16 frequencyScore:&v18 forPassTypeID:v6];
  id v8 = v17;
  id v9 = v16;

  double v10 = v18;
  -[PDWebServicesCoordinator _zeroIntervalForPassTypeID:](self, "_zeroIntervalForPassTypeID:", v6);
  -[PDWebServicesCoordinator _updatedFrequencyScoreForScore:lastPushDate:zeroInterval:]( self,  "_updatedFrequencyScoreForScore:lastPushDate:zeroInterval:",  v8,  v10,  v11);
  double v18 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v13 updateLastPushDate:v14 frequencyScore:v6 forPassTypeID:v18];

  int64_t v15 = -[PDWebServicesCoordinator _rateLimitLevelForFrequencyScore:](self, "_rateLimitLevelForFrequencyScore:", v18);
  -[PDWebServicesCoordinator reportPushRateLimitLevel:forPassTypeID:]( self,  "reportPushRateLimitLevel:forPassTypeID:",  v15,  v6);
  if (v15 == 4) {
    -[PDWebServicesCoordinator _presentUnregistrationAlertForPassTypeID:]( self,  "_presentUnregistrationAlertForPassTypeID:",  v6);
  }
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( -[PDWebServicesCoordinator _nextUpdateDateWithLastUpdateDate:rateLimitLevel:]( self,  "_nextUpdateDateWithLastUpdateDate:rateLimitLevel:",  v9,  v15));
  }
}

- (void)resetPushFrequencyStateForPassTypeID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager"));
  [v5 updateLastPushDate:0 frequencyScore:v4 forPassTypeID:0.0];
}

- (void)reportPushRateLimitLevel:(int64_t)a3 forPassTypeID:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  switch(a3)
  {
    case 1LL:
      if (PKDeveloperLoggingEnabled(v5)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100442144();
      }

      uint64_t Object = PKLogFacilityTypeGetObject(2LL);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v28 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Too many pushes too fast for %@ -- mild rate limiting will apply.",  buf,  0xCu);
      }

      uint64_t v9 = PKAggDKeyWebServicesErrorMildPushRateAbuse;
      uint64_t v25 = PKAggDKeyWebServicesPassType;
      __int128 v26 = v6;
      double v10 = &v26;
      double v11 = &v25;
      goto LABEL_26;
    case 2LL:
      if (PKDeveloperLoggingEnabled(v5)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1004421AC();
      }

      uint64_t v12 = PKLogFacilityTypeGetObject(2LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v28 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Too many pushes too fast for %@ -- moderate rate limiting will apply.",  buf,  0xCu);
      }

      uint64_t v9 = PKAggDKeyWebServicesErrorModeratePushRateAbuse;
      uint64_t v23 = PKAggDKeyWebServicesPassType;
      id v24 = v6;
      double v10 = &v24;
      double v11 = &v23;
      goto LABEL_26;
    case 3LL:
      if (PKDeveloperLoggingEnabled(v5)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100442214();
      }

      uint64_t v14 = PKLogFacilityTypeGetObject(2LL);
      int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v28 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Too many pushes too fast for %@ -- severe rate limiting will apply.",  buf,  0xCu);
      }

      uint64_t v9 = PKAggDKeyWebServicesErrorSeverePushRateAbuse;
      uint64_t v21 = PKAggDKeyWebServicesPassType;
      double v22 = v6;
      double v10 = &v22;
      double v11 = &v21;
      goto LABEL_26;
    case 4LL:
      if (PKDeveloperLoggingEnabled(v5)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10044227C();
      }

      uint64_t v16 = PKLogFacilityTypeGetObject(2LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v28 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Too many pushes too fast for %@ -- topic will be unregistered.",  buf,  0xCu);
      }

      uint64_t v9 = PKAggDKeyWebServicesErrorCutoffPushRateAbuse;
      uint64_t v19 = PKAggDKeyWebServicesPassType;
      uint64_t v20 = v6;
      double v10 = &v20;
      double v11 = &v19;
LABEL_26:
      double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v11,  1LL,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26));
      PKAnalyticsSendEvent(v9, v18);

      break;
    default:
      break;
  }
}

- (void)reportUpdateRequestForNonPushEnabledSerialNumber:(id)a3 forWebService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager"));
  id v25 = 0LL;
  unsigned int v9 = [v8 getRegistrationStatus:&v26 date:&v25 forSerialNumber:v6 webService:v7];
  id v10 = v25;

  if (!v9)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastDeletionDateForWebService:v7]);

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v21 timeIntervalSinceDate:v20];
    double v18 = v22;

LABEL_6:
    if (v18 > 3600.0) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }

  if (!v26)
  {
LABEL_7:
    id v23 = PDWebServiceError( 4LL,  v7,  @"Update requested for unregistered serial number %@",  v11,  v12,  v13,  v14,  v15,  (uint64_t)v6);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v24,  v7,  1LL);

    goto LABEL_8;
  }

  if (v26 == 2)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v16 timeIntervalSinceDate:v10];
    double v18 = v17;

    goto LABEL_6;
  }

- (void)reportMissingTagWithRequestedSerialNumbers:(id)a3 forWebService:(id)a4
{
  id v6 = a4;
  id v7 = [a3 count];
  id v13 = PDWebServiceError( 5LL,  v6,  @"Response to 'What changed?' request included %lu serial numbers but omitted a lastUpdated tag.",  v8,  v9,  v10,  v11,  v12,  (uint64_t)v7);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = PKAggDKeyWebServicesErrorUpdateDespiteMisuse;
  v19[0] = PKAggDKeyWebServicesPassType;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 passTypeIdentifier]);
  v19[1] = @"count";
  v20[0] = v16;
  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  v20[1] = v17;
  double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  PKAnalyticsSendEvent(v15, v18);

  -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v14,  v6,  1LL);
}

- (void)reportUnmodifiedTag:(id)a3 withRequestedSerialNumbers:(id)a4 forWebService:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 count];
  id v16 = PDWebServiceError( 6LL,  v8,  @"Response to 'What changed?' request included %lu serial numbers but the lastUpdated tag (%@) remained the same.",  v11,  v12,  v13,  v14,  v15,  (uint64_t)v10);
  double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  uint64_t v18 = PKAggDKeyWebServicesErrorUpdateDespiteMisuse;
  v22[0] = PKAggDKeyWebServicesPassType;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 passTypeIdentifier]);
  v22[1] = @"count";
  v23[0] = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  v23[1] = v20;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
  PKAnalyticsSendEvent(v18, v21);

  -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v17,  v8,  1LL);
}

- (void)reportPushWithNoSerialNumbersFromTasks:(id)a3
{
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v36;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v36 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 tagLastUpdateDate]);
      if (!v9) {
        break;
      }
      id v10 = (void *)v9;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);
      [v11 timeIntervalSinceDate:v10];
      double v13 = v12;

      if (v13 < 300.0) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v14 = obj;
    id v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 webService]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 lastUpdatedTag]);
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceIdentifier]);
          id v27 = PDWebServiceError( 3LL,  v20,  @"Device received spurious push. Request for passesUpdatedSince '%@' returned no serial numbers. (Device = %@)",  v22,  v23,  v24,  v25,  v26,  (uint64_t)v21);
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

          -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v28,  v20,  1LL);
        }

        id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }

      while (v16);
    }
  }
}

- (void)reportUnchangedPassForServerRequestedUpdateTask:(id)a3
{
  id v22 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v22 context]);
  if ([v4 lastModifiedSource] == (id)1)
  {
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v22 context]);
    id v6 = [v5 lastModifiedSource];

    uint64_t v7 = v22;
    if (v6 != (id)2) {
      goto LABEL_6;
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v22 creationDate]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v22 context]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastModifiedDate]);
  [v8 timeIntervalSinceDate:v10];
  double v12 = v11;

  uint64_t v7 = v22;
  if (v12 >= 300.0)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v22 webService]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v22 serialNumber]);
    id v20 = PDWebServiceError( 0LL,  v13,  @"Server requested update to serial number '%@', but the pass was unchanged.",  v15,  v16,  v17,  v18,  v19,  (uint64_t)v14);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v21,  v13,  1LL);
    uint64_t v7 = v22;
  }

- (void)reportIgnoredIfModifiedSince:(id)a3 forSerialNumber:(id)a4 webService:(id)a5
{
  id v7 = a5;
  id v13 = PDWebServiceError( 2LL,  v7,  @"Server ignored the 'if-modified-since' header (%@) and returned the full unchanged pass data for serial number '%@'.",  v8,  v9,  v10,  v11,  v12,  (uint64_t)a3);
  id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v14,  v7,  1LL);
}

- (void)reportMissingLastModifiedForSerialNumber:(id)a3 webService:(id)a4
{
  id v6 = a4;
  id v12 = PDWebServiceError( 1LL,  v6,  @"Server returned the pass data for serial number '%@' but did not provide a 'last-modified' header.",  v7,  v8,  v9,  v10,  v11,  (uint64_t)a3);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v13,  v6,  1LL);
}

- (void)reportUnchangedPassForPersonalizationTask:(id)a3
{
  id v4 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v4 webService]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);

  id v11 = PDWebServiceError( 0LL,  v13,  @"Personalization request was issued for serial number '%@', but the pass was unchanged.",  v6,  v7,  v8,  v9,  v10,  (uint64_t)v5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  -[PDWebServicesCoordinator reportError:webService:logToService:]( self,  "reportError:webService:logToService:",  v12,  v13,  1LL);
}

- (void)reportAbandonedTask:(id)a3 passTypeID:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PDGetPassTask, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    uint64_t v10 = (id *)&PKAggDKeyWebServicesTaskTypeUpdate;
LABEL_6:
    unint64_t v15 = (unint64_t)*v10;
    goto LABEL_7;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___PDGetSerialNumbersTask, v9);
  if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0
    || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___PDWhatChangedTask, v12), (objc_opt_isKindOfClass(v5, v13) & 1) != 0))
  {
    uint64_t v10 = (id *)&PKAggDKeyWebServicesTaskTypeWhatChanged;
    goto LABEL_6;
  }

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___PDRegistrationTask, v14);
  if ((objc_opt_isKindOfClass(v5, v18) & 1) != 0)
  {
    id v20 = [v5 requestedStatus];
    uint64_t v10 = (id *)&PKAggDKeyWebServicesTaskTypeRegister;
    if (v20 != (id)1) {
      uint64_t v10 = (id *)&PKAggDKeyWebServicesTaskTypeUnregister;
    }
    goto LABEL_6;
  }

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___PDLogTask, v19);
  if ((objc_opt_isKindOfClass(v5, v21) & 1) != 0)
  {
    uint64_t v10 = (id *)&PKAggDKeyWebServicesTaskTypeLog;
    goto LABEL_6;
  }

  uint64_t v23 = objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v22);
  if ((objc_opt_isKindOfClass(v5, v23) & 1) != 0)
  {
    uint64_t v10 = (id *)&PKAggDKeyWebServicesTaskTypePersonalize;
    goto LABEL_6;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412546;
    id v29 = (id)objc_opt_class(v5, v26);
    __int16 v30 = 2112;
    unint64_t v31 = v6;
    id v27 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Unexpected abandonded task of class: %@ for passTypeID: %@",  (uint8_t *)&v28,  0x16u);
  }

  unint64_t v15 = 0LL;
LABEL_7:
  if (v6 | v15)
  {
    uint64_t v16 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    uint64_t v17 = v16;
    if (v15) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v15,  PKAggDKeyWebServicesTaskType);
    }
    if (v6) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v6,  PKAggDKeyWebServicesPassType);
    }
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  PKAnalyticsSendEvent(PKAggDKeyWebServicesErrorAbandonedTask, v17);
}

- (void)reportError:(id)a3 webService:(id)a4 logToService:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = PDErrorDescription(v8);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v23 = 138412290;
    uint64_t v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  unsigned int v15 = [v14 isEqualToString:@"PDTaskErrorDomain"];

  if (v15)
  {
    id v16 = [v8 code];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 passTypeIdentifier]);
    -[PDWebServicesCoordinator _aggdLogTaskErrorCode:passTypeID:](self, "_aggdLogTaskErrorCode:passTypeID:", v16, v17);
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    unsigned int v19 = [v18 isEqualToString:@"PDWebServiceErrorDomain"];

    if (!v19) {
      goto LABEL_11;
    }
    id v20 = [v8 code];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 passTypeIdentifier]);
    -[PDWebServicesCoordinator _aggdLogWebServiceErrorCode:passTypeID:]( self,  "_aggdLogWebServiceErrorCode:passTypeID:",  v20,  v17);
  }

LABEL_11:
  if (v5)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[PDLogTask taskWithWebService:error:](&OBJC_CLASS___PDLogTask, "taskWithWebService:error:", v9, v8));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator taskManager](self, "taskManager"));
    [v22 performTask:v21];
  }
}

- (void)reportWarnings:(id)a3 webService:(id)a4 logToService:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002B9BEC;
  v12[3] = &unk_10064FFD8;
  v12[4] = self;
  id v8 = a4;
  id v13 = v8;
  [v11 enumerateObjectsUsingBlock:v12];
  if (v5)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PDLogTask taskWithWebService:warnings:]( &OBJC_CLASS___PDLogTask,  "taskWithWebService:warnings:",  v8,  v11));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator taskManager](self, "taskManager"));
    [v10 performTask:v9];
  }
}

- (void)_aggdLogTaskWarningCode:(int64_t)a3 passTypeID:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    id v7 = PKAggDKeyWebServicesErrorWarningInvalidPass;
    unint64_t v6 = v7;
    if (v5 && v7)
    {
      uint64_t v9 = PKAggDKeyWebServicesPassType;
      id v10 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
      PKAnalyticsSendEvent(v6, v8);
    }
  }
}

- (void)_aggdLogTaskErrorCode:(int64_t)a3 passTypeID:(id)a4
{
  id v5 = a4;
  if ((unint64_t)a3 > 5)
  {
    id v7 = 0LL;
  }

  else
  {
    id v6 = *(id *)*(&off_100652AA8 + a3);
    id v7 = v6;
    if (v5 && v6)
    {
      uint64_t v9 = PKAggDKeyWebServicesPassType;
      id v10 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
      PKAnalyticsSendEvent(v7, v8);
    }
  }
}

- (void)_aggdLogWebServiceErrorCode:(int64_t)a3 passTypeID:(id)a4
{
  id v5 = a4;
  if ((unint64_t)a3 > 6)
  {
    id v7 = 0LL;
  }

  else
  {
    id v6 = *(id *)*(&off_100652AD8 + a3);
    id v7 = v6;
    if (v5 && v6)
    {
      uint64_t v9 = PKAggDKeyWebServicesPassType;
      id v10 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
      PKAnalyticsSendEvent(v7, v8);
    }
  }
}

- (void)_presentUnregistrationAlertForPassTypeID:(id)a3
{
  id v4 = a3;
  if (qword_100707AD8 != -1) {
    dispatch_once(&qword_100707AD8, &stru_1006529D8);
  }
  if (([(id)qword_100707AD0 containsObject:v4] & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDWebServicesCoordinator _userNotificationParametersForPassTypeID:]( self,  "_userNotificationParametersForPassTypeID:",  v4));
    if (v5)
    {
      [(id)qword_100707AD0 addObject:v4];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1002BA118;
      v7[3] = &unk_100652A00;
      id v8 = (id)PDOSTransactionCreate("CFUserNotification");
      uint64_t v9 = self;
      id v10 = v4;
      id v6 = v8;
      +[PKUserNotificationAgent presentNotificationWithParameters:responseHandler:]( &OBJC_CLASS___PKUserNotificationAgent,  "presentNotificationWithParameters:responseHandler:",  v5,  v7);
    }

    else
    {
      -[PDWebServicesCoordinator _unregisterPassesOfType:](self, "_unregisterPassesOfType:", v4);
    }
  }
}

- (void)_unregisterPassesOfType:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 passesWithPassTypeID:v4]);

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        unint64_t v12 = (unint64_t)[v11 settings];
        if ((v12 & 2) != 0)
        {
          unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFDLL;
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager"));
          [v14 updateSettings:v13 forPass:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }
}

- (id)_userNotificationParametersForPassTypeID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set"));
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = sub_1002BA654;
  v55 = sub_1002BA664;
  id v56 = 0LL;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = sub_1002BA654;
  v49 = sub_1002BA664;
  id v50 = 0LL;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  uint64_t v44 = 0LL;
  uint64_t v37 = 0LL;
  __int128 v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  uint64_t v40 = 0LL;
  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1002BA66C;
  v26[3] = &unk_100652A28;
  id v7 = v5;
  id v27 = v7;
  int v28 = &v33;
  id v29 = &v41;
  __int16 v30 = &v51;
  unint64_t v31 = &v37;
  __int128 v32 = &v45;
  [v6 enumerateOrganizationNamesForPassTypeID:v4 withHandler:v26];

  unint64_t v8 = v34[3];
  uint64_t v9 = v42[3];
  uint64_t v10 = v38[3];
  uint64_t v11 = PKLocalizedString(@"WALLET");
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = PKLocalizedString(@"OK_BUTTON_TITLE");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = PKLocalizedString(@"REENABLE_BUTTON_TITLE");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v52[5])
  {
    uint64_t v17 = v46[5];
    if (v17)
    {
      if (v8 <= v10 + v9) {
        __int128 v18 = @"CUTOFF_MESSAGE_TWO_ORGANIZATIONS";
      }
      else {
        __int128 v18 = @"CUTOFF_MESSAGE_MORE_ORGANIZATIONS";
      }
      uint64_t v19 = PKLocalizedString(&v18->isa, @"%@%@", v52[5], v17);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    }

    else
    {
      uint64_t v24 = PKLocalizedString(@"CUTOFF_MESSAGE_ONE_ORGANIZATION", @"%@", v52[5]);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v24);
    }

    uint64_t v22 = (os_log_s *)v20;
    v57[0] = kCFUserNotificationDefaultButtonTitleKey;
    v57[1] = kCFUserNotificationAlternateButtonTitleKey;
    v58[0] = v14;
    v58[1] = v16;
    v57[2] = kCFUserNotificationAlertMessageKey;
    v57[3] = kCFUserNotificationAlertHeaderKey;
    v58[2] = v20;
    v58[3] = v12;
    v57[4] = PKUserNotificationDontDismissOnUnlock;
    v58[4] = &__kCFBooleanTrue;
    int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  5LL));
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100442360();
    }
    int v23 = 0LL;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v23;
}

- (double)_zeroIntervalForPassTypeID:(id)a3
{
  uint64_t v4 = qword_100707AF0;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_100707AF0, &stru_100652A48);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServicesCoordinator databaseManager](self, "databaseManager"));
  id v7 = [v6 numberOfPassesOfType:v5];

  double result = *(double *)&qword_100707AE8;
  else {
    unint64_t v9 = (unint64_t)v7;
  }
  return result;
}

- (double)_updatedFrequencyScoreForScore:(double)a3 lastPushDate:(id)a4 zeroInterval:(double)a5
{
  if (a4)
  {
    id v7 = a4;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v8 timeIntervalSinceDate:v7];
    double v10 = v9;

    double v11 = (a5 - v10) / a5;
    double v12 = pow(v11, 3.0);
    if (v11 > 0.0) {
      double v11 = v12;
    }
    if (v11 + a3 >= 0.0) {
      a3 = v11 + a3;
    }
    else {
      a3 = 0.0;
    }
    uint64_t Object = PKLogFacilityTypeGetObject(2LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218752;
      double v17 = v10 / 60.0;
      __int16 v18 = 2048;
      double v19 = a5 / 60.0;
      __int16 v20 = 2048;
      double v21 = v11;
      __int16 v22 = 2048;
      double v23 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Push interval %g min; zero interval = %g min; score delta = %g; new score = %g",
        (uint8_t *)&v16,
        0x2Au);
    }
  }

  return a3;
}

- (int64_t)_rateLimitLevelForFrequencyScore:(double)a3
{
  if (qword_100707B18 != -1) {
    dispatch_once(&qword_100707B18, &stru_100652A68);
  }
  uint64_t v4 = CFPreferencesSynchronize(@"com.apple.passd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  if ((PKDisableRateLimiting(v4) & 1) != 0) {
    return 0LL;
  }
  uint64_t v6 = qword_100707B10;
  if (*(double *)&qword_100707B10 < a3)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(2LL);
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      double v17 = a3;
      __int16 v18 = 2048;
      uint64_t v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Frequency score %g exceeds cutoff threshold %g",  (uint8_t *)&v16,  0x16u);
    }

    int64_t v5 = 4LL;
LABEL_20:

    return v5;
  }

  uint64_t v9 = qword_100707B08;
  if (*(double *)&qword_100707B08 < a3)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(2LL);
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      double v17 = a3;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Frequency score %g exceeds severe rate limit threshold %g",  (uint8_t *)&v16,  0x16u);
    }

    int64_t v5 = 3LL;
    goto LABEL_20;
  }

  uint64_t v11 = qword_100707B00;
  if (*(double *)&qword_100707B00 < a3)
  {
    int64_t v5 = 2LL;
    uint64_t v12 = PKLogFacilityTypeGetObject(2LL);
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      double v17 = a3;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Frequency score %g exceeds moderate rate limit threshold %g",  (uint8_t *)&v16,  0x16u);
      int64_t v5 = 2LL;
    }

    goto LABEL_20;
  }

  uint64_t v13 = qword_100707AF8;
  if (*(double *)&qword_100707AF8 < a3)
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(2LL);
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      double v17 = a3;
      __int16 v18 = 2048;
      uint64_t v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Frequency score %g exceeds mild rate limit threshold %g",  (uint8_t *)&v16,  0x16u);
    }

    int64_t v5 = 1LL;
    goto LABEL_20;
  }

  return 0LL;
}

- (id)_nextUpdateDateWithLastUpdateDate:(id)a3 rateLimitLevel:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (qword_100707B38 == -1)
  {
    if (v5)
    {
LABEL_3:
      switch(a4)
      {
        case 0LL:
          id v7 = v6;
          goto LABEL_12;
        case 1LL:
          uint64_t v9 = qword_100707B20;
          goto LABEL_9;
        case 2LL:
          uint64_t v9 = qword_100707B28;
          goto LABEL_9;
        case 3LL:
          uint64_t v9 = qword_100707B30;
LABEL_9:
          id v7 = (id)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:*(double *)&v9]);
          goto LABEL_12;
        default:
          unint64_t v8 = 0LL;
          goto LABEL_13;
      }
    }
  }

  else
  {
    dispatch_once(&qword_100707B38, &stru_100652A88);
    if (v6) {
      goto LABEL_3;
    }
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
LABEL_12:
  unint64_t v8 = v7;
LABEL_13:

  return v8;
}

@end