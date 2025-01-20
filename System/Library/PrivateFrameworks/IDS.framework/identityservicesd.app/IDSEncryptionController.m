@interface IDSEncryptionController
+ (IDSEncryptionController)sharedInstance;
- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 theirURI:(id)a5 theirPushToken:(id)a6 service:(id)a7;
- (BOOL)publicKeyVerifySignedData:(id)a3 matchesData:(id)a4 forSignatureType:(int64_t)a5 endpoint:(id)a6 priority:(int64_t)a7 error:(id *)a8;
- (BOOL)publicKeyVerifySignedData:(id)a3 matchesData:(id)a4 forSignatureType:(int64_t)a5 endpoint:(id)a6 withKeyType:(unsigned int)a7 keyDiversifier:(id)a8 priority:(int64_t)a9 error:(id *)a10;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSEncryptionController)init;
- (IDSEncryptionController)initWithPeerIDManager:(id)a3 registrationKeyManager:(id)a4 OTRController:(id)a5 publicKeyStorage:(id)a6 accountController:(id)a7 serviceController:(id)a8 queueManager:(id)a9 failedTokenCache:(id)a10;
- (IDSEncryptionQueueManager)queueManager;
- (IDSOTRController)OTRController;
- (IDSPeerIDManager)peerIDManager;
- (IDSPublicKeyStorage)publicKeyStorage;
- (IDSRateLimiter)failedTokenCache;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)OTRDecryptData:(id)a3 OTRToken:(id)a4 priority:(int64_t)a5 error:(int64_t *)a6;
- (id)OTREncryptData:(id)a3 OTRToken:(id)a4 priority:(int64_t)a5 error:(int64_t *)a6;
- (id)_builderAvoidMainQueue:(BOOL)a3 forceEncryptionType:(int64_t)a4;
- (id)legacyPublicKeyDecryptData:(id)a3 toDeviceID:(id)a4 priority:(int64_t)a5 error:(id *)a6;
- (id)legacyPublicKeyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 toDeviceID:(id)a5 priority:(int64_t)a6 error:(id *)a7;
- (id)legacyPublicKeyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 toEndpoint:(id)a5 priority:(int64_t)a6 error:(id *)a7;
- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 toEndpoint:(id)a5 priority:(int64_t)a6 error:(id *)a7;
- (id)publicKeyBatchSignDatas:(id)a3 withSignatureType:(int64_t)a4 keyType:(unsigned int)a5 keyDiversifier:(id)a6 service:(id)a7 priority:(int64_t)a8 error:(id *)a9;
- (id)publicKeyBatchSignDatas:(id)a3 withSignatureType:(int64_t)a4 service:(id)a5 priority:(int64_t)a6 error:(id *)a7;
- (id)publicKeyDecryptData:(id)a3 fromEndpoint:(id)a4 pkType:(int64_t)a5 priority:(int64_t)a6 error:(id *)a7;
- (id)publicKeyEncryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 toEndpoint:(id)a8 usedEncryptionType:(int64_t *)a9 priority:(int64_t)a10 metadata:(id *)a11 error:(id *)a12;
- (id)publicKeySignData:(id)a3 withSignatureType:(int64_t)a4 keyType:(unsigned int)a5 keyDiversifier:(id)a6 service:(id)a7 priority:(int64_t)a8 error:(id *)a9;
- (id)publicKeySignData:(id)a3 withSignatureType:(int64_t)a4 service:(id)a5 priority:(int64_t)a6 error:(id *)a7;
- (void)_decryptData:(id)a3 decryptionContext:(id)a4 encrypter:(id)a5 pkType:(int64_t)a6 isRetry:(BOOL)a7 priority:(int64_t)a8 replayKey:(id)a9 completion:(id)a10;
- (void)_decryptData:(id)a3 encrypter:(id)a4 pkType:(int64_t)a5 isRetry:(BOOL)a6 priority:(int64_t)a7 replayKey:(id)a8 completion:(id)a9;
- (void)_legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 encrypter:(id)a5 priority:(int64_t)a6 completion:(id)a7;
- (void)legacyPublicKeyDecryptData:(id)a3 fromURI:(id)a4 identity:(id)a5 toURI:(id)a6 pushToken:(id)a7 service:(id)a8 priority:(int64_t)a9 isRetry:(BOOL)a10 replayKey:(id)a11 completionBlock:(id)a12 avoidMainQueue:(BOOL)a13;
- (void)legacyPublicKeyDecryptData:(id)a3 toDeviceID:(id)a4 priority:(int64_t)a5 completionBlock:(id)a6;
- (void)legacyPublicKeyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 fromURI:(id)a5 identity:(id)a6 toURI:(id)a7 pushToken:(id)a8 service:(id)a9 priority:(int64_t)a10 completionBlock:(id)a11 avoidMainQueue:(BOOL)a12;
- (void)legacyPublicKeyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 toDeviceID:(id)a5 priority:(int64_t)a6 completionBlock:(id)a7;
- (void)logEncryptionErrorForToken:(id)a3 deviceID:(id)a4 forURI:(id)a5 fromURI:(id)a6 forService:(id)a7 messageData:(id)a8 type:(int64_t)a9;
- (void)logRemoteDecryptionErrorForToken:(id)a3 deviceID:(id)a4 forURI:(id)a5 fromURI:(id)a6 forService:(id)a7 messageData:(id)a8 type:(int64_t)a9;
- (void)performAsyncBlock:(id)a3 priority:(int64_t)a4;
- (void)performSyncBlock:(id)a3 priority:(int64_t)a4;
- (void)publicKeyDecryptData:(id)a3 decryptionContext:(id)a4 identity:(id)a5 service:(id)a6 priority:(int64_t)a7 isRetry:(BOOL)a8 replayKey:(id)a9 publicKeyType:(int64_t)a10 completionBlock:(id)a11 avoidMainQueue:(BOOL)a12;
- (void)publicKeyDecryptData:(id)a3 fromEndpoint:(id)a4 pkType:(int64_t)a5 priority:(int64_t)a6 replayKey:(id)a7 completionBlock:(id)a8;
- (void)publicKeyVerifySignedData:(id)a3 matchesData:(id)a4 forSignatureType:(int64_t)a5 identity:(id)a6 forURI:(id)a7 pushToken:(id)a8 service:(id)a9 localURI:(id)a10 priority:(int64_t)a11 completion:(id)a12 avoidMainQueue:(BOOL)a13;
- (void)publicKeyVerifySignedData:(id)a3 matchesData:(id)a4 forSignatureType:(int64_t)a5 identity:(id)a6 toURI:(id)a7 pushToken:(id)a8 service:(id)a9 localURI:(id)a10 withKeyType:(unsigned int)a11 keyDiversifier:(id)a12 priority:(int64_t)a13 completion:(id)a14 avoidMainQueue:(BOOL)a15;
- (void)setAccountController:(id)a3;
- (void)setFailedTokenCache:(id)a3;
- (void)setOTRController:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setPublicKeyStorage:(id)a3;
- (void)setQueueManager:(id)a3;
- (void)setRegistrationKeyManager:(id)a3;
- (void)setServiceController:(id)a3;
@end

