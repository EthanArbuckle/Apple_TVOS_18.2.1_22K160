@interface RPFileTransferSession
+ (BOOL)supportsSecureCoding;
- (BOOL)_activateAndReturnError:(id *)a3;
- (BOOL)_activateSourceAndReturnError:(id *)a3;
- (BOOL)_activateTargetAndReturnError:(id *)a3;
- (BOOL)_largeFileReceiveTaskUpdateSHA256CtxFromFileItem:(id)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)_prepareItem:(id)a3 error:(id *)a4;
- (BOOL)_readFD:(int)a3 buffer:(char *)a4 size:(unint64_t)a5 error:(id *)a6;
- (BOOL)_smallFilesReceiveTaskFileItem:(id)a3 error:(id *)a4;
- (BOOL)_truncateFD:(int)a3 size:(int64_t)a4 error:(id *)a5;
- (BOOL)_writeFD:(int)a3 buffer:(const char *)a4 size:(unint64_t)a5 error:(id *)a6;
- (BOOL)isResumable;
- (BOOL)prepareTemplateAndReturnError:(id *)a3;
- (NSData)peerPublicKey;
- (NSData)selfPublicKey;
- (NSData)selfSecretKey;
- (NSString)label;
- (NSString)serviceType;
- (NSString)targetID;
- (NSURL)temporaryDirectoryURL;
- (OS_dispatch_queue)dispatchQueue;
- (RPFileTransferProgress)progressCurrent;
- (RPFileTransferSession)init;
- (RPFileTransferSession)initWithCoder:(id)a3;
- (double)progressHandlerTimeInterval;
- (id)_compressData:(id)a3 error:(id *)a4;
- (id)_decompressAndDecodeData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5;
- (id)_decompressData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5;
- (id)_encodeAndCompressObject:(id)a3 originalSize:(unint64_t *)a4 error:(id *)a5;
- (id)_ioQueueDequeue;
- (id)_largeFileSendTaskCreate;
- (id)_modTimeForFileWithPath:(const char *)a3 error:(id *)a4;
- (id)_readFD:(int)a3 size:(unint64_t)a4 error:(id *)a5;
- (id)_readPath:(const char *)a3 size:(unint64_t)a4 error:(id *)a5;
- (id)_smallFilesSendTaskCreate;
- (id)_smallFilesSendTaskReadItem:(id)a3 error:(id *)a4;
- (id)completionHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)flowControlChangedHandler;
- (id)progressHandler;
- (id)receivedItemHandler;
- (id)receivedItemsHandler;
- (id)resumeState;
- (id)resumeStateDict;
- (int)_openReadFileItem:(id)a3 error:(id *)a4;
- (int)_openReadPath:(const char *)a3 error:(id *)a4;
- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 error:(id *)a5;
- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6;
- (int)_openWritePath:(id)a3 size:(int64_t)a4 error:(id *)a5;
- (int)_openWritePath:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6;
- (int)flowControlState;
- (unint64_t)debugFlags;
- (unint64_t)largeFileBufferBytes;
- (unint64_t)maxLargeFileTasks;
- (unint64_t)maxSmallFileTasks;
- (unsigned)flags;
- (void)_completeItem:(id)a3 error:(id)a4;
- (void)_completeItemDirect:(id)a3 error:(id)a4;
- (void)_controlCnxRetryIfNeeded;
- (void)_controlCnxStartIfNeeded;
- (void)_debugSetup;
- (void)_debugUpdate;
- (void)_handleDeviceFound:(id)a3;
- (void)_handleDeviceLost:(id)a3;
- (void)_handleDevicesCoalesced;
- (void)_handleIncomingConnectionEnded:(id)a3;
- (void)_handleIncomingConnectionStarted:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_ioQueueEnqueue:(id)a3;
- (void)_largeFileReceiveRequest:(id)a3 responseHandler:(id)a4;
- (void)_largeFileReceiveTaskInvalidate:(id)a3;
- (void)_largeFileReceiveTaskRespond:(id)a3 error:(id)a4 complete:(BOOL)a5 responseHandler:(id)a6;
- (void)_largeFileReceiveTaskRun:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 responseHandler:(id)a6;
- (void)_largeFileSendTaskEnd:(id)a3 error:(id)a4;
- (void)_largeFileSendTaskFailed:(id)a3 error:(id)a4;
- (void)_largeFileSendTaskNext:(id)a3 xid:(unsigned int)a4;
- (void)_largeFileSendTaskResponse:(id)a3 error:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6;
- (void)_largeFileSendTaskSend:(id)a3 data:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6;
- (void)_largeFileSendTaskStart:(id)a3;
- (void)_metricAddFileSize:(int64_t)a3;
- (void)_prefsChanged;
- (void)_processFinish;
- (void)_processReceivedItem:(id)a3 responseHandler:(id)a4;
- (void)_processReceivedItems:(id)a3 responseHandler:(id)a4;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)_receivedPeerUpdate:(id)a3;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_reportCompletion:(id)a3;
- (void)_reportDataTransferred;
- (void)_reportProgressControlState;
- (void)_reportProgressType:(int)a3;
- (void)_requestResumeStateFromReceiver;
- (void)_resumeStateReceiveRequest:(id)a3 responseHandler:(id)a4;
- (void)_scheduleItems;
- (void)_smallFilesReceiveRequest:(id)a3 responseHandler:(id)a4;
- (void)_smallFilesReceiveTaskComplete:(id)a3 error:(id)a4 responseHandler:(id)a5;
- (void)_smallFilesReceiveTaskRun:(id)a3 responseHandler:(id)a4;
- (void)_smallFilesSendTaskEnd:(id)a3 error:(id)a4;
- (void)_smallFilesSendTaskRun:(id)a3;
- (void)_startProgressReportTimer;
- (void)_stopProgressReportTimer;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_updateLargeFilesTaskResumeState:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 error:(id)a6 complete:(BOOL)a7;
- (void)_updateSmallFilesTaskResumeState:(id)a3 error:(id)a4;
- (void)_updateWiFi;
- (void)activate;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)dealloc;
- (void)deregisterEventID:(id)a3;
- (void)deregisterRequestID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finish;
- (void)invalidate;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setCompletionHandler:(id)a3;
- (void)setDebugFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFlowControlChangedHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLargeFileBufferBytes:(unint64_t)a3;
- (void)setMaxLargeFileTasks:(unint64_t)a3;
- (void)setMaxSmallFileTasks:(unint64_t)a3;
- (void)setPeerPublicKey:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setProgressHandlerTimeInterval:(double)a3;
- (void)setReceivedItemHandler:(id)a3;
- (void)setReceivedItemsHandler:(id)a3;
- (void)setSelfPublicKey:(id)a3;
- (void)setSelfSecretKey:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTargetID:(id)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
@end

@implementation RPFileTransferSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPFileTransferSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RPFileTransferSession;
  v2 = -[RPFileTransferSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_debugNotifyToken = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPFileTransferSession;
    v3->_resumable = 0;
    resumeState = v3->_resumeState;
    v3->_resumeState = 0LL;

    v3->_resumeStateFlushInterval = 1.0;
    v3->_flags = 0;
    v3->_maxSmallFileTasks = 3LL;
    -[RPFileTransferSession setProgressHandlerTimeInterval:](v3, "setProgressHandlerTimeInterval:", 0.0);
    v5 = v3;
  }

  return v3;
}

- (RPFileTransferSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RPFileTransferSession;
  v5 = -[RPFileTransferSession init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPFileTransferSession;
    v6->_resumable = 0;
    resumeState = v6->_resumeState;
    v6->_resumeState = 0LL;

    v6->_resumeStateFlushInterval = 1.0;
    id v8 = v4;

    id v9 = v8;
    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v13 = v12;
    id v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t flags = self->_flags;
  id v14 = v4;
  if ((_DWORD)flags)
  {
    [v4 encodeInt64:flags forKey:@"flags"];
    id v4 = v14;
  }

  unint64_t largeFileBufferBytes = self->_largeFileBufferBytes;
  if (largeFileBufferBytes)
  {
    [v14 encodeInt64:largeFileBufferBytes forKey:@"lFlBufB"];
    id v4 = v14;
  }

  unint64_t maxLargeFileTasks = self->_maxLargeFileTasks;
  if (maxLargeFileTasks)
  {
    [v14 encodeInt64:maxLargeFileTasks forKey:@"lFlMxTs"];
    id v4 = v14;
  }

  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey)
  {
    [v14 encodeObject:peerPublicKey forKey:@"peerPK"];
    id v4 = v14;
  }

  selfPublicKey = self->_selfPublicKey;
  if (selfPublicKey)
  {
    [v14 encodeObject:selfPublicKey forKey:@"selfPK"];
    id v4 = v14;
  }

  selfSecretKey = self->_selfSecretKey;
  if (selfSecretKey)
  {
    [v14 encodeObject:selfSecretKey forKey:@"selfSK"];
    id v4 = v14;
  }

  unint64_t maxSmallFileTasks = self->_maxSmallFileTasks;
  if (maxSmallFileTasks)
  {
    [v14 encodeInt64:maxSmallFileTasks forKey:@"sFlMxTs"];
    id v4 = v14;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v14 encodeObject:serviceType forKey:@"srvTy"];
    id v4 = v14;
  }

  targetID = self->_targetID;
  if (targetID)
  {
    [v14 encodeObject:targetID forKey:@"targetID"];
    id v4 = v14;
  }
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0LL;
  }

  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel((dispatch_source_t)progressTimer);
    v5 = self->_progressTimer;
    self->_progressTimer = 0LL;
  }

  resumeState = self->_resumeState;
  self->_resumeState = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RPFileTransferSession;
  -[RPFileTransferSession dealloc](&v7, sel_dealloc);
}

- (id)description
{
  return -[RPFileTransferSession descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4 = 0LL;
  v5 = v4;
  targetID = self->_targetID;
  if (targetID)
  {
    v20 = v4;
    v17 = targetID;
    NSAppendPrintF();
    id v7 = v20;

    v5 = v7;
  }

  if (self->_flags)
  {
    NSAppendPrintF();
    id v8 = v5;

    v5 = v8;
  }

  label = self->_label;
  if (label)
  {
    objc_super v18 = label;
    NSAppendPrintF();
    id v10 = v5;

    v5 = v10;
  }

  if (self->_largeFileBufferBytes)
  {
    NSAppendPrintF();
    id v11 = v5;

    v5 = v11;
  }

  if (self->_maxLargeFileTasks)
  {
    NSAppendPrintF();
    id v12 = v5;

    v5 = v12;
  }

  if (self->_maxSmallFileTasks)
  {
    NSAppendPrintF();
    id v13 = v5;

    v5 = v13;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    uint64_t v19 = serviceType;
    NSAppendPrintF();
    id v15 = v5;

    v5 = v15;
  }

  return v5;
}

- (void)setDebugFlags:(unint64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __39__RPFileTransferSession_setDebugFlags___block_invoke;
  v4[3] = &unk_18A0322F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __39__RPFileTransferSession_setDebugFlags___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 576LL) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _debugUpdate];
}

- (void)setFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __34__RPFileTransferSession_setFlags___block_invoke;
  v3[3] = &unk_18A0330F0;
  unsigned int v4 = a3;
  v3[4] = self;
  -[RPFileTransferSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __34__RPFileTransferSession_setFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 556);
  if (v1 != v3)
  {
    if (*(_BYTE *)(v2 + 8) && (int v5 = **(_DWORD **)(v2 + 152), v5 <= 30))
    {
      if (v5 != -1 || (int v8 = _LogCategory_Initialize(), v6 = *(_DWORD *)(a1 + 40), v2 = *(void *)(a1 + 32), v8))
      {
        LogPrintF();
        int v6 = *(_DWORD *)(a1 + 40);
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }

    else
    {
      int v6 = *(_DWORD *)(a1 + 40);
    }

    *(_DWORD *)(v2 + 556) = v6;
  }

  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setLargeFileBufferBytes:(unint64_t)a3
{
  if (self->_largeFileBufferBytes != a3)
  {
    int var0 = self->_ucat->var0;
  }

  self->_unint64_t largeFileBufferBytes = a3;
}

- (void)setMaxLargeFileTasks:(unint64_t)a3
{
  if (self->_maxLargeFileTasks != a3)
  {
    int var0 = self->_ucat->var0;
  }

  self->_unint64_t maxLargeFileTasks = a3;
}

- (void)setMaxSmallFileTasks:(unint64_t)a3
{
  if (self->_maxSmallFileTasks != a3)
  {
    int var0 = self->_ucat->var0;
  }

  self->_unint64_t maxSmallFileTasks = a3;
}

- (BOOL)isResumable
{
  return (-[RPFileTransferSession flags](self, "flags") >> 9) & 1;
}

- (id)resumeState
{
  return self->_resumeState;
}

- (id)resumeStateDict
{
  resumeState = self->_resumeState;
  if (resumeState)
  {
    [resumeState dictionaryRepresentation];
    resumeState = (void *)objc_claimAutoreleasedReturnValue();
  }

  return resumeState;
}

- (BOOL)prepareTemplateAndReturnError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!-[NSData length](self->_selfPublicKey, "length", a3) || !-[NSData length](self->_selfSecretKey, "length"))
  {
    cced25519_make_key_pair_compat();
    id v4 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v15 length:32];
    selfPublicKey = self->_selfPublicKey;
    self->_selfPublicKey = v4;

    int v6 = (NSData *)[MEMORY[0x189603F48] _newZeroingDataWithBytes:__s length:32];
    selfSecretKey = self->_selfSecretKey;
    self->_selfSecretKey = v6;

    memset_s(__s, 0x20uLL, 0, 0x20uLL);
  }

  if ((self->_flags & 1) != 0)
  {
    if (!self->_targetID)
    {
      id v9 = NSRandomData();
      [v9 bytes];
      [v9 length];
      [v9 length];
      NSPrintF();
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      targetID = self->_targetID;
      self->_targetID = v10;
    }

    int var0 = self->_ucat->var0;
  }

  else
  {
    int v8 = self->_ucat->var0;
    if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize())) {
LABEL_12:
    }
      LogPrintF();
  }

  return 1;
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activateCalled)
  {
    v2->_activateCalled = 1;
    dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __33__RPFileTransferSession_activate__block_invoke;
    block[3] = &unk_18A031A30;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v2);
}

void __33__RPFileTransferSession_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 152);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      uint64_t v13 = *(void *)(v2 + 680);
      uint64_t v14 = *(void *)(v2 + 632);
      uint64_t v12 = *(void *)(v2 + 688);
      uint64_t v9 = *(unsigned int *)(v2 + 556);
      id v11 = &unk_1873E7568;
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  id v15 = 0LL;
  objc_msgSend((id)v2, "_activateAndReturnError:", &v15, v9, v11, v12, v13, v14);
  id v5 = v15;
  int v6 = *(_DWORD ***)(a1 + 32);
  if (v5)
  {
    int v7 = *v6[19];
    if (v7 <= 90 && (v7 != -1 || (int v8 = _LogCategory_Initialize(), v6 = *(_DWORD ***)(a1 + 32), v8)))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_reportCompletion:", v5, v5);
    }

    else
    {
      objc_msgSend(v6, "_reportCompletion:", v5, v10);
    }
  }

  else
  {
    [*(id *)(a1 + 32) _startProgressReportTimer];
  }
}

- (BOOL)_activateAndReturnError:(id *)a3
{
  id v5 = self->_targetID;
  if (v5)
  {
    -[RPFileTransferSession _prefsChanged](self, "_prefsChanged");
    -[RPFileTransferSession _debugSetup](self, "_debugSetup");
    int v6 = self->_selfPublicKey;
    if (!self->_selfPublicKey)
    {
      if (a3)
      {
        RPErrorF();
        BOOL v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        BOOL v31 = 0;
      }

      goto LABEL_22;
    }

    int v7 = self->_selfSecretKey;
    if (!self->_selfSecretKey)
    {
      if (a3)
      {
        RPErrorF();
        BOOL v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        BOOL v31 = 0;
      }

      goto LABEL_21;
    }

    int v8 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
    -[RPIdentity setEdPKData:](v8, "setEdPKData:", v6);
    -[RPIdentity setEdSKData:](v8, "setEdSKData:", v7);
    objc_storeStrong((id *)&self->_selfIdentity, v8);
    uint64_t v9 = self->_peerPublicKey;
    if (!self->_peerPublicKey)
    {
      if (a3)
      {
        RPErrorF();
        BOOL v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        BOOL v31 = 0;
      }

      goto LABEL_20;
    }

    v33 = v6;
    v34 = v5;
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
    -[RPIdentity setEdPKData:](v10, "setEdPKData:", v9);
    objc_storeStrong((id *)&self->_peerIdentity, v10);
    id v11 = self->_receiveFileParentPath;
    if (!v11)
    {
      uint64_t v12 = self->_temporaryDirectoryURL;
      if (!v12)
      {
        [MEMORY[0x1896078A8] defaultManager];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        id v35 = 0LL;
        [v13 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v35];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v15 = v35;

        if (!v14)
        {
          if (a3)
          {
            RPNestedErrorF();
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }

          id v11 = 0LL;
          goto LABEL_40;
        }

        [v14 URLByAppendingPathComponent:@"com.apple.rapport/FileTransfer" isDirectory:1];
        uint64_t v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
      }

      -[NSString stringByAppendingString:](self->_targetID, "stringByAppendingString:", @".rpftd");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSURL URLByAppendingPathComponent:isDirectory:](v12, "URLByAppendingPathComponent:isDirectory:", v16, 1LL);
      [v17 path];
      id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_receiveFileParentPath, v11);
    }

    int var0 = self->_ucat->var0;
    uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    ioQueues = self->_ioQueues;
    self->_ioQueues = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    smallFilesReceiveTasks = self->_smallFilesReceiveTasks;
    self->_smallFilesReceiveTasks = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    smallFilesSendTasks = self->_smallFilesSendTasks;
    self->_smallFilesSendTasks = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    largeFileSendTasks = self->_largeFileSendTasks;
    self->_largeFileSendTasks = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    largeFileReceiveTasks = self->_largeFileReceiveTasks;
    self->_largeFileReceiveTasks = v27;

    if ((self->_flags & 1) != 0)
    {
      if (!-[RPFileTransferSession _activateTargetAndReturnError:](self, "_activateTargetAndReturnError:", a3))
      {
LABEL_40:
        BOOL v31 = 0;
        goto LABEL_19;
      }
    }

    else if (!-[RPFileTransferSession _activateSourceAndReturnError:](self, "_activateSourceAndReturnError:", a3))
    {
      goto LABEL_40;
    }

    self->_metricTicksActivate = mach_absolute_time();
    v29 = objc_alloc_init(&OBJC_CLASS___RPFileTransferProgress);
    progressCurrent = self->_progressCurrent;
    self->_progressCurrent = v29;

    BOOL v31 = 1;
    -[RPFileTransferSession _reportProgressType:](self, "_reportProgressType:", 1LL);
