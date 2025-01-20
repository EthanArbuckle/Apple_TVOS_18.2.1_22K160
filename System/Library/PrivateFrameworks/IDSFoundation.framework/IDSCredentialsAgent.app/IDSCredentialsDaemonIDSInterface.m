@interface IDSCredentialsDaemonIDSInterface
+ (id)sharedInstance;
- (BOOL)_sendIDSMessage:(id)a3;
- (BOOL)_sendIDSMessage:(id)a3 queueOneIdentifier:(id)a4;
- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 forcedIdentifier:(id)a5;
- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6;
- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6 options:(id)a7 identifier:(id *)a8;
- (BOOL)_sendIDSPairingMessage:(id)a3;
- (BOOL)_sendIDSPairingMessage:(id)a3 queueOneIdentifier:(id)a4;
- (BOOL)_sendIDSPairingMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6;
- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 completionBlock:(id)a4 isPairing:(BOOL)a5;
- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 queueOneIdentifier:(id)a4 completionBlock:(id)a5 isPairing:(BOOL)a6;
- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 timeOut:(id)a4 forcedIdentifier:(id)a5 completionBlock:(id)a6 isPairing:(BOOL)a7;
- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6 completionBlock:(id)a7 isPairing:(BOOL)a8;
- (BOOL)isLocalDevicePresent;
- (IDSCredentialsDaemonIDSInterface)init;
- (IDSCredentialsDaemonIDSInterface)initWithIDSService:(id)a3;
- (NSMutableArray)queuedMessages;
- (id)_credentialUniqueIDFromMessageIdentifier:(id)a3;
- (void)_addMessageInfo:(id)a3 description:(id)a4 completionBlock:(id)a5;
- (void)_handleFetchFaceTimeAndiMessageInfoMessage:(id)a3;
- (void)_handleFetchFaceTimeAndiMessageInfoMessageResponse:(id)a3;
- (void)_handleFetchRAMessage:(id)a3;
- (void)_handleFetchRAMessageResponse:(id)a3;
- (void)_handleIncomingAccountSyncMessage:(id)a3;
- (void)_handleIncomingAccountSyncMessageResponse:(id)a3;
- (void)_handleSendIDSIDLocalIDQuery:(id)a3;
- (void)_handleSendIDSIDLocalIDQueryResponse:(id)a3;
- (void)_handleSendIDSLocalDeviceInfoRequest:(id)a3;
- (void)_handleSendIDSLocalDeviceInfoResponse:(id)a3;
- (void)_mapMessageIdentifier:(id)a3 toCredentialUniqueID:(id)a4;
- (void)_removeMessageIdentifierMapping:(id)a3;
- (void)_removeMessageIdentifierMappingWithCredentialUniqueID:(id)a3;
- (void)_removeMessageInfo:(id)a3;
- (void)_sendAccountSyncMessageToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendFetchIMFTRequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendFetchRARequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendIDSLocalDeviceInfoRequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendIDStatusQueryRequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)dealloc;
- (void)forwardIPCRequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)setQueuedMessages:(id)a3;
@end

@implementation IDSCredentialsDaemonIDSInterface

+ (id)sharedInstance
{
  if (qword_1000157E0 != -1) {
    dispatch_once(&qword_1000157E0, &stru_100010608);
  }
  return (id)qword_1000157E8;
}

- (IDSCredentialsDaemonIDSInterface)init
{
  v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.idscredentials");
  v4 = -[IDSCredentialsDaemonIDSInterface initWithIDSService:](self, "initWithIDSService:", v3);

  return v4;
}

- (IDSCredentialsDaemonIDSInterface)initWithIDSService:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSCredentialsDaemonIDSInterface;
  v6 = -[IDSCredentialsDaemonIDSInterface init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsService, a3);
    -[IDSService addDelegate:queue:](v7->_idsService, "addDelegate:queue:", v7, &_dispatch_main_q);
    v8 = objc_alloc_init(&OBJC_CLASS___IMOrderedMutableDictionary);
    uniqueIDToInfo = v7->_uniqueIDToInfo;
    v7->_uniqueIDToInfo = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    credentialIDByMessageID = v7->_credentialIDByMessageID;
    v7->_credentialIDByMessageID = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    queuedMessages = v7->_queuedMessages;
    v7->_queuedMessages = v12;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSCredentialsDaemonIDSInterface;
  -[IDSCredentialsDaemonIDSInterface dealloc](&v3, "dealloc");
}

- (BOOL)isLocalDevicePresent
{
  return 1;
}

- (void)_sendFetchIMFTRequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v7, IDSRemoteCredentialKeyCommand, &off_100011248);
  if (v6) {
    CFDictionarySetValue((CFMutableDictionaryRef)v7, IDSRemoteCredentialKeyUniqueID, v6);
  }
  if ([v6 length]) {
    BOOL v8 = v5 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    -[IDSCredentialsDaemonIDSInterface _addMessageInfo:description:completionBlock:]( self,  "_addMessageInfo:description:completionBlock:",  v6,  @"IDSRemoteCredentialCommandFetchIMFT",  v5);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003BE0;
  v11[3] = &unk_100010630;
  id v9 = v5;
  id v12 = v9;
  v10 = objc_retainBlock(v11);
  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:",  v7,  v10,  0LL)
    && !-[IDSCredentialsDaemonIDSInterface _sendIDSMessage:](self, "_sendIDSMessage:", v7)
    && v5)
  {
    (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 9LL, 0LL, 0LL);
  }
}

