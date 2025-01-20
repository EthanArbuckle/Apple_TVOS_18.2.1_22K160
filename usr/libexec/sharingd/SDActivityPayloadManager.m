@interface SDActivityPayloadManager
+ (id)sharedPayloadManager;
- (NSString)state;
- (SDActivityPayloadManager)init;
- (id)createRapportClientWithDestinationDevice:(id)a3;
- (id)dataFromUUID:(id)a3;
- (id)idsDeviceWithUniqueID:(id)a3 onService:(id)a4;
- (id)protobufDataFromRequest:(id)a3;
- (id)requestFromProtobufData:(id)a3;
- (void)activityPayloadReplySuccess:(id)a3;
- (void)clearPersistedKeyRequests;
- (void)handleEncryptionKeyReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6;
- (void)handleEncryptionKeyReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6;
- (void)handleEncryptionKeyReplyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleEncryptionKeyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleEncryptionKeyRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)handleEncyptionKeyRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7;
- (void)handleNewAdvertisementWithpayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePayloadReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6;
- (void)handlePayloadReplyProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePayloadReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6;
- (void)handlePayloadRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7;
- (void)handlePayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePayloadRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)logDashboardHandoffRequestViaTransportLinkType:(int)a3 type:(id)a4 success:(BOOL)a5 rtt:(double)a6;
- (void)messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5;
- (void)requestTimedOut:(id)a3;
- (void)sendActivityPayloadRequestMessageToDevice:(id)a3 withRequestRecord:(id)a4 withDestinationDevice:(id)a5 completionHandler:(id)a6;
- (void)sendActivityPayloadRequestToDeviceIdentifier:(id)a3 withAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7;
- (void)sendActivityPayloadWithAdvertisementData:(id)a3 forAdvertisementPayload:(id)a4 activityIdentifier:(id)a5 activityPayload:(id)a6;
- (void)sendEncryptionKeyReplyRequestToDevice:(id)a3 reply:(id)a4 requestIdentifier:(id)a5;
- (void)sendEncryptionKeyRequestToDeviceIdentifier:(id)a3 previousKeyIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendIDSActivityPayloadReply:(id)a3 withReplyRecord:(id)a4;
- (void)sendIDSActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5;
- (void)sendIDSEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5;
- (void)sendRapportActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5;
- (void)sendRapportEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4;
- (void)setUpIDSServices;
- (void)setUpRapport;
- (void)setUpSystemMonitor;
@end

@implementation SDActivityPayloadManager

+ (id)sharedPayloadManager
{
  if (qword_100657020 != -1) {
    dispatch_once(&qword_100657020, &stru_1005CD728);
  }
  return (id)qword_100657018;
}

- (SDActivityPayloadManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SDActivityPayloadManager;
  v2 = -[SDActivityPayloadManager init](&v19, "init");
  if (v2)
  {
    else {
      BOOL v3 = 0;
    }
    v2->_restrictionsDisabled = v3;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](&OBJC_CLASS___SDActivityAdvertiser, "sharedAdvertiser"));
    advertiser = v2->_advertiser;
    v2->_advertiser = (SDActivityAdvertiser *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[SDActivityScanner sharedScanner](&OBJC_CLASS___SDActivityScanner, "sharedScanner"));
    scanner = v2->_scanner;
    v2->_scanner = (SDActivityScanner *)v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    cachedActivityPayloadsForDemo = v2->_cachedActivityPayloadsForDemo;
    v2->_cachedActivityPayloadsForDemo = v8;

    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uniqueIDToKeyReplyDate = v2->_uniqueIDToKeyReplyDate;
    v2->_uniqueIDToKeyReplyDate = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    messageIdentifierToKeyRequestRecords = v2->_messageIdentifierToKeyRequestRecords;
    v2->_messageIdentifierToKeyRequestRecords = v12;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    messageIdentifierToReplyRecords = v2->_messageIdentifierToReplyRecords;
    v2->_messageIdentifierToReplyRecords = v14;

    v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    messageIdentifierToRequestRecords = v2->_messageIdentifierToRequestRecords;
    v2->_messageIdentifierToRequestRecords = v16;

    -[SDActivityPayloadManager clearPersistedKeyRequests](v2, "clearPersistedKeyRequests");
    -[SDActivityPayloadManager setUpSystemMonitor](v2, "setUpSystemMonitor");
    -[SDActivityPayloadManager setUpRapport](v2, "setUpRapport");
    -[SDActivityPayloadManager setUpIDSServices](v2, "setUpIDSServices");
    -[SDActivityPayloadManager setUpHandoffPreferenceMonitor](v2, "setUpHandoffPreferenceMonitor");
  }

  return v2;
}

- (void)setUpSystemMonitor
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___CUSystemMonitor);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v3;

  id location = 0LL;
  objc_initWeak(&location, self->_systemMonitor);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000BE204;
  v6[3] = &unk_1005CB3C0;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v5 = objc_retainBlock(v6);
  -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v5);
  -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setUpRapport
{
  if (!sub_10008E24C(@"DisableContinuityRapportPayloads", 0LL))
  {
    BOOL v3 = (RPCompanionLinkClient *)objc_claimAutoreleasedReturnValue( -[SDActivityPayloadManager createRapportClientWithDestinationDevice:]( self,  "createRapportClientWithDestinationDevice:",  0LL));
    rapportDiscoveryClient = self->_rapportDiscoveryClient;
    self->_rapportDiscoveryClient = v3;

    v5 = self->_rapportDiscoveryClient;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000BE330;
    v8[3] = &unk_1005CC7B8;
    v8[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:]( v5,  "registerRequestID:options:handler:",  @"com.apple.handoff.encryption-key-request",  0LL,  v8);
    uint64_t v6 = self->_rapportDiscoveryClient;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000BE344;
    v7[3] = &unk_1005CC7B8;
    v7[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:]( v6,  "registerRequestID:options:handler:",  @"com.apple.handoff.payload-request",  0LL,  v7);
    -[RPCompanionLinkClient activateWithCompletion:]( self->_rapportDiscoveryClient,  "activateWithCompletion:",  &stru_1005CD748);
  }

- (void)setUpIDSServices
{
  BOOL v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.continuity.encryption");
  encryptionService = self->_encryptionService;
  self->_encryptionService = v3;

  -[IDSService setProtobufAction:forIncomingRequestsOfType:]( self->_encryptionService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleEncryptionKeyRequestProtobuf:service:account:fromID:context:",  4LL);
  -[IDSService setProtobufAction:forIncomingResponsesOfType:]( self->_encryptionService,  "setProtobufAction:forIncomingResponsesOfType:",  "handleEncryptionKeyReplyRequestProtobuf:service:account:fromID:context:",  5LL);
  -[IDSService addDelegate:queue:](self->_encryptionService, "addDelegate:queue:", self, &_dispatch_main_q);
  v5 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.continuity.activity");
  activityService = self->_activityService;
  self->_activityService = v5;

  -[IDSService setProtobufAction:forIncomingRequestsOfType:]( self->_activityService,  "setProtobufAction:forIncomingRequestsOfType:",  "handlePayloadRequestProtobuf:service:account:fromID:context:",  1LL);
  -[IDSService setProtobufAction:forIncomingResponsesOfType:]( self->_activityService,  "setProtobufAction:forIncomingResponsesOfType:",  "handlePayloadReplyProtobuf:service:account:fromID:context:",  2LL);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:]( self->_activityService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleNewAdvertisementWithpayloadRequestProtobuf:service:account:fromID:context:",  3LL);
  -[IDSService addDelegate:queue:](self->_activityService, "addDelegate:queue:", self, &_dispatch_main_q);
}

- (id)idsDeviceWithUniqueID:(id)a3 onService:(id)a4
{
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "devices", 0));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
        unsigned int v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)requestTimedOut:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  p_messageIdentifierToRequestRecords = &self->_messageIdentifierToRequestRecords;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_messageIdentifierToRequestRecords,  "objectForKeyedSubscript:",  v4));
  p_messageIdentifierToKeyRequestRecords = &self->_messageIdentifierToKeyRequestRecords;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_messageIdentifierToKeyRequestRecords,  "objectForKeyedSubscript:",  v4));
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  v27 = sub_1000BE870;
  v28 = &unk_1005CD770;
  v29 = self;
  id v9 = v4;
  id v30 = v9;
  v10 = objc_retainBlock(&v25);
  if (v6 | v8)
  {
    uint64_t v23 = v8;
    if (v6) {
      v11 = (void *)v6;
    }
    else {
      v11 = (void *)v8;
    }
    id v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 error]);

    if (v13)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 error]);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      if (v16)
      {
        do
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo", v23, v25, v26, v27, v28, v29));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:NSUnderlyingErrorKey]);

          objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSUnderlyingErrorKey]);

          __int128 v14 = v18;
        }

        while (v20);
      }

      else
      {
        v18 = v14;
      }
    }

    else
    {
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      v32 = @"Request timed out";
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  60LL,  v21));
    }

    objc_msgSend(v12, "setError:", v18, v23);

    if (v6) {
      v22 = (id *)p_messageIdentifierToRequestRecords;
    }
    else {
      v22 = (id *)p_messageIdentifierToKeyRequestRecords;
    }
    [*v22 removeObjectForKey:v9];
    ((void (*)(void ***, id))v10[2])(v10, v12);
    uint64_t v8 = v24;
  }
}

