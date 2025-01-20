@interface IDSRegistrationCenter
+ (IDSRegistrationCenter)sharedInstance;
- (BOOL)_checkOverRegistrations;
- (BOOL)_hasCurrentAuthenticationsOrRegistrations;
- (BOOL)_hasOngoingAuthentications;
- (BOOL)_hasRegistration:(id)a3 inQueue:(id)a4;
- (BOOL)_queryValidatedEmailsForRegistration:(id)a3 allowPasswordPrompt:(BOOL)a4 completionBlock:(id)a5;
- (BOOL)_sendKTOptInStatusForRegistration:(id)a3 withOptInOutRequest:(id)a4 withCompletion:(id)a5;
- (BOOL)_sendKTOptInStatusUpdateForRegistration:(id)a3 withOptInStatus:(BOOL)a4 withCompletion:(id)a5;
- (BOOL)_sendPseudonymMessageOperation:(unint64_t)a3 forURI:(id)a4 pseudonymURI:(id)a5 properties:(id)a6 requestProperties:(id)a7 forRegistration:(id)a8 completionBlock:(id)a9;
- (BOOL)authenticateRegistration:(id)a3;
- (BOOL)isRegistering:(id)a3;
- (BOOL)provisionPseudonymFor:(id)a3 withURI:(id)a4 properties:(id)a5 requestProperties:(id)a6 completionBlock:(id)a7;
- (BOOL)queryValidatedEmailsForRegistration:(id)a3 allowPasswordPrompt:(BOOL)a4 completionBlock:(id)a5;
- (BOOL)renewPseudonym:(id)a3 forRegistration:(id)a4 forUpdatedExpiryEpoch:(double)a5 requestProperties:(id)a6 completionBlock:(id)a7;
- (BOOL)revokePseudonym:(id)a3 forRegistration:(id)a4 requestProperties:(id)a5 completionBlock:(id)a6;
- (BOOL)sendDeregistration:(id)a3;
- (BOOL)sendRegistration:(id)a3;
- (BOOL)updateKTOptInStatusForRegistration:(id)a3 withOptInOutRequest:(id)a4 withCompletion:(id)a5;
- (BOOL)updateKTOptInStatusForRegistration:(id)a3 withOptInStatus:(BOOL)a4 withCompletion:(id)a5;
- (CUTDeferredTaskQueue)cleanupAbsintheTask;
- (CUTDeferredTaskQueue)sendAuthenticateRegistrationTask;
- (CUTDeferredTaskQueue)sendDeregistrationTask;
- (CUTDeferredTaskQueue)sendRegistrationTask;
- (IDSRegistrationCenter)init;
- (IDSRegistrationCenter)initWithMessageDelivery:(id)a3 pushHandler:(id)a4 keyTransparencyVerifier:(id)a5;
- (IDSValidationQueue)validationQueue;
- (double)_updatePseudonymExpiryEpoch:(double)a3;
- (id)_URIsToRegisterForRegistration:(id)a3;
- (id)_authDSMessageForRegistration:(id)a3 realm:(id)a4;
- (id)_authMessageCompletionWithRegistration:(id)a3 withOverallSuccessBlock:(id)a4 overallFailure:(id)a5;
- (id)_authMessageForRegistration:(id)a3;
- (id)_authUsersMessageForRegistration:(id)a3 realm:(id)a4;
- (id)_geoRegion;
- (id)_keyTransparencyAccountKeyFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5;
- (id)_keyTransparencyDeviceSignatureFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5;
- (id)_keyTransparencyLoggableDataFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5;
- (id)_provDeviceIdentityMessageForRegistration:(id)a3;
- (id)_provTemporaryPhoneMessageForRegistration:(id)a3;
- (id)_trustedDeviceForRegistrations:(id)a3 transparencyLoggableDatasByServiceType:(id)a4 transparencyDeviceSignaturesByServiceType:(id)a5;
- (id)activeRegistrations;
- (id)dateLastRegistered;
- (id)gdrCenter;
- (id)keyTransparencyVerifier;
- (id)privateDeviceDataForKVSSuccess:(BOOL)a3;
- (id)registrationReasonTracker;
- (int64_t)_authSubsystemForInfo:(id)a3;
- (int64_t)_countOfMessagesQueuedOfType:(Class)a3 matchingCriteria:(id)a4;
- (unint64_t)_disableSecondaryRegistrationPercentage;
- (void)__dumpState;
- (void)__reallySendAuthenticateRegistration;
- (void)__reallySendDeregistration;
- (void)__reallySendRegistration;
- (void)__sendMessage:(id)a3;
- (void)_dequeuePendingRequestsIfNecessary;
- (void)_noteRegistration;
- (void)_notifyAllSuccessfulRegistrations:(id)a3;
- (void)_notifyEmailQueryFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7;
- (void)_notifyEmailQuerySuccess:(id)a3 emailInfo:(id)a4;
- (void)_notifyIDSAuthenticationSuccess:(id)a3;
- (void)_notifyProvisionFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 fatal:(BOOL)a7 info:(id)a8;
- (void)_notifyRegistrationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7;
- (void)_notifyRegistrationIdentitiesUpdated;
- (void)_notifyRegistrationSuccess:(id)a3;
- (void)_processGetHandlesMessage:(id)a3 registrations:(id)a4 deliveredWithError:(id)a5 resultCode:(int64_t)a6 resultDictionary:(id)a7 allowPasswordPrompt:(BOOL)a8;
- (void)_processRegistrationMessage:(id)a3 sentRegistrations:(id)a4 descriptionString:(id)a5 actionID:(id)a6 actionString:(id)a7 isDeregister:(BOOL)a8 deliveredWithError:(id)a9 resultCode:(int64_t)a10 resultDictionary:(id)a11;
- (void)_sendAuthenticateRegistration:(id)a3;
- (void)_sendDeregistration:(id)a3;
- (void)_sendIDSAuthRequest:(id)a3 forInfo:(id)a4;
- (void)_sendRegistrationAsDeregister:(BOOL)a3;
- (void)_shouldDisableSecondaryRegistration;
- (void)addListener:(id)a3;
- (void)buildValidationCredentialsIfNeeded;
- (void)cancelActionsForRegistrationInfo:(id)a3;
- (void)cancelRegisterActionsForRegistrationInfo:(id)a3;
- (void)dealloc;
- (void)engramKeyStoreDidUpdateIdentities:(id)a3;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)logState;
- (void)removeListener:(id)a3;
- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 registration:(id)a6 withCompletion:(id)a7;
- (void)reportClientEvent:(id)a3 registration:(id)a4 completion:(id)a5;
- (void)reportSpamMessage:(id)a3 selfURI:(id)a4 registration:(id)a5;
- (void)reportSpamWithMessages:(id)a3 selfURI:(id)a4 registration:(id)a5;
- (void)reportUnknownSenderMessage:(id)a3 selfURI:(id)a4 registration:(id)a5;
- (void)reportiMessageSpamCheckUnknown:(id)a3 count:(id)a4 completionBlock:(id)a5;
- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 selfURI:(id)a8 registration:(id)a9;
- (void)retrieveFeatureToggleStateForFeatureID:(id)a3 registration:(id)a4 completionBlock:(id)a5;
- (void)sendDeactivationRequestWithSIM:(id)a3 Info:(id)a4;
- (void)sendHardDeregisterCompletionBlock:(id)a3;
- (void)sendValidateCredential:(id)a3 withDeliveryCompletionBlock:(id)a4;
- (void)updateFeatureToggleState:(unint64_t)a3 forFeatureID:(id)a4 registration:(id)a5 completionBlock:(id)a6;
@end

@implementation IDSRegistrationCenter

+ (IDSRegistrationCenter)sharedInstance
{
  if (qword_1009C0638 != -1) {
    dispatch_once(&qword_1009C0638, &stru_1008FE048);
  }
  return (IDSRegistrationCenter *)(id)qword_1009C0640;
}

- (IDSRegistrationCenter)initWithMessageDelivery:(id)a3 pushHandler:(id)a4 keyTransparencyVerifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___IDSRegistrationCenter;
  v12 = -[IDSRegistrationCenter init](&v72, "init");
  if (v12)
  {
    id v65 = v9;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    currentAuthentications = v12->_currentAuthentications;
    v12->_currentAuthentications = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    currentRegistrations = v12->_currentRegistrations;
    v12->_currentRegistrations = v15;

    objc_storeStrong((id *)&v12->_httpMessageDelivery, a3);
    -[IDSRegistrationCenterMessageDelivery setUserAgent:]( v12->_httpMessageDelivery,  "setUserAgent:",  @"com.apple.invitation-registration");
    -[IDSRegistrationCenterMessageDelivery setRetryInAirplaneMode:]( v12->_httpMessageDelivery,  "setRetryInAirplaneMode:",  1LL);
    -[IDSRegistrationCenterMessageDelivery setLogToRegistration:]( v12->_httpMessageDelivery,  "setLogToRegistration:",  1LL);
    objc_storeStrong((id *)&v12->_pushHandler, a4);
    pushHandler = v12->_pushHandler;
    uint64_t v20 = im_primary_queue(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[IDSPushHandler addListener:topics:commands:queue:]( pushHandler,  "addListener:topics:commands:queue:",  v12,  0LL,  0LL,  v21);

    v22 = objc_alloc(&OBJC_CLASS___IDSValidationQueue);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    id v64 = v11;
    id v23 = v10;
    v70[2] = sub_10020C0F8;
    v70[3] = &unk_1008FD6F8;
    v24 = v12;
    v71 = v24;
    v25 = -[IDSValidationQueue initWithValidationMessageSendBlock:](v22, "initWithValidationMessageSendBlock:", v70);
    validationQueue = v24->_validationQueue;
    v24->_validationQueue = v25;

    objc_storeStrong((id *)&v24->_keyTransparencyVerifier, a5);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_10020C104;
    v68[3] = &unk_1008FD6F8;
    v27 = v24;
    v69 = v27;
    v28 = objc_retainBlock(v68);
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_10020C14C;
    v66[3] = &unk_1008F6010;
    v29 = v27;
    v67 = v29;
    v30 = objc_retainBlock(v66);
    v31 = objc_alloc(&OBJC_CLASS___IDSGetDependentRegistrationsCenter);
    v32 = v12->_pushHandler;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDeviceHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSDeviceHeartbeatCenter, "sharedInstance"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
    v36 = -[IDSGetDependentRegistrationsCenter initWithPushHandler:lockdownManager:heartbeatCenter:ftNetworkSupport:sendMessageHandlerBlock:messageResponseHandlerBlock:]( v31,  "initWithPushHandler:lockdownManager:heartbeatCenter:ftNetworkSupport:sendMessageHandlerBlock:messageResponseHandlerBlock:",  v32,  v33,  v34,  v35,  v28,  v30);
    gdrCenter = v29->_gdrCenter;
    v29->_gdrCenter = v36;

    v38 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
    uint64_t v40 = im_primary_queue(v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = -[CUTDeferredTaskQueue initWithQueue:block:](v38, "initWithQueue:block:", v41, &stru_1008FE088);
    sendAuthenticateRegistrationTask = v29->_sendAuthenticateRegistrationTask;
    v29->_sendAuthenticateRegistrationTask = v42;

    v44 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
    uint64_t v46 = im_primary_queue(v44, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v48 = -[CUTDeferredTaskQueue initWithCapacity:queue:block:]( v44,  "initWithCapacity:queue:block:",  1LL,  v47,  &stru_1008FE0A8);
    sendRegistrationTask = v29->_sendRegistrationTask;
    v29->_sendRegistrationTask = v48;

    v50 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
    uint64_t v52 = im_primary_queue(v50, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    v54 = -[CUTDeferredTaskQueue initWithCapacity:queue:block:]( v50,  "initWithCapacity:queue:block:",  1LL,  v53,  &stru_1008FE0C8);
    sendDeregistrationTask = v29->_sendDeregistrationTask;
    v29->_sendDeregistrationTask = v54;

    v56 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
    uint64_t v58 = im_primary_queue(v56, v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = v56;
    id v9 = v65;
    v61 = -[CUTDeferredTaskQueue initWithCapacity:queue:block:]( v60,  "initWithCapacity:queue:block:",  1LL,  v59,  &stru_1008FE0E8);
    cleanupAbsintheTask = v29->_cleanupAbsintheTask;
    v29->_cleanupAbsintheTask = v61;

    id v10 = v23;
    id v11 = v64;
  }

  return v12;
}

- (IDSRegistrationCenter)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDependencyProvider messageDeliveryFactory]( &OBJC_CLASS___IDSDependencyProvider,  "messageDeliveryFactory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 createHTTPMessageDelivery]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationRequestTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationRequestTracker,  "sharedInstance"));
  [v4 addRequestObserver:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSKeyTransparencyVerifier sharedInstance]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "sharedInstance"));
  v8 = -[IDSRegistrationCenter initWithMessageDelivery:pushHandler:keyTransparencyVerifier:]( self,  "initWithMessageDelivery:pushHandler:keyTransparencyVerifier:",  v4,  v6,  v7);

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:0 object:0];

  queuedRegistrations = self->_queuedRegistrations;
  self->_queuedRegistrations = 0LL;

  -[IDSValidationQueue cleanupValidationInfoForSubsystemMechanism:]( self->_validationQueue,  "cleanupValidationInfoForSubsystemMechanism:",  1LL);
  -[IDSValidationQueue cleanupValidationInfoForSubsystemMechanism:]( self->_validationQueue,  "cleanupValidationInfoForSubsystemMechanism:",  3LL);
  -[IDSRegistrationCenterMessageDelivery invalidate](self->_httpMessageDelivery, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSRegistrationCenter;
  -[IDSRegistrationCenter dealloc](&v5, "dealloc");
}

- (id)gdrCenter
{
  return self->_gdrCenter;
}

- (id)keyTransparencyVerifier
{
  return self->_keyTransparencyVerifier;
}

- (id)registrationReasonTracker
{
  return +[IDSRegistrationReasonTracker sharedInstance](&OBJC_CLASS___IDSRegistrationReasonTracker, "sharedInstance");
}

- (void)engramKeyStoreDidUpdateIdentities:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog engram](&OBJC_CLASS___IMRGLog, "engram"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "IDS registration center notified that Engram key store did update identities; notifying listeners",
      buf,
      2u);
  }

  id v6 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "centerUpdatedRegistrationIdentities:") & 1) != 0) {
          [v11 centerUpdatedRegistrationIdentities:self];
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v8);
  }
}

- (void)__dumpState
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "======= Registration State =======",  (uint8_t *)&v29,  2u);
  }

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dateSentLastHTTPMessage = self->_dateSentLastHTTPMessage;
    int v29 = 138412290;
    v30 = dateSentLastHTTPMessage;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "     Last sent message: %@",  (uint8_t *)&v29,  0xCu);
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dateLastRegistered = self->_dateLastRegistered;
    int v29 = 138412290;
    v30 = dateLastRegistered;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "       Last registered: %@",  (uint8_t *)&v29,  0xCu);
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v29, 2u);
  }

  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationCenterMessageDelivery currentMessage](self->_httpMessageDelivery, "currentMessage"));
    int v29 = 138412290;
    v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "     Message in Flight: %@",  (uint8_t *)&v29,  0xCu);
  }

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationCenterMessageDelivery queuedMessages](self->_httpMessageDelivery, "queuedMessages"));
    int v29 = 138412290;
    v30 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "       Messages queued: %@",  (uint8_t *)&v29,  0xCu);
  }

  __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v29, 2u);
  }

  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    queuedAuthentications = self->_queuedAuthentications;
    int v29 = 138412290;
    v30 = queuedAuthentications;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "          Queued Auths: %@",  (uint8_t *)&v29,  0xCu);
  }

  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    queuedRegistrations = self->_queuedRegistrations;
    int v29 = 138412290;
    v30 = queuedRegistrations;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "            Queued Reg: %@",  (uint8_t *)&v29,  0xCu);
  }

  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    currentAuthentications = self->_currentAuthentications;
    int v29 = 138412290;
    v30 = currentAuthentications;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "         Current Auths: %@",  (uint8_t *)&v29,  0xCu);
  }

  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    currentRegistrations = self->_currentRegistrations;
    int v29 = 138412290;
    v30 = currentRegistrations;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "           Current Reg: %@",  (uint8_t *)&v29,  0xCu);
  }

  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v29, 2u);
  }

  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v24 = -[IDSValidationQueue isBuildingContextForSubsystem:]( self->_validationQueue,  "isBuildingContextForSubsystem:",  1LL);
    v25 = @"NO";
    if (v24) {
      v25 = @"YES";
    }
    int v29 = 138412290;
    v30 = (void *)v25;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "     Building Absinthe: %@",  (uint8_t *)&v29,  0xCu);
  }

  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t registrations = self->_registrations;
    int v29 = 67109120;
    LODWORD(v30) = registrations;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "  Recent Registrations: %d",  (uint8_t *)&v29,  8u);
  }

  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "==================================",  (uint8_t *)&v29,  2u);
  }
}

