@interface IDSAppleIDRegistrationCenter
+ (id)sharedInstance;
- (BOOL)_haveQueuedMessageForRegistration:(id)a3 inQueueForKey:(id)a4;
- (BOOL)_queryInitialInvitationContextForRegistration:(id)a3;
- (BOOL)_registrationIsAuthenticating:(id)a3;
- (BOOL)_registrationNeedsAuthentication:(id)a3;
- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4;
- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4 failIfNotSilent:(BOOL)a5;
- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4 forceRenewal:(BOOL)a5 failIfNotSilent:(BOOL)a6;
- (BOOL)_validateRegionID:(id)a3 phoneNumber:(id)a4 registration:(id)a5;
- (BOOL)authenticateRegistration:(id)a3;
- (BOOL)authenticateRegistration:(id)a3 forceNewToken:(BOOL)a4;
- (BOOL)authenticateRegistration:(id)a3 forceNewToken:(BOOL)a4 requireSilentAuth:(BOOL)a5;
- (BOOL)authenticateRegistration:(id)a3 forceRenewal:(BOOL)a4 requireSilentAuth:(BOOL)a5;
- (BOOL)authenticateRegistration:(id)a3 requireSilentAuth:(BOOL)a4;
- (BOOL)queryInitialInvitationContextForRegistration:(id)a3;
- (BOOL)validateRegion:(id)a3 phoneNumber:(id)a4 forRegistration:(id)a5;
- (IDSAppleIDRegistrationCenter)init;
- (IDSAppleIDRegistrationCenter)initWithMessageDelivery:(id)a3 passwordManager:(id)a4;
- (id)_queueForKey:(id)a3;
- (void)_fetchTokenForRegistrationInfo:(id)a3 failIfNotSilent:(BOOL)a4 failureBlock:(id)a5;
- (void)_noteSuccessfulToken:(id)a3 profileID:(id)a4 selfID:(id)a5 forRegistrationInfo:(id)a6 wasFetched:(BOOL)a7;
- (void)_notifyAuthenticating:(id)a3;
- (void)_notifyAuthenticationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7;
- (void)_notifyAuthenticationSuccess:(id)a3;
- (void)_notifyInitialRegionQuerySuccess:(id)a3;
- (void)_notifyRegionValidationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7;
- (void)_notifyRegionValidationSuccess:(id)a3 regionID:(id)a4 phoneNumber:(id)a5 context:(id)a6 verified:(BOOL)a7;
- (void)_postUserNotificationWithTitle:(id)a3 message:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)_processDefaultInvitationContextMessage:(id)a3 deliveredWithError:(id)a4 resultCode:(int64_t)a5 resultDictionary:(id)a6;
- (void)_processRegionValidationMessage:(id)a3 deliveredWithError:(id)a4 resultCode:(int64_t)a5 resultDictionary:(id)a6;
- (void)_removeMessageForRegistration:(id)a3 fromQueueForKey:(id)a4;
- (void)_renewTokenForRegistrationInfo:(id)a3 forceRenewal:(BOOL)a4 failIfNotSilent:(BOOL)a5;
- (void)_serviceQueueForKey:(id)a3;
- (void)_setQueue:(id)a3 forKey:(id)a4;
- (void)addListener:(id)a3;
- (void)cancelActionsForRegistrationInfo:(id)a3;
- (void)dealloc;
- (void)removeListener:(id)a3;
@end

@implementation IDSAppleIDRegistrationCenter

+ (id)sharedInstance
{
  if (qword_1009C0C10 != -1) {
    dispatch_once(&qword_1009C0C10, &stru_100902970);
  }
  return (id)qword_1009C0C18;
}

- (IDSAppleIDRegistrationCenter)initWithMessageDelivery:(id)a3 passwordManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSAppleIDRegistrationCenter;
  v9 = -[IDSAppleIDRegistrationCenter init](&v12, "init");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v10 addListener:v9];

    objc_storeStrong((id *)&v9->_messageDelivery, a3);
    -[IDSAppleIDRegistrationCenterMessageDelivery setUserAgent:]( v9->_messageDelivery,  "setUserAgent:",  @"com.apple.invitation-registration");
    -[IDSAppleIDRegistrationCenterMessageDelivery setLogToRegistration:]( v9->_messageDelivery,  "setLogToRegistration:",  1LL);
    objc_storeStrong((id *)&v9->_passwordManager, a4);
  }

  return v9;
}