LABEL_19:

    int v6 = v33;
    id v5 = v34;
LABEL_20:

LABEL_21:
LABEL_22:

    goto LABEL_23;
  }

  if (a3)
  {
    RPErrorF();
    BOOL v31 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v31 = 0;
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__RPFileTransferSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPFileTransferSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 89))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 89) = 1;
    int v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[19];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), int v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        int v3 = *(_DWORD ***)(v2 + 32);
      }
    }

    return [v3 _invalidate];
  }

  return result;
}

- (void)_invalidate
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  -[RPFileTransferSession _stopProgressReportTimer](self, "_stopProgressReportTimer");
  int v3 = self->_addedItems;
  addedItems = self->_addedItems;
  self->_addedItems = 0LL;

  if (-[NSMutableSet count](v3, "count"))
  {
    RPErrorF();
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    int v6 = v3;
    uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          -[RPFileTransferSession _completeItemDirect:error:]( self,  "_completeItemDirect:error:",  *(void *)(*((void *)&v31 + 1) + 8 * v10++),  v5);
        }

        while (v8 != v10);
        uint64_t v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
      }

      while (v8);
    }

    -[NSMutableSet removeAllObjects](v6, "removeAllObjects");
  }

  -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0LL;

  -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = 0LL;

  -[CUCoalescer invalidate](self->_bonjourCoalescer, "invalidate");
  bonjourCoalescer = self->_bonjourCoalescer;
  self->_bonjourCoalescer = 0LL;

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v14 = self->_connections;
  uint64_t v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v18++), "invalidate", (void)v27);
      }

      while (v16 != v18);
      uint64_t v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
    }

    while (v16);
  }

  -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
  -[RPConnection invalidate](self->_controlCnx, "invalidate");
  controlCnx = self->_controlCnx;
  self->_controlCnx = 0LL;

  controlRetryTimer = self->_controlRetryTimer;
  if (controlRetryTimer)
  {
    v21 = controlRetryTimer;
    dispatch_source_cancel(v21);
    v22 = self->_controlRetryTimer;
    self->_controlRetryTimer = 0LL;
  }

  -[NSMutableDictionary removeAllObjects](self->_registeredEvents, "removeAllObjects", (void)v27);
  registeredEvents = self->_registeredEvents;
  self->_registeredEvents = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_registeredRequests, "removeAllObjects");
  registeredRequests = self->_registeredRequests;
  self->_registeredRequests = 0LL;

  -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
  tcpServer = self->_tcpServer;
  self->_tcpServer = 0LL;

  -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
  wifiManager = self->_wifiManager;
  self->_wifiManager = 0LL;

  -[RPFileTransferSession _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_smallFilesReceiveTasks, "count")
    && !-[NSMutableSet count](self->_smallFilesSendTasks, "count")
    && !-[NSMutableDictionary count](self->_largeFileReceiveTasks, "count")
    && !-[NSMutableSet count](self->_largeFileSendTasks, "count"))
  {
    int v3 = (void (**)(void, void))MEMORY[0x1895A4770](self->_completionHandler);
    if (v3)
    {
      RPErrorF();
      int v4 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v3)[2](v3, v4);
    }

    int debugNotifyToken = self->_debugNotifyToken;
    if (debugNotifyToken != -1)
    {
      notify_cancel(debugNotifyToken);
      self->_int debugNotifyToken = -1;
    }

    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0LL;

    id flowControlChangedHandler = self->_flowControlChangedHandler;
    self->_id flowControlChangedHandler = 0LL;

    id progressHandler = self->_progressHandler;
    self->_id progressHandler = 0LL;

    id receivedItemHandler = self->_receivedItemHandler;
    self->_id receivedItemHandler = 0LL;

    id receivedItemsHandler = self->_receivedItemsHandler;
    self->_id receivedItemsHandler = 0LL;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
  }

- (void)_prefsChanged
{
  if ((self->_flags & 0x100) != 0)
  {
    uint64_t Int64 = CFPrefs_GetInt64();
    if (v47) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = Int64 == 0;
    }
    BOOL v3 = !v5;
  }

  else
  {
    BOOL v3 = 0;
  }

  if (self->_prefCompress != v3)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = "yes";
      if (v3) {
        uint64_t v8 = "no";
      }
      else {
        uint64_t v8 = "yes";
      }
      if (!v3) {
        uint64_t v7 = "no";
      }
      v43 = v8;
      v45 = v7;
      LogPrintF();
    }

    self->_prefCompress = v3;
  }

  unint64_t v9 = CFPrefs_GetInt64();
  if (!-[RPFileTransferSession largeFileBufferBytes](self, "largeFileBufferBytes"))
  {
    if (v9 <= 0x989680 && v9 != 0 && v47 == 0) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 0x100000LL;
    }
    -[RPFileTransferSession setLargeFileBufferBytes:](self, "setLargeFileBufferBytes:", v12, v43, v45);
  }

  unint64_t v13 = CFPrefs_GetInt64();
  if (!-[RPFileTransferSession maxLargeFileTasks](self, "maxLargeFileTasks"))
  {
    if (v13 <= 0x3E8 && v13 != 0 && v47 == 0) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = 3LL;
    }
    -[RPFileTransferSession setMaxLargeFileTasks:](self, "setMaxLargeFileTasks:", v16, v43, v45);
  }

  uint64_t v17 = CFPrefs_GetInt64();
  if (v17 <= 1000 && v17 >= 1 && v47 == 0) {
    int64_t v20 = v17;
  }
  else {
    int64_t v20 = 3LL;
  }
  uint64_t prefLargeFileMaxOutstanding = self->_prefLargeFileMaxOutstanding;
  if (v20 != prefLargeFileMaxOutstanding)
  {
    int v22 = self->_ucat->var0;
    if (v22 <= 30)
    {
      if (v22 == -1)
      {
        uint64_t prefLargeFileMaxOutstanding = self->_prefLargeFileMaxOutstanding;
      }

      uint64_t v44 = prefLargeFileMaxOutstanding;
      int64_t v46 = v20;
      LogPrintF();
    }

- (void)_reportCompletion:(id)a3
{
  v55[26] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  unint64_t metricLastFileCompletionTicks = self->_metricLastFileCompletionTicks;
  if (!metricLastFileCompletionTicks) {
    unint64_t metricLastFileCompletionTicks = mach_absolute_time();
  }
  unint64_t metricTicksConnectStart = self->_metricTicksConnectStart;
  if (metricTicksConnectStart) {
    BOOL v7 = metricLastFileCompletionTicks > metricTicksConnectStart;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    self->_metricTicksConnected += metricLastFileCompletionTicks - metricTicksConnectStart;
  }
  UpTicksToSecondsF();
  double v9 = v8;
  if (v8 == 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = (double)self->_metricTotalBytes / v8;
  }
  unint64_t v11 = UpTicksToSeconds();
  unint64_t metricUncompressedBytes = self->_metricUncompressedBytes;
  if (metricUncompressedBytes)
  {
    -[RPFileTransferProgress setCompressionRate:]( self->_progressCurrent,  "setCompressionRate:",  (double)self->_metricCompressedBytes / (double)metricUncompressedBytes);
    -[RPFileTransferProgress compressionRate](self->_progressCurrent, "compressionRate");
    uint64_t v14 = (int)(v13 * 100.0);
  }

  else
  {
    uint64_t v14 = 0xFFFFFFFFLL;
  }

  -[RPFileTransferProgress setBytesPerSecond:](self->_progressCurrent, "setBytesPerSecond:", v10);
  -[RPFileTransferProgress setRemainingSeconds:](self->_progressCurrent, "setRemainingSeconds:", 0.0);
  -[RPFileTransferProgress setCurrentFilename:](self->_progressCurrent, "setCurrentFilename:", 0LL);
  -[RPFileTransferProgress setError:](self->_progressCurrent, "setError:", v4);
  -[RPFileTransferProgress setTransferredByteCount:]( self->_progressCurrent,  "setTransferredByteCount:",  self->_metricTotalBytes);
  -[RPFileTransferProgress setTotalByteCount:](self->_progressCurrent, "setTotalByteCount:", self->_metricTotalBytes);
  -[RPFileTransferProgress setTransferredFileCount:]( self->_progressCurrent,  "setTransferredFileCount:",  self->_metricTotalFiles);
  -[RPFileTransferProgress setTotalFileCount:](self->_progressCurrent, "setTotalFileCount:", self->_metricTotalFiles);
  -[RPFileTransferSession _reportProgressType:](self, "_reportProgressType:", 20LL);
  int var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v34 = v14;
      id v35 = v4;
      double v32 = (double)self->_metricTotalBytes / 1000000.0;
      double v33 = v10 / 1000000.0;
      unint64_t metricTotalFiles = self->_metricTotalFiles;
LABEL_22:
      LogPrintF();
    }
  }

  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v34 = v14;
    double v32 = (double)self->_metricTotalBytes / 1000000.0;
    double v33 = v10 / 1000000.0;
    unint64_t metricTotalFiles = self->_metricTotalFiles;
    goto LABEL_22;
  }

  uint64_t v16 = (void (**)(void, void))MEMORY[0x1895A4770](self->_completionHandler);
  if (v16)
  {
    id v53 = v16;
    ((void (**)(void, id))v16)[2](v16, v4);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0LL;

    if ((self->_flags & 2) != 0) {
      uint64_t v18 = @"d2d";
    }
    else {
      uint64_t v18 = @"?";
    }
    v55[0] = v18;
    v54[0] = @"type";
    v54[1] = @"errD";
    uint64_t v19 = objc_msgSend(v4, "domain", metricTotalFiles, *(void *)&v32, *(void *)&v33, v34, v35);
    v51 = (void *)v19;
    int64_t v20 = &stru_18A035BB8;
    if (v19) {
      int64_t v20 = (const __CFString *)v19;
    }
    v55[1] = v20;
    v54[2] = @"errC";
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v4, "code"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v50;
    v54[3] = @"totB";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:10000000 * (self->_metricTotalBytes / 0x989680)];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v49;
    v54[4] = @"totF";
    id v52 = v4;
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricTotalFiles / 0x64)];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v48;
    v54[5] = @"totS";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:60 * (v11 / 0x3C)];
    int v47 = (void *)objc_claimAutoreleasedReturnValue();
    v55[5] = v47;
    v54[6] = @"Bps";
    [MEMORY[0x189607968] numberWithDouble:v10 / 1000.0 * 1000.0];
    int64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55[6] = v46;
    v54[7] = @"cnxS";
    [MEMORY[0x189607968] numberWithDouble:v9 / 60.0 * 60.0];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v55[7] = v45;
    v54[8] = @"dCnx";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_metricDisconnects];
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55[8] = v44;
    v54[9] = @"ltAWDL";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_metricLinkTypeCountAWDL];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55[9] = v43;
    v54[10] = @"ltUSB";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_metricLinkTypeCountUSB];
    int v42 = (void *)objc_claimAutoreleasedReturnValue();
    v55[10] = v42;
    v54[11] = @"ltOther";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_metricLinkTypeCountOther];
    double v41 = (void *)objc_claimAutoreleasedReturnValue();
    v55[11] = v41;
    v54[12] = @"tcpD";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_metricTCPRanDryCount];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v55[12] = v40;
    v54[13] = @"fRtr";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_metricRetries];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v55[13] = v39;
    v54[14] = @"fs10K";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[0] / 0x64)];
    double v38 = (void *)objc_claimAutoreleasedReturnValue();
    v55[14] = v38;
    v54[15] = @"fs100K";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[1] / 0x64)];
    int v37 = (void *)objc_claimAutoreleasedReturnValue();
    v55[15] = v37;
    v54[16] = @"fs1M";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[2] / 0x64)];
    int v36 = (void *)objc_claimAutoreleasedReturnValue();
    v55[16] = v36;
    v54[17] = @"fs10M";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[3] / 0x64)];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[17] = v21;
    v54[18] = @"fs100M";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[4] / 0x64)];
    int v22 = (void *)objc_claimAutoreleasedReturnValue();
    v55[18] = v22;
    v54[19] = @"fs1G";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[5] / 0x64)];
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55[19] = v23;
    v54[20] = @"fs10G";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[6] / 0x64)];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55[20] = v24;
    v54[21] = @"fs10GUp";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[7] / 0x64)];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55[21] = v25;
    v54[22] = @"ssPr";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_metricPrematureSmallSets];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55[22] = v26;
    v54[23] = @"CmpP";
    [MEMORY[0x189607968] numberWithInt:v14];
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
    v55[23] = v27;
    v54[24] = @"CmpE";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_metricCompressionErrors];
    int v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55[24] = v28;
    v54[25] = @"CmpU";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_metricUncompressibleChunks];
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    v55[25] = v29;
    [MEMORY[0x189603F68] dictionaryWithObjects:v55 forKeys:v54 count:26];
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
    CUMetricsLogEx();

    id v4 = v52;
    uint64_t v16 = (void (**)(void, void))v53;
  }
}

- (void)_reportProgressControlState
{
  int controlState = self->_controlState;
  int v4 = -[RPConnection state](self->_controlCnx, "state");
  if (v4 != controlState)
  {
    int v5 = v4;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      BOOL v7 = "?";
      if (controlState == 1) {
        double v8 = "Ready";
      }
      else {
        double v8 = "?";
      }
      if (!controlState) {
        double v8 = "Unknown";
      }
      if (v5 == 1) {
        BOOL v7 = "Ready";
      }
      if (!v5) {
        BOOL v7 = "Unknown";
      }
      v25 = v8;
      __int128 v27 = v7;
      LogPrintF();
    }

    self->_int controlState = v5;
    int v9 = -[RPConnection linkType](self->_controlCnx, "linkType", v25, v27);
    uint64_t v10 = mach_absolute_time();
    unint64_t metricTicksConnectStart = self->_metricTicksConnectStart;
    if (metricTicksConnectStart) {
      self->_metricTicksConnected += v10 - metricTicksConnectStart;
    }
    if (v5 == 1)
    {
      self->_unint64_t metricTicksConnectStart = v10;
      uint64_t v12 = 476LL;
      if (v9 == 8) {
        uint64_t v12 = 480LL;
      }
      if (v9 == 4) {
        uint64_t v12 = 472LL;
      }
      ++*(_DWORD *)((char *)&self->super.isa + v12);
      if (self->_prefCompress)
      {
        -[RPConnection appInfoPeer](self->_controlCnx, "appInfoPeer");
        double v13 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t Int64 = CFDictionaryGetInt64();

        BOOL v15 = (Int64 >> 8) & 1;
      }

      else
      {
        LODWORD(v15) = 0;
      }

      if (self->_compressionEnabled != v15)
      {
        int v17 = self->_ucat->var0;
        if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v18 = "yes";
          if (v15) {
            uint64_t v19 = "no";
          }
          else {
            uint64_t v19 = "yes";
          }
          if (!v15) {
            uint64_t v18 = "no";
          }
          uint64_t v26 = v19;
          int v28 = v18;
          LogPrintF();
        }

        self->_compressionEnabled = v15;
      }

      uint64_t v16 = 10LL;
    }

    else
    {
      ++self->_metricDisconnects;
      self->_unint64_t metricTicksConnectStart = 0LL;
      uint64_t v16 = 11LL;
    }

    -[RPFileTransferSession _reportProgressType:](self, "_reportProgressType:", v16, v26, v28);
    -[RPFileTransferSession _updateWiFi](self, "_updateWiFi");
    if ((self->_flags & 0x80) != 0 && !self->_lockedInterface)
    {
      if (v9 == 8)
      {
        int v21 = self->_ucat->var0;
        self->_flags |= 0x30u;
        -[CUBonjourAdvertiser setAdvertiseFlags:]( self->_bonjourAdvertiser,  "setAdvertiseFlags:",  -[CUBonjourAdvertiser advertiseFlags](self->_bonjourAdvertiser, "advertiseFlags") & 0xFBFFFFFFFFFFFFFFLL);
        unint64_t v23 = -[CUBonjourBrowser browseFlags](self->_bonjourBrowser, "browseFlags") & 0xFBCFFFFFFFFFFFFFLL | 0x30000000000000LL;
        bonjourBrowser = self->_bonjourBrowser;
      }

      else
      {
        if (v9 != 4)
        {
LABEL_53:
          self->_lockedInterface = 1;
          return;
        }

        int v20 = self->_ucat->var0;
        self->_flags |= 0x60u;
        int v22 = self->_bonjourBrowser;
        unint64_t v23 = -[CUBonjourBrowser browseFlags](v22, "browseFlags") | 0x60000000000000LL;
        bonjourBrowser = v22;
      }

      -[CUBonjourBrowser setBrowseFlags:](bonjourBrowser, "setBrowseFlags:", v23);
      goto LABEL_53;
    }
  }

- (void)_reportProgressType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = self->_progressCurrent;
  if (v5)
  {
    double v13 = v5;
    uint64_t v6 = -[RPConnection linkType](self->_controlCnx, "linkType");
    if ((_DWORD)v6) {
      -[RPFileTransferProgress setLinkType:](v13, "setLinkType:", v6);
    }
    -[RPFileTransferProgress setType:](v13, "setType:", v3);
    int var0 = self->_ucat->var0;
    if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = v13;
      LogPrintF();
    }

    if ((_DWORD)v3 == 20 || (_DWORD)v3 == 11) {
      -[RPFileTransferSession _stopProgressReportTimer](self, "_stopProgressReportTimer", v12);
    }
    uint64_t v9 = MEMORY[0x1895A4770](self->_progressHandler);
    uint64_t v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t, RPFileTransferProgress *))(v9 + 16))(v9, v13);
    }

    goto LABEL_17;
  }

  int v8 = self->_ucat->var0;
  if (v8 <= 90)
  {
    double v13 = 0LL;
    if (v8 != -1 || (int v11 = _LogCategory_Initialize(), v5 = 0LL, v11))
    {
      LogPrintF();
LABEL_17:
      int v5 = v13;
    }
  }
}

