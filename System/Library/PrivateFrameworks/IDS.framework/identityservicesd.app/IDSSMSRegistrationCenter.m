@interface IDSSMSRegistrationCenter
+ (id)sharedInstance;
- (BOOL)_hasThresholdReachedForSMSTimeoutForIdentifier:(id)a3;
- (IDSPreflightStackStore)preflightStackStore;
- (IDSPushHandler)pushHandler;
- (IDSRateLimiter)registrationAttemptRateLimiter;
- (IDSRateLimiter)smallWindowSMSTimeoutRateLimiter;
- (IDSRateLimiter)wideWindowSMSTimeoutRateLimiter;
- (IDSRegistrationReasonTracker)registrationReasonTracker;
- (IDSRestoreMonitor)restoreMonitor;
- (IDSSMSRegistrationCenter)init;
- (IDSSMSRegistrationCenter)initWithRestoreMonitor:(id)a3 systemMonitor:(id)a4;
- (IDSUserStore)userStore;
- (IMSystemMonitor)systemMonitor;
- (NSArray)validators;
- (NSMapTable)CTPNRByConsentCompletion;
- (NSMutableArray)handlers;
- (NSMutableArray)registrations;
- (NSMutableDictionary)stateMachineByUserID;
- (NSMutableSet)userConsentDeniedForCTPNR;
- (id)_identifierForValidator:(id)a3;
- (void)_cleanupUntrackedValidators;
- (void)_clearConsentDenialsForUniqueIdentifier:(id)a3;
- (void)_noteRegistrationAttemptForIdentifier:(id)a3 withRegistrationInfo:(id)a4;
- (void)_notifyFailureWithError:(int64_t)a3 registration:(id)a4 identifier:(id)a5;
- (void)_notifyNeedsNewIdentification;
- (void)_notifySuccess:(id)a3 token:(id)a4 identifier:(id)a5;
- (void)_postPendingConsentAlerts;
- (void)_reportDailyPNRStatusForSimSlot:(unint64_t)a3;
- (void)_resetRateLimitersForSMSTimeoutForIdentifier:(id)a3;
- (void)_sendABCForFailureForIdentifier:(id)a3 WithEvent:(int64_t)a4 context:(id)a5;
- (void)addListener:(id)a3;
- (void)cancelActionsForRegistrationInfo:(id)a3;
- (void)clearConsentDenialsForPhoneUser:(id)a3;
- (void)clearConsentDenialsForRegistration:(id)a3;
- (void)dealloc;
- (void)notePhoneNumberRegistrationReset;
- (void)removeListener:(id)a3;
- (void)reportDailyMetric;
- (void)requestUserConsentToValidatePhoneNumberForCTPNR:(id)a3 completion:(id)a4;
- (void)sendRegistration:(id)a3;
- (void)setCTPNRByConsentCompletion:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setRegistrationAttemptRateLimiter:(id)a3;
- (void)setRegistrationReasonTracker:(id)a3;
- (void)setRestoreMonitor:(id)a3;
- (void)setSmallWindowSMSTimeoutRateLimiter:(id)a3;
- (void)setStateMachineByUserID:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setUserConsentDeniedForCTPNR:(id)a3;
- (void)setWideWindowSMSTimeoutRateLimiter:(id)a3;
- (void)validator:(id)a3 failedIdentificationWithRegistrationError:(int64_t)a4;
- (void)validator:(id)a3 handleABCEvent:(int64_t)a4;
- (void)validator:(id)a3 identifiedPhoneNumber:(id)a4 token:(id)a5 phoneBookNumber:(id)a6;
@end

@implementation IDSSMSRegistrationCenter

+ (id)sharedInstance
{
  if (qword_1009BEBF0 != -1) {
    dispatch_once(&qword_1009BEBF0, &stru_1008FBF48);
  }
  return (id)qword_1009BEBF8;
}

- (NSArray)validators
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_stateMachineByUserID, "allValues");
}

