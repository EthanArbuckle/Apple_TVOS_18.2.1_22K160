@interface JaliscoUpdateOperation
+ (OS_os_log)logCategory;
+ (OS_os_log)oversizeLogCategory;
- (BOOL)includeHiddenItems;
- (BOOL)isInitialImport;
- (BOOL)preflightImport;
- (JaliscoUpdateOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 reason:(int64_t)a5;
- (JaliscoUpdateOperation)initWithConfiguration:(id)a3 reason:(int64_t)a4 clientIdentity:(id)a5;
- (JaliscoUpdateOperation)initWithReason:(int64_t)a3;
- (NSDictionary)powerEventPayload;
- (NSString)powerEventBeginName;
- (NSString)powerEventEndName;
- (float)updateProgress;
- (id)newImporter;
- (id)queryFilterPercentEscaped;
- (int64_t)localDatabaseRevision;
- (unsigned)_serverDatabaseRevision:(unsigned int)a3;
- (void)cancel;
- (void)handleSuccess:(int64_t)a3;
- (void)main;
- (void)performUpdate;
- (void)setInitialImport:(BOOL)a3;
- (void)setPowerEventBeginName:(id)a3;
- (void)setPowerEventEndName:(id)a3;
- (void)setPowerEventPayload:(id)a3;
- (void)setReason:(int64_t)a3;
@end

@implementation JaliscoUpdateOperation

- (JaliscoUpdateOperation)initWithReason:(int64_t)a3
{
  v5 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, a2);
  uint64_t v7 = MSVTCCIdentityForCurrentProcess(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[JaliscoUpdateOperation initWithConfiguration:clientIdentity:reason:]( self,  "initWithConfiguration:clientIdentity:reason:",  v5,  v8,  a3);

  return v9;
}

- (JaliscoUpdateOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 reason:(int64_t)a5
{
  return -[JaliscoUpdateOperation initWithConfiguration:reason:clientIdentity:]( self,  "initWithConfiguration:reason:clientIdentity:",  a3,  a5,  a4);
}

- (JaliscoUpdateOperation)initWithConfiguration:(id)a3 reason:(int64_t)a4 clientIdentity:(id)a5
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___JaliscoUpdateOperation;
  uint64_t v6 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v25,  "initWithConfiguration:clientIdentity:",  a3,  a5);
  uint64_t v7 = v6;
  if (v6)
  {
    int64_t v8 = -[JaliscoUpdateOperation localDatabaseRevision](v6, "localDatabaseRevision");
    -[JaliscoUpdateOperation setInitialImport:](v7, "setInitialImport:", v8 == 0);
    -[JaliscoUpdateOperation setReason:](v7, "setReason:", a4);
    importer = v7->_importer;
    v7->_importer = (JaliscoImporter *)@"UpdateOperationBegin";

    v10 = *(void **)&v7->_initialImport;
    *(void *)&v7->_initialImport = @"UpdateOperationEnd";

    if (v8)
    {
      v26[0] = @"reason";
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      v26[1] = @"class";
      v27[0] = v11;
      v13 = (objc_class *)objc_opt_class(v7, v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v27[1] = v15;
      v16 = v27;
      v17 = v26;
      uint64_t v18 = 2LL;
    }

    else
    {
      v28[0] = @"reason";
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      v29[0] = v11;
      v28[1] = @"class";
      v20 = (objc_class *)objc_opt_class(v7, v19);
      v21 = NSStringFromClass(v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v28[2] = @"initial";
      v29[1] = v15;
      v29[2] = &off_1001B41E0;
      v16 = v29;
      v17 = v28;
      uint64_t v18 = 3LL;
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v17,  v18));
    powerEventBeginName = v7->_powerEventBeginName;
    v7->_powerEventBeginName = (NSString *)v22;
  }

  return v7;
}

- (void)setInitialImport:(BOOL)a3
{
  LOBYTE(self->_reason) = a3;
}

- (void)setReason:(int64_t)a3
{
  self->super._status = a3;
}

- (void)cancel
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___JaliscoUpdateOperation;
  -[JaliscoUpdateOperation cancel](&v7, "cancel");
  id v4 = objc_msgSend((id)objc_opt_class(self, v3), "logCategory");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cancelling update...", buf, 0xCu);
  }

  uint64_t v6 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"JaliscoImporterErrorDomain",  -2LL,  0LL);
  -[CloudLibraryOperation setError:](self, "setError:", v6);

  -[CloudLibraryOperation setStatus:](self, "setStatus:", 4LL);
  -[NSError cancel](self->super._error, "cancel");
}

- (void)main
{
  id v3 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
  v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v14 = [v3 initWithName:v7];

  [v14 beginTransaction];
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v8 setClientIdentity:v9];

  -[JaliscoUpdateOperation performUpdate](self, "performUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v12 = MSVTCCIdentityForCurrentProcess(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v10 setClientIdentity:v13];

  [v14 endTransaction];
}

