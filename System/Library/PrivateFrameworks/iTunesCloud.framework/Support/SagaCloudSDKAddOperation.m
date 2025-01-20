@interface SagaCloudSDKAddOperation
- (NSString)opaqueID;
- (SagaCloudSDKAddOperation)initWithClientIdentity:(id)a3 opaqueID:(id)a4 bundleID:(id)a5;
- (SagaCloudSDKAddOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 opaqueID:(id)a5 bundleID:(id)a6;
- (id)requestWithDatabaseID:(int)a3 databaseRevision:(int)a4 opaqueID:(id)a5 bundleID:(id)a6;
- (id)updateCompletionBlock;
- (unsigned)currentDatabaseRevision;
- (void)main;
- (void)setOpaqueID:(id)a3;
- (void)setUpdateCompletionBlock:(id)a3;
@end

@implementation SagaCloudSDKAddOperation

- (SagaCloudSDKAddOperation)initWithClientIdentity:(id)a3 opaqueID:(id)a4 bundleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v12 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v11);
  v13 = -[SagaCloudSDKAddOperation initWithConfiguration:clientIdentity:opaqueID:bundleID:]( self,  "initWithConfiguration:clientIdentity:opaqueID:bundleID:",  v12,  v10,  v9,  v8);

  return v13;
}

- (SagaCloudSDKAddOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 opaqueID:(id)a5 bundleID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SagaCloudSDKAddOperation;
  v12 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v18,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (v12)
  {
    id v13 = [v10 copy];
    status = (void *)v12->super._status;
    v12->super._status = (int64_t)v13;

    v15 = (NSError *)[v11 copy];
    error = v12->super._error;
    v12->super._error = v15;
  }

  return v12;
}

- (unsigned)currentDatabaseRevision
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  unsigned int v3 = [v2 sagaOnDiskDatabaseRevision];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (id)requestWithDatabaseID:(int)a3 databaseRevision:(int)a4 opaqueID:(id)a5 bundleID:(id)a6
{
  return +[ICSDKAddToLibraryRequest requestWithDatabaseID:databaseRevision:opaqueID:bundleID:]( &OBJC_CLASS___ICSDKAddToLibraryRequest,  "requestWithDatabaseID:databaseRevision:opaqueID:bundleID:",  *(void *)&a3,  *(void *)&a4,  a5,  a6);
}