@implementation IDSEncryptionController

+ (IDSEncryptionController)sharedInstance
{
  if (qword_1009C08B8 != -1) {
    dispatch_once(&qword_1009C08B8, &stru_1008FF908);
  }
  return (IDSEncryptionController *)(id)qword_1009C08C0;
}

- (IDSEncryptionController)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___IDSEncryptionQueueManager);
  v4 = objc_alloc(&OBJC_CLASS___IDSRateLimiter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"neg-token-fail-limit"]);

  if (v6) {
    uint64_t v7 = (uint64_t)[v6 integerValue];
  }
  else {
    uint64_t v7 = 6LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"neg-token-time-limit"]);

  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }

  else
  {
    double v11 = 300.0;
  }

  v12 = -[IDSRateLimiter initWithLimit:timeLimit:](v4, "initWithLimit:timeLimit:", v7, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPublicKeyStorage sharedInstance](&OBJC_CLASS___IDSPublicKeyStorage, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v19 = -[IDSEncryptionController initWithPeerIDManager:registrationKeyManager:OTRController:publicKeyStorage:accountController:serviceController:queueManager:failedTokenCache:]( self,  "initWithPeerIDManager:registrationKeyManager:OTRController:publicKeyStorage:accountController:serviceControlle r:queueManager:failedTokenCache:",  v13,  v14,  v15,  v16,  v17,  v18,  v3,  v12);

  return v19;
}