- (void)_reportDataTransferred
{
  uint64_t v3 = self->_progressCurrent;
  int v4 = v3;
  if (v3)
  {
    BOOL v15 = v3;
    -[RPFileTransferProgress setType:](v3, "setType:", 30LL);
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = v15;
      LogPrintF();
    }

    if (!self->_metricLastFileCompletionTicks) {
      mach_absolute_time();
    }
    UpTicksToSecondsF();
    if (v7 == 0.0) {
      double v8 = 0.0;
    }
    else {
      double v8 = (double)self->_progressCurrentBytes / v7;
    }
    uint64_t v9 = v15;
    unint64_t metricUncompressedBytes = self->_metricUncompressedBytes;
    if (metricUncompressedBytes)
    {
      -[RPFileTransferProgress setCompressionRate:]( v15,  "setCompressionRate:",  (double)self->_metricCompressedBytes / (double)metricUncompressedBytes);
      uint64_t v9 = v15;
    }

    -[RPFileTransferProgress setBytesPerSecond:](v9, "setBytesPerSecond:", v8, v14);
    -[RPFileTransferProgress setRemainingSeconds:](v15, "setRemainingSeconds:", 0.0);
    -[RPFileTransferProgress setCurrentFilename:](v15, "setCurrentFilename:", 0LL);
    -[RPFileTransferProgress setError:](v15, "setError:", 0LL);
    -[RPFileTransferProgress setTransferredByteCount:](v15, "setTransferredByteCount:", self->_progressCurrentBytes);
    -[RPFileTransferProgress setTotalByteCount:](v15, "setTotalByteCount:", self->_progressTotalBytes);
    -[RPFileTransferProgress setTransferredFileCount:](v15, "setTransferredFileCount:", self->_progressCurrentFiles);
    -[RPFileTransferProgress setTotalFileCount:](v15, "setTotalFileCount:", self->_progressTotalFiles);
    uint64_t v11 = MEMORY[0x1895A4770](self->_progressHandler);
    uint64_t v12 = (void *)v11;
    if (v11) {
      (*(void (**)(uint64_t, RPFileTransferProgress *))(v11 + 16))(v11, v15);
    }

    goto LABEL_19;
  }

  int v6 = self->_ucat->var0;
  if (v6 <= 90)
  {
    BOOL v15 = 0LL;
    if (v6 != -1 || (v13 = _LogCategory_Initialize(), int v4 = 0LL, v13))
    {
      LogPrintF();
LABEL_19:
      int v4 = v15;
    }
  }
}

- (void)_startProgressReportTimer
{
  if (v3 > 0.0 && !self->_progressTimer)
  {
    int v4 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    progressTimer = self->_progressTimer;
    self->_progressTimer = v4;

    int v6 = self->_progressTimer;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __50__RPFileTransferSession__startProgressReportTimer__block_invoke;
    handler[3] = &unk_18A031A30;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_progressTimer);
  }

_BYTE *__50__RPFileTransferSession__startProgressReportTimer__block_invoke(uint64_t a1)
{
  result = *(_BYTE **)(a1 + 32);
  if (result[336])
  {
    result = (_BYTE *)[result _reportDataTransferred];
    *(_BYTE *)(*(void *)(a1 + 32) + 336LL) = 0;
  }

  return result;
}

- (void)_stopProgressReportTimer
{
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel((dispatch_source_t)progressTimer);
    int v4 = self->_progressTimer;
    self->_progressTimer = 0LL;
  }

- (void)_updateIfNeededWithBlock:(id)a3
{
  int v4 = (uint64_t (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __50__RPFileTransferSession__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_18A031A30;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __50__RPFileTransferSession__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWiFi];
}

- (void)_updateWiFi
{
  v20[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int flags = v2->_flags;
  if ((flags & 8) != 0)
  {
    objc_sync_exit(v2);
  }

  else
  {
    if ((flags & 4) == 0)
    {
      objc_sync_exit(v2);

LABEL_10:
      int var0 = v2->_ucat->var0;
      -[CUWiFiManager setInfraDisabled:](v2->_wifiManager, "setInfraDisabled:", 0LL);
      int v8 = 0;
      goto LABEL_22;
    }

    int v5 = -[RPConnection linkType](v2->_controlCnx, "linkType");
    objc_sync_exit(v2);

    if (v5 != 4) {
      goto LABEL_10;
    }
  }

  if ((-[CUWiFiManager infraDisabled](v2->_wifiManager, "infraDisabled") & 1) == 0)
  {
    int v4 = v2->_ucat->var0;
  }

  wifiManager = v2->_wifiManager;
  if (wifiManager)
  {
    if ((-[CUWiFiManager infraDisabled](wifiManager, "infraDisabled") & 1) != 0)
    {
      int v8 = 1;
      goto LABEL_28;
    }

    int v8 = 1;
    -[CUWiFiManager setInfraDisabled:](v2->_wifiManager, "setInfraDisabled:", 1LL);
  }

  else
  {
    uint64_t v9 = (CUWiFiManager *)objc_alloc_init(MEMORY[0x18960EDB8]);
    uint64_t v10 = v2->_wifiManager;
    v2->_wifiManager = v9;

    -[CUWiFiManager setDispatchQueue:](v2->_wifiManager, "setDispatchQueue:", v2->_dispatchQueue);
    -[CUWiFiManager setLabel:](v2->_wifiManager, "setLabel:", @"RPFile");
    int v8 = 1;
    -[CUWiFiManager setInfraDisabled:](v2->_wifiManager, "setInfraDisabled:", 1LL);
    -[CUWiFiManager activateWithCompletion:](v2->_wifiManager, "activateWithCompletion:", 0LL);
  }

- (void)_debugSetup
{
  if (IsAppleInternalBuild())
  {
    if (self->_debugNotifyToken == -1)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __36__RPFileTransferSession__debugSetup__block_invoke;
      handler[3] = &unk_18A033118;
      handler[4] = self;
      notify_register_dispatch("com.apple.rapport.ftdebug", &self->_debugNotifyToken, dispatchQueue, handler);
      int debugNotifyToken = self->_debugNotifyToken;
      uint64_t state64 = 0LL;
      notify_get_state(debugNotifyToken, &state64);
      uint64_t debugFlags = state64;
      self->_uint64_t debugFlags = state64;
      if (debugFlags)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30)
        {
          if (var0 != -1)
          {
LABEL_6:
            uint64_t v8 = debugFlags;
            LogPrintF();
            -[RPFileTransferSession _debugUpdate](self, "_debugUpdate", v8, &unk_1873E75DC);
            return;
          }

          if (_LogCategory_Initialize())
          {
            uint64_t debugFlags = self->_debugFlags;
            goto LABEL_6;
          }
        }

        -[RPFileTransferSession _debugUpdate](self, "_debugUpdate", v7, v9);
      }
    }
  }

uint64_t __36__RPFileTransferSession__debugSetup__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(unsigned int *)(v2 + 84);
  if ((_DWORD)result != -1)
  {
    uint64_t v4 = *(void *)(v2 + 576);
    uint64_t state64 = 0LL;
    notify_get_state(result, &state64);
    *(void *)(*(void *)(a1 + 32) + 576LL) = state64;
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = **(_DWORD **)(v5 + 152);
    if (v6 <= 30 && (v6 != -1 || (int v7 = _LogCategory_Initialize(), v5 = *(void *)(a1 + 32), v7)))
    {
      uint64_t v11 = *(void *)(v5 + 576);
      LogPrintF();
      return objc_msgSend(*(id *)(a1 + 32), "_debugUpdate", v4, &unk_1873E75DC, v11, &unk_1873E75DC);
    }

    else
    {
      return objc_msgSend((id)v5, "_debugUpdate", v8, v9, v10, v12);
    }
  }

  return result;
}

- (void)_debugUpdate
{
  if ((self->_debugFlags & 1) != 0 && self->_controlCnx)
  {
    int var0 = self->_ucat->var0;
    controlCnx = self->_controlCnx;
    RPErrorF();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection invalidateWithError:](controlCnx, "invalidateWithError:", v5);

    int v6 = self->_controlCnx;
    self->_controlCnx = 0LL;

    self->_debugFlags &= ~1uLL;
  }

- (void)_metricAddFileSize:(int64_t)a3
{
  if (a3 >= 10000)
  {
    uint64_t v3 = 1LL;
    uint64_t v4 = 2LL;
    uint64_t v5 = 3LL;
    uint64_t v6 = 4LL;
    uint64_t v7 = 5LL;
    uint64_t v8 = 6LL;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  ++self->_metricFileSizeBuckets[v3];
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredEvents, "objectForKeyedSubscript:", v17);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  int var0 = self->_ucat->var0;
  if (v10)
  {
  }

  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v16 = v17;
      LogPrintF();
    }

    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___RPEventRegistration);
    -[RPEventRegistration setEventID:](v12, "setEventID:", v17);
    -[RPEventRegistration setOptions:](v12, "setOptions:", v8);
    -[RPEventRegistration setHandler:](v12, "setHandler:", v9);
    registeredEvents = self->_registeredEvents;
    if (!registeredEvents)
    {
      unsigned int v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      int v15 = self->_registeredEvents;
      self->_registeredEvents = v14;

      registeredEvents = self->_registeredEvents;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredEvents, "setObject:forKeyedSubscript:", v12, v17, v16);
  }
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      id v7 = v4;
      LogPrintF();
      id v4 = v8;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_registeredEvents,  "setObject:forKeyedSubscript:",  0LL,  v4,  v7);
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __76__RPFileTransferSession_sendEventID_event_destinationID_options_completion___block_invoke;
  block[3] = &unk_18A033140;
  block[4] = self;
  id v21 = v11;
  id v23 = v13;
  id v24 = v14;
  id v22 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v11;
  dispatch_async(dispatchQueue, block);
}

void __76__RPFileTransferSession_sendEventID_event_destinationID_options_completion___block_invoke( void *a1)
{
  id v2 = *(id *)(a1[4] + 64LL);
  id v6 = v2;
  if (v2)
  {
    [v2 sendEncryptedEventID:a1[5] event:a1[6] options:a1[7] completion:a1[8]];
  }

  else
  {
    RPErrorF();
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    int v4 = **(_DWORD **)(a1[4] + 152LL);
    uint64_t v5 = a1[8];
    if (v5) {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    }
  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v14 isEqual:@"_ftPU"])
  {
    -[RPFileTransferSession _receivedPeerUpdate:](self, "_receivedPeerUpdate:", v8);
  }

  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredEvents, "objectForKeyedSubscript:", v14);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 handler];
    id v12 = (void *)v11;
    if (v11)
    {
      (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v8, v9);
    }

    else
    {
      int var0 = self->_ucat->var0;
    }
  }
}

- (void)_receivedPeerUpdate:(id)a3
{
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!v12)
  {
    uint64_t v5 = Int64Ranged & 0xC;
    BOOL v6 = v5 != 0;
    if (self->_peerInfraWiFiDisabled != v6)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        id v8 = "yes";
        if (v5) {
          id v9 = "no";
        }
        else {
          id v9 = "yes";
        }
        if (!v5) {
          id v8 = "no";
        }
        uint64_t v10 = v9;
        uint64_t v11 = v8;
        LogPrintF();
      }

      self->_peerInfraWiFiDisabled = v6;
      -[RPFileTransferSession _updateWiFi](self, "_updateWiFi", v10, v11);
    }
  }

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v17);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  int var0 = self->_ucat->var0;
  if (v10)
  {
  }

  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v16 = v17;
      LogPrintF();
    }

    int v12 = objc_alloc_init(&OBJC_CLASS___RPRequestRegistration);
    -[RPRequestRegistration setRequestID:](v12, "setRequestID:", v17);
    -[RPRequestRegistration setOptions:](v12, "setOptions:", v8);
    -[RPRequestRegistration setHandler:](v12, "setHandler:", v9);
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      int v15 = self->_registeredRequests;
      self->_registeredRequests = v14;

      registeredRequests = self->_registeredRequests;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( registeredRequests,  "setObject:forKeyedSubscript:",  v12,  v17,  v16);
  }
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      id v7 = v4;
      LogPrintF();
      id v4 = v8;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_registeredRequests,  "setObject:forKeyedSubscript:",  0LL,  v4,  v7);
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85__RPFileTransferSession_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
  block[3] = &unk_18A033140;
  block[4] = self;
  id v21 = v11;
  id v23 = v13;
  id v24 = v14;
  id v22 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v11;
  dispatch_async(dispatchQueue, block);
}

void __85__RPFileTransferSession_sendRequestID_request_destinationID_options_responseHandler___block_invoke( void *a1)
{
  id v2 = *(id *)(a1[4] + 64LL);
  id v5 = v2;
  if (v2)
  {
    [v2 sendEncryptedRequestID:a1[5] request:a1[6] xpcID:0 options:a1[7] responseHandler:a1[8]];
  }

  else
  {
    RPErrorF();
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    int v4 = **(_DWORD **)(a1[4] + 152LL);
    (*(void (**)(void, void))(a1[8] + 16LL))(a1[8], 0LL);
  }
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v18 isEqual:@"_ftSm"])
  {
    -[RPFileTransferSession _smallFilesReceiveRequest:responseHandler:]( self,  "_smallFilesReceiveRequest:responseHandler:",  v10,  v12);
  }

  else if ([v18 isEqual:@"_ftLg"])
  {
    -[RPFileTransferSession _largeFileReceiveRequest:responseHandler:]( self,  "_largeFileReceiveRequest:responseHandler:",  v10,  v12);
  }

  else if ([v18 isEqual:@"_ftRs"])
  {
    -[RPFileTransferSession _resumeStateReceiveRequest:responseHandler:]( self,  "_resumeStateReceiveRequest:responseHandler:",  v10,  v12);
  }

  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v18);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 handler];
    int v15 = (void *)v14;
    if (v14)
    {
      (*(void (**)(uint64_t, id, id, id))(v14 + 16))(v14, v10, v11, v12);
    }

    else
    {
      RPErrorF();
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      int var0 = self->_ucat->var0;
      (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v16);
    }
  }
}

- (BOOL)_activateSourceAndReturnError:(id *)a3
{
  int v4 = (CUCoalescer *)objc_alloc_init(MEMORY[0x18960ED28]);
  bonjourCoalescer = self->_bonjourCoalescer;
  self->_bonjourCoalescer = v4;
  int v6 = v4;

  -[CUCoalescer setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[CUCoalescer setMinDelay:](v6, "setMinDelay:", 1.0);
  -[CUCoalescer setMaxDelay:](v6, "setMaxDelay:", 2.0);
  -[CUCoalescer setLeeway:](v6, "setLeeway:", 1.0);
  uint64_t v7 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke;
  v18[3] = &unk_18A031AE8;
  v18[4] = v6;
  v18[5] = self;
  -[CUCoalescer setActionHandler:](v6, "setActionHandler:", v18);
  unsigned int flags = self->_flags;
  if ((flags & 0x10) != 0) {
    uint64_t v9 = 0x10000000000000LL;
  }
  else {
    uint64_t v9 = 0x400000000000000LL;
  }
  unint64_t v10 = v9 & 0xFF9FFFFFFFFFFFFFLL | ((((unint64_t)(flags & 0x60) >> 5) & 3) << 53);
  id v11 = (CUBonjourBrowser *)objc_alloc_init(MEMORY[0x18960ED20]);
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = v11;
  id v13 = v11;

  -[CUBonjourBrowser setBrowseFlags:](v13, "setBrowseFlags:", v10);
  -[CUBonjourBrowser setChangeFlags:](v13, "setChangeFlags:", 1LL);
  -[CUBonjourBrowser setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
  -[CUBonjourBrowser setDomain:](v13, "setDomain:", @"local.");
  -[CUBonjourBrowser setLabel:](v13, "setLabel:", @"RPFile");
  -[CUBonjourBrowser setServiceType:](v13, "setServiceType:", @"_rpft._tcp");
  v17[0] = v7;
  v17[1] = 3221225472LL;
  v17[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_2;
  v17[3] = &unk_18A033168;
  v17[4] = v13;
  v17[5] = self;
  -[CUBonjourBrowser setDeviceFoundHandler:](v13, "setDeviceFoundHandler:", v17);
  v16[0] = v7;
  v16[1] = 3221225472LL;
  v16[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_3;
  v16[3] = &unk_18A033168;
  v16[4] = v13;
  v16[5] = self;
  -[CUBonjourBrowser setDeviceLostHandler:](v13, "setDeviceLostHandler:", v16);
  v15[0] = v7;
  v15[1] = 3221225472LL;
  v15[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_4;
  v15[3] = &unk_18A033190;
  v15[4] = v13;
  v15[5] = self;
  -[CUBonjourBrowser setDeviceChangedHandler:](v13, "setDeviceChangedHandler:", v15);
  -[CUBonjourBrowser activate](v13, "activate");

  return 1;
}

void *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[4]) {
    return (void *)[result _handleDevicesCoalesced];
  }
  return result;
}

void *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _handleDeviceFound:a2];
  }
  return result;
}

void *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _handleDeviceLost:a2];
  }
  return result;
}

void *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _handleDeviceFound:a2];
  }
  return result;
}

- (void)_handleDeviceFound:(id)a3
{
  id v5 = a3;
  int var0 = self->_ucat->var0;
  id v14 = v5;
  if (var0 <= 20)
  {
    if (var0 != -1 || (int v7 = _LogCategory_Initialize(), v5 = v14, v7))
    {
      CUDescriptionWithLevel();
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      id v5 = v14;
    }
  }

  id v8 = objc_msgSend(v5, "identifierStr", v12);
  uint64_t v9 = [v8 UTF8String];

  if (v9)
  {
    if (-[NSString UTF8String](self->_targetID, "UTF8String"))
    {
      uint64_t v10 = TextToHardwareAddressScalar();
      if (v10 == TextToHardwareAddressScalar())
      {
        int v11 = self->_ucat->var0;
        if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
        {
          CUDescriptionWithLevel();
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();
        }

        objc_storeStrong((id *)&self->_bonjourDevice, a3);
        -[CUCoalescer trigger](self->_bonjourCoalescer, "trigger");
      }
    }
  }
}

- (void)_handleDeviceLost:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v14 = v4;
  if (var0 <= 20)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v14, v6))
    {
      CUDescriptionWithLevel();
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      id v4 = v14;
    }
  }

  id v7 = objc_msgSend(v4, "identifierStr", v12);
  uint64_t v8 = [v7 UTF8String];

  if (v8)
  {
    if (-[NSString UTF8String](self->_targetID, "UTF8String"))
    {
      uint64_t v9 = TextToHardwareAddressScalar();
      if (v9 == TextToHardwareAddressScalar())
      {
        int v10 = self->_ucat->var0;
        if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
        {
          CUDescriptionWithLevel();
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();
        }

        bonjourDevice = self->_bonjourDevice;
        self->_bonjourDevice = 0LL;

        -[RPConnection setPresent:](self->_controlCnx, "setPresent:", 0LL);
      }
    }
  }
}

