@interface ODRClient
+ (void)initialize;
- (void)beginODRSessionWithBundleURL:(id)a3 completionHandler:(id)a4;
- (void)beginWithBundleURL:(id)a3 completionHandler:(id)a4;
- (void)conditionallyPinTags:(id)a3 inBundle:(id)a4 completionHandler:(id)a5;
- (void)hello:(id)a3;
- (void)okToPurgeAssetPacks:(id)a3;
- (void)pinTags:(id)a3 inBundle:(id)a4 priority:(double)a5 completionHandler:(id)a6;
- (void)setAlwaysPreserved:(BOOL)a3 forTags:(id)a4 inBundle:(id)a5;
- (void)setLoadingPriority:(double)a3 forTags:(id)a4 inBundle:(id)a5;
- (void)setPreservationPriority:(double)a3 forTags:(id)a4 inBundle:(id)a5;
- (void)tagStateInBundle:(id)a3 completionHandler:(id)a4;
- (void)unpinTags:(id)a3 inBundle:(id)a4 completionHandler:(id)a5;
@end

@implementation ODRClient

+ (void)initialize
{
  if (qword_1004622F0 != -1) {
    dispatch_once(&qword_1004622F0, &stru_1003EC650);
  }
}

- (void)hello:(id)a3
{
  v4 = (void (**)(void))a3;
  v4[2]();
  if (!self->_isUnsupportedApp)
  {
    -[NSLock lock](self->_readyLock, "lock");
    v6 = (os_log_s *)objc_getProperty(self, v7, 72LL, 1);
    if (!v6) {
      goto LABEL_18;
    }
    uint64_t v8 = ASDLogHandleForCategory(19LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Doing the initial handshake with Application [%{public}@]",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x2020000000LL;
    uint64_t v24 = 1LL;
    id v10 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001F96A8;
    v19[3] = &unk_1003EB858;
    v19[4] = self;
    v19[5] = &buf;
    [v11 readUsingSession:v19];

    uint64_t v12 = *(void *)(*((void *)&buf + 1) + 24LL);
    if ((unint64_t)(v12 - 2) < 2)
    {
      v13 = sub_100290554(objc_alloc(&OBJC_CLASS___ODRApplicationImportTask), self->_application);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1001F9930;
      v18[3] = &unk_1003E9880;
      v18[4] = self;
      [v13 setCompletionBlock:v18];
      sub_1001E2DEC((uint64_t)&OBJC_CLASS___ODRTaskQueue, v13, 25LL);
    }

    else
    {
      if (v12 != 4)
      {
        if (v12 == 5)
        {
          sub_1001F96E4((uint64_t)self);
        }

        else
        {
          uint64_t v14 = ASDLogHandleForCategory(19LL);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            application = self->_application;
            *(_DWORD *)v20 = 138543362;
            v21 = application;
            _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Connected application does not support ODR: %{public}@",  v20,  0xCu);
          }

          sub_1001F9940((uint64_t)self);
        }

        goto LABEL_17;
      }

      v13 = sub_1001E9630(objc_alloc(&OBJC_CLASS___ODRApplicationRepairTask), self->_application);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1001F9938;
      v17[3] = &unk_1003E9880;
      v17[4] = self;
      [v13 setCompletionBlock:v17];
      sub_1001E2DEC((uint64_t)&OBJC_CLASS___ODRTaskQueue, v13, 25LL);
    }

LABEL_17:
    _Block_object_dispose(&buf, 8);
    goto LABEL_18;
  }

  uint64_t v5 = ASDLogHandleForCategory(19LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[ODRClient hello:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  (uint8_t *)&buf,  0xCu);
  }

- (void)beginODRSessionWithBundleURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v8 = (void (**)(id, void))a4;
  if (self->_isUnsupportedApp)
  {
    uint64_t v9 = ASDLogHandleForCategory(19LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v38) = 136446210;
      *(void *)((char *)&v38 + 4) = "-[ODRClient beginODRSessionWithBundleURL:completionHandler:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  (uint8_t *)&v38,  0xCu);
    }

    v8[2](v8, 0LL);
  }

  else
  {
    id v11 = objc_getProperty(self, v7, 72LL, 1);
    if (v11)
    {
      *(void *)&__int128 v38 = 0LL;
      *((void *)&v38 + 1) = &v38;
      uint64_t v39 = 0x3032000000LL;
      v40 = sub_1001F9094;
      v41 = sub_1001F90A4;
      id v42 = 0LL;
      id v12 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1001F9D64;
      v33[3] = &unk_1003EB858;
      v33[4] = self;
      v33[5] = &v38;
      [v13 readUsingSession:v33];

      uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 40LL);
      if (v14)
      {
        id v15 = sub_10020CB38(v14);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (v16)
        {
          id v17 = sub_1002FE4E0((uint64_t)&OBJC_CLASS___ODRServiceDelegate);
          uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
          v19 = (void *)v18;
          if (v18) {
            v20 = *(void **)(v18 + 32);
          }
          else {
            v20 = 0LL;
          }
          id v21 = v20;

          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v16]);
          id v23 = sub_1001F9DA8((uint64_t)self, v22);
          uint64_t v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue(v23);
          sandboxExtension = self->_sandboxExtension;
          self->_sandboxExtension = v24;

          uint64_t v26 = ASDLogHandleForCategory(19LL);
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = self->_sandboxExtension;
            *(_DWORD *)__int128 buf = 138543618;
            id v35 = v11;
            __int16 v36 = 2112;
            v37 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Granted sandbox extension to: %{public}@ %@",  buf,  0x16u);
          }
        }

        else
        {
          uint64_t v32 = ASDLogHandleForCategory(19LL);
          id v21 = (id)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138543362;
            id v35 = v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "No storage ID found in manifest for bundle ID %{public}@",  buf,  0xCu);
          }
        }
      }

      else
      {
        uint64_t v31 = ASDLogHandleForCategory(19LL);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138543362;
          id v35 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "No manifest found for bundle ID %{public}@",  buf,  0xCu);
        }
      }

      _Block_object_dispose(&v38, 8);
    }

    else
    {
      uint64_t v29 = ASDLogHandleForCategory(19LL);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v38) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Application handshake failed with no applicationID. No sandbox extensions will be granted.",  (uint8_t *)&v38,  2u);
      }
    }

    ((void (**)(id, NSDictionary *))v8)[2](v8, self->_sandboxExtension);
  }
}