- (IDSAppleIDRegistrationCenter)init
{
  id v3 = objc_alloc_init((Class)+[FTMessageDelivery HTTPMessageDeliveryClass]( &OBJC_CLASS___FTMessageDelivery,  "HTTPMessageDeliveryClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationRequestTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationRequestTracker,  "sharedInstance"));
  [v3 addRequestObserver:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
  v6 = -[IDSAppleIDRegistrationCenter initWithMessageDelivery:passwordManager:]( self,  "initWithMessageDelivery:passwordManager:",  v3,  v5);

  return v6;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  [v3 removeListener:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:0 object:0];

  -[IDSAppleIDRegistrationCenterMessageDelivery invalidate](self->_messageDelivery, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSAppleIDRegistrationCenter;
  -[IDSAppleIDRegistrationCenter dealloc](&v5, "dealloc");
}

- (id)_queueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queues, "objectForKey:", v4));
    v6 = (NSMutableArray *)v5;
    if (self->_queues)
    {
      if (!v5) {
        goto LABEL_7;
      }
    }

    else
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      queues = self->_queues;
      self->_queues = Mutable;

      if (!v6)
      {
LABEL_7:
        v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableDictionary setObject:forKey:](self->_queues, "setObject:forKey:", v6, v4);
      }
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (void)_setQueue:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    queues = self->_queues;
    id v8 = v11;
    if (v11)
    {
      if (!queues)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        v10 = self->_queues;
        self->_queues = Mutable;

        id v8 = v11;
        queues = self->_queues;
      }

      -[NSMutableDictionary setObject:forKey:](queues, "setObject:forKey:", v8, v6);
    }

    else
    {
      -[NSMutableDictionary removeObjectForKey:](queues, "removeObjectForKey:", v6);
    }
  }
}

- (void)_serviceQueueForKey:(id)a3
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", a3));
  id obj = [v15 _copyForEnumerating];
  id v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"info"]);

        if ((objc_opt_respondsToSelector(v7, "setAuthToken:") & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 authenticationToken]);
          [v7 setAuthToken:v10];
        }

        if ((objc_opt_respondsToSelector(v7, "setProfileID:") & 1) != 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 profileID]);
          [v7 setProfileID:v11];
        }

        if ((objc_opt_respondsToSelector(v7, "setPushToken:") & 1) != 0)
        {
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v9 pushToken]);
          [v7 setPushToken:v12];
        }

        if ((objc_opt_respondsToSelector(v7, "setDSAuthID:") & 1) != 0)
        {
          id v13 = sub_1002408C4(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          [v7 setDSAuthID:v14];
        }

        -[IDSAppleIDRegistrationCenterMessageDelivery sendMessage:](self->_messageDelivery, "sendMessage:", v7);
      }

      id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v4);
  }

  [v15 removeAllObjects];
}

- (BOOL)_haveQueuedMessageForRegistration:(id)a3 inQueueForKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  BOOL v9 = 0;
  if (v6 && v8)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", v7));
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)i), "userInfo", (void)v18));
          id v16 = (id)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"info"]);

          if (v16 == v6)
          {
            id v16 = v6;
LABEL_15:

            BOOL v9 = 1;
            goto LABEL_16;
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        BOOL v9 = 0;
        if (v12) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v9 = 0;
    }

- (void)_removeMessageForRegistration:(id)a3 fromQueueForKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  if (v6 && v8)
  {
    __int128 v19 = self;
    id v20 = v7;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", v7));
    id v10 = [v9 mutableCopy];
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 userInfo]);
          id v18 = (id)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"info"]);
        }

        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v13);
    }

    id v7 = v20;
    -[IDSAppleIDRegistrationCenter _setQueue:forKey:](v19, "_setQueue:forKey:", v10, v20);
  }
}

- (void)_notifyInitialRegionQuerySuccess:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not reflecting back initial region query success, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", off_1009B8950));
    [v6 removeObjectIdenticalTo:v4];

    id v7 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v5 = (os_log_s *)v7;
    id v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v11, "center:succeededInitialRegionQuery:") & 1) != 0) {
            [v11 center:self succeededInitialRegionQuery:v4];
          }
        }

        id v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v8);
    }
  }
}

