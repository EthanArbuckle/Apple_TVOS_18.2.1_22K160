@interface CoreMLModelSecurity
+ (id)codeSigningIdentifierFor:(id *)a3 processIdentifier:(int)a4;
+ (id)codeSigningIdentifierFromXPCConnection;
+ (id)teamIdentifierFor:(id *)a3 processIdentifier:(int)a4;
+ (id)teamIdentifierFromXPCConnection;
- (CoreMLModelSecurity)init;
- (CoreMLModelSecurityServiceToClientProtocol)clientProxy;
- (MLFairPlayDecryptSessionManager)decryptSessionManager;
- (MLModel)decryptedModel;
- (OS_os_transaction)txn;
- (void)createPersistentKeyBlobForKeyID:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 completionBlock:(id)a5;
- (void)dealloc;
- (void)extractTeamIdentifierWithReply:(id)a3;
- (void)secureModelMLDictionaryFeatureProvider:(id)a3 withReply:(id)a4;
- (void)secureModelMLFeatureDescription:(id)a3 withReply:(id)a4;
- (void)secureModelMLFeatureValue:(id)a3 withReply:(id)a4;
- (void)secureModelMLModelDescription:(id)a3 withReply:(id)a4;
- (void)secureModelWithContentsOfURL:(id)a3 sandboxExtensionToken:(id)a4 configuration:(id)a5 decryptCredential:(id)a6 withReply:(id)a7;
- (void)secureParameterValueForKey:(id)a3 withReply:(id)a4;
- (void)securePredictionFromLazyBatch:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)securePredictionFromLazyFeatures:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)setClientProxy:(id)a3;
- (void)setDecryptSessionManager:(id)a3;
- (void)setDecryptedModel:(id)a3;
- (void)setTxn:(id)a3;
- (void)startDecryptionOfModelAtPath:(id)a3 usingKeyBlob:(id)a4 usesCodeSigningIdentityForEncryption:(BOOL)a5 completionBlock:(id)a6;
- (void)stopDecryptionOfModelAtPath:(id)a3 completionBlock:(id)a4;
@end

@implementation CoreMLModelSecurity

- (void)secureModelWithContentsOfURL:(id)a3 sandboxExtensionToken:(id)a4 configuration:(id)a5 decryptCredential:(id)a6 withReply:(id)a7
{
  id v28 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, id))a7;
  v14 = objc_autoreleasePoolPush();
  id v15 = v11;
  uint64_t v16 = sandbox_extension_consume([v15 UTF8String]);
  if (v16 < 0)
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = *__error();
      *(_DWORD *)buf = 138412546;
      id v31 = v15;
      __int16 v32 = 1024;
      LODWORD(v33) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Sandbox extension(%@) consume failed (%d)",  buf,  0x12u);
    }
  }

  else
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100007388((uint64_t)v15, v17);
    }
  }

  id v29 = 0LL;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[MLModel modelWithContentsOfURL:configuration:error:]( &OBJC_CLASS___MLModel,  "modelWithContentsOfURL:configuration:error:",  v28,  v12,  &v29));
  id v20 = v29;
  -[CoreMLModelSecurity setDecryptedModel:](self, "setDecryptedModel:", v19);
  if (!v19 || v20)
  {
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel", v28));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v28;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Error loading model from %@ (%@): %@",  buf,  0x20u);
    }

    v13[2](v13, 0LL, v20);
  }

  else
  {
    id v21 = objc_alloc(&OBJC_CLASS___MLSecureModel);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v19 modelDescription]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v19 configuration]);
    id v24 = [v21 initWithDescription:v22 configuration:v23];

    ((void (**)(id, id, id))v13)[2](v13, v24, 0LL);
  }

  if ((v16 & 0x8000000000000000LL) == 0 && sandbox_extension_release(v16) == -1)
  {
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = __error();
      sub_10000733C((uint64_t)v15, v27, (uint64_t)buf, v26);
    }
  }

  objc_autoreleasePoolPop(v14);
}