- (void)beginWithBundleURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v8 = (void (**)(id, void, void *))a4;
  if (self->_isUnsupportedApp)
  {
    uint64_t v9 = ASDLogHandleForCategory(19LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v50) = 136446210;
      *(void *)((char *)&v50 + 4) = "-[ODRClient beginWithBundleURL:completionHandler:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  (uint8_t *)&v50,  0xCu);
    }

    NSErrorUserInfoKey v55 = NSDebugDescriptionErrorKey;
    v56 = @"On-Demand Resources are not available to this app";
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4099LL,  v11));
    v8[2](v8, 0LL, v12);
  }

  else
  {
    id v11 = objc_getProperty(self, v7, 72LL, 1);
    if (v11)
    {
      *(void *)&__int128 v50 = 0LL;
      *((void *)&v50 + 1) = &v50;
      uint64_t v51 = 0x3032000000LL;
      v52 = sub_1001F9094;
      v53 = sub_1001F90A4;
      id v54 = 0LL;
      id v13 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1001FA498;
      v39[3] = &unk_1003EB858;
      v39[4] = self;
      v39[5] = &v50;
      [v14 readUsingSession:v39];

      id v15 = *(void **)(*((void *)&v50 + 1) + 40LL);
      if (v15)
      {
        id v16 = sub_10020CB38(v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {
          id v18 = sub_1002FE4E0((uint64_t)&OBJC_CLASS___ODRServiceDelegate);
          uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
          v20 = (void *)v19;
          if (v19) {
            id v21 = *(void **)(v19 + 32);
          }
          else {
            id v21 = 0LL;
          }
          id v22 = v21;

          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByAppendingPathComponent:v17]);
          id v24 = sub_1001F9DA8((uint64_t)self, v23);
          v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue(v24);
          sandboxExtension = self->_sandboxExtension;
          self->_sandboxExtension = v25;

          uint64_t v27 = ASDLogHandleForCategory(19LL);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = self->_sandboxExtension;
            *(_DWORD *)__int128 buf = 138543618;
            id v47 = v11;
            __int16 v48 = 2112;
            v49 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Granted sandbox extension to: %{public}@ %@",  buf,  0x16u);
          }

          id v12 = 0LL;
        }

        else
        {
          id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No storage ID found in manifest for bundle ID %@",  v11));
          uint64_t v35 = ASDLogHandleForCategory(19LL);
          __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138543362;
            id v47 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }

          NSErrorUserInfoKey v44 = NSLocalizedFailureReasonErrorKey;
          id v45 = v22;
          id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _NSBundleResourceRequestErrorDomain,  101LL,  v23));
        }
      }

      else
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No manifest found for bundle ID %@",  v11));
        uint64_t v33 = ASDLogHandleForCategory(19LL);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138543362;
          id v47 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        NSErrorUserInfoKey v42 = NSLocalizedFailureReasonErrorKey;
        v43 = v17;
        id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _NSBundleResourceRequestErrorDomain,  100LL,  v22));
      }

      _Block_object_dispose(&v50, 8);
    }

    else
    {
      uint64_t v30 = ASDLogHandleForCategory(19LL);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v50) = 138543362;
        *(void *)((char *)&v50 + 4) = @"Application handshake failed with no application bundle ID. No sandbox extensions will be granted.";
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v50, 0xCu);
      }

      NSErrorUserInfoKey v40 = NSLocalizedFailureReasonErrorKey;
      v41 = @"Application handshake failed with no application bundle ID. No sandbox extensions will be granted.";
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _NSBundleResourceRequestErrorDomain,  100LL,  v32));
    }

    v37 = self->_sandboxExtension;
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue( +[ODRPublicErrorMapping publicErrorForError:]( &OBJC_CLASS____TtC9appstored21ODRPublicErrorMapping,  "publicErrorForError:",  v12));
    ((void (**)(id, NSDictionary *, void *))v8)[2](v8, v37, v38);
  }
}

