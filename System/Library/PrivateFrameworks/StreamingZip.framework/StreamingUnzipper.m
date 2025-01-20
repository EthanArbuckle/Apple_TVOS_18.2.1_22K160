@interface StreamingUnzipper
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)inProcessDelegateQueue;
- (StreamingUnzipDelegateProtocol)inProcessExtractorDelegate;
- (id)_beginNonStreamablePassthroughWithRemainingBytes:(uint64_t)a3 length:;
- (id)initForClient:(id)a3 connection:(id)a4;
- (os_unfair_lock_s)_waitForAsyncFileWriterCompletionAndGetAsyncError;
- (void)_sendExtractionProgress:(uint64_t)a1;
- (void)_setErrorState;
- (void)_supplyBytes:(size_t)a3 length:(void *)a4 withReply:;
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
  v8 = -[StreamingUnzipper init](&v18, sel_init);
  if (v8)
  {
    id v9 = [NSString stringWithFormat:@"Unzip session on behalf of %@", v6];
    [v9 UTF8String];
    uint64_t v10 = os_transaction_create();
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
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  dispatch_group_t v12 = (void (**)(id, id, void))a6;
  [v11 objectForKey:@"SZExtractorOptionsAssertQOS"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    [v11 objectForKey:@"SZExtractorOptionsAssertQOS"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 unsignedIntValue];

    qos_class_t v17 = qos_class_self();
    if (v17 != (_DWORD)v16)
    {
      qos_class_t v32 = v17;
      SZGetLoggingHandle();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v16;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v32;
        _os_log_error_impl( &dword_1870CA000,  v33,  OS_LOG_TYPE_ERROR,  "Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x",  buf,  0xEu);
      }

      _CreateError( (uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]",  74LL,  (void *)*MEMORY[0x189607688],  22LL,  0LL,  0LL,  @"Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x",  v34,  v16);
      goto LABEL_30;
    }
  }

  if (a4)
  {
    int64_t v18 = sandbox_extension_consume();
    self->_sandboxToken = v18;
    if (v18 == -1)
    {
      int v35 = *__error();
      SZGetLoggingHandle();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = strerror(v35);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v35;
        _os_log_error_impl( &dword_1870CA000,  v36,  OS_LOG_TYPE_ERROR,  "Failed to consume sandbox extension token for %@ : %s (%d)",  buf,  0x1Cu);
      }

      v37 = (void *)*MEMORY[0x189607688];
      strerror(v35);
      _CreateError( (uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]",  85LL,  v37,  v35,  0LL,  0LL,  @"Failed to consume sandbox extension token for %@ : %s (%d)",  v38,  (uint64_t)v10);
      goto LABEL_30;
    }
  }

  if (self->_hasConnection)
  {
    id v19 = v10;
    uint64_t v20 = [v19 fileSystemRepresentation];
    __int128 v21 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v21;
    uint64_t v46 = v20;
    int v22 = sandbox_check_by_audit_token();
    if (v22)
    {
      if (v22 == -1) {
        int v23 = *__error();
      }
      else {
        int v23 = 1;
      }
      SZGetLoggingHandle();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = strerror(v23);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v23;
        _os_log_error_impl(&dword_1870CA000, v41, OS_LOG_TYPE_ERROR, "Cannot write to path %@ : %s (%d)", buf, 0x1Cu);
      }

      v42 = (void *)*MEMORY[0x189607688];
      strerror(v23);
      _CreateError( (uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]",  97LL,  v42,  v23,  0LL,  0LL,  @"Cannot write to path %@ : %s (%d)",  v43,  (uint64_t)v19);
LABEL_30:
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v29, 0LL);
      goto LABEL_31;
    }
  }

  SZGetLoggingHandle();
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    [v11 objectForKey:@"SZExtractorOptionsHashedChunkSize"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 unsignedLongLongValue];
    [v11 objectForKey:@"SZExtractorOptionsHashesArray"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v27;
    _os_log_impl( &dword_1870CA000,  v24,  OS_LOG_TYPE_DEFAULT,  "Initialized with path %@ ; hashed chunk size %llu ; hashes %@",
      buf,
      0x20u);
  }

  id v47 = 0LL;
  +[StreamingUnzipState unzipStateWithPath:options:error:]( &OBJC_CLASS___StreamingUnzipState,  "unzipStateWithPath:options:error:",  v10,  v11,  &v47);
  v28 = (StreamingUnzipState *)objc_claimAutoreleasedReturnValue();
  id v29 = v47;
  currentState = self->_currentState;
  self->_currentState = v28;

  v31 = self->_currentState;
  if (!v29)
  {
    if (!v31) {
      __assert_rtn( "-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]",  "StreamingUnzipper.m",  109,  "error || _currentState");
    }
    goto LABEL_21;
  }

  if (v31)
  {
LABEL_21:
    id v39 = v10;
    if (setxattr( (const char *)[v39 fileSystemRepresentation],  "com.apple.streamingzip.incomplete_extraction",  "y",  1uLL,  0,  1))
    {
      SZGetLoggingHandle();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v44 = __error();
        v45 = strerror(*v44);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v45;
        _os_log_error_impl( &dword_1870CA000,  v40,  OS_LOG_TYPE_ERROR,  "Failed to set incomplete extraction xattr on %@ : %s",  buf,  0x16u);
      }
    }
  }

  v12[2](v12, v29, -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset", v46));
LABEL_31:
}

