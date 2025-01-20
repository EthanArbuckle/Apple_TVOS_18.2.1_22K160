@interface CloudUpdateLibraryOperation
- (BOOL)_ensureDeviceIsRegistered;
- (BOOL)_updateLibrary;
- (BOOL)_uploadLibrary;
- (BOOL)allowNoisyAuthPrompt;
- (BOOL)isExplicitUserAction;
- (BOOL)isInitialUpdate;
- (BOOL)uploadingLibraryIsSupported;
- (CloudUpdateLibraryOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 reason:(int64_t)a5 updateTaskHelper:(id)a6;
- (ICStoreURLRequest)getResultsRequest;
- (ICStoreURLRequest)updateRequest;
- (ICStoreURLRequest)uploadLibraryRequest;
- (NSString)cuid;
- (NSString)troveID;
- (SagaImporter)importer;
- (float)progress;
- (id)_determineResultsURLWhenReadyWithUpdateID:(id)a3 retryTimeout:(double)a4 responseStatusCode:(int64_t *)a5;
- (int64_t)reason;
- (int64_t)uploadResponseStatus;
- (void)_clearAllCloudIDs;
- (void)_prepareLibraryForInitialUpdate;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setAllowNoisyAuthPrompt:(BOOL)a3;
- (void)setCuid:(id)a3;
- (void)setGetResultsRequest:(id)a3;
- (void)setImporter:(id)a3;
- (void)setIsExplicitUserAction:(BOOL)a3;
- (void)setReason:(int64_t)a3;
- (void)setTroveID:(id)a3;
- (void)setUpdateRequest:(id)a3;
- (void)setUploadLibraryRequest:(id)a3;
- (void)setUploadResponseStatus:(int64_t)a3;
- (void)setUploadingLibraryIsSupported:(BOOL)a3;
@end

@implementation CloudUpdateLibraryOperation

- (CloudUpdateLibraryOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 reason:(int64_t)a5 updateTaskHelper:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CloudUpdateLibraryOperation;
  v12 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v15,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v13 = v12;
  if (v12)
  {
    v12->_updateTaskHelper = (ICDCloudMusicLibrarySagaUpdateTaskHelper *)a5;
    objc_storeStrong((id *)&v12->super._error, a6);
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CloudUpdateLibraryOperation;
  -[CloudUpdateLibraryOperation dealloc](&v3, "dealloc");
}

- (BOOL)isInitialUpdate
{
  return self->_updateTaskHelper == (ICDCloudMusicLibrarySagaUpdateTaskHelper *)1;
}

- (float)progress
{
  return result;
}

- (void)cancel
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager defaultSession](&OBJC_CLASS___ICURLSessionManager, "defaultSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation uploadLibraryRequest](self, "uploadLibraryRequest"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation uploadLibraryRequest](self, "uploadLibraryRequest"));
    [v3 cancelRequest:v5];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation getResultsRequest](self, "getResultsRequest"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation getResultsRequest](self, "getResultsRequest"));
    [v3 cancelRequest:v7];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation importer](self, "importer"));
  [v8 cancel];

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CloudUpdateLibraryOperation;
  -[CloudUpdateLibraryOperation cancel](&v9, "cancel");
}

- (void)main
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v4 = [v3 sagaOnDiskDatabaseRevision];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  unsigned int v6 = [v5 sagaInitiateClientResetSync];

  -[NSError startingUpdateOperationForLibraryType:isInitialImport:]( self->super._error,  "startingUpdateOperationForLibraryType:isInitialImport:",  1LL,  v4 == 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v7 setClientIdentity:v8];

  objc_super v9 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t StringForRequestReason = ICCloudClientGetStringForRequestReason(self->_updateTaskHelper);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(StringForRequestReason);
    *(_DWORD *)buf = 138544642;
    v94 = self;
    __int16 v95 = 2114;
    *(void *)v96 = v11;
    *(_WORD *)&v96[8] = 1024;
    *(_DWORD *)&v96[10] = v4 == 0LL;
    __int16 v97 = 1024;
    unsigned int v98 = -[CloudUpdateLibraryOperation isExplicitUserAction](self, "isExplicitUserAction");
    __int16 v99 = 1024;
    unsigned int v100 = -[CloudUpdateLibraryOperation allowNoisyAuthPrompt](self, "allowNoisyAuthPrompt");
    __int16 v101 = 1024;
    unsigned int v102 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating cloud library operation (reason = %{public}@), isInitialImport=%{BOOL}u, isExplicitUserActio n=%{BOOL}u, allowNoisyAuthPrompt=%{BOOL}u, sagaClientInitiatedResetSync=%{BOOL}u",  buf,  0x2Eu);
  }

  if (!v4)
  {
    unsigned int v23 = sub_1000B1B34();
    v24 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138543362;
        v94 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Skipping initial import on non standalone wOS platform",  buf,  0xCu);
      }

      v92[0] = &off_1001B45B8;
      v91[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
      v91[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_updateTaskHelper));
      v92[1] = v26;
      v91[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      v92[2] = v27;
      v91[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CloudUpdateLibraryOperation isExplicitUserAction](self, "isExplicitUserAction")));
      v92[3] = v28;
      v29 = v92;
      v30 = v91;
LABEL_13:
      uint64_t v31 = 4LL;
LABEL_49:
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v30,  v31));

      goto LABEL_50;
    }

    if (v25)
    {
      *(_DWORD *)buf = 138543362;
      v94 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Preparing for initial library update...",  buf,  0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudClientStartingInitialCloudLibraryImportNotification,  0LL,  0LL,  1u);
    if (((!-[CloudUpdateLibraryOperation uploadingLibraryIsSupported](self, "uploadingLibraryIsSupported") | v6) & 1) != 0) {
      goto LABEL_33;
    }
    if (-[CloudUpdateLibraryOperation _ensureDeviceIsRegistered](self, "_ensureDeviceIsRegistered"))
    {
      if (-[CloudUpdateLibraryOperation isCancelled](self, "isCancelled"))
      {
        v49 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v94 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Cancelled after registering device",  buf,  0xCu);
        }

        -[CloudLibraryOperation setStatus:](self, "setStatus:", 4LL);
        v88[0] = &off_1001B4600;
        v87[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
        v87[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_updateTaskHelper));
        v88[1] = v26;
        v87[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        v88[2] = v27;
        v87[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CloudUpdateLibraryOperation isExplicitUserAction](self, "isExplicitUserAction")));
        v88[3] = v28;
        v29 = v88;
        v30 = v87;
        goto LABEL_13;
      }

      if (-[CloudUpdateLibraryOperation _uploadLibrary](self, "_uploadLibrary"))
      {
        if (-[CloudUpdateLibraryOperation isCancelled](self, "isCancelled"))
        {
          os_log_t v57 = sub_1000DD86C();
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v94 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Cancelled after uploading library metadata",  buf,  0xCu);
          }

          -[CloudLibraryOperation setStatus:](self, "setStatus:", 4LL);
          v82[0] = &off_1001B4600;
          v81[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
          v81[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
          v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_updateTaskHelper));
          v82[1] = v44;
          v81[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
          v82[2] = v45;
          v81[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
          v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CloudUpdateLibraryOperation isExplicitUserAction](self, "isExplicitUserAction")));
          v82[3] = v46;
          v47 = v82;
          v48 = v81;
          goto LABEL_37;
        }

- (BOOL)_ensureDeviceIsRegistered
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
  BOOL v4 = sub_1000C1558(v3, -[CloudUpdateLibraryOperation allowNoisyAuthPrompt](self, "allowNoisyAuthPrompt"), 0LL);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sagaCloudLibraryCUID]);
    -[CloudUpdateLibraryOperation setCuid:](self, "setCuid:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sagaCloudLibraryTroveID]);
    -[CloudUpdateLibraryOperation setTroveID:](self, "setTroveID:", v8);
  }

  return v4;
}

