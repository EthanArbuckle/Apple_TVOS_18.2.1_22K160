@interface IDSDRegistrationPushManager
+ (id)sharedInstance;
- (BOOL)_isAccountRelevantForRegistrationPush:(id)a3;
- (IDSDRegistrationPushManager)init;
- (id)_accountsWithService:(id)a3;
- (void)_acceptIncomingPushes;
- (void)_handleAction:(int64_t)a3 forAccounts:(id)a4;
- (void)_handleForceRepairRegistrationActionForAccounts:(id)a3;
- (void)_handleKTOptOutActionForAllAccounts;
- (void)_handleReIdentifyActionForAccounts:(id)a3;
- (void)_handleReProvisionActionForAccounts:(id)a3;
- (void)_handleReRegisterActionForAccounts:(id)a3;
- (void)_handleValidateCredentialsActionForAccounts:(id)a3;
- (void)_ignoreIncomingPushes;
- (void)_updatePushState;
- (void)dealloc;
- (void)fakeIncomingPushForUserID:(id)a3 style:(id)a4 service:(id)a5;
- (void)handler:(id)a3 cohortSelected:(id)a4;
- (void)handler:(id)a3 requestedPromptThroughPushWithTitle:(id)a4 message:(id)a5 defaultButton:(id)a6 defaultUrl:(id)a7 alternateButton:(id)a8 alternateUrl:(id)a9;
- (void)handler:(id)a3 requestedSysdiagnoseWithTapToRadarPushPayload:(id)a4;
- (void)handler:(id)a3 reregisterUserID:(id)a4 style:(id)a5 service:(id)a6;
- (void)startTrackingRegisteredAccountID:(id)a3;
- (void)stopTrackingRegisteredAccountID:(id)a3;
@end

@implementation IDSDRegistrationPushManager

+ (id)sharedInstance
{
  if (qword_1009BE9F0 != -1) {
    dispatch_once(&qword_1009BE9F0, &stru_1008FA2F8);
  }
  return (id)qword_1009BE9F8;
}

- (IDSDRegistrationPushManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSDRegistrationPushManager;
  v2 = -[IDSDRegistrationPushManager init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_registeredForPushes = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    registeredAccountIDs = v3->_registeredAccountIDs;
    v3->_registeredAccountIDs = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___IDSRegistrationPushHandler);
    pushHandler = v3->_pushHandler;
    v3->_pushHandler = v6;

    -[IDSRegistrationPushHandler addListener:](v3->_pushHandler, "addListener:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v8 addListener:v3];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSDRegistrationPushManager;
  -[IDSDRegistrationPushManager dealloc](&v4, "dealloc");
}

- (void)startTrackingRegisteredAccountID:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IDSDRegistrationPushManager now tracking registered account {accountID: %@}",  (uint8_t *)&v6,  0xCu);
  }

  if (v4)
  {
    -[NSMutableSet addObject:](self->_registeredAccountIDs, "addObject:", v4);
    -[IDSDRegistrationPushManager _updatePushState](self, "_updatePushState");
  }
}

- (void)stopTrackingRegisteredAccountID:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IDSDRegistrationPushManager stopped tracking registered account {accountID: %@}",  (uint8_t *)&v6,  0xCu);
  }

  if (v4)
  {
    -[NSMutableSet removeObject:](self->_registeredAccountIDs, "removeObject:", v4);
    -[IDSDRegistrationPushManager _updatePushState](self, "_updatePushState");
  }
}

- (void)_updatePushState
{
  if (-[NSMutableSet count](self->_registeredAccountIDs, "count"))
  {
    if (!self->_registeredForPushes) {
      -[IDSDRegistrationPushManager _acceptIncomingPushes](self, "_acceptIncomingPushes");
    }
  }

  else if (self->_registeredForPushes)
  {
    -[IDSDRegistrationPushManager _ignoreIncomingPushes](self, "_ignoreIncomingPushes");
  }

- (void)_acceptIncomingPushes
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "IDSDRegistrationPushManager is now accepting incoming pushes",  v4,  2u);
  }

  -[IDSRegistrationPushHandler setRegistered:](self->_pushHandler, "setRegistered:", 1LL);
  self->_registeredForPushes = 1;
}