- (void)securePredictionFromLazyFeatures:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  id v11 = objc_autoreleasePoolPush();
  id v12 = objc_alloc(&OBJC_CLASS___CoreMLModelSecurityXPCFeatureProvider);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurity clientProxy](self, "clientProxy"));
  v14 = -[CoreMLModelSecurityXPCFeatureProvider initWithRemoteProvider:clientProxy:]( v12,  "initWithRemoteProvider:clientProxy:",  v8,  v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurity decryptedModel](self, "decryptedModel"));
  id v19 = 0LL;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 predictionFromFeatures:v14 options:v9 error:&v19]);
  id v17 = v19;

  if (v16)
  {
    int v18 = -[MLDictionaryFeatureProvider initWithFeatureProvider:]( objc_alloc(&OBJC_CLASS___MLDictionaryFeatureProvider),  "initWithFeatureProvider:",  v16);
    v10[2](v10, v18, v17);
  }

  else
  {
    v10[2](v10, 0LL, v17);
    int v18 = 0LL;
  }

  objc_autoreleasePoolPop(v11);
}

- (void)securePredictionFromLazyBatch:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v29 = (void (**)(id, id, id))a5;
  context = objc_autoreleasePoolPush();
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  for (unint64_t i = 0; i < (unint64_t)[v8 count]; ++i)
  {
    id v11 = objc_alloc(&OBJC_CLASS___CoreMLModelSecurityXPCFeatureProvider);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:i]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurity clientProxy](self, "clientProxy"));
    v14 = -[CoreMLModelSecurityXPCFeatureProvider initWithRemoteProvider:clientProxy:]( v11,  "initWithRemoteProvider:clientProxy:",  v12,  v13);
    [v9 setObject:v14 atIndexedSubscript:i];
  }

  id v28 = -[MLArrayBatchProvider initWithFeatureProviderArray:]( objc_alloc(&OBJC_CLASS___MLArrayBatchProvider),  "initWithFeatureProviderArray:",  v9);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurity decryptedModel](self, "decryptedModel"));
  id v31 = 0LL;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 predictionsFromBatch:v28 options:v30 error:&v31]);
  id v17 = v31;

  if (v16)
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v16 count]));
    unint64_t v19 = 0LL;
    *(void *)&__int128 v20 = 134217984LL;
    __int128 v26 = v20;
    while (v19 < (unint64_t)objc_msgSend(v16, "count", v26))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 featuresAtIndex:v19]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 featureNames]);
      BOOL v23 = v22 == 0LL;

      if (v23)
      {
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          unint64_t v33 = v19;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "NULL outputBatchProvider at index %lu.",  buf,  0xCu);
        }
      }

      else
      {
        id v24 = -[MLDictionaryFeatureProvider initWithFeatureProvider:]( objc_alloc(&OBJC_CLASS___MLDictionaryFeatureProvider),  "initWithFeatureProvider:",  v21);
        [v18 setObject:v24 atIndexedSubscript:v19];
      }

      ++v19;
    }

    id v25 = [[MLArrayDictionaryFeatureProvider alloc] initWithDictionaryFeatureProviderArray:v18];
    v29[2](v29, v25, v17);
  }

  else
  {
    v29[2](v29, 0LL, v17);
  }

  objc_autoreleasePoolPop(context);
}

- (void)secureParameterValueForKey:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  id v8 = objc_autoreleasePoolPush();
  id v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurity decryptedModel](self, "decryptedModel"));
  id v13 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 parameterValueForKey:v9 error:&v13]);
  id v12 = v13;

  v7[2](v7, v11, v12);
  objc_autoreleasePoolPop(v8);
}