- (BOOL)_uploadLibrary
{
  if (!CFPreferencesGetAppBooleanValue(@"DisableLibraryUpload", @"com.apple.itunescloudd", 0LL))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    unsigned int v6 = [v5 sagaPrefersToMergeWithCloudLibrary];

    if (v6)
    {
      v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        v8 = "%{public}@ - Setting should-upload to true because MLCloudLibraryPrefersToMerge is set to YES";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }

    else
    {
      if (!CFPreferencesGetAppBooleanValue(@"ForceLibraryUnification", @"com.apple.itunescloudd", 0LL))
      {
        unsigned int v201 = 0;
LABEL_13:
        uint64_t v9 = ML3TrackPropertyMediaType;
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  ML3TrackPropertyMediaType,  &off_1001B4690,  10LL));
        v287[0] = v10;
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[ML3PropertyPredicate predicateWithProperty:]( &OBJC_CLASS___ML3PropertyPredicate,  "predicateWithProperty:",  ML3TrackPropertyIsInMyLibrary));
        v287[1] = v11;
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3PropertyPredicate predicateWithProperty:]( &OBJC_CLASS___ML3PropertyPredicate,  "predicateWithProperty:",  ML3TrackPropertyIsPlayable));
        v287[2] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v287, 3LL));
        objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v13));

        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
        v208 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "queryWithLibrary:predicate:",  v14,  v3));

        id v206 = [v208 countOfEntities];
        int v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v206;
          *(_WORD *)&buf[22] = 2114;
          v284 = (uint64_t (*)(uint64_t, uint64_t))v208;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Found %lu songs to upload from query: %{public}@",  buf,  0x20u);
        }

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation cuid](self, "cuid"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation troveID](self, "troveID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v206));
        v209 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  @"auto-update",  &__kCFBooleanFalse,  @"incremental",  &off_1001B46A8,  @"min-itunes-match-compatible-version",  &off_1001B46C0,  @"itunes-match-protocol-version",  v16,  @"cuid",  v17,  @"troveid",  v18,  @"num-tracks",  0LL));

        uint64_t v255 = 0LL;
        v256 = &v255;
        uint64_t v257 = 0x2050000000LL;
        v19 = (void *)qword_1001DB848;
        v258 = (uint64_t (*)(uint64_t, uint64_t))qword_1001DB848;
        if (!qword_1001DB848)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_1000FCE54;
          v284 = (uint64_t (*)(uint64_t, uint64_t))&unk_1001A6978;
          v285 = (void (*)(uint64_t))&v255;
          sub_1000FCE54((uint64_t)buf);
          v19 = (void *)v256[3];
        }

        v20 = v19;
        _Block_object_dispose(&v255, 8);
        if (v20)
        {
          id v21 = objc_alloc_init(v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v21 state] == 2));
          [v209 setObject:v22 forKey:@"restore-in-progress"];
        }

        unsigned int v23 = sub_10008DF80(0LL, @"cloud-library-update-request", 0LL, v209, 60.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        -[CloudUpdateLibraryOperation setUpdateRequest:](self, "setUpdateRequest:", v24);

        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation updateRequest](self, "updateRequest"));
        LODWORD(v24) = v25 == 0LL;

        v26 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v24)
        {
          if (v27)
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Error creating updateRequest.",  buf,  0xCu);
          }

          BOOL v4 = 0;
          goto LABEL_102;
        }

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation updateRequest](self, "updateRequest"));
          v30 = (void *)objc_opt_class(v28, v29);
          id v31 = v30;
          v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( -[CloudUpdateLibraryOperation updateRequest]( self,  "updateRequest"));
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2048;
          v284 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Sending upload library request: <%{public}@ %p>",  buf,  0x20u);
        }

        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        v284 = sub_1000FC55C;
        v285 = sub_1000FC56C;
        id v286 = 0LL;
        uint64_t v255 = 0LL;
        v256 = &v255;
        uint64_t v257 = 0x3032000000LL;
        v258 = sub_1000FC55C;
        v259 = sub_1000FC56C;
        id v260 = 0LL;
        v253[0] = 0LL;
        v253[1] = v253;
        v253[2] = 0x3032000000LL;
        v253[3] = sub_1000FC55C;
        v253[4] = sub_1000FC56C;
        id v254 = 0LL;
        dispatch_semaphore_t v33 = dispatch_semaphore_create(0LL);
        int v34 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation updateRequest](self, "updateRequest"));
        v248[0] = _NSConcreteStackBlock;
        v248[1] = 3221225472LL;
        v248[2] = sub_1000FCFF0;
        v248[3] = &unk_1001A6408;
        v250 = buf;
        v251 = &v255;
        v252 = v253;
        v35 = v33;
        v249 = v35;
        [v34 startGeniusRequestWithRetryTimeout:@"libraryUpdateRequest" debugName:v248 connectionResponseBlock:300.0];

        dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
        unsigned int v36 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v38 = (void *)objc_opt_class(*(void *)(*(void *)&buf[8] + 40LL), v37);
          v39 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40LL);
          *(_DWORD *)v270 = 138543874;
          *(void *)&v270[4] = self;
          *(_WORD *)&v270[12] = 2114;
          *(void *)&v270[14] = v38;
          *(_WORD *)&v270[22] = 2048;
          v271 = v39;
          id v40 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Got upload library response: <%{public}@ %p>",  v270,  0x20u);
        }

        -[CloudUpdateLibraryOperation setUpdateRequest:](self, "setUpdateRequest:", 0LL);
        uint64_t v41 = v256[5];
        uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSDictionary, v42);
        if ((objc_opt_isKindOfClass(v41, v43) & 1) != 0)
        {
          v44 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = v256[5];
            *(_DWORD *)v270 = 138543618;
            *(void *)&v270[4] = self;
            *(_WORD *)&v270[12] = 2114;
            *(void *)&v270[14] = v45;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Upload library response body: %{public}@",  v270,  0x16u);
          }

          v46 = (void *)objc_claimAutoreleasedReturnValue([(id)v256[5] objectForKey:@"url"]);
          if (v46) {
            uint64_t v200 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v46));
          }
          else {
            uint64_t v200 = 0LL;
          }
          v205 = (void *)objc_claimAutoreleasedReturnValue([(id)v256[5] objectForKey:@"update-id"]);

          if (v200)
          {
            v47 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v270 = 138543618;
              *(void *)&v270[4] = self;
              *(_WORD *)&v270[12] = 2114;
              *(void *)&v270[14] = v200;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Determined upload URL: %{public}@",  v270,  0x16u);
            }

            v48 = NSTemporaryDirectory();
            v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
            v282[0] = v49;
            v282[1] = @"CloudLibraryUpload.plist";
            v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v282,  2LL));
            v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v50));

            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v199 path]);
            [v51 createFileAtPath:v52 contents:0 attributes:0];

            id v247 = 0LL;
            v198 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingToURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingToURL:error:",  v199,  &v247));
            id v53 = v247;
            v54 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            v55 = v54;
            v197 = v53;
            if (v53)
            {
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v270 = 138543618;
                *(void *)&v270[4] = self;
                *(_WORD *)&v270[12] = 2114;
                *(void *)&v270[14] = v53;
                _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "%{public}@ - Failed to open file for writing library upload metadata plist with error: %{public}@",  v270,  0x16u);
              }

              int v56 = 0;
            }

            else
            {
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                v58 = (void *)objc_claimAutoreleasedReturnValue([v199 path]);
                *(_DWORD *)v270 = 138543618;
                *(void *)&v270[4] = self;
                *(_WORD *)&v270[12] = 2114;
                *(void *)&v270[14] = v58;
                _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Writing library upload metadata to plist at: %{public}@",  v270,  0x16u);
              }

              id v59 = [[MSVPropertyListEncoder alloc] initWithOutputFileHandle:v198];
              [v59 startDictionary];
              v60 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation cuid](self, "cuid"));
              [v59 setObject:v60 forKey:@"cuid"];

              unsigned int v61 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation troveID](self, "troveID"));
              [v59 setObject:v61 forKey:@"troveid"];

              [v59 setObject:&off_1001B46A8 forKey:@"min-itunes-match-compatible-version"];
              [v59 setObject:&off_1001B46C0 forKey:@"itunes-match-protocol-version"];
              [v59 setObject:&off_1001B46A8 forKey:@"min-compatible-version"];
              [v59 setObject:&off_1001B46A8 forKey:@"protocol-version"];
              uint64_t v62 = arc4random();
              v63 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%08X%08X",  v62,  arc4random());
              unsigned int v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
              [v59 setObject:v64 forKey:@"persistent-library-id"];

              v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v201));
              [v59 setObject:v65 forKey:@"should-upload"];

              [v59 startArrayForKey:@"tracks"];
              v190 = objc_autoreleasePoolPush();
              v66 = objc_alloc_init(&OBJC_CLASS___CloudGeniusUtilities);
              v281[0] = v9;
              v281[1] = ML3TrackPropertyBaseLocationID;
              v281[2] = ML3TrackPropertyStoreProtectionType;
              v281[3] = ML3TrackPropertyUserRatingIsDerived;
              v281[4] = ML3TrackPropertyUserAlbumRatingIsDerived;
              v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v281,  5LL));
              v68 = (void *)objc_claimAutoreleasedReturnValue( -[CloudGeniusUtilities allML3TrackPropertiesWithGeniusTrackProperties]( v66,  "allML3TrackPropertiesWithGeniusTrackProperties"));
              v69 = (void *)objc_claimAutoreleasedReturnValue([v68 arrayByAddingObjectsFromArray:v67]);
              v195 = v67;

              v70 = [v69 count];
              v71 = [v67 count];
              v72 = (void *)objc_claimAutoreleasedReturnValue( -[CloudGeniusUtilities allGeniusTrackPropertiesWithML3TrackProperties]( v66,  "allGeniusTrackPropertiesWithML3TrackProperties"));
              v280[0] = @"persistent-id";
              v280[1] = @"kind";
              v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v280,  2LL));
              v194 = (void *)objc_claimAutoreleasedReturnValue([v72 arrayByAddingObjectsFromArray:v73]);

              v241[0] = _NSConcreteStackBlock;
              v241[1] = 3221225472LL;
              v241[2] = sub_1000FD0AC;
              v241[3] = &unk_1001A6430;
              v241[4] = self;
              id v189 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v194));
              id v242 = v189;
              int64_t v246 = v70 - v71;
              id v243 = v69;
              v193 = v66;
              v244 = v193;
              id v196 = v59;
              id v245 = v196;
              id v188 = v243;
              [v208 enumeratePersistentIDsAndProperties:v243 usingBlock:v241];
              [v196 endArray];
              context = objc_autoreleasePoolPush();
              if (v201)
              {
                [v196 setObject:&__kCFBooleanTrue forKey:@"process-playlists"];
                [v196 startArrayForKey:@"playlists"];
                uint64_t v202 = ML3ContainerPropertyDistinguishedKind;
                v186 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInteger:"));
                v278[0] = v186;
                v184 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v202,  &off_1001B46D8,  4LL));
                v277[0] = v184;
                v182 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v202,  &off_1001B46F0,  6LL));
                v277[1] = v182;
                v181 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v277,  2LL));
                v180 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v181));
                v278[1] = v180;
                v179 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v278,  2LL));
                v74 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AnyCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AnyCompoundPredicate,  "predicateMatchingPredicates:",  v179));
                v279[0] = v74;
                uint64_t v75 = ML3ContainerPropertyContainedMediaType;
                v76 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInteger:",  ML3ContainerPropertyContainedMediaType,  0LL));
                v276[0] = v76;
                v77 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v75,  &off_1001B4690,  10LL));
                v276[1] = v77;
                v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v276,  2LL));
                v79 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AnyCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AnyCompoundPredicate,  "predicateMatchingPredicates:",  v78));
                v279[1] = v79;
                v80 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInteger:",  ML3ContainerPropertyIsHidden,  0LL));
                v279[2] = v80;
                v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v279,  3LL));
                v178 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v81));

                v82 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
                v83 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Container queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Container,  "queryWithLibrary:predicate:",  v82,  v178));

                id v84 = [v83 countOfEntities];
                os_log_t v85 = sub_1000DD86C();
                v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
                BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT);
                if (v84)
                {
                  if (v87)
                  {
                    *(_DWORD *)v270 = 138543874;
                    *(void *)&v270[4] = self;
                    *(_WORD *)&v270[12] = 2048;
                    *(void *)&v270[14] = v84;
                    *(_WORD *)&v270[22] = 2114;
                    v271 = (uint64_t (*)(uint64_t, uint64_t))v83;
                    _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Found %lu playlists to upload from query: %{public}@",  v270,  0x20u);
                  }

                  v275[0] = ML3ContainerPropertyCloudGlobalID;
                  v275[1] = ML3ContainerPropertyCloudIsSubscribed;
                  v275[2] = ML3ContainerPropertyCloudIsCuratorPlaylist;
                  v275[3] = ML3ContainerPropertyIsExternalVendorPlaylist;
                  v275[4] = ML3ContainerPropertySmartIsFolder;
                  v275[5] = ML3ContainerPropertySmartCriteria;
                  v275[6] = ML3ContainerPropertySmartIsGenius;
                  v275[7] = ML3ContainerPropertySeedItemPersistentID;
                  v275[8] = ML3ContainerPropertySmartIsDynamic;
                  v275[9] = ML3ContainerPropertySmartIsFiltered;
                  v275[10] = ML3ContainerPropertySmartIsLimited;
                  v275[11] = ML3ContainerPropertySmartLimitKind;
                  v275[12] = ML3ContainerPropertySmartEvaluationOrder;
                  v275[13] = ML3ContainerPropertySmartLimitOrder;
                  v275[14] = ML3ContainerPropertySmartLimitValue;
                  v275[15] = ML3ContainerPropertySmartEnabledOnly;
                  v275[16] = ML3ContainerPropertySmartReverseLimitOrder;
                  v275[17] = v202;
                  v86 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v275,  18LL));
                  v88 = (void *)objc_claimAutoreleasedReturnValue( -[CloudGeniusUtilities allML3ContainerPropertiesWithGeniusPlaylistProperties]( v193,  "allML3ContainerPropertiesWithGeniusPlaylistProperties"));
                  v89 = (void *)objc_claimAutoreleasedReturnValue([v88 arrayByAddingObjectsFromArray:v86]);

                  v203 = [v89 count];
                  v90 = -[os_log_s count](v86, "count");
                  v91 = (void *)objc_claimAutoreleasedReturnValue( -[CloudGeniusUtilities allGeniusPlaylistPropertiesWithML3ContainerProperties]( v193,  "allGeniusPlaylistPropertiesWithML3ContainerProperties"));
                  v274[0] = @"persistent-id";
                  v274[1] = @"kind";
                  v274[2] = @"items";
                  v274[3] = @"data";
                  v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v274,  4LL));
                  v93 = (void *)objc_claimAutoreleasedReturnValue([v91 arrayByAddingObjectsFromArray:v92]);

                  int64_t v94 = v203 - v90;
                  v235[0] = _NSConcreteStackBlock;
                  v235[1] = 3221225472LL;
                  v235[2] = sub_1000FD34C;
                  v235[3] = &unk_1001A6430;
                  v235[4] = self;
                  id v95 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v93));
                  id v236 = v95;
                  int64_t v240 = v94;
                  id v96 = v89;
                  id v237 = v96;
                  v238 = v193;
                  id v239 = v196;
                  [v83 enumeratePersistentIDsAndProperties:v96 usingBlock:v235];
                }

                else if (v87)
                {
                  *(_DWORD *)v270 = 138543362;
                  *(void *)&v270[4] = self;
                  _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Found zero playlists to upload.",  v270,  0xCu);
                }
              }

              [v196 close];
              id v97 = v199;
              unsigned int v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:",  v200));
              [v98 setHTTPMethod:@"POST"];
              [v98 setTimeoutInterval:120.0];
              id v99 = v97;
              unsigned int v100 = (void *)objc_claimAutoreleasedReturnValue([v99 URLByAppendingPathExtension:@"gz"]);
              __int16 v101 = os_log_create("com.apple.amp.itunescloudd", "Genius");
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v270 = 138543362;
                *(void *)&v270[4] = v100;
                _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "Compressing plist to path: %{public}@",  v270,  0xCu);
              }

              id v102 = v99;
              if (MSVGzipCompressFile(v99, v100))
              {
                id v102 = v100;
              }

              if (MSVDeviceOSIsInternalInstall(v103))
              {
                uint64_t v104 = MSVMediaLoggingDirectory();
                v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
                v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v105,  1LL));

                v107 = (void *)objc_claimAutoreleasedReturnValue([v102 lastPathComponent]);
                v108 = (void *)objc_claimAutoreleasedReturnValue([v106 URLByAppendingPathComponent:v107 isDirectory:0]);

                v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                v110 = (void *)objc_claimAutoreleasedReturnValue([v108 path]);
                unsigned int v111 = [v109 fileExistsAtPath:v110];

                if (v111) {
                  [v109 removeItemAtURL:v108 error:0];
                }
                [v109 linkItemAtURL:v102 toURL:v108 error:0];
              }

              v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSData mappedDataWithContentsOfTemporaryFileURL:error:]( &OBJC_CLASS___NSData,  "mappedDataWithContentsOfTemporaryFileURL:error:",  v102,  0LL));

              [v98 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
              [v98 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
              [v98 setHTTPBody:v112];
              v113 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
              v114 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
              v115 = -[ICStoreRequestContext initWithIdentity:](v113, "initWithIdentity:", v114);

              v116 = -[ICStoreURLRequest initWithURLRequest:requestContext:]( objc_alloc(&OBJC_CLASS___ICStoreURLRequest),  "initWithURLRequest:requestContext:",  v98,  v115);
              -[ICStoreURLRequest setShouldUseMescalSigning:](v116, "setShouldUseMescalSigning:", 1LL);

              -[CloudUpdateLibraryOperation setUploadLibraryRequest:](self, "setUploadLibraryRequest:", v116);
              objc_autoreleasePoolPop(context);
              *(void *)v270 = 0LL;
              *(void *)&v270[8] = v270;
              *(void *)&v270[16] = 0x3032000000LL;
              v271 = sub_1000FC55C;
              v272 = sub_1000FC56C;
              id v273 = 0LL;
              uint64_t v229 = 0LL;
              v230 = &v229;
              uint64_t v231 = 0x3032000000LL;
              v232 = sub_1000FC55C;
              v233 = sub_1000FC56C;
              id v234 = 0LL;
              dispatch_semaphore_t v117 = dispatch_semaphore_create(0LL);
              v118 = (void *)objc_claimAutoreleasedReturnValue( +[ICURLSessionManager defaultSession]( &OBJC_CLASS___ICURLSessionManager,  "defaultSession"));
              v119 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation uploadLibraryRequest](self, "uploadLibraryRequest"));
              v225[0] = _NSConcreteStackBlock;
              v225[1] = 3221225472LL;
              v225[2] = sub_1000FDAFC;
              v225[3] = &unk_1001A6480;
              v227 = &v229;
              v228 = v270;
              v120 = v117;
              v226 = v120;
              [v118 enqueueDataRequest:v119 withCompletionHandler:v225];

              dispatch_semaphore_wait(v120, 0xFFFFFFFFFFFFFFFFLL);
              v121 = (void *)objc_claimAutoreleasedReturnValue([(id)v230[5] urlResponse]);
              LODWORD(v118) = [v121 statusCode] == (id)200;

              if ((_DWORD)v118)
              {
                double v122 = dbl_10013B570[(unint64_t)v206 > 0x2710];
                uint64_t v224 = -1LL;
                v123 = (void *)objc_claimAutoreleasedReturnValue( -[CloudUpdateLibraryOperation _determineResultsURLWhenReadyWithUpdateID:retryTimeout:responseStatusCode:]( self,  "_determineResultsURLWhenReadyWithUpdateID:retryTimeout:responseStatusCode:",  v205,  &v224,  v122));
                -[CloudUpdateLibraryOperation setUploadResponseStatus:](self, "setUploadResponseStatus:", v224);
                os_log_t v124 = sub_1000DD86C();
                v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
                if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v266 = 138543618;
                  *(void *)&v266[4] = self;
                  *(_WORD *)&v266[12] = 2114;
                  *(void *)&v266[14] = v123;
                  _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Determined results URL: %{public}@",  v266,  0x16u);
                }

                if (v123)
                {
                  v126 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_1001B46A8,  @"min-itunes-match-compatible-version",  &off_1001B46C0,  @"itunes-match-protocol-version",  0LL));
                  v127 = sub_10008DF80(v123, 0LL, 0LL, v126, 120.0);
                  v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
                  -[CloudUpdateLibraryOperation setGetResultsRequest:](self, "setGetResultsRequest:", v128);
                  v204 = (os_log_s *)v126;

                  *(void *)v266 = 0LL;
                  *(void *)&v266[8] = v266;
                  *(void *)&v266[16] = 0x3032000000LL;
                  v267 = sub_1000FC55C;
                  v268 = sub_1000FC56C;
                  id v269 = 0LL;
                  uint64_t v218 = 0LL;
                  v219 = &v218;
                  uint64_t v220 = 0x3032000000LL;
                  v221 = sub_1000FC55C;
                  v222 = sub_1000FC56C;
                  id v223 = 0LL;
                  v129 = (void *)objc_claimAutoreleasedReturnValue( +[ICURLSessionManager defaultSession]( &OBJC_CLASS___ICURLSessionManager,  "defaultSession"));
                  v130 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation getResultsRequest](self, "getResultsRequest"));
                  v214[0] = _NSConcreteStackBlock;
                  v214[1] = 3221225472LL;
                  v214[2] = sub_1000FDB84;
                  v214[3] = &unk_1001A6480;
                  v216 = &v218;
                  v217 = v266;
                  v131 = v120;
                  v215 = v131;
                  [v129 enqueueDataRequest:v130 withCompletionHandler:v214];

                  dispatch_semaphore_wait(v131, 0xFFFFFFFFFFFFFFFFLL);
                  -[CloudUpdateLibraryOperation setGetResultsRequest:](self, "setGetResultsRequest:", 0LL);
                  v132 = (void *)objc_claimAutoreleasedReturnValue([(id)v219[5] urlResponse]);
                  BOOL v133 = [v132 statusCode] == (id)200;

                  if (v133)
                  {
                    uint64_t v187 = objc_claimAutoreleasedReturnValue([(id)v219[5] bodyData]);
                    if (v187)
                    {
                      v134 = NSTemporaryDirectory();
                      v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
                      v265[0] = v135;
                      v265[1] = @"com.apple.MediaServices";
                      v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
                      v137 = (void *)objc_claimAutoreleasedReturnValue([v136 UUIDString]);
                      v265[2] = v137;
                      v265[3] = @"CloudLibraryUploadResults.plist";
                      v138 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v265,  4LL));
                      v207 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPathComponents:]( &OBJC_CLASS___NSURL,  "fileURLWithPathComponents:",  v138));

                      contexta = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager defaultManager]( &OBJC_CLASS___NSFileManager,  "defaultManager"));
                      v139 = (void *)objc_claimAutoreleasedReturnValue([v207 URLByDeletingLastPathComponent]);
                      [contexta createDirectoryAtURL:v139 withIntermediateDirectories:1 attributes:0 error:0];

                      v140 = (void *)objc_claimAutoreleasedReturnValue([v207 path]);
                      [contexta createFileAtPath:v140 contents:0 attributes:0];

                      v141 = *(void **)(*(void *)&v270[8] + 40LL);
                      *(void *)(*(void *)&v270[8] + 40LL) = 0LL;

                      v142 = (id *)(*(void *)&v270[8] + 40LL);
                      id obj = *(id *)(*(void *)&v270[8] + 40LL);
                      v185 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingToURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingToURL:error:",  v207,  &obj));
                      objc_storeStrong(v142, obj);
                      if (v185)
                      {
                        [v185 writeData:v187];
                        [v185 closeFile];
                        os_log_t v143 = sub_1000DD86C();
                        v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
                        if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
                        {
                          v145 = (void *)objc_claimAutoreleasedReturnValue([v207 path]);
                          *(_DWORD *)v263 = 138543618;
                          *(void *)&v263[4] = self;
                          *(_WORD *)&v263[12] = 2114;
                          *(void *)&v263[14] = v145;
                          _os_log_impl( (void *)&_mh_execute_header,  v144,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Saved results plist to: %{public}@",  v263,  0x16u);
                        }

                        if (MSVDeviceOSIsInternalInstall(v146))
                        {
                          uint64_t v147 = MSVMediaLoggingDirectory();
                          v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
                          v149 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v148,  1LL));

                          v150 = (void *)objc_claimAutoreleasedReturnValue([v207 lastPathComponent]);
                          v151 = (void *)objc_claimAutoreleasedReturnValue([v149 URLByAppendingPathComponent:v150 isDirectory:0]);

                          v152 = (void *)objc_claimAutoreleasedReturnValue([v151 path]);
                          unsigned int v153 = [contexta fileExistsAtPath:v152];

                          if (v153) {
                            [contexta removeItemAtURL:v151 error:0];
                          }
                          [contexta linkItemAtURL:v207 toURL:v151 error:0];
                        }

                        v154 = (void *)objc_claimAutoreleasedReturnValue([v207 path]);
                        uint64_t v183 = objc_claimAutoreleasedReturnValue([v154 dataUsingEncoding:4]);

                        id v155 = objc_alloc(&OBJC_CLASS___ML3DatabaseImport);
                        v156 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
                        v157 = (void *)objc_claimAutoreleasedReturnValue([v156 databasePath]);
                        v158 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
                        id v159 = [v155 initWithLibraryPath:v157 trackData:v183 playlistData:v183 clientIdentity:v158];

                        *(void *)v263 = 0LL;
                        *(void *)&v263[8] = v263;
                        *(void *)&v263[16] = 0x2020000000LL;
                        LOBYTE(v264) = 0;
                        dispatch_semaphore_t v160 = dispatch_semaphore_create(0LL);
                        v161 = (void *)objc_claimAutoreleasedReturnValue( +[MLMediaLibraryService sharedMediaLibraryService]( &OBJC_CLASS___MLMediaLibraryService,  "sharedMediaLibraryService"));
                        v210[0] = _NSConcreteStackBlock;
                        v210[1] = 3221225472LL;
                        v210[2] = sub_1000FDC0C;
                        v210[3] = &unk_1001A64A8;
                        v210[4] = self;
                        v212 = v263;
                        v162 = v160;
                        v211 = v162;
                        [v161 performImport:v159 fromSource:9 withProgressBlock:0 completionHandler:v210];

                        dispatch_semaphore_wait(v162, 0xFFFFFFFFFFFFFFFFLL);
                        if (*(_BYTE *)(*(void *)&v263[8] + 24LL))
                        {
                          int v56 = 1;
                        }

                        else
                        {
                          os_log_t v175 = sub_1000DD86C();
                          v176 = (os_log_s *)objc_claimAutoreleasedReturnValue(v175);
                          if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)v261 = 138543362;
                            v262 = self;
                            _os_log_impl( (void *)&_mh_execute_header,  v176,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Failed to import cloud-id mapping.",  v261,  0xCu);
                          }

                          int v56 = 0;
                        }

                        _Block_object_dispose(v263, 8);
                        v174 = (os_log_s *)v183;
                      }

                      else
                      {
                        os_log_t v173 = sub_1000DD86C();
                        v174 = (os_log_s *)objc_claimAutoreleasedReturnValue(v173);
                        if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v263 = 138543362;
                          *(void *)&v263[4] = self;
                          _os_log_impl( (void *)&_mh_execute_header,  v174,  OS_LOG_TYPE_ERROR,  "%{public}@ - Received empty response when getting match results.",  v263,  0xCu);
                        }

                        int v56 = 0;
                      }

                      v170 = (os_log_s *)v207;
                    }

                    else
                    {
                      os_log_t v169 = sub_1000DD86C();
                      v170 = (os_log_s *)objc_claimAutoreleasedReturnValue(v169);
                      if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v171 = v219[5];
                        uint64_t v172 = *(void *)(*(void *)&v266[8] + 40LL);
                        *(_DWORD *)v263 = 138543874;
                        *(void *)&v263[4] = self;
                        *(_WORD *)&v263[12] = 2114;
                        *(void *)&v263[14] = v171;
                        *(_WORD *)&v263[22] = 2114;
                        uint64_t v264 = v172;
                        _os_log_impl( (void *)&_mh_execute_header,  v170,  OS_LOG_TYPE_ERROR,  "%{public}@ - Received non-200 response when getting match results: %{public}@ error: %{public}@",  v263,  0x20u);
                      }

                      int v56 = 0;
                    }

                    v168 = (os_log_s *)v187;
                  }

                  else
                  {
                    os_log_t v167 = sub_1000DD86C();
                    v168 = (os_log_s *)objc_claimAutoreleasedReturnValue(v167);
                    if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v263 = 138543362;
                      *(void *)&v263[4] = self;
                      _os_log_impl( (void *)&_mh_execute_header,  v168,  OS_LOG_TYPE_ERROR,  "%{public}@ - Failed to determined results URL",  v263,  0xCu);
                    }

                    int v56 = 0;
                  }

                  _Block_object_dispose(&v218, 8);
                  _Block_object_dispose(v266, 8);

                  v164 = v204;
                }

                else
                {
                  os_log_t v163 = sub_1000DD86C();
                  v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
                  if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v165 = v230[5];
                    v166 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&v270[8] + 40LL);
                    *(_DWORD *)v266 = 138543874;
                    *(void *)&v266[4] = self;
                    *(_WORD *)&v266[12] = 2114;
                    *(void *)&v266[14] = v165;
                    *(_WORD *)&v266[22] = 2114;
                    v267 = v166;
                    _os_log_impl( (void *)&_mh_execute_header,  v164,  OS_LOG_TYPE_ERROR,  "%{public}@ - Received non-200 response when uploading library: %{public}@ error: %{public}@",  v266,  0x20u);
                  }

                  int v56 = 0;
                }
              }

              else
              {
                int v56 = 1;
              }

              -[CloudUpdateLibraryOperation setUploadLibraryRequest:](self, "setUploadLibraryRequest:", 0LL);

              _Block_object_dispose(&v229, 8);
              _Block_object_dispose(v270, 8);

              objc_autoreleasePoolPop(v190);
              v55 = (os_log_s *)v196;
            }

            BOOL v4 = v56 != 0;
            os_log_t v57 = (os_log_t)v200;