- (void)setActiveDelegateMethods:(int)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  SZGetLoggingHandle();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1870CA000, v5, OS_LOG_TYPE_DEFAULT, "Set active delegate methods to 0x%x", (uint8_t *)v6, 8u);
  }

  self->_activeDelegateMethods = a3;
}

- (void)streamingFileWriter:(id)a3 didEncounterError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  SZGetLoggingHandle();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_error_impl( &dword_1870CA000,  v8,  OS_LOG_TYPE_ERROR,  "StreamingFileWriter %@ encountered error %@",  (uint8_t *)&v12,  0x16u);
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
  uint64_t v9 = *MEMORY[0x1895F89C0];
  SZGetLoggingHandle();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1870CA000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating state for extraction to %@", buf, 0xCu);
  }

  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = 0LL;

  free(self->_decompressionOutputBuffer);
  if (self->_sandboxToken) {
    sandbox_extension_release();
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___StreamingUnzipper;
  -[StreamingUnzipper dealloc](&v6, sel_dealloc);
}

- (void)supplyBytes:(id)a3 withReply:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v16 = 0LL;
  qos_class_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__427;
  uint64_t v20 = __Block_byref_object_dispose__428;
  id v21 = 0LL;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v8 = [v6 length];
  SZGetTraceHandle();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v8;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES_UNZIP_SERVICE",  "Begin processing %lu bytes in StreamingUnzipper",  buf,  0xCu);
  }

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __43__StreamingUnzipper_supplyBytes_withReply___block_invoke;
  v11[3] = &unk_189FE1DC0;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  v11[7] = v8;
  [v6 enumerateByteRangesUsingBlock:v11];
  SZGetTraceHandle();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v8;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v10,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES_UNZIP_SERVICE",  "End processing %lu bytes in StreamingUnzipper",  buf,  0xCu);
  }

  v7[2](v7, v17[5], *((unsigned __int8 *)v13 + 24));
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

- (void)suspendStreamWithReply:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v4 = (void (**)(id, void, void *))a3;
  currentState = self->_currentState;
  SZGetLoggingHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (!currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  v14,  2u);
    }

    _CreateError( (uint64_t)"-[StreamingUnzipper suspendStreamWithReply:]",  1836LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  v13,  *(uint64_t *)v14);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset");
    -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)uint64_t v14 = 134218242;
    *(void *)&v14[4] = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1870CA000, v7, OS_LOG_TYPE_DEFAULT, "Suspending extraction at offset %llu for %@", v14, 0x16u);
  }

  uint64_t v10 = -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
  if (v10)
  {
    id v11 = (void *)v10;
    SZGetLoggingHandle();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v14 = 138412290;
      *(void *)&v14[4] = v11;
      _os_log_impl(&dword_1870CA000, v12, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", v14, 0xCu);
    }

    -[StreamingUnzipper _setErrorState]((uint64_t)self);
LABEL_11:
    v4[2](v4, 0LL, v11);
    goto LABEL_15;
  }

  -[StreamingUnzipState serializeState](self->_currentState, "serializeState");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11) {
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
  }
  v4[2](v4, -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset"), v11);
LABEL_15:
}