- (void)_sendFetchRARequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  uint64_t v8 = IMGetXPCArrayFromDictionary(v6, "serviceTypes");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v11, IDSRemoteCredentialKeyCommand, &off_100011260);
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v11, IDSRemoteCredentialKeyUniqueID, v10);
  }
  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v11, IDSRemoteCredentialKeyServiceTypes, v9);
  }
  if ([v10 length] && v7) {
    -[IDSCredentialsDaemonIDSInterface _addMessageInfo:description:completionBlock:]( self,  "_addMessageInfo:description:completionBlock:",  v10,  @"IDSRemoteCredentialCommandFetchRA",  v7);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100003DB0;
  v14[3] = &unk_100010630;
  id v12 = v7;
  id v15 = v12;
  v13 = objc_retainBlock(v14);
  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:",  v11,  v13,  0LL)
    && !-[IDSCredentialsDaemonIDSInterface _sendIDSMessage:queueOneIdentifier:]( self,  "_sendIDSMessage:queueOneIdentifier:",  v11,  @"IDSRemoteCredentialCommandFetchRA")
    && v7)
  {
    (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 17LL, 0LL, 0LL);
  }
}

- (void)_sendIDSLocalDeviceInfoRequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  uint64_t v10 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "About to send device info request to IDS",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled()
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"About to send device info request to IDS");
  }

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting remote device info", buf, 2u);
  }

  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v13, IDSRemoteCredentialKeyCommand, &off_100011278);
  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v13, IDSRemoteCredentialKeyUniqueID, v8);
  }
  if ([v8 length] && v7) {
    -[IDSCredentialsDaemonIDSInterface _addMessageInfo:description:completionBlock:]( self,  "_addMessageInfo:description:completionBlock:",  v8,  @"IDSRemoteCredentialCommandRequestDeviceInfo",  v7);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100004068;
  v24[3] = &unk_100010630;
  id v14 = v7;
  id v25 = v14;
  id v15 = objc_retainBlock(v24);
  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:",  v13,  @"IDSRemoteCredentialCommandRequestDeviceInfo",  v15,  1LL)
    && !-[IDSCredentialsDaemonIDSInterface _sendIDSPairingMessage:queueOneIdentifier:]( self,  "_sendIDSPairingMessage:queueOneIdentifier:",  v13,  @"IDSRemoteCredentialCommandRequestDeviceInfo")
    && v7)
  {
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10000A698(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 12LL, 0LL, 0LL);
  }
}

- (void)_sendIDStatusQueryRequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  uint64_t v9 = IMGetXPCArrayFromDictionary(v6, "IDs");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = IMGetXPCStringFromDictionary(v6, "service");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = IMGetXPCBoolFromDictionary(v6, "lightQuery");
  uint64_t v14 = IMGetXPCBoolFromDictionary(v6, "allowQuery");
  uint64_t v16 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "About to ID Query request to IDS", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled()
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"About to ID Query request to IDS");
  }

  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSRemoteCredentialKeyCommand, &off_100011290);
  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSRemoteCredentialKeyUniqueID, v8);
  }
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSRemoteCredentialKeyIDs, v10);
  }
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSRemoteCredentialKeyService, v12);
  }
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
  if (v19) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSRemoteCredentialKeyLightQuery, v19);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
  if (v20) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSRemoteCredentialKeyAllowQuery, v20);
  }

  if ([v8 length]) {
    -[IDSCredentialsDaemonIDSInterface _addMessageInfo:description:completionBlock:]( self,  "_addMessageInfo:description:completionBlock:",  v8,  @"IDSRemoteCredentialCommandRequestIDStatus",  v7);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000043FC;
  v24[3] = &unk_100010630;
  id v21 = v7;
  id v25 = v21;
  uint64_t v22 = objc_retainBlock(v24);
  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:",  v18,  @"IDSRemoteCredentialCommandRequestDeviceInfo",  v22,  0LL))
  {
    unsigned __int8 v23 = -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:timeOut:forcedIdentifier:]( self,  "_sendIDSMessage:timeOut:forcedIdentifier:",  v18,  &off_100011338,  v8);
    if (v21)
    {
      if ((v23 & 1) == 0) {
        (*((void (**)(id, uint64_t, void, void))v21 + 2))(v21, 14LL, 0LL, 0LL);
      }
    }
  }
}

- (void)_sendAccountSyncMessageToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending account sync message to paired device",  buf,  2u);
  }

  uint64_t v10 = IMGetXPCCodableFromDictionaryWithStandardAllowlist(v7, "message");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = IMGetXPCStringFromDictionary(v7, "queueOne");
  uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
  int v14 = IMGetXPCBoolFromDictionary(v7, "allowCloudFallback");

  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v15, IDSRemoteCredentialKeyCommand, &off_1000112A8);
  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v15, IDSRemoteCredentialKeyUniqueID, v8);
  }
  if (v11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v15, IDSRemoteCredentialKeySyncPayload, v11);
  }
  if ([v8 length]) {
    -[IDSCredentialsDaemonIDSInterface _addMessageInfo:description:completionBlock:]( self,  "_addMessageInfo:description:completionBlock:",  v8,  @"IDSRemoteCredentialCommandAccountSyncMessage",  v6);
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100004754;
  v29[3] = &unk_100010630;
  id v16 = v6;
  id v30 = v16;
  uint64_t v17 = objc_retainBlock(v29);
  uint64_t v18 = @"IDSRemoteCredentialCommandRequestDeviceInfo";
  if (v13) {
    uint64_t v18 = v13;
  }
  uint64_t v19 = v18;
  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:",  v15,  v19,  v17,  0LL))
  {
    id v25 = v11;
    if (v14)
    {
      uint64_t v32 = IDSSendMessageOptionAllowCloudDeliveryKey;
      v33 = &__kCFBooleanTrue;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    }

    else
    {
      uint64_t v20 = &__NSDictionary0__struct;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  IDSMaxMessageTimeout,  v25));
    v27 = v20;
    id v28 = 0LL;
    uint64_t v22 = self;
    unsigned __int8 v23 = -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:options:identifier:]( self,  "_sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:options:identifier:",  v15,  v21,  v13,  0LL,  v20,  &v28);
    id v24 = v28;

    if (!v16 || (v23 & 1) != 0) {
      -[IDSCredentialsDaemonIDSInterface _mapMessageIdentifier:toCredentialUniqueID:]( v22,  "_mapMessageIdentifier:toCredentialUniqueID:",  v24,  v8);
    }
    else {
      (*((void (**)(id, uint64_t, void, void))v16 + 2))(v16, 16LL, 0LL, 0LL);
    }
    uint64_t v11 = v26;
  }
}