LABEL_101:

            _Block_object_dispose(v253, 8);
            _Block_object_dispose(&v255, 8);

            _Block_object_dispose(buf, 8);
LABEL_102:

            goto LABEL_103;
          }
        }

        else
        {
          v205 = 0LL;
        }

        os_log_t v57 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v270 = 138543362;
          *(void *)&v270[4] = self;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "%{public}@ - Failed to determined upload URL, skipping upload",  v270,  0xCu);
        }

        BOOL v4 = 0;
        goto LABEL_101;
      }

      v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        v8 = "%{public}@ - Setting should-upload to true because com.apple.itunescloudd:ForceLibraryUnification is set to YES";
        goto LABEL_11;
      }
    }

    unsigned int v201 = 1;
    goto LABEL_13;
  }

  objc_super v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Skipping _uploadLibrary because com.apple.itunescloudd:DisableLibraryUpload is set to YES",  buf,  0xCu);
  }

  BOOL v4 = 1;
LABEL_103:

  return v4;
}

- (void)_prepareLibraryForInitialUpdate
{
  unsigned int v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  v8 = sub_1000FCA90;
  uint64_t v9 = &unk_1001A64D0;
  v10 = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v3 = v11;
  [v3 performDatabaseTransactionWithBlock:&v6];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration", v6, v7, v8, v9, v10));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v4));
  [v5 cancelPendingChangesForLibraryType:1];
}

