@interface CLDiagnosticManager
+ (BOOL)isSupported;
- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5;
- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 copyingItemAtURL:(id)a5 toURL:(id)a6;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLDiagnosticManager)init;
- (NSFileManager)fileManager;
- (NSMutableSet)registeredFiles;
- (NSURL)mobileCrashReporterPath;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (id)pathForDate:(id)a3 withBasePath:(id)a4;
- (void)beginService;
- (void)copyRegisteredFilesWithHandler:(id)a3;
- (void)endService;
- (void)registerFileForCollection:(id)a3;
- (void)setConnection:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setListener:(id)a3;
- (void)setRegisteredFiles:(id)a3;
- (void)unregisterFileForCollection:(id)a3;
@end

@implementation CLDiagnosticManager

+ (BOOL)isSupported
{
  return 1;
}

- (CLDiagnosticManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDiagnosticManager;
  return -[CLDiagnosticManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLDiagnosticManagerServiceProtocol,  &OBJC_PROTOCOL___CLDiagnosticManagerClientProtocol);
}

- (void)beginService
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101842658);
  }
  objc_super v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#diagnosticManager beginService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    v7[0] = 0;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "#diagnosticManager beginService",  v7,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDiagnosticManager beginService]", "%s\n", v6);
  }

  self->_registeredFiles = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v4 = objc_opt_new(&OBJC_CLASS___NSFileManager);
  self->_fileManager = v4;
  -[NSFileManager setDelegate:](v4, "setDelegate:", self);
  v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.locationd.diagnostic");
  self->_listener = v5;
  -[NSXPCListener setDelegate:](v5, "setDelegate:", self);
  -[NSXPCListener _setQueue:]( self->_listener,  "_setQueue:",  objc_msgSend(objc_msgSend(-[CLDiagnosticManager universe](self, "universe"), "silo"), "queue"));
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)endService
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101842658);
  }
  objc_super v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#diagnosticManager endService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    v5[0] = 0;
    v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "#diagnosticManager endService",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDiagnosticManager endService]", "%s\n", v4);
  }

  self->_fileManager = 0LL;
  -[NSXPCListener invalidate](self->_listener, "invalidate");

  self->_listener = 0LL;
  self->_registeredFiles = 0LL;
}

- (void)registerFileForCollection:(id)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101842658);
  }
  v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Add file to #diagnosticManager: %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    int v10 = 138543362;
    id v11 = a3;
    v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "Add file to #diagnosticManager: %{public}@",  &v10,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDiagnosticManager registerFileForCollection:]", "%s\n", v7);
  }

  if (a3)
  {
    -[NSMutableSet addObject:](-[CLDiagnosticManager registeredFiles](self, "registeredFiles"), "addObject:", a3);
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Trying to register a nil NSURL", buf, 2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101842658);
      }
      LOWORD(v10) = 0;
      LODWORD(v9) = 2;
      v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  17LL,  "Trying to register a nil NSURL",  &v10,  v9);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLDiagnosticManager registerFileForCollection:]", "%s\n", v8);
    }
  }

- (void)unregisterFileForCollection:(id)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101842658);
  }
  v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Remove file to #diagnosticManager: %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    int v10 = 138543362;
    id v11 = a3;
    v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "Remove file to #diagnosticManager: %{public}@",  &v10,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDiagnosticManager unregisterFileForCollection:]", "%s\n", v7);
  }

  if (a3)
  {
    -[NSMutableSet removeObject:](-[CLDiagnosticManager registeredFiles](self, "registeredFiles"), "removeObject:", a3);
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Trying to unregister a nil NSURL", buf, 2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101842658);
      }
      LOWORD(v10) = 0;
      LODWORD(v9) = 2;
      v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  17LL,  "Trying to unregister a nil NSURL",  &v10,  v9);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLDiagnosticManager unregisterFileForCollection:]", "%s\n", v8);
    }
  }