- (void)_notifyRegionValidationSuccess:(id)a3 regionID:(id)a4 phoneNumber:(id)a5 context:(id)a6 verified:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v34 = a4;
  id v13 = a5;
  id v14 = a6;
  v35 = v12;
  unsigned int v15 = [v12 isDisabled];
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Not reflecting back region validation success, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    if (v17)
    {
      id v18 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v42 = v12;
      if (v7) {
        id v18 = @"YES";
      }
      __int16 v43 = 2112;
      id v44 = v34;
      __int16 v45 = 2112;
      id v46 = v13;
      __int16 v47 = 2112;
      id v48 = v14;
      __int16 v49 = 2112;
      v50 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Notifying of region validation success for registration: %@    region: %@   phone number: %@   context: %@  verified: %@",  buf,  0x34u);
    }

    [v12 setRegionID:v34];
    [v12 setRegionBasePhoneNumber:v13];
    [v12 setRegionServerContext:v14];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", off_1009B8958));
    [v19 removeObjectIdenticalTo:v12];

    id v20 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v21 = v20;
    id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector( v25,  "center:succeededRegionValidation:regionID:phoneNumber:extraContext:verified:") & 1) != 0) {
            [v25 center:self succeededRegionValidation:v35 regionID:v34 phoneNumber:v13 extraContext:v14 verified:v7];
          }
        }

        id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }

      while (v22);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
    unsigned int v27 = [v26 wiFiActiveAndReachable];

    if (v27) {
      uint64_t v28 = 2LL;
    }
    else {
      uint64_t v28 = 1LL;
    }
    uint64_t v29 = sub_10019EA40(0LL);
    uint64_t v30 = sub_10019EF00(-1LL);
    FTAWDLogRegistrationProfileValidateInvitationContext(0LL, 1LL, v28, v29, v30, 0LL, 0LL, 0LL);
    id v31 = objc_alloc(&OBJC_CLASS___IDSRegistrationProfileOperationValidateInvitationContext);
    uint64_t v32 = sub_10019EA40(0LL);
    id v16 = (os_log_s *)[v31 initWithGuid:0 success:1 connectionType:v28 resultCode:v32 registrationError:sub_10019EF00(-1) genericError:0 URLError:0 POSIXError:0];
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v33 logMetric:v16];
  }
}

- (void)_notifyRegionValidationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7
{
  id v12 = a3;
  id v44 = a6;
  id v13 = a7;
  if ([v12 isDisabled])
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not reflecting back region validation success, registration is disabled: %@",  buf,  0xCu);
    }

    goto LABEL_44;
  }

  int64_t v42 = a4;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", off_1009B8958));
  [v15 removeObjectIdenticalTo:v12];

  sub_10012E874(0, @"Registration", @"Region Validation failed", 1073LL);
  id v16 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v21, "center:failedRegionValidation:error:info:") & 1) != 0) {
          [v21 center:self failedRegionValidation:v12 error:a5 info:v13];
        }
      }

      id v18 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }

    while (v18);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v44 domain]);
  unsigned __int8 v43 = [v22 isEqualToString:NSPOSIXErrorDomain];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v44 domain]);
  if ([v23 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v24 = 1;
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v44 domain]);
    unsigned int v24 = [v25 isEqualToString:kCFErrorDomainCFNetwork];
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
  unsigned int v27 = [v26 wiFiActiveAndReachable];

  if (v27) {
    int v28 = 2;
  }
  else {
    int v28 = 1;
  }
  unsigned int v41 = v28;
  uint64_t v29 = sub_10019EA40(v42);
  uint64_t v30 = sub_10019EF00(a5);
  if (((v24 | v43) & 1) != 0)
  {
    id v31 = 0LL;
    if (v24)
    {
LABEL_21:
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v44 code]));
      goto LABEL_24;
    }
  }

  else
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v44 code]));
    if (v24) {
      goto LABEL_21;
    }
  }

  uint64_t v32 = 0LL;