- (void)_handleDevicesCoalesced
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUDescriptionWithLevel();
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

  -[RPFileTransferSession _controlCnxStartIfNeeded](self, "_controlCnxStartIfNeeded");
}

- (void)_controlCnxRetryIfNeeded
{
  if (!self->_invalidateCalled && !self->_controlCnx && self->_bonjourDevice && !self->_controlRetryTimer)
  {
    int var0 = self->_ucat->var0;
    id v4 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    controlRetryTimer = self->_controlRetryTimer;
    self->_controlRetryTimer = v4;
    int v6 = v4;

    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __49__RPFileTransferSession__controlCnxRetryIfNeeded__block_invoke;
    v7[3] = &unk_18A031AE8;
    v7[4] = v6;
    v7[5] = self;
    dispatch_source_set_event_handler(v6, v7);
    CUDispatchTimerSet();
    dispatch_resume(v6);
  }

void __49__RPFileTransferSession__controlCnxRetryIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1 == *(void **)(*(void *)(a1 + 40) + 72LL))
  {
    if (v1)
    {
      uint64_t v3 = v1;
      dispatch_source_cancel(v3);
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = *(void **)(v4 + 72);
      *(void *)(v4 + 72) = 0LL;
    }

    id v6 = *(id *)(*(void *)(a1 + 40) + 40LL);
    id v7 = v6;
    int v8 = **(_DWORD **)(*(void *)(a1 + 40) + 152LL);
    id v12 = v6;
    if (v8 <= 30)
    {
      if (v8 != -1)
      {
        if (v6)
        {
LABEL_7:
          CUDescriptionWithLevel();
          int v11 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

          objc_msgSend(*(id *)(a1 + 40), "_controlCnxStartIfNeeded", v11);
          goto LABEL_11;
        }

- (void)_controlCnxStartIfNeeded
{
  p_controlCnx = &self->_controlCnx;
  if (!self->_controlCnx)
  {
    uint64_t v4 = self->_bonjourDevice;
    if (v4)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        int v15 = v4;
        LogPrintF();
      }

      controlRetryTimer = self->_controlRetryTimer;
      if (controlRetryTimer)
      {
        id v7 = controlRetryTimer;
        dispatch_source_cancel(v7);
        int v8 = self->_controlRetryTimer;
        self->_controlRetryTimer = 0LL;
      }

      int v9 = objc_alloc_init(&OBJC_CLASS___RPConnection);
      objc_storeStrong((id *)p_controlCnx, v9);
      if (self->_prefCompress) {
        -[RPConnection setAppInfoSelf:](v9, "setAppInfoSelf:", &unk_18A04E158);
      }
      -[RPConnection setBonjourPeerDevice:](v9, "setBonjourPeerDevice:", v4, v15);
      -[RPConnection setControlFlags:]( v9,  "setControlFlags:",  -[RPConnection controlFlags](v9, "controlFlags") | 0x60000200);
      -[RPConnection setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
      -[RPConnection setForcedPeerIdentity:](v9, "setForcedPeerIdentity:", self->_peerIdentity);
      -[RPConnection setForcedSelfIdentity:](v9, "setForcedSelfIdentity:", self->_selfIdentity);
      -[RPConnection setKeepAliveSeconds:](v9, "setKeepAliveSeconds:", 30LL);
      id v10 = objc_alloc(NSString);
      targetID = self->_targetID;
      uint64_t v12 = self->_cnxIDLast + 1;
      self->_cnxIDLast = v12;
      id v13 = (void *)[v10 initWithFormat:@"RPFileCnx-%@-Out-%u", targetID, v12];
      -[RPConnection setLabel:](v9, "setLabel:", v13);

      -[RPConnection setPeerIdentifier:](v9, "setPeerIdentifier:", self->_targetID);
      -[RPConnection setPresent:](v9, "setPresent:", 1LL);
      uint64_t v14 = MEMORY[0x1895F87A8];
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke;
      v19[3] = &unk_18A031AE8;
      v19[4] = v9;
      v19[5] = self;
      -[RPConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v19);
      v18[0] = v14;
      v18[1] = 3221225472LL;
      v18[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_2;
      v18[3] = &unk_18A0331B8;
      v18[4] = v9;
      v18[5] = self;
      -[RPConnection setReceivedEventHandler:](v9, "setReceivedEventHandler:", v18);
      v17[0] = v14;
      v17[1] = 3221225472LL;
      v17[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_3;
      v17[3] = &unk_18A0331E0;
      v17[4] = v9;
      v17[5] = self;
      -[RPConnection setReceivedRequestHandler:](v9, "setReceivedRequestHandler:", v17);
      v16[0] = v14;
      v16[1] = 3221225472LL;
      v16[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_4;
      v16[3] = &unk_18A033208;
      v16[4] = v9;
      v16[5] = self;
      -[RPConnection setStateChangedHandler:](v9, "setStateChangedHandler:", v16);
      -[RPConnection activate](v9, "activate");
    }
  }

uint64_t __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v1 == *(void **)(v2 + 64))
  {
    uint64_t v3 = result;
    *(void *)(v2 + 64) = 0LL;

    [*(id *)(v3 + 40) _reportProgressControlState];
    return [*(id *)(v3 + 40) _controlCnxRetryIfNeeded];
  }

  return result;
}

void *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v5 == result[8]) {
    return (void *)[result _receivedEventID:a2 event:a3 options:a4];
  }
  return result;
}

void *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[8]) {
    return (void *)[result _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
  }
  return result;
}

void *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v4 == result[8])
  {
    uint64_t result = (void *)[result _reportProgressControlState];
    if (a2 == 1) {
      return (void *)[*(id *)(a1 + 40) _scheduleItems];
    }
  }

  return result;
}

- (BOOL)_activateTargetAndReturnError:(id *)a3
{
  v25[1] = *MEMORY[0x1895F89C0];
  -[RPFileTransferSession _updateWiFi](self, "_updateWiFi");
  if ((-[RPFileTransferSession flags](self, "flags") & 0x200) != 0)
  {
    uint64_t v5 = -[RPFileTransferResumeState initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___RPFileTransferResumeState),  "initWithDispatchQueue:",  self->_dispatchQueue);
    if (v5)
    {
      if (self->_receiveFileParentPath)
      {
        -[RPFileTransferSession targetID](self, "targetID");
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          id v7 = (void *)NSString;
          -[RPFileTransferSession targetID](self, "targetID");
          int v8 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 stringWithFormat:@"%@-state.rptfd", v8];
          int v9 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSString stringByStandardizingPath](self->_receiveFileParentPath, "stringByStandardizingPath");
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RPFileTransferResumeState setOutputPath:](v5, "setOutputPath:", v10);

          -[NSString stringByAppendingPathComponent:]( self->_receiveFileParentPath,  "stringByAppendingPathComponent:",  v9);
          int v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 stringByStandardizingPath];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[RPFileTransferResumeState setStateFilePath:](v5, "setStateFilePath:", v12);

          -[RPFileTransferResumeState setUcat:](v5, "setUcat:", self->_ucat);
          -[RPFileTransferResumeState setFlushInterval:](v5, "setFlushInterval:", self->_resumeStateFlushInterval);
          -[RPFileTransferResumeState loadStateFile](v5, "loadStateFile");
          if (!-[RPFileTransferResumeState isEmpty](v5, "isEmpty"))
          {
            -[RPFileTransferSession targetID](self, "targetID");
            id v21 = (void *)objc_claimAutoreleasedReturnValue();
            FPrintF();
          }

          resumeState = self->_resumeState;
          self->_resumeState = v5;

          goto LABEL_8;
        }

        if (a3) {
          goto LABEL_21;
        }
LABEL_22:

        return 0;
      }

      if (!a3) {
        goto LABEL_22;
      }
    }

    else if (!a3)
    {
      goto LABEL_22;
    }

uint64_t __55__RPFileTransferSession__activateTargetAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setKeepAliveSeconds:30];
}

void *__55__RPFileTransferSession__activateTargetAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[18]) {
    return (void *)[result _handleIncomingConnectionStarted:a2];
  }
  return result;
}

- (void)_handleIncomingConnectionStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  uint64_t v6 = v5;
  if (self->_prefCompress) {
    -[RPConnection setAppInfoSelf:](v5, "setAppInfoSelf:", &unk_18A04E180);
  }
  -[RPConnection setControlFlags:]( v6,  "setControlFlags:",  -[RPConnection controlFlags](v6, "controlFlags") | 0x60000000);
  -[RPConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[RPConnection setForcedPeerIdentity:](v6, "setForcedPeerIdentity:", self->_peerIdentity);
  -[RPConnection setForcedSelfIdentity:](v6, "setForcedSelfIdentity:", self->_selfIdentity);
  id v7 = objc_alloc(NSString);
  targetID = self->_targetID;
  uint64_t v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  id v10 = (void *)[v7 initWithFormat:@"RPFileCnx-%@-In-%u", targetID, v9];
  -[RPConnection setLabel:](v6, "setLabel:", v10);

  -[RPConnection setTcpConnection:](v6, "setTcpConnection:", v4);
  -[RPConnection label](v6, "label");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setLabel:v11];

  uint64_t v12 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke;
  v21[3] = &unk_18A031AE8;
  v21[4] = self;
  v21[5] = v6;
  -[RPConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v21);
  v20[0] = v12;
  v20[1] = 3221225472LL;
  void v20[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_2;
  v20[3] = &unk_18A033298;
  v20[4] = self;
  -[RPConnection setReceivedEventHandler:](v6, "setReceivedEventHandler:", v20);
  v19[0] = v12;
  v19[1] = 3221225472LL;
  v19[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_3;
  v19[3] = &unk_18A0332C0;
  v19[4] = self;
  -[RPConnection setReceivedRequestHandler:](v6, "setReceivedRequestHandler:", v19);
  v18[0] = v12;
  v18[1] = 3221225472LL;
  v18[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_4;
  v18[3] = &unk_18A033118;
  v18[4] = self;
  -[RPConnection setStateChangedHandler:](v6, "setStateChangedHandler:", v18);
  if (!self->_controlCnx)
  {
    objc_storeStrong((id *)&self->_controlCnx, v6);
    -[RPFileTransferSession _reportProgressControlState](self, "_reportProgressControlState");
  }

  connections = self->_connections;
  if (!connections)
  {
    id v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    int v15 = self->_connections;
    self->_connections = v14;

    connections = self->_connections;
  }

  -[NSMutableSet addObject:](connections, "addObject:", v6);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    BOOL v17 = v6;
    LogPrintF();
  }

  -[RPConnection activate](v6, "activate", v17);
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleIncomingConnectionEnded:*(void *)(a1 + 40)];
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedEventID:a2 event:a3 options:a4];
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t result = [*(id *)(a1 + 32) _reportProgressControlState];
  if (a2 == 1) {
    return [*(id *)(a1 + 32) _scheduleItems];
  }
  return result;
}

- (void)_handleIncomingConnectionEnded:(id)a3
{
  id v4 = (RPConnection *)a3;
  int var0 = self->_ucat->var0;
  id v10 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v10, v6))
    {
      uint64_t v9 = v4;
      LogPrintF();
      id v4 = v10;
    }
  }

  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v4, v9);
  if (self->_controlCnx == v10)
  {
    self->_controlCnx = 0LL;
  }

  -[RPFileTransferSession _reportProgressControlState](self, "_reportProgressControlState");
  if (!self->_controlCnx && !self->_invalidateCalled)
  {
    -[NSMutableSet anyObject](self->_connections, "anyObject");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      int v8 = self->_ucat->var0;
      objc_storeStrong((id *)&self->_controlCnx, v7);
      -[RPFileTransferSession _reportProgressControlState](self, "_reportProgressControlState");
    }
  }
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = __Block_byref_object_copy__2;
  v13[4] = __Block_byref_object_dispose__2;
  id v14 = 0LL;
  id obj = 0LL;
  BOOL v5 = -[RPFileTransferSession _prepareItem:error:](self, "_prepareItem:error:", v4, &obj);
  objc_storeStrong(&v14, obj);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__RPFileTransferSession_addItem___block_invoke;
  block[3] = &unk_18A0332E8;
  BOOL v11 = v5;
  id v9 = v4;
  id v10 = v13;
  block[4] = self;
  id v7 = v4;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(v13, 8);
}

void __33__RPFileTransferSession_addItem___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56) && (uint64_t v2 = *(void *)(a1 + 32), !*(_BYTE *)(v2 + 89)))
  {
    int v7 = **(_DWORD **)(v2 + 152);
    if (v7 <= 9)
    {
      if (v7 != -1 || (int v12 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v12))
      {
        uint64_t v8 = [*(id *)(a1 + 40) fileID];
        uint64_t v9 = [*(id *)(a1 + 40) fileSize];
        uint64_t v10 = [*(id *)(a1 + 40) metadataSize];
        [*(id *)(a1 + 40) itemURL];
        uint64_t v19 = v10;
        int v20 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v17 = (void *)v8;
        uint64_t v18 = v9;
        LogPrintF();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }

    id v13 = *(void **)(v2 + 168);
    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x189603FE0]);
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = *(void **)(v15 + 168);
      *(void *)(v15 + 168) = v14;

      id v13 = *(void **)(*(void *)(a1 + 32) + 168LL);
    }

    objc_msgSend(v13, "addObject:", *(void *)(a1 + 40), v17, v18, v19, v20);
    objc_msgSend(*(id *)(a1 + 32), "_metricAddFileSize:", objc_msgSend(*(id *)(a1 + 40), "fileSize"));
    [*(id *)(a1 + 32) _scheduleItems];
  }

  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
    {
      uint64_t v3 = RPErrorF();
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
      BOOL v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }

    int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 152LL);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(a1 + 40) itemURL];
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      LogPrintF();
    }

    objc_msgSend(*(id *)(a1 + 40), "completionHandler", v17, v18);
    BOOL v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      id v21 = v11;
      v11[2](v11, *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
      [*(id *)(a1 + 40) setCompletionHandler:0];
      BOOL v11 = (void (**)(void, void))v21;
    }
  }

- (void)addItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = (id)[a3 copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        id v16 = 0LL;
        BOOL v10 = -[RPFileTransferSession _prepareItem:error:](self, "_prepareItem:error:", v9, &v16);
        id v11 = v16;
        if (!v10) {
          [v9 setError:v11];
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__RPFileTransferSession_addItems___block_invoke;
  block[3] = &unk_18A031AE8;
  block[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(dispatchQueue, block);
}

void __34__RPFileTransferSession_addItems___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 89))
  {
    if (!*(void *)(v2 + 168))
    {
      id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 168);
      *(void *)(v14 + 168) = v13;
    }

    uint64_t v40 = [*(id *)(a1 + 40) count];
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (!v17)
    {
LABEL_44:

      [*(id *)(a1 + 32) _scheduleItems];
      return;
    }

    uint64_t v18 = v17;
    __int128 v19 = 0LL;
    uint64_t v20 = *(void *)v44;
    id v39 = v16;
    uint64_t v42 = *(void *)v44;