- (NSString)state
{
  id v35 = 0LL;
  BOOL v3 = (objc_class *)objc_opt_class(self, a2);
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v35, "%@\n", v5);
  id v6 = v35;

  id v34 = v6;
  NSAppendPrintF(&v34, "-------------\n");
  id v7 = v34;

  id v33 = v7;
  if (self->_restrictionsDisabled) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  NSAppendPrintF(&v33, "Budget Restrictions Disabled: %@\n", v8);
  id v9 = v33;

  id v32 = v9;
  activityService = self->_activityService;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](activityService, "devices"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKeyPath:@"@unionOfObjects.uniqueIDOverride"]);
  uint64_t v13 = SFCompactStringFromCollection(v12);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  NSAppendPrintF(&v32, "Activity Service: %@, devices: \n", activityService, v14);
  id v15 = v32;

  id v31 = v15;
  encryptionService = self->_encryptionService;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](encryptionService, "devices"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 valueForKeyPath:@"@unionOfObjects.uniqueIDOverride"]);
  uint64_t v19 = SFCompactStringFromCollection(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  NSAppendPrintF(&v31, "Encryption Service: %@, devices: %@\n", encryptionService, v20);
  id v21 = v31;

  id v30 = v21;
  NSAppendPrintF(&v30, "Unique ID To Key Reply Date: %@\n", self->_uniqueIDToKeyReplyDate);
  id v22 = v30;

  id v29 = v22;
  NSAppendPrintF(&v29, "Message Identifier To KeyRequest Records: %@\n", self->_messageIdentifierToKeyRequestRecords);
  id v23 = v29;

  id v28 = v23;
  NSAppendPrintF(&v28, "Message Identifier To Request Records: %@\n", self->_messageIdentifierToRequestRecords);
  id v24 = v28;

  id v27 = v24;
  NSAppendPrintF(&v27, "Message Identifier To Reply Records: %@\n", self->_messageIdentifierToReplyRecords);
  id v25 = v27;

  return (NSString *)v25;
}

- (void)clearPersistedKeyRequests
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 removeObjectForKey:@"EncryptionKeyRequests"];
}

- (void)sendEncryptionKeyRequestToDeviceIdentifier:(id)a3 previousKeyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  v46 = self;
  v11 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_messageIdentifierToKeyRequestRecords, "allValues"));
  id v12 = -[NSUUID countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v53,  v59,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v54;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceIdentifier]);
        unsigned int v18 = [v17 isEqual:v8];

        if (v18)
        {
          id v29 = [v16 setCompletionHandler:v10];
          uint64_t v31 = handoff_log(v29, v30);
          id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            sub_1000C5FB4();
          }

          id v25 = v9;
          goto LABEL_19;
        }
      }

      id v13 = -[NSUUID countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v53,  v59,  16LL);
      if (v13) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  unsigned int v20 = [v19 attemptInProgress];

  if (v20)
  {
    uint64_t v23 = handoff_log(v21, v22);
    v11 = (NSUUID *)objc_claimAutoreleasedReturnValue(v23);
    id v25 = v9;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = (objc_class *)objc_opt_class(v46, v24);
      id v27 = NSStringFromClass(v26);
      id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138412290;
      v58 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "%@: Preventing encryption key request - Auto Unlock in progress",  buf,  0xCu);
    }
  }

  else
  {
    v11 = objc_opt_new(&OBJC_CLASS___NSUUID);
    id v33 = objc_opt_new(&OBJC_CLASS___SDActivityEncryptionKeyRequestRecord);
    -[SDActivityRequestRecord setRequestIdentifier:](v33, "setRequestIdentifier:", v11);
    -[SDActivityRequestRecord setDeviceIdentifier:](v33, "setDeviceIdentifier:", v8);
    -[SDActivityRequestRecord setCompletionHandler:](v33, "setCompletionHandler:", v10);
    id v25 = v9;
    -[SDActivityEncryptionKeyRequestRecord setPreviousKeyIdentifier:](v33, "setPreviousKeyIdentifier:", v9);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord requestIdentifier](v33, "requestIdentifier"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  v46,  "requestTimedOut:",  v34,  0LL,  16.0));
    -[SDActivityRequestRecord setTimeoutTimer:](v33, "setTimeoutTimer:", v35);

    -[SDActivityRequestRecord setTimeoutTimeInterval:](v33, "setTimeoutTimeInterval:", 15LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v46->_messageIdentifierToKeyRequestRecords,  "setObject:forKeyedSubscript:",  v33,  v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000BF08C;
    block[3] = &unk_1005CB2F8;
    v36 = v33;
    v52 = v36;
    dispatch_async(&_dispatch_main_q, block);
    v37 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionKeyRequestRecord previousKeyIdentifier](v36, "previousKeyIdentifier"));
    uint64_t v39 = objc_claimAutoreleasedReturnValue([v38 UUIDString]);
    v40 = (void *)v39;
    if (v39) {
      v41 = (const __CFString *)v39;
    }
    else {
      v41 = &stru_1005E3958;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v37,  "setObject:forKeyedSubscript:",  v41,  @"rKeyPreviousIdentifier");

    v42 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 dataRepresentationForCurrentEncryptionKey]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v37,  "setObject:forKeyedSubscript:",  v43,  @"rKeyDataRepresentation");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v37,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"rLocalOnly");
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1000BF0F4;
    v47[3] = &unk_1005CD798;
    v48 = v36;
    v49 = v46;
    v50 = v37;
    v44 = v37;
    v45 = v36;
    -[SDActivityPayloadManager sendRapportEncryptionKeyRequest:withRequestRecord:completionHandler:]( v46,  "sendRapportEncryptionKeyRequest:withRequestRecord:completionHandler:",  v44,  v45,  v47);
  }

