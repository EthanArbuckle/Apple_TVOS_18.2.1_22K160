@interface RPFileTransferResumeState
- (BOOL)addActiveFile:(id)a3;
- (BOOL)addFinishedFile:(id)a3;
- (BOOL)flushStateFile;
- (BOOL)isEmpty;
- (BOOL)isPlaceholder;
- (BOOL)loadStateFile;
- (BOOL)needsFlushing;
- (BOOL)removeActiveFile:(id)a3;
- (BOOL)removeAllActiveAndFinishedFileItems;
- (BOOL)removeFinishedFile:(id)a3;
- (BOOL)removeStateFile;
- (BOOL)removeUnusableOutputFileItems;
- (BOOL)removeUnusableSourceFileItems;
- (BOOL)scheduleStateFileFlush;
- (LogCategory)ucat;
- (NSString)outputPath;
- (NSString)stateFilePath;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)flushTimer;
- (RPFileTransferResumeState)init;
- (RPFileTransferResumeState)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (RPFileTransferResumeState)initWithDispatchQueue:(id)a3;
- (double)flushInterval;
- (id)activeFileWithFileName:(id)a3;
- (id)activeFiles;
- (id)dictionaryRepresentation;
- (id)finishedFileWithFileName:(id)a3;
- (id)finishedFiles;
- (id)version;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setFlushInterval:(double)a3;
- (void)setFlushTimer:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setNeedsFlushing:(BOOL)a3;
- (void)setOutputPath:(id)a3;
- (void)setStateFilePath:(id)a3;
- (void)setUcat:(LogCategory *)a3;
@end

@implementation RPFileTransferResumeState

- (RPFileTransferResumeState)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RPFileTransferResumeState;
  v2 = -[RPFileTransferResumeState init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RPFileTransferResumeState setIsPlaceholder:](v2, "setIsPlaceholder:", 0LL);
    -[RPFileTransferResumeState setDispatchQueue:](v3, "setDispatchQueue:", 0LL);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", @"1.0", @"version");
    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"fileInfo");
    id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v5 setObject:v6 forKey:@"activeFiles"];
    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v5 setObject:v7 forKey:@"finishedFiles"];
    stateInfo = v3->_stateInfo;
    v3->_stateInfo = v4;

    v9 = v3;
  }

  return v3;
}

- (RPFileTransferResumeState)initWithDispatchQueue:(id)a3
{
  id v4 = a3;
  id v5 = -[RPFileTransferResumeState init](self, "init");
  id v6 = v5;
  if (v5)
  {
    -[RPFileTransferResumeState setDispatchQueue:](v5, "setDispatchQueue:", v4);
    id v7 = v6;
  }

  return v6;
}

- (RPFileTransferResumeState)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RPFileTransferResumeState;
  id v7 = -[RPFileTransferResumeState init](&v18, sel_init);
  v8 = v7;
  if (!v7)
  {
    v16 = 0LL;
    goto LABEL_9;
  }

  -[RPFileTransferResumeState setIsPlaceholder:](v7, "setIsPlaceholder:", 0LL);
  -[RPFileTransferResumeState setDispatchQueue:](v8, "setDispatchQueue:", 0LL);
  [v6 objectForKey:@"version"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKey:@"fileInfo"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKey:@"activeFiles"];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v10 objectForKey:@"finishedFiles"];
  v13 = (void *)v12;
  if (!v9)
  {
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  if (!v10)
  {
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  if (!v11)
  {
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  if (!v12)
  {
    if (a4)
    {
LABEL_17:
      RPErrorF();
      v16 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPFileTransferResumeState;
  -[RPFileTransferResumeState dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  if (-[RPFileTransferResumeState needsFlushing](self, "needsFlushing")) {
    -[RPFileTransferResumeState flushStateFile](self, "flushStateFile");
  }
  -[RPFileTransferResumeState flushTimer](self, "flushTimer");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    id v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[RPFileTransferResumeState setFlushTimer:](self, "setFlushTimer:", 0LL);
  }

  -[RPFileTransferResumeState setDispatchQueue:](self, "setDispatchQueue:", 0LL);
  stateInfo = self->_stateInfo;
  self->_stateInfo = 0LL;
}

- (id)version
{
  return (id)-[NSMutableDictionary objectForKey:](self->_stateInfo, "objectForKey:", @"version");
}

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x189603F68] dictionaryWithDictionary:self->_stateInfo];
}

- (BOOL)isEmpty
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPFileTransferResumeState finishedFiles](self, "finishedFiles");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = ![v3 count] && !objc_msgSend(v4, "count");

  return v5;
}