- (IDSUserStore)userStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 registrationConductor]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userStore]);

  return (IDSUserStore *)v4;
}

- (IDSRegistrationReasonTracker)registrationReasonTracker
{
  return +[IDSRegistrationReasonTracker sharedInstance](&OBJC_CLASS___IDSRegistrationReasonTracker, "sharedInstance");
}

- (IDSSMSRegistrationCenter)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestoreMonitor sharedInstance](&OBJC_CLASS___IDSRestoreMonitor, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  v5 = -[IDSSMSRegistrationCenter initWithRestoreMonitor:systemMonitor:]( self,  "initWithRestoreMonitor:systemMonitor:",  v3,  v4);

  return v5;
}

- (IDSSMSRegistrationCenter)initWithRestoreMonitor:(id)a3 systemMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___IDSSMSRegistrationCenter;
  v9 = -[IDSSMSRegistrationCenter init](&v27, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    registrations = v9->_registrations;
    v9->_registrations = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    stateMachineByUserID = v9->_stateMachineByUserID;
    v9->_stateMachineByUserID = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    preflightStackStore = v9->_preflightStackStore;
    v9->_preflightStackStore = (IDSPreflightStackStore *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    userConsentDeniedForCTPNR = v9->_userConsentDeniedForCTPNR;
    v9->_userConsentDeniedForCTPNR = v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
    pushHandler = v9->_pushHandler;
    v9->_pushHandler = (IDSPushHandler *)v18;

    objc_storeStrong((id *)&v9->_restoreMonitor, a3);
    objc_storeStrong((id *)&v9->_systemMonitor, a4);
    v20 = -[IDSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___IDSRateLimiter),  "initWithLimit:timeLimit:",  3LL,  10800.0);
    smallWindowSMSTimeoutRateLimiter = v9->_smallWindowSMSTimeoutRateLimiter;
    v9->_smallWindowSMSTimeoutRateLimiter = v20;

    v22 = -[IDSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___IDSRateLimiter),  "initWithLimit:timeLimit:",  10LL,  259200.0);
    wideWindowSMSTimeoutRateLimiter = v9->_wideWindowSMSTimeoutRateLimiter;
    v9->_wideWindowSMSTimeoutRateLimiter = v22;

    v24 = -[IDSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___IDSRateLimiter),  "initWithLimit:timeLimit:",  10LL,  259200.0);
    registrationAttemptRateLimiter = v9->_registrationAttemptRateLimiter;
    v9->_registrationAttemptRateLimiter = v24;
  }

  return v9;
}

- (void)dealloc
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_stateMachineByUserID, "allValues"));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) removeListener:self];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 removeObserver:self name:FTUserConfigurationSelectedSubscriptionLabelDidChange object:0];

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSSMSRegistrationCenter;
  -[IDSSMSRegistrationCenter dealloc](&v9, "dealloc");
}