- (void)sendRapportEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5
{
  id v37 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_rapportDiscoveryClient, "activeDevices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"idsDeviceIdentifier == %@",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 filteredArrayUsingPredicate:v12]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

  if (v14)
  {
    uint64_t v17 = (uint64_t)[v8 timeoutTimeInterval];
    int v19 = 5;
    if (v17 < 5) {
      int v19 = v17;
    }
    int v36 = v19;
    uint64_t v20 = handoff_log(v17, v18);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 requestIdentifier]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v22;
      __int16 v46 = 2112;
      v47 = v23;
      __int16 v48 = 2112;
      v49 = v25;
      __int16 v50 = 1024;
      int v51 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Requesting Encryption key via Rapport from %@ %@ with message GUID: %@ and timeout: %d",  buf,  0x26u);
    }

    uint64_t v28 = handoff_log(v26, v27);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_1000C603C();
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v8 linkClient]);
    if (v30)
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 linkClient]);
      [v31 invalidate];

      [v8 setLinkClient:0];
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityPayloadManager createRapportClientWithDestinationDevice:]( self,  "createRapportClientWithDestinationDevice:",  v14));
    [v8 setLinkClient:v32];

    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, v8);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v8 linkClient]);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000BF58C;
    v38[3] = &unk_1005CD7E8;
    objc_copyWeak(&v43, (id *)buf);
    int v44 = v36;
    id v39 = v37;
    v40 = self;
    id v41 = v14;
    id v42 = v9;
    [v33 activateWithCompletion:v38];

    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (self->_rapportDiscoveryClient)
    {
      uint64_t v34 = handoff_log(v15, v16);
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v46 = 2112;
        v47 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Cannot send Handoff encryption key request %@ via Rapport as we found no devices in %@",  buf,  0x16u);
      }
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
}

- (void)sendIDSEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](self, "protobufDataFromRequest:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
  p_encryptionService = (id *)&self->_encryptionService;
  v65 = self;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityPayloadManager idsDeviceWithUniqueID:onService:]( self,  "idsDeviceWithUniqueID:onService:",  v10,  self->_encryptionService));

  id v13 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v15 = v13;
  if (v12)
  {
    v62 = v9;
    id v16 = *p_encryptionService;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 nsuuid]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 devicesForBTUUID:v17]);

    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v19 = v18;
    id v20 = [v19 countByEnumeratingWithState:&v68 objects:v82 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v69;
      v64 = v15;
      while (2)
      {
        id v23 = v8;
        uint64_t v24 = v12;
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v69 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v26 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
          uint64_t v27 = IDSCopyForDevice(v26);
          if (v27)
          {
            id v32 = (void *)v27;
            -[NSMutableSet addObject:](v64, "addObject:", v27);
            id v33 = [v19 count];
            id v12 = v24;
            id v8 = v23;
            if ((unint64_t)v33 >= 2)
            {
              uint64_t v35 = handoff_log(v33, v34);
              int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Sending encryption key request to single of multiple possible destinations.",  buf,  2u);
              }
            }

            uint64_t v15 = v64;
            goto LABEL_18;
          }

          uint64_t v29 = handoff_log(0LL, v28);
          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*p_encryptionService devices]);
            *(_DWORD *)buf = 138412546;
            v75 = v26;
            __int16 v76 = 2112;
            v77 = v31;
            _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Encryption key: No device ID generated for device %@ (Devices: %@)",  buf,  0x16u);
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v68 objects:v82 count:16];
        id v12 = v24;
        id v8 = v23;
        uint64_t v15 = v64;
        if (v21) {
          continue;
        }
        break;
      }
    }

- (void)sendEncryptionKeyReplyRequestToDevice:(id)a3 reply:(id)a4 requestIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v42 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIDOverride]);
  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dataRepresentationForCurrentEncryptionKey]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v11,  @"rKeyDataRepresentation");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](self, "protobufDataFromRequest:", v9));
  uint64_t v14 = (void *)IDSCopyForDevice(v7);
  if (v14)
  {
    uint64_t v40 = v14;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
    id v16 = objc_opt_new(&OBJC_CLASS___NSUUID);
    uint64_t v18 = handoff_log(v16, v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v16;
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Responding to Handoff encryption key request from %@ via IDS",  buf,  0xCu);

      id v16 = v20;
    }

    id v41 = v16;

    uint64_t v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager dataFromUUID:](self, "dataFromUUID:", v16));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v23,  IDSSendMessageOptionUUIDKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v8,  IDSSendMessageOptionPeerResponseIdentifierKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &off_1005F78D0,  IDSSendMessageOptionTimeoutKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionLocalDeliveryKey);
    id v24 = [[IDSProtobuf alloc] initWithProtobufData:v12 type:5 isResponse:1];
    encryptionService = self->_encryptionService;
    id v43 = 0LL;
    id v44 = 0LL;
    uint64_t v39 = (os_log_s *)v15;
    unsigned __int8 v26 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:]( encryptionService,  "sendProtobuf:toDestinations:priority:options:identifier:error:",  v24,  v15,  300LL,  v22,  &v44,  &v43);
    uint64_t v27 = self;
    unsigned __int8 v28 = v26;
    id v29 = v44;
    id v30 = v43;
    if ((v28 & 1) == 0)
    {
      uint64_t v31 = v27->_encryptionService;
      uint64_t v38 = v12;
      id v32 = v7;
      id v33 = v8;
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v41, "UUIDString"));
      -[SDActivityPayloadManager service:account:identifier:didSendWithSuccess:error:]( v27,  "service:account:identifier:didSendWithSuccess:error:",  v31,  0LL,  v34,  0LL,  v30);

      id v8 = v33;
      id v7 = v32;
      id v12 = v38;
    }

    uint64_t v35 = v39;
    uint64_t v14 = v40;
  }

  else
  {
    uint64_t v36 = handoff_log(0LL, v13);
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_encryptionService, "devices"));
      *(_DWORD *)buf = 138412802;
      uint64_t v46 = v42;
      __int16 v47 = 2112;
      uint64_t v48 = v37;
      __int16 v49 = 2112;
      id v50 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "No device ID generated for device %@ (Devices: %@) for requestIdentifier %@",  buf,  0x20u);
    }
  }
}

- (void)sendActivityPayloadRequestToDeviceIdentifier:(id)a3 withAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = (SDActivityPayloadRequestRecord *)a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(id, void *, void))a7;
  uint64_t v17 = handoff_log(v15, v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = SFHexStringForData(v13);
    id v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    *(_DWORD *)buf = 138413058;
    v64 = v12;
    __int16 v65 = 2112;
    id v66 = v44;
    __int16 v67 = 2112;
    id v68 = v14;
    __int16 v69 = 1024;
    int v70 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@ %@ %@ %d", buf, 0x26u);
  }

  if (-[NSMutableArray count](self->_cachedActivityPayloadsForDemo, "count"))
  {
    int64_t v45 = a6;
    uint64_t v46 = self;
    id v47 = v14;
    id v48 = v13;
    id v19 = v12;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v20 = self->_cachedActivityPayloadsForDemo;
    id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v56,  v62,  16LL);
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v57;
      obj = (NSUUID *)v20;
      while (2)
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v57 != v23) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
          unsigned __int8 v26 = (SDActivityPayloadRequestRecord *)objc_claimAutoreleasedReturnValue( objc_msgSend( v25,  "objectForKeyedSubscript:",  @"deviceIdentifier",  v45,  v46));
          id v27 = (id)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"advertisementPayload"]);
          unsigned __int8 v28 = (SDActivityPayloadRequestRecord *)objc_claimAutoreleasedReturnValue( [v25 objectForKeyedSubscript:@"activityCommand"]);
          if (-[SDActivityPayloadRequestRecord isEqual:](v26, "isEqual:", v19)
            && [v27 isEqual:v48]
            && -[SDActivityPayloadRequestRecord isEqual:](v28, "isEqual:", v47))
          {
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"activityPayload"]);
            uint64_t v38 = handoff_log(v36, v37);
            uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v40 = SFHexStringForData(v27);
              id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
              unsigned int v42 = [v36 length];
              *(_DWORD *)buf = 138412802;
              v64 = v26;
              __int16 v65 = 2112;
              id v66 = v41;
              __int16 v67 = 1024;
              LODWORD(v68) = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Found activity payload in cache for %@ from %@ of size %d",  buf,  0x1Cu);
            }

            v15[2](v15, v36, 0LL);
            uint64_t v35 = v19;
            id v14 = v47;
            id v13 = v48;
            id v29 = obj;
            goto LABEL_19;
          }
        }

        id v20 = (NSMutableArray *)obj;
        id v22 = -[NSUUID countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v56,  v62,  16LL);
        if (v22) {
          continue;
        }
        break;
      }
    }

    id v12 = v19;
    id v14 = v47;
    id v13 = v48;
    self = v46;
    a6 = v45;
  }

  id v29 = objc_opt_new(&OBJC_CLASS___NSUUID);
  v60[0] = @"rAdvPayload";
  v60[1] = @"rClientCommand";
  v61[0] = v13;
  v61[1] = v14;
  v60[2] = @"rIdentifier";
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v29, "UUIDString"));
  v61[2] = v30;
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  3LL));

  id v32 = objc_opt_new(&OBJC_CLASS___SDActivityPayloadRequestRecord);
  -[SDActivityRequestRecord setRequestIdentifier:](v32, "setRequestIdentifier:", v29);
  -[SDActivityRequestRecord setDeviceIdentifier:](v32, "setDeviceIdentifier:", v12);
  -[SDActivityRequestRecord setCompletionHandler:](v32, "setCompletionHandler:", v15);
  -[SDActivityPayloadRequestRecord setAdvertisementPayload:](v32, "setAdvertisementPayload:", v13);
  -[SDActivityPayloadRequestRecord setCommand:](v32, "setCommand:", v14);
  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "requestTimedOut:",  v29,  0LL,  (double)(a6 + 1)));
  -[SDActivityRequestRecord setTimeoutTimer:](v32, "setTimeoutTimer:", v33);

  -[SDActivityRequestRecord setTimeoutTimeInterval:](v32, "setTimeoutTimeInterval:", a6);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_messageIdentifierToRequestRecords,  "setObject:forKeyedSubscript:",  v32,  v29);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C0914;
  block[3] = &unk_1005CB2F8;
  uint64_t v34 = v32;
  __int128 v55 = v34;
  dispatch_async(&_dispatch_main_q, block);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000C097C;
  v50[3] = &unk_1005CD798;
  int v51 = v34;
  v52 = self;
  id v53 = v31;
  uint64_t v35 = v12;
  id v27 = v31;
  unsigned __int8 v26 = v34;
  -[SDActivityPayloadManager sendRapportActivityPayloadRequest:withRequestRecord:completionHandler:]( self,  "sendRapportActivityPayloadRequest:withRequestRecord:completionHandler:",  v27,  v26,  v50);

  unsigned __int8 v28 = v55;
