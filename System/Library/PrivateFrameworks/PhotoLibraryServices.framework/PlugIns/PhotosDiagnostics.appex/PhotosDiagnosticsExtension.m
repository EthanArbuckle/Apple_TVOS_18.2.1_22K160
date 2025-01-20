@interface PhotosDiagnosticsExtension
- (PhotosDiagnosticsExtension)init;
- (id)_bundleIDFromParameters:(id)a3;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)latestArchiveWithinTimeCutoff:(double)a3 nameExclude:(id)a4;
- (id)photosDiagnosticIncludingDatabases:(BOOL)a3 bundleID:(id)a4;
- (void)diagnosticServiceStateDidChange:(char)a3 outputURL:(id)a4 error:(id)a5;
- (void)photosDiagnosticDone;
@end

@implementation PhotosDiagnosticsExtension

- (PhotosDiagnosticsExtension)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PhotosDiagnosticsExtension;
  v2 = -[PhotosDiagnosticsExtension init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[PhotosDiagnosticsExtension setLoggingConsent:](v2, "setLoggingConsent:", CPLDiagnosticsConsentText);
  }
  return v3;
}

- (id)latestArchiveWithinTimeCutoff:(double)a3 nameExclude:(id)a4
{
  id v5 = a4;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_100002BA8;
  v25 = sub_100002BB8;
  id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100002BA8;
  v19 = sub_100002BB8;
  id v20 = 0LL;
  NSURLResourceKey v27 = NSURLCreationDateKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100002DF0;
  v11[3] = &unk_1000041C0;
  id v7 = v5;
  id v12 = v7;
  v13 = &v21;
  v14 = &v15;
  +[PLDiagnostics enumerateDiagnosticsURLsIncludingPropertyiesForKeys:handler:]( &OBJC_CLASS___PLDiagnostics,  "enumerateDiagnosticsURLsIncludingPropertyiesForKeys:handler:",  v6,  v11);

  v8 = -[NSDate initWithTimeIntervalSinceNow:](objc_alloc(&OBJC_CLASS___NSDate), "initWithTimeIntervalSinceNow:", -a3);
  if ([(id)v22[5] compare:v8] == (id)1) {
    v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v16[5] path]);
  }
  else {
    v9 = 0LL;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)photosDiagnosticIncludingDatabases:(BOOL)a3 bundleID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "run photos diagnostics",  buf,  2u);
  }

  id v7 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  v8 = -[NSXPCConnection initWithServiceName:](v7, "initWithServiceName:", CPLDiagnosticsService);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CPLDiagnoseServiceProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CPLDiagnoseServiceClientProtocol));
  -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v10);

  -[NSXPCConnection setExportedObject:](v8, "setExportedObject:", self);
  -[NSXPCConnection resume](v8, "resume");
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v12,  @"IncludeDatabases");

  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v6,  @"DiagnosticBundleID");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"ExcludeSPLAndSyndication");
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"IncludeSysdiagnose");
  dispatch_block_t v13 = dispatch_block_create((dispatch_block_flags_t)0LL, &stru_100004200);
  id doneHandler = self->_doneHandler;
  self->_id doneHandler = v13;

  id v15 = objc_retainBlock(v13);
  *(void *)buf = 0LL;
  v22 = buf;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_100002BA8;
  v25 = sub_100002BB8;
  id v26 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100002BC0;
  v20[3] = &unk_100004228;
  v20[4] = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v8,  "synchronousRemoteObjectProxyWithErrorHandler:",  v20));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100002C98;
  v19[3] = &unk_100004250;
  v19[4] = buf;
  [v16 runDiagnoseWithOptions:v11 replyHandler:v19];

  if (*((void *)v22 + 5)) {
    dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  -[NSXPCConnection invalidate](v8, "invalidate");
  id v17 = *((id *)v22 + 5);
  _Block_object_dispose(buf, 8);

  return v17;
}

- (void)photosDiagnosticDone
{
  id doneHandler = (void (**)(id, SEL))self->_doneHandler;
  if (doneHandler)
  {
    doneHandler[2](doneHandler, a2);
    id v4 = self->_doneHandler;
    self->_id doneHandler = 0LL;
  }

- (id)attachmentList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLDiagnostics logDirectoryURL](&OBJC_CLASS___PLDiagnostics, "logDirectoryURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLDiagnostics matchingNameExpression](&OBJC_CLASS___PLDiagnostics, "matchingNameExpression"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PLDiagnostics excludingNameExpression](&OBJC_CLASS___PLDiagnostics, "excludingNameExpression"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PhotosDiagnosticsExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v3,  v4,  v5));

  return v6;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DEExtensionHostAppKey"]);
  else {
    unsigned int v6 = [v5 isEqualToString:@"com.apple.symptomsd"];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PhotosDiagnosticsExtension latestArchiveWithinTimeCutoff:nameExclude:]( self,  "latestArchiveWithinTimeCutoff:nameExclude:",  0LL,  600.0));
  BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v7) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "running for %@",  buf,  0xCu);
    }

    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "running for symptomsd/AutoBugCapture: skip databases and deleteOnAttach",  buf,  2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosDiagnosticsExtension _bundleIDFromParameters:](self, "_bundleIDFromParameters:", v4));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[PhotosDiagnosticsExtension photosDiagnosticIncludingDatabases:bundleID:]( self,  "photosDiagnosticIncludingDatabases:bundleID:",  v6 ^ 1,  v10));

    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Returning %@ as attachment",  buf,  0xCu);
      }

      dispatch_block_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v11));
      v14 = v13;
      if (v6) {
        [v13 setDeleteOnAttach:&__kCFBooleanTrue];
      }
      id v17 = v14;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

      id v7 = (void *)v11;
    }

    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = CPLDiagnosticsService;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ did not generate a Photos Diagnostic",  buf,  0xCu);
      }

      id v7 = 0LL;
      id v15 = &__NSArray0__struct;
    }
  }

  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = CPLDiagnosticsName;
      __int16 v21 = 2112;
      v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "found recent %@: %@",  buf,  0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:", v7));
    v18 = v10;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  }

  return v15;
}

- (id)_bundleIDFromParameters:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamBundleIDKey"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if ((objc_msgSend(&off_1000045D0, "containsObject:", v10, (void)v13) & 1) == 0)
          {
            id v11 = v10;
            goto LABEL_13;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v11 = 0LL;
LABEL_13:
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (void)diagnosticServiceStateDidChange:(char)a3 outputURL:(id)a4 error:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v6)
  {
LABEL_7:
    -[PhotosDiagnosticsExtension photosDiagnosticDone](self, "photosDiagnosticDone");
    goto LABEL_8;
  }

  if (v6 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 localizedFailureReason]);
      id v11 = (void *)v10;
      BOOL v12 = @"<unknown reason>";
      if (v10) {
        BOOL v12 = (const __CFString *)v10;
      }
      int v13 = 138543362;
      __int128 v14 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error running diagnose: %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_7;
  }

- (void).cxx_destruct
{
}

@end