- (void)finishStreamWithReply:(id)a3
{
  v73[2] = *(char **)MEMORY[0x1895F89C0];
  v4 = (void (**)(id, id))a3;
  currentState = self->_currentState;
  SZGetLoggingHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (!currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  buf,  2u);
    }

    _CreateError( (uint64_t)"-[StreamingUnzipper finishStreamWithReply:]",  1868LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  v12,  v63);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1870CA000, v7, OS_LOG_TYPE_DEFAULT, "Finishing extraction for %@", buf, 0xCu);
  }

  uint64_t v9 = -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
  if (v9)
  {
    id v10 = (id)v9;
    SZGetLoggingHandle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_1870CA000, v11, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", buf, 0xCu);
    }

    goto LABEL_13;
  }

  uint64_t v13 = -[StreamingUnzipState finishStream](self->_currentState, "finishStream");
  if (v13)
  {
    id v10 = (id)v13;
LABEL_13:
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
    goto LABEL_14;
  }

  id v14 = -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
  int v15 = removexattr( (const char *)[v14 fileSystemRepresentation],  "com.apple.streamingzip.incomplete_extraction",  1);

  if (v15 && *__error() != 93)
  {
    SZGetLoggingHandle();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = __error();
      id v19 = strerror(*v18);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "com.apple.streamingzip.incomplete_extraction";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2080;
      v67 = v19;
      _os_log_impl(&dword_1870CA000, v16, OS_LOG_TYPE_DEFAULT, "Failed to remove xattr named %s on %@ : %s", buf, 0x20u);
    }
  }

  if (!-[StreamingUnzipState denyInvalidSymlinks](self->_currentState, "denyInvalidSymlinks"))
  {
    id v10 = 0LL;
    goto LABEL_14;
  }

  -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    SZGetLoggingHandle();
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1870CA000, v38, OS_LOG_TYPE_ERROR, "base directory path cannot be nil", buf, 2u);
    }

    v40 = @"base directory path cannot be nil";
    uint64_t v41 = 1750LL;
    goto LABEL_40;
  }

  [MEMORY[0x189604030] fileURLWithPath:v20 isDirectory:1];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    SZGetLoggingHandle();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_error_impl( &dword_1870CA000,  v42,  OS_LOG_TYPE_ERROR,  "base directory URL cannot be nil (created from path: %@)",  buf,  0xCu);
    }

    uint64_t v63 = (uint64_t)v20;
    v40 = @"base directory URL cannot be nil (created from path: %@)";
    uint64_t v41 = 1757LL;
LABEL_40:
    _CreateError( (uint64_t)"_ValidateAllSymlinksUnderPath",  v41,  @"SZExtractorErrorDomain",  2LL,  0LL,  0LL,  v40,  v39,  v63);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = 0LL;
    goto LABEL_62;
  }

  *(void *)buf = MEMORY[0x1895F87A8];
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = ___ValidateAllSymlinksUnderPath_block_invoke;
  v67 = (char *)&unk_189FE1DE8;
  id v68 = v21;
  id v22 = v68;
  uint64_t v23 = buf;
  id v24 = v22;
  v25 = (char *)[v24 fileSystemRepresentation];
  if (!v25)
  {
    SZGetLoggingHandle();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v69 = 0;
      _os_log_error_impl( &dword_1870CA000,  v44,  OS_LOG_TYPE_ERROR,  "directory url fileSystemRepresentation cannot be NULL",  v69,  2u);
    }

    uint64_t v46 = @"directory url fileSystemRepresentation cannot be NULL";
    uint64_t v47 = 1694LL;
    goto LABEL_47;
  }

  uint64_t v26 = v25;
  v73[0] = v25;
  v73[1] = 0LL;
  v27 = fts_open(v73, 84, 0LL);
  if (!v27)
  {
    SZGetLoggingHandle();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v60 = __error();
      v61 = strerror(*v60);
      *(_DWORD *)v69 = 136315394;
      uint64_t v70 = (uint64_t)v26;
      __int16 v71 = 2080;
      v72 = v61;
      _os_log_error_impl(&dword_1870CA000, v48, OS_LOG_TYPE_ERROR, "fts_open failed for %s with error %s", v69, 0x16u);
    }

    uint64_t v49 = __error();
    uint64_t v63 = (uint64_t)v26;
    strerror(*v49);
    uint64_t v46 = @"fts_open failed for %s with error %s";
    uint64_t v47 = 1704LL;