LABEL_19:
}

- (void)sendRapportActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5
{
  id v50 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v11 = handoff_log(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to send rapport activity payload request",  buf,  2u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned __int8 v14 = [v13 isMirroringActive];

  uint64_t v17 = handoff_log(v15, v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) != 0)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Mirroring is active, bringing up scanner and sending if we find device",  buf,  2u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    id v66 = sub_1000C1000;
    __int16 v67 = sub_1000C1010;
    id v68 = 0LL;
    id v68 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    [*(id *)(*(void *)&buf[8] + 40) setControlFlags:2];
    objc_msgSend( *(id *)(*(void *)&buf[8] + 40),  "setControlFlags:",  (unint64_t)objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "controlFlags") | 0x10000);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v20));
    [*(id *)(*(void *)&buf[8] + 40) setDeviceFilter:v21];

    v63[0] = 0LL;
    v63[1] = v63;
    v63[2] = 0x2020000000LL;
    char v64 = 0;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_1000C1018;
    v56[3] = &unk_1005CD838;
    id v22 = v8;
    id v57 = v22;
    __int128 v58 = self;
    id v59 = v50;
    id v23 = v9;
    id v60 = v23;
    v61 = buf;
    v62 = v63;
    [*(id *)(*(void *)&buf[8] + 40) setDeviceFoundHandler:v56];
    id v24 = *(void **)(*(void *)&buf[8] + 40LL);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_1000C11C4;
    v51[3] = &unk_1005CD888;
    id v53 = v23;
    id v54 = v63;
    v51[4] = self;
    id v52 = v22;
    __int128 v55 = buf;
    [v24 activateWithCompletion:v51];

    _Block_object_dispose(v63, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Mirroring is not active, sending directly",  buf,  2u);
    }

    __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_rapportDiscoveryClient, "activeDevices"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"idsDeviceIdentifier == %@",  v25));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v49 filteredArrayUsingPredicate:v26]);
    unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 firstObject]);

    if (v28)
    {
      uint64_t v31 = (uint64_t)[v8 timeoutTimeInterval];
      uint64_t v33 = handoff_log(v31, v32);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        if (v31 >= 5) {
          int v35 = 5;
        }
        else {
          int v35 = v31;
        }
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v8 advertisementPayload]);
        uint64_t v37 = SFHexStringForData(v36);
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v8 requestIdentifier]);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 UUIDString]);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&_BYTE buf[12] = 2112;
        *(void *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v66) = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Requesting Handoff payload via Rapport for %@ with message GUID: %@ and timeout: %d",  buf,  0x1Cu);
      }

      uint64_t v43 = handoff_log(v41, v42);
      id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        sub_1000C6208();
      }

      int64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v8 linkClient]);
      if (v45)
      {
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v8 linkClient]);
        [v46 invalidate];

        [v8 setLinkClient:0];
      }

      -[SDActivityPayloadManager sendActivityPayloadRequestMessageToDevice:withRequestRecord:withDestinationDevice:completionHandler:]( self,  "sendActivityPayloadRequestMessageToDevice:withRequestRecord:withDestinationDevice:completionHandler:",  v50,  v8,  v28,  v9);
    }

    else
    {
      if (self->_rapportDiscoveryClient)
      {
        uint64_t v47 = handoff_log(v29, v30);
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Cannot send Handoff payload request %@ via Rapport as we found no devices in %@",  buf,  0x16u);
        }
      }

      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)sendActivityPayloadRequestMessageToDevice:(id)a3 withRequestRecord:(id)a4 withDestinationDevice:(id)a5 completionHandler:(id)a6
{
  id v34 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (uint64_t)[v10 timeoutTimeInterval];
  if (v13 >= 5) {
    int v15 = 5;
  }
  else {
    int v15 = v13;
  }
  uint64_t v16 = handoff_log(v13, v14);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 advertisementPayload]);
    uint64_t v19 = SFHexStringForData(v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 requestIdentifier]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v20;
    __int16 v43 = 2112;
    id v44 = v22;
    __int16 v45 = 1024;
    int v46 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Requesting Handoff payload via Rapport for %@ with message GUID: %@ and timeout: %d",  buf,  0x1Cu);
  }

  uint64_t v25 = handoff_log(v23, v24);
  unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_1000C6208();
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v10 linkClient]);
  if (v27)
  {
    unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v10 linkClient]);
    [v28 invalidate];

    [v10 setLinkClient:0];
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityPayloadManager createRapportClientWithDestinationDevice:]( self,  "createRapportClientWithDestinationDevice:",  v11));
  [v10 setLinkClient:v29];

  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, v10);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v10 linkClient]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000C172C;
  v35[3] = &unk_1005CD7E8;
  objc_copyWeak(&v40, (id *)buf);
  int v41 = v15;
  id v31 = v34;
  id v36 = v31;
  uint64_t v37 = self;
  id v32 = v11;
  id v38 = v32;
  id v33 = v12;
  id v39 = v33;
  [v30 activateWithCompletion:v35];

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);
}