- (IDSEncryptionController)initWithPeerIDManager:(id)a3 registrationKeyManager:(id)a4 OTRController:(id)a5 publicKeyStorage:(id)a6 accountController:(id)a7 serviceController:(id)a8 queueManager:(id)a9 failedTokenCache:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSEncryptionController;
  v18 = -[IDSEncryptionController init](&v28, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerIDManager, a3);
    objc_storeStrong((id *)&v19->_registrationKeyManager, a4);
    objc_storeStrong((id *)&v19->_OTRController, a5);
    objc_storeStrong((id *)&v19->_publicKeyStorage, a6);
    objc_storeStrong((id *)&v19->_accountController, a7);
    objc_storeStrong((id *)&v19->_serviceController, a8);
    objc_storeStrong((id *)&v19->_queueManager, a9);
    objc_storeStrong((id *)&v19->_failedTokenCache, a10);
  }

  return v19;
}

- (id)publicKeyEncryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 toEndpoint:(id)a8 usedEncryptionType:(int64_t *)a9 priority:(int64_t)a10 metadata:(id *)a11 error:(id *)a12
{
  BOOL v26 = a5;
  BOOL v27 = a6;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  -1LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 encrypterWithEndpoint:v16]);

  id v28 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](self->_queueManager, "syncQueueForPriority:", a10));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( [v21 encryptData:v19 encryptionContext:v18 forceSizeOptimizations:v26 resetState:v27 withEncryptedAttributes:v17 usedIdentifi er:&v28 onQueue:v22 metadata:a11 error:a12]);

  id v24 = v28;
  if (a9) {
    *a9 = sub_1002B2050(v24);
  }

  return v23;
}

- (id)legacyPublicKeyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 toEndpoint:(id)a5 priority:(int64_t)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  1LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 encrypterWithEndpoint:v12]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](self->_queueManager, "syncQueueForPriority:", a6));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 legacyEncryptData:v14 withEncryptedAttributes:v13 onQueue:v17 error:a7]);

  return v18;
}

- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 toEndpoint:(id)a5 priority:(int64_t)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  6LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 encrypterWithEndpoint:v12]);

  uint64_t v20 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](self->_queueManager, "syncQueueForPriority:", a6));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( [v16 encryptData:v14 encryptionContext:v13 forceSizeOptimizations:0 resetState:0 withEncryptedAttributes:0 usedIdentifi er:&v20 onQueue:v17 metadata:0 error:a7]);

  return v18;
}

- (id)publicKeyDecryptData:(id)a3 fromEndpoint:(id)a4 pkType:(int64_t)a5 priority:(int64_t)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  -1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 encrypterWithEndpoint:v12]);

  id v16 = sub_1002B2834(a5);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](self->_queueManager, "syncQueueForPriority:", a6));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 decryptData:v13 usingIdentifier:v17 isRetry:0 onQueue:v18 error:a7]);

  return v19;
}

- (void)publicKeyDecryptData:(id)a3 fromEndpoint:(id)a4 pkType:(int64_t)a5 priority:(int64_t)a6 replayKey:(id)a7 completionBlock:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  -1LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 encrypterWithEndpoint:v14]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1002B2998;
  v22[3] = &unk_1008FF930;
  id v23 = v14;
  id v24 = v15;
  id v20 = v14;
  id v21 = v15;
  -[IDSEncryptionController _decryptData:encrypter:pkType:isRetry:priority:replayKey:completion:]( self,  "_decryptData:encrypter:pkType:isRetry:priority:replayKey:completion:",  v17,  v19,  a5,  0LL,  a6,  v16,  v22);
}

- (void)legacyPublicKeyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 fromURI:(id)a5 identity:(id)a6 toURI:(id)a7 pushToken:(id)a8 service:(id)a9 priority:(int64_t)a10 completionBlock:(id)a11 avoidMainQueue:(BOOL)a12
{
  id v18 = a8;
  id v29 = a11;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  a12,  1LL));
  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 encrypterWithLocalURI:v22 remoteURI:v20 pushToken:v18 service:v19 cert:v21]);

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1002B2BC4;
  v30[3] = &unk_1008FF958;
  id v31 = v18;
  id v32 = v29;
  id v27 = v18;
  id v28 = v29;
  -[IDSEncryptionController _legacyEncryptData:withEncryptedAttributes:encrypter:priority:completion:]( self,  "_legacyEncryptData:withEncryptedAttributes:encrypter:priority:completion:",  v24,  v23,  v26,  a10,  v30);
}