LABEL_22:
    uint64_t v21 = 0LL;
    while (1)
    {
      if (*(void *)v44 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v22 = *(void **)(*((void *)&v43 + 1) + 8 * v21);
      [v22 error];
      id v23 = (char *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        int v24 = **(_DWORD **)(*(void *)(a1 + 32) + 152LL);
        if (v24 <= 90 && (v24 != -1 || _LogCategory_Initialize()))
        {
          [v22 itemURL];
          double v33 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v34 = v23;
          LogPrintF();

          uint64_t v20 = v42;
        }

        objc_msgSend(v22, "completionHandler", v33, v34);
        __int128 v30 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          [v22 setCompletionHandler:0];
          ((void (**)(void, char *))v30)[2](v30, v23);
        }

        goto LABEL_39;
      }

      ++v19;
      uint64_t v25 = *(void *)(a1 + 32);
      int v26 = **(_DWORD **)(v25 + 152);
      if (v26 <= 9)
      {
        if (v26 == -1)
        {
          int v31 = _LogCategory_Initialize();
          uint64_t v25 = *(void *)(a1 + 32);
          if (!v31) {
            goto LABEL_38;
          }
          double v41 = v19;
        }

        else
        {
          double v41 = v19;
        }

        uint64_t v27 = [v22 fileID];
        uint64_t v28 = [v22 fileSize];
        uint64_t v29 = [v22 metadataSize];
        [v22 itemURL];
        uint64_t v37 = v29;
        double v38 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = v40;
        uint64_t v36 = v28;
        __int128 v19 = v41;
        double v33 = (void *)v27;
        uint64_t v34 = v41;
        LogPrintF();

        uint64_t v25 = *(void *)(a1 + 32);
        id v16 = v39;
        uint64_t v20 = v42;
      }

- (BOOL)_prepareItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 setCompleted:0];
  [v6 setError:0];
  p_fileIDLastSend = &self->_fileIDLastSend;
  do
    unint64_t v8 = __ldaxr(p_fileIDLastSend);
  while (__stlxr(v8 + 1, p_fileIDLastSend));
  [v6 setFileID:v8 + 1];
  id v9 = [v6 itemURL];
  int v10 = (const char *)[v9 fileSystemRepresentation];
  if (!v10)
  {
    if (a4) {
      goto LABEL_18;
    }
    goto LABEL_23;
  }

  if (stat(v10, &v20) && (!*__error() || *__error()))
  {
    if (a4)
    {
LABEL_18:
      RPErrorF();
      BOOL v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }

- (void)_scheduleItems
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!self->_invalidateCalled && -[RPConnection state](self->_controlCnx, "state") == 1)
  {
    if (!-[RPFileTransferSession isResumable](self, "isResumable")
      || (-[RPFileTransferSession flags](self, "flags") & 1) != 0)
    {
      goto LABEL_7;
    }

    -[RPFileTransferSession resumeState](self, "resumeState");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[RPFileTransferSession _requestResumeStateFromReceiver](self, "_requestResumeStateFromReceiver");
      return;
    }

    id v4 = v3;
    char v5 = [v3 isPlaceholder];

    if ((v5 & 1) == 0)
    {
LABEL_7:
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id v6 = self->_smallFilesSendTasks;
      uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v40,  v45,  16LL);
      uint64_t v8 = MEMORY[0x1895F87A8];
      if (v7)
      {
        uint64_t v9 = v7;
        uint64_t v10 = *(void *)v41;
        do
        {
          uint64_t v11 = 0LL;
          do
          {
            if (*(void *)v41 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
            if ([v12 needsRetry])
            {
              [v12 setNeedsRetry:0];
              ++self->_metricRetries;
              int var0 = self->_ucat->var0;
              if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v31 = [v12 taskID];
                LogPrintF();
              }

              objc_msgSend(v12, "queue", v31);
              unint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
              block[0] = v8;
              block[1] = 3221225472LL;
              block[2] = __39__RPFileTransferSession__scheduleItems__block_invoke;
              block[3] = &unk_18A031AE8;
              block[4] = self;
              void block[5] = v12;
              dispatch_async(v14, block);
            }

            ++v11;
          }

          while (v9 != v11);
          uint64_t v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v40,  v45,  16LL);
          uint64_t v9 = v15;
        }

        while (v15);
      }

      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      unint64_t v16 = self->_largeFileSendTasks;
      uint64_t v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v35,  v44,  16LL);
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        do
        {
          uint64_t v20 = 0LL;
          do
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v35 + 1) + 8 * v20);
            if ([v21 needsRetry])
            {
              [v21 setNeedsRetry:0];
              ++self->_metricRetries;
              int v22 = self->_ucat->var0;
              if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v31 = [v21 taskID];
                LogPrintF();
              }

              objc_msgSend(v21, "queue", v31);
              id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
              v34[0] = v8;
              v34[1] = 3221225472LL;
              v34[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_2;
              v34[3] = &unk_18A031AE8;
              v34[4] = self;
              v34[5] = v21;
              dispatch_async(v23, v34);
            }

            ++v20;
          }

          while (v18 != v20);
          uint64_t v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v35,  v44,  16LL);
          uint64_t v18 = v24;
        }

        while (v24);
      }

      while (-[NSMutableSet count](self->_smallFilesSendTasks, "count") < self->_maxSmallFileTasks)
      {
        uint64_t v25 = -[RPFileTransferSession _smallFilesSendTaskCreate](self, "_smallFilesSendTaskCreate");
        if (!v25) {
          break;
        }
        int v26 = (void *)v25;
        -[NSMutableSet addObject:](self->_smallFilesSendTasks, "addObject:", v25);
        [v26 queue];
        uint64_t v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v33[0] = v8;
        v33[1] = 3221225472LL;
        v33[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_3;
        v33[3] = &unk_18A031AE8;
        v33[4] = self;
        v33[5] = v26;
        dispatch_async(v27, v33);
      }

      while (-[NSMutableSet count](self->_largeFileSendTasks, "count") < self->_maxLargeFileTasks)
      {
        uint64_t v28 = -[RPFileTransferSession _largeFileSendTaskCreate](self, "_largeFileSendTaskCreate");
        if (!v28) {
          break;
        }
        uint64_t v29 = (void *)v28;
        -[NSMutableSet addObject:](self->_largeFileSendTasks, "addObject:", v28);
        [v29 queue];
        __int128 v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v32[0] = v8;
        v32[1] = 3221225472LL;
        v32[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_4;
        v32[3] = &unk_18A031AE8;
        v32[4] = self;
        v32[5] = v29;
        dispatch_async(v30, v32);
      }
    }
  }

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesSendTaskRun:*(void *)(a1 + 40)];
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskStart:*(void *)(a1 + 40)];
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesSendTaskRun:*(void *)(a1 + 40)];
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskStart:*(void *)(a1 + 40)];
}

- (void)_requestResumeStateFromReceiver
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___RPFileTransferResumeState);
  -[RPFileTransferResumeState setIsPlaceholder:](v3, "setIsPlaceholder:", 1LL);
  -[RPFileTransferResumeState setUcat:](v3, "setUcat:", self->_ucat);
  resumeState = self->_resumeState;
  self->_resumeState = v3;
  char v5 = v3;

  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[RPFileTransferSession targetID](self, "targetID");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v7 forKey:@"_i"];

  controlCnx = self->_controlCnx;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __56__RPFileTransferSession__requestResumeStateFromReceiver__block_invoke;
  v9[3] = &unk_18A0329B0;
  v9[4] = self;
  -[RPConnection sendEncryptedRequestID:request:xpcID:options:responseHandler:]( controlCnx,  "sendEncryptedRequestID:request:xpcID:options:responseHandler:",  @"_ftRs",  v6,  0LL,  0LL,  v9);
}

void __56__RPFileTransferSession__requestResumeStateFromReceiver__block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 code];
    int v12 = **(_DWORD **)(*(void *)(a1 + 32) + 152LL);
    if (v11 == -6714)
    {
    }

    else if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = v10;
LABEL_15:
      LogPrintF();
    }
  }

  else if (v7)
  {
    [v7 objectForKeyedSubscript:@"resumeState"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      id v18 = 0LL;
      unint64_t v14 = -[RPFileTransferResumeState initWithDictionaryRepresentation:error:]( objc_alloc(&OBJC_CLASS___RPFileTransferResumeState),  "initWithDictionaryRepresentation:error:",  v13,  &v18);
      id v15 = v18;
      if (v14)
      {
        if (!-[RPFileTransferResumeState isEmpty](v14, "isEmpty"))
        {
          [*(id *)(a1 + 32) targetID];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          FPrintF();
        }

        -[RPFileTransferResumeState removeUnusableSourceFileItems](v14, "removeUnusableSourceFileItems", v17);
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 264LL), v14);
      }

      else
      {
        int v16 = **(_DWORD **)(*(void *)(a1 + 32) + 152LL);
        if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v17 = v15;
          LogPrintF();
        }
      }
    }
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "setIsPlaceholder:", 0, v17);
  [*(id *)(a1 + 32) _scheduleItems];
}

- (void)_completeItem:(id)a3 error:(id)a4
{
}

- (void)_completeItemDirect:(id)a3 error:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  [v15 completionHandler];
  id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [v15 setCompletionHandler:0];
    int var0 = self->_ucat->var0;
    if (v6)
    {
      [v15 itemURL];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v9;
      id v14 = v6;
    }

    else
    {
      [v15 itemURL];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v9;
    }

    LogPrintF();

LABEL_13:
    ((void (**)(void, id))v7)[2](v7, v6);
  }

  if ((objc_msgSend(v15, "completed", v13, v14) & 1) == 0)
  {
    [v15 setCompleted:1];
    self->_unint64_t metricLastFileCompletionTicks = mach_absolute_time();
    if (!v6)
    {
      uint64_t v10 = [v15 fileSize];
      uint64_t v11 = [v15 metadataSize];
      int64x2_t v12 = vdupq_n_s64(1uLL);
      v12.i64[0] = v11 + v10;
      *(int64x2_t *)&self->_metricTotalBytes = vaddq_s64(v12, *(int64x2_t *)&self->_metricTotalBytes);
    }
  }
}

- (void)_processReceivedItem:(id)a3 responseHandler:(id)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))MEMORY[0x1895A4770](self->_receivedItemHandler);
  if (v8)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke;
    v14[3] = &unk_18A032290;
    v14[4] = self;
    id v15 = v7;
    ((void (**)(void, id, void *))v8)[2](v8, v6, v14);
  }

  else
  {
    id v9 = (void (**)(void, void, void))MEMORY[0x1895A4770](self->_receivedItemsHandler);
    if (v9)
    {
      v16[0] = v6;
      [MEMORY[0x189603F18] arrayWithObjects:v16 count:1];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_3;
      v12[3] = &unk_18A032290;
      v12[4] = self;
      id v13 = v7;
      ((void (**)(void, void *, void *))v9)[2](v9, v10, v12);
    }

    else
    {
      RPErrorF();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v11);
    }
  }
}

void __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  char v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 584LL);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_2;
  v7[3] = &unk_18A032390;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = 0LL;
  }
  else {
    uint64_t v1 = MEMORY[0x189604A60];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v1,  0LL);
}

void __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  char v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 584LL);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_4;
  v7[3] = &unk_18A032390;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = 0LL;
  }
  else {
    uint64_t v1 = MEMORY[0x189604A60];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v1,  0LL);
}

- (void)_processReceivedItems:(id)a3 responseHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))MEMORY[0x1895A4770](self->_receivedItemsHandler);
  if (v8)
  {
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke;
    v29[3] = &unk_18A032290;
    v29[4] = self;
    id v30 = v7;
    ((void (**)(void, id, void *))v8)[2](v8, v6, v29);
  }

  else
  {
    id v9 = (void (**)(void, void, void))MEMORY[0x1895A4770](self->_receivedItemHandler);
    if (v9)
    {
      v27[0] = 0LL;
      v27[1] = v27;
      v27[2] = 0x3032000000LL;
      v27[3] = __Block_byref_object_copy__2;
      v27[4] = __Block_byref_object_dispose__2;
      id v28 = 0LL;
      uint64_t v10 = dispatch_group_create();
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id obj = v6;
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v24;
        uint64_t v13 = MEMORY[0x1895F87A8];
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            dispatch_group_enter(v10);
            v22[0] = v13;
            v22[1] = 3221225472LL;
            v22[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_3;
            v22[3] = &unk_18A033310;
            v22[4] = v10;
            v22[5] = v27;
            ((void (**)(void, uint64_t, void *))v9)[2](v9, v15, v22);
          }

          uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
        }

        while (v11);
      }

      id v8 = 0LL;
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_4;
      block[3] = &unk_18A033338;
      id v20 = v7;
      uint64_t v21 = v27;
      dispatch_group_notify(v10, dispatchQueue, block);

      _Block_object_dispose(v27, 8);
    }

    else
    {
      RPErrorF();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v17);
    }
  }
}

void __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  char v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 584LL);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_2;
  v7[3] = &unk_18A032390;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = 0LL;
  }
  else {
    uint64_t v1 = MEMORY[0x189604A60];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v1,  0LL);
}

void __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_3( uint64_t a1,  void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v6 = *(void *)(v4 + 40);
    char v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    uint64_t v1 = 0LL;
  }
  else {
    uint64_t v1 = MEMORY[0x189604A60];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v1,  0LL);
}

- (void)finish
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__RPFileTransferSession_finish__block_invoke;
  block[3] = &unk_18A031A30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__RPFileTransferSession_finish__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 152);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  *(_BYTE *)(v2 + 88) = 1;
  [*(id *)(a1 + 32) _processFinish];
  if ([*(id *)(a1 + 32) isResumable])
  {
    if ([*(id *)(a1 + 32) flags])
    {
      [*(id *)(a1 + 32) resumeState];
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [v5 flushStateFile];
    }
  }

- (void)_processFinish
{
  if (self->_finishPending
    && !-[NSMutableSet count](self->_addedItems, "count")
    && !-[NSMutableDictionary count](self->_smallFilesReceiveTasks, "count")
    && !-[NSMutableSet count](self->_smallFilesSendTasks, "count")
    && !-[NSMutableDictionary count](self->_largeFileReceiveTasks, "count")
    && !-[NSMutableSet count](self->_largeFileSendTasks, "count"))
  {
    -[RPFileTransferSession _reportCompletion:](self, "_reportCompletion:", 0LL);
  }

- (id)_smallFilesSendTaskCreate
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  unint64_t prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  int v4 = (void *)-[NSMutableSet copy](self->_addedItems, "copy");
  id v5 = (RPFileTransferSmallFilesTask *)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = 0LL;
    uint64_t v7 = *(void *)v17;
    unint64_t v15 = prefSmallFilesMaxBytes;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (RPFileTransferSmallFilesTask *)((char *)i + 1))
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        unint64_t v10 = [v9 estimatedSize];
        unint64_t v11 = prefSmallFilesMaxBytes - v10;
        if (prefSmallFilesMaxBytes >= v10)
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
          }
          [v6 addObject:v9];
          -[NSMutableSet removeObject:](self->_addedItems, "removeObject:", v9);
          unint64_t prefSmallFilesMaxBytes = v11;
        }
      }

      id v5 = (RPFileTransferSmallFilesTask *)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v5);

    if (!v6)
    {
      id v5 = 0LL;
      return v5;
    }

    if (prefSmallFilesMaxBytes > v15 >> 1) {
      ++self->_metricPrematureSmallSets;
    }
    id v5 = objc_alloc_init(&OBJC_CLASS___RPFileTransferSmallFilesTask);
    -[RPFileTransferSmallFilesTask setFileItems:](v5, "setFileItems:", v6);
    -[RPFileTransferSession _ioQueueDequeue](self, "_ioQueueDequeue");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSmallFilesTask setQueue:](v5, "setQueue:", v12);

    ++self->_taskIDLast;
    -[RPFileTransferSmallFilesTask setTaskID:](v5, "setTaskID:");
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      -[RPFileTransferSmallFilesTask taskID](v5, "taskID");
      [v6 count];
      LogPrintF();
    }
  }

  else
  {
    id v6 = v4;
  }

  return v5;
}

- (void)_smallFilesSendTaskRun:(id)a3
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v50 = v4;
  [v4 fileItems];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v64;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (-[RPFileTransferSession isResumable](self, "isResumable", v48))
        {
          -[RPFileTransferSession resumeState](self, "resumeState");
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 filename];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 finishedFileWithFileName:v13];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            [v14 fileName];
            __int128 v48 = (void *)objc_claimAutoreleasedReturnValue();
            FPrintF();

            goto LABEL_13;
          }
        }

        id v62 = 0LL;
        -[RPFileTransferSession _smallFilesSendTaskReadItem:error:]( self,  "_smallFilesSendTaskReadItem:error:",  v11,  &v62);
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v15 = v62;
        uint64_t v12 = v15;
        if (v14)
        {
          [v5 addObject:v14];
        }

        else
        {
          dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke;
          block[3] = &unk_18A032A28;
          void block[4] = self;
          void block[5] = v11;
          id v61 = v15;
          dispatch_async(dispatchQueue, block);
        }

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeItem:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesSendTaskEnd:*(void *)(a1 + 40) error:0];
}

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "fileSize", (void)v10) < 1) {
          uint64_t v8 = 0LL;
        }
        else {
          uint64_t v8 = [v7 fileSize];
        }
        *(void *)(*(void *)(a1 + 40) + 312LL) += v8;
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  uint64_t result = [*(id *)(a1 + 32) count];
  *(void *)(*(void *)(a1 + 40) + 328LL) += result;
  return result;
}

void __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_350(void *a1)
{
  id v2 = *(id *)(a1[4] + 64LL);
  if ([v2 state] == 1)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2_353;
    v9[3] = &unk_18A033360;
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[4];
    uint64_t v5 = (void *)a1[5];
    v9[4] = a1[7];
    void v9[5] = v4;
    id v10 = v5;
    [v2 sendEncryptedRequestID:@"_ftSm" request:v3 xpcID:0 options:0 responseHandler:v9];
  }

  else
  {
    uint64_t v7 = (void *)a1[4];
    uint64_t v6 = a1[5];
    RPErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 _smallFilesSendTaskEnd:v6 error:v8];
  }

void __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2_353( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "fileSize", (void)v13) < 1) {
          uint64_t v12 = 0LL;
        }
        else {
          uint64_t v12 = [v11 fileSize];
        }
        *(void *)(*(void *)(a1 + 40) + 304LL) += v12;
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  *(void *)(*(void *)(a1 + 40) + 320) += [*(id *)(a1 + 32) count];
  *(_BYTE *)(*(void *)(a1 + 40) + 336LL) = 1;
  [*(id *)(a1 + 40) _smallFilesSendTaskEnd:*(void *)(a1 + 48) error:v5];
}

- (id)_smallFilesSendTaskReadItem:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = [v6 itemURL];
  uint64_t v8 = [v7 fileSystemRepresentation];

  if (v8)
  {
    -[RPFileTransferSession _readPath:size:error:](self, "_readPath:size:error:", v8, [v6 fileSize], a4);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
      CC_SHA256((const void *)[v11 bytes], objc_msgSend(v11, "length"), md);
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:md length:32];
      [v6 setSha256HashData:v12];
      id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v13 setObject:v11 forKeyedSubscript:&unk_18A04DF90];
      [v13 setObject:v12 forKeyedSubscript:@"_s2"];
      [v6 filename];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14) {
        [v13 setObject:v14 forKeyedSubscript:&unk_18A04DFA8];
      }

      uint64_t v15 = [v6 fileSize];
      if (v15)
      {
        [MEMORY[0x189607968] numberWithLongLong:v15];
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 setObject:v16 forKeyedSubscript:&unk_18A04DFC0];
      }

      [v6 metadata];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17) {
        [v13 setObject:v17 forKeyedSubscript:&unk_18A04DFD8];
      }

      id v23 = 0LL;
      -[RPFileTransferSession _modTimeForFileWithPath:error:](self, "_modTimeForFileWithPath:error:", v8, &v23);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = v23;
      unint64_t v20 = v19;
      if (v18)
      {
        [v13 addEntriesFromDictionary:v18];
        id v21 = v13;
      }

      else
      {
        id v21 = 0LL;
        if (a4) {
          *a4 = v19;
        }
      }
    }

    else
    {
      id v21 = 0LL;
    }
  }

  else if (a4)
  {
    RPErrorF();
    id v21 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v21 = 0LL;
  }

  return v21;
}

- (void)_smallFilesSendTaskEnd:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_smallFilesSendTasks, "containsObject:", v6) & 1) != 0)
  {
    if (!self->_invalidateCalled && [v7 code] == -71143)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v17 = [v6 taskID];
        id v18 = v7;
        LogPrintF();
      }

      objc_msgSend(v6, "setNeedsRetry:", 1, v17, v18);
      goto LABEL_31;
    }

    int v10 = self->_ucat->var0;
    if (v7)
    {
      uint64_t v17 = [v6 taskID];
      id v18 = v7;
    }

    else
    {
      uint64_t v17 = [v6 taskID];
    }

    LogPrintF();
LABEL_23:
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    objc_msgSend(v6, "fileItems", v17, v18, 0);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          -[RPFileTransferSession _completeItemDirect:error:]( self,  "_completeItemDirect:error:",  *(void *)(*((void *)&v19 + 1) + 8 * i),  v7);
        }

        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v13);
    }

    -[NSMutableSet removeObject:](self->_smallFilesSendTasks, "removeObject:", v6);
    -[RPFileTransferSession _processFinish](self, "_processFinish");
    [v6 queue];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _ioQueueEnqueue:](self, "_ioQueueEnqueue:", v16);

    -[RPFileTransferSession _scheduleItems](self, "_scheduleItems");
    goto LABEL_31;
  }

  int v9 = self->_ucat->var0;
  if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
  {
    [v6 taskID];
    LogPrintF();
  }