- (void)sendIDSActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](self, "protobufDataFromRequest:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityPayloadManager idsDeviceWithUniqueID:onService:]( self,  "idsDeviceWithUniqueID:onService:",  v10,  self->_activityService));

  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v14 = v12;
  v61 = v11;
  if (v11)
  {
    id v60 = v9;
    activityService = self->_activityService;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 nsuuid]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devicesForBTUUID:](activityService, "devicesForBTUUID:", v16));

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v65;
      while (2)
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v65 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
          uint64_t v24 = IDSCopyForDevice(v23);
          if (v24)
          {
            uint64_t v29 = (void *)v24;
            -[NSMutableSet addObject:](v14, "addObject:", v24);
            id v30 = [v18 count];
            if ((unint64_t)v30 >= 2)
            {
              uint64_t v32 = handoff_log(v30, v31);
              id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Sending handoff payload request via IDS to single of multiple possible destinations.",  buf,  2u);
              }
            }

            goto LABEL_18;
          }

          uint64_t v26 = handoff_log(0LL, v25);
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_encryptionService, "devices"));
            *(_DWORD *)buf = 138412546;
            __int128 v71 = v23;
            __int16 v72 = 2112;
            v73 = v28;
            _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "No device ID generated for device %@ (Devices: %@)",  buf,  0x16u);
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v64 objects:v76 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

- (void)handleEncyptionKeyRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  int v15 = (void (**)(id, NSMutableDictionary *))a7;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a4 uniqueIDOverride]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"rKeyDataRepresentation"]);
  -[SDActivityPayloadManager setDecryptionKeyDataRepresentation:forDeviceIdentifier:]( self,  "setDecryptionKeyDataRepresentation:forDeviceIdentifier:",  v17,  v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_uniqueIDToKeyReplyDate,  "objectForKeyedSubscript:",  v16));
  id v19 = [v18 timeIntervalSinceNow];
  if (v21 <= -0.0) {
    double v22 = -v21;
  }
  else {
    double v22 = 0.0;
  }
  if (v18 && v22 < 5.0)
  {
    uint64_t v23 = handoff_log(v19, v20);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = SFStringFromTimeInterval(1LL, v22);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138413058;
      uint64_t v37 = v16;
      __int16 v38 = 2112;
      id v39 = v14;
      __int16 v40 = 2112;
      id v41 = v13;
      __int16 v42 = 2112;
      __int16 v43 = v34;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Ignoring request from %@ via %@ for key with requestIdentifier %@ as we replied only %@ ago",  buf,  0x2Au);
    }
  }

  else
  {
    uint64_t v25 = objc_opt_new(&OBJC_CLASS___NSDate);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_uniqueIDToKeyReplyDate,  "setObject:forKeyedSubscript:",  v25,  v16);

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"rKeyPreviousIdentifier"]);
    uint64_t v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
    id v28 = v12;
    uint64_t v29 = v15;
    id v30 = v14;
    id v31 = v13;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v27 dataRepresentationForCurrentEncryptionKey]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v26,  "setObject:forKeyedSubscript:",  v32,  @"rKeyDataRepresentation");

    id v13 = v31;
    id v14 = v30;
    int v15 = v29;
    id v12 = v28;

    v15[2](v15, v26);
  }
}

- (void)handleEncryptionKeyRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (RPOptionSenderIDSDeviceID) {
    id v11 = (const __CFString *)RPOptionSenderIDSDeviceID;
  }
  else {
    id v11 = @"senderIDS";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
  if (!v12)
  {
    id v16 = 0LL;
LABEL_11:
    uint64_t v23 = NSErrorWithOSStatusF(4294960588LL, "IDS device not found");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v24);

    goto LABEL_12;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uniqueIDOverride == %@",  v12));
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v14]);
  id v16 = (id)objc_claimAutoreleasedReturnValue([v15 firstObject]);

  if (!v8 || !v16) {
    goto LABEL_11;
  }
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"rIdentifier"]);
  uint64_t v19 = handoff_log(v17, v18);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:RPOptionXID]);
    *(_DWORD *)buf = 138412802;
    uint64_t v29 = v21;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Received Handoff encryption key request from %@ via Rapport with requestIdentifier %@, xid %@",  buf,  0x20u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000C2710;
  v25[3] = &unk_1005CD8B0;
  id v16 = v16;
  id v26 = v16;
  id v27 = v10;
  -[SDActivityPayloadManager handleEncyptionKeyRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:]( self,  "handleEncyptionKeyRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:",  v8,  v16,  v17,  @"Rapport",  v25);

LABEL_12:
}

- (void)handleEncryptionKeyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  encryptionService = self->_encryptionService;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](encryptionService, "deviceForFromID:", v10));
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 data]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v15));
  if (v14 && v16)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 outgoingResponseIdentifier]);
    uint64_t v21 = handoff_log(v19, v20);
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      *(_DWORD *)buf = 138412546;
      __int16 v30 = v23;
      __int16 v31 = 2112;
      __int16 v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received Handoff encryption key request from %@ via IDS with requestIdentifier %@",  buf,  0x16u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000C2A00;
    v26[3] = &unk_1005CD8D8;
    v26[4] = self;
    id v27 = v14;
    id v28 = v19;
    uint64_t v24 = v19;
    -[SDActivityPayloadManager handleEncyptionKeyRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:]( self,  "handleEncyptionKeyRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:",  v16,  v27,  v24,  @"IDS",  v26);
  }

  else
  {
    uint64_t v25 = handoff_log(v17, v18);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000C6430();
    }
  }
}

- (void)handleEncryptionKeyReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  activityService = self->_activityService;
  id v13 = a6;
  id v14 = a3;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](activityService, "devices"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceIdentifier]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uniqueIDOverride == %@",  v16));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 filteredArrayUsingPredicate:v17]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);

  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v10, RPOptionDataLinkType, 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  uint64_t v22 = handoff_log(Int64Ranged, v21);
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = self;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
    else {
      uint64_t v25 = off_1005CD998[(int)Int64Ranged];
    }
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 requestIdentifier]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:RPOptionXID]);
    *(_DWORD *)buf = 138413058;
    __int16 v30 = v24;
    __int16 v31 = 2080;
    __int16 v32 = v25;
    __int16 v33 = 2112;
    uint64_t v34 = v26;
    __int16 v35 = 2112;
    uint64_t v36 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Received a new Handoff encryption key from %@ via Rapport (%s) with requestIdentifier %@, xid %@",  buf,  0x2Au);

    self = v28;
  }

  -[SDActivityPayloadManager handleEncryptionKeyReply:forRequestRecord:fromDevice:transportLinkType:]( self,  "handleEncryptionKeyReply:forRequestRecord:fromDevice:transportLinkType:",  v14,  v11,  v19,  Int64Ranged);
}

- (void)handleEncryptionKeyReplyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  encryptionService = self->_encryptionService;
  id v11 = a7;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](encryptionService, "deviceForFromID:", a6));
  id v14 = objc_alloc(&OBJC_CLASS___NSUUID);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 incomingResponseIdentifier]);

  id v16 = -[NSUUID initWithUUIDString:](v14, "initWithUUIDString:", v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 data]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v17));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_messageIdentifierToKeyRequestRecords,  "objectForKeyedSubscript:",  v16));
  uint64_t v21 = handoff_log(v19, v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v19 requestIdentifier]);
    int v25 = 138412546;
    id v26 = v23;
    __int16 v27 = 2112;
    id v28 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received a new Handoff encryption key from %@ via IDS with requestIdentifier %@",  (uint8_t *)&v25,  0x16u);
  }

  -[SDActivityPayloadManager handleEncryptionKeyReply:forRequestRecord:fromDevice:transportLinkType:]( self,  "handleEncryptionKeyReply:forRequestRecord:fromDevice:transportLinkType:",  v18,  v19,  v13,  0xFFFFFFFFLL);
}