- (BOOL)_updateLibrary
{
  unsigned int v111 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 buildVersion]);

  uint64_t v174 = 0LL;
  os_log_t v175 = &v174;
  uint64_t v176 = 0x2020000000LL;
  int v177 = 0;
  uint64_t v170 = 0LL;
  uint64_t v171 = &v170;
  uint64_t v172 = 0x2020000000LL;
  char v173 = 0;
  uint64_t v166 = 0LL;
  os_log_t v167 = &v166;
  uint64_t v168 = 0x2020000000LL;
  char v169 = 0;
  uint64_t v162 = 0LL;
  os_log_t v163 = &v162;
  uint64_t v164 = 0x2020000000LL;
  char v165 = 0;
  uint64_t v158 = 0LL;
  id v159 = &v158;
  uint64_t v160 = 0x2020000000LL;
  char v161 = 0;
  uint64_t v154 = 0LL;
  id v155 = &v154;
  uint64_t v156 = 0x2020000000LL;
  char v157 = 0;
  v152[0] = 0LL;
  v152[1] = v152;
  v152[2] = 0x2020000000LL;
  char v153 = 0;
  v150[0] = 0LL;
  v150[1] = v150;
  v150[2] = 0x2020000000LL;
  char v151 = 0;
  uint64_t v146 = 0LL;
  uint64_t v147 = &v146;
  uint64_t v148 = 0x2020000000LL;
  char v149 = 0;
  uint64_t v140 = 0LL;
  v141 = &v140;
  uint64_t v142 = 0x3032000000LL;
  os_log_t v143 = sub_1000FC55C;
  v144 = sub_1000FC56C;
  id v145 = 0LL;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v5 = (uint64_t)[v4 sagaOnDiskDatabaseRevision];

  id v6 = [v112 sagaInitiateClientResetSync];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v112 valueForDatabaseProperty:@"MLCloudNeedsContainerRefetch"]);
  unsigned int v8 = [v7 BOOLValue];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v113 = (void *)objc_claimAutoreleasedReturnValue([v9 sagaClientFeaturesVersion]);

  v115 = (void *)objc_claimAutoreleasedReturnValue( +[ICUpdateRequest requestWithDatabaseRevision:]( &OBJC_CLASS___ICUpdateRequest,  "requestWithDatabaseRevision:",  1LL));
  [v115 setSagaClientFeaturesVersion:v113];
  updateTaskHelper = self->_updateTaskHelper;
  if ((unint64_t)updateTaskHelper <= 7 && ((1LL << (char)updateTaskHelper) & 0x8A) != 0)
  {
    uint64_t v11 = 2LL;
  }

  else if (-[CloudUpdateLibraryOperation allowNoisyAuthPrompt](self, "allowNoisyAuthPrompt"))
  {
    uint64_t v11 = 2LL;
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  if (MSVDeviceOSIsInternalInstall([v115 setVerificationInteractionLevel:v11]))
  {
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
    unsigned int v13 = [v12 shouldForceServerToUseDAAPDebugFeature];

    if (v13)
    {
      id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Defaults to use DAAP debug feature is set.",  buf,  0xCu);
      }

      [v115 setIncludeCloudLibraryDAAPDebugFeature:1];
    }
  }

  int v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v113;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = (_DWORD)v6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Starting update with onDiskDatabaseRevision=%u, onDiskClientFeaturesVersionString=%{public}@, sagaCli entInitiateResetSync=%{BOOL}u",  buf,  0x22u);
  }

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472LL;
  v127[2] = sub_1000FC630;
  v127[3] = &unk_1001A64F8;
  v131 = &v170;
  v132 = &v162;
  BOOL v133 = v152;
  v134 = &v154;
  v135 = v150;
  v136 = &v140;
  v137 = &v166;
  v138 = &v158;
  v139 = &v146;
  v130 = &v174;
  v127[4] = self;
  id v109 = v3;
  id v128 = v109;
  dispatch_semaphore_t dsema = v16;
  dispatch_semaphore_t v129 = dsema;
  [v111 sendRequest:v115 withResponseHandler:v127];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));
    int v19 = *((_DWORD *)v175 + 6);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Update finished with error=%{public}@, Server database revision: %u",  buf,  0x1Cu);
  }

  if (*((_BYTE *)v171 + 24))
  {
    int v20 = *((unsigned __int8 *)v163 + 24);
    if (v20 == 1) {
      uint64_t v21 = 1LL;
    }
    else {
      uint64_t v21 = 2LL * (v20 == 2);
    }
    v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t StringForAddToPlaylistBehavior = ICCloudClientGetStringForAddToPlaylistBehavior(v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue(StringForAddToPlaylistBehavior);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Update response contained add to playlist behavior: %{public}@",  buf,  0x16u);
    }

    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    objc_msgSend(v25, "icd_setSagaCloudAddToPlaylistBehavior:", v21);
  }

  if (*((_BYTE *)v167 + 24))
  {
    int v26 = *((unsigned __int8 *)v159 + 24);
    if (v26 == 1) {
      uint64_t v27 = 1LL;
    }
    else {
      uint64_t v27 = 2LL * (v26 == 2);
    }
    v28 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t StringForAddToLibraryBehavior = ICCloudClientGetStringForAddToLibraryBehavior(v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue(StringForAddToLibraryBehavior);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Update response contained add to library behavior: %{public}@",  buf,  0x16u);
    }

    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    objc_msgSend(v31, "icd_setSagaCloudFavoriteSongAddToLibraryBehavior:", v27);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));

  if (!v32)
  {
    uint64_t v41 = self;
    if (-[CloudUpdateLibraryOperation isCancelled](self, "isCancelled"))
    {
      -[CloudLibraryOperation setStatus:](self, "setStatus:", 4LL);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2001LL,  0LL));
      -[CloudLibraryOperation setError:](self, "setError:", v42);
    }

    else
    {
      if (*((_DWORD *)v175 + 6))
      {
        if ((v6 & 1) != 0 || *((_BYTE *)v147 + 24))
        {
          uint64_t v5 = 0LL;
        }

        else if ([v112 sagaNeedsFullUpdate])
        {
          uint64_t v5 = 1LL;
        }

        else
        {
          uint64_t v5 = v5;
        }

        int v45 = 1;
LABEL_53:
        v49 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v50 = [v112 sagaNeedsFullUpdate];
          int v51 = *((unsigned __int8 *)v155 + 24);
          *(_DWORD *)buf = 138544642;
          *(void *)&uint8_t buf[4] = v41;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v5;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = (_DWORD)v6;
          *(_WORD *)&_BYTE buf[24] = 1024;
          *(_DWORD *)&buf[26] = v8;
          *(_WORD *)&buf[30] = 1024;
          *(_DWORD *)&buf[32] = v50;
          __int16 v184 = 1024;
          int v185 = v51;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - onDiskDatabaseRevision=%d, sagaClientInitiateResetSync=%{BOOL}u, forceUpdate=%{BOOL}u, needs fu ll update (client=%{BOOL}u, server=%{BOOL}u)",  buf,  0x2Au);
        }

        if (!v45) {
          goto LABEL_113;
        }
        uint64_t v52 = self;
        if (*((_DWORD *)v175 + 6) == (_DWORD)v5)
        {
          if (!v8)
          {
            -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
            v93 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = self;
              _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - On-disk database revision is the same as the server database revision, skipping update.",  buf,  0xCu);
            }

            int64_t v94 = (void *)objc_claimAutoreleasedReturnValue([v112 valueForDatabaseProperty:@"MLCloudLastLibraryUpdate"]);
            unsigned int v95 = [v94 intValue];

            if (!v95)
            {
              id v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              os_log_t v97 = sub_1000DD86C();
              unsigned int v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = self;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 0;
                *(_WORD *)&buf[18] = 2114;
                *(void *)&buf[20] = v96;
                _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - lastSagaUpdateTimeOnDisk=%d. Setting it to %{public}@",  buf,  0x1Cu);
              }

              id v99 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
              [v99 setSagaLastLibraryUpdateTime:v96];
            }

            unsigned int v100 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
            __int16 v101 = (void *)objc_claimAutoreleasedReturnValue([v100 sagaLastCloudUpdateClientBuildVersion]);

            if (![v101 length]
              || [v109 length] && (objc_msgSend(v101, "isEqualToString:", v109) & 1) == 0)
            {
              id v102 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = self;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v101;
                *(_WORD *)&buf[22] = 2114;
                *(void *)&_BYTE buf[24] = v109;
                _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - clientBuildVersionOnDisk=%{public}@. Setting it to %{public}@",  buf,  0x20u);
              }

              uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
              [v103 setSagaLastCloudUpdateClientBuildVersion:v109];
            }

            goto LABEL_113;
          }

          id v53 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - On-disk database revision is the same as the server database revision, but force update is TRUE.",  buf,  0xCu);
          }

          uint64_t v52 = self;
        }

        v54 = objc_alloc(&OBJC_CLASS___SagaImporter);
        int v55 = *((unsigned __int8 *)v147 + 24);
        int v56 = v113;
        if ([(id)v141[5] length]) {
          int v56 = (void *)v141[5];
        }
        os_log_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](v52, "clientIdentity"));
        LODWORD(v106) = *((_DWORD *)v175 + 6);
        v58 = -[SagaImporter initWithConnection:serverInitiatedReset:clientInitiatedReset:clientFeaturesVersion:clientIdentity:fromRevision:toRevision:]( v54,  "initWithConnection:serverInitiatedReset:clientInitiatedReset:clientFeaturesVersion:clientIdentity:fromRe vision:toRevision:",  v111,  v55 != 0,  v6,  v56,  v57,  v5,  v106);
        -[CloudUpdateLibraryOperation setImporter:](v52, "setImporter:", v58);

        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000LL;
        _BYTE buf[24] = 0;
        dispatch_semaphore_t v59 = dispatch_semaphore_create(0LL);
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation importer](self, "importer"));
        v124[0] = _NSConcreteStackBlock;
        v124[1] = 3221225472LL;
        v124[2] = sub_1000FC8E8;
        v124[3] = &unk_1001A6520;
        v126 = buf;
        v124[4] = self;
        dispatch_semaphore_t v108 = v59;
        dispatch_semaphore_t v125 = v108;
        [v60 performUpdateWithCompletionHandler:v124];

        dispatch_semaphore_wait(v108, 0xFFFFFFFFFFFFFFFFLL);
        unsigned int v61 = self;
        if (MSVDeviceOSIsInternalInstall(-[CloudUpdateLibraryOperation setImporter:](self, "setImporter:", 0LL))
          && ((uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults")),
               unsigned int v63 = [v62 shouldTreatInitialSagaImportAsFailed],
               !(_DWORD)v5)
            ? (unsigned int v64 = v63)
            : (unsigned int v64 = 0),
              v62,
              unsigned int v61 = self,
              v64))
        {
          *(_BYTE *)(*(void *)&buf[8] + 24LL) = 0;
          uint64_t v65 = *((unsigned int *)v175 + 6);
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          [v66 setSagaOnDiskDatabaseRevision:v65];

          BYTE1(self->super._status) = 1;
          v67 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v179 = 138543362;
            v180 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - shouldTreatInitialSagaImportAsFailed is set. Will force initial import to fail.",  v179,  0xCu);
          }

          -[CloudLibraryOperation setStatus:](self, "setStatus:", 3LL);
          v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  0LL,  0LL));
          -[CloudLibraryOperation setError:](self, "setError:", v68);
        }

        else if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
        {
          -[CloudLibraryOperation setStatus:](v61, "setStatus:", 1LL);
          uint64_t v69 = *((unsigned int *)v175 + 6);
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](v61, "musicLibrary"));
          [v70 setSagaOnDiskDatabaseRevision:v69];

          uint64_t v71 = v141[5];
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          [v72 setSagaClientFeaturesVersion:v71];

          v73 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          [v73 setSagaLastCloudUpdateClientBuildVersion:v109];

          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          [v75 setSagaLastLibraryUpdateTime:v74];

          v76 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          LODWORD(v75) = [v76 sagaNeedsFullUpdate];

          if ((_DWORD)v75)
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
            [v77 setSagaNeedsFullUpdate:0];

            v78 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v179 = 138543362;
              v180 = self;
              _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Clearing flag to perform a reset sync.",  v179,  0xCu);
            }
          }

          v79 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          [v79 setSagaInitiateClientResetSync:0];

          if (!(_DWORD)v5)
          {
            v80 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v179 = 138543618;
              v180 = self;
              __int16 v181 = 2048;
              uint64_t v182 = 610000LL;
              _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Setting initial user version: %lli",  v179,  0x16u);
            }

            v81 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
            objc_msgSend(v81, "icd_setSagaDatabaseUserVersion:", 610000);

            Boolean keyExistsAndHasValidFormat = 0;
            if (!CFPreferencesGetAppBooleanValue( @"MusicShowCloudMediaEnabledSetting",  @"com.apple.mobileipod",  &keyExistsAndHasValidFormat)
              && keyExistsAndHasValidFormat)
            {
              CFPreferencesSetAppValue(@"MusicShowCloudMediaEnabledSetting", 0LL, @"com.apple.mobileipod");
              CFPreferencesAppSynchronize(@"com.apple.mobileipod");
              notify_post("com.apple.mobileipod-prefsChanged");
            }

            v82 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v179 = 138543362;
              v180 = self;
              _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Posting cloud library availability did change notification (library became available)",  v179,  0xCu);
            }

            [v112 notifyCloudLibraryAvailabilityDidChange];
            v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            id v84 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
            v121[0] = _NSConcreteStackBlock;
            v121[1] = 3221225472LL;
            v121[2] = sub_1000FC944;
            v121[3] = &unk_1001A6570;
            v121[4] = self;
            id v107 = v83;
            id v122 = v107;
            [v84 databaseConnectionAllowingWrites:0 withBlock:v121];

            if ([v107 count])
            {
              __int128 v119 = 0u;
              __int128 v120 = 0u;
              __int128 v117 = 0u;
              __int128 v118 = 0u;
              id obj = v107;
              id v85 = [obj countByEnumeratingWithState:&v117 objects:v178 count:16];
              if (v85)
              {
                uint64_t v86 = *(void *)v118;
                do
                {
                  for (i = 0LL; i != v85; i = (char *)i + 1)
                  {
                    if (*(void *)v118 != v86) {
                      objc_enumerationMutation(obj);
                    }
                    id v88 = [*(id *)(*((void *)&v117 + 1) + 8 * (void)i) longLongValue];
                    v89 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v179 = 138543618;
                      v180 = self;
                      __int16 v181 = 2048;
                      uint64_t v182 = (uint64_t)v88;
                      _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Triggering post-unification playlist artwork upload for playlist persistentID: %lld",  v179,  0x16u);
                    }

                    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v90));
                    v92 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
                    [v91 uploadArtworkForPlaylistWithPersistentID:v88 clientIdentity:v92 completionHandler:0];
                  }

                  id v85 = [obj countByEnumeratingWithState:&v117 objects:v178 count:16];
                }

                while (v85);
              }
            }
          }
        }

        else
        {
          BYTE1(v61->super._status) = 1;
          uint64_t v104 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v179 = 138543362;
            v180 = v61;
            _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Error importing cloud library payload. Will treat as permanent failure",  v179,  0xCu);
          }

          -[CloudLibraryOperation setStatus:](self, "setStatus:", 3LL);
        }

        _Block_object_dispose(buf, 8);