LABEL_24:
  if ((v43 & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v44 code]));
    FTAWDLogRegistrationProfileValidateInvitationContext(0LL, 0LL, v41, v29, v30, v31, v32, v33);
  }

  else
  {
    FTAWDLogRegistrationProfileValidateInvitationContext(0LL, 0LL, v41, v29, v30, v31, v32, 0LL);
  }

  if (v24) {

  }
  id v34 = objc_alloc(&OBJC_CLASS___IDSRegistrationProfileOperationValidateInvitationContext);
  uint64_t v35 = sub_10019EA40(v42);
  uint64_t v36 = sub_10019EF00(a5);
  if (((v24 | v43) & 1) != 0)
  {
    __int128 v37 = 0LL;
    if (v24)
    {
LABEL_33:
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v44 code]));
      goto LABEL_36;
    }
  }

  else
  {
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v44 code]));
    if (v24) {
      goto LABEL_33;
    }
  }

  __int128 v38 = 0LL;
LABEL_36:
  if ((v43 & 1) != 0)
  {
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v44 code]));
    id v14 = (os_log_s *)[v34 initWithGuid:0 success:0 connectionType:v41 resultCode:v35 registrationError:v36 genericError:v37 URLError:v38 POSIXError:v39];

    if (!v24) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }

  id v14 = (os_log_s *)[v34 initWithGuid:0 success:0 connectionType:v41 resultCode:v35 registrationError:v36 genericError:v37 URLError:v38 POSIXError:0];
  if (v24) {
LABEL_40:
  }

LABEL_41:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v40 logMetric:v14];

LABEL_44:
}

- (void)_notifyAuthenticating:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not reflecting back started authenticating, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v6 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v5 = (os_log_s *)v6;
    id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v10, "center:startedAuthenticating:") & 1) != 0) {
            [v10 center:self startedAuthenticating:v4];
          }
        }

        id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_notifyAuthenticationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7
{
  id v11 = a3;
  id v35 = a6;
  id v12 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v41 = _os_activity_create( (void *)&_mh_execute_header,  "Apple ID registration center notify authentication failure",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v41, &state);
  if ([v11 isDisabled])
  {
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Not reflecting back authentication failure, registration is disabled: %@",  buf,  0xCu);
    }

- (void)_notifyAuthenticationSuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v23 = _os_activity_create( (void *)&_mh_execute_header,  "Apple ID registration center notify authentication success",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v23, &state);
  if ([v4 isDisabled])
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not reflecting back authentication success, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", off_1009B8960));
    [v6 removeObject:v4];

    id v7 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v12, "center:succeededAuthentication:") & 1) != 0) {
            [v12 center:self succeededAuthentication:v4];
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }

      while (v9);
    }

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
    unsigned int v14 = [v13 wiFiActiveAndReachable];

    if (v14) {
      uint64_t v15 = 2LL;
    }
    else {
      uint64_t v15 = 1LL;
    }
    uint64_t v16 = sub_10019EA40(0LL);
    uint64_t v17 = sub_10019EF00(-1LL);
    FTAWDLogRegistrationProfileAuthenticate(0LL, 1LL, v15, v16, v17, 0LL, 0LL, 0LL);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v23);
}

- (void)_postUserNotificationWithTitle:(id)a3 message:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v14));
  id v22 = (id)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v16 = IMLocalizedStringFromTableInBundle(@"OK", @"IDSLocalizable", v22, @"OK Button Title");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = IMLocalizedStringFromTableInBundle( @"Cancel",  @"FaceTimeLocalizable",  v22,  @"Cancel Button Title");
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  v11,  v13,  v12,  v17,  v19,  0LL));

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
  [v21 addUserNotification:v20 listener:0 completionHandler:v10];
}