- (void)handleEncryptionKeyReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIDOverride]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"rKeyDataRepresentation"]);

  uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 requestIdentifier]);
  uint64_t v17 = (void *)v15;
  if (v10 && v11)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_messageIdentifierToKeyRequestRecords, "removeObjectForKey:", v15);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 timeoutTimer]);
    [v18 invalidate];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIdentifier]);
    unsigned __int8 v20 = [v19 isEqual:v13];

    if ((v20 & 1) == 0)
    {
      uint64_t v23 = handoff_log(v21, v22);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000C64C0();
      }
    }

    sub_10008562C(1, 1LL, 0LL, 0LL);
    int v25 = (void *)objc_claimAutoreleasedReturnValue([v10 requestCreatedDate]);
    [v25 timeIntervalSinceNow];
    -[SDActivityPayloadManager logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:]( self,  "logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:",  v6,  @"EncryptionKey",  1LL);

    id v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v10 completionHandler]);
    ((void (**)(void, void *, void))v26)[2](v26, v14, 0LL);
  }

  else
  {
    uint64_t v27 = handoff_log(v15, v16);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
    if (v14 && v13)
    {
      if (v29) {
        sub_1000C6550();
      }

      -[SDActivityPayloadManager setDecryptionKeyDataRepresentation:forDeviceIdentifier:]( self,  "setDecryptionKeyDataRepresentation:forDeviceIdentifier:",  v14,  v13);
    }

    else
    {
      if (v29) {
        sub_1000C65E8();
      }
    }
  }
}

- (void)handlePayloadRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (RPOptionSenderIDSDeviceID) {
    id v11 = (const __CFString *)RPOptionSenderIDSDeviceID;
  }
  else {
    id v11 = @"senderIDS";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
  if (!v12)
  {
    id v16 = 0LL;
LABEL_11:
    uint64_t v23 = NSErrorWithOSStatusF(4294960588LL, "IDS device not found");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v24);

    goto LABEL_12;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uniqueIDOverride == %@",  v12));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v14]);
  id v16 = (id)objc_claimAutoreleasedReturnValue([v15 firstObject]);

  if (!v8 || !v16) {
    goto LABEL_11;
  }
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"rIdentifier"]);
  uint64_t v19 = handoff_log(v17, v18);
  unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:RPOptionXID]);
    *(_DWORD *)buf = 138412802;
    __int16 v30 = v21;
    __int16 v31 = 2112;
    __int16 v32 = v17;
    __int16 v33 = 2112;
    uint64_t v34 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Received Handoff payload request from %@ via Rapport with requestIdentifier %@, xid %@",  buf,  0x20u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000C32B4;
  v25[3] = &unk_1005CD900;
  id v16 = v16;
  id v26 = v16;
  uint64_t v27 = self;
  id v28 = v10;
  -[SDActivityPayloadManager handlePayloadRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:]( self,  "handlePayloadRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:",  v8,  v16,  v17,  @"Rapport",  v25);

LABEL_12:
}

- (void)handlePayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  activityService = self->_activityService;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](activityService, "deviceForFromID:", v10));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 data]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v15));
  if (v14 && v16)
  {
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 outgoingResponseIdentifier]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000C358C;
    v21[3] = &unk_1005CD928;
    v21[4] = self;
    -[SDActivityPayloadManager handlePayloadRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:]( self,  "handlePayloadRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:",  v16,  v14,  v19,  @"IDS",  v21);
  }

  else
  {
    uint64_t v20 = handoff_log(v17, v18);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000C672C();
    }
  }
}

- (void)handlePayloadRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIDOverride]);
  uint64_t v18 = objc_opt_new(&OBJC_CLASS___NSDate);
  id v19 = sub_1000854EC(v12);
  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"rAdvPayload"]);
  uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"rClientCommand"]);

  uint64_t v24 = handoff_log(v22, v23);
  int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = self;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    id v39 = v15;
    if (v21) {
      uint64_t v27 = v21;
    }
    else {
      uint64_t v27 = @"-";
    }
    uint64_t v28 = SFHexStringForData(v20);
    __int16 v40 = v18;
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 138413570;
    id v54 = v14;
    __int16 v55 = 2112;
    id v56 = v26;
    __int16 v57 = 2112;
    __int128 v58 = v17;
    __int16 v59 = 2112;
    id v60 = v13;
    __int16 v61 = 2112;
    id v62 = v27;
    id v15 = v39;
    __int16 v63 = 2112;
    __int128 v64 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Received handoff payload request via %@ from %@ (%@) with requestIdentifier %@ command=%@ for advertisementPayload %@",  buf,  0x3Eu);

    self = v41;
    uint64_t v18 = v40;
  }

  advertiser = self->_advertiser;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000C3880;
  v43[3] = &unk_1005CD950;
  unsigned int v44 = v18;
  id v45 = v14;
  id v46 = v12;
  id v47 = v17;
  id v48 = v13;
  id v49 = v20;
  id v50 = v21;
  int v51 = self;
  id v52 = v15;
  id v31 = v15;
  __int16 v32 = v21;
  id v33 = v20;
  id v34 = v13;
  id v35 = v17;
  id v36 = v12;
  id v37 = v14;
  __int16 v38 = v18;
  -[SDActivityAdvertiser activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:]( advertiser,  "activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:",  v33,  v32,  v42,  v43);
}

- (void)sendIDSActivityPayloadReply:(id)a3 withReplyRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uniqueIDOverride == %@",  v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 filteredArrayUsingPredicate:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

  id v14 = (void *)IDSCopyForDevice(v12);
  if (v14)
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](self, "protobufDataFromRequest:", v6));
    uint64_t v18 = handoff_log(v16, v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
      *(_DWORD *)buf = 138412290;
      id v47 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Responding to Handoff payload request from %@ via IDS",  buf,  0xCu);
    }

    uint64_t v23 = handoff_log(v21, v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1000C66CC();
    }
    __int16 v42 = v12;
    id v43 = v6;

    uint64_t v27 = handoff_log(v25, v26);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_1000C666C();
    }

    BOOL v29 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v7 messageIdentifier]);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager dataFromUUID:](self, "dataFromUUID:", v30));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v31,  IDSSendMessageOptionUUIDKey);

    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v7 requestIdentifier]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 UUIDString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v33,  IDSSendMessageOptionPeerResponseIdentifierKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  &off_1005F78D0,  IDSSendMessageOptionTimeoutKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionFireAndForgetKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionActivityContinuationKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionLocalDeliveryKey);
    id v34 = (void *)v16;
    id v35 = [[IDSProtobuf alloc] initWithProtobufData:v16 type:2 isResponse:1];
    activityService = self->_activityService;
    id v44 = 0LL;
    id v45 = 0LL;
    unsigned int v37 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:]( activityService,  "sendProtobuf:toDestinations:priority:options:identifier:error:",  v35,  v15,  300LL,  v29,  &v45,  &v44);
    id v38 = v45;
    id v39 = v44;
    if (v37)
    {
      -[SDActivityPayloadManager activityPayloadReplySuccess:](self, "activityPayloadReplySuccess:", v7);
    }

    else
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v7 messageIdentifier]);
      -[SDActivityPayloadManager messageWithIdentifier:didSendWithSuccess:error:]( self,  "messageWithIdentifier:didSendWithSuccess:error:",  v41,  0LL,  v39);
    }

    id v6 = v43;

    id v12 = v42;
  }

  else
  {
    uint64_t v40 = handoff_log(0LL, v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000C6940();
    }
  }
}

- (void)activityPayloadReplySuccess:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activityIdentifier]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v9 = @"SDStreamActivityIdentifier";
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 activityIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    id v10 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    [v5 postNotificationName:@"com.apple.sharingd.ContinuationPayloadSent" object:0 userInfo:v8];
  }
}

- (void)handlePayloadReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  activityService = self->_activityService;
  id v13 = a6;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](activityService, "devices"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceIdentifier]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uniqueIDOverride == %@",  v16));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 filteredArrayUsingPredicate:v17]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);

  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v10, RPOptionDataLinkType, 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  uint64_t v22 = handoff_log(Int64Ranged, v21);
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = self;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
    else {
      uint64_t v25 = off_1005CD998[(int)Int64Ranged];
    }
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 requestIdentifier]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:RPOptionXID]);
    *(_DWORD *)buf = 138413058;
    __int16 v30 = v24;
    __int16 v31 = 2080;
    __int16 v32 = v25;
    __int16 v33 = 2112;
    id v34 = v26;
    __int16 v35 = 2112;
    id v36 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Received Handoff payload reply from %@ via Rapport (%s) with requestIdentifier %@, xid %@",  buf,  0x2Au);

    self = v28;
  }

  -[SDActivityPayloadManager handlePayloadReply:forRequestRecord:fromDevice:transportLinkType:]( self,  "handlePayloadReply:forRequestRecord:fromDevice:transportLinkType:",  v14,  v11,  v19,  Int64Ranged);
}