- (id)activeFiles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"activeFiles"];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)finishedFiles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"finishedFiles"];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeFileWithFileName:(id)a3
{
  id v4 = a3;
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    id v7 = -[RPFileTransferResumeStateItem initWithStateDict:]( objc_alloc(&OBJC_CLASS___RPFileTransferResumeStateItem),  "initWithStateDict:",  v6);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)addActiveFile:(id)a3
{
  id v4 = a3;
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 fileName];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 fileInfo];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8) {
    [v5 setValue:v8 forKey:v6];
  }

  return v7 == 0LL;
}

- (BOOL)removeActiveFile:(id)a3
{
  id v4 = a3;
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 fileName];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 objectForKey:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    [v5 setValue:0 forKey:v6];
  }

  return v7 != 0LL;
}

- (id)finishedFileWithFileName:(id)a3
{
  id v4 = a3;
  -[RPFileTransferResumeState finishedFiles](self, "finishedFiles");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    id v7 = -[RPFileTransferResumeStateItem initWithStateDict:]( objc_alloc(&OBJC_CLASS___RPFileTransferResumeStateItem),  "initWithStateDict:",  v6);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)addFinishedFile:(id)a3
{
  id v4 = a3;
  -[RPFileTransferResumeState finishedFiles](self, "finishedFiles");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 fileName];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 fileInfo];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 setValue:0 forKey:@"fileOffset"];
  [v8 setValue:0 forKey:@"bytesWritten"];
  [v5 setValue:v8 forKey:v6];

  return v7 == 0LL;
}

- (BOOL)removeFinishedFile:(id)a3
{
  id v4 = a3;
  -[RPFileTransferResumeState finishedFiles](self, "finishedFiles");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 fileName];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 objectForKey:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    [v5 setValue:0 forKey:v6];
  }

  return v7 != 0LL;
}

- (BOOL)scheduleStateFileFlush
{
  BOOL v3 = -[RPFileTransferResumeState needsFlushing](self, "needsFlushing");
  -[RPFileTransferResumeState setNeedsFlushing:](self, "setNeedsFlushing:", 1LL);
  -[RPFileTransferResumeState flushTimer](self, "flushTimer");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[RPFileTransferResumeState dispatchQueue](self, "dispatchQueue");
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v5);
    -[RPFileTransferResumeState setFlushTimer:](self, "setFlushTimer:", v6);

    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __51__RPFileTransferResumeState_scheduleStateFileFlush__block_invoke;
    handler[3] = &unk_18A031A30;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    v8 = -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    -[RPFileTransferResumeState flushInterval](self, "flushInterval");
    -[RPFileTransferResumeState flushInterval](self, "flushInterval");
    CUDispatchTimerSet();

    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    v9 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
    dispatch_activate(v9);
  }

  return !v3;
}

uint64_t __51__RPFileTransferResumeState_scheduleStateFileFlush__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) needsFlushing];
  BOOL v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 flushStateFile];
  }
  [v3 flushTimer];
  BOOL v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v5);

  return [*(id *)(a1 + 32) setFlushTimer:0];
}

- (BOOL)flushStateFile
{
  BOOL v3 = -[RPFileTransferResumeState needsFlushing](self, "needsFlushing");
  if (v3)
  {
    -[RPFileTransferResumeState dictionaryRepresentation](self, "dictionaryRepresentation");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferResumeState stateFilePath](self, "stateFilePath");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v4 writeToFile:v5 atomically:1];

    -[RPFileTransferResumeState setNeedsFlushing:](self, "setNeedsFlushing:", 0LL);
    LOBYTE(v3) = v6;
  }

  return v3;
}

- (BOOL)loadStateFile
{
  BOOL v3 = (void *)MEMORY[0x189604030];
  -[RPFileTransferResumeState stateFilePath](self, "stateFilePath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 fileURLWithPath:v4];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896078A8] defaultManager];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v17 = 0LL;
    [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v5 error:&v17];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v17;
    if (v9)
    {
      objc_super v11 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v9];
      stateInfo = self->_stateInfo;
      self->_stateInfo = v11;

      if (-[RPFileTransferResumeState removeUnusableOutputFileItems](self, "removeUnusableOutputFileItems")) {
        -[RPFileTransferResumeState scheduleStateFileFlush](self, "scheduleStateFileFlush");
      }
    }

    else if (*(int *)-[RPFileTransferResumeState ucat](self, "ucat") <= 30 {
           && (*(_DWORD *)-[RPFileTransferResumeState ucat](self, "ucat") != -1
    }
            || (-[RPFileTransferResumeState ucat](self, "ucat"), _LogCategory_Initialize())))
    {
      -[RPFileTransferResumeState ucat](self, "ucat");
      [v5 path];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[RPFileTransferResumeState removeAllActiveAndFinishedFileItems]( self,  "removeAllActiveAndFinishedFileItems",  v15,  v10);
    }

    else
    {
      -[RPFileTransferResumeState removeAllActiveAndFinishedFileItems]( self,  "removeAllActiveAndFinishedFileItems",  v14,  v16);
    }
  }

  return 0;
}