- (void)tagStateInBundle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  SEL v7 = (void (**)(id, void, void *))a4;
  if (v6)
  {
    if (self->_isUnsupportedApp)
    {
      uint64_t v8 = ASDLogHandleForCategory(19LL);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[ODRClient tagStateInBundle:completionHandler:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  buf,  0xCu);
      }

      NSErrorUserInfoKey v45 = NSDebugDescriptionErrorKey;
      v46 = @"On-Demand Resources are not available to this app";
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4099LL,  v10));
      v7[2](v7, 0LL, v11);
    }

    else
    {
      context = objc_autoreleasePoolPush();
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v6 URLByResolvingSymlinksInPath]);

      uint64_t v15 = ASDLogHandleForCategory(19LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[ODRClient tagStateInBundle:completionHandler:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v34;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}s BundleURL [%{public}@]",  buf,  0x16u);
      }

      uint64_t v33 = self->_readyLock;
      -[NSLock lock](v33, "lock");
      void v39[6] = 0LL;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v34));
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundleResourceRequest _manifestWithBundle:error:]( &OBJC_CLASS___NSBundleResourceRequest,  "_manifestWithBundle:error:"));
      id v18 = 0LL;
      uint64_t v30 = v18;
      if (v17)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        *(void *)__int128 buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        NSErrorUserInfoKey v42 = sub_1001F9094;
        v43 = sub_1001F90A4;
        id v44 = 0LL;
        id v20 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_1001FAA9C;
        v39[3] = &unk_1003EB858;
        v39[4] = self;
        v39[5] = buf;
        [v21 readUsingSession:v39];

        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id v22 = *(id *)(*(void *)&buf[8] + 40LL);
        id v23 = [v22 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v36;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v36 != v24) {
                objc_enumerationMutation(v22);
              }
              uint64_t v26 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
              uint64_t v27 = (void *)objc_opt_new(&OBJC_CLASS____NSBundleODRTag);
              [v27 setAlwaysPreserved:sub_10023AC48(v26)];
              [v27 setPreservationPriority:sub_10023ACAC(v26)];
              id v28 = sub_10023AC88(v26);
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
              [v19 setObject:v27 forKeyedSubscript:v29];
            }

            id v23 = [v22 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }

          while (v23);
        }

        ((void (**)(id, void *, void *))v7)[2](v7, v19, 0LL);
        _Block_object_dispose(buf, 8);
      }

      else
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[ODRPublicErrorMapping publicErrorForError:]( &OBJC_CLASS____TtC9appstored21ODRPublicErrorMapping,  "publicErrorForError:",  v18));
        v7[2](v7, 0LL, v19);
      }

      -[NSLock unlock](v33, "unlock");
      objc_autoreleasePoolPop(context);
      id v6 = (id)v34;
    }
  }

  else
  {
    uint64_t v12 = ASDLogHandleForCategory(19LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "Ignoring call with nil bundle URL",  buf,  2u);
    }

    NSErrorUserInfoKey v47 = NSDebugDescriptionErrorKey;
    __int16 v48 = @"Required argument was missing";
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4099LL,  v6));
    v7[2](v7, 0LL, v14);
  }
}