- (void)sendRegistration:(id)a3
{
  id v4 = (IDSSMSRegistrationCenter *)a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter userUniqueIdentifier](v4, "userUniqueIdentifier"));

    if (v6)
    {
      if ((-[NSMutableArray containsObjectIdenticalTo:]( self->_registrations,  "containsObjectIdenticalTo:",  v5) & 1) == 0)
      {
        -[NSMutableArray addObject:](self->_registrations, "addObject:", v5);
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter pushHandler](self, "pushHandler"));
          objc_super v9 = (IDSSMSRegistrationCenter *)objc_claimAutoreleasedReturnValue([v8 pushToken]);
          int v26 = 138412290;
          objc_super v27 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Push handler returned push token: %@",  (uint8_t *)&v26,  0xCu);
        }

        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter pushHandler](self, "pushHandler"));
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pushToken]);
        -[IDSSMSRegistrationCenter setPushToken:](v5, "setPushToken:", v11);

        __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter pushToken](v5, "pushToken"));
          int v26 = 138412546;
          objc_super v27 = v5;
          __int16 v28 = 2112;
          v29 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Starting Phone Number Validation request for %@   with token: %@",  (uint8_t *)&v26,  0x16u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter userUniqueIdentifier](v5, "userUniqueIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter userStore](self, "userStore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userWithUniqueIdentifier:v14]);

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 SIMForIdentifier:v14]);

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 CTPNRForSIM:v18]);

            userConsentDeniedForCTPNR = self->_userConsentDeniedForCTPNR;
            v22 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueIdentifier]);
            LODWORD(userConsentDeniedForCTPNR) = -[NSMutableSet containsObject:]( userConsentDeniedForCTPNR,  "containsObject:",  v22);

            if ((_DWORD)userConsentDeniedForCTPNR)
            {
              v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                sub_10069DF08((uint64_t)self, v20, v23);
              }
            }

            else
            {
              v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_stateMachineByUserID,  "objectForKeyedSubscript:",  v14));
              if (!v23)
              {
                v23 = -[IDSPhoneNumberValidationStateMachine initWithCTPNR:preflightStackStore:]( objc_alloc(&OBJC_CLASS___IDSPhoneNumberValidationStateMachine),  "initWithCTPNR:preflightStackStore:",  v20,  self->_preflightStackStore);
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter registrationReasonTracker](self, "registrationReasonTracker"));
                -[os_log_s setReason:]( v23,  "setReason:",  [v24 getPNRReasonForUserUniqueIdentifier:v14]);

                -[os_log_s addListener:](v23, "addListener:", self);
                -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_stateMachineByUserID,  "setObject:forKeyedSubscript:",  v23,  v14);
                v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  int v26 = 138412546;
                  objc_super v27 = self;
                  __int16 v28 = 2112;
                  v29 = v14;
                  _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Adding new validations state machine {self: %@, uniqueIdentifier: %@}",  (uint8_t *)&v26,  0x16u);
                }
              }

              -[IDSSMSRegistrationCenter _noteRegistrationAttemptForIdentifier:withRegistrationInfo:]( self,  "_noteRegistrationAttemptForIdentifier:withRegistrationInfo:",  v14,  v5);
              -[os_log_s addPhoneNumberValidationRequestor:](v23, "addPhoneNumberValidationRequestor:", self);
            }
          }

          else
          {
            uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_10069DE9C();
            }
          }
        }

        else
        {
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_10069DE30();
          }
        }
      }
    }
  }
}

- (void)_cleanupUntrackedValidators
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray __imArrayByApplyingBlock:]( self->_registrations,  "__imArrayByApplyingBlock:",  &stru_1008FBF88));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imSetFromArray"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_stateMachineByUserID, "allKeys"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "__imSetFromArray"));
  id v7 = [v6 mutableCopy];

  [v7 minusSet:v4];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_stateMachineByUserID, "allKeys"));
    registrations = self->_registrations;
    *(_DWORD *)buf = 138413058;
    v25 = self;
    __int16 v26 = 2112;
    objc_super v27 = v4;
    __int16 v28 = 2112;
    v29 = v9;
    __int16 v30 = 2112;
    v31 = registrations;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_cleanupUntrackedValidators {self: %@, remainingUsers: %@, _stateMachineByUserIDKeys: %@, _registrations: %@}",  buf,  0x2Au);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_stateMachineByUserID,  "objectForKeyedSubscript:",  v16));
        [v17 removePhoneNumberValidationRequestor:self];
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v25 = self;
          __int16 v26 = 2112;
          objc_super v27 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Removing self as a phone number validation requestor {self: %@, uniqueIdentifier: %@}",  buf,  0x16u);
        }

        [v17 invalidate];
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_stateMachineByUserID,  "setObject:forKeyedSubscript:",  0LL,  v16);
      }

      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }
}