- (void)logState
{
  NSLog(@"======= Registration State =======");
  NSLog(@"     Last sent message: %@", self->_dateSentLastHTTPMessage);
  NSLog(@"       Last registered: %@", self->_dateLastRegistered);
  NSLog(&stru_100912B50.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationCenterMessageDelivery currentMessage](self->_httpMessageDelivery, "currentMessage"));
  NSLog(@"     Message in Flight: %@", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationCenterMessageDelivery queuedMessages](self->_httpMessageDelivery, "queuedMessages"));
  NSLog(@"       Messages queued: %@", v4);

  NSLog(&stru_100912B50.isa);
  NSLog(@"          Queued Auths: %@", self->_queuedAuthentications);
  NSLog(@"            Queued Reg: %@", self->_queuedRegistrations);
  NSLog(@"         Current Auths: %@", self->_currentAuthentications);
  NSLog(@"           Current Reg: %@", self->_currentRegistrations);
  NSLog(&stru_100912B50.isa);
  unsigned int v5 = -[IDSValidationQueue isBuildingContextForSubsystem:]( self->_validationQueue,  "isBuildingContextForSubsystem:",  1LL);
  id v6 = @"NO";
  if (v5) {
    id v6 = @"YES";
  }
  NSLog(@"     Building Absinthe: %@", v6);
  NSLog(@"  Recent Registrations: %d", self->_registrations);
  NSLog(@"==================================");
}

- (void)__sendMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "*** Sending message: %@", (uint8_t *)&v8, 0xCu);
  }

  -[IDSRegistrationCenterMessageDelivery sendMessage:](self->_httpMessageDelivery, "sendMessage:", v4);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSDate);
  dateSentLastHTTPMessage = self->_dateSentLastHTTPMessage;
  self->_dateSentLastHTTPMessage = v6;

  -[IDSRegistrationCenter __dumpState](self, "__dumpState");
}

- (BOOL)_hasOngoingAuthentications
{
  return -[NSMutableArray count](self->_queuedAuthentications, "count")
      || -[NSMutableArray count](self->_currentAuthentications, "count") != 0LL;
}

- (BOOL)_hasCurrentAuthenticationsOrRegistrations
{
  return -[NSMutableArray count](self->_currentAuthentications, "count")
      || -[NSMutableArray count](self->_currentRegistrations, "count") != 0LL;
}

- (void)_shouldDisableSecondaryRegistration
{
  unint64_t v2 = -[IDSRegistrationCenter _disableSecondaryRegistrationPercentage](self, "_disableSecondaryRegistrationPercentage");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserDefaults secondaryRegistrationDisabledDiceRoll]( &OBJC_CLASS___IMUserDefaults,  "secondaryRegistrationDisabledDiceRoll"));
  if (!v3)
  {
    id v4 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random_uniform(0x64u));
    id v7 = (id)objc_claimAutoreleasedReturnValue(v4);
    +[IMUserDefaults setSecondaryRegistrationDisabledDiceRoll:]( &OBJC_CLASS___IMUserDefaults,  "setSecondaryRegistrationDisabledDiceRoll:",  v7);
    v3 = v7;
  }

  id v8 = v3;
  unsigned int v5 = [v3 unsignedIntValue];
  id v6 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.ids");
  if (v2 > v5 != -[NSUserDefaults BOOLForKey:](v6, "BOOLForKey:", @"SecondaryRegistrationDisabled")) {
    -[NSUserDefaults setBool:forKey:](v6, "setBool:forKey:", v2 > v5, @"SecondaryRegistrationDisabled");
  }
}

- (unint64_t)_disableSecondaryRegistrationPercentage
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-disable-secondary-wave2-registration-percentage"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    id v6 = [v3 unsignedIntegerValue];
  }
  else {
    id v6 = 0LL;
  }

  return (unint64_t)v6;
}

- (void)_dequeuePendingRequestsIfNecessary
{
  if (!self->_pendingDequeue)
  {
    if (-[IDSRegistrationCenter _checkOverRegistrations](self, "_checkOverRegistrations"))
    {
      v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        sub_1006A41F4();
      }

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10020D10C;
      v9[3] = &unk_1008F6010;
      v9[4] = self;
      double v4 = 120.0;
      uint64_t v5 = v9;
    }

    else
    {
      self->_pendingDequeue = 1;
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Kicking dequeue of pending requests",  buf,  2u);
      }

      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10020D114;
      v7[3] = &unk_1008F6010;
      v7[4] = self;
      double v4 = 2.0;
      uint64_t v5 = v7;
    }

    im_dispatch_after_primary_queue(v5, v4);
  }

- (void)_notifyProvisionFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 fatal:(BOOL)a7 info:(id)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v54 = a6;
  id v14 = a8;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v60 = _os_activity_create( (void *)&_mh_execute_header,  "ids/authenticate/fail",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v60, &state);
  do
    unint64_t v15 = __ldaxr(&cut_log_group_generation);
  while (__stlxr(v15 + 1, &cut_log_group_generation));
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 mainID]);
    *(_DWORD *)buf = 134218242;
    unint64_t v63 = v15;
    __int16 v64 = 2112;
    id v65 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) main-id=%@", buf, 0x16u);
  }

  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceIdentifier]);
    *(_DWORD *)buf = 134218242;
    unint64_t v63 = v15;
    __int16 v64 = 2112;
    id v65 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "!setGroupState(%llu) service-id=%@",  buf,  0x16u);
  }

  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v63 = v15;
    __int16 v64 = 2112;
    id v65 = &__kCFBooleanFalse;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "!setGroupState(%llu) successful=%@",  buf,  0x16u);
  }

  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v63 = v15;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "!addGroup(%llu) authenticate", buf, 0xCu);
  }

  -[IDSValidationQueue cleanupValidationInfoForSubsystemMechanism:]( self->_validationQueue,  "cleanupValidationInfoForSubsystemMechanism:",  -[IDSRegistrationCenter _authSubsystemForInfo:](self, "_authSubsystemForInfo:", v13));
  -[NSMutableArray removeObjectIdenticalTo:](self->_queuedRegistrations, "removeObjectIdenticalTo:", v13);
  -[NSMutableArray removeObjectIdenticalTo:](self->_queuedAuthentications, "removeObjectIdenticalTo:", v13);
  -[NSMutableArray removeObjectIdenticalTo:](self->_currentRegistrations, "removeObjectIdenticalTo:", v13);
  -[NSMutableArray removeObjectIdenticalTo:](self->_currentAuthentications, "removeObjectIdenticalTo:", v13);
  sub_10012E874(0, @"Registration", @"IDS Authentication failure", 1073LL);
  id v22 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v23 = v22;
  id v24 = [v23 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v56 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v27, "center:failedIDSAuthentication:error:info:") & 1) != 0) {
          [v27 center:self failedIDSAuthentication:v13 error:a5 info:v14];
        }
      }

      id v24 = [v23 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }

    while (v24);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v54 domain]);
  unsigned int v53 = [v28 isEqualToString:NSPOSIXErrorDomain];

  int v29 = (void *)objc_claimAutoreleasedReturnValue([v54 domain]);
  if ([v29 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v30 = 1;
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v54 domain]);
    unsigned int v30 = [v31 isEqualToString:kCFErrorDomainCFNetwork];
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
  unsigned int v33 = [v32 wiFiActiveAndReachable];

  if (v33) {
    int v34 = 2;
  }
  else {
    int v34 = 1;
  }
  unsigned int v51 = v34;
  unsigned int v50 = [v13 registrationType];
  unsigned int v49 = [v13 registrationType];
  unsigned int v47 = sub_10019EA40(a4);
  uint64_t v35 = sub_10019EF00(a5);
  if (((v30 | v53) & 1) != 0)
  {
    v36 = 0LL;
    if (v30)
    {
LABEL_31:
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v54 code]));
      goto LABEL_34;
    }
  }

  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v54 code]));
    if (v30) {
      goto LABEL_31;
    }
  }

  v37 = 0LL;
LABEL_34:
  if (v53) {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v54 code]));
  }
  else {
    v38 = 0LL;
  }
  FTAWDLogRegistrationAuthenticate(0LL, 0LL, v51, v47, v35, v50 == 0, v49 == 1, v36, v37, v38);
  if (v53) {

  }
  if (v30) {
  id v48 = objc_alloc(&OBJC_CLASS___IDSRegistrationAuthenticateMetric);
  }
  uint64_t v39 = sub_10019EA40(a4);
  uint64_t v40 = sub_10019EF00(a5);
  if (((v30 | v53) & 1) != 0)
  {
    v41 = 0LL;
    if (v30)
    {
LABEL_45:
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v54 code]));
      goto LABEL_48;
    }
  }

  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v54 code]));
    if (v30) {
      goto LABEL_45;
    }
  }

  v42 = 0LL;
LABEL_48:
  if (v53) {
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v54 code]));
  }
  else {
    v43 = 0LL;
  }
  LOBYTE(v46) = v49 == 1;
  id v44 = [v48 initWithGuid:0 success:0 connectionType:v51 resultCode:v39 registrationError:v40 isPhoneUser:v50 == 0 isDSUser:v46 genericError:v41 URLError:v42 POSIXError:v43];
  if (v53) {

  }
  if (v30) {
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  }
  [v45 logMetric:v44];

  -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  os_activity_scope_leave(&state);
  cut_arc_os_release(&v60);
}

- (void)_notifyIDSAuthenticationSuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v36 = _os_activity_create( (void *)&_mh_execute_header,  "ids/authenticate/success",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v36, &state);
  do
    unint64_t v5 = __ldaxr(&cut_log_group_generation);
  while (__stlxr(v5 + 1, &cut_log_group_generation));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mainID]);
    *(_DWORD *)buf = 134218242;
    unint64_t v39 = v5;
    __int16 v40 = 2112;
    v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) main-id=%@", buf, 0x16u);
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceIdentifier]);
    *(_DWORD *)buf = 134218242;
    unint64_t v39 = v5;
    __int16 v40 = 2112;
    v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) service-id=%@", buf, 0x16u);
  }

  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v39 = v5;
    __int16 v40 = 2112;
    v41 = &__kCFBooleanTrue;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "!setGroupState(%llu) successful=%@",  buf,  0x16u);
  }

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "!addGroup(%llu) authenticate", buf, 0xCu);
  }

  -[NSMutableArray removeObjectIdenticalTo:](self->_queuedAuthentications, "removeObjectIdenticalTo:", v4);
  -[NSMutableArray removeObjectIdenticalTo:](self->_currentAuthentications, "removeObjectIdenticalTo:", v4);
  if (!-[NSMutableArray count](self->_queuedAuthentications, "count"))
  {
    queuedAuthentications = self->_queuedAuthentications;
    self->_queuedAuthentications = 0LL;
  }

  id v13 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v18, "center:succeededIDSAuthentication:") & 1) != 0) {
          [v18 center:self succeededIDSAuthentication:v4];
        }
      }

      id v15 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v15);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
  unsigned int v20 = [v19 wiFiActiveAndReachable];

  if (v20) {
    uint64_t v21 = 2LL;
  }
  else {
    uint64_t v21 = 1LL;
  }
  unsigned int v22 = [v4 registrationType];
  unsigned int v23 = [v4 registrationType];
  uint64_t v24 = sub_10019EA40(0LL);
  uint64_t v25 = sub_10019EF00(-1LL);
  FTAWDLogRegistrationAuthenticate(0LL, 1LL, v21, v24, v25, v22 == 0, v23 == 1, 0LL, 0LL, 0LL);
  id v26 = objc_alloc(&OBJC_CLASS___IDSRegistrationAuthenticateMetric);
  uint64_t v27 = sub_10019EA40(0LL);
  LOBYTE(v30) = v23 == 1;
  id v28 = [v26 initWithGuid:0 success:1 connectionType:v21 resultCode:v27 registrationError:sub_10019EF00(-1) isPhoneUser:v22 == 0 isDSUser:v30 genericError:0 URLError:0 POSIXError:0];
  int v29 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v29 logMetric:v28];

  -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  os_activity_scope_leave(&state);
  cut_arc_os_release(&v36);
}

- (void)_notifyRegistrationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7
{
  id v11 = a3;
  id v57 = a6;
  id v12 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v71 = _os_activity_create( (void *)&_mh_execute_header,  "ids/registration/fail",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v71, &state);
  do
    unint64_t v13 = __ldaxr(&cut_log_group_generation);
  while (__stlxr(v13 + 1, &cut_log_group_generation));
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 mainID]);
    *(_DWORD *)buf = 134218242;
    unint64_t v75 = v13;
    __int16 v76 = 2112;
    v77 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) main-id=%@", buf, 0x16u);
  }

  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceIdentifier]);
    *(_DWORD *)buf = 134218242;
    unint64_t v75 = v13;
    __int16 v76 = 2112;
    v77 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "!setGroupState(%llu) service-id=%@",  buf,  0x16u);
  }

  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v75 = v13;
    __int16 v76 = 2112;
    v77 = &__kCFBooleanFalse;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "!setGroupState(%llu) successful=%@",  buf,  0x16u);
  }

  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v75 = v13;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "!addGroup(%llu) register", buf, 0xCu);
  }

  -[NSMutableArray removeObjectIdenticalTo:](self->_queuedRegistrations, "removeObjectIdenticalTo:", v11);
  -[NSMutableArray removeObjectIdenticalTo:](self->_queuedAuthentications, "removeObjectIdenticalTo:", v11);
  -[NSMutableArray removeObjectIdenticalTo:](self->_currentRegistrations, "removeObjectIdenticalTo:", v11);
  -[NSMutableArray removeObjectIdenticalTo:](self->_currentAuthentications, "removeObjectIdenticalTo:", v11);
  if (!-[NSMutableArray count](self->_queuedRegistrations, "count"))
  {
    queuedRegistrations = self->_queuedRegistrations;
    self->_queuedRegistrations = 0LL;
  }

  -[IDSValidationQueue cleanupValidationInfoForSubsystemMechanism:]( self->_validationQueue,  "cleanupValidationInfoForSubsystemMechanism:",  1LL);
  if (![v11 registrationType])
  {
    [v11 setMainID:0];
    [v11 setAuthenticationToken:0];
  }

  [v11 setUris:0];
  [v11 setVettedEmails:0];
  [v11 setRegistrationCert:0];
  [v11 saveToKeychain];
  sub_10012E874(0, @"Registration", @"IDS registration failure", 1073LL);
  if (_os_feature_enabled_impl("IDS", "IDSKTDelayRegistration"))
  {
    if (a5 == 47)
    {
      keyTransparencyVerifier = self->_keyTransparencyVerifier;
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_10020EC8C;
      v66[3] = &unk_1008FE110;
      uint64_t v69 = 47LL;
      void v66[4] = self;
      id v67 = v11;
      id v68 = v12;
      -[IDSKeyTransparencyVerifier fetchKTCDPStatus:](keyTransparencyVerifier, "fetchKTCDPStatus:", v66);
    }

    else
    {
      id v28 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v29 = v28;
      id v30 = [v29 countByEnumeratingWithState:&v62 objects:v73 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v63;
        do
        {
          for (i = 0LL; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v63 != v31) {
              objc_enumerationMutation(v29);
            }
            __int128 v33 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
            if ((objc_opt_respondsToSelector(v33, "center:failedRegistration:error:info:") & 1) != 0) {
              [v33 center:self failedRegistration:v11 error:a5 info:v12];
            }
          }

          id v30 = [v29 countByEnumeratingWithState:&v62 objects:v73 count:16];
        }

        while (v30);
      }
    }
  }

  else
  {
    id v22 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v23 = v22;
    id v24 = [v23 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v59;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v59 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
          if ((objc_opt_respondsToSelector(v27, "center:failedRegistration:error:info:") & 1) != 0) {
            [v27 center:self failedRegistration:v11 error:a5 info:v12];
          }
        }

        id v24 = [v23 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }

      while (v24);
    }
  }

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v57 domain]);
  unsigned int v56 = [v34 isEqualToString:NSPOSIXErrorDomain];

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v57 domain]);
  if ([v35 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v36 = 1;
  }

  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue([v57 domain]);
    unsigned int v36 = [v37 isEqualToString:kCFErrorDomainCFNetwork];
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
  unsigned int v39 = [v38 wiFiActiveAndReachable];

  if (v39) {
    int v40 = 2;
  }
  else {
    int v40 = 1;
  }
  unsigned int v53 = v40;
  unsigned int v51 = sub_10019EA40(a4);
  uint64_t v41 = sub_10019EF00(a5);
  if (((v36 | v56) & 1) != 0)
  {
    v42 = 0LL;
    if (v36)
    {
LABEL_46:
      v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v57 code]));
      goto LABEL_49;
    }
  }

  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v57 code]));
    if (v36) {
      goto LABEL_46;
    }
  }

  v43 = 0LL;