- (void)handlePayloadReplyProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](self->_activityService, "deviceForFromID:", a6));
  if (v12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 incomingResponseIdentifier]);
    id v15 = -[NSUUID initWithUUIDString:](v13, "initWithUUIDString:", v14);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_messageIdentifierToRequestRecords,  "objectForKeyedSubscript:",  v15));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 data]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v17));

    uint64_t v21 = handoff_log(v19, v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v16 requestIdentifier]);
      int v25 = 138412546;
      uint64_t v26 = v23;
      __int16 v27 = 2112;
      uint64_t v28 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received Handoff payload reply from %@ via IDS with requestIdentifier %@",  (uint8_t *)&v25,  0x16u);
    }

    -[SDActivityPayloadManager handlePayloadReply:forRequestRecord:fromDevice:transportLinkType:]( self,  "handlePayloadReply:forRequestRecord:fromDevice:transportLinkType:",  v18,  v16,  v12,  0xFFFFFFFFLL);
  }
}

- (void)handlePayloadReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = (__CFString *)a5;
  int v51 = v11;
  if ((v6 & 0x80000000) != 0)
  {
    id v50 = @"IDS";
    if (!v9) {
      goto LABEL_11;
    }
  }

  else
  {
    else {
      id v13 = off_1005CD998[(int)v6];
    }
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Rapport (%s)",  v13));
    id v50 = v11;
    if (!v9) {
      goto LABEL_11;
    }
  }

  if (v10)
  {
    messageIdentifierToRequestRecords = self->_messageIdentifierToRequestRecords;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 requestIdentifier]);
    -[NSMutableDictionary removeObjectForKey:](messageIdentifierToRequestRecords, "removeObjectForKey:", v15);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 timeoutTimer]);
    [v16 invalidate];

    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"rAdvPayload"]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"rActPayload"]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"rActPayloadErrorDomain"]);

    if (v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"rActPayloadErrorDomain"]);
      uint64_t v21 = v18;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"rActPayloadErrorCode"]);
      id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v20,  [v22 integerValue],  0));

      uint64_t v18 = v21;
    }

    else
    {
      id v48 = 0LL;
    }

    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 requestCreatedDate]);
    [v27 timeIntervalSinceNow];
    uint64_t v29 = SFStringFromTimeInterval(1LL, -v28);
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    uint64_t v33 = handoff_log(v31, v32);
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString name](v51, "name"));
      unsigned int v45 = v6;
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uniqueIDOverride](v51, "uniqueIDOverride"));
      uint64_t v37 = SFHexStringForData(v17);
      id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      id v46 = v18;
      id v39 = [v18 length];
      id v47 = v17;
      uint64_t v40 = v30;
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v10 requestIdentifier]);
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 UUIDString]);
      *(_DWORD *)buf = 138414082;
      id v53 = v50;
      __int16 v54 = 2112;
      __int16 v55 = v35;
      __int16 v56 = 2112;
      __int16 v57 = v36;
      __int16 v58 = 2112;
      __int16 v59 = v38;
      __int16 v60 = 2048;
      id v61 = v39;
      uint64_t v18 = v46;
      __int16 v62 = 2112;
      __int16 v63 = v42;
      __int16 v64 = 2112;
      __int128 v65 = v48;
      __int16 v66 = 2112;
      __int128 v67 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Received requested Handoff payload via %@ from %@ (%@) for %@ with activity payload of size %ld for requestI dentifier %@ (%@). RTT:%@",  buf,  0x52u);

      __int16 v30 = v40;
      uint64_t v17 = v47;

      uint64_t v6 = v45;
    }

    kdebug_trace(722141188LL, 0LL, 0LL, 0LL, 0LL);
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v10 requestCreatedDate]);
    [v43 timeIntervalSinceNow];
    -[SDActivityPayloadManager logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:]( self,  "logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:",  v6,  @"Request",  1LL);

    id v44 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v10 completionHandler]);
    ((void (**)(void, void *, void *))v44)[2](v44, v18, v48);

    goto LABEL_17;
  }

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a5;
  id v9 = a7;
  uint64_t v11 = handoff_log(v9, v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000C6A0C();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7 = a7;
  uint64_t v9 = handoff_log(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000C6A74();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v6 = a5;
  uint64_t v8 = handoff_log(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000C6AD4();
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v7 = a6;
  id v10 = a7;
  id v11 = a5;
  uint64_t v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v11);

  -[SDActivityPayloadManager messageWithIdentifier:didSendWithSuccess:error:]( self,  "messageWithIdentifier:didSendWithSuccess:error:",  v12,  v7,  v10);
}

- (void)messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_messageIdentifierToReplyRecords,  "objectForKeyedSubscript:",  v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_messageIdentifierToRequestRecords,  "objectForKeyedSubscript:",  v8));
  uint64_t v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_messageIdentifierToKeyRequestRecords,  "objectForKeyedSubscript:",  v8));
  }
  id v14 = v13;

  uint64_t v17 = handoff_log(v15, v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v14) {
      id v19 = v14;
    }
    else {
      id v19 = v8;
    }
    if (v10) {
      id v19 = v10;
    }
    uint64_t v20 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v31 = v19;
    __int16 v32 = 2112;
    if (v6) {
      uint64_t v20 = @"YES";
    }
    uint64_t v33 = v20;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ %@ (%@)", buf, 0x20u);
  }

  if (!v9 && !v6)
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    uint64_t v29 = @"Unknown Error";
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  94LL,  v21));
  }

  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_messageIdentifierToReplyRecords, "removeObjectForKey:", v8);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIdentifier]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityPayloadManager idsDeviceWithUniqueID:onService:]( self,  "idsDeviceWithUniqueID:onService:",  v22,  self->_activityService));
    id v24 = sub_1000854EC(v23);
    int v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    advertiser = self->_advertiser;
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 activityIdentifier]);
    -[SDActivityAdvertiser didSendPayloadForActivityIdentifier:toDevice:error:]( advertiser,  "didSendPayloadForActivityIdentifier:toDevice:error:",  v27,  v25,  v9);

LABEL_21:
    goto LABEL_22;
  }

  if (v14 && v9)
  {
    [v14 setError:v9];
    int v25 = (void *)objc_claimAutoreleasedReturnValue([v14 timeoutTimer]);
    [v25 fire];
    goto LABEL_21;
  }

- (id)dataFromUUID:(id)a3
{
  v4[0] = 0LL;
  v4[1] = 0LL;
  [a3 getUUIDBytes:v4];
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v4,  16LL));
}

- (id)requestFromProtobufData:(id)a3
{
  id v10 = 0LL;
  uint64_t v11 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a3,  0LL,  &v11,  &v10));
  id v4 = v10;
  BOOL v6 = v4;
  if (!v3)
  {
    uint64_t v7 = handoff_log(v4, v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C6B34();
    }
  }

  return v3;
}

- (id)protobufDataFromRequest:(id)a3
{
  id v3 = a3;
  id v4 = [&off_1005F99C8 mutableCopy];
  [v4 addEntriesFromDictionary:v3];

  id v12 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v12));
  id v6 = v12;
  id v8 = v6;
  if (!v5)
  {
    uint64_t v9 = handoff_log(v6, v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000C6B94();
    }
  }

  return v5;
}