- (void)copyRegisteredFilesWithHandler:(id)a3
{
  id v5 = -[CLDiagnosticManager pathForDate:withBasePath:]( self,  "pathForDate:withBasePath:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  -[CLDiagnosticManager mobileCrashReporterPath](self, "mobileCrashReporterPath"));
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101842658);
  }
  v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v32 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client requested #diagnosticManager file copy to dest: %@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    int v29 = 138412290;
    id v30 = v5;
    v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "Client requested #diagnosticManager file copy to dest: %@",  &v29,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDiagnosticManager copyRegisteredFilesWithHandler:]", "%s\n", v19);
  }

  id v27 = 0LL;
  -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( -[CLDiagnosticManager fileManager](self, "fileManager"),  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v5,  0LL,  0LL,  0LL);
  v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v7 = -[CLDiagnosticManager registeredFiles](self, "registeredFiles");
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v8)
  {
    id v9 = v8;
    id v21 = a3;
    uint64_t v10 = *(void *)v24;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v11);
        id v13 = objc_msgSend(v5, "URLByAppendingPathComponent:", objc_msgSend(v12, "lastPathComponent"));
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101842658);
        }
        v14 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v32 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "diagnosticManager trying to copy file: %@",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101842658);
          }
          int v29 = 138412290;
          id v30 = v12;
          LODWORD(v20) = 12;
          v16 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  1LL,  "diagnosticManager trying to copy file: %@",  &v29,  v20);
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDiagnosticManager copyRegisteredFilesWithHandler:]", "%s\n", v16);
        }

        -[NSFileManager copyItemAtURL:toURL:error:]( -[CLDiagnosticManager fileManager](self, "fileManager"),  "copyItemAtURL:toURL:error:",  v12,  v13,  &v27);
        if (v27)
        {
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101842658);
          }
          v15 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289794;
            *(_DWORD *)v32 = 0;
            *(_WORD *)&v32[4] = 2082;
            *(void *)&v32[6] = "";
            __int16 v33 = 2114;
            v34 = v12;
            __int16 v35 = 2114;
            id v36 = v13;
            __int16 v37 = 2114;
            id v38 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Failed to copy diagnostic file, srcURL:%{public, location:escape_only}@, ds tURL:%{public, location:escape_only}@, error:%{public, location:escape_only}@}",  buf,  0x30u);
          }
        }

        else
        {
          -[NSMutableArray addObject:](v22, "addObject:", v13);
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
      id v9 = v17;
    }

    while (v17);
    id v18 = v27;
    a3 = v21;
  }

  else
  {
    id v18 = 0LL;
  }

  (*((void (**)(id, NSMutableArray *, id))a3 + 2))(a3, v22, v18);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101842658);
  }
  v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "#diagnosticManager received new XPC Connection request",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    LOWORD(v25) = 0;
    id v18 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  1LL,  "#diagnosticManager received new XPC Connection request",  &v25,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]", "%s\n", v18);
  }

  if (a4)
  {
    id v7 = [a4 valueForEntitlement:@"com.apple.locationd.diagnostic"];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if (objc_opt_isKindOfClass(v8, v9) & 1) != 0 && ([v8 BOOLValue])
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_1005CA0E8;
        v24[3] = &unk_10181A288;
        v24[4] = self;
        [a4 setInterruptionHandler:v24];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1005CA290;
        v23[3] = &unk_10181A288;
        v23[4] = self;
        [a4 setInvalidationHandler:v23];
        objc_msgSend( a4,  "_setQueue:",  objc_msgSend(objc_msgSend(-[CLDiagnosticManager universe](self, "universe"), "silo"), "queue"));
        objc_msgSend( a4,  "setExportedInterface:",  +[NSXPCInterface interfaceWithProtocol:]( NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CLDiagnosticManagerXPCServerInterface));
        [a4 setExportedObject:self];
        -[CLDiagnosticManager setConnection:](self, "setConnection:", a4);
        [a4 resume];
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101842658);
        }
        uint64_t v10 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v28 = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#diagnosticManager Resuming XPC Connection: %@",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101842658);
          }
          int v25 = 138412290;
          id v26 = a4;
          LODWORD(v22) = 12;
          uint64_t v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "#diagnosticManager Resuming XPC Connection: %@",  &v25,  v22);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]",  "%s\n",  v20);
        }

        LOBYTE(v11) = 1;
        return v11;
      }
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_101842678);
    }
    v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      unsigned int v13 = [a4 processIdentifier];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)v28 = 0;
      *(_WORD *)&v28[4] = 2082;
      *(void *)&v28[6] = "";
      __int16 v29 = 2082;
      id v30 = "com.apple.locationd.diagnostic";
      __int16 v31 = 1026;
      unsigned int v32 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#diagnosticManager missing entitlement, entitlement:%{public, location:escape_only} s, pid:%{public}d}",  buf,  0x22u);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_101842678);
      }
    }

    v14 = (os_log_s *)qword_101934978;
    BOOL v11 = os_signpost_enabled((os_log_t)qword_101934978);
    if (v11)
    {
      unsigned int v15 = [a4 processIdentifier];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)v28 = 0;
      *(_WORD *)&v28[4] = 2082;
      *(void *)&v28[6] = "";
      __int16 v29 = 2082;
      id v30 = "com.apple.locationd.diagnostic";
      __int16 v31 = 1026;
      unsigned int v32 = v15;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#diagnosticManager missing entitlement",  "{msg%{public}.0s:#diagnosticManager missing entitlement, entitlement:%{public, location:escape_only} s, pid:%{public}d}",  buf,  0x22u);