- (void)_processDefaultInvitationContextMessage:(id)a3 deliveredWithError:(id)a4 resultCode:(int64_t)a5 resultDictionary:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109634;
    v20[1] = a5;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "  Received default invitation context with result: %d  error: %@  result dictionary: %@",  (uint8_t *)v20,  0x1Cu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"info"]);

  if (a5 == 6005)
  {
    sub_10012E874(0, @"Registration", @"Need to re-authenticate", 1073LL);
    [v15 setAuthenticationToken:0];
  }

  else if (a5)
  {
    sub_10012E874(0, @"Registration", @"Default context query failed", 1073LL);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 responseRegionID]);
    if (v16) {
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 responseRegionID]);
    }
    else {
      uint64_t v17 = &stru_100912B50;
    }
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 responseBasePhoneNumber]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v10 responseExtraInfo]);
    -[IDSAppleIDRegistrationCenter _notifyRegionValidationSuccess:regionID:phoneNumber:context:verified:]( self,  "_notifyRegionValidationSuccess:regionID:phoneNumber:context:verified:",  v15,  v17,  v18,  v19,  [v10 responseValidated]);

    if (v16) {
  }
    }

  -[IDSAppleIDRegistrationCenter _notifyInitialRegionQuerySuccess:](self, "_notifyInitialRegionQuerySuccess:", v15);
}

- (void)_processRegionValidationMessage:(id)a3 deliveredWithError:(id)a4 resultCode:(int64_t)a5 resultDictionary:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109378;
    v19[1] = a5;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "  Received region validation response with result: %d  error: %@",  (uint8_t *)v19,  0x12u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"info"]);

  if (a5 == 6005)
  {
    sub_10012E874(0, @"Registration", @"Need to re-authenticate", 1073LL);
    [v13 setAuthenticationToken:0];
    -[IDSAppleIDRegistrationCenter _renewTokenForRegistrationInfo:forceRenewal:failIfNotSilent:]( self,  "_renewTokenForRegistrationInfo:forceRenewal:failIfNotSilent:",  v13,  0LL,  0LL);
  }

  else if (a5)
  {
    sub_10012E874(0, @"Registration", @"Region validation failed", 1073LL);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 responseAlertInfo]);
    -[IDSAppleIDRegistrationCenter _notifyRegionValidationFailure:responseCode:registrationError:error:info:]( self,  "_notifyRegionValidationFailure:responseCode:registrationError:error:info:",  v13,  a5,  46LL,  v10,  v16);
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 responseRegionID]);
    if (v14) {
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 responseRegionID]);
    }
    else {
      uint64_t v15 = &stru_100912B50;
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 responseBasePhoneNumber]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 responseExtraInfo]);
    -[IDSAppleIDRegistrationCenter _notifyRegionValidationSuccess:regionID:phoneNumber:context:verified:]( self,  "_notifyRegionValidationSuccess:regionID:phoneNumber:context:verified:",  v13,  v15,  v17,  v18,  1LL);

    if (v14) {
  }
    }
}

- (void)_noteSuccessfulToken:(id)a3 profileID:(id)a4 selfID:(id)a5 forRegistrationInfo:(id)a6 wasFetched:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v31 = _os_activity_create( (void *)&_mh_execute_header,  "Apple ID registration center note successful token",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v31, &state);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = @"NO";
    *(_DWORD *)buf = 134219010;
    id v33 = v12;
    if (v7) {
      uint64_t v17 = @"YES";
    }
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2112;
    __int128 v39 = v17;
    __int16 v40 = 2112;
    id v41 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Noting successful token: %p   for profile ID: %@   self handle: %@  wasFetched: %@  registration: %@",  buf,  0x34u);
  }

  if ([v13 rangeOfString:@"@"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 profileID]);
    if (!v18
      || (__int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 profileID]),
          unsigned __int8 v20 = [v19 isEqualToString:v13],
          v19,
          v18,
          (v20 & 1) == 0))
    {
      [v15 setProfileID:v13];
    }
  }

  else
  {
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_1006A8898((uint64_t)v13, v21, v22, v23, v24, v25, v26, v27);
    }

    IMLogBacktrace(0LL);
  }

  if ([v14 length]) {
    [v15 setDSHandle:v14];
  }
  if (!v7)
  {
    int v28 = (void *)objc_claimAutoreleasedReturnValue([v15 authenticationToken]);
    uint64_t v29 = v28;
  }

  -[IDSAppleIDRegistrationCenter _notifyAuthenticationSuccess:](self, "_notifyAuthenticationSuccess:", v15);
  -[IDSAppleIDRegistrationCenter _serviceQueueForKey:](self, "_serviceQueueForKey:", off_1009B8950);
  -[IDSAppleIDRegistrationCenter _serviceQueueForKey:](self, "_serviceQueueForKey:", off_1009B8958);
  os_activity_scope_leave(&state);
  cut_arc_os_release(&v31);
}