- (void)_smallFilesReceiveRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  __int128 v41 = v5;
  NSDictionaryGetNSNumber();
  unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v40 unsignedLongLongValue];
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x3032000000LL;
  v60 = __Block_byref_object_copy__2;
  id v61 = __Block_byref_object_dispose__2;
  id v62 = 0LL;
  v53[0] = MEMORY[0x1895F87A8];
  v53[1] = 3221225472LL;
  v53[2] = __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke;
  v53[3] = &unk_18A0333B0;
  id v55 = &v57;
  uint64_t v56 = v7;
  v53[4] = self;
  uint64_t v36 = v7;
  id v37 = v6;
  id v54 = v37;
  uint64_t v35 = (void (**)(void))MEMORY[0x1895A4770](v53);
  if (self->_fileWritesOutstanding >= 0x32)
  {
    uint64_t v31 = RPErrorF();
    id v39 = (void *)v58[5];
    void v58[5] = v31;

    goto LABEL_37;
  }

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      uint64_t v33 = RPErrorF();
      id v34 = (void *)v58[5];
      void v58[5] = v33;

      goto LABEL_36;
    }

    goto LABEL_9;
  }

  uint64_t Int64 = CFDictionaryGetInt64();
  if (v52 || !Int64)
  {
    uint64_t v32 = RPErrorF();
    int v10 = (void *)v58[5];
    void v58[5] = v32;
    goto LABEL_40;
  }

  int v9 = (id *)(v58 + 5);
  id obj = (id)v58[5];
  -[RPFileTransferSession _decompressAndDecodeData:originalSize:error:]( self,  "_decompressAndDecodeData:originalSize:error:",  v38,  Int64,  &obj);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, obj);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = RPErrorF();
      uint64_t v12 = (void *)v58[5];
      void v58[5] = v11;

LABEL_40:
      goto LABEL_36;
    }

uint64_t __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 152LL);
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16LL))();
  }

  return result;
}

uint64_t __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesReceiveTaskRun:*(void *)(a1 + 40) responseHandler:*(void *)(a1 + 48)];
}

- (void)_smallFilesReceiveTaskRun:(id)a3 responseHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  [v6 fileItems];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v27;
LABEL_3:
    uint64_t v13 = 0LL;
    uint64_t v14 = v11;
    while (1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
      id v25 = v14;
      BOOL v16 = -[RPFileTransferSession _smallFilesReceiveTaskFileItem:error:]( self,  "_smallFilesReceiveTaskFileItem:error:",  v15,  &v25);
      id v11 = v25;

      if (!v16) {
        break;
      }
      ++v13;
      uint64_t v14 = v11;
      if (v10 == v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    id v11 = 0LL;
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__RPFileTransferSession__smallFilesReceiveTaskRun_responseHandler___block_invoke;
  block[3] = &unk_18A0324F8;
  void block[4] = self;
  id v22 = v6;
  id v23 = v11;
  id v24 = v7;
  id v18 = v7;
  id v19 = v11;
  id v20 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __67__RPFileTransferSession__smallFilesReceiveTaskRun_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesReceiveTaskComplete:*(void *)(a1 + 40) error:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
}

- (BOOL)_smallFilesReceiveTaskFileItem:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 sha256HashData];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 length] == 32)
  {
    [v6 fileData];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setFileData:0];
    id v9 = v8;
    CC_SHA256((const void *)[v9 bytes], objc_msgSend(v9, "length"), md);
    uint64_t v10 = (void *)[v7 bytes];
    if (*(void *)md == *v10 && v23 == v10[1] && v24 == v10[2] && v25 == v10[3])
    {
      uint64_t v14 = -[RPFileTransferSession _openWriteFileItem:size:error:]( self,  "_openWriteFileItem:size:error:",  v6,  [v9 length],  a4);
      uint64_t v15 = v14;
      if ((v14 & 0x80000000) == 0)
      {
        v20[0] = MEMORY[0x1895F87A8];
        v20[1] = 3221225472LL;
        void v20[2] = __62__RPFileTransferSession__smallFilesReceiveTaskFileItem_error___block_invoke;
        v20[3] = &__block_descriptor_36_e5_v8__0l;
        int v21 = v14;
        BOOL v16 = (void (**)(void))MEMORY[0x1895A4770](v20);
        BOOL v18 = 1;
        if ([v9 length])
        {
          id v17 = v9;
          if (!-[RPFileTransferSession _writeFD:buffer:size:error:]( self,  "_writeFD:buffer:size:error:",  v15,  [v17 bytes],  objc_msgSend(v17, "length"),  a4)) {
            BOOL v18 = 0;
          }
        }

        v16[2](v16);

        goto LABEL_18;
      }
    }

    else if (a4)
    {
      RPErrorF();
      BOOL v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_19;
    }

    BOOL v18 = 0;
    goto LABEL_18;
  }

  if (a4)
  {
    RPErrorF();
    BOOL v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v18 = 0;
  }

uint64_t __62__RPFileTransferSession__smallFilesReceiveTaskFileItem_error___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_smallFilesReceiveTaskComplete:(id)a3 error:(id)a4 responseHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 taskID];
  smallFilesReceiveTasks = self->_smallFilesReceiveTasks;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v11];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](smallFilesReceiveTasks, "setObject:forKeyedSubscript:", 0LL, v13);

  [v8 queue];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPFileTransferSession _ioQueueEnqueue:](self, "_ioQueueEnqueue:", v14);

  --self->_fileWritesOutstanding;
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    RPErrorF();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0LL, 0LL, v25);
    -[RPFileTransferSession _updateSmallFilesTaskResumeState:error:]( self,  "_updateSmallFilesTaskResumeState:error:",  v8,  v25);
LABEL_24:

    goto LABEL_27;
  }

  if (!v9)
  {
    [v8 fileItems];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v22 fileSize] < 1) {
            unint64_t v23 = 0LL;
          }
          else {
            unint64_t v23 = [v22 fileSize];
          }
          *(int64x2_t *)&self->_progressCurrentBytes = vaddq_s64( *(int64x2_t *)&self->_progressCurrentBytes,  vdupq_n_s64(v23));
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }

      while (v19);
    }

    *(int64x2_t *)&self->_progressCurrentFiles = vaddq_s64( *(int64x2_t *)&self->_progressCurrentFiles,  vdupq_n_s64([v17 count]));
    self->_progressDirty = 1;
    int v24 = self->_ucat->var0;
    if (v24 <= 9 && (v24 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v33 = v11;
      LogPrintF();
    }

    objc_msgSend(v8, "fileItems", v33);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _processReceivedItems:responseHandler:]( self,  "_processReceivedItems:responseHandler:",  v26,  v10);

    -[RPFileTransferSession _updateSmallFilesTaskResumeState:error:]( self,  "_updateSmallFilesTaskResumeState:error:",  v8,  0LL);
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v25 = v17;
    uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t j = 0LL; j != v28; ++j)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          uint64_t v32 = [v31 fileSize];
          self->_metricTotalBytes += [v31 metadataSize] + v32;
        }

        uint64_t v28 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }

      while (v28);
    }

    self->_metricTotalFiles += [v25 count];
    self->_unint64_t metricLastFileCompletionTicks = mach_absolute_time();
    goto LABEL_24;
  }

  int v16 = self->_ucat->var0;
  (*((void (**)(id, void, void, id))v10 + 2))(v10, 0LL, 0LL, v9);
  -[RPFileTransferSession _updateSmallFilesTaskResumeState:error:]( self,  "_updateSmallFilesTaskResumeState:error:",  v8,  v9);
LABEL_27:
}

- (void)_updateSmallFilesTaskResumeState:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (-[RPFileTransferSession isResumable](self, "isResumable"))
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v18 = v6;
    [v6 fileItems];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
          -[RPFileTransferSession resumeState](self, "resumeState");
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 filename];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 activeFileWithFileName:v15];
          int v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            if (v7) {
              uint64_t v17 = 0LL;
            }
            else {
              uint64_t v17 = [v13 fileSize];
            }
            [v16 setBytesWritten:v17];
            [v16 setError:v7];
            [v14 removeActiveFile:v16];
            [v14 addFinishedFile:v16];
            [v14 scheduleStateFileFlush];
          }

          ++v12;
        }

        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v10);
    }

    id v6 = v18;
  }
}

- (id)_largeFileSendTaskCreate
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v3 = self->_addedItems;
  uint64_t v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      if (v5 == ++v7)
      {
        uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    uint64_t v10 = v8;

    if (!v10) {
      return 0LL;
    }
    -[NSMutableSet removeObject:](self->_addedItems, "removeObject:", v10);
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___RPFileTransferLargeFileSendTask);
    -[RPFileTransferLargeFileSendTask setFileFD:](v9, "setFileFD:", 0xFFFFFFFFLL);
    -[RPFileTransferLargeFileSendTask setFileOffset:](v9, "setFileOffset:", 0LL);
    -[RPFileTransferLargeFileSendTask setFileItem:](v9, "setFileItem:", v10);
    -[RPFileTransferSession _ioQueueDequeue](self, "_ioQueueDequeue");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferLargeFileSendTask setQueue:](v9, "setQueue:", v11);

    ++self->_taskIDLast;
    -[RPFileTransferLargeFileSendTask setTaskID:](v9, "setTaskID:");
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      -[RPFileTransferLargeFileSendTask taskID](v9, "taskID");
      -[NSMutableSet fileID](v10, "fileID");
      -[NSMutableSet fileSize](v10, "fileSize");
      -[NSMutableSet metadataSize](v10, "metadataSize");
      LogPrintF();
    }
  }

  else
  {
LABEL_9:
    uint64_t v9 = 0LL;
    uint64_t v10 = v3;
  }

  return v9;
}

- (void)_largeFileSendTaskStart:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0LL;
  unint64_t v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000LL;
  uint64_t v44 = __Block_byref_object_copy__2;
  __int128 v45 = __Block_byref_object_dispose__2;
  id v46 = 0LL;
  [v4 fileItem];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 itemURL];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke;
  v38[3] = &unk_18A0333F8;
  __int128 v40 = &v41;
  v38[4] = self;
  v38[5] = v6;
  uint64_t v7 = (char *)v4;
  __int128 v39 = v7;
  id v8 = (void (**)(void))MEMORY[0x1895A4770](v38);
  v7[8] = 0;
  [v7 fileItem];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  *((void *)v7 + 3) = [v9 fileSize];

  *((_DWORD *)v7 + 4) = 0;
  *((_DWORD *)v7 + 8) = 0;
  ++*((_DWORD *)v7 + 35);
  id v10 = v6;
  uint64_t v11 = [v10 fileSystemRepresentation];
  if (!v11)
  {
    uint64_t v29 = RPErrorF();
    id v30 = v42[5];
    v42[5] = (id)v29;

    goto LABEL_17;
  }

  [v7 fileItem];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v12 fileSize] < 1)
  {
    uint64_t v14 = 0LL;
  }

  else
  {
    [v7 fileItem];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 fileSize];
  }

  if (-[RPFileTransferSession isResumable](self, "isResumable"))
  {
    -[RPFileTransferSession resumeState](self, "resumeState");
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 fileItem];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 filename];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 finishedFileWithFileName:v17];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      [v18 fileName];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      FPrintF();

      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_2;
      block[3] = &unk_18A031AE8;
      void block[4] = self;
      __int128 v37 = v7;
      dispatch_async(dispatchQueue, block);

      goto LABEL_17;
    }

    [v7 fileItem];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 filename];
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 activeFileWithFileName:v22];
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      uint64_t v24 = [v23 fileOffset];
      uint64_t v20 = [v23 bytesWritten] + v24;
      if (v20)
      {
        [v10 path];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        int v33 = [v23 sourceFileItemUsable:v25];

        if (v33)
        {
          [v23 fileName];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          FPrintF();

          objc_msgSend(v7, "setFileOffset:", v20, v32, v20);
        }
      }
    }

    else
    {
      uint64_t v20 = 0LL;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  uint64_t v26 = (dispatch_queue_s *)self->_dispatchQueue;
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_3;
  v35[3] = &unk_18A033420;
  v35[4] = self;
  v35[5] = v20;
  v35[6] = v14;
  dispatch_async(v26, v35);
  uint64_t v27 = v42;
  id obj = v42[5];
  uint64_t v28 = -[RPFileTransferSession _openReadPath:error:](self, "_openReadPath:error:", v11, &obj);
  objc_storeStrong(v27 + 5, obj);
  if ((v28 & 0x80000000) == 0)
  {
    [v7 setFileFD:v28];
    CC_SHA256_Init((CC_SHA256_CTX *)(v7 + 36));
    -[RPFileTransferSession _largeFileSendTaskNext:xid:]( self,  "_largeFileSendTaskNext:xid:",  v7,  *((unsigned int *)v7 + 35));
  }

uint64_t __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 56);
  if (*(void *)(*(void *)(v1 + 8) + 40LL))
  {
    int v2 = (void *)result;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[19];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = (_DWORD **)v2[4], uint64_t v1 = v2[7], v5))
      {
        LogPrintF();
        uint64_t v3 = (_DWORD **)v2[4];
        uint64_t v1 = v2[7];
      }
    }

    return [v3 _largeFileSendTaskFailed:v2[6] error:*(void *)(*(void *)(v1 + 8) + 40)];
  }

  return result;
}

uint64_t __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskEnd:*(void *)(a1 + 40) error:0];
}

void *__49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_3(void *result)
{
  *(void *)(result[4] + 304LL) += result[5];
  *(void *)(result[4] + 312LL) += result[6];
  ++*(void *)(result[4] + 328LL);
  return result;
}

- (void)_largeFileSendTaskNext:(id)a3 xid:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = (char *)a3;
  uint64_t v7 = (void *)MEMORY[0x1895A45CC]();
  if (*((_DWORD *)v6 + 35) == (_DWORD)v4)
  {
    c = (CC_SHA256_CTX *)(v6 + 36);
    while (1)
    {
      if (v6[8] || *((_DWORD *)v6 + 4) >= self->_prefLargeFileMaxOutstanding) {
        goto LABEL_21;
      }
      unint64_t v8 = *((void *)v6 + 3);
      if (!v8)
      {
        objc_autoreleasePoolPop(v7);
        int v21 = *((_DWORD *)v6 + 8);
        if ((v21 & 2) == 0)
        {
          *((_DWORD *)v6 + 8) = v21 | 2;
          -[RPFileTransferSession _largeFileSendTaskSend:data:end:xid:]( self,  "_largeFileSendTaskSend:data:end:xid:",  v6,  0LL,  1LL,  v4);
        }

        goto LABEL_22;
      }

      if (v8 >= self->_largeFileBufferBytes) {
        unint64_t largeFileBufferBytes = self->_largeFileBufferBytes;
      }
      else {
        unint64_t largeFileBufferBytes = *((void *)v6 + 3);
      }
      uint64_t v10 = objc_msgSend(v6, "fileFD", c);
      id v23 = 0LL;
      -[RPFileTransferSession _readFD:size:error:](self, "_readFD:size:error:", v10, largeFileBufferBytes, &v23);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = v23;
      if (!v11)
      {
        -[RPFileTransferSession _largeFileSendTaskFailed:error:](self, "_largeFileSendTaskFailed:error:", v6, v12);

        goto LABEL_21;
      }

      *((void *)v6 + 3) -= largeFileBufferBytes;
      id v13 = v11;
      CC_SHA256_Update(c, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
      uint64_t v14 = [v6 fileOffset];
      if (!v14) {
        break;
      }
      unint64_t v15 = v14;
      [v6 fileItem];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 fileSize];

      uint64_t v18 = *((void *)v6 + 3);
      if (v17 - v18 > v15)
      {
        unint64_t v19 = v17 - v18 - largeFileBufferBytes;
        if (v15 <= v19) {
          goto LABEL_15;
        }
        objc_msgSend(v13, "subdataWithRange:", v15 - v19, objc_msgSend(v13, "length") - (v15 - v19));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPFileTransferSession _largeFileSendTaskSend:data:end:xid:]( self,  "_largeFileSendTaskSend:data:end:xid:",  v6,  v20,  *((void *)v6 + 3) == 0LL,  v4);
      }

- (void)_largeFileSendTaskSend:(id)a3 data:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6
{
  BOOL v7 = a5;
  uint64_t v65 = *MEMORY[0x1895F89C0];
  uint64_t v10 = (char *)a3;
  id v11 = a4;
  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v10, "taskID"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v13 forKeyedSubscript:@"_i"];

  if (v11)
  {
    if (self->_compressionEnabled)
    {
      BOOL v55 = v7;
      unsigned int v14 = a6;
      uint64_t v15 = [v11 length];
      id v63 = 0LL;
      -[RPFileTransferSession _compressData:error:](self, "_compressData:error:", v11, &v63);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v63;
      uint64_t v18 = v17;
      p_metricCompressedBytes = &self->_metricCompressedBytes;
      if (v16)
      {
        uint64_t v20 = [v16 length];
        do
          unint64_t v21 = __ldaxr(p_metricCompressedBytes);
        while (__stlxr(v21 + v20, p_metricCompressedBytes));
        p_unint64_t metricUncompressedBytes = &self->_metricUncompressedBytes;
        do
          unint64_t v23 = __ldaxr(p_metricUncompressedBytes);
        while (__stlxr(v23 + v15, p_metricUncompressedBytes));
        [v12 setObject:v16 forKeyedSubscript:&unk_18A04DF48];
        [MEMORY[0x189607968] numberWithUnsignedLong:v15];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 setObject:v24 forKeyedSubscript:&unk_18A04DF60];

        a6 = v14;
        BOOL v7 = v55;
        goto LABEL_23;
      }

      do
        unint64_t v25 = __ldaxr(p_metricCompressedBytes);
      while (__stlxr(v25 + v15, p_metricCompressedBytes));
      uint64_t v26 = &self->_metricUncompressedBytes;
      do
        unint64_t v27 = __ldaxr(v26);
      while (__stlxr(v27 + v15, v26));
      p_metricUncompressibleChunks = &self->_metricUncompressibleChunks;
      a6 = v14;
      do
        unint64_t v29 = __ldaxr(p_metricUncompressibleChunks);
      while (__stlxr(v29 + 1, p_metricUncompressibleChunks));
      if (v17)
      {
        p_metricCompressionErrors = &self->_metricCompressionErrors;
        do
          unint64_t v31 = __ldaxr(p_metricCompressionErrors);
        while (__stlxr(v31 + 1, p_metricCompressionErrors));
        int var0 = self->_ucat->var0;
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v53 = [v10 taskID];
          id v54 = v18;
          LogPrintF();
        }
      }

      BOOL v7 = v55;
    }

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, &unk_18A04DF90, v53, v54);
  }

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 64LL);
  if ([v2 state] == 1)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_3;
    v9[3] = &unk_18A033470;
    v9[4] = *(void *)(a1 + 32);
    uint64_t v3 = &v10;
    uint64_t v4 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    char v13 = *(_BYTE *)(a1 + 68);
    id v11 = (dispatch_queue_s *)*(id *)(a1 + 40);
    int v12 = *(_DWORD *)(a1 + 64);
    [v2 sendEncryptedRequestID:@"_ftLg" request:v4 xpcID:0 options:0 responseHandler:v9];
    int v5 = v11;
  }

  else
  {
    uint64_t v6 = (unsigned int *)(*(void *)(a1 + 40) + 16LL);
    do
      unsigned int v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    [*(id *)(a1 + 40) queue];
    int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_2;
    block[3] = &unk_18A033448;
    unint64_t v8 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    uint64_t v3 = &v15;
    id v15 = v8;
    BOOL v16 = v2 != 0LL;
    dispatch_async(v5, block);
  }
}

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  RPErrorF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _largeFileSendTaskFailed:v2 error:v3];
}

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  int v5 = *(void **)(a1 + 40);
  id v8 = a4;
  *(void *)(*(void *)(a1 + 32) + 304) += [v5 length];
  if (*(_BYTE *)(a1 + 60)) {
    ++*(void *)(*(void *)(a1 + 32) + 320LL);
  }
  *(_BYTE *)(*(void *)(a1 + 32) + 336LL) = 1;
  uint64_t v6 = (unsigned int *)(*(void *)(a1 + 48) + 16LL);
  do
    unsigned int v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  [*(id *)(a1 + 32) _largeFileSendTaskResponse:*(void *)(a1 + 48) error:v8 end:*(unsigned __int8 *)(a1 + 60) xid:*(unsigned int *)(a1 + 56)];
}

