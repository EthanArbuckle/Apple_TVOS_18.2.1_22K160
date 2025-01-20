@interface CPLDiagnoseService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CPLDiagnoseService)init;
- (id)_hardwareString;
- (id)_stringForSysctlKey:(id)a3;
- (id)applicationIdentifierForConnection:(id)a3;
- (id)diagnosticFilename:(BOOL)a3;
- (unsigned)takeUserIdlePowerAssertionWithInterval:(double)a3;
- (void)checkStateWithReplyHandler:(id)a3;
- (void)didInvalidateClientConnectionWithIdentifier:(id)a3;
- (void)notifyClientsStateChangedOnQueue;
- (void)releasePowerAssertion:(unsigned int)a3;
- (void)runDiagnoseWithLibraryURL:(id)a3 bundleID:(id)a4 outputDirectoryURL:(id)a5 includeDatabases:(BOOL)a6 includeSysdiagnose:(BOOL)a7 excludeSPLAndSyndication:(BOOL)a8 replyHandler:(id)a9;
- (void)runDiagnoseWithOptions:(id)a3 replyHandler:(id)a4;
@end

@implementation CPLDiagnoseService

- (CPLDiagnoseService)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPLDiagnoseService;
  v2 = -[CPLDiagnoseService init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    dispatch_queue_t v4 = dispatch_queue_create("CPLDiagnose.queue", &_dispatch_queue_attr_concurrent);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clientsByIdentifier = v3->_clientsByIdentifier;
    v3->_clientsByIdentifier = v6;
  }

  return v3;
}

- (id)_stringForSysctlKey:(id)a3
{
  size_t v4 = 256LL;
  v5[v4 - 1] = 0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v5));
}

- (id)_hardwareString
{
  if (qword_10003D3F8 != -1) {
    dispatch_once(&qword_10003D3F8, &stru_1000314F0);
  }
  return (id)qword_10003D3F0;
}

- (id)diagnosticFilename:(BOOL)a3
{
  v5 = localtime_r(&v12.tv_sec, &v11);
  strftime_l(v13, 0x28uLL, "%Y%m%d-%H%M%S", v5, 0LL);
  if (a3) {
    v6 = &stru_1000319D0;
  }
  else {
    v6 = (__CFString *)CPLDiagnosticsNoDatabases;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseService _hardwareString](self, "_hardwareString"));
  if ([v7 length])
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"," withString:@"-"]);

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-T%s%@.tgz",  CPLDiagnosticsName,  v8,  v13,  v6));
    v7 = (void *)v8;
  }

  else
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-T%s%@.tgz",  CPLDiagnosticsName,  v13,  v6));
  }

  return v9;
}

- (void)runDiagnoseWithOptions:(id)a3 replyHandler:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"LibraryURL"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"DiagnosticBundleID"]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"IncludeDatabases"]);
  v10 = v9;
  if (v9) {
    uint64_t v11 = (uint64_t)[v9 BOOLValue];
  }
  else {
    uint64_t v11 = 1LL;
  }
  timeval v12 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"IncludeSysdiagnose"]);
  id v13 = [v12 BOOLValue];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"ExcludeSPLAndSyndication"]);
  id v15 = [v14 BOOLValue];

  -[CPLDiagnoseService runDiagnoseWithLibraryURL:bundleID:outputDirectoryURL:includeDatabases:includeSysdiagnose:excludeSPLAndSyndication:replyHandler:]( self,  "runDiagnoseWithLibraryURL:bundleID:outputDirectoryURL:includeDatabases:includeSysdiagnose:excludeSPLAndSyndication:replyHandler:",  v7,  v8,  0LL,  v11,  v13,  v15,  v6);
}