- (CoreMLModelSecurity)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CoreMLModelSecurity;
  v2 = -[CoreMLModelSecurity init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MLFairPlayDecryptSessionManager);
    decryptSessionManager = v2->_decryptSessionManager;
    v2->_decryptSessionManager = v3;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CoreMLModelSecurity;
  -[CoreMLModelSecurity dealloc](&v3, "dealloc");
}

- (void)secureModelMLFeatureValue:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  v5 = (void (**)(id, id, void *))a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  v5[2](v5, v7, v6);
}

- (void)secureModelMLDictionaryFeatureProvider:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  v5 = (void (**)(id, id, void *))a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  v5[2](v5, v7, v6);
}

- (void)secureModelMLFeatureDescription:(id)a3 withReply:(id)a4
{
}

- (void)secureModelMLModelDescription:(id)a3 withReply:(id)a4
{
}

- (void)createPersistentKeyBlobForKeyID:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___MLFairPlayKeyLoadingSession);
  id v26 = 0LL;
  id v10 = sub_1000064CC(v6, &v26);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v26;
  id v13 = v12;
  if (v11)
  {
    id v25 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 generateKeyRequestForKeyIdentifier:v7 teamIdentifier:v11 error:&v25]);
    id v15 = v25;

    if (v14)
    {
      uint64_t v16 = -[MLCloudSession initWithTeamIdentifier:]( objc_alloc(&OBJC_CLASS___MLCloudSession),  "initWithTeamIdentifier:",  v11);
      id v24 = v15;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[MLCloudSession fetchKeyResponseFromServerForKeyID:signedKeyRequest:error:]( v16,  "fetchKeyResponseFromServerForKeyID:signedKeyRequest:error:",  v7,  v14,  &v24));
      id v18 = v24;

      if (v17)
      {
        id v23 = v18;
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 generatePersistentKeyBlobFromKeyResponse:v17 error:&v23]);
        id v15 = v23;

        if (v19)
        {
          v8[2](v8, v19, 0LL);
        }

        else
        {
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1000074B8();
          }

          ((void (**)(id, void *, id))v8)[2](v8, 0LL, v15);
        }
      }

      else
      {
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100007458();
        }

        ((void (**)(id, void *, id))v8)[2](v8, 0LL, v18);
        id v15 = v18;
      }
    }

    else
    {
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000073F8();
      }

      ((void (**)(id, void *, id))v8)[2](v8, 0LL, v15);
    }

    id v13 = v15;
  }

  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0LL, v12);
  }
}

- (void)startDecryptionOfModelAtPath:(id)a3 usingKeyBlob:(id)a4 usesCodeSigningIdentityForEncryption:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a6;
  id v21 = 0LL;
  id v13 = sub_1000064CC(v7, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v21;
  uint64_t v16 = v15;
  if (v14)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurity decryptSessionManager](self, "decryptSessionManager"));
    id v20 = v16;
    unsigned __int8 v18 = [v17 startDecryptionOfModelAtPath:v10 usingKeyBlob:v11 teamIdentifier:v14 error:&v20];
    id v19 = v20;

    if ((v18 & 1) == 0) {
      v12[2](v12, v19);
    }
    v12[2](v12, 0LL);
  }

  else
  {
    id v19 = v15;
    v12[2](v12, v15);
  }
}

- (void)stopDecryptionOfModelAtPath:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CoreMLModelSecurity decryptSessionManager](self, "decryptSessionManager"));
  id v11 = 0LL;
  unsigned __int8 v9 = [v8 stopDecryptionOfModelAtPath:v6 error:&v11];
  id v10 = v11;

  if ((v9 & 1) == 0) {
    v7[2](v7, v10);
  }
  v7[2](v7, 0LL);
}

- (void)extractTeamIdentifierWithReply:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[CoreMLModelSecurity teamIdentifierFromXPCConnection]( &OBJC_CLASS___CoreMLModelSecurity,  "teamIdentifierFromXPCConnection"));
  v4[2](v4, v3, 0LL);
}