- (void)clearConsentDenialsForRegistration:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 userUniqueIdentifier]);
  -[IDSSMSRegistrationCenter _clearConsentDenialsForUniqueIdentifier:]( self,  "_clearConsentDenialsForUniqueIdentifier:",  v4);
}

- (void)clearConsentDenialsForPhoneUser:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 uniqueIdentifier]);
  -[IDSSMSRegistrationCenter _clearConsentDenialsForUniqueIdentifier:]( self,  "_clearConsentDenialsForUniqueIdentifier:",  v4);
}

- (void)_clearConsentDenialsForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v5 SIMForIdentifier:v4]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 CTPNRForSIM:v12]);

  userConsentDeniedForCTPNR = self->_userConsentDeniedForCTPNR;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  LODWORD(userConsentDeniedForCTPNR) = -[NSMutableSet containsObject:]( userConsentDeniedForCTPNR,  "containsObject:",  v9);

  if ((_DWORD)userConsentDeniedForCTPNR)
  {
    __int128 v10 = self->_userConsentDeniedForCTPNR;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    -[NSMutableSet removeObject:](v10, "removeObject:", v11);
  }
}

- (void)cancelActionsForRegistrationInfo:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObjectIdenticalTo:](self->_registrations, "containsObjectIdenticalTo:"))
  {
    -[NSMutableArray removeObjectIdenticalTo:](self->_registrations, "removeObjectIdenticalTo:", v4);
    -[IDSSMSRegistrationCenter _notifyFailureWithError:registration:identifier:]( self,  "_notifyFailureWithError:registration:identifier:",  0LL,  v4,  0LL);
    -[IDSSMSRegistrationCenter _cleanupUntrackedValidators](self, "_cleanupUntrackedValidators");
  }
}

- (void)reportDailyMetric
{
}

- (void)_reportDailyPNRStatusForSimSlot:(unint64_t)a3
{
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentSIMsWithError:0]);

  id v6 = [v5 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v35;
    while (2)
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v34 + 1) + 8 * (void)v9) slot] == (id)a3)
        {

          id v11 = objc_alloc(&OBJC_CLASS___IDSPersistentMap);
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.identityservices.dailyPNRData.%lu",  a3));
          v38[0] = objc_opt_class(&OBJC_CLASS___NSString, v13);
          v38[1] = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
          __int128 v10 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:migrationBlock:]( v11,  "initWithIdentifier:versionNumber:decodableClasses:migrationBlock:",  v12,  0LL,  v16,  0LL);

          id v17 = -[IDSPersistentMap copyDictionaryRepresentation](v10, "copyDictionaryRepresentation");
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
          id v19 = [v18 hasMultipleSIMs];

          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:IDSPNRRegStatusMetricPNRdKey]);
          id v21 = [v20 BOOLValue];

          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:IDSPNRRegStatusMetricPNRTimestampKey]);
          [v22 doubleValue];
          double v24 = v23;

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentServerTime sharedInstance](&OBJC_CLASS___IDSCurrentServerTime, "sharedInstance"));
          [v25 currentServerTimeInterval];
          double v27 = v26;

          if (v27 - v24 >= 0.0) {
            double v28 = v27 - v24;
          }
          else {
            double v28 = -(v27 - v24);
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:IDSPNRRegStatusMetricPNRMechanismKey]);
          __int16 v30 = 0LL;
          if (v28 <= 86400.0 && (_DWORD)v21 != 0) {
            __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:IDSPNRRegStatusMetricPNRErrorCodeKey]);
          }
          id v32 = [[IDSRegistrationDailyPNRStatusMetric alloc] initWithPNRCurrentlyRegistered:v21 pnrRegisteredToday:v28 <= 86400.0 pnrMechanism:v29 errorCode:v30 hasMultipleSIMs:v19];
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
          [v33 logMetric:v32];

          goto LABEL_20;
        }

        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v34 objects:v41 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  __int128 v10 = (IDSPersistentMap *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v40 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "No sim present in slot, not reporting anything. { simSlot: %lu }",  buf,  0xCu);
  }