LABEL_49:
  if (v56) {
    id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v57 code]));
  }
  else {
    id v44 = 0LL;
  }
  FTAWDLogRegistrationRegister(0LL, 0LL, v53, v51, v41, 0LL, 0LL, v42, v43, v44);
  if (v56) {

  }
  if (v36) {
  id v52 = objc_alloc(&OBJC_CLASS___IDSRegistrationOperationRegisterMetric);
  }
  unsigned int v55 = sub_10019EA40(a4);
  uint64_t v45 = sub_10019EF00(a5);
  if (((v36 | v56) & 1) != 0)
  {
    uint64_t v46 = 0LL;
    if (v36)
    {
LABEL_60:
      unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v57 code]));
      goto LABEL_63;
    }
  }

  else
  {
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v57 code]));
    if (v36) {
      goto LABEL_60;
    }
  }

  unsigned int v47 = 0LL;
LABEL_63:
  if (v56) {
    id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v57 code]));
  }
  else {
    id v48 = 0LL;
  }
  id v49 = [v52 initWithGuid:0 success:0 connectionType:v53 resultCode:v55 registrationType:v45 isHeartbeatRegister:0 heartbeatDelay:0 genericErro r:v46 URLError:v47 POSIXError:v48];
  if (v56) {

  }
  if (v36) {
  unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  }
  [v50 logMetric:v49];

  -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  os_activity_scope_leave(&state);
  cut_arc_os_release(&v71);
}

- (void)_notifyRegistrationSuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  __int128 v34 = _os_activity_create( (void *)&_mh_execute_header,  "ids/registration/success",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v34, &state);
  do
    unint64_t v5 = __ldaxr(&cut_log_group_generation);
  while (__stlxr(v5 + 1, &cut_log_group_generation));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mainID]);
    *(_DWORD *)buf = 134218242;
    unint64_t v37 = v5;
    __int16 v38 = 2112;
    unsigned int v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) main-id=%@", buf, 0x16u);
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceIdentifier]);
    *(_DWORD *)buf = 134218242;
    unint64_t v37 = v5;
    __int16 v38 = 2112;
    unsigned int v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) service-id=%@", buf, 0x16u);
  }

  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v37 = v5;
    __int16 v38 = 2112;
    unsigned int v39 = &__kCFBooleanTrue;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "!setGroupState(%llu) successful=%@",  buf,  0x16u);
  }

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "!addGroup(%llu) register", buf, 0xCu);
  }

  -[NSMutableArray removeObjectIdenticalTo:](self->_queuedRegistrations, "removeObjectIdenticalTo:", v4);
  -[NSMutableArray removeObjectIdenticalTo:](self->_currentRegistrations, "removeObjectIdenticalTo:", v4);
  if (!-[NSMutableArray count](self->_queuedRegistrations, "count"))
  {
    queuedRegistrations = self->_queuedRegistrations;
    self->_queuedRegistrations = 0LL;
  }

  [v4 setRegistrationStatus:8];
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDS registration success", buf, 2u);
  }

  id v14 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v19, "center:succeededRegistration:") & 1) != 0) {
          [v19 center:self succeededRegistration:v4];
        }
      }

      id v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v16);
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
  unsigned int v21 = [v20 wiFiActiveAndReachable];

  if (v21) {
    uint64_t v22 = 2LL;
  }
  else {
    uint64_t v22 = 1LL;
  }
  uint64_t v23 = sub_10019EA40(0LL);
  uint64_t v24 = sub_10019EF00(-1LL);
  FTAWDLogRegistrationRegister(0LL, 1LL, v22, v23, v24, 0LL, 0LL, 0LL, 0LL, 0LL);
  id v25 = objc_alloc(&OBJC_CLASS___IDSRegistrationOperationRegisterMetric);
  uint64_t v26 = sub_10019EA40(0LL);
  id v27 = [v25 initWithGuid:0 success:0 connectionType:v22 resultCode:v26 registrationType:sub_10019EF00(-1) isHeartbeatRegister:0 heartbeatDelay:0 genericErro r:0 URLError:0 POSIXError:0];
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v28 logMetric:v27];

  -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  os_activity_scope_leave(&state);
  cut_arc_os_release(&v34);
}

- (void)_notifyAllSuccessfulRegistrations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "All IDS registrations success", buf, 2u);
    }

    id v6 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v11, "center:allSucceededRegistrations:") & 1) != 0) {
            [v11 center:self allSucceededRegistrations:v4];
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }

      while (v8);
    }
  }
}

- (void)_notifyEmailQueryFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7
{
  id v12 = a3;
  id v43 = a6;
  id v13 = a7;
  if ([v12 isDisabled])
  {
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not reflecting back email query failure, registration is disabled: %@",  buf,  0xCu);
    }

    goto LABEL_44;
  }

  int64_t v41 = a4;
  sub_10012E874(0, @"Registration", @"Email query failure", 1073LL);
  id v15 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v16);
        }
        unsigned int v20 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v20, "center:failedCurrentEmailsRequest:error:info:") & 1) != 0) {
          [v20 center:self failedCurrentEmailsRequest:v12 error:a5 info:v13];
        }
      }

      id v17 = [v16 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }

    while (v17);
  }

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v43 domain]);
  unsigned __int8 v42 = [v21 isEqualToString:NSPOSIXErrorDomain];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v43 domain]);
  if ([v22 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v23 = 1;
  }

  else
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v43 domain]);
    unsigned int v23 = [v24 isEqualToString:kCFErrorDomainCFNetwork];
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
  unsigned int v26 = [v25 wiFiActiveAndReachable];

  if (v26) {
    int v27 = 2;
  }
  else {
    int v27 = 1;
  }
  unsigned int v40 = v27;
  uint64_t v28 = sub_10019EA40(v41);
  uint64_t v29 = sub_10019EF00(a5);
  if (((v23 | v42) & 1) != 0)
  {
    __int128 v30 = 0LL;
    if (v23)
    {
LABEL_21:
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v43 code]));
      goto LABEL_24;
    }
  }

  else
  {
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v43 code]));
    if (v23) {
      goto LABEL_21;
    }
  }

  __int128 v31 = 0LL;
LABEL_24:
  if ((v42 & 1) != 0)
  {
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v43 code]));
    FTAWDLogRegistrationGetHandles(0LL, 0LL, v40, v28, v29, v30, v31, v32);
  }

  else
  {
    FTAWDLogRegistrationGetHandles(0LL, 0LL, v40, v28, v29, v30, v31, 0LL);
  }

  if (v23) {

  }
  id v33 = objc_alloc(&OBJC_CLASS___IDSRegistrationOperationGetHandlesMetric);
  uint64_t v34 = sub_10019EA40(v41);
  uint64_t v35 = sub_10019EF00(a5);
  if (((v23 | v42) & 1) != 0)
  {
    unsigned int v36 = 0LL;
    if (v23)
    {
LABEL_33:
      unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v43 code]));
      goto LABEL_36;
    }
  }

  else
  {
    unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v43 code]));
    if (v23) {
      goto LABEL_33;
    }
  }

  unint64_t v37 = 0LL;
LABEL_36:
  if ((v42 & 1) != 0)
  {
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v43 code]));
    __int128 v14 = (os_log_s *)[v33 initWithGuid:0 success:0 connectionType:v40 resultCode:v34 registrationType:v35 genericError:v36 URLError:v37 POSIXError:v38];

    if (!v23) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }

  __int128 v14 = (os_log_s *)[v33 initWithGuid:0 success:0 connectionType:v40 resultCode:v34 registrationType:v35 genericError:v36 URLError:v37 POSIXError:0];
  if (v23) {
LABEL_40:
  }

LABEL_41:
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v39 logMetric:v14];

LABEL_44:
}

- (void)_notifyEmailQuerySuccess:(id)a3 emailInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDisabled])
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Not reflecting back email query success, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v9 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          __int128 v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v14, "center:succeededCurrentEmailsRequest:emailInfo:") & 1) != 0) {
            [v14 center:self succeededCurrentEmailsRequest:v6 emailInfo:v7];
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v11);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
    unsigned int v16 = [v15 wiFiActiveAndReachable];

    if (v16) {
      uint64_t v17 = 2LL;
    }
    else {
      uint64_t v17 = 1LL;
    }
    uint64_t v18 = sub_10019EA40(0LL);
    uint64_t v19 = sub_10019EF00(-1LL);
    FTAWDLogRegistrationGetHandles(0LL, 1LL, v17, v18, v19, 0LL, 0LL, 0LL);
    id v20 = objc_alloc(&OBJC_CLASS___IDSRegistrationOperationGetHandlesMetric);
    uint64_t v21 = sub_10019EA40(0LL);
    id v8 = (os_log_s *)[v20 initWithGuid:0 success:0 connectionType:v17 resultCode:v21 registrationType:sub_10019EF00(-1) genericError:0 URLError:0 POSIXError:0];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v22 logMetric:v8];
  }
}

- (void)_notifyRegistrationIdentitiesUpdated
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Registration identities updated; notifying listeners",
      buf,
      2u);
  }

  id v4 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v9, "centerUpdatedRegistrationIdentities:") & 1) != 0) {
          [v9 centerUpdatedRegistrationIdentities:self];
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v6);
  }
}

- (BOOL)_hasRegistration:(id)a3 inQueue:(id)a4
{
  id v5 = a3;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = a4;
  id v6 = (os_log_s *)[obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    while (2)
    {
      for (i = 0LL; i != v6; i = (os_log_s *)((char *)i + 1))
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pushToken]);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 pushToken]);
        if (v10 == v11)
        {
          unsigned int v14 = 1;
        }

        else
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 pushToken]);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 pushToken]);
          unsigned int v14 = [v12 isEqualToData:v13];
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 mainID]);
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v5 mainID]);
        if (v15 != v16)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 mainID]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 mainID]);
          v14 &= [v17 isEqualToString:v18];
        }

        unsigned int v19 = [v9 registrationType];
        else {
          unsigned int v20 = 0;
        }
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceType]);
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v5 serviceType]);
        if (v21 == (void *)v22)
        {

          if ((v20 & 1) != 0)
          {
LABEL_21:
            id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v34 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  " => Has registration in queue: %@",  buf,  0xCu);
            }

            LOBYTE(v6) = 1;
            goto LABEL_24;
          }
        }

        else
        {
          __int128 v23 = (void *)v22;
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceType]);
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceType]);
          unsigned int v26 = v20 & [v24 isEqualToString:v25];

          if (v26 == 1) {
            goto LABEL_21;
          }
        }
      }

      id v6 = (os_log_s *)[obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (int64_t)_countOfMessagesQueuedOfType:(Class)a3 matchingCriteria:(id)a4
{
  id v6 = (unsigned int (**)(id, void))a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenterMessageDelivery queuedMessages]( self->_httpMessageDelivery,  "queuedMessages",  0LL));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    int64_t v10 = 0LL;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (!a3 || (objc_opt_isKindOfClass(*(void *)(*((void *)&v15 + 1) + 8LL * (void)i), a3) & 1) != 0) {
          v10 += v6[2](v6, v13);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  else
  {
    int64_t v10 = 0LL;
  }

  return v10;
}

- (id)_keyTransparencyAccountKeyFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 services]);
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    __int128 v29 = v9;
    id v30 = v7;
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v13 = 0LL;
      id v28 = v11;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v13);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"service"]);
        if ([v15 isEqualToString:v7])
        {
          __int128 v31 = v15;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"users"]);
          id v17 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v33;
            while (2)
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v33 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"uris"]);
                unsigned int v40 = @"uri";
                __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
                int64_t v41 = v23;
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));

                if ([v22 containsObject:v24])
                {
                  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"kt-account-key"]);

                  id v9 = v29;
                  id v7 = v30;
                  goto LABEL_21;
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v9 = v29;
          id v7 = v30;
          uint64_t v12 = v27;
          id v11 = v28;
          __int128 v15 = v31;
        }

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v13 != v11);
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
      __int128 v25 = 0LL;
    }

    while (v11);
  }

  else
  {
    __int128 v25 = 0LL;
  }

- (id)_keyTransparencyLoggableDataFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 services]);
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    __int128 v29 = v9;
    id v30 = v7;
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v13 = 0LL;
      id v28 = v11;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v13);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"service"]);
        if ([v15 isEqualToString:v7])
        {
          __int128 v31 = v15;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"users"]);
          id v17 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v33;
            while (2)
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v33 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"uris"]);
                unsigned int v40 = @"uri";
                __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
                int64_t v41 = v23;
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));

                if ([v22 containsObject:v24])
                {
                  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"kt-loggable-data"]);

                  id v9 = v29;
                  id v7 = v30;
                  goto LABEL_21;
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v9 = v29;
          id v7 = v30;
          uint64_t v12 = v27;
          id v11 = v28;
          __int128 v15 = v31;
        }

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v13 != v11);
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
      __int128 v25 = 0LL;
    }

    while (v11);
  }

  else
  {
    __int128 v25 = 0LL;
  }

- (id)_keyTransparencyDeviceSignatureFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 services]);
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    id v30 = v9;
    id v31 = v7;
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v13 = 0LL;
      id v29 = v11;
      do
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v13);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"service"]);
        if ([v15 isEqualToString:v7])
        {
          __int128 v32 = v15;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"users"]);
          id v17 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v34;
            while (2)
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"uris"]);
                int64_t v41 = @"uri";
                __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
                unsigned __int8 v42 = v23;
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));

                if ([v22 containsObject:v24])
                {
                  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"client-data"]);
                  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"device-key-signature"]);

                  id v9 = v30;
                  id v7 = v31;
                  goto LABEL_21;
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v9 = v30;
          id v7 = v31;
          uint64_t v12 = v28;
          id v11 = v29;
          __int128 v15 = v32;
        }

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v13 != v11);
      id v11 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
      __int128 v25 = 0LL;
    }

    while (v11);
  }

  else
  {
    __int128 v25 = 0LL;
  }