- (BOOL)_sendIDSMessage:(id)a3
{
  return -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:queueOneIdentifier:]( self,  "_sendIDSMessage:queueOneIdentifier:",  a3,  0LL);
}

- (BOOL)_sendIDSMessage:(id)a3 queueOneIdentifier:(id)a4
{
  double v6 = IDSMaxMessageTimeout;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  LOBYTE(self) = -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:]( self,  "_sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:",  v8,  v9,  v7,  0LL);

  return (char)self;
}

- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 forcedIdentifier:(id)a5
{
  return -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:]( self,  "_sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:",  a3,  a4,  0LL,  a5);
}

- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6
{
  return -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:options:identifier:]( self,  "_sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:options:identifier:",  a3,  a4,  a5,  a6,  0LL,  0LL);
}

- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6 options:(id)a7 identifier:(id *)a8
{
  id v13 = a3;
  id value = a4;
  id v14 = a5;
  id v51 = a6;
  id v50 = a7;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService linkedDevicesWithRelationship:](self->_idsService, "linkedDevicesWithRelationship:", 3LL));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v56;
LABEL_3:
    uint64_t v19 = 0LL;
    while (1)
    {
      if (*(void *)v56 != v18) {
        objc_enumerationMutation(v16);
      }
      uint64_t v20 = *(void **)(*((void *)&v55 + 1) + 8 * v19);
      if ([v20 isActive])
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueIDOverride]);
        BOOL v22 = [v21 length] == 0;

        if (!v22) {
          break;
        }
      }

      if (v17 == (id)++v19)
      {
        id v17 = [v16 countByEnumeratingWithState:&v55 objects:v69 count:16];
        if (v17) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }

    unsigned __int8 v23 = (os_log_s *)IDSCopyIDForDevice(v20);

    if (!v23) {
      goto LABEL_34;
    }
    uint64_t v24 = JWEncodeDictionary(v13);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    id v48 = [v25 _CUTCopyGzippedData];
    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v27 = (__CFDictionary *)v26;
    if (value) {
      CFDictionarySetValue((CFMutableDictionaryRef)v26, IDSSendMessageOptionTimeoutKey, value);
    }
    uint64_t v28 = IDSGetUUIDData(v51);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if (v29) {
      CFDictionarySetValue(v27, IDSSendMessageOptionUUIDKey, v29);
    }

    CFDictionarySetValue(v27, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
    if (v14) {
      CFDictionarySetValue(v27, IDSSendMessageOptionQueueOneIdentifierKey, v14);
    }
    -[__CFDictionary addEntriesFromDictionary:](v27, "addEntriesFromDictionary:", v50);
    idsService = self->_idsService;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v23));
    id v53 = 0LL;
    id v54 = 0LL;
    unsigned int v32 = -[IDSService sendData:toDestinations:priority:options:identifier:error:]( idsService,  "sendData:toDestinations:priority:options:identifier:error:",  v48,  v31,  300LL,  v27,  &v54,  &v53);
    id v33 = v54;
    id v34 = v53;

    uint64_t v36 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v35);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v60 = v33;
      if (v32) {
        v38 = @"YES";
      }
      __int16 v61 = 2112;
      id v62 = v34;
      __int16 v63 = 2112;
      v64 = v27;
      __int16 v65 = 2112;
      id v66 = v13;
      __int16 v67 = 2112;
      v68 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Sending message to local account (identifier %@)  (error %@)  (options %@)  (messageDict %@) success: %@",  buf,  0x34u);
    }

    if (os_log_shim_legacy_logging_enabled()
      && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
    {
      v39 = @"NO";
      if (v32) {
        v39 = @"YES";
      }
      id v46 = v13;
      v47 = v39;
      id v44 = v34;
      v45 = v27;
      id v43 = v33;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Sending message to local account (identifier %@)  (error %@)  (options %@)  (messageDict %@) success: %@");
    }

    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing", v43, v44, v45, v46, v47));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v60 = v33;
      if (v32) {
        v41 = @"YES";
      }
      __int16 v61 = 2112;
      id v62 = v34;
      __int16 v63 = 2112;
      v64 = v27;
      __int16 v65 = 2112;
      id v66 = v13;
      __int16 v67 = 2112;
      v68 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Sending message to local account (identifier %@)  (error %@)  (options %@)  (messageDict %@) success: %@",  buf,  0x34u);
    }

    if (a8) {
      *a8 = v33;
    }
  }

  else
  {
LABEL_10:

LABEL_34:
    unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Couldn't find active device to send message",  buf,  2u);
    }

    LOBYTE(v32) = 0;
  }

  return v32;
}

- (BOOL)_sendIDSPairingMessage:(id)a3
{
  return -[IDSCredentialsDaemonIDSInterface _sendIDSPairingMessage:queueOneIdentifier:]( self,  "_sendIDSPairingMessage:queueOneIdentifier:",  a3,  0LL);
}