- (void)_largeFileSendTaskFailed:(id)a3 error:(id)a4
{
  uint64_t v6 = a3;
  id v7 = a4;
  if (!v6[8])
  {
    v6[8] = 1;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__RPFileTransferSession__largeFileSendTaskFailed_error___block_invoke;
    block[3] = &unk_18A032A28;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __56__RPFileTransferSession__largeFileSendTaskFailed_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskEnd:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_largeFileSendTaskResponse:(id)a3 error:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (self->_invalidateCalled)
  {
    if (v11)
    {
      if (!v7) {
        goto LABEL_10;
      }
    }

    else
    {
      RPErrorF();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_10:
        [v10 queue];
        id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1895F87A8];
        v22[1] = 3221225472LL;
        v22[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke;
        v22[3] = &unk_18A032A28;
        v22[4] = self;
        id v23 = v10;
        id v24 = v12;
        id v12 = v12;
        dispatch_async(v15, v22);

        unsigned int v14 = v23;
LABEL_11:

        goto LABEL_12;
      }
    }
  }

  else if (!v7)
  {
    [v10 queue];
    char v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      void v16[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_3;
      v16[3] = &unk_18A0334C0;
      v16[4] = self;
      id v17 = v10;
      unsigned int v18 = a6;
      dispatch_async(v13, v16);

      goto LABEL_13;
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_2;
    block[3] = &unk_18A032A28;
    void block[4] = self;
    id v20 = v10;
    id v21 = v12;
    id v12 = v12;
    dispatch_async(v13, block);

    unsigned int v14 = v20;
    goto LABEL_11;
  }

  -[RPFileTransferSession _largeFileSendTaskEnd:error:](self, "_largeFileSendTaskEnd:error:", v10, v12);
LABEL_12:

LABEL_13:
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskFailed:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskFailed:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskNext:*(void *)(a1 + 40) xid:*(unsigned int *)(a1 + 48)];
}

- (void)_largeFileSendTaskEnd:(id)a3 error:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  int v7 = v15[3];
  if ((v7 & 0x80000000) == 0)
  {
    if (close(v7) && *__error()) {
      __error();
    }
    v15[3] = -1;
  }

  if ((-[NSMutableSet containsObject:](self->_largeFileSendTasks, "containsObject:") & 1) != 0)
  {
    if (!self->_invalidateCalled && [v6 code] == -71143)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v13 = [v15 taskID];
        id v14 = v6;
        LogPrintF();
      }

      objc_msgSend(v15, "setNeedsRetry:", 1, v13, v14);
      goto LABEL_29;
    }

    int v10 = self->_ucat->var0;
    if (v6)
    {
      uint64_t v13 = [v15 taskID];
      id v14 = v6;
    }

    else
    {
      uint64_t v13 = [v15 taskID];
    }

    LogPrintF();
LABEL_28:
    objc_msgSend(v15, "fileItem", v13, v14);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _completeItemDirect:error:](self, "_completeItemDirect:error:", v11, v6);

    -[NSMutableSet removeObject:](self->_largeFileSendTasks, "removeObject:", v15);
    -[RPFileTransferSession _processFinish](self, "_processFinish");
    [v15 queue];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _ioQueueEnqueue:](self, "_ioQueueEnqueue:", v12);

    -[RPFileTransferSession _scheduleItems](self, "_scheduleItems");
    goto LABEL_29;
  }

  int v9 = self->_ucat->var0;
  if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
  {
    [v15 taskID];
    LogPrintF();
  }

- (void)_largeFileReceiveRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSDictionaryGetNSNumber();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = 0LL;
  id v62 = (id *)&v61;
  uint64_t v63 = 0x3032000000LL;
  uint64_t v64 = __Block_byref_object_copy__2;
  uint64_t v65 = __Block_byref_object_dispose__2;
  id v66 = 0LL;
  v58[0] = MEMORY[0x1895F87A8];
  v58[1] = 3221225472LL;
  v58[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke;
  v58[3] = &unk_18A0334E8;
  unsigned int v60 = &v61;
  v58[4] = self;
  void v58[5] = v8;
  id v9 = v7;
  id v59 = v9;
  int v10 = (void (**)(void))MEMORY[0x1895A4770](v58);
  if (!v8 || self->_fileWritesOutstanding >= 0x32)
  {
    uint64_t v34 = RPErrorF();
    id v14 = v62[5];
    v62[5] = (id)v34;
    goto LABEL_42;
  }

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    uint64_t Int64 = CFDictionaryGetInt64();
    if (v57 || !Int64)
    {
      uint64_t v35 = RPErrorF();
      id v36 = v62[5];
      v62[5] = (id)v35;

      id v14 = 0LL;
      goto LABEL_41;
    }

    uint64_t v13 = v62;
    id obj = v62[5];
    -[RPFileTransferSession _decompressData:originalSize:error:]( self,  "_decompressData:originalSize:error:",  v11,  Int64,  &obj);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13 + 5, obj);
    __int128 v47 = v14;
    if (!v14) {
      goto LABEL_41;
    }
  }

  else
  {
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
  }

  int Int64Ranged = CFDictionaryGetInt64Ranged();
  largeFileReceiveTasks = self->_largeFileReceiveTasks;
  if ((Int64Ranged & 1) != 0)
  {
    id v46 = v10;
    uint64_t v21 = -[NSMutableDictionary objectForKeyedSubscript:](largeFileReceiveTasks, "objectForKeyedSubscript:", v8);
    if (v21)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v39 = v8;
        LogPrintF();
      }

      -[RPFileTransferSession _largeFileReceiveTaskInvalidate:](self, "_largeFileReceiveTaskInvalidate:", v21, v39);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_largeFileReceiveTasks,  "setObject:forKeyedSubscript:",  0LL,  v8);
    }

    id v44 = v11;
    uint64_t v45 = v9;
    id v23 = objc_alloc_init(&OBJC_CLASS___RPFileTransferItem);
    CFStringGetTypeID();
    uint64_t v24 = CFDictionaryGetTypedValue();
    if (v24) {
      -[RPFileTransferItem setFilename:](v23, "setFilename:", v24);
    }
    uint64_t v43 = (void *)v24;
    uint64_t v25 = CFDictionaryGetInt64();
    if (!v57) {
      -[RPFileTransferItem setFileSize:](v23, "setFileSize:", v25);
    }
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26) {
      -[RPFileTransferItem setMetadata:](v23, "setMetadata:", v26);
    }
    if ((Int64Ranged & 2) != 0)
    {
      CFDictionaryGetCFDataOfLength();
      unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27) {
        -[RPFileTransferItem setSha256HashData:](v23, "setSha256HashData:", v27);
      }
    }

    if (-[RPFileTransferSession isResumable](self, "isResumable"))
    {
      -[RPFileTransferSession resumeState](self, "resumeState");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v29 = -[RPFileTransferResumeStateItem initWithFileTransferRequestDict:]( objc_alloc(&OBJC_CLASS___RPFileTransferResumeStateItem),  "initWithFileTransferRequestDict:",  v6);
      [v28 addActiveFile:v29];
      [v28 scheduleStateFileFlush];
    }

    int v30 = self->_ucat->var0;
    if (v30 <= 10 && (v30 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v40 = v25;
      uint64_t v41 = [v26 count];
      uint64_t v39 = v8;
      LogPrintF();
    }

    uint64_t v42 = (void *)v21;
    unint64_t v31 = objc_alloc_init(&OBJC_CLASS___RPFileTransferLargeFileReceiveTask);
    -[RPFileTransferLargeFileReceiveTask setFileFD:](v31, "setFileFD:", 0xFFFFFFFFLL);
    -[RPFileTransferLargeFileReceiveTask setFileItem:](v31, "setFileItem:", v23);
    -[RPFileTransferSession _ioQueueDequeue](self, "_ioQueueDequeue");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferLargeFileReceiveTask setQueue:](v31, "setQueue:", v32);

    -[RPFileTransferLargeFileReceiveTask setTaskID:](v31, "setTaskID:", [v8 unsignedLongLongValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_largeFileReceiveTasks,  "setObject:forKeyedSubscript:",  v31,  v8);
    ++self->_fileWritesOutstanding;
    -[RPFileTransferLargeFileReceiveTask queue](v31, "queue");
    int v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1895F87A8];
    v52[1] = 3221225472LL;
    v52[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_2;
    v52[3] = &unk_18A033510;
    v52[4] = self;
    v52[5] = v31;
    id v14 = v47;
    id v53 = v14;
    int v55 = Int64Ranged;
    id v9 = v45;
    id v54 = v45;
    dispatch_async(v33, v52);

    int v10 = v46;
    id v11 = v44;
    if ((Int64Ranged & 2) == 0) {
      goto LABEL_41;
    }
  }

  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](largeFileReceiveTasks, "objectForKeyedSubscript:", v8);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      uint64_t v37 = RPErrorF();
      id v38 = v62[5];
      v62[5] = (id)v37;

      id v14 = v47;
      goto LABEL_41;
    }

    if ((Int64Ranged & 2) != 0)
    {
      CFDictionaryGetCFDataOfLength();
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        [v17 fileItem];
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 setSha256HashData:v18];
      }
    }

    ++self->_fileWritesOutstanding;
    [v17 queue];
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_3;
    block[3] = &unk_18A033510;
    void block[4] = self;
    void block[5] = v17;
    id v14 = v47;
    id v49 = v14;
    int v51 = Int64Ranged;
    id v50 = v9;
    dispatch_async(v20, block);

    if ((Int64Ranged & 2) == 0) {
      goto LABEL_41;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_largeFileReceiveTasks,  "setObject:forKeyedSubscript:",  0LL,  v8,  v39,  v40,  v41);
  id v14 = v47;
LABEL_41:

LABEL_42:
  v10[2](v10);

  _Block_object_dispose(&v61, 8);
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 152LL);
    return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16LL))();
  }

  return result;
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileReceiveTaskRun:*(void *)(a1 + 40) data:*(void *)(a1 + 48) sendFlags:*(unsigned int *)(a1 + 64) responseHandler:*(void *)(a1 + 56)];
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileReceiveTaskRun:*(void *)(a1 + 40) data:*(void *)(a1 + 48) sendFlags:*(unsigned int *)(a1 + 64) responseHandler:*(void *)(a1 + 56)];
}

- (void)_resumeStateReceiveRequest:(id)a3 responseHandler:(id)a4
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  if (-[RPFileTransferSession isResumable](self, "isResumable"))
  {
    -[RPFileTransferSession resumeState](self, "resumeState");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isEmpty])
    {
      id v7 = 0LL;
    }

    else
    {
      [v6 dictionaryRepresentation];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = @"resumeState";
      v10[0] = v8;
      [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v7 = 0LL;
  }

  (*((void (**)(id, void *, void, void))v5 + 2))(v5, v7, 0LL, 0LL);
}

- (void)_largeFileReceiveTaskRun:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 responseHandler:(id)a6
{
  uint64_t v115 = *MEMORY[0x1895F89C0];
  int v10 = (char *)a3;
  id v11 = a4;
  id v12 = a6;
  if ((a5 & 1) == 0) {
    goto LABEL_32;
  }
  [v10 fileItem];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v13 fileSize] < 1)
  {
    uint64_t v61 = 0LL;
  }

  else
  {
    [v10 fileItem];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v61 = [v14 fileSize];
  }

  CC_SHA256_Init((CC_SHA256_CTX *)(v10 + 12));
  if (!-[RPFileTransferSession isResumable](self, "isResumable")) {
    goto LABEL_11;
  }
  -[RPFileTransferSession resumeState](self, "resumeState");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 fileItem];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 filename];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 activeFileWithFileName:v17];
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {

LABEL_11:
    off_t v19 = 0LL;
    goto LABEL_12;
  }

  off_t v19 = [v18 fileOffset];

  if (v19)
  {
    id v110 = 0LL;
    BOOL v20 = -[RPFileTransferSession _largeFileReceiveTaskUpdateSHA256CtxFromFileItem:length:error:]( self,  "_largeFileReceiveTaskUpdateSHA256CtxFromFileItem:length:error:",  v10,  v19,  &v110);
    id v21 = v110;
    __int128 v22 = v21;
    if (!v20)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke;
      block[3] = &unk_18A031C78;
      void block[4] = self;
      v105 = v10;
      id v106 = v22;
      id v108 = v12;
      id v107 = v11;
      unsigned int v109 = a5;
      id v36 = v22;
      dispatch_async(dispatchQueue, block);

      uint64_t v37 = v105;
LABEL_52:

      goto LABEL_53;
    }

    uint64_t v23 = 0LL;
    goto LABEL_13;
  }

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLargeFilesTaskResumeState:*(void *)(a1 + 40) data:*(void *)(a1 + 56) sendFlags:*(unsigned int *)(a1 + 72) error:*(void *)(a1 + 48) complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLargeFilesTaskResumeState:*(void *)(a1 + 40) data:*(void *)(a1 + 56) sendFlags:*(unsigned int *)(a1 + 72) error:*(void *)(a1 + 48) complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_3( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLargeFilesTaskResumeState:*(void *)(a1 + 40) data:*(void *)(a1 + 56) sendFlags:*(unsigned int *)(a1 + 72) error:*(void *)(a1 + 48) complete:0];
}

void *__81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_4( void *result)
{
  *(void *)(result[4] + 304LL) += result[5];
  *(void *)(result[4] + 312LL) += result[6];
  ++*(void *)(result[4] + 328LL);
  return result;
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_5( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLargeFilesTaskResumeState:*(void *)(a1 + 40) data:*(void *)(a1 + 56) sendFlags:*(unsigned int *)(a1 + 72) error:*(void *)(a1 + 48) complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_6( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLargeFilesTaskResumeState:*(void *)(a1 + 40) data:*(void *)(a1 + 56) sendFlags:*(unsigned int *)(a1 + 72) error:*(void *)(a1 + 48) complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_7( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLargeFilesTaskResumeState:*(void *)(a1 + 40) data:*(void *)(a1 + 56) sendFlags:*(unsigned int *)(a1 + 72) error:*(void *)(a1 + 48) complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_8( uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 304LL) += *(void *)(a1 + 64);
  if ((*(_BYTE *)(a1 + 72) & 2) != 0) {
    ++*(void *)(*(void *)(a1 + 32) + 320LL);
  }
  *(_BYTE *)(*(void *)(a1 + 32) + 336LL) = 1;
  if (*(_BYTE *)(a1 + 76))
  {
    [*(id *)(a1 + 40) fileItem];
    int v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ([*(id *)(a1 + 32) isResumable])
    {
      [*(id *)(a1 + 32) resumeState];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) fileItem];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 filename];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 activeFileWithFileName:v5];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6) {
        uint64_t v7 = [v6 fileOffset];
      }
      else {
        uint64_t v7 = 0LL;
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    uint64_t v9 = [v2 fileSize];
    *(void *)(*(void *)(a1 + 32) + 536) += v9 - v7 + [v2 metadataSize];
    ++*(void *)(*(void *)(a1 + 32) + 544LL);
    *(void *)(*(void *)(a1 + 32) + 400LL) = mach_absolute_time();

    BOOL v8 = *(_BYTE *)(a1 + 76) != 0;
  }

  else
  {
    BOOL v8 = 0LL;
  }

  [*(id *)(a1 + 32) _largeFileReceiveTaskRespond:*(void *)(a1 + 40) error:0 complete:v8 responseHandler:*(void *)(a1 + 56)];
  return [*(id *)(a1 + 32) _updateLargeFilesTaskResumeState:*(void *)(a1 + 40) data:*(void *)(a1 + 48) sendFlags:*(unsigned int *)(a1 + 72) error:0 complete:*(unsigned __int8 *)(a1 + 76)];
}