- (void)legacyPublicKeyDecryptData:(id)a3 fromURI:(id)a4 identity:(id)a5 toURI:(id)a6 pushToken:(id)a7 service:(id)a8 priority:(int64_t)a9 isRetry:(BOOL)a10 replayKey:(id)a11 completionBlock:(id)a12 avoidMainQueue:(BOOL)a13
{
  id v19 = a7;
  id v29 = a12;
  id v30 = a11;
  id v20 = a8;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  a13,  -1LL));
  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 encrypterWithLocalURI:v21 remoteURI:v23 pushToken:v19 service:v20 cert:v22]);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1002B2D74;
  v31[3] = &unk_1008FF930;
  id v32 = v19;
  id v33 = v29;
  id v27 = v19;
  id v28 = v29;
  -[IDSEncryptionController _decryptData:encrypter:pkType:isRetry:priority:replayKey:completion:]( self,  "_decryptData:encrypter:pkType:isRetry:priority:replayKey:completion:",  v24,  v26,  0LL,  a10,  a9,  v30,  v31);
}

- (void)publicKeyDecryptData:(id)a3 decryptionContext:(id)a4 identity:(id)a5 service:(id)a6 priority:(int64_t)a7 isRetry:(BOOL)a8 replayKey:(id)a9 publicKeyType:(int64_t)a10 completionBlock:(id)a11 avoidMainQueue:(BOOL)a12
{
  BOOL v31 = a8;
  id v16 = a4;
  id v17 = a11;
  id v30 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v29 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  a12,  -1LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 receivingURI]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 sendingURI]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 sendingPushToken]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 rawToken]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v29 encrypterWithLocalURI:v21 remoteURI:v22 pushToken:v24 service:v18 cert:v19]);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1002B2F64;
  v33[3] = &unk_1008FF930;
  id v34 = v16;
  id v35 = v17;
  id v26 = v16;
  id v27 = v17;
  -[IDSEncryptionController _decryptData:decryptionContext:encrypter:pkType:isRetry:priority:replayKey:completion:]( self,  "_decryptData:decryptionContext:encrypter:pkType:isRetry:priority:replayKey:completion:",  v20,  v26,  v25,  a10,  v31,  a7,  v30,  v33);
}

- (void)legacyPublicKeyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 toDeviceID:(id)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  1LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 encrypterWithDeviceID:v13]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1002B3128;
  v19[3] = &unk_1008FF980;
  id v20 = v12;
  id v18 = v12;
  -[IDSEncryptionController _legacyEncryptData:withEncryptedAttributes:encrypter:priority:completion:]( self,  "_legacyEncryptData:withEncryptedAttributes:encrypter:priority:completion:",  v15,  v14,  v17,  a6,  v19);
}

- (id)legacyPublicKeyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 toDeviceID:(id)a5 priority:(int64_t)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  1LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 encrypterWithDeviceID:v12]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](self->_queueManager, "syncQueueForPriority:", a6));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 legacyEncryptData:v14 withEncryptedAttributes:v13 onQueue:v17 error:a7]);

  return v18;
}

- (void)legacyPublicKeyDecryptData:(id)a3 toDeviceID:(id)a4 priority:(int64_t)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  1LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 encrypterWithDeviceID:v11]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002B3324;
  v16[3] = &unk_1008FF9A8;
  id v17 = v10;
  id v15 = v10;
  -[IDSEncryptionController _decryptData:encrypter:pkType:isRetry:priority:replayKey:completion:]( self,  "_decryptData:encrypter:pkType:isRetry:priority:replayKey:completion:",  v12,  v14,  0LL,  0LL,  a5,  0LL,  v16);
}