- (BOOL)_sendIDSPairingMessage:(id)a3 queueOneIdentifier:(id)a4
{
  double v6 = IDSMaxMessageTimeout;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  LOBYTE(self) = -[IDSCredentialsDaemonIDSInterface _sendIDSPairingMessage:timeOut:queueOneIdentifier:forcedIdentifier:]( self,  "_sendIDSPairingMessage:timeOut:queueOneIdentifier:forcedIdentifier:",  v8,  v9,  v7,  0LL);

  return (char)self;
}

- (BOOL)_sendIDSPairingMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v37 = a6;
  uint64_t v13 = JWEncodeDictionary(v10);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v14 _CUTCopyGzippedData];
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v17 = (__CFDictionary *)v16;
  if (v11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSSendMessageOptionTimeoutKey, v11);
  }
  uint64_t v18 = IDSGetUUIDData(v37);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19) {
    CFDictionarySetValue(v17, IDSSendMessageOptionUUIDKey, v19);
  }

  CFDictionarySetValue(v17, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
  if (v12) {
    CFDictionarySetValue(v17, IDSSendMessageOptionQueueOneIdentifierKey, v12);
  }
  idsService = self->_idsService;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice));
  id v38 = 0LL;
  id v39 = 0LL;
  unsigned int v22 = -[IDSService sendData:toDestinations:priority:options:identifier:error:]( idsService,  "sendData:toDestinations:priority:options:identifier:error:",  v15,  v21,  300LL,  v17,  &v39,  &v38);
  id v23 = v39;
  id v24 = v38;

  uint64_t v26 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v25);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v41 = v23;
    if (v22) {
      uint64_t v28 = @"YES";
    }
    __int16 v42 = 2112;
    id v43 = v24;
    __int16 v44 = 2112;
    id v45 = v10;
    __int16 v46 = 2112;
    v47 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Sending pairing message to local account (identifier %@)  (error %@)  (messageDict %@) success: %@",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled()
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    v29 = @"NO";
    if (v22) {
      v29 = @"YES";
    }
    id v35 = v10;
    uint64_t v36 = v29;
    id v33 = v23;
    id v34 = v24;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Sending pairing message to local account (identifier %@)  (error %@)  (messageDict %@) success: %@");
  }

  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing", v33, v34, v35, v36));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v41 = v23;
    if (v22) {
      v31 = @"YES";
    }
    __int16 v42 = 2112;
    id v43 = v24;
    __int16 v44 = 2112;
    id v45 = v10;
    __int16 v46 = 2112;
    v47 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Sending pairing message to local account (identifier %@)  (error %@)  (messageDict %@) success: %@",  buf,  0x2Au);
  }

  return v22;
}

- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 completionBlock:(id)a4 isPairing:(BOOL)a5
{
  return -[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:",  a3,  0LL,  a4,  a5);
}

- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 queueOneIdentifier:(id)a4 completionBlock:(id)a5 isPairing:(BOOL)a6
{
  BOOL v6 = a6;
  double v10 = IDSMaxMessageTimeout;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  LOBYTE(v6) = -[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:timeOut:queueOneIdentifier:forcedIdentifier:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:timeOut:queueOneIdentifier:forcedIdentifier:completionBlock:isPairing:",  v13,  v14,  v12,  0LL,  v11,  v6);

  return v6;
}

- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 timeOut:(id)a4 forcedIdentifier:(id)a5 completionBlock:(id)a6 isPairing:(BOOL)a7
{
  return -[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:timeOut:queueOneIdentifier:forcedIdentifier:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:timeOut:queueOneIdentifier:forcedIdentifier:completionBlock:isPairing:",  a3,  a4,  0LL,  a5,  a6,  a7);
}

- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6 completionBlock:(id)a7 isPairing:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_idsService, "accounts"));
  id v20 = [v19 count];

  if (!v20)
  {
    id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    if (v22) {
      CFDictionarySetValue((CFMutableDictionaryRef)v21, @"IDSQueuedMessageIsPairing", v22);
    }

    if (v14) {
      CFDictionarySetValue((CFMutableDictionaryRef)v21, @"IDSQueuedMessageRequest", v14);
    }
    if (v15) {
      CFDictionarySetValue((CFMutableDictionaryRef)v21, @"IDSQueuedMessageTimeout", v15);
    }
    if (v16) {
      CFDictionarySetValue((CFMutableDictionaryRef)v21, @"IDSQueuedMessageQueueOneIdentifier", v16);
    }
    if (v17) {
      CFDictionarySetValue((CFMutableDictionaryRef)v21, @"IDSQueuedMessageForceIdentifier", v17);
    }
    id v23 = objc_retainBlock(v18);
    if (v23) {
      CFDictionarySetValue((CFMutableDictionaryRef)v21, @"IDSQueuedMessageCompletionBlock", v23);
    }

    -[NSMutableArray addObject:](self->_queuedMessages, "addObject:", v21);
  }

  return v20 == 0LL;
}

- (void)forwardIPCRequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  int v9 = IMGetXPCIntFromDictionary(v6, "command");
  switch(v9)
  {
    case 9:
      -[IDSCredentialsDaemonIDSInterface _sendFetchIMFTRequestToIDS:withCompletionBlock:]( self,  "_sendFetchIMFTRequestToIDS:withCompletionBlock:",  v6,  v7);
      break;
    case 11:
      -[IDSCredentialsDaemonIDSInterface _sendIDSLocalDeviceInfoRequestToIDS:withCompletionBlock:]( self,  "_sendIDSLocalDeviceInfoRequestToIDS:withCompletionBlock:",  v6,  v7);
      break;
    case 13:
      -[IDSCredentialsDaemonIDSInterface _sendIDStatusQueryRequestToIDS:withCompletionBlock:]( self,  "_sendIDStatusQueryRequestToIDS:withCompletionBlock:",  v6,  v7);
      break;
    case 15:
      -[IDSCredentialsDaemonIDSInterface _sendAccountSyncMessageToIDS:withCompletionBlock:]( self,  "_sendAccountSyncMessageToIDS:withCompletionBlock:",  v6,  v7);
      break;
    case 17:
      -[IDSCredentialsDaemonIDSInterface _sendFetchRARequestToIDS:withCompletionBlock:]( self,  "_sendFetchRARequestToIDS:withCompletionBlock:",  v6,  v7);
      break;
    default:
      uint64_t v10 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v8);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v13 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Could not forward command %d to IDS",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled()
        && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Could not forward command %d to IDS");
      }

      break;
  }
}

