@interface StreamingUnzipper
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)inProcessDelegateQueue;
- (StreamingUnzipDelegateProtocol)inProcessExtractorDelegate;
- (id)initForClient:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)finishStreamWithReply:(id)a3;
- (void)getPidForTestingWithReply:(id)a3;
- (void)setActiveDelegateMethods:(int)a3;
- (void)setInProcessDelegateQueue:(id)a3;
- (void)setInProcessExtractorDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setupUnzipperWithOutputPath:(id)a3 sandboxExtensionToken:(char *)a4 options:(id)a5 withReply:(id)a6;
- (void)streamingFileWriter:(id)a3 didEncounterError:(id)a4;
- (void)supplyBytes:(id)a3 withReply:(id)a4;
- (void)suspendStreamWithReply:(id)a3;
- (void)terminateStreamWithReply:(id)a3;
@end

@implementation StreamingUnzipper

- (id)initForClient:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___StreamingUnzipper;
  v8 = -[StreamingUnzipper init](&v18, "init");
  if (v8)
  {
    id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Unzip session on behalf of %@", v6));
    uint64_t v10 = os_transaction_create([v9 UTF8String]);
    v11 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = v10;

    dispatch_group_t v12 = dispatch_group_create();
    v13 = (void *)*((void *)v8 + 12);
    *((void *)v8 + 12) = v12;

    if (v7)
    {
      objc_storeWeak((id *)v8 + 15, v7);
      v8[8] = 1;
      [v7 auditToken];
      __int128 v14 = v16;
      *(_OWORD *)(v8 + 28) = v17;
    }

    else
    {
      *(void *)&__int128 v14 = -1LL;
      *((void *)&v14 + 1) = -1LL;
      *(_OWORD *)(v8 + 28) = v14;
    }

    *(_OWORD *)(v8 + 12) = v14;
  }

  return v8;
}

- (void)setupUnzipperWithOutputPath:(id)a3 sandboxExtensionToken:(char *)a4 options:(id)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  dispatch_group_t v12 = (void (**)(id, id, void))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"SZExtractorOptionsAssertQOS"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char isKindOfClass = objc_opt_isKindOfClass(v13, v14);

  if ((isKindOfClass & 1) != 0)
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"SZExtractorOptionsAssertQOS"]);
    id v17 = [v16 unsignedIntValue];

    qos_class_t v18 = qos_class_self();
    if (v18 != (_DWORD)v17)
    {
      qos_class_t v34 = v18;
      v35 = sub_100004680();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = (_DWORD)v17;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v34;
        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x",  buf,  0xEu);
      }

      id v38 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]",  74LL,  NSPOSIXErrorDomain,  22LL,  0LL,  0LL,  @"Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x",  v37,  (uint64_t)v17);
      goto LABEL_30;
    }
  }

  if (a4)
  {
    int64_t v19 = sandbox_extension_consume(a4);
    self->_sandboxToken = v19;
    if (v19 == -1)
    {
      int v39 = *__error();
      v40 = sub_100004680();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = strerror(v39);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v39;
        _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Failed to consume sandbox extension token for %@ : %s (%d)",  buf,  0x1Cu);
      }

      strerror(v39);
      id v38 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]",  85LL,  NSPOSIXErrorDomain,  v39,  0LL,  0LL,  @"Failed to consume sandbox extension token for %@ : %s (%d)",  v42,  (uint64_t)v10);
      goto LABEL_30;
    }
  }

  if (self->_hasConnection)
  {
    uint64_t v20 = SANDBOX_CHECK_NOFOLLOW | SANDBOX_CHECK_CANONICAL | 1u;
    id v21 = v10;
    [v21 fileSystemRepresentation];
    __int128 v22 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v22;
    int v23 = sandbox_check_by_audit_token(buf, "file-write-create", v20);
    if (v23)
    {
      if (v23 == -1) {
        int v24 = *__error();
      }
      else {
        int v24 = 1;
      }
      v46 = sub_100004680();
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v49 = strerror(v24);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v49;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Cannot write to path %@ : %s (%d)",  buf,  0x1Cu);
      }

      strerror(v24);
      id v38 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]",  97LL,  NSPOSIXErrorDomain,  v24,  0LL,  0LL,  @"Cannot write to path %@ : %s (%d)",  v48,  (uint64_t)v21);
