@interface TKHostTokenDriver
- (BOOL)configureWithError:(id *)a3;
- (BOOL)valid;
- (NSExtension)extension;
- (NSString)classID;
- (NSUUID)requestIdentifier;
- (TKHostTokenDriver)initWithExtension:(id)a3 cache:(id)a4;
- (TKHostTokenDriverCache)cache;
- (TKTokenDriverHostContext)context;
- (id)acquireTokenWithSlot:(id)a3 AID:(id)a4 tokenID:(id *)a5 error:(id *)a6;
- (id)acquireTokenWithTokenID:(id)a3 error:(id *)a4;
- (id)contextWithError:(id *)a3;
- (id)description;
- (void)dealloc;
- (void)invalidate;
- (void)keepAlive:(BOOL)a3;
- (void)releaseTokenWithTokenID:(id)a3;
- (void)setExtension:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation TKHostTokenDriver

- (TKHostTokenDriver)initWithExtension:(id)a3 cache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TKHostTokenDriver;
  v9 = -[TKHostTokenDriver init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    objc_storeWeak((id *)&v10->_cache, v8);
  }

  return v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](self, "extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](self, "requestIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<TKHostTokenDriver:%p %@(%@)>",  self,  v4,  v5));

  return v6;
}

- (NSString)classID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](self, "extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attributes]);
  uint64_t v5 = TKTokenClassDriverClassIDKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TKTokenClassDriverClassIDKey]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    id v8 = sub_10000DFD0();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000114C0(v5, self);
    }
  }

  return (NSString *)v6;
}

- (void)keepAlive:(BOOL)a3
{
  alive = self->_alive;
  if (a3)
  {
    if (alive)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v10 handleFailureInMethod:a2 object:self file:@"TKHostTokenDriver.m" lineNumber:132 description:@"Attempted to create keepalive xaction when it already exists"];
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](self, "extension"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    id v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"extension holder for '%@'", v5));
    uint64_t v7 = (OS_os_transaction *)os_transaction_create([v6 UTF8String]);
    id v8 = self->_alive;
    self->_alive = v7;

    alive = (OS_os_transaction *)v11;
  }

  else
  {
    self->_alive = 0LL;
  }
}

- (void)invalidate
{
  id v3 = sub_10000DFD0();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100011564();
  }

  uint64_t v5 = self;
  objc_sync_enter(v5);
  v5->_invalidated = 1;
  -[TKHostTokenDriver keepAlive:](v5, "keepAlive:", 0LL);
  objc_sync_exit(v5);
}

- (BOOL)valid
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = !v2->_invalidated;
  objc_sync_exit(v2);

  return v3;
}