- (void)_handleFetchFaceTimeAndiMessageInfoMessage:(id)a3
{
  v31 = (NSMutableDictionary *)a3;
  uint64_t v4 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received fetch iMessage info message: %@",  buf,  0xCu);
  }

  if (((uint64_t (*)(void))os_log_shim_legacy_logging_enabled)()
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    v29 = v31;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Received fetch iMessage info message: %@");
  }

  uint64_t v7 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Fetching All Accounts that support AccountSync: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v9)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    v29 = v31;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Fetching All Accounts that support AccountSync: %@");
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  id v11 = (const void *)IDSRemoteCredentialKeyUniqueID;
  id v12 = sub_1000059A0(v10, v31, IDSRemoteCredentialKeyUniqueID);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyCommand, &off_1000112C0);
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v14, v11, v13);
  }
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v16 = objc_alloc(&OBJC_CLASS___IDSAccountController);
  id v17 = [v16 initWithService:IDSServiceNameiMessage];
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 enabledAccounts]);
  uint64_t v19 = 0LL;
  id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      unsigned int v22 = 0LL;
      id v23 = v19;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v17,  "accountWithUniqueID:",  *(void *)(*((void *)&v32 + 1) + 8 * (void)v22),  v29));

        id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 accountInfo]);
        -[NSMutableArray addObject:](v15, "addObject:", v24);

        unsigned int v22 = (char *)v22 + 1;
        id v23 = v19;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v20);
  }

  if (v15) {
    CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyiMessageAccountInfo, v15);
  }
  uint64_t v26 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v25);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending iMessage account info %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v28)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    v29 = v14;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Sending iMessage account info %@");
  }

  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:",  v14,  0LL,  0LL,  v29)) {
    -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:](self, "_sendIDSMessage:", v14);
  }
}

- (void)_handleFetchFaceTimeAndiMessageInfoMessageResponse:(id)a3
{
  id v4 = a3;
  uint64_t v6 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received fetch FaceTime and iMessage info response message: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    id v18 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Received fetch FaceTime and iMessage info response message: %@");
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  id v10 = sub_1000059A0(v9, v4, IDSRemoteCredentialKeyUniqueID);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (![v11 length])
  {
    uint64_t v13 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No unique ID in message, ignoring response...",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"No unique ID in message, ignoring response...");
    }
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:](self, "_blockForMessageIdentifier:", v11, v18));
  id v17 = (void *)v16;
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v16 + 16))(v16, 10LL, v4, 1LL);
    -[IDSCredentialsDaemonIDSInterface _removeMessageInfo:](self, "_removeMessageInfo:", v11);
    -[IDSCredentialsDaemonIDSInterface _removeMessageIdentifierMappingWithCredentialUniqueID:]( self,  "_removeMessageIdentifierMappingWithCredentialUniqueID:",  v11);
  }
}

- (void)_handleFetchRAMessage:(id)a3
{
  id v4 = a3;
  uint64_t v6 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received fetch Remote Accounts Message: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    id v22 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Received fetch Remote Accounts Message: %@");
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_arrayForKey:", @"serviceTypes", v22));
  uint64_t v11 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Fetching All Accounts Passed In: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v13)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    id v23 = v9;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Fetching All Accounts Passed In: %@");
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v15 = (const void *)IDSRemoteCredentialKeyUniqueID;
  id v16 = sub_1000059A0(v14, v4, IDSRemoteCredentialKeyUniqueID);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSRemoteCredentialKeyCommand, &off_1000112D8);
  if (v17) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, v15, v17);
  }
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync", v23));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Local setup - received incoming RA Request message",  buf,  2u);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairedDeviceManager sharedInstance](&OBJC_CLASS___IDSPairedDeviceManager, "sharedInstance"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100005F90;
  v24[3] = &unk_100010658;
  uint64_t v25 = v18;
  uint64_t v26 = self;
  uint64_t v21 = v18;
  [v20 constructRAResponseDictionary:v9 completionHandler:v24];
}

- (void)_handleFetchRAMessageResponse:(id)a3
{
  id v4 = a3;
  uint64_t v6 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received fetch remote account response message: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    id v18 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Received fetch remote account response message: %@");
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  id v10 = sub_1000059A0(v9, v4, IDSRemoteCredentialKeyUniqueID);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (![v11 length])
  {
    uint64_t v13 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No unique ID in message, ignoring response...",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"No unique ID in message, ignoring response...");
    }
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:](self, "_blockForMessageIdentifier:", v11, v18));
  id v17 = (void *)v16;
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v16 + 16))(v16, 18LL, v4, 1LL);
    -[IDSCredentialsDaemonIDSInterface _removeMessageInfo:](self, "_removeMessageInfo:", v11);
    -[IDSCredentialsDaemonIDSInterface _removeMessageIdentifierMappingWithCredentialUniqueID:]( self,  "_removeMessageIdentifierMappingWithCredentialUniqueID:",  v11);
  }
}