LABEL_30:
      id v31 = (id)objc_claimAutoreleasedReturnValue(v38);
      v12[2](v12, v31, 0LL);
      goto LABEL_31;
    }
  }

  v25 = sub_100004680();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"SZExtractorOptionsHashedChunkSize"]);
    id v28 = [v27 unsignedLongLongValue];
    v29 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"SZExtractorOptionsHashesArray"]);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v28;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Initialized with path %@ ; hashed chunk size %llu ; hashes %@",
      buf,
      0x20u);
  }

  id v52 = 0LL;
  v30 = (StreamingUnzipState *)objc_claimAutoreleasedReturnValue( +[StreamingUnzipState unzipStateWithPath:options:error:]( &OBJC_CLASS___StreamingUnzipState,  "unzipStateWithPath:options:error:",  v10,  v11,  &v52));
  id v31 = v52;
  currentState = self->_currentState;
  self->_currentState = v30;

  v33 = self->_currentState;
  if (!v31)
  {
    if (!v33) {
      __assert_rtn( "-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]",  "StreamingUnzipper.m",  109,  "error || _currentState");
    }
    goto LABEL_21;
  }

  if (v33)
  {
LABEL_21:
    id v43 = v10;
    if (setxattr( (const char *)[v43 fileSystemRepresentation],  "com.apple.streamingzip.incomplete_extraction",  "y",  1uLL,  0,  1))
    {
      v44 = sub_100004680();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v50 = __error();
        v51 = strerror(*v50);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v51;
        _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Failed to set incomplete extraction xattr on %@ : %s",  buf,  0x16u);
      }
    }
  }

  v12[2](v12, v31, -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset"));
LABEL_31:
}

- (void)setActiveDelegateMethods:(int)a3
{
  v5 = sub_100004680();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Set active delegate methods to 0x%x",  (uint8_t *)v7,  8u);
  }

  self->_activeDelegateMethods = a3;
}

- (void)streamingFileWriter:(id)a3 didEncounterError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100004680();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "StreamingFileWriter %@ encountered error %@",  (uint8_t *)&v13,  0x16u);
  }

  p_asyncErrorLock = &self->_asyncErrorLock;
  os_unfair_lock_lock(&self->_asyncErrorLock);
  asyncError = self->_asyncError;
  p_asyncError = &self->_asyncError;
  if (!asyncError) {
    objc_storeStrong((id *)p_asyncError, a4);
  }
  os_unfair_lock_unlock(p_asyncErrorLock);
}

- (void)dealloc
{
  v3 = sub_100004680();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState unzipPath](self->_currentState, "unzipPath"));
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Deallocating state for extraction to %@",  buf,  0xCu);
  }

  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = 0LL;

  free(self->_decompressionOutputBuffer);
  if (self->_sandboxToken) {
    sandbox_extension_release();
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___StreamingUnzipper;
  -[StreamingUnzipper dealloc](&v7, "dealloc");
}

- (void)supplyBytes:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v18 = 0LL;
  int64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_10000B6B4;
  __int128 v22 = sub_10000B6C4;
  id v23 = 0LL;
  uint64_t v14 = 0LL;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  id v8 = [v6 length];
  id v9 = sub_100004700();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    id v25 = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES_UNZIP_SERVICE",  "Begin processing %lu bytes in StreamingUnzipper",  buf,  0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000B6CC;
  v13[3] = &unk_100028C60;
  v13[4] = self;
  v13[5] = &v18;
  v13[6] = &v14;
  v13[7] = v8;
  [v6 enumerateByteRangesUsingBlock:v13];
  id v11 = sub_100004700();
  dispatch_group_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134217984;
    id v25 = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES_UNZIP_SERVICE",  "End processing %lu bytes in StreamingUnzipper",  buf,  0xCu);
  }

  v7[2](v7, v19[5], *((unsigned __int8 *)v15 + 24));
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

- (void)suspendStreamWithReply:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  currentState = self->_currentState;
  id v6 = sub_100004680();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (!currentState)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  v18,  2u);
    }

    id v17 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper suspendStreamWithReply:]",  1836LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  v16,  *(uint64_t *)v18);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_11;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState unzipPath](self->_currentState, "unzipPath"));
    *(_DWORD *)uint64_t v18 = 134218242;
    *(void *)&v18[4] = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Suspending extraction at offset %llu for %@",  v18,  0x16u);
  }

  id v11 = sub_10000B024((os_unfair_lock_s *)self);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    int v13 = (void *)v12;
    uint64_t v14 = sub_100004680();
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v18 = 138412290;
      *(void *)&v18[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", v18, 0xCu);
    }

    sub_10000B078((uint64_t)self);