- (void)notePhoneNumberRegistrationReset
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_stateMachineByUserID, "allValues", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resetSMSCounter];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[IDSPreflightStackStore clearAllPreflightStacks](self->_preflightStackStore, "clearAllPreflightStacks");
}

- (void)_noteRegistrationAttemptForIdentifier:(id)a3 withRegistrationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = [v7 registrationStatus];
    __int16 v16 = 1024;
    unsigned int v17 = [v7 registrationType];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Noting registration attempt for user identifier {%@} with current registration state {%ld} of type {%d}",  buf,  0x1Cu);
  }

  -[IDSRateLimiter noteItem:](self->_registrationAttemptRateLimiter, "noteItem:", v6);
  if (+[IDSAutoBugCapture isSupported](&OBJC_CLASS___IDSAutoBugCapture, "isSupported")
    && (-[IDSRateLimiter underLimitForItem:]( self->_registrationAttemptRateLimiter,  "underLimitForItem:",  v6) & 1) == 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10016FF48;
    v10[3] = &unk_1008F8320;
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Registration attempted exceeded for user identifier {%@} with current registration state {%ld} of type {%d}",  v6,  [v7 registrationStatus],  objc_msgSend(v7, "registrationType")));
    id v9 = v11;
    +[IDSAutoBugCapture triggerCaptureWithEvent:context:completion:]( &OBJC_CLASS___IDSAutoBugCapture,  "triggerCaptureWithEvent:context:completion:",  205LL,  v9,  v10);
    -[IDSRateLimiter clearItem:](self->_registrationAttemptRateLimiter, "clearItem:", v6);
  }
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray nonRetainingArray](&OBJC_CLASS___NSMutableArray, "nonRetainingArray"));
      id v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }

    -[NSMutableArray addObject:](handlers, "addObject:", v7);
  }
}

- (void)removeListener:(id)a3
{
}

- (void)_notifyFailureWithError:(int64_t)a3 registration:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  id v30 = a5;
  registrations = self->_registrations;
  double v27 = v8;
  if (!v8)
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id obj = -[NSMutableArray copy](registrations, "copy");
    id v31 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(id *)(*((void *)&v36 + 1) + 8LL * (void)i);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 userUniqueIdentifier]);
          unsigned int v20 = [v19 isEqualToString:v30];

          if (v20)
          {
            [v18 setRegistrationStatus:-1];
            id v21 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            __int128 v32 = 0u;
            __int128 v33 = 0u;
            id v22 = v21;
            id v23 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v33;
              do
              {
                for (j = 0LL; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v33 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  double v26 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
                  if ((objc_opt_respondsToSelector(v26, "center:failedIdentification:error:") & 1) != 0) {
                    [v26 center:self failedIdentification:v18 error:a3];
                  }
                }

                id v23 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
              }

              while (v23);
            }

            -[NSMutableArray removeObjectIdenticalTo:](self->_registrations, "removeObjectIdenticalTo:", v18);
          }
        }

        id v31 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      }

      while (v31);
    }

    id v12 = obj;
    id v10 = obj;
    goto LABEL_32;
  }

  if ((-[NSMutableArray containsObjectIdenticalTo:](registrations, "containsObjectIdenticalTo:", v8) & 1) == 0)
  {
    id v10 = v8;
    -[NSMutableArray removeObjectIdenticalTo:](self->_registrations, "removeObjectIdenticalTo:", v10);
    [v10 setRegistrationStatus:-1];
    id v11 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v41;
      do
      {
        for (k = 0LL; k != v13; k = (char *)k + 1)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v12);
          }
          __int16 v16 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)k);
          if ((objc_opt_respondsToSelector(v16, "center:failedIdentification:error:") & 1) != 0) {
            [v16 center:self failedIdentification:v10 error:a3];
          }
        }

        id v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }

      while (v13);
    }

LABEL_32:
  }
}