+ (id)teamIdentifierFor:(id *)a3 processIdentifier:(int)a4
{
  __int128 v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  SecTaskRef v7 = v6;
  if (v6)
  {
    CFTypeRef cf = 0LL;
    id v8 = (void *)SecTaskCopyTeamIdentifier(v6, &cf);
    CFRelease(v7);
    if (cf)
    {
      unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue(v10);
        sub_1000075BC();
      }

      CFRelease(cf);
    }

    else
    {
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = NSStringFromSelector(a2);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        *(_DWORD *)buf = 138412546;
        id v20 = v16;
        __int16 v21 = 2112;
        v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%@: SecTaskCopyTeamIdentifier() returned teamIdentity=\"%@\"",  buf,  0x16u);
      }
    }

    return v8;
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v12);
      sub_100007580();
    }

    return 0LL;
  }

+ (id)codeSigningIdentifierFor:(id *)a3 processIdentifier:(int)a4
{
  __int128 v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  SecTaskRef v7 = v6;
  if (v6)
  {
    CFErrorRef error = 0LL;
    id v8 = (__CFString *)SecTaskCopySigningIdentifier(v6, &error);
    if (v8)
    {
      unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = NSStringFromSelector(a2);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)buf = 138412546;
        id v20 = v11;
        __int16 v21 = 2112;
        v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@: SecTaskCopySigningIdentifier() returned signingIdentifier=\"%@\"",  buf,  0x16u);
      }
    }

    else
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue(v16);
        sub_1000075F8();
      }

      CFRelease(error);
    }

    CFRelease(v7);
    return v8;
  }

  else
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v13);
      sub_100007580();
    }

    return 0LL;
  }

+ (id)teamIdentifierFromXPCConnection
{
  v4 = objc_autoreleasePoolPush();
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  SecTaskRef v6 = v5;
  if (v5)
  {
    id v7 = [v5 processIdentifier];
    [v6 auditToken];
    unsigned __int8 v9 = (void *)objc_opt_class(a1, v8);
    v18[0] = v23[0];
    v18[1] = v23[1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 teamIdentifierFor:v18 processIdentifier:v7]);
    if (!v10)
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        *(_DWORD *)buf = 138412546;
        id v20 = v13;
        __int16 v21 = 1024;
        int v22 = (int)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@: client(%d) : missing teamIdentifier",  buf,  0x12u);
      }
    }
  }

  else
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      sub_100007634(v16, (uint64_t)v23, v14);
    }

    id v10 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v10;
}

+ (id)codeSigningIdentifierFromXPCConnection
{
  v4 = objc_autoreleasePoolPush();
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  SecTaskRef v6 = v5;
  if (v5)
  {
    id v7 = [v5 processIdentifier];
    [v6 auditToken];
    unsigned __int8 v9 = (void *)objc_opt_class(a1, v8);
    v18[0] = v23[0];
    v18[1] = v23[1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 codeSigningIdentifierFor:v18 processIdentifier:v7]);
    if (!v10)
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        *(_DWORD *)buf = 138412546;
        id v20 = v13;
        __int16 v21 = 1024;
        int v22 = (int)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@: client(%d) : missing signingIdentifier",  buf,  0x12u);
      }
    }
  }

  else
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      sub_100007634(v16, (uint64_t)v23, v14);
    }

    id v10 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v10;
}

- (MLFairPlayDecryptSessionManager)decryptSessionManager
{
  return (MLFairPlayDecryptSessionManager *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDecryptSessionManager:(id)a3
{
}

- (MLModel)decryptedModel
{
  return self->_decryptedModel;
}

- (void)setDecryptedModel:(id)a3
{
}

- (CoreMLModelSecurityServiceToClientProtocol)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (OS_os_transaction)txn
{
  return self->_txn;
}

- (void)setTxn:(id)a3
{
}

- (void).cxx_destruct
{
}

@end