- (id)legacyPublicKeyDecryptData:(id)a3 toDeviceID:(id)a4 priority:(int64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  1LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 encrypterWithDeviceID:v10]);

  uint64_t v14 = IDSMPLegacyIdentityIdentifier;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](self->_queueManager, "syncQueueForPriority:", a5));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 decryptData:v11 usingIdentifier:v14 isRetry:0 onQueue:v15 error:a6]);

  return v16;
}

- (id)publicKeySignData:(id)a3 withSignatureType:(int64_t)a4 service:(id)a5 priority:(int64_t)a6 error:(id *)a7
{
  return -[IDSEncryptionController publicKeySignData:withSignatureType:keyType:keyDiversifier:service:priority:error:]( self,  "publicKeySignData:withSignatureType:keyType:keyDiversifier:service:priority:error:",  a3,  a4,  0LL,  0LL,  a5,  a6,  a7);
}

- (id)publicKeySignData:(id)a3 withSignatureType:(int64_t)a4 keyType:(unsigned int)a5 keyDiversifier:(id)a6 service:(id)a7 priority:(int64_t)a8 error:(id *)a9
{
  uint64_t v11 = *(void *)&a5;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  -1LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 signerWithKeyType:v11 keyDiversifier:v16 service:v15]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionController queueManager](self, "queueManager"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 syncQueueForPriority:a8]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 signData:v17 withType:a4 onQueue:v21 error:a9]);

  return v22;
}

- (id)publicKeyBatchSignDatas:(id)a3 withSignatureType:(int64_t)a4 service:(id)a5 priority:(int64_t)a6 error:(id *)a7
{
  return -[IDSEncryptionController publicKeyBatchSignDatas:withSignatureType:keyType:keyDiversifier:service:priority:error:]( self,  "publicKeyBatchSignDatas:withSignatureType:keyType:keyDiversifier:service:priority:error:",  a3,  a4,  0LL,  0LL,  a5,  a6,  a7);
}

- (id)publicKeyBatchSignDatas:(id)a3 withSignatureType:(int64_t)a4 keyType:(unsigned int)a5 keyDiversifier:(id)a6 service:(id)a7 priority:(int64_t)a8 error:(id *)a9
{
  uint64_t v11 = *(void *)&a5;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  -1LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 signerWithKeyType:v11 keyDiversifier:v16 service:v15]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionController queueManager](self, "queueManager"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 syncQueueForPriority:a8]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 batchSignDatas:v17 withType:a4 onQueue:v21 error:a9]);

  return v22;
}

- (void)publicKeyVerifySignedData:(id)a3 matchesData:(id)a4 forSignatureType:(int64_t)a5 identity:(id)a6 forURI:(id)a7 pushToken:(id)a8 service:(id)a9 localURI:(id)a10 priority:(int64_t)a11 completion:(id)a12 avoidMainQueue:(BOOL)a13
{
  LOBYTE(v14) = a13;
  LODWORD(v13) = 0;
  -[IDSEncryptionController publicKeyVerifySignedData:matchesData:forSignatureType:identity:toURI:pushToken:service:localURI:withKeyType:keyDiversifier:priority:completion:avoidMainQueue:]( self,  "publicKeyVerifySignedData:matchesData:forSignatureType:identity:toURI:pushToken:service:localURI:withKeyType:keyDive rsifier:priority:completion:avoidMainQueue:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  v13,  0LL,  a11,  a12,  v14);
}

- (void)publicKeyVerifySignedData:(id)a3 matchesData:(id)a4 forSignatureType:(int64_t)a5 identity:(id)a6 toURI:(id)a7 pushToken:(id)a8 service:(id)a9 localURI:(id)a10 withKeyType:(unsigned int)a11 keyDiversifier:(id)a12 priority:(int64_t)a13 completion:(id)a14 avoidMainQueue:(BOOL)a15
{
  id v33 = a14;
  id v21 = a12;
  id v22 = a10;
  id v23 = a9;
  id v24 = a8;
  id v25 = a7;
  id v26 = a6;
  id v27 = a4;
  id v28 = a3;
  id v32 = (id)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  a15,  -1LL));
  id v29 = (void *)objc_claimAutoreleasedReturnValue( [v32 verifierWithLocalURI:v22 remoteURI:v25 pushToken:v24 service:v23 cert:v26 keyType:a11 keyDiversifier:v21]);

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionController queueManager](self, "queueManager"));
  BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v30 asyncQueueForPriority:a13]);
  [v29 verifySignedData:v28 matchesData:v27 forType:a5 onQueue:v31 withCompletion:v33];
}