- (void)_handleSendIDSLocalDeviceInfoRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Asked to provide my device info to remote device",  buf,  2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairedDeviceManager sharedInstance](&OBJC_CLASS___IDSPairedDeviceManager, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000063A8;
  v8[3] = &unk_100010658;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 getLocalDeviceInfoWithCompletionBlock:v8 queue:&_dispatch_main_q];
}

- (void)_handleSendIDSLocalDeviceInfoResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received remote device info: %@", buf, 0xCu);
  }

  uint64_t v6 = IDSRemoteCredentialKeyEncryptionKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteCredentialKeyEncryptionKey]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  v49 = self;
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v6]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v9));
LABEL_7:
    uint64_t v12 = (void *)v10;
    goto LABEL_9;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v6]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 objectForKey:v6]);
    goto LABEL_7;
  }

  uint64_t v12 = 0LL;
LABEL_9:

  uint64_t v13 = IDSRemoteCredentialKeyEncryptionClassAKey;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteCredentialKeyEncryptionClassAKey]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v13]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v16));
LABEL_13:
    id v51 = (void *)v17;
    goto LABEL_15;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v13]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 objectForKey:v13]);
    goto LABEL_13;
  }

  id v51 = 0LL;
LABEL_15:

  uint64_t v19 = IDSRemoteCredentialKeyEncryptionClassCKey;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteCredentialKeyEncryptionClassCKey]);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v19]);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v22));
LABEL_19:
    uint64_t v25 = (void *)v23;
    goto LABEL_21;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v19]);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 objectForKey:v19]);
    goto LABEL_19;
  }

  uint64_t v25 = 0LL;
LABEL_21:

  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
  id v27 = sub_1000059A0(v26, v4, IDSRemoteCredentialKeyIdentifier);
  uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
  uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v30 = sub_1000059A0(v29, v4, IDSRemoteCredentialKeyPrivateDeviceData);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
  id v33 = sub_1000059A0(v32, v4, IDSRemoteCredentialKeyDeviceName);
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString);
  id v36 = sub_1000059A0(v35, v4, IDSRemoteCredentialKeyHardwareVersion);
  id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  id v38 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v39 = v25;
  id v48 = v25;
  id v50 = v12;
  v40 = (void *)v28;
  id v41 = -[NSDictionary initWithObjectsAndKeys:]( v38,  "initWithObjectsAndKeys:",  v28,  IDSDevicePropertyIdentifier,  v12,  IDSDevicePropertyEncryptionKey,  v51,  IDSDevicePropertyEncryptionClassAKey,  v48,  IDSDevicePropertyEncryptionClassCKey,  v31,  IDSDevicePropertyPrivateDeviceData,  v34,  IDSDevicePropertyName,  v37,  IDSDevicePropertyHardwareVersion,  0LL);
  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairedDeviceManager sharedInstance](&OBJC_CLASS___IDSPairedDeviceManager, "sharedInstance"));
  [v42 setPairedDeviceInfo:v41];

  uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString);
  id v44 = sub_1000059A0(v43, v4, IDSRemoteCredentialKeyUniqueID);
  id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  uint64_t v46 = objc_claimAutoreleasedReturnValue(-[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:](v49, "_blockForMessageIdentifier:", v45));
  v47 = (void *)v46;
  if (v46)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v46 + 16))(v46, 12LL, v4, 1LL);
    -[IDSCredentialsDaemonIDSInterface _removeMessageInfo:](v49, "_removeMessageInfo:", v45);
    -[IDSCredentialsDaemonIDSInterface _removeMessageIdentifierMappingWithCredentialUniqueID:]( v49,  "_removeMessageIdentifierMappingWithCredentialUniqueID:",  v45);
  }
}

- (void)_handleSendIDSIDLocalIDQuery:(id)a3
{
  id v4 = a3;
  uint64_t v6 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received IDs V2 Query Request message: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    id v31 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Received IDs V2 Query Request message: %@");
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_arrayForKey:", IDSRemoteCredentialKeyIDs, v31));
  uint64_t v10 = (const void *)IDSRemoteCredentialKeyService;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 _stringForKey:IDSRemoteCredentialKeyService]);
  uint64_t v13 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "RUNNING REMOTE ID QUERY V2 WITH IDs: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v15)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    uint64_t v32 = v9;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"RUNNING REMOTE ID QUERY V2 WITH IDs: %@");
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](&OBJC_CLASS___IDSIDQueryController, "sharedInstance", v32));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 _refreshIDStatusForDestinations:v9 service:v11 listenerID:@"__kIDSCredentialsProxyIDSQueryControllerListenerID"]);

  uint64_t v19 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Remote ID Status V2 Query has completed with the following results: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v21)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    id v33 = v17;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Remote ID Status V2 Query has completed with the following results: %@");
  }

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v23 = (const void *)IDSRemoteCredentialKeyUniqueID;
  id v24 = sub_1000059A0(v22, v4, IDSRemoteCredentialKeyUniqueID);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v26, IDSRemoteCredentialKeyCommand, &off_100011308);
  if (v25) {
    CFDictionarySetValue((CFMutableDictionaryRef)v26, v23, v25);
  }
  if (v11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v26, v10, v11);
  }
  if (v17) {
    CFDictionarySetValue((CFMutableDictionaryRef)v26, IDSRemoteCredentialKeyIdStatusUpdates, v17);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v26, IDSRemoteCredentialKeySuccess, &__kCFBooleanTrue);
  uint64_t v28 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v27);
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Remote IDs Query V2 - Sending results over IDS",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v30)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Remote IDs Query V2 - Sending results over IDS");
  }

  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:",  v26,  0LL,  0LL,  v33)) {
    -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:](self, "_sendIDSMessage:", v26);
  }
}