- (void)_renewTokenForRegistrationInfo:(id)a3 forceRenewal:(BOOL)a4 failIfNotSilent:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting renew for %@", buf, 0xCu);
    }

    passwordManager = self->_passwordManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 profileID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 email]);
    uint64_t v14 = IMStripLoginID(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lowercaseString]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceType]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    _DWORD v19[2] = sub_1003900A4;
    v19[3] = &unk_100902998;
    unsigned __int8 v20 = (os_log_s *)v8;
    id v21 = self;
    LOBYTE(v18) = a5;
    -[FTPasswordManager requestAuthTokenForProfileID:username:service:badPassword:showForgotPassword:forceRenewal:failIfNotSilent:outRequestID:completionBlock:]( passwordManager,  "requestAuthTokenForProfileID:username:service:badPassword:showForgotPassword:forceRenewal:failIfNotSilent:outReque stID:completionBlock:",  v12,  v16,  v17,  0LL,  0LL,  v6,  v18,  0LL,  v19);

    id v9 = v20;
  }

  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Empty registration info supplied for password fetch, bailing",  buf,  2u);
  }
}

- (void)_fetchTokenForRegistrationInfo:(id)a3 failIfNotSilent:(BOOL)a4 failureBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting token fetch for %@", buf, 0xCu);
    }

    passwordManager = self->_passwordManager;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 profileID]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 email]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceType]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100390508;
    v17[3] = &unk_1009029C0;
    id v18 = v8;
    __int128 v19 = self;
    unsigned __int8 v20 = v9;
    BOOL v21 = a4;
    -[FTPasswordManager fetchAuthTokenForProfileID:username:service:outRequestID:completionBlock:]( passwordManager,  "fetchAuthTokenForProfileID:username:service:outRequestID:completionBlock:",  v13,  v15,  v16,  0LL,  v17);
  }

  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Empty registration info supplied for password fetch, bailing",  buf,  2u);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4
{
  return -[IDSAppleIDRegistrationCenter _sendAuthenticationRequest:forceNew:forceRenewal:failIfNotSilent:]( self,  "_sendAuthenticationRequest:forceNew:forceRenewal:failIfNotSilent:",  a3,  a4,  0LL,  0LL);
}

- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4 failIfNotSilent:(BOOL)a5
{
  return -[IDSAppleIDRegistrationCenter _sendAuthenticationRequest:forceNew:forceRenewal:failIfNotSilent:]( self,  "_sendAuthenticationRequest:forceNew:forceRenewal:failIfNotSilent:",  a3,  a4,  0LL,  a5);
}

- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4 forceRenewal:(BOOL)a5 failIfNotSilent:(BOOL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = _os_activity_create( (void *)&_mh_execute_header,  "Apple ID registration center authentication request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v22, &state);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 email]);
  id v12 = [v11 length];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", off_1009B8960));
    if ([v13 containsObject:v10])
    {
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not adding this to the queue, we're already trying to authenticate: %@",  buf,  0xCu);
      }
    }

    else
    {
      [v13 addObject:v10];
      BOOL v16 = a6 || [v10 registrationType] == 2;
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceInformationString]);
        *(_DWORD *)buf = 138412546;
        id v24 = v10;
        __int16 v25 = 2112;
        uint64_t v26 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Fetching password for: %@  (Environment: %@)",  buf,  0x16u);
      }

      if (v8) {
        -[IDSAppleIDRegistrationCenter _renewTokenForRegistrationInfo:forceRenewal:failIfNotSilent:]( self,  "_renewTokenForRegistrationInfo:forceRenewal:failIfNotSilent:",  v10,  v7,  v16);
      }
      else {
        -[IDSAppleIDRegistrationCenter _fetchTokenForRegistrationInfo:failIfNotSilent:failureBlock:]( self,  "_fetchTokenForRegistrationInfo:failIfNotSilent:failureBlock:",  v10,  v16,  0LL);
      }
    }
  }

  else
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No email present for registration: %@",  buf,  0xCu);
    }

    -[IDSAppleIDRegistrationCenter _notifyAuthenticationFailure:responseCode:registrationError:error:info:]( self,  "_notifyAuthenticationFailure:responseCode:registrationError:error:info:",  v10,  1LL,  16LL,  0LL,  0LL);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v22);

  return v12 != 0LL;
}