- (void)_ignoreIncomingPushes
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "IDSDRegistrationPushManager is no longer accepting incoming pushes",  v4,  2u);
  }

  -[IDSRegistrationPushHandler setRegistered:](self->_pushHandler, "setRegistered:", 0LL);
  self->_registeredForPushes = 0;
}

- (void)fakeIncomingPushForUserID:(id)a3 style:(id)a4 service:(id)a5
{
}

- (id)_accountsWithService:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  int v6 = v5;
  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithName:v3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 accountsOnService:v8]);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accounts]);
  }

  return v9;
}

- (BOOL)_isAccountRelevantForRegistrationPush:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 accountType];
  unsigned int v5 = [v3 accountType];
  unsigned int v6 = [v3 accountType];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);

  unsigned int v8 = [v7 adHocServiceType];
  return (v4 == 1 || v5 == 0 || v6 == 3) && v8 == 0;
}

- (void)handler:(id)a3 requestedSysdiagnoseWithTapToRadarPushPayload:(id)a4
{
  id v4 = a4;
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 errorCode]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 serverErrorDetail]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 promptMessage]);
    *(_DWORD *)buf = 138412802;
    double v51 = *(double *)&v6;
    __int16 v52 = 2112;
    double v53 = *(double *)&v7;
    __int16 v54 = 2112;
    double v55 = *(double *)&v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Device received sysdiagnose request push {error code: %@, serverErrorDetail: %@, userFacingMessage: %@}",  buf,  0x20u);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v10 = v9;
  double v11 = (double)IMGetAppIntForKey(@"IDSTapToRadarLastRequestTime");
  double v12 = vabdd_f64(v10, v11);
  if (v12 >= 86400.0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
    IMSetAppValueForKey(@"IDSTapToRadarLastRequestTime", v14);

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 productBuildVersion]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 radarTitle]);
    v18 = (void *)v17;
    if (v17) {
      v19 = (const __CFString *)v17;
    }
    else {
      v19 = @"Internal IDS error detected ";
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 errorCode]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] Tap-to-Radar: %@ (server error code: %@)",  v16,  v19,  v20));
    uint64_t v22 = kIDSTapToRadarTitleKey;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v21,  kIDSTapToRadarTitleKey);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceInformationString]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 serverErrorDetail]);
    v27 = (void *)v26;
    if (v26) {
      v28 = (const __CFString *)v26;
    }
    else {
      v28 = &stru_100912B50;
    }
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v4 radarDescription]);
    v30 = (void *)v29;
    if (v29) {
      v31 = (const __CFString *)v29;
    }
    else {
      v31 = &stru_100912B50;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n\n%@\n\n%@\n\n%@",  v23,  v25,  v28,  v31));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v32,  kIDSTapToRadarDescriptionKey);

    v33 = (void *)objc_claimAutoreleasedReturnValue([v4 radarComponentName]);
    if (v33) {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, kIDSTapToRadarComponentNameKey, v33);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v4 radarComponentVersion]);
    if (v34) {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, kIDSTapToRadarComponentVersionKey, v34);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue([v4 radarComponentId]);
    if (v35) {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, kIDSTapToRadarComponentIDKey, v35);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue([v4 radarClassification]);
    if (v36) {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, kIDSTapToRadarClassificationKey, v36);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v4 radarReproducibility]);
    if (v37) {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, kIDSTapToRadarReproducibilityKey, v37);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v4 radarKeywords]);
    if (v38) {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, kIDSTapToRadarKeywordsKey, v38);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v4 radarQueryParameter]);
    if (v39) {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, kIDSTapToRadarQueryParameterKey, v39);
    }

    id v40 = [[IDSTapToRadarContext alloc] initWithDictionary:v13];
    uint64_t v41 = objc_claimAutoreleasedReturnValue([v4 promptTitle]);
    v42 = (void *)v41;
    v43 = @"Internal IDS Error Detected";
    if (v41) {
      v43 = (__CFString *)v41;
    }
    v44 = v43;

    uint64_t v45 = objc_claimAutoreleasedReturnValue([v4 promptMessage]);
    v46 = (void *)v45;
    v47 = @"An internal IDS error has been detected";
    if (v45) {
      v47 = (__CFString *)v45;
    }
    v48 = v47;

    id v49 = [[IDSTapToRadarRequest alloc] initWithTitle:v44 message:v48];
    +[IDSTapToRadar launchWithRequest:context:](&OBJC_CLASS___IDSTapToRadar, "launchWithRequest:context:", v49, v40);
  }

  else
  {
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      double v51 = v10;
      __int16 v52 = 2048;
      double v53 = v11;
      __int16 v54 = 2048;
      double v55 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Ignoring sysdiagnose request push (not enough time has passed since last prompt) { now: %f, lastPromptTime: %f, delta: %f }",  buf,  0x20u);
    }
  }
}