LABEL_11:
    v4[2](v4, 0LL, v13);
    goto LABEL_15;
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState serializeState](self->_currentState, "serializeState"));
  if (v13) {
    sub_10000B078((uint64_t)self);
  }
  v4[2](v4, -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset"), v13);
LABEL_15:
}

- (void)finishStreamWithReply:(id)a3
{
  v4 = (void (**)(id, id))a3;
  currentState = self->_currentState;
  id v6 = sub_100004680();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (!currentState)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  buf,  2u);
    }

    id v16 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper finishStreamWithReply:]",  1868LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  v15,  v77);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_14;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState unzipPath](self->_currentState, "unzipPath"));
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finishing extraction for %@", buf, 0xCu);
  }

  id v10 = sub_10000B024((os_unfair_lock_s *)self);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    id v12 = (id)v11;
    int v13 = sub_100004680();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", buf, 0xCu);
    }

    goto LABEL_13;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[StreamingUnzipState finishStream](self->_currentState, "finishStream"));
  if (v17)
  {
    id v12 = (id)v17;
LABEL_13:
    sub_10000B078((uint64_t)self);
    goto LABEL_14;
  }

  id v18 = objc_claimAutoreleasedReturnValue(-[StreamingUnzipState unzipPath](self->_currentState, "unzipPath"));
  int v19 = removexattr( (const char *)[v18 fileSystemRepresentation],  "com.apple.streamingzip.incomplete_extraction",  1);

  if (v19 && *__error() != 93)
  {
    uint64_t v20 = sub_100004680();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState unzipPath](self->_currentState, "unzipPath"));
      id v23 = __error();
      int v24 = strerror(*v23);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "com.apple.streamingzip.incomplete_extraction";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2080;
      v81 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Failed to remove xattr named %s on %@ : %s",  buf,  0x20u);
    }
  }

  if (!-[StreamingUnzipState denyInvalidSymlinks](self->_currentState, "denyInvalidSymlinks"))
  {
    id v12 = 0LL;
    goto LABEL_14;
  }

  id v25 = (id)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState unzipPath](self->_currentState, "unzipPath"));
  if (!v25)
  {
    id v43 = sub_100004680();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "base directory path cannot be nil",  buf,  2u);
    }

    v46 = @"base directory path cannot be nil";
    uint64_t v47 = 1750LL;
    goto LABEL_40;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v25, 1LL));
  if (!v26)
  {
    uint64_t v48 = sub_100004680();
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "base directory URL cannot be nil (created from path: %@)",  buf,  0xCu);
    }

    uint64_t v77 = (uint64_t)v25;
    v46 = @"base directory URL cannot be nil (created from path: %@)";
    uint64_t v47 = 1757LL;
LABEL_40:
    id v50 = sub_100007A7C( (uint64_t)"_ValidateAllSymlinksUnderPath",  v47,  @"SZExtractorErrorDomain",  2LL,  0LL,  0LL,  v46,  v45,  v77);
    id v51 = (id)objc_claimAutoreleasedReturnValue(v50);
    id v29 = 0LL;
    goto LABEL_62;
  }

  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_10000B198;
  v81 = (char *)&unk_100028C88;
  id v82 = v26;
  id v27 = v82;
  id v28 = buf;
  id v29 = v27;
  v30 = (char *)[v29 fileSystemRepresentation];
  if (!v30)
  {
    id v52 = sub_100004680();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v83 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "directory url fileSystemRepresentation cannot be NULL",  v83,  2u);
    }

    v55 = @"directory url fileSystemRepresentation cannot be NULL";
    uint64_t v56 = 1694LL;
    goto LABEL_47;
  }

  id v31 = v30;
  v87[0] = v30;
  v87[1] = 0LL;
  v32 = fts_open(v87, 84, 0LL);
  if (!v32)
  {
    v57 = sub_100004680();
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v74 = __error();
      v75 = strerror(*v74);
      *(_DWORD *)v83 = 136315394;
      uint64_t v84 = (uint64_t)v31;
      __int16 v85 = 2080;
      v86 = v75;
      _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "fts_open failed for %s with error %s",  v83,  0x16u);
    }

    v59 = __error();
    uint64_t v77 = (uint64_t)v31;
    strerror(*v59);
    v55 = @"fts_open failed for %s with error %s";
    uint64_t v56 = 1704LL;