- (id)queryFilterPercentEscaped
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:109 description:@"Must Subclass"];

  return 0LL;
}

- (int64_t)localDatabaseRevision
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:114 description:@"Must Subclass"];

  return 0LL;
}

- (BOOL)includeHiddenItems
{
  return 0;
}

- (BOOL)preflightImport
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:123 description:@"Must Subclass"];

  return 0;
}

- (id)newImporter
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:128 description:@"Must Subclass"];

  return 0LL;
}

- (void)handleSuccess:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3));
  [v5 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:133 description:@"Must Subclass"];
}

- (unsigned)_serverDatabaseRevision:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  int v26 = 0;
  id v5 = objc_autoreleasePoolPush();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICUpdateRequest requestWithDatabaseRevision:]( &OBJC_CLASS___ICUpdateRequest,  "requestWithDatabaseRevision:",  v3));
  [v6 setReason:self->super._status];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoUpdateOperation queryFilterPercentEscaped](self, "queryFilterPercentEscaped"));
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "logCategory");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v28 = self;
    __int16 v29 = 2114;
    v30 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Query Filter: %{public}@",  buf,  0x16u);
  }

  if ([v7 length]) {
    [v6 setValue:v7 forArgument:@"query"];
  }
  if (-[JaliscoUpdateOperation includeHiddenItems](self, "includeHiddenItems")) {
    [v6 setValue:@"1" forArgument:@"includeHiddenItems"];
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000DC8E0;
  v20[3] = &unk_1001A5A20;
  uint64_t v22 = &v23;
  v20[4] = self;
  v13 = v11;
  v21 = v13;
  [v12 sendRequest:v6 withResponseHandler:v20];

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  objc_autoreleasePoolPop(v5);
  id v15 = objc_msgSend((id)objc_opt_class(self, v14), "logCategory");
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = *((_DWORD *)v24 + 6);
    *(_DWORD *)buf = 138543618;
    v28 = self;
    __int16 v29 = 1024;
    LODWORD(v30) = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Server database revision: %u",  buf,  0x12u);
  }

  unsigned int v18 = *((_DWORD *)v24 + 6);
  _Block_object_dispose(&v23, 8);
  return v18;
}

- (void)performUpdate
{
  if (!-[JaliscoUpdateOperation preflightImport](self, "preflightImport"))
  {
    id v5 = objc_msgSend((id)objc_opt_class(self, v3), "logCategory");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v59 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No library for import.",  buf,  0xCu);
    }

    goto LABEL_9;
  }

  if (!-[JaliscoUpdateOperation localDatabaseRevision](self, "localDatabaseRevision") && sub_1000B1B34())
  {
    uint64_t v4 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v59 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Skipping initial import on non standalone wOS platform",  buf,  0xCu);
    }

    return;
  }

  uint64_t v7 = -[JaliscoUpdateOperation _serverDatabaseRevision:](self, "_serverDatabaseRevision:", 1LL);
  if (-[JaliscoUpdateOperation isCancelled](self, "isCancelled"))
  {
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 4LL);
    return;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error"));

  if (!v8)
  {
    if ((_DWORD)v7)
    {
      int64_t v13 = -[JaliscoUpdateOperation localDatabaseRevision](self, "localDatabaseRevision");
      id v15 = objc_msgSend((id)objc_opt_class(self, v14), "logCategory");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v59 = self;
        __int16 v60 = 1024;
        LODWORD(v61) = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - On-disk database revision: %u",  buf,  0x12u);
      }

      int v17 = -[JaliscoUpdateOperation newImporter](self, "newImporter");
      error = self->super._error;
      self->super._error = v17;

      unsigned int v19 = -[NSError needsUpdateForTokens](self->super._error, "needsUpdateForTokens");
      else {
        int v21 = 1;
      }
      if (v21 == 1)
      {
        if (v19) {
          -[NSError clearNeedsUpdateForTokens](self->super._error, "clearNeedsUpdateForTokens");
        }
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        [v22 systemUptime];
        double v24 = v23;

        id v26 = objc_msgSend((id)objc_opt_class(self, v25), "logCategory");
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = (void *)objc_opt_class(self->super._error, v28);
          v30 = self->super._error;
          *(_DWORD *)buf = 138543874;
          v59 = self;
          __int16 v60 = 2114;
          v61 = v29;
          __int16 v62 = 2048;
          v63 = v30;
          id v31 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Importer: <%{public}@ %p>",  buf,  0x20u);
        }

        uint64_t v54 = 0LL;
        v55 = &v54;
        uint64_t v56 = 0x2020000000LL;
        char v57 = 0;
        dispatch_semaphore_t v32 = dispatch_semaphore_create(0LL);
        +[ICDPowerEventLogger logEvent:payload:]( &OBJC_CLASS___ICDPowerEventLogger,  "logEvent:payload:",  self->_importer,  self->_powerEventBeginName);
        v33 = self->super._error;
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472LL;
        v51[2] = sub_1000DC884;
        v51[3] = &unk_1001A6520;
        v53 = &v54;
        v51[4] = self;
        v35 = v32;
        v52 = v35;
        -[NSError importTracksUpToRevision:clientIdentity:withCompletionHandler:]( v33,  "importTracksUpToRevision:clientIdentity:withCompletionHandler:",  v7,  v34,  v51);

        dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
        +[ICDPowerEventLogger logEvent:payload:]( &OBJC_CLASS___ICDPowerEventLogger,  "logEvent:payload:",  *(void *)&self->_initialImport,  self->_powerEventBeginName);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        [v36 systemUptime];
        double v38 = v37;

        id v40 = objc_msgSend((id)objc_opt_class(self, v39), "logCategory");
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v43 = (void *)objc_opt_class(self->super._error, v42);
          v44 = self->super._error;
          *(_DWORD *)buf = 138544130;
          v59 = self;
          __int16 v60 = 2114;
          v61 = v43;
          __int16 v62 = 2048;
          v63 = v44;
          __int16 v64 = 2048;
          double v65 = v38 - v24;
          id v45 = v43;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - <%{public}@ %p> required: %gs to process",  buf,  0x2Au);
        }

        if ((-[JaliscoUpdateOperation isCancelled](self, "isCancelled") & 1) != 0)
        {
          uint64_t v46 = 4LL;
        }

        else if (*((_BYTE *)v55 + 24))
        {
          -[JaliscoUpdateOperation handleSuccess:](self, "handleSuccess:", v7);
          uint64_t v46 = 1LL;
        }

        else
        {
          uint64_t v46 = 2LL;
        }

        -[CloudLibraryOperation setStatus:](self, "setStatus:", v46);

        _Block_object_dispose(&v54, 8);
      }

      else
      {
        id v48 = objc_msgSend((id)objc_opt_class(self, v20), "logCategory");
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - On-disk database revision is the same as the server revision, skipping update...",  buf,  0xCu);
        }

        -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
      }

      v50 = self->super._error;
      self->super._error = 0LL;

      goto LABEL_10;
    }

    id v47 = objc_msgSend((id)objc_opt_class(self, v9), "logCategory");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v59 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No database revision to update to.",  buf,  0xCu);
    }