- (BOOL)publicKeyVerifySignedData:(id)a3 matchesData:(id)a4 forSignatureType:(int64_t)a5 endpoint:(id)a6 priority:(int64_t)a7 error:(id *)a8
{
  return -[IDSEncryptionController publicKeyVerifySignedData:matchesData:forSignatureType:endpoint:withKeyType:keyDiversifier:priority:error:]( self,  "publicKeyVerifySignedData:matchesData:forSignatureType:endpoint:withKeyType:keyDiversifier:priority:error:",  a3,  a4,  a5,  a6,  0LL,  0LL,  a7,  a8);
}

- (BOOL)publicKeyVerifySignedData:(id)a3 matchesData:(id)a4 forSignatureType:(int64_t)a5 endpoint:(id)a6 withKeyType:(unsigned int)a7 keyDiversifier:(id)a8 priority:(int64_t)a9 error:(id *)a10
{
  uint64_t v10 = *(void *)&a7;
  id v16 = a8;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  -1LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 verifierWithEndpoint:v17 keyType:v10 keyDiversifier:v16]);

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionController queueManager](self, "queueManager"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 syncQueueForPriority:a9]);
  LOBYTE(a5) = [v21 verifySignedData:v19 matchesData:v18 forType:a5 onQueue:v23 error:a10];

  return a5;
}

- (id)OTREncryptData:(id)a3 OTRToken:(id)a4 priority:(int64_t)a5 error:(int64_t *)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  -1LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 encrypterWithOTRToken:v10]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](self->_queueManager, "syncQueueForPriority:", a5));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 encryptData:v11 onQueue:v14 error:a6]);

  return v15;
}

- (id)OTRDecryptData:(id)a3 OTRToken:(id)a4 priority:(int64_t)a5 error:(int64_t *)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController _builderAvoidMainQueue:forceEncryptionType:]( self,  "_builderAvoidMainQueue:forceEncryptionType:",  0LL,  -1LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 encrypterWithOTRToken:v10]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](self->_queueManager, "syncQueueForPriority:", a5));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 decryptData:v11 onQueue:v14 error:a6]);

  return v15;
}

- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 theirURI:(id)a5 theirPushToken:(id)a6 service:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v30 = 0LL;
  BOOL v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1002B3C58;
  v23[3] = &unk_1008FF9D0;
  v23[4] = self;
  id v17 = v15;
  id v24 = v17;
  id v18 = v14;
  id v25 = v18;
  id v19 = v16;
  id v26 = v19;
  id v20 = v12;
  id v27 = v20;
  id v21 = v13;
  id v28 = v21;
  id v29 = &v30;
  -[IDSEncryptionController performSyncBlock:priority:](self, "performSyncBlock:priority:", v23, 300LL);
  LOBYTE(self) = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  return (char)self;
}

- (void)_legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 encrypter:(id)a5 priority:(int64_t)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  queueManager = self->_queueManager;
  id v15 = a4;
  id v16 = a3;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager asyncQueueForPriority:](queueManager, "asyncQueueForPriority:", a6));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1002B3F98;
  v20[3] = &unk_1008FF958;
  id v21 = v12;
  id v22 = v13;
  id v18 = v12;
  id v19 = v13;
  [v18 legacyEncryptData:v16 withEncryptedAttributes:v15 onQueue:v17 withCompletion:v20];
}

- (void)_decryptData:(id)a3 encrypter:(id)a4 pkType:(int64_t)a5 isRetry:(BOOL)a6 priority:(int64_t)a7 replayKey:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v15 = a4;
  id v16 = a9;
  queueManager = self->_queueManager;
  id v18 = a8;
  id v19 = a3;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager asyncQueueForPriority:](queueManager, "asyncQueueForPriority:", a7));
  id v21 = sub_1002B2834(a5);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1002B40DC;
  v25[3] = &unk_1008FF9F8;
  id v27 = v16;
  int64_t v28 = a5;
  id v26 = v15;
  id v23 = v15;
  id v24 = v16;
  [v23 decryptData:v19 decryptionContext:0 usingIdentifier:v22 onQueue:v20 isRetry:v11 replayKey:v18 withCompletion:v25];
}