- (BOOL)_registrationIsAuthenticating:(id)a3
{
  id v4 = off_1009B8960;
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", v4));
  LOBYTE(v4) = [v6 containsObject:v5];

  return (char)v4;
}

- (BOOL)_registrationNeedsAuthentication:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 authenticationToken]);
  BOOL v7 = (!v4
     || (id v5 = (void *)v4,
         BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 profileID]),
         v6,
         v5,
         !v6))
    && [v3 registrationType] == 1;

  return v7;
}

- (BOOL)_validateRegionID:(id)a3 phoneNumber:(id)a4 registration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = objc_alloc_init(&OBJC_CLASS___IDSProfileValidateInvitationContext);
  id v12 = sub_1002408C4(v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[IDSProfileValidateInvitationContext setDSAuthID:](v11, "setDSAuthID:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 pushToken]);
  -[IDSProfileMessage setPushToken:](v11, "setPushToken:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 profileID]);
  -[IDSProfileMessage setProfileID:](v11, "setProfileID:", v15);

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v10 authenticationToken]);
  -[IDSProfileMessage setAuthToken:](v11, "setAuthToken:", v16);

  -[IDSProfileValidateInvitationContext setRegionID:](v11, "setRegionID:", v8);
  -[IDSProfileValidateInvitationContext setBasePhoneNumber:](v11, "setBasePhoneNumber:", v9);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v10,  @"info"));
  -[IDSProfileValidateInvitationContext setUserInfo:](v11, "setUserInfo:", v17);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100390E70;
  v21[3] = &unk_1008FF108;
  v21[4] = self;
  -[IDSProfileValidateInvitationContext setCompletionBlock:](v11, "setCompletionBlock:", v21);
  if (-[IDSAppleIDRegistrationCenter _registrationNeedsAuthentication:](self, "_registrationNeedsAuthentication:", v10))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", off_1009B8958));
    [v18 addObject:v11];

    if (!-[IDSAppleIDRegistrationCenter _registrationIsAuthenticating:](self, "_registrationIsAuthenticating:", v10)) {
      -[IDSAppleIDRegistrationCenter _sendAuthenticationRequest:forceNew:]( self,  "_sendAuthenticationRequest:forceNew:",  v10,  0LL);
    }
  }

  else
  {
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Sending region validation request: %@ number: %@ (%@)",  buf,  0x20u);
    }

    -[IDSAppleIDRegistrationCenterMessageDelivery sendMessage:](self->_messageDelivery, "sendMessage:", v11);
  }

  return 1;
}

- (BOOL)_queryInitialInvitationContextForRegistration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___IDSProfileGetDefaultInvitationContext);
  id v6 = sub_1002408C4(v4);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[IDSProfileGetDefaultInvitationContext setDSAuthID:](v5, "setDSAuthID:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);
  -[IDSProfileMessage setPushToken:](v5, "setPushToken:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]);
  -[IDSProfileMessage setProfileID:](v5, "setProfileID:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]);
  -[IDSProfileMessage setAuthToken:](v5, "setAuthToken:", v10);

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v4,  @"info"));
  -[IDSProfileGetDefaultInvitationContext setUserInfo:](v5, "setUserInfo:", v11);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003910AC;
  v15[3] = &unk_1008FF108;
  v15[4] = self;
  -[IDSProfileGetDefaultInvitationContext setCompletionBlock:](v5, "setCompletionBlock:", v15);
  if (-[IDSAppleIDRegistrationCenter _registrationNeedsAuthentication:](self, "_registrationNeedsAuthentication:", v4))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", off_1009B8950));
    [v12 addObject:v5];

    if (!-[IDSAppleIDRegistrationCenter _registrationIsAuthenticating:](self, "_registrationIsAuthenticating:", v4)) {
      -[IDSAppleIDRegistrationCenter _sendAuthenticationRequest:forceNew:]( self,  "_sendAuthenticationRequest:forceNew:",  v4,  0LL);
    }
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Sending initial context request for: %@",  buf,  0xCu);
    }

    -[IDSAppleIDRegistrationCenterMessageDelivery sendMessage:](self->_messageDelivery, "sendMessage:", v5);
  }

  return 1;
}