LABEL_113:
        BOOL v44 = (id)-[CloudLibraryOperation status](self, "status") == (id)1;
        goto LABEL_114;
      }

      -[CloudLibraryOperation setStatus:](self, "setStatus:", 5LL);
      NSErrorUserInfoKey v186 = NSLocalizedDescriptionKey;
      uint64_t v187 = @"Failed to get a database revision during library update operation";
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v187,  &v186,  1LL));
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2002LL,  v46));
      -[CloudLibraryOperation setError:](self, "setError:", v47);

      v48 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%{public}@ - Failed to get a non-zero server database revision.",  buf,  0xCu);
      }
    }

    int v45 = 0;
    uint64_t v41 = self;
    goto LABEL_53;
  }

  dispatch_semaphore_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));
  int v34 = (void *)objc_claimAutoreleasedReturnValue([v33 domain]);
  if (([v34 isEqualToString:ICCloudClientErrorDomain] & 1) == 0)
  {

LABEL_41:
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 5LL);
    v39 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%{public}@ - Received error when doing a library update request: %{public}@",  buf,  0x16u);
    }

    goto LABEL_43;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));
  BOOL v36 = [v35 code] == (id)2019;

  if (!v36) {
    goto LABEL_41;
  }
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 userInfo]);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v38 objectForKey:@"CloudLibraryConnectionRequestForbiddenAdditonalErrorCodeKey"]);

  if (-[os_log_s integerValue](v39, "integerValue") == (id)950)
  {
    id v40 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%{public}@ - Server response indicates the subscription has lapsed",  buf,  0xCu);
    }

    LOBYTE(self->super._status) = 1;
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 3LL);
  }