- (BOOL)_largeFileReceiveTaskUpdateSHA256CtxFromFileItem:(id)a3 length:(unint64_t)a4 error:(id *)a5
{
  __int128 v22 = a5;
  uint64_t v7 = (char *)a3;
  [v7 fileItem];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v30 = 0LL;
  int v9 = -[RPFileTransferSession _openReadFileItem:error:](self, "_openReadFileItem:error:", v8, &v30);
  id v10 = v30;

  if (v9 < 0)
  {
    if (v22)
    {
      id v10 = v10;
      BOOL v16 = 0;
      id *v22 = v10;
    }

    else
    {
      BOOL v16 = 0;
    }
  }

  else
  {
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __87__RPFileTransferSession__largeFileReceiveTaskUpdateSHA256CtxFromFileItem_length_error___block_invoke;
    v28[3] = &__block_descriptor_36_e5_v8__0l;
    unsigned int v25 = v9;
    int v29 = v9;
    uint64_t v23 = v7;
    int v24 = (void (**)(void))MEMORY[0x1895A4770](v28);
    unint64_t v11 = 0LL;
    uint64_t v26 = self;
    unint64_t largeFileBufferBytes = self->_largeFileBufferBytes;
    unint64_t v13 = a4;
    if (largeFileBufferBytes >= a4) {
      unint64_t v14 = a4;
    }
    else {
      unint64_t v14 = largeFileBufferBytes;
    }
    id v15 = (CC_SHA256_CTX *)(v7 + 12);
    while (1)
    {
      BOOL v16 = v13 <= v11;
      if (v13 <= v11) {
        break;
      }
      id v17 = (void *)MEMORY[0x1895A45CC]();
      if (v14 >= v13 - v11) {
        unint64_t v14 = v13 - v11;
      }
      id v27 = v10;
      -[RPFileTransferSession _readFD:size:error:](v26, "_readFD:size:error:", v25, v14, &v27, v22);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v20 = v27;

      if (v18)
      {
        id v19 = v18;
        CC_SHA256_Update(v15, (const void *)[v19 bytes], objc_msgSend(v19, "length"));
        v11 += v14;
      }

      else if (v22)
      {
        id *v22 = v20;
      }

      objc_autoreleasePoolPop(v17);
      id v10 = v20;
      if (!v18) {
        goto LABEL_16;
      }
    }

    id v20 = v10;
LABEL_16:
    v24[2](v24);

    id v10 = v20;
    uint64_t v7 = v23;
  }

  return v16;
}

uint64_t __87__RPFileTransferSession__largeFileReceiveTaskUpdateSHA256CtxFromFileItem_length_error___block_invoke( uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_largeFileReceiveTaskRespond:(id)a3 error:(id)a4 complete:(BOOL)a5 responseHandler:(id)a6
{
  BOOL v7 = a5;
  id v19 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void (**)(void, void, void, void))v11;
  if (v7)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 10)
    {
      unint64_t v14 = v19;
      if (var0 == -1)
      {
        unint64_t v14 = v19;
      }

      uint64_t v17 = [v14 taskID];
      LogPrintF();
    }

- (void)_largeFileReceiveTaskInvalidate:(id)a3
{
  id v11 = a3;
  int v4 = [v11 fileFD];
  if ((v4 & 0x80000000) == 0)
  {
    if (!close(v4))
    {
LABEL_11:
      objc_msgSend(v11, "setFileFD:", 0xFFFFFFFFLL, v8, v10);
      goto LABEL_12;
    }

    if (*__error())
    {
      uint64_t v5 = *__error();
      if (!(_DWORD)v5) {
        goto LABEL_11;
      }
    }

    else
    {
      uint64_t v5 = 4294960596LL;
    }

    int var0 = self->_ucat->var0;
    uint64_t v9 = [v11 taskID];
    LogPrintF();
    objc_msgSend(v11, "setFileFD:", 0xFFFFFFFFLL, v9, v5);
  }

- (void)_updateLargeFilesTaskResumeState:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 error:(id)a6 complete:(BOOL)a7
{
  char v8 = a5;
  id v17 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[RPFileTransferSession isResumable](self, "isResumable"))
  {
    -[RPFileTransferSession resumeState](self, "resumeState");
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 fileItem];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 filename];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 activeFileWithFileName:v15];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
LABEL_13:

      goto LABEL_14;
    }

    if (v12)
    {
      if ([v12 code] == -71143
        || [v12 code] == -6753
        || [v12 code] == -6722)
      {
        objc_msgSend(v16, "setBytesWritten:", objc_msgSend(v16, "bytesWritten") + objc_msgSend(v11, "length"));
LABEL_12:
        [v13 scheduleStateFileFlush];
        goto LABEL_13;
      }

      [v16 setError:v12];
    }

    else
    {
      objc_msgSend(v16, "setBytesWritten:", objc_msgSend(v16, "bytesWritten") + objc_msgSend(v11, "length"));
      if ((v8 & 2) == 0) {
        goto LABEL_12;
      }
    }

    [v13 removeActiveFile:v16];
    [v13 addFinishedFile:v16];
    goto LABEL_12;
  }

- (id)_compressData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  size_t v6 = [v5 length];
  uint64_t v15 = 0LL;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  if (malloc(v6))
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __45__RPFileTransferSession__compressData_error___block_invoke;
    v14[3] = &unk_18A033560;
    v14[4] = &v15;
    BOOL v7 = (void (**)(void))MEMORY[0x1895A4770](v14);
    size_t v8 = compression_encode_buffer( (uint8_t *)v16[3], v6, (const uint8_t *)[v5 bytes], v6, 0, COMPRESSION_LZ4);
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x189603F48]);
      uint64_t v10 = (void *)[v9 initWithBytesNoCopy:v16[3] length:v8 freeWhenDone:1];
      id v11 = v10;
      if (v10)
      {
        v16[3] = 0LL;
        id v12 = v10;
      }

      else if (a4)
      {
        RPErrorF();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      id v11 = 0LL;
      if (a4) {
        *a4 = 0LL;
      }
    }

    v7[2](v7);
  }

  else if (a4)
  {
    RPErrorF();
    id v11 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = 0LL;
  }

  _Block_object_dispose(&v15, 8);

  return v11;
}

void __45__RPFileTransferSession__compressData_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v1) {
    free(v1);
  }
}

- (id)_decompressData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  if (malloc(a4))
  {
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    void v16[2] = __60__RPFileTransferSession__decompressData_originalSize_error___block_invoke;
    v16[3] = &unk_18A033560;
    v16[4] = &v17;
    size_t v8 = (void (**)(void))MEMORY[0x1895A4770](v16);
    id v9 = (uint8_t *)v18[3];
    id v10 = v7;
    if (compression_decode_buffer( v9,  a4,  (const uint8_t *)[v10 bytes],  objc_msgSend(v10, "length"),  0,  COMPRESSION_LZ4) == a4)
    {
      id v11 = objc_alloc(MEMORY[0x189603F48]);
      id v12 = (void *)[v11 initWithBytesNoCopy:v18[3] length:a4 freeWhenDone:1];
      unint64_t v13 = v12;
      if (v12)
      {
        v18[3] = 0LL;
        id v14 = v12;
      }

      else if (a5)
      {
        RPErrorF();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else if (a5)
    {
      RPErrorF();
      unint64_t v13 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      unint64_t v13 = 0LL;
    }

    v8[2](v8);
  }

  else if (a5)
  {
    RPErrorF();
    unint64_t v13 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v13 = 0LL;
  }

  _Block_object_dispose(&v17, 8);

  return v13;
}

void __60__RPFileTransferSession__decompressData_originalSize_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v1) {
    free(v1);
  }
}

- (id)_encodeAndCompressObject:(id)a3 originalSize:(unint64_t *)a4 error:(id *)a5
{
  size_t v8 = (void *)MEMORY[0x1895A3F3C](a3, 0LL, &v15);
  id v9 = v8;
  if (!v8)
  {
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }

  unint64_t v10 = [v8 length];
  if (!v10)
  {
    if (a5)
    {
LABEL_10:
      RPErrorF();
      id v12 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }

- (id)_decompressAndDecodeData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5
{
  size_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v7 = (void *)OPACKDecodeData();
    size_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }

    else if (a5)
    {
      RPErrorF();
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    size_t v8 = 0LL;
  }

  return v8;
}

- (id)_ioQueueDequeue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    uint64_t v4 = self->_metricTotalIOQueues + 1;
    self->_metricTotalIOQueues = v4;
    targetID = self->_targetID;
    uint64_t v11 = v4;
    id v5 = NSPrintF();
    size_t v6 = (const char *)objc_msgSend(v5, "UTF8String", targetID, v11);

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    id v3 = dispatch_queue_create(v6, v7);

    int var0 = self->_ucat->var0;
  }

  return v3;
}

- (void)_ioQueueEnqueue:(id)a3
{
}

- (int)_openReadFileItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[NSString stringByStandardizingPath](self->_receiveFileParentPath, "stringByStandardizingPath");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [v6 filename];
    size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      [v7 stringByAppendingPathComponent:v8];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 stringByStandardizingPath];
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      if (([v10 hasPrefix:v7] & 1) == 0)
      {
        if (a4)
        {
          RPErrorF();
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        int v11 = -1;
        goto LABEL_11;
      }
    }

    else
    {
      p_fileIDLastReceive = &self->_fileIDLastReceive;
      do
        unint64_t v13 = __ldaxr(p_fileIDLastReceive);
      while (__stlxr(v13 + 1, p_fileIDLastReceive));
      id v10 = (id)[objc_alloc(NSString) initWithFormat:@"%@/%llu.rpftf", v7, v13 + 1];
    }

    id v14 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v10 isDirectory:0];
    [v6 setItemURL:v14];

    id v10 = v10;
    int v11 = -[RPFileTransferSession _openReadPath:error:]( self,  "_openReadPath:error:",  [v10 fileSystemRepresentation],  a4);
LABEL_11:

    goto LABEL_12;
  }

  if (a4)
  {
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  int v11 = -1;
LABEL_12:

  return v11;
}

- (int)_openReadPath:(const char *)a3 error:(id *)a4
{
  int v6 = open(a3, 0);
  if ((v6 & 0x80000000) == 0 || *__error() && !*__error())
  {
    if (fcntl(v6, 48, 1LL))
    {
      if (*__error())
      {
        uint64_t v7 = *__error();
        if (!(_DWORD)v7) {
          goto LABEL_16;
        }
      }

      else
      {
        uint64_t v7 = 4294960596LL;
      }

      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v11 = v7;
        LogPrintF();
      }
    }

- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 error:(id *)a5
{
  return -[RPFileTransferSession _openWriteFileItem:size:truncate:error:]( self,  "_openWriteFileItem:size:truncate:error:",  a3,  a4,  0LL,  a5);
}

- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  -[NSString stringByStandardizingPath](self->_receiveFileParentPath, "stringByStandardizingPath");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [v10 filename];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      [v11 stringByAppendingPathComponent:v12];
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 stringByStandardizingPath];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (([v14 hasPrefix:v11] & 1) == 0)
      {
        if (a6)
        {
          RPErrorF();
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        int v15 = -1;
        goto LABEL_11;
      }
    }

    else
    {
      p_fileIDLastReceive = &self->_fileIDLastReceive;
      do
        unint64_t v17 = __ldaxr(p_fileIDLastReceive);
      while (__stlxr(v17 + 1, p_fileIDLastReceive));
      id v14 = (void *)[objc_alloc(NSString) initWithFormat:@"%@/%llu.rpftf", v11, v17 + 1];
    }

    id v18 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v14 isDirectory:0];
    [v10 setItemURL:v18];

    int v15 = -[RPFileTransferSession _openWritePath:size:truncate:error:]( self,  "_openWritePath:size:truncate:error:",  v14,  a4,  v7,  a6);
LABEL_11:

    goto LABEL_12;
  }

  if (a6)
  {
    RPErrorF();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  int v15 = -1;
LABEL_12:

  return v15;
}

- (int)_openWritePath:(id)a3 size:(int64_t)a4 error:(id *)a5
{
  return -[RPFileTransferSession _openWritePath:size:truncate:error:]( self,  "_openWritePath:size:truncate:error:",  a3,  a4,  0LL,  a5);
}

- (int)_openWritePath:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = (const char *)[v10 UTF8String];
  if (!v11)
  {
    if (!a6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  id v12 = v11;
  if (v7) {
    int v13 = open(v11, 1537, 384LL);
  }
  else {
    int v13 = open(v11, 513, 384LL);
  }
  int v14 = v13;
  if (v13 < 0)
  {
    if (*__error())
    {
      int v15 = *__error();
      if (v15 == 2)
      {
        [v10 stringByDeletingLastPathComponent];
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x1896078A8] defaultManager];
        unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        id v29 = 0LL;
        char v18 = [v17 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v29];
        id v19 = v29;

        if ((v18 & 1) == 0)
        {
          if (a6)
          {
            RPNestedErrorF();
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_13;
        }

        int v14 = open(v12, 1537, 384LL);
        if (v14 < 0)
        {
          if (*__error()) {
            int v15 = *__error();
          }
          else {
            int v15 = -6700;
          }
        }

        else
        {
          int v15 = 0;
        }
      }

      if (!v15) {
        goto LABEL_19;
      }
    }

    if (!a6)
    {
LABEL_13:
      int v14 = -1;
      goto LABEL_45;
    }

- (id)_readPath:(const char *)a3 size:(unint64_t)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v8 = -[RPFileTransferSession _openReadPath:error:](self, "_openReadPath:error:", a3, a5);
    if ((v8 & 0x80000000) != 0)
    {
      id v10 = 0LL;
    }

    else
    {
      int v9 = v8;
      -[RPFileTransferSession _readFD:size:error:](self, "_readFD:size:error:", v8, a4, a5);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      close(v9);
    }
  }

  else
  {
    objc_msgSend(MEMORY[0x189603F48], "data", a3, 0, a5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_readFD:(int)a3 size:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v16 = 0LL;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  if (malloc(a4))
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __44__RPFileTransferSession__readFD_size_error___block_invoke;
    v15[3] = &unk_18A033560;
    v15[4] = &v16;
    int v9 = (void (**)(void))MEMORY[0x1895A4770](v15);
    if (-[RPFileTransferSession _readFD:buffer:size:error:](self, "_readFD:buffer:size:error:", v7, v17[3], a4, a5))
    {
      id v10 = objc_alloc(MEMORY[0x189603F48]);
      uint64_t v11 = (void *)[v10 initWithBytesNoCopy:v17[3] length:a4 freeWhenDone:1];
      id v12 = v11;
      if (v11)
      {
        v17[3] = 0LL;
        id v13 = v11;
      }

      else if (a5)
      {
        RPErrorF();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      id v12 = 0LL;
    }

    v9[2](v9);
  }

  else if (a5)
  {
    RPErrorF();
    id v12 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __44__RPFileTransferSession__readFD_size_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v1) {
    free(v1);
  }
}

- (BOOL)_readFD:(int)a3 buffer:(char *)a4 size:(unint64_t)a5 error:(id *)a6
{
  if (!a5) {
    return 1;
  }
  size_t v7 = a5;
  while (1)
  {
    ssize_t v10 = read(a3, a4, v7);
    if (v10 >= 1)
    {
      a4 += v10;
      v7 -= v10;
      goto LABEL_8;
    }

    if (!v10)
    {
      if (a6) {
        goto LABEL_14;
      }
      return 0;
    }

    if (!*__error() || *__error() != 4) {
      break;
    }
LABEL_8:
    if (!v7) {
      return 1;
    }
  }

  if (a6)
  {
LABEL_14:
    RPErrorF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a6 = v12;
    return result;
  }

  return 0;
}

- (BOOL)_writeFD:(int)a3 buffer:(const char *)a4 size:(unint64_t)a5 error:(id *)a6
{
  if (!a5) {
    return 1;
  }
  size_t v7 = a5;
  while (1)
  {
    ssize_t v10 = write(a3, a4, v7);
    if (v10 < 1) {
      break;
    }
    a4 += v10;
    v7 -= v10;
LABEL_7:
    if (!v7) {
      return 1;
    }
  }

  if (*__error() && *__error() == 4) {
    goto LABEL_7;
  }
  if (!a6) {
    return 0;
  }
  RPErrorF();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a6 = v12;
  return result;
}

- (BOOL)_truncateFD:(int)a3 size:(int64_t)a4 error:(id *)a5
{
  int v6 = ftruncate(a3, a4);
  if (v6)
  {
    if (!*__error())
    {
      if (!a5) {
        return v6 == 0;
      }
      goto LABEL_4;
    }

    __error();
    if (a5)
    {
LABEL_4:
      RPErrorF();
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6 == 0;
}

- (id)_modTimeForFileWithPath:(const char *)a3 error:(id *)a4
{
  v12[2] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (!stat(a3, &v10) || *__error() && !*__error())
    {
      uint64_t tv_nsec = v10.st_mtimespec.tv_nsec;
      v11[0] = @"_fMt";
      [MEMORY[0x189607968] numberWithLong:v10.st_mtimespec.tv_sec];
      int v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = @"_fMtNs";
      v12[0] = v6;
      [MEMORY[0x189607968] numberWithLong:tv_nsec];
      size_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v7;
      [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }

    if (a4) {
      goto LABEL_7;
    }
  }

  else if (a4)
  {
LABEL_7:
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0LL;
  }

  return 0LL;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (unint64_t)debugFlags
{
  return self->_debugFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (id)flowControlChangedHandler
{
  return self->_flowControlChangedHandler;
}

- (void)setFlowControlChangedHandler:(id)a3
{
}

- (int)flowControlState
{
  return self->_flowControlState;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)largeFileBufferBytes
{
  return self->_largeFileBufferBytes;
}

- (unint64_t)maxLargeFileTasks
{
  return self->_maxLargeFileTasks;
}

- (unint64_t)maxSmallFileTasks
{
  return self->_maxSmallFileTasks;
}

- (NSData)peerPublicKey
{
  return self->_peerPublicKey;
}

- (void)setPeerPublicKey:(id)a3
{
}

- (RPFileTransferProgress)progressCurrent
{
  return self->_progressCurrent;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (double)progressHandlerTimeInterval
{
  return self->_progressHandlerTimeInterval;
}

- (void)setProgressHandlerTimeInterval:(double)a3
{
  self->_progressHandlerTimeInterval = a3;
}

- (id)receivedItemHandler
{
  return self->_receivedItemHandler;
}

- (void)setReceivedItemHandler:(id)a3
{
}

- (id)receivedItemsHandler
{
  return self->_receivedItemsHandler;
}

- (void)setReceivedItemsHandler:(id)a3
{
}

- (NSData)selfPublicKey
{
  return self->_selfPublicKey;
}

- (void)setSelfPublicKey:(id)a3
{
}

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
}

- (NSData)selfSecretKey
{
  return self->_selfSecretKey;
}

- (void)setSelfSecretKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end