- (void)_handleSendIDSIDLocalIDQueryResponse:(id)a3
{
  id v4 = a3;
  uint64_t v6 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received ID Query response message V2 : %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Received ID Query response message V2 : %@");
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  id v10 = sub_1000059A0(v9, v4, IDSRemoteCredentialKeyUniqueID);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:](self, "_blockForMessageIdentifier:", v11));
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v12 + 16))(v12, 14LL, v4, 1LL);
    -[IDSCredentialsDaemonIDSInterface _removeMessageInfo:](self, "_removeMessageInfo:", v11);
    -[IDSCredentialsDaemonIDSInterface _removeMessageIdentifierMappingWithCredentialUniqueID:]( self,  "_removeMessageIdentifierMappingWithCredentialUniqueID:",  v11);
  }
}

- (void)_handleIncomingAccountSyncMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v4));
    int v15 = 138412290;
    uint64_t v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received incoming account sync message %@",  (uint8_t *)&v15,  0xCu);
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v8 = sub_1000059A0(v7, v4, IDSRemoteCredentialKeySyncPayload);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  IDSIncomingAccountSyncMessage();
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v11 = (const void *)IDSRemoteCredentialKeyUniqueID;
  id v12 = sub_1000059A0(v10, v4, IDSRemoteCredentialKeyUniqueID);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyCommand, &off_100011320);
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v14, v11, v13);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeySuccess, &__kCFBooleanTrue);
  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:]( self,  "_storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:",  v14,  0LL,  0LL)) {
    -[IDSCredentialsDaemonIDSInterface _sendIDSMessage:](self, "_sendIDSMessage:", v14);
  }
}

- (void)_handleIncomingAccountSyncMessageResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v4));
    int v12 = 138412290;
    uint64_t v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received incoming account sync message response %@",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  id v8 = sub_1000059A0(v7, v4, IDSRemoteCredentialKeyUniqueID);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:](self, "_blockForMessageIdentifier:", v9));
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v10 + 16))(v10, 16LL, v4, 1LL);
    -[IDSCredentialsDaemonIDSInterface _removeMessageInfo:](self, "_removeMessageInfo:", v9);
    -[IDSCredentialsDaemonIDSInterface _removeMessageIdentifierMappingWithCredentialUniqueID:]( self,  "_removeMessageIdentifierMappingWithCredentialUniqueID:",  v9);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v18 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2112;
    id v45 = v15;
    __int16 v46 = 2112;
    id v47 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "incomingData on service %@, account %@ data %@ fromID %@ context %@",  buf,  0x34u);
  }

  if (os_log_shim_legacy_logging_enabled(v20)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    id v36 = v15;
    id v37 = v16;
    id v34 = v13;
    id v35 = v14;
    id v33 = v12;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"incomingData on service %@, account %@ data %@ fromID %@ context %@");
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_CUTOptionallyDecompressData", v33, v34, v35, v36, v37));
  uint64_t v22 = JWDecodeDictionary();
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:IDSRemoteCredentialKeyCommand]);
  unsigned int v25 = [v24 unsignedIntValue];

  switch(v25)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      uint64_t v27 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v26);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Received deprecated IDSRemoteCredential command -- ignoring { command: %u }",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v29)
        && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Received deprecated IDSRemoteCredential command -- ignoring { command: %u }");
      }

      break;
    case 9u:
      -[IDSCredentialsDaemonIDSInterface _handleFetchFaceTimeAndiMessageInfoMessage:]( self,  "_handleFetchFaceTimeAndiMessageInfoMessage:",  v23);
      break;
    case 0xAu:
      -[IDSCredentialsDaemonIDSInterface _handleFetchFaceTimeAndiMessageInfoMessageResponse:]( self,  "_handleFetchFaceTimeAndiMessageInfoMessageResponse:",  v23);
      break;
    case 0xBu:
      -[IDSCredentialsDaemonIDSInterface _handleSendIDSLocalDeviceInfoRequest:]( self,  "_handleSendIDSLocalDeviceInfoRequest:",  v23);
      break;
    case 0xCu:
      -[IDSCredentialsDaemonIDSInterface _handleSendIDSLocalDeviceInfoResponse:]( self,  "_handleSendIDSLocalDeviceInfoResponse:",  v23);
      break;
    case 0xDu:
      -[IDSCredentialsDaemonIDSInterface _handleSendIDSIDLocalIDQuery:](self, "_handleSendIDSIDLocalIDQuery:", v23);
      break;
    case 0xEu:
      -[IDSCredentialsDaemonIDSInterface _handleSendIDSIDLocalIDQueryResponse:]( self,  "_handleSendIDSIDLocalIDQueryResponse:",  v23);
      break;
    case 0xFu:
      -[IDSCredentialsDaemonIDSInterface _handleIncomingAccountSyncMessage:]( self,  "_handleIncomingAccountSyncMessage:",  v23);
      break;
    case 0x10u:
      -[IDSCredentialsDaemonIDSInterface _handleIncomingAccountSyncMessageResponse:]( self,  "_handleIncomingAccountSyncMessageResponse:",  v23);
      break;
    case 0x11u:
      -[IDSCredentialsDaemonIDSInterface _handleFetchRAMessage:](self, "_handleFetchRAMessage:", v23);
      break;
    case 0x12u:
      -[IDSCredentialsDaemonIDSInterface _handleFetchRAMessageResponse:](self, "_handleFetchRAMessageResponse:", v23);
      break;
    default:
      uint64_t v30 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v26);
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Unknown incoming IDS message with command %d, ignoring...",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v32)
        && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Unknown incoming IDS message with command %d, ignoring...");
      }

      break;
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v17 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v39 = v14;
    __int16 v40 = 2112;
    if (v8) {
      uint64_t v19 = @"YES";
    }
    id v41 = v19;
    __int16 v42 = 2112;
    id v43 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Sent message with identifier %@ success %@ error %@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v20)
    && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
  {
    uint64_t v21 = @"NO";
    if (v8) {
      uint64_t v21 = @"YES";
    }
    id v36 = v21;
    id v37 = v15;
    id v35 = v14;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Sent message with identifier %@ success %@ error %@");
  }

  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing", v35, v36, v37));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      uint64_t v23 = @"YES";
    }
    else {
      uint64_t v23 = @"NO";
    }
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMOrderedMutableDictionary orderedObjects](self->_uniqueIDToInfo, "orderedObjects"));
    *(_DWORD *)buf = 138413058;
    id v39 = v14;
    __int16 v40 = 2112;
    id v41 = v23;
    __int16 v42 = 2112;
    id v43 = v15;
    __int16 v44 = 2112;
    id v45 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Sent message with identifier %@ success %@ error %@. Messages still in the queue: %@",  buf,  0x2Au);
  }

  if (!v8)
  {
    uint64_t v26 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v25);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to send IDS message", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v28)
      && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Failed to send IDS message");
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCredentialsDaemonIDSInterface _credentialUniqueIDFromMessageIdentifier:]( self,  "_credentialUniqueIDFromMessageIdentifier:",  v14));
    id v31 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:]( self,  "_blockForMessageIdentifier:",  v29));
    if (v31)
    {
      uint64_t v32 = OSLogHandleForIDSCategory("IDSCredentialsDaemonIDSInterface", v30);
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Found original completion block for this message",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v34)
        && _IDSShouldLog(0LL, @"IDSCredentialsDaemonIDSInterface"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSCredentialsDaemonIDSInterface",  @"Found original completion block for this message");
      }

      v31[2](v31, 0LL, 0LL, 0LL);
      -[IDSCredentialsDaemonIDSInterface _removeMessageInfo:](self, "_removeMessageInfo:", v29);
    }

    -[IDSCredentialsDaemonIDSInterface _removeMessageIdentifierMapping:](self, "_removeMessageIdentifierMapping:", v14);
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  queuedMessages = self->_queuedMessages;
  uint64_t v6 = (void (**)(void))a5;
  -[NSMutableArray removeAllObjects](queuedMessages, "removeAllObjects");
  v6[2]();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (objc_msgSend(a4, "count", a3))
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    obj = self->_queuedMessages;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    if (!v5) {
      goto LABEL_15;
    }
    id v6 = v5;
    uint64_t v25 = *(void *)v27;
    while (1)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        id v10 = sub_1000059A0(v9, v8, @"IDSQueuedMessageRequest");
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
        id v13 = sub_1000059A0(v12, v8, @"IDSQueuedMessageTimeout");
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
        id v16 = sub_1000059A0(v15, v8, @"IDSQueuedMessageQueueOneIdentifier");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
        id v19 = sub_1000059A0(v18, v8, @"IDSQueuedMessageForceIdentifier");
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        uint64_t v21 = (void (**)(void))objc_claimAutoreleasedReturnValue( [v8 objectForKey:@"IDSQueuedMessageCompletionBlock"]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"IDSQueuedMessageIsPairing"]);
        unsigned int v23 = [v22 BOOLValue];

        if (v23)
        {
          if (-[IDSCredentialsDaemonIDSInterface _sendIDSPairingMessage:timeOut:queueOneIdentifier:forcedIdentifier:]( self,  "_sendIDSPairingMessage:timeOut:queueOneIdentifier:forcedIdentifier:",  v11,  v14,  v17,  v20))
          {
            goto LABEL_13;
          }
        }

        else if (-[IDSCredentialsDaemonIDSInterface _sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:]( self,  "_sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:",  v11,  v14,  v17,  v20))
        {
          goto LABEL_13;
        }

        if (v21) {
          v21[2](v21);
        }