- (void)setDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
    id v8 = [v7 newDecryptionKeyFromDataRepresentation:v6];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 decryptionKeyForDeviceIdentifier:v5]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dateCreated]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dateCreated]);
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 keyIdentifier]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 keyIdentifier]);
    unsigned int v16 = [v14 isEqual:v15];

    if (v16)
    {
      unsigned int v19 = [v9 lastUsedCounter];
      id v17 = [v8 lastUsedCounter];
      BOOL v20 = v19 < v17;
      if (!v8) {
        goto LABEL_14;
      }
    }

    else
    {
      BOOL v20 = 0;
      if (!v8) {
        goto LABEL_14;
      }
    }

    if (v13 < 0.0 || v9 == 0LL) {
      BOOL v20 = 1;
    }
    if (v20)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
      [v22 setDecryptionKey:v8 forDeviceIdentifier:v5];
LABEL_16:

      goto LABEL_17;
    }

- (void)logDashboardHandoffRequestViaTransportLinkType:(int)a3 type:(id)a4 success:(BOOL)a5 rtt:(double)a6
{
  BOOL v6 = a5;
  uint64_t v8 = *(void *)&a3;
  v19[0] = @"_cat";
  v19[1] = @"_op";
  v20[0] = @"Handoff";
  v20[1] = a4;
  v19[2] = @"rapportTransport";
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  v20[2] = v11;
  v19[3] = @"success";
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  v20[3] = v12;
  v19[4] = @"wasRapport";
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (int)v8 >= 0));
  v20[4] = v13;
  v19[5] = @"RTT";
  int v14 = (int)(a6 * 1000.0);
  if (v14 >= 0) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = -v14;
  }
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));
  v20[5] = v16;
  v19[6] = @"d2dEncryptionAvailable";
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_d2dEncryptionAvailable));
  v20[6] = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  7LL));

  SFDashboardLogJSON(v18);
}

- (id)createRapportClientWithDestinationDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___RPCompanionLinkClient);
  if (!sub_10008E24C(@"ContinuityRapportDisableBLEDiscovery", 0LL)) {
    -[RPCompanionLinkClient setControlFlags:]( v4,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v4, "controlFlags") | 2);
  }
  if (sub_10008E24C(@"ContinuityRapportForceL2CAP", 0LL)) {
    -[RPCompanionLinkClient setControlFlags:]( v4,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v4, "controlFlags") | 0x100);
  }
  id v5 = -[RPCompanionLinkClient setDestinationDevice:](v4, "setDestinationDevice:", v3);
  if (v3) {
    id v5 = -[RPCompanionLinkClient setControlFlags:]( v4,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v4, "controlFlags") | 0x8000000000000LL);
  }
  uint64_t v7 = handoff_log(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[SDActivityPayloadManager createRapportClientWithDestinationDevice:]";
    __int16 v12 = 2112;
    double v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s creating client: %@", (uint8_t *)&v10, 0x16u);
  }

  return v4;
}

- (void)sendActivityPayloadWithAdvertisementData:(id)a3 forAdvertisementPayload:(id)a4 activityIdentifier:(id)a5 activityPayload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v68 = a5;
  id v12 = a6;
  __int16 v66 = self;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIDOverride]);

  uint64_t v17 = handoff_log(v15, v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v56 = [v12 length];
    uint64_t v57 = SFHexStringForData(v11);
    __int16 v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v77 = v56;
    *(_WORD *)&v77[4] = 2112;
    *(void *)&v77[6] = v68;
    *(_WORD *)&v77[14] = 2112;
    *(void *)&v77[16] = v58;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Got payload to send of size %d with activityIdentifier:%@ for advertisementPayload:%@",  buf,  0x1Cu);
  }

  __int16 v63 = v11;

  unsigned int v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v10, @"rAdvData");
  if (v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v12, @"rActPayload");
  }
  id v64 = v12;
  __int16 v62 = v19;
  __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](v66, "protobufDataFromRequest:", v19, a2));
  BOOL v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v66->_activityService, "devices"));
  id v22 = [v21 countByEnumeratingWithState:&v71 objects:v75 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v72;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v72 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 nsuuid]);

        if (v27)
        {
          id v31 = (os_log_s *)IDSCopyForDevice(v26);
          if (v31)
          {
            -[NSMutableSet addObject:](v20, "addObject:", v31);
          }

          else
          {
            uint64_t v33 = handoff_log(0LL, v30);
            __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v77 = v68;
              *(_WORD *)&v77[8] = 2112;
              *(void *)&v77[10] = v26;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "Not sending %@ to device as we could not get deviceID: %@",  buf,  0x16u);
            }
          }
        }

        else
        {
          uint64_t v32 = handoff_log(v28, v29);
          id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v77 = v68;
            *(_WORD *)&v77[8] = 2112;
            *(void *)&v77[10] = v26;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "Not sending %@ to device as it has no nsuuid/BTUUID: %@",  buf,  0x16u);
          }
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v71 objects:v75 count:16];
    }

    while (v23);
  }

  if (!v20)
  {
    __int16 v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v59,  "handleFailureInMethod:object:file:lineNumber:description:",  v61,  v66,  @"SDActivityPayloadManager.m",  1149,  @"Demo mode enabled, yet cannot find any destinations on service");
  }

  id v35 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v36 = objc_opt_new(&OBJC_CLASS___SDActivityPayloadReplyRecord);
  -[SDActivityPayloadReplyRecord setMessageIdentifier:](v36, "setMessageIdentifier:", v35);
  -[SDActivityPayloadReplyRecord setRequestIdentifier:](v36, "setRequestIdentifier:", 0LL);
  -[SDActivityPayloadReplyRecord setActivityIdentifier:](v36, "setActivityIdentifier:", v68);
  -[SDActivityPayloadReplyRecord setDeviceIdentifier:](v36, "setDeviceIdentifier:", v67);
  id v37 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v66->_messageIdentifierToReplyRecords,  "setObject:forKeyedSubscript:",  v36,  v35);
  uint64_t v39 = handoff_log(v37, v38);
  uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  id v41 = v64;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v42 = @"final ";
    if (!v64) {
      __int16 v42 = &stru_1005E3958;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v77 = v42;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Sending Handoff %@advertisement", buf, 0xCu);
  }

  uint64_t v45 = handoff_log(v43, v44);
  id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
    sub_1000C6C64();
  }

  id v47 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager dataFromUUID:](v66, "dataFromUUID:", v35));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v48,  IDSSendMessageOptionUUIDKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionActivityContinuationKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionLocalDeliveryKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  IDSSendMessageOptionEnforceRemoteTimeoutsKey);
  if (!v64) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionNonWakingKey);
  }
  id v49 = [[IDSProtobuf alloc] initWithProtobufData:v65 type:3 isResponse:0];
  activityService = v66->_activityService;
  id v69 = 0LL;
  id v70 = 0LL;
  unsigned __int8 v51 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:]( activityService,  "sendProtobuf:toDestinations:priority:options:identifier:error:",  v49,  v20,  300LL,  v47,  &v70,  &v69);
  id v52 = v70;
  id v53 = v69;
  if ((v51 & 1) == 0)
  {
    __int16 v54 = v66->_activityService;
    __int16 v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v35, "UUIDString"));
    -[SDActivityPayloadManager service:account:identifier:didSendWithSuccess:error:]( v66,  "service:account:identifier:didSendWithSuccess:error:",  v54,  0LL,  v55,  0LL,  v53);

    id v41 = v64;
  }
}

- (void)handleNewAdvertisementWithpayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a3 data]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v12));

  int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceForFromID:v10]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIDOverride]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"rAdvData"]);
  scanner = self->_scanner;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C5B78;
  v21[3] = &unk_1005CD978;
  id v22 = v13;
  id v23 = self;
  id v24 = v15;
  id v25 = v14;
  id v18 = v14;
  id v19 = v15;
  id v20 = v13;
  -[SDActivityScanner handleNewAdvertisementDevice:data:receivedViaScanning:withSuccessHandler:]( scanner,  "handleNewAdvertisementDevice:data:receivedViaScanning:withSuccessHandler:",  v18,  v16,  0LL,  v21);
}

- (void).cxx_destruct
{
}

@end