- (id)_determineResultsURLWhenReadyWithUpdateID:(id)a3 retryTimeout:(double)a4 responseStatusCode:(int64_t *)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation cuid](self, "cuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUpdateLibraryOperation troveID](self, "troveID"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  @"auto-update",  &__kCFBooleanFalse,  @"incremental",  &off_1001B46A8,  @"min-itunes-match-compatible-version",  &off_1001B46C0,  @"itunes-match-protocol-version",  v9,  @"cuid",  v10,  @"troveid",  v8,  @"update-id",  0LL));

  unsigned __int8 v12 = sub_10008DF80(0LL, @"cloud-library-update-check", 3LL, v11, 60.0);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    *(void *)&__int128 v58 = 0LL;
    *((void *)&v58 + 1) = &v58;
    uint64_t v59 = 0x3032000000LL;
    v60 = sub_1000FC55C;
    unsigned int v61 = sub_1000FC56C;
    id v62 = 0LL;
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x3032000000LL;
    v49 = sub_1000FC55C;
    unsigned int v50 = sub_1000FC56C;
    id v51 = 0LL;
    uint64_t v40 = 0LL;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000LL;
    uint64_t v43 = sub_1000FC55C;
    BOOL v44 = sub_1000FC56C;
    id v45 = 0LL;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000FC574;
    v35[3] = &unk_1001A6408;
    uint64_t v37 = &v58;
    v38 = &v46;
    v39 = &v40;
    id v14 = dispatch_semaphore_create(0LL);
    BOOL v36 = v14;
    [v13 startGeniusRequestWithRetryTimeout:@"determineResultsURL" debugName:v35 connectionResponseBlock:a4];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_t v16 = (void *)v41[5];
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 domain]);
      unsigned int v18 = [v17 isEqualToString:@"SSURLConnectionRequestGeniusAdditionsErrorDomain"];

      if (v18)
      {
        int v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v41[5] userInfo]);
        int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"server-status-code"]);
        int64_t v21 = (int64_t)[v20 integerValue];

        v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = v47[5];
          *(_DWORD *)buf = 138543874;
          id v53 = self;
          __int16 v54 = 2048;
          int64_t v55 = v21;
          __int16 v56 = 2114;
          uint64_t v57 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}@ - Failed to determine result URLs with server status code: %ld response: %{public}@",  buf,  0x20u);
        }

        v24 = 0LL;