- (void)_processRegistrationMessage:(id)a3 sentRegistrations:(id)a4 descriptionString:(id)a5 actionID:(id)a6 actionString:(id)a7 isDeregister:(BOOL)a8 deliveredWithError:(id)a9 resultCode:(int64_t)a10 resultDictionary:(id)a11
{
  BOOL v354 = a8;
  id v350 = a3;
  id v16 = a4;
  id v301 = a5;
  id v305 = a6;
  id v302 = a7;
  id v342 = a9;
  id v303 = a11;
  v425 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center process registration message",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v425, &state);
  -[IDSRegistrationCenter _noteRegistration](self, "_noteRegistration");
  v300 = v16;
  id v17 = [v16 _copyForEnumerating];
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  v353 = self;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v434 = v17;
    *(_WORD *)&v434[8] = 2112;
    *(void *)&v434[10] = v305;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Final Active registrations: %@  (For: %@)",  buf,  0x16u);
  }

  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  unint64_t v20 = a10;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = (objc_class *)objc_opt_class(v350, v21);
    __int128 v23 = NSStringFromClass(v22);
    id v24 = (id)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 138413314;
    *(void *)v434 = v24;
    *(_WORD *)&v434[8] = 2112;
    *(void *)&v434[10] = v342;
    *(_WORD *)&v434[18] = 1024;
    *(_DWORD *)&v434[20] = a10;
    *(_WORD *)&v434[24] = 2112;
    *(void *)&v434[26] = v303;
    *(_WORD *)&v434[34] = 2112;
    *(void *)&v434[36] = v305;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Message class: %@  delivered with error: %@  code: %d result: %@   ID: %@",  buf,  0x30u);
  }

  if (qword_1009C0650 != -1) {
    dispatch_once(&qword_1009C0650, &stru_1008FE130);
  }
  if (byte_1009C0648)
  {
    unint64_t v20 = IMGetDomainIntForKey(@"com.apple.registration", @"registerCodeOverride");
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v434 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Overriding response code registration message! {overrideResultCode: %ld}",  buf,  0xCu);
    }
  }

  if (byte_1009C0649)
  {
    uint64_t v26 = IMGetDomainValueForKey(@"com.apple.registration", @"phoneUserCodeOverrideService");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString, v28);
    if ((objc_opt_isKindOfClass(v27, v29) & 1) != 0) {
      id v30 = v27;
    }
    else {
      id v30 = 0LL;
    }
    id v31 = v30;

    uint64_t v32 = IMGetDomainValueForKey(@"com.apple.registration", @"phoneUserCodeOverrideService");
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString, v34);
    if ((objc_opt_isKindOfClass(v33, v35) & 1) != 0) {
      __int128 v36 = v33;
    }
    else {
      __int128 v36 = 0LL;
    }
    id v37 = v36;

    __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v434 = v31;
      *(_WORD *)&v434[8] = 2112;
      *(void *)&v434[10] = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Overriding response alert on specified services! {phoneOverrideService: %@, emailOverrideService: %@}",  buf,  0x16u);
    }

    if ([v31 length] || objc_msgSend(v37, "length"))
    {
      __int128 v423 = 0u;
      __int128 v422 = 0u;
      __int128 v421 = 0u;
      __int128 v420 = 0u;
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v350 responseServices]);
      id v40 = [v39 countByEnumeratingWithState:&v420 objects:v443 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v421;
        while (2)
        {
          for (i = 0LL; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v421 != v41) {
              objc_enumerationMutation(v39);
            }
            id v43 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v420 + 1) + 8 * (void)i) objectForKey:@"service"]);
            if (([v31 isEqualToString:v43] & 1) != 0
              || [v37 isEqualToString:v43])
            {
              [v350 setResponseAlertInfo:&off_1009489F0];

              goto LABEL_33;
            }
          }

          id v40 = [v39 countByEnumeratingWithState:&v420 objects:v443 count:16];
          if (v40) {
            continue;
          }
          break;
        }
      }

- (id)_URIsToRegisterForRegistration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v5 = [v3 registrationType];
  if (![v3 registrationType] || objc_msgSend(v3, "registrationType") == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 phoneNumber]);
    uint64_t v10 = IMSingleObjectArray(v6, v7, v8, v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 _URIsFromIDs]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "__imArrayByApplyingBlock:", &stru_1008FE170));
    -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v13);

LABEL_9:
    goto LABEL_10;
  }

  if ([v3 registrationType] == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 emailsToRegister]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 _URIsFromIDs]);
    id v11 = v14;
    __int128 v15 = &stru_1008FE190;
LABEL_8:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "__imArrayByApplyingBlock:", v15));
    -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v12);
    goto LABEL_9;
  }

  if (v5 == 3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uris]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 _URIsFromIDs]);
    id v11 = v14;
    __int128 v15 = &stru_1008FE1B0;
    goto LABEL_8;
  }

- (id)_trustedDeviceForRegistrations:(id)a3 transparencyLoggableDatasByServiceType:(id)a4 transparencyDeviceSignaturesByServiceType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v34 = a5;
  uint64_t v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = v9;
  id v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v44;
    id v31 = v8;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)v10);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_100215094;
        v42[3] = &unk_1008FE1D8;
        v42[4] = v11;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v42));
        if ([v12 count])
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceIdentifier]);
        }

        else
        {
          id v37 = 0LL;
        }

        unsigned int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v15 = v12;
        id v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v39;
          do
          {
            uint64_t v19 = 0LL;
            do
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(v15);
              }
              unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _URIsToRegisterForRegistration:]( self,  "_URIsToRegisterForRegistration:",  *(void *)(*((void *)&v38 + 1) + 8LL * (void)v19)));
              -[NSMutableSet unionSet:](v14, "unionSet:", v20);

              uint64_t v19 = (char *)v19 + 1;
            }

            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }

          while (v17);
        }

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v11]);
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:v11]);
        __int128 v23 = (void *)v22;
        if (v21 && v22)
        {
          id v24 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedService);
          -[IDSProtoKeyTransparencyTrustedService setServiceIdentifier:](v24, "setServiceIdentifier:", v37);
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v14, "allObjects"));
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_1008FE1F8));
          id v27 = [v26 mutableCopy];
          -[IDSProtoKeyTransparencyTrustedService setUris:](v24, "setUris:", v27);

          id v8 = v31;
          -[IDSProtoKeyTransparencyTrustedService setKtLoggableData:](v24, "setKtLoggableData:", v21);
          -[IDSProtoKeyTransparencyTrustedService setDeviceSignature:](v24, "setDeviceSignature:", v23);
          -[NSMutableArray addObject:](v32, "addObject:", v24);
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v10 != v35);
      id v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v35);
  }

  uint64_t v28 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDevice);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSProtoKeyTransparencyTrustedDevice setPushToken:](v28, "setPushToken:", v29);

  -[IDSProtoKeyTransparencyTrustedDevice setTrustedServices:](v28, "setTrustedServices:", v32);
  return v28;
}

- (id)privateDeviceDataForKVSSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v54 = [v4 deviceType];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  value = (void *)objc_claimAutoreleasedReturnValue([v5 deviceColor]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v57 = (void *)objc_claimAutoreleasedReturnValue([v6 enclosureColor]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
  unsigned int v56 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceIdentifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceReferenceDate];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);

  if (v3) {
    uint64_t v10 = &off_1009475A8;
  }
  else {
    uint64_t v10 = &off_1009475C0;
  }
  id v53 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);
  id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  kTransparencyAnalyticsVersion));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v12 = [v11 supportsSMS];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned int v51 = [v13 supportsMMS];

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v15 = [v14 supportsApplePay];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v17 = [v16 supportsHandoff];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v19 = [v18 supportsTethering];

  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  if ([v20 supportsIdentification])
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    BOOL v22 = [v21 deviceType] == (id)2;
  }

  else
  {
    BOOL v22 = 0LL;
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v24 = [v23 isGreenTea];

  __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v26 = _IDSPrivateDeviceDataVersionNumber();
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringValue]);
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v28, IDSPrivateDeviceDataVersion);

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 stringValue]);
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v30, IDSPrivateDeviceDataSupportsApplePay);

  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 stringValue]);
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v32, IDSPrivateDeviceDataSupportsHandoff);

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 stringValue]);
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v34, IDSPrivateDeviceDataSupportsTethering);

  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 stringValue]);
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v36, IDSPrivateDeviceDataSupportsSMSRelay);

  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v51));
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 stringValue]);
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v38, IDSPrivateDeviceDataSupportsMMSRelay);

  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 stringValue]);
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v40, IDSPrivateDeviceDataSupportsPhoneCalls);

  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v24));
  unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 stringValue]);
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v42, IDSPrivateDeviceDataGreenTea);

  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 productBuildVersion]);

  if (v44) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataProductBuildVersion, v44);
  }

  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 productName]);

  if (v46) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataProductName, v46);
  }

  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
  id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 productVersion]);

  if (v48) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataProductVersion, v48);
  }

  if (v56) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataUniqueID, v56);
  }
  if (v55) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataRegistrationDate, v55);
  }
  id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v54));
  if (v49) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataDeviceType, v49);
  }

  if (value) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataColor, value);
  }
  if (v57) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataEnclosureColor, v57);
  }
  if (v53) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataKeyTransparencyFlags, v53);
  }
  if (v52) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataTransparencyVersion, v52);
  }

  return v25;
}

- (void)_sendRegistrationAsDeregister:(BOOL)a3
{
  BOOL v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v50 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center send registration message",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v50, &state);
  if (v3)
  {
    if (!self->_pendingDeregistration)
    {
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "This is a deregister, and we have no pending deregistration, bailing",  buf,  2u);
      }

      goto LABEL_23;
    }

    unsigned int v5 = @"deregistration";
    id v6 = @"deregister";
  }

  else
  {
    unsigned int v5 = @"registration";
    id v6 = @"register";
  }

  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  if (+[IDSRegistrationController canCompleteRegistration]( &OBJC_CLASS___IDSRegistrationController,  "canCompleteRegistration"))
  {
    if (!-[os_log_s length](v7, "length"))
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
        currentRegistrations = self->_currentRegistrations;
        *(_DWORD *)buf = 138412546;
        id v52 = v9;
        __int16 v53 = 2112;
        id v54 = currentRegistrations;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Push handler returned push token: %@, deferring (%@)",  buf,  0x16u);
      }

      -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
    }

    if (-[NSMutableArray count](self->_currentRegistrations, "count"))
    {
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = self->_currentRegistrations;
        *(_DWORD *)buf = 138412290;
        id v52 = v12;
        uint64_t v13 = "*** We have current (de)registrations, deferring (%@)";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
        goto LABEL_22;
      }

      goto LABEL_22;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v16 = [v15 isExpired];

    if (v16)
    {
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = (void *)v5;
        uint64_t v13 = "*** Lockdown state is expired, not sending %@";
        goto LABEL_21;
      }

- (void)__reallySendDeregistration
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending deregistration now...", v4, 2u);
  }

  self->_pendingDeregistration = 1;
  -[IDSRegistrationCenter _sendRegistrationAsDeregister:](self, "_sendRegistrationAsDeregister:", 1LL);
}

- (void)_sendDeregistration:(id)a3
{
  id v4 = a3;
  sub_10012E874(0, @"Registration", @"Sending IDS deregistration", 0LL);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v6 = [v5 isExpired];

  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "*** Lockdown state is expired, not sending de-registration",  (uint8_t *)&v9,  2u);
    }
  }

  else
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Deferring deregistration for %@",  (uint8_t *)&v9,  0xCu);
    }

    -[CUTDeferredTaskQueue enqueueExecutionWithTarget:afterDelay:]( self->_sendDeregistrationTask,  "enqueueExecutionWithTarget:afterDelay:",  self,  6.0);
  }
}

- (void)sendHardDeregisterCompletionBlock:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  char v44 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center send hard deregister",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v44, &state);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending hard deregistration now...", buf, 2u);
  }

  -[IDSRegistrationCenterMessageDelivery invalidate](self->_httpMessageDelivery, "invalidate");
  -[CUTDeferredTaskQueue cancelPendingExecutions](self->_sendAuthenticateRegistrationTask, "cancelPendingExecutions");
  -[CUTDeferredTaskQueue cancelPendingExecutions](self->_sendDeregistrationTask, "cancelPendingExecutions");
  -[CUTDeferredTaskQueue cancelPendingExecutions](self->_sendRegistrationTask, "cancelPendingExecutions");
  queuedAuthentications = self->_queuedAuthentications;
  self->_queuedAuthentications = 0LL;

  queuedRegistrations = self->_queuedRegistrations;
  self->_queuedRegistrations = 0LL;

  -[IDSValidationQueue clearQueueForSubsystem:](self->_validationQueue, "clearQueueForSubsystem:", 1LL);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v9 = [v8 isExpired];

  if (v9)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"hard deregister";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "*** Lockdown state is expired, not sending %@",  buf,  0xCu);
    }

    -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    id v12 = objc_alloc_init(&OBJC_CLASS___IDSRegistrationMessage);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sending IDS %@",  @"hard deregister"));
    sub_10012E874(0, @"Registration", v13, 0LL);

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v14 model]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 productOSVersion]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 productBuildVersion]);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceName]);

    IDSAssignPushIdentityToMessage(v12);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    -[IDSRegistrationMessage setServices:](v12, "setServices:", v21);

    -[IDSRegistrationMessage setDeviceName:](v12, "setDeviceName:", v20);
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
    -[IDSRegistrationMessage setPushToken:](v12, "setPushToken:", v22);

    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Push handler returned push token: %@",  buf,  0xCu);
    }

    -[IDSRegistrationMessage setHardwareVersion:](v12, "setHardwareVersion:", v29);
    -[IDSRegistrationMessage setOsVersion:](v12, "setOsVersion:", v16);
    -[IDSRegistrationMessage setSoftwareVersion:](v12, "setSoftwareVersion:", v18);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100218D04;
    v38[3] = &unk_1008FE2D8;
    v38[4] = self;
    id v39 = @"hard deregister";
    id v25 = v11;
    id v40 = v25;
    id v41 = @"deregister";
    id v42 = v4;
    -[IDSRegistrationMessage setCompletionBlock:](v12, "setCompletionBlock:", v38);
    -[IDSRegistrationMessage setTimeout:](v12, "setTimeout:", 36000.0);
    sub_1001BFCFC();
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    validationQueue = self->_validationQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100218D6C;
    v32[3] = &unk_1008FE288;
    id v33 = @"hard deregister";
    id v27 = v25;
    id v34 = v27;
    unsigned __int8 v35 = self;
    uint64_t v28 = v12;
    unsigned __int8 v36 = v28;
    unsigned __int8 v37 = @"deregister";
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100218F54;
    v30[3] = &unk_1008FE320;
    objc_copyWeak(&v31, (id *)buf);
    -[IDSValidationQueue queueBuildingValidationDataIfNecessaryForMessage:subsystem:withQueueCompletion:sendBlock:]( validationQueue,  "queueBuildingValidationDataIfNecessaryForMessage:subsystem:withQueueCompletion:sendBlock:",  v28,  1LL,  v32,  v30);
    objc_destroyWeak(&v31);

    objc_destroyWeak((id *)buf);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v44);
}

- (id)_authMessageCompletionWithRegistration:(id)a3 withOverallSuccessBlock:(id)a4 overallFailure:(id)a5
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100219078;
  v13[3] = &unk_1008FE368;
  v13[4] = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  id v10 = objc_retainBlock(v13);
  uint64_t v11 = objc_retainBlock(v10);

  return v11;
}

- (int64_t)_authSubsystemForInfo:(id)a3
{
  else {
    return 1LL;
  }
}

- (id)_authDSMessageForRegistration:(id)a3 realm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 profileID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _IDFromFZIDType:2]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationToken]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  uint64_t v12 = _AuthenticationDictionaryFromParameters(1LL, v10, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 mainID]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 generateCSRForUserID:v15]);

  id v17 = objc_alloc_init(&OBJC_CLASS___IDSAuthenticateMessage);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "      User ID: %@", buf, 0xCu);
  }

  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "     AuthInfo: %@", buf, 0xCu);
  }

  -[IDSAuthenticateMessage setUserID:](v17, "setUserID:", v9);
  -[IDSAuthenticateMessage setRealm:](v17, "setRealm:", v7);

  -[IDSAuthenticateMessage setCsr:](v17, "setCsr:", v16);
  -[IDSAuthenticateMessage setAuthenticationInfo:](v17, "setAuthenticationInfo:", v13);
  id v20 = sub_1002408C4(v6);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[IDSAuthenticateMessage setDSAuthID:](v17, "setDSAuthID:", v21);

  IDSAssignPushIdentityToMessage(v17);
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v6,  @"info"));
  -[IDSAuthenticateMessage setUserInfo:](v17, "setUserInfo:", v22);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100219A3C;
  v29[3] = &unk_1008FE390;
  id v30 = v6;
  id v31 = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100219DE4;
  v26[3] = &unk_1008FE3B8;
  id v27 = v30;
  uint64_t v28 = self;
  id v23 = v30;
  id v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _authMessageCompletionWithRegistration:withOverallSuccessBlock:overallFailure:]( self,  "_authMessageCompletionWithRegistration:withOverallSuccessBlock:overallFailure:",  v23,  v29,  v26));
  -[IDSAuthenticateMessage setCompletionBlock:](v17, "setCompletionBlock:", v24);

  return v17;
}