LABEL_47:
    _CreateError((uint64_t)"_TraverseDirectory", v47, @"SZExtractorErrorDomain", 2LL, 0LL, 0LL, v46, v45, v63);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }

  v28 = v27;
  uint64_t v64 = (uint64_t)v26;
  id v29 = 0LL;
  int v30 = 0;
  while (1)
  {
    v31 = fts_read(v28);
    if (!v31)
    {
      id v37 = v29;
      goto LABEL_53;
    }

    qos_class_t v32 = v31;
    int fts_info = v31->fts_info;
    if (fts_info == 10 || fts_info == 7) {
      break;
    }
    int v35 = (void *)MEMORY[0x1895A0E38]();
    id v65 = v29;
    char v36 = (*(uint64_t (**)(_BYTE *, FTSENT *, id *))&buf[16])(v23, v32, &v65);
    id v37 = v65;

    objc_autoreleasePoolPop(v35);
    int v30 = 1;
    id v29 = v37;
    if ((v36 & 1) == 0)
    {
      int v30 = 0;
LABEL_53:
      uint64_t v53 = v64;
      goto LABEL_54;
    }
  }

  SZGetLoggingHandle();
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = v64;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v62 = strerror(v32->fts_errno);
    *(_DWORD *)v69 = 136315394;
    uint64_t v70 = v64;
    __int16 v71 = 2080;
    v72 = v62;
    _os_log_error_impl(&dword_1870CA000, v52, OS_LOG_TYPE_ERROR, "Error for path %s: %s", v69, 0x16u);
  }

  strerror(v32->fts_errno);
  _CreateError( (uint64_t)"_TraverseDirectory",  1713LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  0LL,  @"Error for path %s: %s",  v54,  v64);
  id v37 = (id)objc_claimAutoreleasedReturnValue();

  int v30 = 0;
LABEL_54:
  if (fts_close(v28))
  {
    int v55 = *__error();
    SZGetLoggingHandle();
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v59 = strerror(v55);
      *(_DWORD *)v69 = 136315394;
      uint64_t v70 = v53;
      __int16 v71 = 2080;
      v72 = v59;
      _os_log_error_impl(&dword_1870CA000, v56, OS_LOG_TYPE_ERROR, "fts_close on FTS for %s returned %s", v69, 0x16u);
    }
  }

  if (!v30)
  {
LABEL_48:
    id v37 = v37;
    char v50 = 0;
    v51 = v37;
    goto LABEL_60;
  }

  v51 = 0LL;
  char v50 = 1;
LABEL_60:

  id v43 = v51;
  if ((v50 & 1) != 0)
  {
    v57 = 0LL;
    char v58 = 1;
    goto LABEL_63;
  }

- (void)terminateStreamWithReply:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v4 = (void (**)(id, void))a3;
  currentState = self->_currentState;
  SZGetLoggingHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)uint64_t v12 = 138412290;
      *(void *)&v12[4] = v8;
      _os_log_impl(&dword_1870CA000, v7, OS_LOG_TYPE_DEFAULT, "Terminating extraction for %@", v12, 0xCu);
    }

    id v9 = -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
    v4[2](v4, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "Unzipper did not have any state, but the client was terminating the stream anyway.",  v12,  2u);
    }

    _CreateError( (uint64_t)"-[StreamingUnzipper terminateStreamWithReply:]",  1912LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Unzipper did not have any state, but the client was terminating the stream anyway.",  v10,  *(uint64_t *)v12);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v11);
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

- (os_unfair_lock_s)_waitForAsyncFileWriterCompletionAndGetAsyncError
{
  v1 = a1;
  if (a1)
  {
    v2 = *(dispatch_group_s **)&a1[24]._os_unfair_lock_opaque;
    if (v2) {
      dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    }
    v3 = v1 + 28;
    os_unfair_lock_lock(v1 + 28);
    v1 = *(os_unfair_lock_s **)&v1[26]._os_unfair_lock_opaque;
    if (v1) {
      uint64_t v4 = v1;
    }
    os_unfair_lock_unlock(v3);
  }

  return v1;
}

- (void)_setErrorState
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [*(id *)(a1 + 64) setStreamState:8];
    [*(id *)(a1 + 64) unzipPath];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      [MEMORY[0x1896078A8] defaultManager];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      id v7 = 0LL;
      char v4 = [v3 removeItemAtPath:v2 error:&v7];
      id v5 = v7;

      if ((v4 & 1) == 0)
      {
        SZGetLoggingHandle();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v9 = v2;
          __int16 v10 = 2112;
          id v11 = v5;
          _os_log_error_impl( &dword_1870CA000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to remove unzip path at %@ : %@",  buf,  0x16u);
        }
      }
    }
  }