- (void)runDiagnoseWithLibraryURL:(id)a3 bundleID:(id)a4 outputDirectoryURL:(id)a5 includeDatabases:(BOOL)a6 includeSysdiagnose:(BOOL)a7 excludeSPLAndSyndication:(BOOL)a8 replyHandler:(id)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  id v40 = a3;
  id v15 = a4;
  id v41 = a5;
  id v16 = a9;
  unsetenv("TMPDIR");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseService diagnosticFilename:](self, "diagnosticFilename:", v11));
  v18 = objc_alloc(&OBJC_CLASS___NSURL);
  v19 = -[NSURL initFileURLWithPath:isDirectory:](v18, "initFileURLWithPath:isDirectory:", CPLDiagnosticsLogsPath, 1LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v19, "URLByAppendingPathComponent:", v17));
  objc_storeStrong((id *)&self->_diagnosticFileURL, v20);
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x2020000000LL;
  char v53 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BA58;
  block[3] = &unk_100031518;
  block[4] = self;
  v49 = &v50;
  id v22 = v16;
  id v48 = v22;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v51 + 24))
  {
    -[CPLDiagnoseService releasePowerAssertion:](self, "releasePowerAssertion:", 0LL);
    v62[0] = NSLocalizedDescriptionKey;
    v62[1] = NSLocalizedFailureReasonErrorKey;
    v63[0] = @"Diagnostic request failed";
    v63[1] = @"Diagnose already in progress";
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v63,  v62,  2LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPLDiagnosticsService,  101LL,  v23));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001D0AC();
    }
    (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0LL, 0LL, v24);

    goto LABEL_26;
  }

  uint64_t v61 = 0LL;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  uint64_t v39 = CPLDiagnosticsService;
  v56[0] = [CPLDiagnosticsService UTF8String];
  v56[1] = "-S";
  v56[2] = "-o";
  id v25 = objc_claimAutoreleasedReturnValue([v20 path]);
  v56[3] = [v25 fileSystemRepresentation];

  if (v11)
  {
    uint64_t v26 = 4LL;
    if (a7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  *(void *)&__int128 v57 = "-D";
  uint64_t v26 = 5LL;
  if (!a7)
  {
LABEL_9:
    v56[v26] = "-s";
    uint64_t v26 = (v26 + 1);
  }

- (void)checkStateWithReplyHandler:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BB68;
  block[3] = &unk_100030FD8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)notifyClientsStateChangedOnQueue
{
  clientsByIdentifier = self->_clientsByIdentifier;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001BBE4;
  v4[3] = &unk_100031568;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( clientsByIdentifier,  "enumerateKeysAndObjectsUsingBlock:",  v4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.private.Photos.CPLDiagnose"]);
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "validated connection",  (uint8_t *)buf,  2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

    timeval v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CPLDiagnoseServiceProtocol));
    [v7 setExportedInterface:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CPLDiagnoseServiceClientProtocol));
    [v7 setRemoteObjectInterface:v13];

    [v7 setExportedObject:self];
    v33 = @"connectionIdentifier";
    v34 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    [v7 setUserInfo:v14];

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001BF44;
    block[3] = &unk_1000310B0;
    block[4] = self;
    id v16 = v7;
    id v31 = v16;
    id v17 = v11;
    id v32 = v17;
    dispatch_barrier_sync(queue, block);
    objc_initWeak(buf, self);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    id v25 = sub_10001BF68;
    uint64_t v26 = &unk_100031590;
    objc_copyWeak(&v28, buf);
    v18 = (__CFString *)v17;
    id v27 = v18;
    [v16 setInvalidationHandler:&v23];
    objc_msgSend(v16, "resume", v23, v24, v25, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak(buf);
  }

  else
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[CPLDiagnoseService applicationIdentifierForConnection:](self, "applicationIdentifierForConnection:", v7));
    v20 = (void *)v19;
    v21 = @"anonymous";
    if (v19) {
      v21 = (__CFString *)v19;
    }
    v18 = v21;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001D114();
    }
  }

  return v9;
}

- (void)didInvalidateClientConnectionWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001C024;
  v7[3] = &unk_100031540;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  dispatch_barrier_async(queue, v7);
}

- (id)applicationIdentifierForConnection:(id)a3
{
  id v3 = a3;
  if (qword_10003D408 != -1) {
    dispatch_once(&qword_10003D408, &stru_1000315B0);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForEntitlement:@"application-identifier"]);
  v5 = v4;
  if (v4 && ![v4 hasPrefix:@"com.apple."])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_10003D400,  "matchesInString:options:range:",  v5,  0,  0,  objc_msgSend(v5, "length")));
    if ([v7 count] == (id)1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
      if ([v8 numberOfRanges] == (id)2)
      {
        id v9 = [v8 rangeAtIndex:1];
        id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v9, v10));

LABEL_13:
        goto LABEL_14;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001D17C();
    }
    id v6 = 0LL;
    goto LABEL_13;
  }

  id v6 = v5;
LABEL_14:

  return v6;
}

- (unsigned)takeUserIdlePowerAssertionWithInterval:(double)a3
{
  IOPMAssertionID AssertionID = 0;
  IOReturn v4 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  CPLDiagnosticsService,  @"PhotosDiagnostics gathering diagnostics",  0LL,  0LL,  a3,  @"TimeoutActionTurnOff",  &AssertionID);
  unsigned int result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (result)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v8) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "failed to take power assertion: %d",  buf,  8u);
      return 0;
    }
  }

  else
  {
    if (result)
    {
      *(_DWORD *)buf = 134217984;
      double v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "taking power assertion for %.0fsec",  buf,  0xCu);
    }

    return AssertionID;
  }

  return result;
}

- (void)releasePowerAssertion:(unsigned int)a3
{
  if (a3)
  {
    IOPMAssertionRelease(a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "release power assertion",  v3,  2u);
    }
  }

- (void).cxx_destruct
{
}

@end