- (void)_decryptData:(id)a3 decryptionContext:(id)a4 encrypter:(id)a5 pkType:(int64_t)a6 isRetry:(BOOL)a7 priority:(int64_t)a8 replayKey:(id)a9 completion:(id)a10
{
  BOOL v11 = a7;
  id v16 = a5;
  id v17 = a10;
  queueManager = self->_queueManager;
  id v19 = a9;
  id v20 = a4;
  id v21 = a3;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager asyncQueueForPriority:](queueManager, "asyncQueueForPriority:", a8));
  id v23 = sub_1002B2834(a6);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1002B4328;
  v27[3] = &unk_1008FF9F8;
  id v29 = v17;
  int64_t v30 = a6;
  id v28 = v16;
  id v25 = v16;
  id v26 = v17;
  [v25 decryptData:v21 decryptionContext:v20 usingIdentifier:v24 onQueue:v22 isRetry:v11 replayKey:v19 withCompletion:v27];
}

- (id)_builderAvoidMainQueue:(BOOL)a3 forceEncryptionType:(int64_t)a4
{
  LOBYTE(v5) = a3;
  return +[IDSEncrypterBuilder builderWithPublicKeyStorage:peerIDManager:accountController:registrationKeyManager:rateLimiter:OTRController:serviceController:avoidMainQueue:forceEncryptionType:]( &OBJC_CLASS___IDSEncrypterBuilder,  "builderWithPublicKeyStorage:peerIDManager:accountController:registrationKeyManager:rateLimiter:OTRController: serviceController:avoidMainQueue:forceEncryptionType:",  self->_publicKeyStorage,  self->_peerIDManager,  self->_accountController,  self->_registrationKeyManager,  self->_failedTokenCache,  self->_OTRController,  self->_serviceController,  v5,  a4);
}

- (void)performAsyncBlock:(id)a3 priority:(int64_t)a4
{
  queueManager = self->_queueManager;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager asyncQueueForPriority:](queueManager, "asyncQueueForPriority:", a4));
  [v7 performAsyncBlock:v6];
}

- (void)performSyncBlock:(id)a3 priority:(int64_t)a4
{
  queueManager = self->_queueManager;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSEncryptionQueueManager syncQueueForPriority:](queueManager, "syncQueueForPriority:", a4));
  [v7 performSyncBlock:v6];
}

- (void)logEncryptionErrorForToken:(id)a3 deviceID:(id)a4 forURI:(id)a5 fromURI:(id)a6 forService:(id)a7 messageData:(id)a8 type:(int64_t)a9
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002B4690;
  v21[3] = &unk_1008FFA20;
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  int64_t v28 = a9;
  id v15 = v27;
  id v16 = v26;
  id v17 = v25;
  id v18 = v24;
  id v19 = v23;
  id v20 = v22;
  -[IDSEncryptionController performSyncBlock:priority:](self, "performSyncBlock:priority:", v21, 200LL);
}

- (void)logRemoteDecryptionErrorForToken:(id)a3 deviceID:(id)a4 forURI:(id)a5 fromURI:(id)a6 forService:(id)a7 messageData:(id)a8 type:(int64_t)a9
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002B4820;
  v21[3] = &unk_1008FFA20;
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  int64_t v28 = a9;
  id v15 = v27;
  id v16 = v26;
  id v17 = v25;
  id v18 = v24;
  id v19 = v23;
  id v20 = v22;
  -[IDSEncryptionController performSyncBlock:priority:](self, "performSyncBlock:priority:", v21, 200LL);
}

- (IDSRateLimiter)failedTokenCache
{
  return self->_failedTokenCache;
}

- (void)setFailedTokenCache:(id)a3
{
}

- (IDSEncryptionQueueManager)queueManager
{
  return self->_queueManager;
}

- (void)setQueueManager:(id)a3
{
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (void)setRegistrationKeyManager:(id)a3
{
}

- (IDSOTRController)OTRController
{
  return self->_OTRController;
}

- (void)setOTRController:(id)a3
{
}

- (IDSPublicKeyStorage)publicKeyStorage
{
  return self->_publicKeyStorage;
}

- (void)setPublicKeyStorage:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end