- (void)pinTags:(id)a3 inBundle:(id)a4 priority:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void, void *))a6;
  if (self->_isUnsupportedApp)
  {
    uint64_t v13 = ASDLogHandleForCategory(19LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136446210;
      id v28 = "-[ODRClient pinTags:inBundle:priority:completionHandler:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  buf,  0xCu);
    }

    NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
    uint64_t v26 = @"On-Demand Resources are not available to this app";
    uint64_t v15 = (NSLock *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4099LL,  v15));
    v12[2](v12, 0LL, v16);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByResolvingSymlinksInPath]);

    uint64_t v15 = self->_readyLock;
    -[NSLock lock](v15, "lock");
    id v18 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001FAD28;
    v20[3] = &unk_1003EC6F0;
    uint8_t v20[4] = self;
    id v21 = v10;
    id v11 = v17;
    id v22 = v11;
    id v23 = v12;
    double v24 = a5;
    sub_1001CAA38((uint64_t)v19, v20);

    -[NSLock unlock](v15, "unlock");
  }
}

- (void)conditionallyPinTags:(id)a3 inBundle:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (self->_isUnsupportedApp)
  {
    uint64_t v11 = ASDLogHandleForCategory(19LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = "-[ODRClient conditionallyPinTags:inBundle:completionHandler:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  (uint8_t *)&buf,  0xCu);
    }

    v10[2](v10, 0LL, &__NSDictionary0__struct);
  }

  else
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 URLByResolvingSymlinksInPath]);

    uint64_t v14 = self->_readyLock;
    -[NSLock lock](v14, "lock");
    uint64_t v34 = 0LL;
    __int128 v35 = &v34;
    uint64_t v36 = 0x2020000000LL;
    char v37 = 0;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v43 = 0x3032000000LL;
    id v44 = sub_1001F9094;
    NSErrorUserInfoKey v45 = sub_1001F90A4;
    id v46 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000LL;
    char v33 = 0;
    id v15 = sub_1001FBA7C(self, v8);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (![v16 count])
    {
      uint64_t v17 = ASDLogHandleForCategory(19LL);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 v38 = 138543618;
        uint64_t v39 = v13;
        __int16 v40 = 2114;
        id v41 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Conditional pin failed with no tags fetched from set for bundleURL: %{public}@, tags in set: %{public}@",  v38,  0x16u);
      }

      *((_BYTE *)v35 + 24) = 1;
    }

    id v19 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1001FC348;
    v24[3] = &unk_1003EC740;
    id v21 = v16;
    uint64_t v27 = &v34;
    id v28 = &v30;
    p___int128 buf = &buf;
    id v25 = v21;
    uint64_t v26 = self;
    id v23 = objc_getProperty(self, v22, 72LL, 1);
    sub_1001CA7AC((uint64_t)v20, v24, v23);

    v10[2](v10, *((unsigned __int8 *)v31 + 24), *(void **)(*((void *)&buf + 1) + 40LL));
    -[NSLock unlock](v14, "unlock");

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v34, 8);
    id v9 = (id)v13;
  }
}