void __43__StreamingUnzipper_supplyBytes_withReply___block_invoke( uint64_t a1,  const Bytef *a2,  uint64_t a3,  size_t a4,  _BYTE *a5)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  SZGetLoggingHandle();
  __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218240;
    uint64_t v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = a3;
    _os_log_debug_impl(&dword_1870CA000, v10, OS_LOG_TYPE_DEBUG, "Got block of length %lu at offset %lu", buf, 0x16u);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __43__StreamingUnzipper_supplyBytes_withReply___block_invoke_2;
  v13[3] = &unk_189FE1D98;
  __int128 v14 = *(_OWORD *)(a1 + 40);
  -[StreamingUnzipper _supplyBytes:length:withReply:](v11, a2, a4, v13);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
    || *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    *a5 = 1;
  }

void __43__StreamingUnzipper_supplyBytes_withReply___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
}

- (void)_supplyBytes:(size_t)a3 length:(void *)a4 withReply:
{
  v565[1] = *MEMORY[0x1895F89C0];
  id v7 = a4;
  if (!a1) {
    goto LABEL_519;
  }
  uint64_t v8 = a1;
  v510 = a2;
  size_t v509 = a3;
  id v9 = *(void **)(a1 + 64);
  v468 = (id *)(a1 + 64);
  if (!v9)
  {
    SZGetLoggingHandle();
    v275 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v551.st_dev) = 0;
      _os_log_error_impl( &dword_1870CA000,  v275,  OS_LOG_TYPE_ERROR,  "Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  (uint8_t *)&v551,  2u);
    }

    _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  470LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  v276,  v446);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v464 = 0LL;
    uint64_t v16 = 0LL;
    goto LABEL_512;
  }

  uint64_t v466 = a1;
  v462 = v7;
  [v9 unzipPath];
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = 0LL;
  uint64_t v461 = *MEMORY[0x1896074F8];
  v457 = (void *)*MEMORY[0x189607688];
  *(void *)&__int128 v11 = 138412546LL;
  __int128 v455 = v11;
  *(void *)&__int128 v11 = 136315138LL;
  __int128 v451 = v11;
  *(void *)&__int128 v11 = 136315394LL;
  __int128 v453 = v11;
  *(void *)&__int128 v11 = 136316162LL;
  __int128 v450 = v11;
  *(void *)&__int128 v11 = 138412290LL;
  __int128 v456 = v11;
  *(void *)&__int128 v11 = 138413058LL;
  __int128 v454 = v11;
  *(void *)&__int128 v11 = 134217984LL;
  __int128 v458 = v11;
  *(void *)&__int128 v11 = 67109632LL;
  __int128 v452 = v11;
  *(void *)&__int128 v11 = 136315650LL;
  __int128 v449 = v11;
  uint64_t v12 = v468;
  while (2)
  {
    unint64_t v13 = v509;
    if (!v509)
    {
LABEL_377:
      uint64_t v16 = 0LL;
      id v7 = v462;
      uint64_t v8 = v466;
      goto LABEL_512;
    }

    __int128 v14 = (void *)MEMORY[0x1895A0E38]();
    int v15 = [*v12 streamState];
    uint64_t v8 = v466;
    uint64_t v16 = 0LL;
    switch(v15)
    {
      case 0:
        if (![*v12 currentLFRecord]) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  485,  "_currentState.currentLFRecord");
        }
        _CopyStreamBytesToRecord([*v12 currentLFRecord], 4, *v12, (const void **)&v510, &v509);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17) {
          goto LABEL_463;
        }
        if ((unint64_t)[*v12 thisStageBytesComplete] >= 5) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  493,  "_currentState.thisStageBytesComplete <= peekSignatureSize");
        }
        uint64_t v18 = [*v12 thisStageBytesComplete];
        id v19 = *v12;
        if (v18 == 4)
        {
          int v20 = *(_DWORD *)[v19 currentLFRecord];
          id v21 = *v12;
          if (v20 != 67324752)
          {
            [v21 unsureData];
            v337 = (void *)objc_claimAutoreleasedReturnValue();

            if (v337)
            {
              SZGetLoggingHandle();
              v338 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v338, OS_LOG_TYPE_DEFAULT))
              {
                int v339 = *(unsigned __int8 *)[*v12 currentLFRecord];
                int v340 = *(unsigned __int8 *)([*v468 currentLFRecord] + 1);
                uid_t v341 = *(unsigned __int8 *)([*v468 currentLFRecord] + 2);
                gid_t v342 = *(unsigned __int8 *)([*v468 currentLFRecord] + 3);
                v551.st_dev = 67109888;
                *(_DWORD *)&v551.st_mode = v339;
                LOWORD(v551.st_ino) = 1024;
                *(_DWORD *)((char *)&v551.st_ino + 2) = v340;
                HIWORD(v551.st_ino) = 1024;
                v551.st_uid = v341;
                LOWORD(v551.st_gvoid (**v4)(id, id) = 1024;
                *(gid_t *)((char *)&v551.st_gid + 2) = v342;
                _os_log_impl( &dword_1870CA000,  v338,  OS_LOG_TYPE_DEFAULT,  "Got unexpected local file signature %c%c%c%c ; entering passthrough mode",
                  (uint8_t *)&v551,
                  0x1Au);
              }

              v315 = v510;
              uint64_t v317 = v509;
              uint64_t v316 = v8;
LABEL_431:
              -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v316, (uint64_t)v315, v317);
              id v10 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_474;
            }

            if (*(_DWORD *)[*v12 currentLFRecord] != 33639248)
            {
              SZGetLoggingHandle();
              v377 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v551.st_dev) = 0;
                _os_log_error_impl( &dword_1870CA000,  v377,  OS_LOG_TYPE_ERROR,  "Encountered unexpectedly non-stream-compliant data in stream!",  (uint8_t *)&v551,  2u);
              }

              v564 = @"SZExtractorFileOffsetErrorKey";
              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(*v12, "currentOffset"));
              v378 = (void *)objc_claimAutoreleasedReturnValue();
              v565[0] = v378;
              [MEMORY[0x189603F68] dictionaryWithObjects:v565 forKeys:&v564 count:1];
              v379 = (void *)objc_claimAutoreleasedReturnValue();
              _CreateError( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  552LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v379,  @"Encountered unexpectedly non-stream-compliant data in stream!",  v380,  v446);
              id v10 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_474;
            }

            if ([*v12 bytesHashedInChunk])
            {
              [*v12 lastChunkPartialHash];
              v407 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v407)
              {
                SZGetLoggingHandle();
                v410 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v410, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v551.st_dev) = 0;
                  _os_log_debug_impl( &dword_1870CA000,  v410,  OS_LOG_TYPE_DEBUG,  "No last chunk partial hash; will need full chunk to validate.",
                    (uint8_t *)&v551,
                    2u);
                }

                v409 = 0LL;
                goto LABEL_525;
              }

              uint64_t v408 = [*v12 checkLastChunkPartialHash];
              if (v408)
              {
                v409 = (void *)v408;
                SZGetLoggingHandle();
                v410 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v410, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(v551.st_dev) = 0;
                  _os_log_error_impl( &dword_1870CA000,  v410,  OS_LOG_TYPE_ERROR,  "Last chunk's partial hash did not validate (store hashed chunk size mismatch?); consuming more data "
                    "to check full chunk.",
                    (uint8_t *)&v551,
                    2u);
                }