LABEL_23:
      LOBYTE(v11) = 0;
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    v16 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Why didn't we get a connection?", buf, 2u);
    }

    BOOL v17 = sub_1002921D0(115, 0);
    LOBYTE(v11) = 0;
    if (v17)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101842658);
      }
      LOWORD(v25) = 0;
      LODWORD(v22) = 2;
      v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  17LL,  "Why didn't we get a connection?",  &v25,  v22);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]", "%s\n", v19);
      goto LABEL_23;
    }
  }

  return v11;
}

- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101842658);
  }
  id v7 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0].__r_.__value_.__l.__data_) = 138412546;
    *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
    WORD2(buf[0].__r_.__value_.__r.__words[1]) = 2112;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "#diagnosticManager fileManager asking if should copy from %@ to %@",  (uint8_t *)buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    int v16 = 138412546;
    id v17 = a4;
    __int16 v18 = 2112;
    id v19 = a5;
    unsigned int v13 = (std::string *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  1LL,  "#diagnosticManager fileManager asking if should copy from %@ to %@",  &v16,  22);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLDiagnosticManager fileManager:shouldCopyItemAtURL:toURL:]",  "%s\n",  (const char *)v13);
    if (v13 != buf) {
      free(v13);
    }
  }

  sub_100309D64(0, buf);
  if ((buf[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
    id v8 = buf;
  }
  else {
    id v8 = (std::string *)buf[0].__r_.__value_.__r.__words[0];
  }
  uint64_t v9 = +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
  unsigned __int8 v10 = objc_msgSend( objc_msgSend(a4, "absoluteString"),  "hasPrefix:",  -[NSURL absoluteString](v9, "absoluteString"));
  if ((v10 & 1) == 0)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101842658);
    }
    BOOL v11 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "Trying to move a file that is not in our cache directory: %@",  (uint8_t *)buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101842658);
      }
      int v16 = 138412290;
      id v17 = a4;
      LODWORD(v15) = 12;
      v14 = (std::string *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  17LL,  "Trying to move a file that is not in our cache directory: %@",  &v16,  v15);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLDiagnosticManager fileManager:shouldCopyItemAtURL:toURL:]",  "%s\n",  (const char *)v14);
      if (v14 != buf) {
        free(v14);
      }
    }
  }

  return v10;
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 copyingItemAtURL:(id)a5 toURL:(id)a6
{
  return 0;
}

- (NSURL)mobileCrashReporterPath
{
  if (qword_101997260 != -1) {
    dispatch_once(&qword_101997260, &stru_101842618);
  }
  return (NSURL *)qword_101997258;
}

- (id)pathForDate:(id)a3 withBasePath:(id)a4
{
  if (qword_101997270 != -1) {
    dispatch_once(&qword_101997270, &stru_101842638);
  }
  return objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend((id)qword_101997268, "stringFromDate:", a3));
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)registeredFiles
{
  return self->_registeredFiles;
}

- (void)setRegisteredFiles:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end