- (BOOL)queryInitialInvitationContextForRegistration:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Requesting initial context for: %@",  (uint8_t *)&v8,  0xCu);
  }

  BOOL v6 = -[IDSAppleIDRegistrationCenter _queryInitialInvitationContextForRegistration:]( self,  "_queryInitialInvitationContextForRegistration:",  v4);
  return v6;
}

- (BOOL)validateRegion:(id)a3 phoneNumber:(id)a4 forRegistration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Requesting region validation for: %@  number: %@, %@",  (uint8_t *)&v14,  0x20u);
  }

  BOOL v12 = -[IDSAppleIDRegistrationCenter _validateRegionID:phoneNumber:registration:]( self,  "_validateRegionID:phoneNumber:registration:",  v8,  v9,  v10);
  return v12;
}

- (BOOL)authenticateRegistration:(id)a3 forceRenewal:(BOOL)a4 requireSilentAuth:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Kicking off authentication request for: %@",  (uint8_t *)&v12,  0xCu);
  }

  BOOL v10 = -[IDSAppleIDRegistrationCenter _sendAuthenticationRequest:forceNew:forceRenewal:failIfNotSilent:]( self,  "_sendAuthenticationRequest:forceNew:forceRenewal:failIfNotSilent:",  v8,  v6,  v6,  v5);
  return v10;
}

- (BOOL)authenticateRegistration:(id)a3 forceNewToken:(BOOL)a4 requireSilentAuth:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Kicking off authentication request for: %@",  (uint8_t *)&v12,  0xCu);
  }

  BOOL v10 = -[IDSAppleIDRegistrationCenter _sendAuthenticationRequest:forceNew:failIfNotSilent:]( self,  "_sendAuthenticationRequest:forceNew:failIfNotSilent:",  v8,  v6,  v5);
  return v10;
}

- (BOOL)authenticateRegistration:(id)a3 forceNewToken:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Kicking off authentication request for: %@",  (uint8_t *)&v10,  0xCu);
  }

  BOOL v8 = -[IDSAppleIDRegistrationCenter _sendAuthenticationRequest:forceNew:failIfNotSilent:]( self,  "_sendAuthenticationRequest:forceNew:failIfNotSilent:",  v6,  v4,  0LL);
  return v8;
}

- (BOOL)authenticateRegistration:(id)a3 requireSilentAuth:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Kicking off authentication request for: %@",  (uint8_t *)&v10,  0xCu);
  }

  BOOL v8 = -[IDSAppleIDRegistrationCenter _sendAuthenticationRequest:forceNew:failIfNotSilent:]( self,  "_sendAuthenticationRequest:forceNew:failIfNotSilent:",  v6,  0LL,  v4);
  return v8;
}

- (BOOL)authenticateRegistration:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Kicking off authentication request for: %@",  (uint8_t *)&v8,  0xCu);
  }

  BOOL v6 = -[IDSAppleIDRegistrationCenter authenticateRegistration:forceNewToken:]( self,  "authenticateRegistration:forceNewToken:",  v4,  0LL);
  return v6;
}

- (void)cancelActionsForRegistrationInfo:(id)a3
{
  if (a3)
  {
    id v4 = off_1009B8950;
    id v5 = a3;
    -[IDSAppleIDRegistrationCenter _removeMessageForRegistration:fromQueueForKey:]( self,  "_removeMessageForRegistration:fromQueueForKey:",  v5,  v4);
    -[IDSAppleIDRegistrationCenter _removeMessageForRegistration:fromQueueForKey:]( self,  "_removeMessageForRegistration:fromQueueForKey:",  v5,  off_1009B8958);
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSAppleIDRegistrationCenter _queueForKey:](self, "_queueForKey:", off_1009B8960));
    [v6 removeObject:v5];
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
  if (!-[NSMutableArray count](self->_handlers, "count"))
  {
    handlers = self->_handlers;
    self->_handlers = 0LL;
  }

- (void).cxx_destruct
{
}

@end