- (void)_notifySuccess:(id)a3 token:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  __int128 v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSMutableArray count](self->_registrations, "count"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
    [v10 notePNRSuccess];

    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v11 = self->_registrations;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v52,  v61,  16LL);
    if (v12)
    {
      uint64_t v13 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userUniqueIdentifier]);
          unsigned int v17 = [v16 isEqualToString:v38];

          if (v17)
          {
            [v15 setAuthenticationCert:0];
            id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
            [v18 notePhoneAuthCertLost:7];

            [v15 setPhoneNumber:v8];
            [v15 setMainID:v8];
            [v15 setAuthenticationToken:v9];
            [v15 setRegistrationCert:0];
            [v15 setUris:0];
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v60 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Updating registration info: %@",  buf,  0xCu);
            }

            -[NSMutableArray addObject:](v34, "addObject:", v15);
          }
        }

        id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v52,  v61,  16LL);
      }

      while (v12);
    }
  }

  else
  {
    id v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "No registration info present, we must have been cancelled",  buf,  2u);
    }
  }

  if (-[NSMutableArray count](self->_registrations, "count"))
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id obj = v34;
    id v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v57,  16LL);
    if (v37)
    {
      uint64_t v35 = *(void *)v45;
      do
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v45 != v35)
          {
            uint64_t v21 = v20;
            objc_enumerationMutation(obj);
            uint64_t v20 = v21;
          }

          uint64_t v39 = v20;
          id v22 = *(id *)(*((void *)&v44 + 1) + 8 * v20);
          -[NSMutableArray removeObjectIdenticalTo:](self->_registrations, "removeObjectIdenticalTo:", v22);
          if ([v22 isDisabled])
          {
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v60 = v22;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Not reflecting back succeeded identification, registration is disabled: %@",  buf,  0xCu);
            }
          }

          else
          {
            id v24 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
            __int128 v42 = 0u;
            __int128 v43 = 0u;
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            id v23 = (os_log_s *)v24;
            id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v40,  v56,  16LL);
            if (v25)
            {
              uint64_t v26 = *(void *)v41;
              do
              {
                for (j = 0LL; j != v25; j = (char *)j + 1)
                {
                  if (*(void *)v41 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  double v28 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
                  if ((objc_opt_respondsToSelector(v28, "center:succeededIdentification:phoneNumber:token:") & 1) != 0) {
                    [v28 center:self succeededIdentification:v22 phoneNumber:v8 token:v9];
                  }
                }

                id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v40,  v56,  16LL);
              }

              while (v25);
            }
          }

          uint64_t v20 = v39 + 1;
        }

        while ((id)(v39 + 1) != v37);
        id v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v57,  16LL);
      }

      while (v37);
    }
  }

  else
  {
    id v29 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id obj = (NSMutableArray *)v29;
    id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v58,  16LL);
    if (v30)
    {
      uint64_t v31 = *(void *)v49;
      do
      {
        for (k = 0LL; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(obj);
          }
          __int128 v33 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)k);
          if ((objc_opt_respondsToSelector(v33, "center:succeededIdentification:phoneNumber:token:") & 1) != 0) {
            [v33 center:self succeededIdentification:0 phoneNumber:v8 token:v9];
          }
        }

        id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v58,  16LL);
      }

      while (v30);
    }
  }
}

- (void)_notifyNeedsNewIdentification
{
  id v3 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "centerNeedsNewIdentification:") & 1) != 0) {
          [v8 centerNeedsNewIdentification:self];
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (id)_identifierForValidator:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_stateMachineByUserID;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_stateMachineByUserID,  "objectForKeyedSubscript:",  v10,  (void)v14));

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  return v12;
}