- (void)handler:(id)a3 requestedPromptThroughPushWithTitle:(id)a4 message:(id)a5 defaultButton:(id)a6 defaultUrl:(id)a7 alternateButton:(id)a8 alternateUrl:(id)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138413570;
    double v27 = *(double *)&v13;
    __int16 v28 = 2112;
    double v29 = *(double *)&v14;
    __int16 v30 = 2112;
    double v31 = *(double *)&v15;
    __int16 v32 = 2112;
    id v33 = v16;
    __int16 v34 = 2112;
    id v35 = v17;
    __int16 v36 = 2112;
    id v37 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Device received request for prompt {title: %@, message: %@, default button: %@, default url: %@, alternate button: %@, alternate url: %@}",  (uint8_t *)&v26,  0x3Eu);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v21 = v20;
  double v22 = (double)IMGetAppIntForKey(@"IDSPopupPromptLastRequestTime");
  double v23 = vabdd_f64(v21, v22);
  if (v23 >= 60.0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21));
    IMSetAppValueForKey(@"IDSPopupPromptLastRequestTime", v25);

    id v24 = [[IDSPopupPrompt alloc] initWithTitle:v13 promptMessage:v14];
    [v24 launchPromptWithButton:v15 defaultUrl:v16 alternateButton:v17 alternateUrl:v18];
  }

  else
  {
    id v24 = (id)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218496;
      double v27 = v21;
      __int16 v28 = 2048;
      double v29 = v22;
      __int16 v30 = 2048;
      double v31 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  OS_LOG_TYPE_DEFAULT,  "Ignoring request for prompt (not enough time has passed since last prompt) { now: %f, lastPromptTime: %f, delta: %f }",  (uint8_t *)&v26,  0x20u);
    }
  }
}