- (id)_authUsersMessageForRegistration:(id)a3 realm:(id)a4
{
  id v39 = a3;
  id v41 = a4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 registrationConductor]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userStore]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 usersWithRealm:0]);
  id v9 = objc_alloc_init(&OBJC_CLASS___IDSAuthenticateUsersMessage);
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v57;
    id v42 = v9;
    BOOL v45 = v7;
    do
    {
      uint64_t v13 = 0LL;
      id v46 = v11;
      do
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(__CFString **)(*((void *)&v56 + 1) + 8LL * (void)v13);
        id v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 authenticationCertificateForUser:v14]);
        id v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString realmPrefixedIdentifier](v14, "realmPrefixedIdentifier"));
        if (v15)
        {
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            __int128 v61 = v16;
            __int16 v62 = 2112;
            __int128 v63 = v14;
            __int16 v64 = 2112;
            id v65 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "     Authing user with cert {rpi: %@, user: %@, cert: %@}",  buf,  0x20u);
          }

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataRepresentation](v15, "dataRepresentation"));
          -[IDSAuthenticateUsersMessage addRequestWithID:cert:](v9, "addRequestWithID:cert:", v16, v18);
        }

        else
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 credentialForUser:v14]);
          uint64_t v18 = v19;
          if (v19
            && ![v19 realm]
            && (uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 smsSignature])) != 0)
          {
            id v20 = (void *)v21;
            BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
            id v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uniqueIdentifier](v14, "uniqueIdentifier"));
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 SIMForIdentifier:v23]);

            char v44 = v24;
            id v25 = [v24 slot];
            id v26 = @"SIM2";
            if (!v25) {
              id v26 = @"SIM1";
            }
            id v27 = v26;
            uint64_t v28 = objc_claimAutoreleasedReturnValue([v20 _FTDataFromBase64String]);
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413058;
              __int128 v61 = v27;
              __int16 v62 = 2112;
              __int128 v63 = v16;
              __int16 v64 = 2112;
              id v65 = v14;
              __int16 v66 = 2112;
              uint64_t v67 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "     Authing user with sig {tag: %@, rpi: %@, user: %@, sigData: %@}",  buf,  0x2Au);
            }

            id v30 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
            id v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString unprefixedIdentifier](v14, "unprefixedIdentifier"));
            __int128 v43 = v27;
            uint64_t v32 = (void *)v28;
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v30 generateCSRForUserID:v31]);

            -[IDSAuthenticateUsersMessage addRequestWithID:sig:csr:tag:]( v42,  "addRequestWithID:sig:csr:tag:",  v16,  v32,  v33,  v43);
            id v9 = v42;
          }

          else
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v61 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_DEFAULT,  "     User lacking cert or credential: %@",  buf,  0xCu);
            }
          }

          id v7 = v45;
          id v11 = v46;
        }

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    }

    while (v11);
  }

  -[IDSAuthenticateUsersMessage setRealm:](v9, "setRealm:", v41);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSAuthenticateUsersMessage setPushToken:](v9, "setPushToken:", v34);

  IDSAssignPushIdentityToMessage(v9);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_10021A46C;
  v52[3] = &unk_1008FE408;
  id v53 = v7;
  id v54 = v39;
  unsigned int v55 = self;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10021AB54;
  v48[3] = &unk_1008FE430;
  id v49 = v54;
  id v50 = v53;
  unsigned int v51 = self;
  id v35 = v53;
  id v36 = v54;
  unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _authMessageCompletionWithRegistration:withOverallSuccessBlock:overallFailure:]( self,  "_authMessageCompletionWithRegistration:withOverallSuccessBlock:overallFailure:",  v36,  v52,  v48));
  -[IDSAuthenticateUsersMessage setCompletionBlock:](v9, "setCompletionBlock:", v37);

  return v9;
}

- (id)_provDeviceIdentityMessageForRegistration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_alloc_init(&OBJC_CLASS___IDSProvisionDeviceIdentityMessage);
  IDSAssignPushIdentityToMessage(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSProvisionDeviceIdentityMessage setPushToken:](v5, "setPushToken:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 mainID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 generateCSRForUserID:v8]);

  -[IDSProvisionDeviceIdentityMessage setCsr:](v5, "setCsr:", v9);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10021AE64;
  v19[3] = &unk_1008FE458;
  v19[4] = self;
  id v20 = v4;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_10021B358;
  id v16 = &unk_1008FE3B8;
  id v17 = v20;
  uint64_t v18 = self;
  id v10 = v20;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _authMessageCompletionWithRegistration:withOverallSuccessBlock:overallFailure:]( self,  "_authMessageCompletionWithRegistration:withOverallSuccessBlock:overallFailure:",  v10,  v19,  &v13));
  -[IDSProvisionDeviceIdentityMessage setCompletionBlock:](v5, "setCompletionBlock:", v11, v13, v14, v15, v16);

  return v5;
}

- (id)_provTemporaryPhoneMessageForRegistration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 registrationConductor]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userStore]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userUniqueIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 userWithUniqueIdentifier:v8]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 credentialForUser:v9]);
  if ([v10 realm] == (id)2)
  {
    id v11 = v10;
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___IDSProvisionTemporaryPhoneMessage);
    IDSAssignPushIdentityToMessage(v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
    -[IDSProvisionTemporaryPhoneMessage setPushToken:](v12, "setPushToken:", v13);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]);
    -[IDSProvisionTemporaryPhoneMessage setProfileID:](v12, "setProfileID:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]);
    -[IDSProvisionTemporaryPhoneMessage setAuthToken:](v12, "setAuthToken:", v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 countryCode]);
    -[IDSProvisionTemporaryPhoneMessage setCountryCode:](v12, "setCountryCode:", v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 networkCode]);
    -[IDSProvisionTemporaryPhoneMessage setNetworkCode:](v12, "setNetworkCode:", v17);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 phoneAuthenticationCertificate]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dataRepresentation]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 idsUserID]);
    -[IDSProvisionTemporaryPhoneMessage addPhoneAuthenticationCertificate:withUserID:]( v12,  "addPhoneAuthenticationCertificate:withUserID:",  v19,  v20);

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 idsUserID]);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10021B704;
    v33[3] = &unk_1008FE480;
    id v34 = v7;
    id v35 = v21;
    id v36 = v4;
    unsigned __int8 v37 = self;
    id v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    id v27 = sub_10021BD50;
    uint64_t v28 = &unk_1008FE4A8;
    id v29 = v36;
    id v30 = v34;
    id v31 = v35;
    uint64_t v32 = self;
    id v22 = v35;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _authMessageCompletionWithRegistration:withOverallSuccessBlock:overallFailure:]( self,  "_authMessageCompletionWithRegistration:withOverallSuccessBlock:overallFailure:",  v29,  v33,  &v25));
    -[IDSProvisionTemporaryPhoneMessage setCompletionBlock:](v12, "setCompletionBlock:", v23, v25, v26, v27, v28);
  }

  else
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT)) {
      sub_1006A4348((uint64_t)v4, (uint64_t)v10, (os_log_t)v11);
    }
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (id)_authMessageForRegistration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);
  id v6 = sub_10012EBC4(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = sub_10012EC50([v4 registrationType]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "IDS authenticating registration info: %@",  (uint8_t *)&v24,  0xCu);
  }

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 debugDescription]);
    int v24 = 138412290;
    id v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "    Push handler returned push token: %@",  (uint8_t *)&v24,  0xCu);
  }

  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "      Service: %@", (uint8_t *)&v24, 0xCu);
  }

  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "        Realm: %@", (uint8_t *)&v24, 0xCu);
  }

  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    uint64_t v19 = IMGetEnvironmentName(v17, v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    int v24 = 138412290;
    id v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "  Environment: %@", (uint8_t *)&v24, 0xCu);
  }

  switch([v4 registrationType])
  {
    case 0u:
      uint64_t v21 = objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _authUsersMessageForRegistration:realm:]( self,  "_authUsersMessageForRegistration:realm:",  v4,  v9));
      goto LABEL_17;
    case 1u:
      uint64_t v21 = objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _authDSMessageForRegistration:realm:]( self,  "_authDSMessageForRegistration:realm:",  v4,  v9));
      goto LABEL_17;
    case 2u:
      uint64_t v21 = objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _provTemporaryPhoneMessageForRegistration:]( self,  "_provTemporaryPhoneMessageForRegistration:",  v4));
      goto LABEL_17;
    case 3u:
      uint64_t v21 = objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _provDeviceIdentityMessageForRegistration:]( self,  "_provDeviceIdentityMessageForRegistration:",  v4));
LABEL_17:
      id v22 = (void *)v21;
      break;
    default:
      id v22 = 0LL;
      break;
  }

  return v22;
}

- (void)_sendAuthenticateRegistration:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v27 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center send authenticate registration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v27, &state);
  if (-[NSMutableArray count](self->_currentAuthentications, "count"))
  {
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      currentAuthentications = self->_currentAuthentications;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = currentAuthentications;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "*** We have current IDS Authentications, deferring (%@)",  buf,  0xCu);
    }

    -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
    if ([v7 length])
    {
      if (v4)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
        unsigned int v9 = [v8 isExpired];

        if (v9)
        {
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "*** Lockdown state is expired, not sending IDS Authentication",  buf,  2u);
          }
        }

        else
        {
          -[NSMutableArray addObject:](self->_currentAuthentications, "addObject:", v4);
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationCenter _authMessageForRegistration:]( self,  "_authMessageForRegistration:",  v4));
          if (v10)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
            [v14 noteAuthenticationStarted];

            if ([v4 registrationType] == 3)
            {
              *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
              objc_initWeak((id *)buf, self);
              id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationCenter validationQueue](self, "validationQueue"));
              int64_t v16 = -[IDSRegistrationCenter _authSubsystemForInfo:](self, "_authSubsystemForInfo:", v4);
              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472LL;
              v22[2] = sub_10021C6E8;
              v22[3] = &unk_1008F8A28;
              objc_copyWeak(&v25, (id *)buf);
              id v10 = v10;
              id v23 = v10;
              id v17 = v4;
              id v24 = v17;
              v19[0] = _NSConcreteStackBlock;
              v19[1] = 3221225472LL;
              v19[2] = sub_10021C7C4;
              v19[3] = &unk_1008FE4D0;
              objc_copyWeak(&v21, (id *)buf);
              id v20 = v17;
              [v15 queueBuildingValidationDataIfNecessaryForMessage:v10 subsystem:v16 withQueueCompletion:v22 sendBlock:v19];

              objc_destroyWeak(&v21);
              objc_destroyWeak(&v25);
              objc_destroyWeak((id *)buf);
            }

            else
            {
              -[IDSRegistrationCenter _sendIDSAuthRequest:forInfo:](self, "_sendIDSAuthRequest:forInfo:", v10, v4);
            }
          }

          else
          {
            uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Not sending nil IDS Authentication request: %@",  buf,  0xCu);
            }

            -[NSMutableArray removeObject:](self->_currentAuthentications, "removeObject:", v4);
            -[NSMutableArray removeObject:](self->_queuedAuthentications, "removeObject:", v4);
          }
        }
      }
    }

    else
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
        uint64_t v13 = self->_currentAuthentications;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Push handler returned push token: %@, deferring (%@)",  buf,  0x16u);
      }

      -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
    }
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v27);
}

- (void)_sendIDSAuthRequest:(id)a3 forInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setTimeout:36000.0];
  sub_10012E874(0, @"Registration", @"Sending IDS Authentication request", 0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceInformationString]);
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Sending IDS Authentication request: %@   (Environment: %@)",  (uint8_t *)&v11,  0x16u);
  }

  [v6 registrationType];
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v7);

  -[IDSRegistrationCenter cancelRegisterActionsForRegistrationInfo:]( self,  "cancelRegisterActionsForRegistrationInfo:",  v6);
}

- (void)reportSpamMessage:(id)a3 selfURI:(id)a4 registration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = objc_alloc_init(&OBJC_CLASS___IDSReportGeneralSpamMessage);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSReportGeneralSpamMessage setPushToken:](v11, "setPushToken:", v12);

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 registrationCert]);
  -[IDSReportGeneralSpamMessage setIDCertificate:](v11, "setIDCertificate:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSReportGeneralSpamMessage setIdentityPrivateKey:]( v11,  "setIdentityPrivateKey:",  [v14 identityPrivateKey]);

  -[IDSReportGeneralSpamMessage setSpamMessage:](v11, "setSpamMessage:", v10);
  -[IDSReportGeneralSpamMessage setSelfURI:](v11, "setSelfURI:", v9);

  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog spamReporting](&OBJC_CLASS___IMRGLog, "spamReporting"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending report spam message", v16, 2u);
  }

  -[IDSReportGeneralSpamMessage setCompletionBlock:](v11, "setCompletionBlock:", &stru_1008FE510);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v11);
}

- (void)reportUnknownSenderMessage:(id)a3 selfURI:(id)a4 registration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"ft-should-report-unknown-sender"]);

  if (v12 && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13), (objc_opt_isKindOfClass(v12, v14) & 1) != 0))
  {
    unsigned __int8 v15 = [v12 BOOLValue];

    if ((v15 & 1) == 0)
    {
      int64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog spamReporting](&OBJC_CLASS___IMRGLog, "spamReporting"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Server has disabled unknown sender reporting.",  buf,  2u);
      }

      goto LABEL_10;
    }
  }

  else
  {
  }

  int64_t v16 = objc_alloc_init(&OBJC_CLASS___IDSReportGeneralUnknownSenderMessage);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[os_log_s setPushToken:](v16, "setPushToken:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 registrationCert]);
  -[os_log_s setIDCertificate:](v16, "setIDCertificate:", v18);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[os_log_s setIdentityPrivateKey:](v16, "setIdentityPrivateKey:", [v19 identityPrivateKey]);

  -[os_log_s setUnknownSenderInfo:](v16, "setUnknownSenderInfo:", v8);
  -[os_log_s setSelfURI:](v16, "setSelfURI:", v9);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog spamReporting](&OBJC_CLASS___IMRGLog, "spamReporting"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sending report unknown sender", v21, 2u);
  }

  -[os_log_s setCompletionBlock:](v16, "setCompletionBlock:", &stru_1008FE530);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v16);
LABEL_10:
}

- (void)reportSpamWithMessages:(id)a3 selfURI:(id)a4 registration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = objc_alloc_init(&OBJC_CLASS___IDSReportSpamMessage);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSReportSpamMessage setPushToken:](v11, "setPushToken:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 registrationCert]);
  -[IDSReportSpamMessage setIDCertificate:](v11, "setIDCertificate:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSReportSpamMessage setIdentityPrivateKey:](v11, "setIdentityPrivateKey:", [v14 identityPrivateKey]);

  -[IDSReportSpamMessage setSpamMessages:](v11, "setSpamMessages:", v10);
  -[IDSReportSpamMessage setSelfURI:](v11, "setSelfURI:", v9);

  unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iMessageSpam](&OBJC_CLASS___IMRGLog, "iMessageSpam"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending report spam message", v16, 2u);
  }

  -[IDSReportSpamMessage setCompletionBlock:](v11, "setCompletionBlock:", &stru_1008FE550);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v11);
}

- (void)reportClientEvent:(id)a3 registration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = objc_alloc_init(&OBJC_CLASS___IDSReportClientEventMessage);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSReportClientEventMessage setPushToken:](v11, "setPushToken:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 registrationCert]);
  -[IDSReportClientEventMessage setIDCertificate:](v11, "setIDCertificate:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSReportClientEventMessage setIdentityPrivateKey:]( v11,  "setIdentityPrivateKey:",  [v14 identityPrivateKey]);

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 report]);
  -[IDSReportClientEventMessage setReport:](v11, "setReport:", v15);

  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 reportType]);
  -[IDSReportClientEventMessage setReportType:](v11, "setReportType:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 timeout]);
  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 timeout]);
    [v18 doubleValue];
    -[IDSReportClientEventMessage setTimeout:](v11, "setTimeout:");
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 model]);

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 productOSVersion]);

  -[IDSReportClientEventMessage setOsVersion:](v11, "setOsVersion:", v22);
  -[IDSReportClientEventMessage setHardwareVersion:](v11, "setHardwareVersion:", v20);
  IDSAssignPushIdentityToMessage(v11);
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Sending report client event message", buf, 2u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10021D3B4;
  v25[3] = &unk_1008FE578;
  id v26 = v9;
  id v24 = v9;
  -[IDSReportClientEventMessage setCompletionBlock:](v11, "setCompletionBlock:", v25);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v11);
}

- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 selfURI:(id)a8 registration:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_alloc_init(&OBJC_CLASS___IDSReportUnknownSenderMessage);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSReportUnknownSenderMessage setPushToken:](v21, "setPushToken:", v22);

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 registrationCert]);
  -[IDSReportUnknownSenderMessage setIDCertificate:](v21, "setIDCertificate:", v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSReportUnknownSenderMessage setIdentityPrivateKey:]( v21,  "setIdentityPrivateKey:",  [v24 identityPrivateKey]);

  -[IDSReportUnknownSenderMessage setSelfURI:](v21, "setSelfURI:", v17);
  -[IDSReportUnknownSenderMessage setUnknownSenderURI:](v21, "setUnknownSenderURI:", v20);

  -[IDSReportUnknownSenderMessage setMessageID:](v21, "setMessageID:", v19);
  -[IDSReportUnknownSenderMessage setIsBlackholed:](v21, "setIsBlackholed:", v12);
  -[IDSReportUnknownSenderMessage setIsJunked:](v21, "setIsJunked:", v11);
  id v25 = [v18 intValue];

  -[IDSReportUnknownSenderMessage setMessageServerTimestamp:](v21, "setMessageServerTimestamp:", v25);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iMessageSpam](&OBJC_CLASS___IMRGLog, "iMessageSpam"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v27 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Sending report iMessage unknown sender message",  v27,  2u);
  }

  -[IDSReportUnknownSenderMessage setCompletionBlock:](v21, "setCompletionBlock:", &stru_1008FE598);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v21);
}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 registration:(id)a6 withCompletion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_alloc_init(&OBJC_CLASS___IDSReportApprovedTempUser);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSReportApprovedTempUser setPushToken:](v16, "setPushToken:", v17);

  IDSAssignPushIdentityToMessage(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 registrationCert]);

  -[IDSReportApprovedTempUser setIDCertificate:](v16, "setIDCertificate:", v18);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSReportApprovedTempUser setIdentityPrivateKey:]( v16,  "setIdentityPrivateKey:",  [v19 identityPrivateKey]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 prefixedURI]);
  -[IDSReportApprovedTempUser setSelfURI:](v16, "setSelfURI:", v20);

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 prefixedURI]);
  -[IDSReportApprovedTempUser setTempUserID:](v16, "setTempUserID:", v21);

  -[IDSReportApprovedTempUser setReportAction:](v16, "setReportAction:", a3);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Sending report approved temp handle message",  buf,  2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10021DA78;
  v24[3] = &unk_1008FE578;
  id v25 = v12;
  id v23 = v12;
  -[IDSReportApprovedTempUser setCompletionBlock:](v16, "setCompletionBlock:", v24);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v16);
}

- (void)reportiMessageSpamCheckUnknown:(id)a3 count:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = objc_alloc_init(&OBJC_CLASS___IDSCheckUnknownSenderMessage);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSCheckUnknownSenderMessage setPushToken:](v11, "setPushToken:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 model]);
  -[IDSCheckUnknownSenderMessage setHardwareVersion:](v11, "setHardwareVersion:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 productOSVersion]);
  -[IDSCheckUnknownSenderMessage setOSVersion:](v11, "setOSVersion:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 productBuildVersion]);
  -[IDSCheckUnknownSenderMessage setSoftwareVersion:](v11, "setSoftwareVersion:", v18);

  -[IDSCheckUnknownSenderMessage setSender:](v11, "setSender:", v10);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationCenter _geoRegion](self, "_geoRegion"));
  -[IDSCheckUnknownSenderMessage setGeo:](v11, "setGeo:", v19);

  -[IDSCheckUnknownSenderMessage setAttemptCount:](v11, "setAttemptCount:", v9);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10021DD58;
  v21[3] = &unk_1008FE578;
  id v22 = v8;
  id v20 = v8;
  -[IDSCheckUnknownSenderMessage setCompletionBlock:](v11, "setCompletionBlock:", v21);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v11);
}

- (id)_geoRegion
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[APSConnection geoRegion](&OBJC_CLASS___APSConnection, "geoRegion"));
  if ([v2 length]) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = @"UNKNOWN";
  }

  return v3;
}

- (BOOL)isRegistering:(id)a3
{
  id v4 = a3;
  if (-[IDSRegistrationCenter _hasRegistration:inQueue:]( self,  "_hasRegistration:inQueue:",  v4,  self->_queuedRegistrations))
  {
    BOOL v5 = 1;
  }

  else
  {
    BOOL v5 = -[IDSRegistrationCenter _hasRegistration:inQueue:]( self,  "_hasRegistration:inQueue:",  v4,  self->_queuedAuthentications);
  }

  return v5;
}

- (void)_processGetHandlesMessage:(id)a3 registrations:(id)a4 deliveredWithError:(id)a5 resultCode:(int64_t)a6 resultDictionary:(id)a7 allowPasswordPrompt:(BOOL)a8
{
  BOOL v52 = a8;
  id v12 = a3;
  id v58 = a4;
  id v54 = a5;
  id v13 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v70 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center process handles message",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v70, &state);
  __int128 v56 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 responseHandles]);
  __int128 v57 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v53 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v50 = v13;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v65 objects:v80 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v66;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v66 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"status"]);
        BOOL v20 = [v19 intValue] == 5051;

        if (v20)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"uri"]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 _stripFZIDPrefix]);

          id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"device-name"]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"is-user-visible"]);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"pseudonyms"]);
          id v26 = v25;
          if (v25) {
            id v27 = v25;
          }
          else {
            id v27 = (id)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"aliases"]);
          }
          uint64_t v28 = v27;

          __int16 v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v30 = v22;
          if (v30) {
            CFDictionarySetValue((CFMutableDictionaryRef)v29, @"uri", v30);
          }

          id v31 = v23;
          if (v31) {
            CFDictionarySetValue((CFMutableDictionaryRef)v29, @"device-name", v31);
          }

          id v32 = v24;
          if (v32) {
            CFDictionarySetValue((CFMutableDictionaryRef)v29, @"is-user-visible", v32);
          }

          id v33 = v28;
          if (v33) {
            CFDictionarySetValue((CFMutableDictionaryRef)v29, @"pseudonyms", v33);
          }

          -[NSMutableArray addObject:](v57, "addObject:", v29);
          if (v30) {
            -[NSMutableArray addObject:](v53, "addObject:", v30);
          }
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v65 objects:v80 count:16];
    }

    while (v15);
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue([v56 selfHandle]);
  unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"uri"]);
  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v49 = v34;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v73 = a6;
    *(_WORD *)&v73[4] = 2112;
    *(void *)&v73[6] = v53;
    __int16 v74 = 2112;
    unint64_t v75 = v51;
    __int16 v76 = 2112;
    id v77 = obj;
    __int16 v78 = 2112;
    id v79 = v54;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "  Received handles query response with result: %d   handles: %@   selfHandle: %@   (actual: %@)   (error: %@)",  buf,  0x30u);
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v55 = v58;
  id v36 = [v55 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v62;
    do
    {
      __int128 v38 = 0LL;
      do
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(v55);
        }
        id v39 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)v38);
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v73 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "  Updating %@ with getHandles info",  buf,  0xCu);
        }

        unsigned int v41 = [v39 registrationType];
        if (a6 == 6006)
        {
          sub_10012E874(0, @"Registration", @"Need to re-register", 1073LL);
          BOOL v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v73 = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Requesting re-registration for registration: %@",  buf,  0xCu);
          }

          -[IDSRegistrationCenter sendRegistration:](self, "sendRegistration:", v39);
        }

        else
        {
          unsigned int v42 = v41;
          if (a6 == 6005)
          {
            if (v41 == 1)
            {
              sub_10012E874(0, @"Registration", @"Need to re-authenticate", 1073LL);
              [v39 setAuthenticationToken:0];
              if (v52)
              {
                __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v73 = v39;
                  _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Requesting new authentication for registration: %@",  buf,  0xCu);
                }

                char v44 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
                [v44 authenticateRegistration:v39 forceNewToken:1];
              }

              else
              {
                sub_10012E874(0, @"Registration", @"Email query failed", 1073LL);
                char v44 = (void *)objc_claimAutoreleasedReturnValue([v56 responseAlertInfo]);
                -[IDSRegistrationCenter _notifyEmailQueryFailure:responseCode:registrationError:error:info:]( self,  "_notifyEmailQueryFailure:responseCode:registrationError:error:info:",  v39,  6005LL,  37LL,  v54,  v44);
              }
            }

            else
            {
LABEL_44:
              sub_10012E874(0, @"Registration", @"Email query failed", 1073LL);
              char v44 = (void *)objc_claimAutoreleasedReturnValue([v56 responseAlertInfo]);
              -[IDSRegistrationCenter _notifyEmailQueryFailure:responseCode:registrationError:error:info:]( self,  "_notifyEmailQueryFailure:responseCode:registrationError:error:info:",  v39,  a6,  46LL,  v54,  v44);
            }

            goto LABEL_49;
          }

          if (a6) {
            goto LABEL_44;
          }
          if ([obj count])
          {
            if (v42 == 1)
            {
              [v39 setVettedEmails:v53];
              [v39 setDSHandle:v51];
            }

            -[IDSRegistrationCenter _notifyEmailQuerySuccess:emailInfo:]( self,  "_notifyEmailQuerySuccess:emailInfo:",  v39,  v57);
          }

          else
          {
            id v46 = (void *)objc_claimAutoreleasedReturnValue([v56 responseAlertInfo]);
            -[IDSRegistrationCenter _notifyEmailQueryFailure:responseCode:registrationError:error:info:]( self,  "_notifyEmailQueryFailure:responseCode:registrationError:error:info:",  v39,  1LL,  32LL,  v54,  v46);

            uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v73 = v39;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Failing registration, empty get handles response { queuedRegistration : %@ }",  buf,  0xCu);
            }

            -[NSMutableArray removeObject:](self->_queuedRegistrations, "removeObject:", v39);
            -[NSMutableArray removeObject:](self->_currentRegistrations, "removeObject:", v39);
            if (v42 == 1) {
              -[IDSRegistrationCenter _notifyRegistrationFailure:responseCode:registrationError:error:info:]( self,  "_notifyRegistrationFailure:responseCode:registrationError:error:info:",  v39,  1LL,  32LL,  0LL,  0LL);
            }
          }
        }

- (BOOL)_queryValidatedEmailsForRegistration:(id)a3 allowPasswordPrompt:(BOOL)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v50 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center query handles",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v50, &state);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 idsUserID]);
  BOOL v11 = (void *)v10;
  if (v7) {
    BOOL v12 = v9 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = v12 || v10 == 0;
  char v14 = v13;
  char v45 = v14;
  if (v13)
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "  => Ignoring query, we have no registration, %@",  buf,  0xCu);
    }

    if (v8) {
      (*((void (**)(id, id, uint64_t, void, void))v8 + 2))(v8, v7, 1LL, 0LL, 0LL);
    }
  }

  else
  {
    id v44 = [v8 copy];

    currentGetHandlesRegistrations = self->_currentGetHandlesRegistrations;
    if (!currentGetHandlesRegistrations)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      id v18 = self->_currentGetHandlesRegistrations;
      self->_currentGetHandlesRegistrations = Mutable;

      currentGetHandlesRegistrations = self->_currentGetHandlesRegistrations;
    }

    id v19 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](currentGetHandlesRegistrations, "objectForKey:", v11));
    id v20 = -[NSMutableSet count](v19, "count");
    if (!-[NSMutableSet count](v19, "count"))
    {
      id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);

      -[NSMutableDictionary setObject:forKey:](self->_currentGetHandlesRegistrations, "setObject:forKey:", v21, v11);
      id v19 = v21;
    }

    -[NSMutableSet addObject:](v19, "addObject:", v7);

    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v52 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Added registration %p to getHandles",  buf,  0xCu);
    }

    if (v44)
    {
      currentGetHandlesBlocks = self->_currentGetHandlesBlocks;
      if (!currentGetHandlesBlocks)
      {
        id v24 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        id v25 = self->_currentGetHandlesBlocks;
        self->_currentGetHandlesBlocks = v24;

        currentGetHandlesBlocks = self->_currentGetHandlesBlocks;
      }

      id v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](currentGetHandlesBlocks, "objectForKey:", v9));
      if (!-[NSMutableArray count](v26, "count"))
      {
        id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);

        -[NSMutableDictionary setObject:forKey:](self->_currentGetHandlesBlocks, "setObject:forKey:", v27, v9);
        id v26 = v27;
      }

      id v28 = objc_retainBlock(v44);
      -[NSMutableArray addObject:](v26, "addObject:", v28);

      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = objc_retainBlock(v44);
        *(_DWORD *)buf = 134217984;
        id v52 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Adding completion block %p to getHandles queue",  buf,  0xCu);
      }
    }

    if (!v20)
    {
      id v31 = objc_alloc_init(&OBJC_CLASS___IDSProfileGetHandlesMessage);
      IDSAssignPushIdentityToMessage(v31);
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 pushToken]);
      -[IDSProfileGetHandlesMessage setPushToken:](v31, "setPushToken:", v32);

      id v33 = (void *)objc_claimAutoreleasedReturnValue([v7 idsUserID]);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v7 authenticationCert]);
      id v35 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      id v36 = [v35 identityPrivateKey];
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      -[IDSProfileGetHandlesMessage addAuthUserID:certificate:privateKey:publicKey:]( v31,  "addAuthUserID:certificate:privateKey:publicKey:",  v33,  v34,  v36,  [v37 identityPublicKey]);

      id v38 = sub_1002408C4(v7);
      id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      -[IDSProfileGetHandlesMessage setDSAuthID:](v31, "setDSAuthID:", v39);

      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v7,  @"info"));
      -[IDSProfileGetHandlesMessage setUserInfo:](v31, "setUserInfo:", v40);

      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_10021ECF0;
      v46[3] = &unk_1008FE5C0;
      v46[4] = self;
      id v47 = v11;
      BOOL v48 = a4;
      -[IDSProfileGetHandlesMessage setCompletionBlock:](v31, "setCompletionBlock:", v46);
      unsigned int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v7;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Sending email query for: %@", buf, 0xCu);
      }

      -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v31);
    }

    id v8 = v44;
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v50);

  return v45 ^ 1;
}

- (void)retrieveFeatureToggleStateForFeatureID:(id)a3 registration:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog FeatureToggler](&OBJC_CLASS___IDSFoundationLog, "FeatureToggler"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Retrieving feature toggle state { featureID: %@, registration: %@",  buf,  0x16u);
  }

  BOOL v12 = objc_alloc_init(&OBJC_CLASS___IDSGetFeatureToggleStateMessage);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v9 registrationCert]);
  -[IDSGetFeatureToggleStateMessage setIDCertificate:](v12, "setIDCertificate:", v13);

  char v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSGetFeatureToggleStateMessage setIdentityPrivateKey:]( v12,  "setIdentityPrivateKey:",  [v14 identityPrivateKey]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSGetFeatureToggleStateMessage setPushToken:](v12, "setPushToken:", v15);

  IDSAssignPushIdentityToMessage(v12);
  -[IDSGetFeatureToggleStateMessage setFeatureID:](v12, "setFeatureID:", v8);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10021F200;
  v18[3] = &unk_1008FC728;
  v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v16 = v10;
  id v17 = v9;
  -[IDSGetFeatureToggleStateMessage setCompletionBlock:](v12, "setCompletionBlock:", v18);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v12);
}

- (void)updateFeatureToggleState:(unint64_t)a3 forFeatureID:(id)a4 registration:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog FeatureToggler](&OBJC_CLASS___IDSFoundationLog, "FeatureToggler"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v24 = a3;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Updating feature toggle state { state: %lu, featureID: %@, registration: %@",  buf,  0x20u);
  }

  char v14 = objc_alloc_init(&OBJC_CLASS___IDSFeatureToggleMessage);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 registrationCert]);
  -[IDSFeatureToggleMessage setIDCertificate:](v14, "setIDCertificate:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSFeatureToggleMessage setIdentityPrivateKey:]( v14,  "setIdentityPrivateKey:",  [v16 identityPrivateKey]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSFeatureToggleMessage setPushToken:](v14, "setPushToken:", v17);

  IDSAssignPushIdentityToMessage(v14);
  -[IDSFeatureToggleMessage setFeatureID:](v14, "setFeatureID:", v10);
  -[IDSFeatureToggleMessage setState:](v14, "setState:", a3);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10021F538;
  v20[3] = &unk_1008FC728;
  v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v18 = v12;
  id v19 = v11;
  -[IDSFeatureToggleMessage setCompletionBlock:](v14, "setCompletionBlock:", v20);
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v14);
}