- (void)setLoadingPriority:(double)a3 forTags:(id)a4 inBundle:(id)a5
{
  id v7 = a4;
  if (self->_isUnsupportedApp)
  {
    uint64_t v8 = ASDLogHandleForCategory(19LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136446210;
      id v16 = "-[ODRClient setLoadingPriority:forTags:inBundle:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  buf,  0xCu);
    }
  }

  else
  {
    id v9 = self->_readyLock;
    -[os_log_s lock](v9, "lock");
    id v10 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001FCE48;
    v12[3] = &unk_1003EC880;
    v12[4] = self;
    id v13 = v7;
    double v14 = a3;
    sub_1001CAA38((uint64_t)v11, v12);

    -[os_log_s unlock](v9, "unlock");
  }
}

- (void)unpinTags:(id)a3 inBundle:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (self->_isUnsupportedApp)
  {
    uint64_t v11 = ASDLogHandleForCategory(19LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136446210;
      uint64_t v29 = "-[ODRClient unpinTags:inBundle:completionHandler:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  buf,  0xCu);
    }

    NSErrorUserInfoKey v26 = NSDebugDescriptionErrorKey;
    uint64_t v27 = @"On-Demand Resources are not available to this app";
    id v13 = (NSLock *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4099LL,  v13));
    v10[2](v10, 0LL, v14);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByResolvingSymlinksInPath]);

    id v13 = self->_readyLock;
    -[NSLock lock](v13, "lock");
    id v16 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    id v20 = sub_1001FD298;
    id v21 = &unk_1003EA5C0;
    SEL v22 = self;
    id v23 = v8;
    id v9 = v15;
    id v24 = v9;
    id v25 = v10;
    sub_1001CAA38((uint64_t)v17, &v18);

    -[NSLock unlock](v13, "unlock", v18, v19, v20, v21, v22);
  }
}

- (void)okToPurgeAssetPacks:(id)a3
{
  id v4 = a3;
  if (self->_isUnsupportedApp)
  {
    uint64_t v5 = ASDLogHandleForCategory(19LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136446210;
      id v16 = "-[ODRClient okToPurgeAssetPacks:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  buf,  0xCu);
    }
  }

  else
  {
    id v6 = self->_readyLock;
    -[os_log_s lock](v6, "lock");
    id v7 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    uint64_t v11 = sub_1001FDB6C;
    uint64_t v12 = &unk_1003E9DC0;
    id v13 = v4;
    double v14 = self;
    sub_1001CAA38((uint64_t)v8, &v9);

    -[os_log_s unlock](v6, "unlock", v9, v10, v11, v12);
  }
}

- (void)setPreservationPriority:(double)a3 forTags:(id)a4 inBundle:(id)a5
{
  id v7 = a4;
  if (self->_isUnsupportedApp)
  {
    uint64_t v8 = ASDLogHandleForCategory(19LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136446210;
      id v18 = "-[ODRClient setPreservationPriority:forTags:inBundle:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v10 = self->_readyLock;
    -[NSLock lock](v10, "lock");
    id v11 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001FDE40;
    v13[3] = &unk_1003EC790;
    id v14 = v7;
    id v15 = self;
    double v16 = a3;
    [v12 modifyUsingTransaction:v13];

    -[NSLock unlock](v10, "unlock");
  }
}

- (void)setAlwaysPreserved:(BOOL)a3 forTags:(id)a4 inBundle:(id)a5
{
  id v7 = a4;
  if (self->_isUnsupportedApp)
  {
    uint64_t v8 = ASDLogHandleForCategory(19LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136446210;
      id v18 = "-[ODRClient setAlwaysPreserved:forTags:inBundle:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Ignoring call from unsupported app (%{public}s)",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v10 = self->_readyLock;
    -[NSLock lock](v10, "lock");
    id v11 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001FE368;
    v13[3] = &unk_1003EC7B8;
    id v14 = v7;
    id v15 = self;
    BOOL v16 = a3;
    [v12 modifyUsingTransaction:v13];

    -[NSLock unlock](v10, "unlock");
  }
}

- (void).cxx_destruct
{
}

@end