- (id)contextWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_invalidated)
  {
    id v5 = sub_10000DFD0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100011684();
    }

    if (!a3)
    {
LABEL_26:
      id v8 = 0LL;
      goto LABEL_27;
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4097LL,  0LL));
    id v8 = 0LL;
    goto LABEL_6;
  }

  SEL v62 = a2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](v4, "requestIdentifier"));

  v63 = v9;
  if (!v9)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver classID](v4, "classID"));
    objc_initWeak(&location, v4);
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_10000ECE8;
    v69[3] = &unk_10001C9C8;
    id v19 = v18;
    id v70 = v19;
    objc_copyWeak(&v71, &location);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](v4, "extension"));
    [v20 setRequestInterruptionBlock:v69];

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_10000ED78;
    v66[3] = &unk_10001C9F0;
    id v61 = v19;
    id v67 = v61;
    objc_copyWeak(&v68, &location);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](v4, "extension"));
    [v21 setRequestCancellationBlock:v66];

    id v22 = sub_10000DFD0();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100011624();
    }

    v24 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
    v78[0] = @"idleTimeout";
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_cache);
    [WeakRetained idleTimeout];
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v78[1] = @"avoidInitialKeepAlive";
    v79[0] = v26;
    id v27 = objc_loadWeakRetained((id *)&v4->_cache);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v27 avoidInitialKeepAlive]));
    v79[1] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  2LL));
    -[NSExtensionItem setUserInfo:](v24, "setUserInfo:", v29);

    for (int i = 0; ; ++i)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](v4, "extension"));
      v77 = v24;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v77, 1LL));
      id v65 = 0LL;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v31 beginExtensionRequestWithOptions:0 inputItems:v32 error:&v65]);
      id v34 = v65;
      -[TKHostTokenDriver setRequestIdentifier:](v4, "setRequestIdentifier:", v33);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](v4, "requestIdentifier"));
      LODWORD(v31) = v35 == 0LL;

      if (!(_DWORD)v31) {
        break;
      }
      if (i == 8
        || [v34 code] != (id)4099
        || (v36 = (void *)objc_claimAutoreleasedReturnValue([v34 domain]),
            unsigned int v37 = [v36 isEqualToString:NSCocoaErrorDomain],
            v36,
            !v37))
      {
        id v42 = sub_10000DFD0();
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](v4, "extension"));
          v55 = (void *)objc_claimAutoreleasedReturnValue([v54 identifier]);
          *(_DWORD *)buf = 138543618;
          v74 = v55;
          __int16 v75 = 2114;
          id v76 = v34;
          _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Token driver extension %{public}@ failed to start: %{public}@",  buf,  0x16u);
        }

        if (a3) {
          *a3 = v34;
        }
        id v44 = objc_loadWeakRetained((id *)&v4->_cache);
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver classID](v4, "classID"));
        [v44 removeDriverWithClassID:v45];

        objc_destroyWeak(&v68);
        objc_destroyWeak(&v71);

        objc_destroyWeak(&location);
        goto LABEL_26;
      }

      id v38 = sub_10000DFD0();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](v4, "extension"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 identifier]);
        *(_DWORD *)buf = 138543618;
        v74 = v41;
        __int16 v75 = 1024;
        LODWORD(v76) = i;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "beginExtensionRequest for %{public}@ failed %d time, retrying",  buf,  0x12u);
      }
    }

    id v49 = sub_10000DFD0();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      sub_1000115C4();
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](v4, "requestIdentifier"));
    uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSUUID);
    char isKindOfClass = objc_opt_isKindOfClass(v51, v52);

    if ((isKindOfClass & 1) == 0)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](v4, "requestIdentifier"));
      [v59 handleFailureInMethod:v62, v4, @"TKHostTokenDriver.m", 211, @"requestIdentifier of unexpected type: %@", v60 object file lineNumber description];
    }

    -[TKHostTokenDriver keepAlive:](v4, "keepAlive:", 1LL);

    objc_destroyWeak(&v68);
    objc_destroyWeak(&v71);

    objc_destroyWeak(&location);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](v4, "extension"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](v4, "requestIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 _extensionContextForUUID:v11]);

  if (v8)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver cache](v4, "cache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 registry]);
    [v8 setRegistry:v13];

    if (!v63)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenDriverProtocol]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 registry]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 listener]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 endpoint]);
      [v14 setConfigurationEndpoint:v17 reply:&stru_10001CA10];
    }
  }

  else
  {
    id v47 = sub_10000DFD0();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](v4, "extension"));
      v57 = (void *)objc_claimAutoreleasedReturnValue([v56 identifier]);
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](v4, "requestIdentifier"));
      *(_DWORD *)buf = 138543618;
      v74 = v57;
      __int16 v75 = 2114;
      id v76 = v58;
      _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to resolve requestIdentifier %{public}@ to context",  buf,  0x16u);
    }

    if (a3)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TKErrorDomain,  -7LL,  0LL));
LABEL_6:
      *a3 = v7;
    }
  }

- (TKTokenDriverHostContext)context
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](v2, "requestIdentifier"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](v2, "extension"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](v2, "requestIdentifier"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _extensionContextForUUID:v5]);
  }

  else
  {
    id v6 = 0LL;
  }

  objc_sync_exit(v2);

  return (TKTokenDriverHostContext *)v6;
}

- (id)acquireTokenWithTokenID:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 classID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver classID](self, "classID"));
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v27 handleFailureInMethod:a2, self, @"TKHostTokenDriver.m", 247, @"%@ asked to acquire token with bad class: %@", self, v7 object file lineNumber description];
  }

  id v11 = sub_10000DFD0();
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10001180C();
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver contextWithError:](self, "contextWithError:", a4));
  v14 = v13;
  if (v13)
  {
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x3032000000LL;
    id v34 = sub_10000F1D0;
    v35 = sub_10000F1E0;
    id v36 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 tokenDriverProtocol]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 instanceID]);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10000F1E8;
    v28[3] = &unk_10001CA38;
    v30 = &v31;
    id v17 = v14;
    id v29 = v17;
    [v15 acquireTokenWithInstanceID:v16 reply:v28];

    uint64_t v18 = v32[5];
    id v19 = sub_10000DFD0();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      if (v21) {
        sub_1000117AC();
      }

      id v22 = (id)v32[5];
    }

    else
    {
      if (v21)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](self, "extension"));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v17 error]);
        *(_DWORD *)buf = 138543618;
        id v38 = v25;
        __int16 v39 = 2114;
        v40 = v26;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "failed to acquire token from extension %{public}@, error:%{public}@",  buf,  0x16u);
      }

      id v22 = 0LL;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue([v17 error]);
      }
    }

    _Block_object_dispose(&v31, 8);
  }

  else
  {
    id v22 = 0LL;
  }

  return v22;
}

