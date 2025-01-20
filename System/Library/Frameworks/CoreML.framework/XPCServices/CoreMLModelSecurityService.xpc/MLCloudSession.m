@interface MLCloudSession
- (CKContainer)container;
- (MLCloudSession)initWithTeamIdentifier:(id)a3;
- (NSString)serviceName;
- (NSString)teamIdentifier;
- (id)fetchKeyResponseFromServerForKeyID:(id)a3 signedKeyRequest:(id)a4 error:(id *)a5;
- (void)setContainer:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation MLCloudSession

- (MLCloudSession)initWithTeamIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MLCloudSession;
  v5 = -[MLCloudSession init](&v14, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerIDForContainerIdentifier:environment:]( &OBJC_CLASS___CKContainer,  "containerIDForContainerIdentifier:environment:",  @"com.apple.coreml.modelkeystore",  1LL));
    v7 = -[CKContainer initWithContainerID:](objc_alloc(&OBJC_CLASS___CKContainer), "initWithContainerID:", v6);
    container = v5->_container;
    v5->_container = v7;

    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)@"mks-production";

    v10 = (NSString *)[v4 copy];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = v10;

    v12 = v5;
  }

  return v5;
}

- (id)fetchKeyResponseFromServerForKeyID:(id)a3 signedKeyRequest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc(&OBJC_CLASS___CKCodeOperation);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MLCloudSession serviceName](self, "serviceName"));
  id v13 = objc_msgSend( v10,  "initWithServiceName:functionName:responseClass:",  v11,  @"fetchKey2",  objc_opt_class(ModelKeyServerAPIFetchKeyResponse, v12));

  objc_super v14 = objc_alloc_init(&OBJC_CLASS___ModelKeyServerAPIFetchKeyRequest);
  -[ModelKeyServerAPIFetchKeyRequest setKeyId:](v14, "setKeyId:", v8);
  -[ModelKeyServerAPIFetchKeyRequest setSignedKeyRequest:](v14, "setSignedKeyRequest:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MLCloudSession teamIdentifier](self, "teamIdentifier"));
  -[ModelKeyServerAPIFetchKeyRequest setTeamId:](v14, "setTeamId:", v15);

  -[ModelKeyServerAPIFetchKeyRequest setRawRequest:](v14, "setRawRequest:", 0LL);
  [v13 setRequest:v14];
  [v13 setQualityOfService:25];
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_1000046C4;
  v44 = sub_1000046D4;
  id v45 = 0LL;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_1000046C4;
  v38 = sub_1000046D4;
  id v39 = 0LL;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000046DC;
  v30[3] = &unk_10000C380;
  v32 = &v34;
  v16 = dispatch_semaphore_create(0LL);
  v31 = v16;
  v33 = &v40;
  [v13 setCodeOperationCompletionBlock:v30];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MLCloudSession container](self, "container"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 publicCloudDatabase]);
  [v18 addOperation:v13];

  dispatch_time_t v19 = dispatch_time(0LL, 10000000000LL);
  if (dispatch_semaphore_wait(v16, v19))
  {
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:]( &OBJC_CLASS___MLModelErrorUtils,  "modelDecryptionKeyFetchErrorWithUnderlyingError:format:",  0LL,  @"Fetching decryption key from server timed out. Make sure the device is online."));
    }
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000071B0(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    id v28 = 0LL;
  }

  else
  {
    if (a5) {
      *a5 = (id) v35[5];
    }
    id v28 = (id)v41[5];
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v28;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void).cxx_destruct
{
}

@end