LABEL_13:
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      if (!v6)
      {
LABEL_15:

        break;
      }
    }
  }

  -[NSMutableArray removeAllObjects](self->_queuedMessages, "removeAllObjects");
}

- (void)_addMessageInfo:(id)a3 description:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v12 = objc_retainBlock(v9);

  if (v12)
  {
    CFDictionarySetValue(Mutable, @"block", v12);
  }

  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_10000A880(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  id v21 = v8;
  if (v21)
  {
    CFDictionarySetValue(Mutable, @"description", v21);
  }

  else
  {
    BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v22) {
      sub_10000A7F8(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }

  -[IMOrderedMutableDictionary setOrderedObject:forKey:]( self->_uniqueIDToInfo,  "setOrderedObject:forKey:",  Mutable,  v10);
}

- (void)_removeMessageInfo:(id)a3
{
}

- (void)_mapMessageIdentifier:(id)a3 toCredentialUniqueID:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setObject:forKey:](self->_credentialIDByMessageID, "setObject:forKey:", a4, a3);
    }
  }

- (void)_removeMessageIdentifierMapping:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_credentialIDByMessageID, "removeObjectForKey:");
  }
}

- (void)_removeMessageIdentifierMappingWithCredentialUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = self->_credentialIDByMessageID;
    id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
LABEL_4:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_credentialIDByMessageID,  "objectForKeyedSubscript:",  v10,  (void)v14));
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if ((v12 & 1) != 0) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }

      BOOL v13 = v10;

      if (!v13) {
        goto LABEL_14;
      }
      -[IDSCredentialsDaemonIDSInterface _removeMessageIdentifierMapping:]( self,  "_removeMessageIdentifierMapping:",  v13);
      id v5 = v13;
    }

- (id)_credentialUniqueIDFromMessageIdentifier:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_credentialIDByMessageID,  "objectForKeyedSubscript:"));
  }
  else {
    return 0LL;
  }
}

- (NSMutableArray)queuedMessages
{
  return self->_queuedMessages;
}

- (void)setQueuedMessages:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end