- (float)updateProgress
{
  return result;
}

- (BOOL)isInitialImport
{
  return self->_reason;
}

- (NSString)powerEventBeginName
{
  return (NSString *)&self->_importer->super.isa;
}

- (void)setPowerEventBeginName:(id)a3
{
}

- (NSString)powerEventEndName
{
  return *(NSString **)&self->_initialImport;
}

- (void)setPowerEventEndName:(id)a3
{
}

- (NSDictionary)powerEventPayload
{
  return (NSDictionary *)self->_powerEventBeginName;
}

- (void)setPowerEventPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (OS_os_log)logCategory
{
  id v4 = +[JaliscoUpdateOperation instanceMethodForSelector:]( &OBJC_CLASS___JaliscoUpdateOperation,  "instanceMethodForSelector:",  a2);
  if (v4 == objc_msgSend((id)objc_opt_class(a1, v5), "instanceMethodForSelector:", a2))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v10 = (objc_class *)objc_opt_class(a1, v9);
    dispatch_semaphore_t v11 = NSStringFromClass(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int64_t v13 = NSStringFromSelector(a2);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v8 handleFailureInMethod:a2, a1, @"JaliscoUpdateOperation.m", 31, @"Subclass %@ must implement -%@ defined in %@.", v12, v14, @"JaliscoUpdateOperation" object file lineNumber description];
  }

  id v6 = &_os_log_default;
  return (OS_os_log *)&_os_log_default;
}

+ (OS_os_log)oversizeLogCategory
{
  id v4 = +[JaliscoUpdateOperation instanceMethodForSelector:]( &OBJC_CLASS___JaliscoUpdateOperation,  "instanceMethodForSelector:",  a2);
  if (v4 == objc_msgSend((id)objc_opt_class(a1, v5), "instanceMethodForSelector:", a2))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v10 = (objc_class *)objc_opt_class(a1, v9);
    dispatch_semaphore_t v11 = NSStringFromClass(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int64_t v13 = NSStringFromSelector(a2);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v8 handleFailureInMethod:a2, a1, @"JaliscoUpdateOperation.m", 36, @"Subclass %@ must implement -%@ defined in %@.", v12, v14, @"JaliscoUpdateOperation" object file lineNumber description];
  }

  id v6 = &_os_log_default;
  return (OS_os_log *)&_os_log_default;
}

@end