LABEL_47:
    id v60 = sub_100007A7C( (uint64_t)"_TraverseDirectory",  v56,  @"SZExtractorErrorDomain",  2LL,  0LL,  0LL,  v55,  v54,  v77);
    id v42 = (id)objc_claimAutoreleasedReturnValue(v60);
    goto LABEL_48;
  }

  v33 = v32;
  uint64_t v78 = (uint64_t)v31;
  qos_class_t v34 = 0LL;
  int v35 = 0;
  while (1)
  {
    v36 = fts_read(v33);
    if (!v36)
    {
      id v42 = v34;
      goto LABEL_53;
    }

    uint64_t v37 = v36;
    int fts_info = v36->fts_info;
    if (fts_info == 10 || fts_info == 7) {
      break;
    }
    v40 = objc_autoreleasePoolPush();
    id v79 = v34;
    char v41 = (*(uint64_t (**)(_BYTE *, FTSENT *, id *))&buf[16])(v28, v37, &v79);
    id v42 = v79;

    objc_autoreleasePoolPop(v40);
    int v35 = 1;
    qos_class_t v34 = v42;
    if ((v41 & 1) == 0)
    {
      int v35 = 0;
LABEL_53:
      uint64_t v65 = v78;
      goto LABEL_54;
    }
  }

  v63 = sub_100004680();
  v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
  uint64_t v65 = v78;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    v76 = strerror(v37->fts_errno);
    *(_DWORD *)v83 = 136315394;
    uint64_t v84 = v78;
    __int16 v85 = 2080;
    v86 = v76;
    _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Error for path %s: %s", v83, 0x16u);
  }

  strerror(v37->fts_errno);
  id v67 = sub_100007A7C( (uint64_t)"_TraverseDirectory",  1713LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  0LL,  @"Error for path %s: %s",  v66,  v78);
  id v42 = (id)objc_claimAutoreleasedReturnValue(v67);

  int v35 = 0;
LABEL_54:
  if (fts_close(v33))
  {
    int v68 = *__error();
    v69 = sub_100004680();
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v73 = strerror(v68);
      *(_DWORD *)v83 = 136315394;
      uint64_t v84 = v65;
      __int16 v85 = 2080;
      v86 = v73;
      _os_log_error_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "fts_close on FTS for %s returned %s",  v83,  0x16u);
    }
  }

  if (!v35)
  {
LABEL_48:
    id v42 = v42;
    char v61 = 0;
    v62 = v42;
    goto LABEL_60;
  }

  v62 = 0LL;
  char v61 = 1;
LABEL_60:

  id v51 = v62;
  if ((v61 & 1) != 0)
  {
    v71 = 0LL;
    char v72 = 1;
    goto LABEL_63;
  }

- (void)terminateStreamWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  currentState = self->_currentState;
  id v6 = sub_100004680();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (currentState)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState unzipPath](self->_currentState, "unzipPath"));
      *(_DWORD *)uint64_t v14 = 138412290;
      *(void *)&v14[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Terminating extraction for %@", v14, 0xCu);
    }

    id v10 = sub_10000B024((os_unfair_lock_s *)self);
    sub_10000B078((uint64_t)self);
    v4[2](v4, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Unzipper did not have any state, but the client was terminating the stream anyway.",  v14,  2u);
    }

    id v12 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper terminateStreamWithReply:]",  1912LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Unzipper did not have any state, but the client was terminating the stream anyway.",  v11,  *(uint64_t *)v14);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    ((void (**)(id, void *))v4)[2](v4, v13);
  }
}

- (void)getPidForTestingWithReply:(id)a3
{
  id v5 = a3;
  uint64_t v4 = getpid();
  (*((void (**)(id, uint64_t, void))a3 + 2))(v5, v4, 0LL);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (StreamingUnzipDelegateProtocol)inProcessExtractorDelegate
{
  return (StreamingUnzipDelegateProtocol *)objc_loadWeakRetained((id *)&self->inProcessExtractorDelegate);
}

- (void)setInProcessExtractorDelegate:(id)a3
{
}

- (OS_dispatch_queue)inProcessDelegateQueue
{
  return self->inProcessDelegateQueue;
}

- (void)setInProcessDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end