- (void)validator:(id)a3 identifiedPhoneNumber:(id)a4 token:(id)a5 phoneBookNumber:(id)a6
{
  id v21 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter _identifierForValidator:](self, "_identifierForValidator:", a3));
  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter userStore](self, "userStore"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 userWithUniqueIdentifier:v12]);

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 phoneUserWithUpdatedPhoneNumber:v21 phoneBookNumber:v11]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter userStore](self, "userStore"));
    [v16 updateUser:v15];

    __int128 v17 = -[IDSPhoneUserCredential initWithSMSSignature:]( objc_alloc(&OBJC_CLASS___IDSPhoneUserCredential),  "initWithSMSSignature:",  v10);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter userStore](self, "userStore"));
    [v18 setCredential:v17 forUser:v15];

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter registrationReasonTracker](self, "registrationReasonTracker"));
    [v19 clearPNRReasonForUserUniqueIdentifier:v12];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueIdentifier]);
    -[IDSSMSRegistrationCenter _notifySuccess:token:identifier:]( self,  "_notifySuccess:token:identifier:",  v21,  v10,  v20);
  }

  -[IDSSMSRegistrationCenter _cleanupUntrackedValidators](self, "_cleanupUntrackedValidators");
}

- (void)validator:(id)a3 failedIdentificationWithRegistrationError:(int64_t)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter _identifierForValidator:](self, "_identifierForValidator:", a3));
  if (v7)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter registrationReasonTracker](self, "registrationReasonTracker"));
    [v6 clearPNRReasonForUserUniqueIdentifier:v7];
  }

  -[IDSSMSRegistrationCenter _notifyFailureWithError:registration:identifier:]( self,  "_notifyFailureWithError:registration:identifier:",  a4,  0LL,  v7);
  -[IDSSMSRegistrationCenter _cleanupUntrackedValidators](self, "_cleanupUntrackedValidators");
}

- (void)validator:(id)a3 handleABCEvent:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter _identifierForValidator:](self, "_identifierForValidator:", a3));
  if (a4 == 204)
  {
    __int128 v9 = v6;
    unsigned int v8 = -[IDSSMSRegistrationCenter _hasThresholdReachedForSMSTimeoutForIdentifier:]( self,  "_hasThresholdReachedForSMSTimeoutForIdentifier:",  v6);
    id v6 = v9;
    if (v8)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PNR Registration failed for Identifier: %@ Failure: SMS timeout threshold reached",  v9));
      -[IDSSMSRegistrationCenter _sendABCForFailureForIdentifier:WithEvent:context:]( self,  "_sendABCForFailureForIdentifier:WithEvent:context:",  v9,  204LL,  v7);
      -[IDSSMSRegistrationCenter _resetRateLimitersForSMSTimeoutForIdentifier:]( self,  "_resetRateLimitersForSMSTimeoutForIdentifier:",  v9);
      goto LABEL_6;
    }
  }

  else if (a4 == 203)
  {
    __int128 v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PNR Registration failed for Identifier: %@ Failure: SMS quota exhausted",  v6));
    -[IDSSMSRegistrationCenter _sendABCForFailureForIdentifier:WithEvent:context:]( self,  "_sendABCForFailureForIdentifier:WithEvent:context:",  v9,  203LL,  v7);
LABEL_6:

    id v6 = v9;
  }
}

