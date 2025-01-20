@interface FairPlayDecryptFileOperation
- (BOOL)_decryptWithSession:(id)a3 error:(id *)a4;
- (FairPlayDecryptFileOperation)init;
- (FairPlayDecryptFileOperation)initWithPath:(id)a3 dpInfo:(id)a4;
- (void)_initializeProgressWithFileHandle:(id)a3;
- (void)_updateProgressWithByteCount:(int64_t)a3;
- (void)dealloc;
- (void)run;
@end

@implementation FairPlayDecryptFileOperation

- (FairPlayDecryptFileOperation)init
{
  return -[FairPlayDecryptFileOperation initWithPath:dpInfo:](self, "initWithPath:dpInfo:", 0LL, 0LL);
}

- (FairPlayDecryptFileOperation)initWithPath:(id)a3 dpInfo:(id)a4
{
  if (!a3 || !a4) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"FairPlayDecryptFileOperation.m",  38LL,  @"Must have a path and DPInfo");
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FairPlayDecryptFileOperation;
  v7 = -[FairPlayDecryptFileOperation init](&v9, "init");
  if (v7)
  {
    v7->_dpInfo = (NSData *)a4;
    v7->_path = (NSString *)a3;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FairPlayDecryptFileOperation;
  -[FairPlayDecryptFileOperation dealloc](&v3, "dealloc");
}

- (void)run
{
  objc_super v3 = -[FairPlayDecryptSession initWithDPInfo:]( objc_alloc(&OBJC_CLASS___FairPlayDecryptSession),  "initWithDPInfo:",  self->_dpInfo);

  self->_dpInfo = 0LL;
  if (v3)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000691A4;
    v27[3] = &unk_10034AE70;
    v27[4] = self;
    v27[5] = v3;
    HIDWORD(v26) = 0;
    IOReturn v4 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  (CFStringRef)-[FairPlayDecryptSession identifier](v3, "identifier"),  0LL,  @"itunesstored FairPlay asset decryption",  0LL,  900.0,  @"TimeoutActionRelease",  (IOPMAssertionID *)&v26 + 1);
    id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    id v6 = v5;
    if (v4)
    {
      if (!v5) {
        id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v7 = [v6 shouldLog];
      else {
        LODWORD(v8) = v7;
      }
      objc_super v9 = (os_log_s *)[v6 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        uint64_t v8 = v8;
      }
      else {
        v8 &= 2u;
      }
      if ((_DWORD)v8)
      {
        uint64_t v10 = objc_opt_class(self);
        int v28 = 138412546;
        uint64_t v29 = v10;
        __int16 v30 = 1024;
        LODWORD(v31) = v4;
        LODWORD(v26) = 18;
        uint64_t v11 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Power assertion failed with error: %d",  &v28,  v26);
        if (v11)
        {
          v12 = (void *)v11;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
          free(v12);
          SSFileLog(v6, @"%@");
        }
      }

      -[FairPlayDecryptFileOperation setError:](self, "setError:", ISError(21LL, 0LL, 0LL));
      -[FairPlayDecryptFileOperation setSuccess:](self, "setSuccess:", 0LL);
    }

    else
    {
      if (!v5) {
        id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v19 = [v6 shouldLog];
      else {
        LODWORD(v20) = v19;
      }
      v21 = (os_log_s *)[v6 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        uint64_t v20 = v20;
      }
      else {
        v20 &= 2u;
      }
      if ((_DWORD)v20)
      {
        uint64_t v22 = objc_opt_class(self);
        id v23 = -[FairPlayDecryptSession identifier](v3, "identifier");
        int v28 = 138412546;
        uint64_t v29 = v22;
        __int16 v30 = 2112;
        id v31 = v23;
        LODWORD(v26) = 22;
        uint64_t v24 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "%@: Took power assertion: %@",  &v28,  v26);
        if (v24)
        {
          v25 = (void *)v24;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v24, 4LL);
          free(v25);
          SSFileLog(v6, @"%@");
        }
      }

      sub_1000691A4((uint64_t)v27);
      IOPMAssertionRelease(HIDWORD(v26));
    }
  }

  else
  {
    id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v13) {
      id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      LODWORD(v15) = v14;
    }
    v16 = (os_log_s *)[v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      int v28 = 138412290;
      uint64_t v29 = objc_opt_class(self);
      LODWORD(v26) = 12;
      uint64_t v17 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Could not begin decrypt",  &v28,  v26);
      if (v17)
      {
        v18 = (void *)v17;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
        free(v18);
        SSFileLog(v13, @"%@");
      }
    }

    -[FairPlayDecryptFileOperation setError:](self, "setError:", ISError(15LL, 0LL, 0LL));
  }