- (BOOL)removeStateFile
{
  BOOL v3 = (void *)MEMORY[0x189604030];
  -[RPFileTransferResumeState stateFilePath](self, "stateFilePath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 fileURLWithPath:v4];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RPFileTransferResumeState flushTimer](self, "flushTimer");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RPFileTransferResumeState flushTimer](self, "flushTimer");
    id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[RPFileTransferResumeState setFlushTimer:](self, "setFlushTimer:", 0LL);
  }

  [MEMORY[0x1896078A8] defaultManager];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    [MEMORY[0x1896078A8] defaultManager];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = 0LL;
    char v12 = [v11 removeItemAtURL:v5 error:&v16];
    id v13 = v16;

    if ((v12 & 1) == 0 && *(int *)-[RPFileTransferResumeState ucat](self, "ucat") <= 30)
    {
      if (*(_DWORD *)-[RPFileTransferResumeState ucat](self, "ucat") != -1
        || (-[RPFileTransferResumeState ucat](self, "ucat"), _LogCategory_Initialize()))
      {
        -[RPFileTransferResumeState ucat](self, "ucat");
        [v5 path];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }
  }

  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)removeUnusableSourceFileItems
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = (void *)[v2 copy];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        [v4 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v11 = -[RPFileTransferResumeStateItem initWithStateDict:]( objc_alloc(&OBJC_CLASS___RPFileTransferResumeStateItem),  "initWithStateDict:",  v10);
        -[RPFileTransferResumeStateItem itemURL](v11, "itemURL");
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 path];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && !-[RPFileTransferResumeStateItem sourceFileItemUsable:](v11, "sourceFileItemUsable:", v13))
        {
          -[RPFileTransferResumeState removeActiveFile:](self, "removeActiveFile:", v11);
          char v7 = 1;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)removeUnusableOutputFileItems
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[RPFileTransferResumeState activeFiles](self, "activeFiles");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)[v3 copy];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v15 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        [v5 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v11 = -[RPFileTransferResumeStateItem initWithStateDict:]( objc_alloc(&OBJC_CLASS___RPFileTransferResumeStateItem),  "initWithStateDict:",  v10);
        -[RPFileTransferResumeState outputPath](self, "outputPath");
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v13 = -[RPFileTransferResumeStateItem outputFileItemUsable:](v11, "outputFileItemUsable:", v12);

        if (!v13)
        {
          -[RPFileTransferResumeState removeActiveFile:](self, "removeActiveFile:", v11);
          char v15 = 1;
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  else
  {
    char v15 = 0;
  }

  return v15 & 1;
}

- (BOOL)removeAllActiveAndFinishedFileItems
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"activeFiles"];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 count];
  BOOL v5 = v4 != 0;
  if (v4) {
    [v3 removeAllObjects];
  }
  [v2 objectForKey:@"finishedFiles"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 count])
  {
    [v6 removeAllObjects];
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (LogCategory)ucat
{
  return self->_ucat;
}

- (void)setUcat:(LogCategory *)a3
{
  self->_ucat = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)outputPath
{
  return self->_outputPath;
}

- (void)setOutputPath:(id)a3
{
}

- (NSString)stateFilePath
{
  return self->_stateFilePath;
}

- (void)setStateFilePath:(id)a3
{
}

- (OS_dispatch_source)flushTimer
{
  return self->_flushTimer;
}

- (void)setFlushTimer:(id)a3
{
}

- (double)flushInterval
{
  return self->_flushInterval;
}

- (void)setFlushInterval:(double)a3
{
  self->_flushInterval = a3;
}

- (BOOL)needsFlushing
{
  return self->_needsFlushing;
}

- (void)setNeedsFlushing:(BOOL)a3
{
  self->_needsFlushing = a3;
}

- (void).cxx_destruct
{
}

@end