- (id)acquireTokenWithSlot:(id)a3 AID:(id)a4 tokenID:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = sub_10000DFD0();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000118D4(self, v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver contextWithError:](self, "contextWithError:", a6));
  v15 = v14;
  if (v14)
  {
    uint64_t v45 = 0LL;
    v46 = &v45;
    uint64_t v47 = 0x3032000000LL;
    v48 = sub_10000F1D0;
    id v49 = sub_10000F1E0;
    id v50 = 0LL;
    uint64_t v39 = 0LL;
    v40 = &v39;
    uint64_t v41 = 0x3032000000LL;
    id v42 = sub_10000F1D0;
    v43 = sub_10000F1E0;
    id v44 = 0LL;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 tokenDriverProtocol]);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10000F580;
    v35[3] = &unk_10001CA60;
    unsigned int v37 = &v45;
    id v38 = &v39;
    id v17 = v15;
    id v36 = v17;
    [v16 acquireTokenWithSlot:v10 AID:v11 reply:v35];

    if (v46[5])
    {
      uint64_t v18 = objc_alloc(&OBJC_CLASS___TKTokenID);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver classID](self, "classID"));
      *a5 = -[TKTokenID initWithClassID:instanceID:](v18, "initWithClassID:instanceID:", v19, v40[5]);

      id v20 = sub_10000DFD0();
      BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10001186C((uint64_t)a5, v21, v22, v23, v24, v25, v26, v27);
      }

      id v28 = (id)v46[5];
    }

    else
    {
      id v29 = sub_10000DFD0();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](self, "extension"));
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v17 error]);
        *(_DWORD *)buf = 138543618;
        uint64_t v52 = v33;
        __int16 v53 = 2114;
        v54 = v34;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "failed to acquire token from extension %{public}@, error:%{public}@",  buf,  0x16u);
      }

      id v28 = 0LL;
      if (a6) {
        *a6 = (id)objc_claimAutoreleasedReturnValue([v17 error]);
      }
    }

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }

  else
  {
    id v28 = 0LL;
  }

  return v28;
}

- (BOOL)configureWithError:(id *)a3
{
  id v5 = sub_10000DFD0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10001196C(self, v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver contextWithError:](self, "contextWithError:", a3));
  id v8 = v7;
  if (v7)
  {
    uint64_t v20 = 0LL;
    BOOL v21 = &v20;
    uint64_t v22 = 0x2020000000LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 tokenDriverProtocol]);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_10000F778;
    id v17 = &unk_10001CA88;
    id v19 = &v20;
    id v10 = v8;
    id v18 = v10;
    [v9 configureWithReply:&v14];

    int v11 = *((unsigned __int8 *)v21 + 24);
    if (a3 && !*((_BYTE *)v21 + 24))
    {
      *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error", v14, v15, v16, v17));
      int v11 = *((unsigned __int8 *)v21 + 24);
    }

    BOOL v12 = v11 != 0;

    _Block_object_dispose(&v20, 8);
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)releaseTokenWithTokenID:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000DFD0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100011A64();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver context](self, "context"));
  id v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 tokenDriverProtocol]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 instanceID]);
    [v9 releaseTokenWithInstanceID:v10 reply:&stru_10001CAA8];
  }

  id v11 = sub_10000DFD0();
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100011A04();
  }
}

- (void)dealloc
{
  id v3 = sub_10000DFD0();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100011AC4();
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](self, "requestIdentifier"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver extension](self, "extension"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenDriver requestIdentifier](self, "requestIdentifier"));
    [v6 cancelExtensionRequestWithIdentifier:v7];
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TKHostTokenDriver;
  -[TKHostTokenDriver dealloc](&v8, "dealloc");
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (TKHostTokenDriverCache)cache
{
  return (TKHostTokenDriverCache *)objc_loadWeakRetained((id *)&self->_cache);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end