- (void)handler:(id)a3 reregisterUserID:(id)a4 style:(id)a5 service:(id)a6
{
  id v29 = a3;
  id v9 = a4;
  id v30 = a5;
  id v31 = a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v41 = _os_activity_create( (void *)&_mh_execute_header,  "Registration push manager received registration push",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v41, &state);
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v44 = v30;
    __int16 v45 = 2112;
    id v46 = v9;
    __int16 v47 = 2112;
    id v48 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Device received registration push {style: %@, userID: %@, service: %@}",  buf,  0x20u);
  }

  if (+[IDSRegistrationController isBuddyBlockingRegistration]( &OBJC_CLASS___IDSRegistrationController,  "isBuddyBlockingRegistration"))
  {
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "System not setup -- ignoring registration push",  buf,  2u);
    }
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDRegistrationPushManager _accountsWithService:](self, "_accountsWithService:", v31));
    id v14 = [v13 countByEnumeratingWithState:&v36 objects:v42 count:16];
    __int16 v32 = (void *)v12;
    if (v14)
    {
      uint64_t v34 = *(void *)v37;
      id obj = v13;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v37 != v34) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          if (-[IDSDRegistrationPushManager _isAccountRelevantForRegistrationPush:]( self,  "_isAccountRelevantForRegistrationPush:",  v16))
          {
            id v17 = [v9 length];
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 registration]);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v18 userID]);
            unsigned int v20 = [v9 isEqualToIgnoringCase:v19];

            double v21 = (void *)objc_claimAutoreleasedReturnValue([v16 registration]);
            double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 profileID]);
            if ([v9 isEqualToIgnoringCase:v22])
            {
              double v23 = (void *)objc_claimAutoreleasedReturnValue([v16 registration]);
              BOOL v24 = [v23 registrationType] == 1;
            }

            else
            {
              BOOL v24 = 0;
            }

            v25 = (void *)objc_claimAutoreleasedReturnValue([v16 registration]);
            int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 idsUserID]);
            unsigned int v27 = [v9 isEqualToIgnoringCase:v26];

            if (((v17 == 0LL) | v20 | v24 | v27) == 1)
            {
              __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v44 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Found matching candidate account for registration push {account: %@}",  buf,  0xCu);
              }

              [v32 addObject:v16];
            }
          }
        }

        id v13 = obj;
        id v14 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }

      while (v14);
    }

    double v11 = (os_log_s *)v32;
    -[IDSDRegistrationPushManager _handleAction:forAccounts:]( self,  "_handleAction:forAccounts:",  [v30 integerValue],  v32);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v41);
}

- (void)handler:(id)a3 cohortSelected:(id)a4
{
  id v4 = a4;
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Device received cohort selected push {cohortSelected: %@}",  (uint8_t *)&v8,  0xCu);
  }

  if ((unint64_t)[v4 integerValue] < 0x100)
  {
    unsigned int v6 = (os_log_s *)[[IDSBassHarborCheckInMetric alloc] initWithCohort:v4];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v7 logMetric:v6];
  }

  else
  {
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10069B128((uint64_t)v4, v6);
    }
  }
}

- (void)_handleAction:(int64_t)a3 forAccounts:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case -1LL:
      break;
    case 0LL:
      -[IDSDRegistrationPushManager _handleReIdentifyActionForAccounts:]( self,  "_handleReIdentifyActionForAccounts:",  v6);
      break;
    case 1LL:
      -[IDSDRegistrationPushManager _handleReProvisionActionForAccounts:]( self,  "_handleReProvisionActionForAccounts:",  v6);
      break;
    case 2LL:
      -[IDSDRegistrationPushManager _handleReRegisterActionForAccounts:]( self,  "_handleReRegisterActionForAccounts:",  v6);
      break;
    case 3LL:
      -[IDSDRegistrationPushManager _handleValidateCredentialsActionForAccounts:]( self,  "_handleValidateCredentialsActionForAccounts:",  v6);
      break;
    case 4LL:
      -[IDSDRegistrationPushManager _handleForceRepairRegistrationActionForAccounts:]( self,  "_handleForceRepairRegistrationActionForAccounts:",  v6);
      break;
    case 5LL:
      -[IDSDRegistrationPushManager _handleKTOptOutActionForAllAccounts](self, "_handleKTOptOutActionForAllAccounts");
      break;
    default:
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_10069B19C(a3, v7, v8);
      }

      break;
  }
}

- (void)_handleReIdentifyActionForAccounts:(id)a3
{
  id v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v40 = _os_activity_create( (void *)&_mh_execute_header,  "Registration push manager re-identify",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v40, &state);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Re-identifying accounts in response to registration push",  buf,  2u);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        BOOL v11 = [v10 registrationType] == 0;

        if (v11)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 userUniqueIdentifier]);
          [v12 setPNRReason:9 forUserUniqueIdentifier:v13];
        }

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        [v14 setRegistrationStatus:0];

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        [v15 voidPassword];

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        [v16 voidAuthenticationTokenAllowingGracePeriod];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        [v17 saveToKeychain];

        [v9 _removeAuthenticationCredentialsIncludingAuthToken:0];
      }

      id v6 = [v5 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }

    while (v6);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v18 = v5;
  id v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v19)
  {
    uint64_t v21 = *(void *)v32;
    *(void *)&__int128 v20 = 138412290LL;
    __int128 v30 = v20;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
        if (objc_msgSend(v23, "accountType", v30, (void)v31)
          || ![v23 isTemporary])
        {
          [v23 reregister];
        }

        else
        {
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 registrationConductor]);
          int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 userStore]);

          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v23 userUniqueIdentifier]);
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 userWithUniqueIdentifier:v27]);

          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            v42 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "We can't re-identify a temporary account. Nuking Home Number user %@",  buf,  0xCu);
          }

          [v26 forceRemoveUser:v28 silently:0];
        }
      }

      id v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }

    while (v19);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v40);
}