LABEL_18:

        if (!a5)
        {
LABEL_20:
          BOOL v25 = v24;

          _Block_object_dispose(&v40, 8);
          _Block_object_dispose(&v46, 8);

          _Block_object_dispose(&v58, 8);
          int v26 = v25;
          goto LABEL_21;
        }

- (void)_clearAllCloudIDs
{
  if (-[CloudUpdateLibraryOperation uploadingLibraryIsSupported](self, "uploadingLibraryIsSupported"))
  {
    os_log_t v3 = (os_log_t)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000FC3C0;
    v4[3] = &unk_1001A6598;
    v4[4] = self;
    -[os_log_s performDatabaseTransactionWithBlock:](v3, "performDatabaseTransactionWithBlock:", v4);
  }

  else
  {
    os_log_t v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v6 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Uploading is not supported, no temporary cloud ids to clear.",  buf,  0xCu);
    }
  }
}

- (BOOL)uploadingLibraryIsSupported
{
  return self->_didSubscriptionStatusLapse;
}

- (void)setUploadingLibraryIsSupported:(BOOL)a3
{
  self->_didSubscriptionStatusLapse = a3;
}

- (BOOL)allowNoisyAuthPrompt
{
  return self->_didEncounterFatalErrorImportingPayload;
}

- (void)setAllowNoisyAuthPrompt:(BOOL)a3
{
  self->_didEncounterFatalErrorImportingPayload = a3;
}