- (id)_beginNonStreamablePassthroughWithRemainingBytes:(uint64_t)a3 length:
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 64) unzipPath];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = *(dispatch_group_s **)(a1 + 96);
  if (v7) {
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  if ([*(id *)(a1 + 64) performingExtraction])
  {
    SZGetTraceHandle();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl( &dword_1870CA000,  v8,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "EXTRACTION",  "Extraction entered passthrough mode",  (uint8_t *)&buf,  2u);
    }

    [*(id *)(a1 + 64) setPerformingExtraction:0];
  }

  SZGetLoggingHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( &dword_1870CA000,  v9,  OS_LOG_TYPE_DEFAULT,  "Beginning passthrough of non-streamable zip file to %@",  (uint8_t *)&buf,  0xCu);
  }

  SZGetTraceHandle();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "PASSTHROUGH_MODE",  "Beginning passthrough of non-streamable zip file to %@",  (uint8_t *)&buf,  0xCu);
  }

  [MEMORY[0x1896078A8] defaultManager];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 removeItemAtPath:v6 error:0];

  uint64_t v12 = [*(id *)(a1 + 64) performCachedWrites];
  id v39 = 0LL;
  +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:]( &OBJC_CLASS___StreamingFileWriter,  "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:",  v6,  1537LL,  384LL,  0LL,  v12,  &v39);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v39;
  if (!v13)
  {
    SZGetLoggingHandle();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl( &dword_1870CA000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to open passthrough output file at %@",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v44 = *MEMORY[0x1896074F8];
    uint32_t v45 = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError( (uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]",  196LL,  @"SZExtractorErrorDomain",  1LL,  v14,  v26,  @"Failed to open passthrough output file at %@",  v27,  (uint64_t)v6);
    goto LABEL_33;
  }

  [v13 setIncompleteExtractionAttribute];
  [*(id *)(a1 + 64) unsureData];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 length];

  id v17 = [*(id *)(a1 + 64) unsureData];
  id v38 = v14;
  char v18 = objc_msgSend(v13, "writeBuffer:length:error:", objc_msgSend(v17, "bytes"), v16, &v38);
  id v19 = v38;

  if ((v18 & 1) != 0)
  {
    if (!a3)
    {
LABEL_16:
      [*(id *)(a1 + 64) setFileWriter:v13];
      [*(id *)(a1 + 64) setCurrentOffset:v16 + a3];
      [*(id *)(a1 + 64) updateHashFromOffset:v16 withBytes:a2 length:a3];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        [*(id *)(a1 + 64) setStreamState:5];
        if ((*(_BYTE *)(a1 + 80) & 4) != 0)
        {
          [(id)a1 xpcConnection];
          int v22 = (void *)objc_claimAutoreleasedReturnValue();
          id v23 = v22;
          if (v22)
          {
            [v22 remoteObjectProxy];
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            [v24 extractionEnteredPassThroughMode];
          }

          else
          {
            [(id)a1 inProcessExtractorDelegate];
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              [(id)a1 inProcessDelegateQueue];
              id v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                [(id)a1 inProcessDelegateQueue];
                uint64_t v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
                *(void *)&__int128 buf = MEMORY[0x1895F87A8];
                *((void *)&buf + 1) = 3221225472LL;
                uint64_t v47 = __54__StreamingUnzipper__extractionEnteredPassThroughMode__block_invoke;
                id v48 = &unk_189FE1D70;
                id v24 = v24;
                id v49 = v24;
                dispatch_async(v35, &buf);
              }
            }
          }
        }

        [*(id *)(a1 + 64) serializeState];
        id v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21) {
          goto LABEL_35;
        }
      }