- (void)_handleReProvisionActionForAccounts:(id)a3
{
  id v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v40 = _os_activity_create( (void *)&_mh_execute_header,  "Registration push manager re-provision",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v40, &state);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Re-provisioning accounts in response to registration push",  buf,  2u);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        BOOL v11 = [v10 registrationType] == 0;

        if (v11)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 userUniqueIdentifier]);
          [v12 setPNRReason:13 forUserUniqueIdentifier:v13];

          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
          [v14 notePhoneAuthCertLost:6];
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        [v15 setAuthenticationCert:0];

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        [v16 setUris:0];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
        [v17 setRegistrationCert:0];
      }

      id v6 = [v5 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }

    while (v6);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v18 = v5;
  id v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v19)
  {
    uint64_t v21 = *(void *)v32;
    *(void *)&__int128 v20 = 138412290LL;
    __int128 v30 = v20;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
        if (objc_msgSend(v23, "accountType", v30, (void)v31)
          || ![v23 isTemporary])
        {
          [v23 reregister];
        }

        else
        {
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 registrationConductor]);
          int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 userStore]);

          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v23 userUniqueIdentifier]);
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 userWithUniqueIdentifier:v27]);

          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            v42 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "We can't re-provision a temporary account. Nuking Home Number user %@",  buf,  0xCu);
          }

          [v26 forceRemoveUser:v28 silently:0];
        }
      }

      id v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }

    while (v19);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v40);
}

- (void)_handleReRegisterActionForAccounts:(id)a3
{
  id v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v15 = _os_activity_create( (void *)&_mh_execute_header,  "Registration push manager re-register",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v15, &state);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Re-registering accounts in response to registration push",  buf,  2u);
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "reregister", (void)v9);
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v16 count:16];
    }

    while (v6);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v15);
}

- (void)_handleForceRepairRegistrationActionForAccounts:(id)a3
{
  id v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  __int128 v9 = _os_activity_create( (void *)&_mh_execute_header,  "Registration push manager repair registration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v9, &state);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Repairing registration on accounts in response to registration push",  v7,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 registrationConductor]);
  [v6 forceRepairAccounts:v3];

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v9);
}

- (void)_handleKTOptOutActionForAllAccounts
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v17 = _os_activity_create( (void *)&_mh_execute_header,  "Registration push manager kt opt out",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v17, &state);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Repairing registration on accounts in response to registration push for KT opt out.",  buf,  2u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDRegistrationPushManager _accountsWithService:](self, "_accountsWithService:", 0LL, 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v8 registrationError] == (id)47
          || [v8 registrationError] == (id)48
          || [v8 registrationError] == (id)49)
        {
          [v8 resetErrorState];
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }

    while (v5);
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registrationConductor]);
  [v10 kickRepair];

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v17);
}

- (void)_handleValidateCredentialsActionForAccounts:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v18 = _os_activity_create( (void *)&_mh_execute_header,  "Registration push manager validate credentials",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Validating credentials in response to registration push",  buf,  2u);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_1000FC208;
        v11[3] = &unk_1008F6538;
        v11[4] = self;
        v11[5] = v10;
        [v10 validateCredentialsWithDeliveryCompletionBlock:v11];
        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }

    while (v7);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v18);
}

- (void).cxx_destruct
{
}

@end