- (BOOL)isExplicitUserAction
{
  return *(&self->_didEncounterFatalErrorImportingPayload + 1);
}

- (void)setIsExplicitUserAction:(BOOL)a3
{
  *(&self->_didEncounterFatalErrorImportingPayload + 1) = a3;
}

- (int64_t)reason
{
  return (int64_t)self->_updateTaskHelper;
}

- (void)setReason:(int64_t)a3
{
  self->_updateTaskHelper = (ICDCloudMusicLibrarySagaUpdateTaskHelper *)a3;
}

- (SagaImporter)importer
{
  return *(SagaImporter **)&self->_uploadingLibraryIsSupported;
}

- (void)setImporter:(id)a3
{
}

- (NSString)cuid
{
  return (NSString *)self->_reason;
}

- (void)setCuid:(id)a3
{
}

- (NSString)troveID
{
  return (NSString *)&self->_importer->super.isa;
}

- (void)setTroveID:(id)a3
{
}

- (ICStoreURLRequest)updateRequest
{
  return (ICStoreURLRequest *)self->_cuid;
}

- (void)setUpdateRequest:(id)a3
{
}

- (ICStoreURLRequest)uploadLibraryRequest
{
  return (ICStoreURLRequest *)self->_troveID;
}

- (void)setUploadLibraryRequest:(id)a3
{
}

- (ICStoreURLRequest)getResultsRequest
{
  return self->_updateRequest;
}

- (void)setGetResultsRequest:(id)a3
{
}

- (int64_t)uploadResponseStatus
{
  return (int64_t)self->_uploadLibraryRequest;
}

- (void)setUploadResponseStatus:(int64_t)a3
{
  self->_uploadLibraryRequest = (ICStoreURLRequest *)a3;
}

- (void).cxx_destruct
{
}

@end