- (BOOL)provisionPseudonymFor:(id)a3 withURI:(id)a4 properties:(id)a5 requestProperties:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)id v34 = v13;
    *(_WORD *)&v34[8] = 2112;
    *(void *)id v35 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Provisioning pseudonym {URI: %@, registration: %@}",  buf,  0x16u);
  }

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___IDSProvisionPseudonymMessage, v18);
  id v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472LL;
  id v30 = sub_10021F8FC;
  id v31 = &unk_1008FE5E8;
  id v20 = v14;
  id v32 = v20;
  uint64_t v21 = -[IDSRegistrationCenter _countOfMessagesQueuedOfType:matchingCriteria:]( self,  "_countOfMessagesQueuedOfType:matchingCriteria:",  v19,  &v28);
  if (v21 < 3)
  {
    BOOL v26 = -[IDSRegistrationCenter _sendPseudonymMessageOperation:forURI:pseudonymURI:properties:requestProperties:forRegistration:completionBlock:]( self,  "_sendPseudonymMessageOperation:forURI:pseudonymURI:properties:requestProperties:forRegistration:completionBlock:",  0LL,  v13,  0LL,  v20,  v15,  v12,  v16,  v28,  v29,  v30,  v31);
  }

  else
  {
    int v22 = v21;
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 featureID]);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)id v34 = v22;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = 3;
      *(_WORD *)id v35 = 2112;
      *(void *)&v35[2] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Too many provisions inflight for this feature -- failing {similiarCount: %d, maxAllowedInFlight: %d, featureID: %@}",  buf,  0x18u);
    }

    -[IDSRegistrationCenter __dumpState](self, "__dumpState");
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPseudonymErrorDomain,  900LL,  0LL));
    BOOL v26 = 1;
    (*((void (**)(id, id, uint64_t, void, void, void *))v16 + 2))(v16, v12, 1LL, 0LL, 0LL, v25);
  }

  return v26;
}

- (BOOL)renewPseudonym:(id)a3 forRegistration:(id)a4 forUpdatedExpiryEpoch:(double)a5 requestProperties:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Renewing pseudonym {pseudonym: %@, registration: %@}",  buf,  0x16u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 maskedURI]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 URI]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 properties]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 withUpdatedExpiryEpoch:a5]);
  BOOL v21 = -[IDSRegistrationCenter _sendPseudonymMessageOperation:forURI:pseudonymURI:properties:requestProperties:forRegistration:completionBlock:]( self,  "_sendPseudonymMessageOperation:forURI:pseudonymURI:properties:requestProperties:forRegistration:completionBlock:",  1LL,  v17,  v18,  v20,  v15,  v13,  v14);

  return v21;
}

- (BOOL)revokePseudonym:(id)a3 forRegistration:(id)a4 requestProperties:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Revoking pseudonym {pseudonym: %@, registration: %@}",  buf,  0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 maskedURI]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 URI]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 properties]);
  BOOL v18 = -[IDSRegistrationCenter _sendPseudonymMessageOperation:forURI:pseudonymURI:properties:requestProperties:forRegistration:completionBlock:]( self,  "_sendPseudonymMessageOperation:forURI:pseudonymURI:properties:requestProperties:forRegistration:completionBlock:",  2LL,  v15,  v16,  v17,  v13,  v11,  v12);

  return v18;
}

- (double)_updatePseudonymExpiryEpoch:(double)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"use-local-time"]);

  if (!v5
    || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6), (objc_opt_isKindOfClass(v5, v7) & 1) == 0)
    || ([v5 BOOLValue] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentServerTime sharedInstance](&OBJC_CLASS___IDSCurrentServerTime, "sharedInstance"));
    [v8 currentServerTimeInterval];
    double v10 = v9;

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v11 timeIntervalSince1970];
    double v13 = v12;

    double v14 = v10 - v13;
    if (v10 - v13 < 0.0) {
      double v14 = -(v10 - v13);
    }
    if (v14 > 60.0)
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134218240;
        double v19 = v13;
        __int16 v20 = 2048;
        double v21 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Local time on device and server time are out of sync. Using server time for pseudonym expiry. Local Time: %f, Server Time: %f",  (uint8_t *)&v18,  0x16u);
      }

      double v16 = v13 - a3;
      if (v13 - a3 < 0.0) {
        double v16 = -(v13 - a3);
      }
      a3 = v10 + v16;
    }
  }

  return a3;
}

- (BOOL)_sendPseudonymMessageOperation:(unint64_t)a3 forURI:(id)a4 pseudonymURI:(id)a5 properties:(id)a6 requestProperties:(id)a7 forRegistration:(id)a8 completionBlock:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v69 = a9;
  double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    unint64_t v81 = a3;
    __int16 v82 = 2112;
    id v83 = v14;
    __int16 v84 = 2112;
    id v85 = v16;
    __int16 v86 = 2112;
    id v87 = v18;
    __int16 v88 = 2112;
    id v89 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Performing pseudonym operation {op: %lu, URI: %@, pseudonymProperties: %@, requestProperties: %@, registration: %@}",  buf,  0x34u);
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 authenticationCert]);
  if (v20)
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 guid]);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v18 idsUserID]);
    __int128 v66 = (void *)v22;
    __int128 v67 = (void *)v21;
    if (v18) {
      BOOL v23 = v21 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    BOOL v24 = v23 || v22 == 0;
    char v25 = v24;
    char v65 = v25;
    if (v24)
    {
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v81 = (unint64_t)v18;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "  => Ignoring provision, we have no registration, %@",  buf,  0xCu);
      }

      __int16 v27 = v69;
      if (v69) {
        (*((void (**)(id, id, uint64_t, void, void, void))v69 + 2))(v69, v18, 1LL, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      id v30 = objc_alloc_init(&OBJC_CLASS___IDSProvisionPseudonymMessage);
      __int128 v60 = v18;
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v18 registrationCert]);
      -[IDSProvisionPseudonymMessage setIDCertificate:](v30, "setIDCertificate:", v31);

      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      -[IDSProvisionPseudonymMessage setIdentityPrivateKey:]( v30,  "setIdentityPrivateKey:",  [v32 identityPrivateKey]);

      id v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
      -[IDSProvisionPseudonymMessage setPushToken:](v30, "setPushToken:");
      id v61 = v17;
      [v17 requestTimeoutInterval];
      -[IDSProvisionPseudonymMessage setTimeout:](v30, "setTimeout:");
      IDSAssignPushIdentityToMessage(v30);
      -[IDSProvisionPseudonymMessage setOperation:](v30, "setOperation:", a3);
      id v64 = v14;
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v14 prefixedURI]);
      -[IDSProvisionPseudonymMessage setSelfURI:](v30, "setSelfURI:", v33);

      id v34 = (void *)objc_claimAutoreleasedReturnValue([v16 featureID]);
      -[IDSProvisionPseudonymMessage setFeatureID:](v30, "setFeatureID:", v34);

      id v35 = (void *)objc_claimAutoreleasedReturnValue([v16 scopeID]);
      -[IDSProvisionPseudonymMessage setScopeID:](v30, "setScopeID:", v35);

      id v63 = v15;
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v15 prefixedURI]);
      -[IDSProvisionPseudonymMessage setPseudonymAlias:](v30, "setPseudonymAlias:", v36);

      [v16 expiryEpoch];
      -[IDSRegistrationCenter _updatePseudonymExpiryEpoch:](self, "_updatePseudonymExpiryEpoch:");
      __int128 v59 = v30;
      -[IDSProvisionPseudonymMessage setExpiryEpoch:](v30, "setExpiryEpoch:");
      uint64_t v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      id v62 = v16;
      id obj = (id)objc_claimAutoreleasedReturnValue([v16 allowedServices]);
      id v38 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      if (v38)
      {
        id v39 = v38;
        uint64_t v71 = *(void *)v76;
        id v40 = &OBJC_METACLASS___IDSAttachmentEncryptionParameter;
        do
        {
          for (i = 0LL; i != v39; i = (char *)i + 1)
          {
            if (*(void *)v76 != v71) {
              objc_enumerationMutation(obj);
            }
            uint64_t v42 = *(void *)(*((void *)&v75 + 1) + 8LL * (void)i);
            __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([&v40[34] sharedInstance]);
            id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 serviceWithIdentifier:v42]);

            if ([v44 adHocServiceType])
            {
              char v45 = v40;
              id v46 = (void *)objc_claimAutoreleasedReturnValue([&v40[34] sharedInstance]);
              id v47 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v46,  "primaryServiceForAdhocServiceType:",  objc_msgSend(v44, "adHocServiceType")));

              BOOL v48 = (void *)objc_claimAutoreleasedReturnValue([v47 identifier]);
              id v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v48));
              id v50 = v49;
              if (v49) {
                id v51 = v49;
              }
              else {
                id v51 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              }
              id v55 = v51;

              __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v47 identifier]);
              -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v55, v56);

              id v40 = v45;
            }

            else
            {
              id v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v42));
              id v53 = v52;
              if (v52) {
                id v54 = v52;
              }
              else {
                id v54 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              }
              id v47 = v54;

              -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v47, v42);
            }
          }

          id v39 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
        }

        while (v39);
      }

      -[IDSProvisionPseudonymMessage setSubservicesByPrimaryService:](v59, "setSubservicesByPrimaryService:", v37);
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472LL;
      v72[2] = sub_1002204B8;
      v72[3] = &unk_1008FC728;
      v72[4] = self;
      id v18 = v60;
      id v73 = v60;
      id v74 = v69;
      -[IDSProvisionPseudonymMessage setCompletionBlock:](v59, "setCompletionBlock:", v72);
      -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v59);

      __int16 v27 = v69;
      id v15 = v63;
      id v14 = v64;
      id v17 = v61;
      id v16 = v62;
    }

    char v29 = v65 ^ 1;
  }

  else
  {
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "  => Ignoring provision, we have no auth cert",  buf,  2u);
    }

    __int16 v27 = v69;
    if (v69) {
      (*((void (**)(id, id, uint64_t, void, void, void))v69 + 2))(v69, v18, 1LL, 0LL, 0LL, 0LL);
    }
    char v29 = 0;
  }

  return v29;
}

- (BOOL)updateKTOptInStatusForRegistration:(id)a3 withOptInStatus:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v6) {
      id v11 = @"YES";
    }
    int v14 = 138412546;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Updating KT Opt-in status for registration {isOptedIn: %@, registration: %@}",  (uint8_t *)&v14,  0x16u);
  }

  BOOL v12 = -[IDSRegistrationCenter _sendKTOptInStatusUpdateForRegistration:withOptInStatus:withCompletion:]( self,  "_sendKTOptInStatusUpdateForRegistration:withOptInStatus:withCompletion:",  v8,  v6,  v9);
  return v12;
}

- (BOOL)updateKTOptInStatusForRegistration:(id)a3 withOptInOutRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating KT Opt-in status for registration {OptInOutRequest: %@, registration: %@}",  (uint8_t *)&v14,  0x16u);
  }

  BOOL v12 = -[IDSRegistrationCenter _sendKTOptInStatusForRegistration:withOptInOutRequest:withCompletion:]( self,  "_sendKTOptInStatusForRegistration:withOptInOutRequest:withCompletion:",  v8,  v9,  v10);
  return v12;
}

- (BOOL)_sendKTOptInStatusForRegistration:(id)a3 withOptInOutRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v62 = v9;
    __int16 v63 = 2112;
    id v64 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Performing Key Transparency opt-in status update {optInOutRequest: %@, registration: %@}",  buf,  0x16u);
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticationCert]);
  if (v12)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v8 guid]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v8 idsUserID]);
    id v15 = (void *)v14;
    if (v8) {
      BOOL v16 = v13 == 0LL;
    }
    else {
      BOOL v16 = 1;
    }
    BOOL v17 = v16 || v14 == 0;
    char v18 = v17;
    if (v17)
    {
      double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v62 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  " => Ignoring KT Opt In status update, we have no registration, %@",  buf,  0xCu);
      }

      if (v10) {
        (*((void (**)(id, id, uint64_t, void, void, void))v10 + 2))(v10, v8, 1LL, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      char v47 = v18;
      id v49 = (void *)v14;
      id v50 = v13;
      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___IDSKTOptInStatusMessage);
      id v51 = v8;
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v8 registrationCert]);
      -[IDSKTOptInStatusMessage setIDCertificate:](v22, "setIDCertificate:", v23);

      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      -[IDSKTOptInStatusMessage setIdentityPrivateKey:]( v22,  "setIdentityPrivateKey:",  [v24 identityPrivateKey]);

      BOOL v48 = self;
      char v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
      -[IDSKTOptInStatusMessage setPushToken:](v22, "setPushToken:");
      IDSAssignPushIdentityToMessage(v22);
      char v25 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 model]);

      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 productOSVersion]);

      id v44 = (void *)v26;
      -[IDSKTOptInStatusMessage setHardwareVersion:](v22, "setHardwareVersion:", v26);
      id v46 = v22;
      __int128 v43 = (void *)v28;
      -[IDSKTOptInStatusMessage setOsVersion:](v22, "setOsVersion:", v28);
      char v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationsToOptInStatusData]);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 allValues]);

      id obj = v31;
      id v32 = [v31 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v57;
        do
        {
          for (i = 0LL; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v57 != v34) {
              objc_enumerationMutation(obj);
            }
            id v36 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
            uint64_t v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            id v38 = (void *)objc_claimAutoreleasedReturnValue([v36 serviceIdentifier]);
            if (v38) {
              CFDictionarySetValue((CFMutableDictionaryRef)v37, @"service", v38);
            }

            id v39 = (void *)objc_claimAutoreleasedReturnValue([v36 optInStatus]);
            id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v39 BOOLValue]));

            if (v40) {
              CFDictionarySetValue((CFMutableDictionaryRef)v37, @"kt-opt-in", v40);
            }

            unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue([v36 publicAccountKey]);
            if (v41) {
              CFDictionarySetValue((CFMutableDictionaryRef)v37, @"kt-account-key", v41);
            }

            -[NSMutableArray addObject:](v29, "addObject:", v37);
          }

          id v33 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        }

        while (v33);
      }

      -[IDSKTOptInStatusMessage setServices:](v46, "setServices:", v29);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_100220D90;
      v53[3] = &unk_1008FC728;
      v53[4] = v48;
      id v8 = v51;
      id v54 = v51;
      id v55 = v10;
      -[IDSKTOptInStatusMessage setCompletionBlock:](v46, "setCompletionBlock:", v53);
      -[IDSRegistrationCenter __sendMessage:](v48, "__sendMessage:", v46);

      id v15 = v49;
      double v13 = v50;
      char v18 = v47;
    }

    char v21 = v18 ^ 1;
  }

  else
  {
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  " => Ignoring KT Opt In status update, we have no auth cert",  buf,  2u);
    }

    if (v10) {
      (*((void (**)(id, id, uint64_t, void, void, void))v10 + 2))(v10, v8, 1LL, 0LL, 0LL, 0LL);
    }
    char v21 = 0;
  }

  return v21;
}