- (BOOL)_decryptWithSession:(id)a3 error:(id *)a4
{
  unsigned int v7 = +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  self->_path);
  if (v7)
  {
    uint64_t v8 = v7;
    v27 = a4;
    -[FairPlayDecryptFileOperation _initializeProgressWithFileHandle:](self, "_initializeProgressWithFileHandle:", v7);
    objc_super v9 = 0LL;
    while (1)
    {
      -[NSAutoreleasePool drain](v9, "drain", v25);
      objc_super v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
      uint64_t v10 = -[NSFileHandle readDataOfLength:](v8, "readDataOfLength:", 0x8000LL);
      if (!-[NSData length](v10, "length")) {
        break;
      }
      id v28 = 0LL;
      id v11 = [a3 decryptBytes:v10 error:&v28];
      if (v11)
      {
        -[NSFileHandle seekToFileOffset:]( v8,  "seekToFileOffset:",  (_BYTE *)-[NSFileHandle offsetInFile](v8, "offsetInFile") - (_BYTE *)-[NSData length](v10, "length"));
        -[NSFileHandle writeData:](v8, "writeData:", v11);
        -[FairPlayDecryptFileOperation _updateProgressWithByteCount:]( self,  "_updateProgressWithByteCount:",  -[NSFileHandle offsetInFile](v8, "offsetInFile"));
      }

      else
      {
        id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v12) {
          id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        LODWORD(v13) = [v12 shouldLog];
        unsigned int v14 = [v12 shouldLogToDisk];
        uint64_t v15 = (os_log_s *)[v12 OSLogObject];
        v16 = v15;
        if (v14) {
          LODWORD(v13) = v13 | 2;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v13 = v13;
        }
        else {
          v13 &= 2u;
        }
        if ((_DWORD)v13)
        {
          uint64_t v17 = objc_opt_class(self);
          int v29 = 138412546;
          uint64_t v30 = v17;
          __int16 v31 = 2112;
          id v32 = v28;
          LODWORD(v26) = 22;
          uint64_t v18 = _os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Decrypt failed [%@]",  &v29,  v26);
          if (v18)
          {
            unsigned int v19 = (void *)v18;
            uint64_t v20 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL);
            free(v19);
            v25 = v20;
            SSFileLog(v12, @"%@");
          }
        }

        id v21 = v28;
        if (v21)
        {
          int v22 = 0;
          goto LABEL_21;
        }
      }
    }

    id v21 = 0LL;
    int v22 = 1;
LABEL_21:
    a4 = v27;
    -[NSFileHandle synchronizeFile](v8, "synchronizeFile", v25);
    -[NSFileHandle closeFile](v8, "closeFile");
    -[NSAutoreleasePool drain](v9, "drain");
    id v24 = v21;
    BOOL result = v22 != 0;
    if (v27) {
      goto LABEL_22;
    }
  }

  else
  {
    id v21 = (id)ISError(7LL, 0LL, 0LL);
    BOOL result = 0;
    if (a4) {
LABEL_22:
    }
      *a4 = v21;
  }

  return result;
}

- (void)_initializeProgressWithFileHandle:(id)a3
{
  if (fstat((int)[a3 fileDescriptor], &v5) != -1)
  {
    uint64_t v4 = OBJC_IVAR___ISOperation__progress;
    [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setUnits:1];
    [*(id *)&self->ISOperation_opaque[v4] setMaxValue:v5.st_size];
    [*(id *)&self->ISOperation_opaque[v4] resetSnapshots];
    self->_lastSnapshotTime = -1.79769313e308;
    -[FairPlayDecryptFileOperation _updateProgressWithByteCount:](self, "_updateProgressWithByteCount:", 0LL);
  }

- (void)_updateProgressWithByteCount:(int64_t)a3
{
  id v3 = (id)a3;
  uint64_t v5 = OBJC_IVAR___ISOperation__progress;
  id v6 = *(void **)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress];
  [v6 setCurrentValue:v3];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (self->_lastSnapshotTime + kSSOperationDefaultSnapshotInterval < Current)
  {
    [*(id *)&self->ISOperation_opaque[v5] snapshot];
    -[FairPlayDecryptFileOperation sendProgressToDelegate](self, "sendProgressToDelegate");
    self->_lastSnapshotTime = Current;
  }

@end