- (void)main
{
  context = objc_autoreleasePoolPush();
  if (self->super._status)
  {
    v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  objc_opt_class(self, v3));
    v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(v4);
    id v6 = [[MSVXPCTransaction alloc] initWithName:v5];
    [v6 beginTransaction];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v7 setClientIdentity:v8];

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SagaCloudSDKAddOperation requestWithDatabaseID:databaseRevision:opaqueID:bundleID:]( self,  "requestWithDatabaseID:databaseRevision:opaqueID:bundleID:",  [v59 databaseID],  -[SagaCloudSDKAddOperation currentDatabaseRevision](self, "currentDatabaseRevision"),  self->super._status,  self->super._error));
    uint64_t v74 = 0LL;
    v75 = &v74;
    uint64_t v76 = 0x3032000000LL;
    v77 = sub_1000C5778;
    v78 = sub_1000C5788;
    id v79 = 0LL;
    uint64_t v68 = 0LL;
    v69 = &v68;
    uint64_t v70 = 0x3032000000LL;
    v71 = sub_1000C5778;
    v72 = sub_1000C5788;
    id v73 = 0LL;
    id v10 = os_log_create("com.apple.amp.itunescloudd", "SDK");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class(v9, v11);
      id v13 = NSStringFromClass(v12);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
      id v15 = [v9 method];
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 action]);
      v17 = (void *)v16;
      int64_t status = self->super._status;
      v19 = @"POST";
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v14;
      if (!v15) {
        v19 = @"GET";
      }
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v87 = v19;
      *(_WORD *)v88 = 2114;
      *(void *)&v88[2] = v16;
      __int16 v89 = 2114;
      int64_t v90 = status;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sending add item request <%{public}@: %p method=%{public}@ action=%{public}@> for opaqueID: %{public}@",  buf,  0x34u);
    }

    dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_1000C5790;
    v63[3] = &unk_1001A5398;
    id v21 = v9;
    id v64 = v21;
    v66 = &v74;
    v67 = &v68;
    v22 = v20;
    v65 = v22;
    [v59 sendRequest:v21 withResponseHandler:v63];
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v23 = (uint64_t)[(id)v75[5] responseCode];
    if (v23 > 399)
    {
      if (v23 == 404 || v23 == 400)
      {
        uint64_t v24 = 3LL;
        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v24 = 1LL;
      if (v23 == 200 || v23 == 204)
      {
LABEL_18:
        -[CloudLibraryOperation setStatus:](self, "setStatus:", v24);
        v27 = (void *)v69[5];
        if (!v27)
        {
LABEL_37:
          if ((id)-[CloudLibraryOperation status](self, "status") == (id)1)
          {
            unsigned int v44 = [(id)v75[5] updateRequired];
            v45 = (void *)objc_claimAutoreleasedReturnValue([(id)v75[5] addedItems]);
            v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[SagaCloudSDKAddOperation updateCompletionBlock]( self,  "updateCompletionBlock"));
            v47 = os_log_create("com.apple.amp.itunescloudd", "SDK");
            BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
            if (v44)
            {
              if (v48)
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Requesting library update because the response contained update-required flag",  buf,  2u);
              }

              v49 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
              v50 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v49));
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
              v60[0] = _NSConcreteStackBlock;
              v60[1] = 3221225472LL;
              v60[2] = sub_1000C5B20;
              v60[3] = &unk_1001A7220;
              v62 = v46;
              id v61 = v45;
              [v50 updateSagaLibraryWithClientIdentity:v51 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:v60];
            }

            else
            {
              if (v48)
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Skipping library update because the response did not contain update-required flag",  buf,  2u);
              }

              if (v46) {
                ((void (**)(void, void *, void))v46)[2](v46, v45, 0LL);
              }
            }
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          uint64_t v53 = MSVTCCIdentityForCurrentProcess();
          v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          [v52 setClientIdentity:v54];

          [v6 endTransaction];
          _Block_object_dispose(&v68, 8);

          _Block_object_dispose(&v74, 8);
          goto LABEL_48;
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
        if ([v28 isEqualToString:ICCloudClientErrorDomain])
        {
          BOOL v29 = [(id)v69[5] code] == (id)2019;

          if (!v29)
          {
LABEL_26:
            v32 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[SagaCloudSDKAddOperation updateCompletionBlock]( self,  "updateCompletionBlock"));
            if (v32)
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue([(id)v69[5] domain]);
              unsigned int v34 = [v33 isEqualToString:NSURLErrorDomain];
              uint64_t v35 = 3LL;
              if (!v34) {
                uint64_t v35 = 0LL;
              }
              uint64_t v57 = v35;

              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mediaPlayerBundle](&OBJC_CLASS___NSBundle, "mediaPlayerBundle"));
              if (v34) {
                uint64_t v37 = objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"NETWORK_FAILED" value:&stru_1001A7960 table:@"MediaPlayer"]);
              }
              else {
                uint64_t v37 = objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1001A7960 table:@"MediaPlayer"]);
              }
              v38 = (void *)v37;

              uint64_t v80 = 0LL;
              v81 = &v80;
              uint64_t v82 = 0x2020000000LL;
              v39 = (id *)qword_1001DB7A8;
              uint64_t v83 = qword_1001DB7A8;
              if (!qword_1001DB7A8)
              {
                *(void *)buf = _NSConcreteStackBlock;
                *(void *)&buf[8] = 3221225472LL;
                *(void *)&buf[16] = sub_1000C59EC;
                v87 = (const __CFString *)&unk_1001A6978;
                *(void *)v88 = &v80;
                sub_1000C59EC(buf);
                v39 = (id *)v81[3];
              }

              _Block_object_dispose(&v80, 8);
              if (!v39)
              {
                v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
                v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPErrorDomain(void)"));
                objc_msgSend( v55,  "handleFailureInFunction:file:lineNumber:description:",  v56,  @"SagaCloudSDKAddOperation.m",  31,  @"%s",  dlerror());

                __break(1u);
              }

              id v40 = *v39;
              NSErrorUserInfoKey v84 = NSLocalizedDescriptionKey;
              v85 = v38;
              v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL));
              v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v40,  v57,  v41));
              -[CloudLibraryOperation setError:](self, "setError:", v42);

              v43 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));
              ((void (**)(void, void, void *))v32)[2](v32, 0LL, v43);
            }

            goto LABEL_37;
          }

          v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v69[5] userInfo]);
          v28 = (void *)objc_claimAutoreleasedReturnValue( [v30 objectForKey:@"CloudLibraryConnectionRequestForbiddenAdditonalErrorCodeKey"]);

          if ([v28 integerValue] == (id)954)
          {
            -[CloudLibraryOperation setStatus:](self, "setStatus:", 3LL);
            v31 = os_log_create("com.apple.amp.itunescloudd", "SDK");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "cloud-add permamently failed -- item limit exceeded",  buf,  2u);
            }
          }
        }

        goto LABEL_26;
      }
    }

    uint64_t v24 = 2LL;
    goto LABEL_18;
  }

  v25 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}@ SagaCloudSDKAddOperation ID cannot be nil!",  buf,  0xCu);
  }

  +[MSVAutoBugCapture snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:]( &OBJC_CLASS___MSVAutoBugCapture,  "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:",  MSVAutoBugCaptureDomainiTunesCloud,  @"Bug",  @"SagaRequestHandler",  @"SagaCloudSDKAddOperation passed nil ID",  0LL,  0LL,  0LL);
  -[CloudLibraryOperation setStatus:](self, "setStatus:", 3LL);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICCloudClientErrorDomain,  2003LL,  @"ID cannot be nil"));
  -[CloudLibraryOperation setError:](self, "setError:", v26);

  v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[SagaCloudSDKAddOperation updateCompletionBlock]( self,  "updateCompletionBlock"));
  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));
    ((void (**)(void, void, id))v5)[2](v5, 0LL, v6);
LABEL_48:
  }

  objc_autoreleasePoolPop(context);
}

- (NSString)opaqueID
{
  return (NSString *)self->super._status;
}

- (void)setOpaqueID:(id)a3
{
}

- (id)updateCompletionBlock
{
  return self->_opaqueID;
}

- (void)setUpdateCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end