- (void)_sendExtractionProgress:(uint64_t)a1
{
  if ((*(_BYTE *)(a1 + 80) & 1) != 0 && a2 - *(double *)(a1 + 88) >= 0.00999999978)
  {
    *(double *)(a1 + 88) = a2;
    [(id)a1 xpcConnection];
    char v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    if (v4)
    {
      [v4 remoteObjectProxy];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setExtractionProgress:a2];
    }

    else
    {
      [(id)a1 inProcessExtractorDelegate];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        [(id)a1 inProcessDelegateQueue];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          [(id)a1 inProcessDelegateQueue];
          uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          v9[0] = MEMORY[0x1895F87A8];
          v9[1] = 3221225472LL;
          v9[2] = __45__StreamingUnzipper__sendExtractionProgress___block_invoke;
          v9[3] = &unk_189FE1D20;
          id v10 = v6;
          double v11 = a2;
          dispatch_async(v8, v9);
        }
      }
    }
  }

uint64_t __58__StreamingUnzipper__sendExtractionCompleteAtArchivePath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractionCompleteAtArchivePath:*(void *)(a1 + 40)];
}

uint64_t __45__StreamingUnzipper__sendExtractionProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExtractionProgress:*(double *)(a1 + 40)];
}

uint64_t __54__StreamingUnzipper__extractionEnteredPassThroughMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractionEnteredPassThroughMode];
}

@end