- (BOOL)_sendKTOptInStatusUpdateForRegistration:(id)a3 withOptInStatus:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = (__CFString *)a3;
  id v9 = a5;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v6) {
      id v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = v11;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Performing Key Transparency opt-in status update {optInStatus: %@, registration: %@}",  buf,  0x16u);
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString authenticationCert](v8, "authenticationCert"));
  if (v12)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString guid](v8, "guid"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[__CFString idsUserID](v8, "idsUserID"));
    id v15 = (void *)v14;
    if (v8) {
      BOOL v16 = v13 == 0LL;
    }
    else {
      BOOL v16 = 1;
    }
    BOOL v17 = v16 || v14 == 0;
    char v18 = v17;
    if (v17)
    {
      double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "  => Ignoring KT Opt In status update, we have no registration, %@",  buf,  0xCu);
      }

      if (v9) {
        (*((void (**)(id, __CFString *, uint64_t, void, void, void))v9 + 2))(v9, v8, 1LL, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___IDSKTOptInStatusMessage);
      char v32 = v18;
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString registrationCert](v8, "registrationCert"));
      -[IDSKTOptInStatusMessage setIDCertificate:](v22, "setIDCertificate:", v23);

      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      -[IDSKTOptInStatusMessage setIdentityPrivateKey:]( v22,  "setIdentityPrivateKey:",  [v24 identityPrivateKey]);

      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
      -[IDSKTOptInStatusMessage setPushToken:](v22, "setPushToken:", v31);
      IDSAssignPushIdentityToMessage(v22);
      char v25 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 model]);

      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 productOSVersion]);

      char v18 = v32;
      char v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
      -[IDSKTOptInStatusMessage setIsOptIn:](v22, "setIsOptIn:", v29);

      -[IDSKTOptInStatusMessage setHardwareVersion:](v22, "setHardwareVersion:", v26);
      -[IDSKTOptInStatusMessage setOsVersion:](v22, "setOsVersion:", v28);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10022145C;
      v33[3] = &unk_1008FC728;
      void v33[4] = self;
      uint64_t v34 = v8;
      id v35 = v9;
      -[IDSKTOptInStatusMessage setCompletionBlock:](v22, "setCompletionBlock:", v33);
      -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v22);
    }

    char v21 = v18 ^ 1;
  }

  else
  {
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "  => Ignoring KT Opt In status update, we have no auth cert",  buf,  2u);
    }

    if (v9) {
      (*((void (**)(id, __CFString *, uint64_t, void, void, void))v9 + 2))(v9, v8, 1LL, 0LL, 0LL, 0LL);
    }
    char v21 = 0;
  }

  return v21;
}

- (BOOL)queryValidatedEmailsForRegistration:(id)a3 allowPasswordPrompt:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Requesting validated emails for: %@",  (uint8_t *)&v15,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticationCert]);
  if (v11)
  {
    BOOL v12 = -[IDSRegistrationCenter _queryValidatedEmailsForRegistration:allowPasswordPrompt:completionBlock:]( self,  "_queryValidatedEmailsForRegistration:allowPasswordPrompt:completionBlock:",  v8,  v6,  v9);
  }

  else
  {
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "  => Ignoring query, we have no auth cert",  (uint8_t *)&v15,  2u);
    }

    if (v9) {
      (*((void (**)(id, id, uint64_t, void, void))v9 + 2))(v9, v8, 1LL, 0LL, 0LL);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)__reallySendAuthenticateRegistration
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Sending authenticate registration now...",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_queuedAuthentications, "lastObject"));
  if (v4) {
    -[IDSRegistrationCenter _sendAuthenticateRegistration:](self, "_sendAuthenticateRegistration:", v4);
  }
}

- (BOOL)authenticateRegistration:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v30 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center authenticate registration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v30, &state);
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainID]);
    BOOL v6 = v5 == 0LL;

    if (v6)
    {
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 138412290;
      id v32 = v4;
      __int16 v20 = "Not sending IDS authentication, we have no main ID for registration: %@";
    }

    else
    {
      if ([v4 registrationType] != 1
        && [v4 registrationType] != 2
        || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]),
            BOOL v8 = [v7 length] == 0,
            v7,
            !v8))
      {
        unsigned int v9 = [v4 registrationType];
        if (v9 == 3
          || (id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]),
              BOOL v11 = v10 == 0LL,
              v10,
              !v11))
        {
          BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]);
          if (v12)
          {
LABEL_9:
            double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Adding IDS authentication to the queue: %@",  buf,  0xCu);
            }

            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, " => Really adding", buf, 2u);
            }

            queuedAuthentications = self->_queuedAuthentications;
            if (!queuedAuthentications)
            {
              id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              BOOL v17 = self->_queuedAuthentications;
              self->_queuedAuthentications = v16;

              queuedAuthentications = self->_queuedAuthentications;
            }

            if (-[NSMutableArray containsObject:](queuedAuthentications, "containsObject:", v4))
            {
              char v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v32 = v4;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  " => Removing old registration info object: %@",  buf,  0xCu);
              }

              -[NSMutableArray removeObject:](self->_queuedAuthentications, "removeObject:", v4);
            }

            else
            {
              char v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v32 = v4;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  " => Simply adding registration info object: %@",  buf,  0xCu);
              }
            }

            -[NSMutableArray addObject:](self->_queuedAuthentications, "addObject:", v4);
            -[CUTDeferredTaskQueue enqueueExecutionWithTarget:afterDelay:]( self->_sendAuthenticateRegistrationTask,  "enqueueExecutionWithTarget:afterDelay:",  self,  3.0);
            BOOL v19 = 1;
            goto LABEL_41;
          }

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationCert]);
          if (v22 && (BOOL v23 = [v4 registrationType] == 0, v22, v23))
          {
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (!os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
            {
LABEL_39:

              goto LABEL_40;
            }

            *(_WORD *)buf = 0;
            char v25 = "*** Cannot authenticate, missing SMS signature";
            uint64_t v26 = (os_log_s *)v24;
            uint32_t v27 = 2;
          }

          else
          {
            if (v9 == 3) {
              goto LABEL_9;
            }
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (!os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_39;
            }
            *(_DWORD *)buf = 138412290;
            id v32 = v4;
            char v25 = "Not IDS authenticating, we have no authentication token for: %@";
            uint64_t v26 = (os_log_s *)v24;
            uint32_t v27 = 12;
          }

          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
          goto LABEL_39;
        }

        BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v4;
          __int16 v20 = "Not sending IDS authentication, we have no auth token for registration: %@";
          goto LABEL_35;
        }

- (void)__reallySendRegistration
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending registrations now...", v4, 2u);
  }

  -[IDSRegistrationCenter _sendRegistrationAsDeregister:](self, "_sendRegistrationAsDeregister:", 0LL);
}

- (BOOL)sendRegistration:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  __int16 v20 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center send registration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v20, &state);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationCert]);
  BOOL v6 = v5 == 0LL;

  if (v6)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      int v15 = "Not registering, we have no cert for: %@";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    }

- (BOOL)sendDeregistration:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v9 = _os_activity_create( (void *)&_mh_execute_header,  "Registration center send deregistration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v9, &state);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Adding deregistration to the queue: %@",  buf,  0xCu);
  }

  if (v4)
  {
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, " => Really adding", buf, 2u);
    }

    -[IDSRegistrationCenter _sendDeregistration:](self, "_sendDeregistration:", v4);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v9);

  return v4 != 0LL;
}

- (void)cancelRegisterActionsForRegistrationInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationCenterMessageDelivery queuedMessages](self->_httpMessageDelivery, "queuedMessages"));
    id v6 = [v5 _copyForEnumerating];

    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      unsigned int v9 = @"info";
      uint64_t v10 = *(void *)v27;
      do
      {
        id v11 = 0LL;
        id v25 = v8;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v6);
          }
          BOOL v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v11);
          double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v9]);
          if ([v14 isEqual:v4])
          {
            uint64_t v16 = objc_opt_class(&OBJC_CLASS___IDSRegistrationMessage, v15);
            if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0)
            {
              uint64_t v17 = v10;
              char v18 = v9;
              id v19 = v4;
              id v20 = v6;
              char v21 = self;
              id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Cancelling current registration",  buf,  2u);
              }

              self = v21;
              -[IDSRegistrationCenterMessageDelivery cancelMessage:](v21->_httpMessageDelivery, "cancelMessage:", v12);
              id v6 = v20;
              id v4 = v19;
              unsigned int v9 = v18;
              uint64_t v10 = v17;
              id v8 = v25;
            }
          }

          id v11 = (char *)v11 + 1;
        }

        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }

      while (v8);
    }

    if (-[NSMutableArray containsObject:](self->_currentRegistrations, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_currentRegistrations, "removeObject:", v4);
      BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Removing current registration: %@",  buf,  0xCu);
      }
    }

    if (-[NSMutableArray containsObject:](self->_queuedRegistrations, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_queuedRegistrations, "removeObject:", v4);
      BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Cancelling queued registration: %@",  buf,  0xCu);
      }
    }

    -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  }
}

- (void)cancelActionsForRegistrationInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[NSMutableArray containsObject:](self->_currentRegistrations, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_currentRegistrations, "removeObject:", v4);
      BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing current registration", buf, 2u);
      }
    }

    if (-[NSMutableArray containsObject:](self->_currentAuthentications, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_currentAuthentications, "removeObject:", v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing current authentication", v11, 2u);
      }
    }

    if (-[NSMutableArray containsObject:](self->_queuedAuthentications, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_queuedAuthentications, "removeObject:", v4);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cancelling queued authentications", v10, 2u);
      }
    }

    if (-[NSMutableArray containsObject:](self->_queuedRegistrations, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_queuedRegistrations, "removeObject:", v4);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cancelling queued registration", v9, 2u);
      }
    }

    -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  }
}

- (id)activeRegistrations
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSMutableArray count](self->_queuedRegistrations, "count")) {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", self->_queuedRegistrations);
  }
  if (-[NSMutableArray count](self->_queuedAuthentications, "count")) {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", self->_queuedAuthentications);
  }
  if (!-[NSMutableArray count](v3, "count"))
  {

    BOOL v3 = 0LL;
  }

  return v3;
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      BOOL v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray nonRetainingArray](&OBJC_CLASS___NSMutableArray, "nonRetainingArray"));
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

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  if (objc_msgSend(a4, "length", a3))
  {
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Token changed, _dequeuePendingRequestsIfNecessary",  v6,  2u);
    }

    -[IDSRegistrationCenter _dequeuePendingRequestsIfNecessary](self, "_dequeuePendingRequestsIfNecessary");
  }

- (BOOL)_checkOverRegistrations
{
  accountingHour = self->_accountingHour;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSDate timeIntervalSinceDate:](accountingHour, "timeIntervalSinceDate:", v4);
  double v6 = fabs(v5);

  if (v6 < 1800.0) {
    return self->_registrations > 0x64;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t registrations = self->_registrations;
    v11[0] = 67109120;
    v11[1] = registrations;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "  * Forcing a reset on the registration count, enough time has passed   %d -> 0",  (uint8_t *)v11,  8u);
  }

  uint64_t v10 = self->_accountingHour;
  self->_accountingHour = 0LL;

  BOOL result = 0;
  self->_unint64_t registrations = 0LL;
  return result;
}

- (void)_noteRegistration
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSDate);
  p_accountingHour = &self->_accountingHour;
  accountingHour = self->_accountingHour;
  if (!accountingHour)
  {
    objc_storeStrong((id *)&self->_accountingHour, v3);
    accountingHour = *p_accountingHour;
  }

  -[NSDate timeIntervalSinceDate:](accountingHour, "timeIntervalSinceDate:", v3);
  if (fabs(v6) >= 1800.0)
  {
    if (*p_accountingHour != v3) {
      objc_storeStrong((id *)&self->_accountingHour, v3);
    }
    self->_unint64_t registrations = 1LL;
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t registrations = self->_registrations;
      int v13 = 67109376;
      int v14 = registrations;
      __int16 v15 = 1024;
      int v16 = 100;
      unsigned int v9 = "Restarting number of registrations at %d (Max: %d)";
      uint64_t v10 = v7;
      uint32_t v11 = 14;
      goto LABEL_10;
    }
  }

  else
  {
    ++self->_registrations;
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = self->_registrations;
      int v13 = 67109632;
      int v14 = 30;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 1024;
      int v18 = 100;
      unsigned int v9 = "Noting another registration in the last %d minutes, we're now at %d registrations  (Max: %d)";
      uint64_t v10 = v7;
      uint32_t v11 = 20;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
}

- (id)dateLastRegistered
{
  return self->_dateLastRegistered;
}

- (void)sendValidateCredential:(id)a3 withDeliveryCompletionBlock:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___IDSValidateCredentialsMessage);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v21 pushToken]);
  -[IDSValidateCredentialsMessage setPushToken:](v7, "setPushToken:", v8);

  IDSAssignPushIdentityToMessage(v7);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v21 idsUserID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v21 authenticationCert]);
  uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v12 = [v11 identityPrivateKey];
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSValidateCredentialsMessage addAuthUserID:certificate:privateKey:publicKey:]( v7,  "addAuthUserID:certificate:privateKey:publicKey:",  v9,  v10,  v12,  [v13 identityPublicKey]);

  id v14 = sub_1002408C4(v21);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[IDSValidateCredentialsMessage setDSAuthID:](v7, "setDSAuthID:", v15);

  unsigned int v16 = [v21 registrationType];
  if (![v21 registrationType])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v21 userID]);
    -[IDSValidateCredentialsMessage setAuthenticationDataUserID:](v7, "setAuthenticationDataUserID:", v19);

    int v18 = (void *)objc_claimAutoreleasedReturnValue([v21 authenticationToken]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 _FTDataFromBase64String]);
    -[IDSValidateCredentialsMessage setAuthenticationDataSig:](v7, "setAuthenticationDataSig:", v20);

    goto LABEL_5;
  }

  if (v16 != 3)
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v21 profileID]);
    -[IDSValidateCredentialsMessage setAuthenticationDataUserID:](v7, "setAuthenticationDataUserID:", v17);

    int v18 = (void *)objc_claimAutoreleasedReturnValue([v21 authenticationToken]);
    -[IDSValidateCredentialsMessage setAuthenticationDataAuthToken:](v7, "setAuthenticationDataAuthToken:", v18);
LABEL_5:
  }

  -[IDSValidateCredentialsMessage setCompletionBlock:](v7, "setCompletionBlock:", v6);
  [v21 registrationType];
  -[IDSRegistrationCenter __sendMessage:](self, "__sendMessage:", v7);
}

- (void)buildValidationCredentialsIfNeeded
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationCenter validationQueue](self, "validationQueue"));
  [v2 buildValidationCredentialsIfNeededForSubsystem:1];
}

- (void)sendDeactivationRequestWithSIM:(id)a3 Info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_alloc_init(&OBJC_CLASS___IDSSIMDeactivationInfoMessage);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registrationConductor]);
  uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userStore]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 SIMIdentifier]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 userWithUniqueIdentifier:v12]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 authenticationCertificateForUser:v13]);
  if (v14)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 realmPrefixedIdentifier]);
    __int128 v29 = v11;
    unsigned int v16 = v6;
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 dataRepresentation]);
    int v18 = self;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
    id v20 = [v19 identityPrivateKey];
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
    -[IDSSIMDeactivationInfoMessage addAuthUserID:certificate:privateKey:publicKey:]( v8,  "addAuthUserID:certificate:privateKey:publicKey:",  v15,  v17,  v20,  [v21 identityPublicKey]);

    id v6 = v16;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](v18->_pushHandler, "pushToken"));
    -[IDSSIMDeactivationInfoMessage setPushToken:](v8, "setPushToken:", v22);
    IDSAssignPushIdentityToMessage(v8);
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v23 timeIntervalSince1970];
    double v25 = v24;

    -[IDSSIMDeactivationInfoMessage setDeviceTime:](v8, "setDeviceTime:", (uint64_t)v25);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v16 homePlmn]);
    -[IDSSIMDeactivationInfoMessage setHomePlmn:](v8, "setHomePlmn:", v26);

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v16 events]);
    -[IDSSIMDeactivationInfoMessage setEvents:](v8, "setEvents:", v27);

    -[IDSSIMDeactivationInfoMessage setCompletionBlock:](v8, "setCompletionBlock:", &stru_1008FE608);
    uint32_t v11 = v29;
    -[IDSRegistrationCenter __sendMessage:](v18, "__sendMessage:", v8);
  }

  else
  {
    __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "No PAC found for user : %@, stopping sim deactivation request",  buf,  0xCu);
    }
  }
}

- (IDSValidationQueue)validationQueue
{
  return (IDSValidationQueue *)objc_getProperty(self, a2, 144LL, 1);
}

- (CUTDeferredTaskQueue)sendAuthenticateRegistrationTask
{
  return self->_sendAuthenticateRegistrationTask;
}

- (CUTDeferredTaskQueue)sendRegistrationTask
{
  return self->_sendRegistrationTask;
}

- (CUTDeferredTaskQueue)sendDeregistrationTask
{
  return self->_sendDeregistrationTask;
}

- (CUTDeferredTaskQueue)cleanupAbsintheTask
{
  return self->_cleanupAbsintheTask;
}

- (void).cxx_destruct
{
}

@end