- (BOOL)_hasThresholdReachedForSMSTimeoutForIdentifier:(id)a3
{
  id v4 = a3;
  -[IDSRateLimiter noteItem:](self->_smallWindowSMSTimeoutRateLimiter, "noteItem:", v4);
  -[IDSRateLimiter noteItem:](self->_wideWindowSMSTimeoutRateLimiter, "noteItem:", v4);
  if (-[IDSRateLimiter underLimitForItem:]( self->_smallWindowSMSTimeoutRateLimiter,  "underLimitForItem:",  v4)) {
    unsigned int v5 = -[IDSRateLimiter underLimitForItem:]( self->_wideWindowSMSTimeoutRateLimiter,  "underLimitForItem:",  v4) ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_resetRateLimitersForSMSTimeoutForIdentifier:(id)a3
{
  smallWindowSMSTimeoutRateLimiter = self->_smallWindowSMSTimeoutRateLimiter;
  id v5 = a3;
  -[IDSRateLimiter clearItem:](smallWindowSMSTimeoutRateLimiter, "clearItem:", v5);
  -[IDSRateLimiter clearItem:](self->_wideWindowSMSTimeoutRateLimiter, "clearItem:", v5);
}

- (void)_sendABCForFailureForIdentifier:(id)a3 WithEvent:(int64_t)a4 context:(id)a5
{
  id v6 = a5;
  if (+[IDSAutoBugCapture isSupported](&OBJC_CLASS___IDSAutoBugCapture, "isSupported"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100171204;
    v7[3] = &unk_1008F8320;
    id v8 = v6;
    +[IDSAutoBugCapture triggerCaptureWithEvent:context:completion:]( &OBJC_CLASS___IDSAutoBugCapture,  "triggerCaptureWithEvent:context:completion:",  a4,  v8,  v7);
  }
}

- (void)requestUserConsentToValidatePhoneNumberForCTPNR:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL);
    uint64_t v10 = im_primary_queue(v8, v9);
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001713C0;
    block[3] = &unk_1008F92D8;
    id v14 = v7;
    block[4] = self;
    id v13 = v6;
    dispatch_after(v8, v11, block);
  }
}

- (void)_postPendingConsentAlerts
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter CTPNRByConsentCompletion](self, "CTPNRByConsentCompletion"));
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v13 = v5;
    do
    {
      dispatch_time_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v8);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms", v13));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          uint64_t v19 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Processing pending SMS alerts after restore {CTPNR: %@}",  buf,  0xCu);
        }

        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSMSRegistrationCenter CTPNRByConsentCompletion](self, "CTPNRByConsentCompletion"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);

        -[IDSSMSRegistrationCenter requestUserConsentToValidatePhoneNumberForCTPNR:completion:]( self,  "requestUserConsentToValidatePhoneNumberForCTPNR:completion:",  v9,  v12);
        dispatch_time_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v6);
  }

  -[IDSSMSRegistrationCenter setCTPNRByConsentCompletion:](self, "setCTPNRByConsentCompletion:", 0LL);
}

- (IDSPushHandler)pushHandler
{
  return (IDSPushHandler *)+[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps");
}

- (NSMutableDictionary)stateMachineByUserID
{
  return self->_stateMachineByUserID;
}

- (void)setStateMachineByUserID:(id)a3
{
}

- (NSMutableArray)registrations
{
  return self->_registrations;
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (IDSPreflightStackStore)preflightStackStore
{
  return self->_preflightStackStore;
}

- (void)setPushHandler:(id)a3
{
}

- (NSMutableSet)userConsentDeniedForCTPNR
{
  return self->_userConsentDeniedForCTPNR;
}

- (void)setUserConsentDeniedForCTPNR:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSRestoreMonitor)restoreMonitor
{
  return self->_restoreMonitor;
}

- (void)setRestoreMonitor:(id)a3
{
}

- (NSMapTable)CTPNRByConsentCompletion
{
  return self->_CTPNRByConsentCompletion;
}

- (void)setCTPNRByConsentCompletion:(id)a3
{
}

- (IDSRateLimiter)smallWindowSMSTimeoutRateLimiter
{
  return self->_smallWindowSMSTimeoutRateLimiter;
}

- (void)setSmallWindowSMSTimeoutRateLimiter:(id)a3
{
}

- (IDSRateLimiter)wideWindowSMSTimeoutRateLimiter
{
  return self->_wideWindowSMSTimeoutRateLimiter;
}

- (void)setWideWindowSMSTimeoutRateLimiter:(id)a3
{
}

- (IDSRateLimiter)registrationAttemptRateLimiter
{
  return self->_registrationAttemptRateLimiter;
}

- (void)setRegistrationAttemptRateLimiter:(id)a3
{
}

- (void)setRegistrationReasonTracker:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end