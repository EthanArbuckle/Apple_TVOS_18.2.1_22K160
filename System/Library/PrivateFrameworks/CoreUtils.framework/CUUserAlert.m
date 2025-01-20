@interface CUUserAlert
- (CUUserAlert)init;
- (NSBundle)localizationBundle;
- (NSString)alternativeButtonTitleKey;
- (NSString)defaultButtonTitleKey;
- (NSString)localizationTableName;
- (NSString)subtitleKey;
- (NSString)subtitleParameter;
- (NSString)titleKey;
- (NSString)titleParameter;
- (OS_dispatch_queue)dispatchQueue;
- (double)timeoutSeconds;
- (id)actionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_autoInvalidate;
- (void)_invalidated;
- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setActionHandler:(id)a3;
- (void)setAlternativeButtonTitleKey:(id)a3;
- (void)setDefaultButtonTitleKey:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocalizationBundle:(id)a3;
- (void)setLocalizationTableName:(id)a3;
- (void)setSubtitleKey:(id)a3;
- (void)setSubtitleParameter:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setTitleKey:(id)a3;
- (void)setTitleParameter:(id)a3;
@end

@implementation CUUserAlert

- (CUUserAlert)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUUserAlert;
  v2 = -[CUUserAlert init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateDone) {
    FatalErrorF("Activate without invalidate");
  }
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CUUserAlert;
  -[CUUserAlert dealloc](&v2, sel_dealloc);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __38__CUUserAlert_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = __Block_byref_object_copy__8771;
  v51 = __Block_byref_object_dispose__8772;
  id v52 = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __39__CUUserAlert__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_189F32BC0;
  v46 = &v47;
  id v5 = v4;
  aBlock[4] = self;
  id v45 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v8 = self->_titleKey;
  if (v8)
  {
    localizationBundle = self->_localizationBundle;
    v10 = localizationBundle;
    if (!localizationBundle)
    {
      [MEMORY[0x1896077F8] mainBundle];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    CULocalizedStringEx(v10, self->_localizationTableName, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!localizationBundle) {

    }
    v12 = self->_titleParameter;
    if (v12)
    {
      uint64_t v13 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", v11, v12);

      v11 = (void *)v13;
    }

    uint64_t v14 = *MEMORY[0x189605680];

    [v7 setObject:v11 forKeyedSubscript:v14];
  }

  v15 = self->_subtitleKey;
  if (v15)
  {
    v16 = self->_localizationBundle;
    v17 = v16;
    if (!v16)
    {
      [MEMORY[0x1896077F8] mainBundle];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    CULocalizedStringEx(v17, self->_localizationTableName, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16) {

    }
    v19 = self->_subtitleParameter;
    if (v19)
    {
      uint64_t v20 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", v18, v19);

      v18 = (void *)v20;
    }

    uint64_t v21 = *MEMORY[0x189605688];

    [v7 setObject:v18 forKeyedSubscript:v21];
  }

  v22 = self->_defaultButtonTitleKey;
  if (v22)
  {
    v23 = self->_localizationBundle;
    v24 = v23;
    if (!v23)
    {
      [MEMORY[0x1896077F8] mainBundle];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    CULocalizedStringEx(v24, self->_localizationTableName, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = *MEMORY[0x1896056A0];
    if (!v23) {

    }
    [v7 setObject:v25 forKeyedSubscript:v26];
  }

  v27 = self->_alternativeButtonTitleKey;
  if (v27)
  {
    v28 = self->_localizationBundle;
    v29 = v28;
    if (!v28)
    {
      [MEMORY[0x1896077F8] mainBundle];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }

    CULocalizedStringEx(v29, self->_localizationTableName, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = *MEMORY[0x189605698];
    if (!v28) {

    }
    [v7 setObject:v30 forKeyedSubscript:v31];
  }

  SInt32 error = 0;
  v32 = CFUserNotificationCreate(0LL, self->_timeoutSeconds, 2uLL, &error, (CFDictionaryRef)v7);
  v33 = v32;
  if (!v32) {
    goto LABEL_35;
  }
  self->_userNotification = v32;
  pthread_mutex_lock(&gCUUserAlertMutex);
  v34 = (void *)gCUUserAlertMap;
  if (!gCUUserAlertMap)
  {
    id v35 = objc_alloc_init(MEMORY[0x189603FC8]);
    v36 = (void *)gCUUserAlertMap;
    gCUUserAlertMap = (uint64_t)v35;

    v34 = (void *)gCUUserAlertMap;
  }

  [MEMORY[0x189607968] numberWithLong:v33];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 setObject:self forKeyedSubscript:v37];

  pthread_mutex_unlock(&gCUUserAlertMutex);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0LL, v33, (CFUserNotificationCallBack)_responseCallback, 0LL);
  v39 = RunLoopSource;
  if (RunLoopSource)
  {
    self->_userRLS = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v39, (CFRunLoopMode)*MEMORY[0x1896051B0]);
    (*((void (**)(id, void))v5 + 2))(v5, 0LL);
  }

  else
  {
LABEL_35:
    uint64_t v41 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5D4LL);
    v42 = (void *)v48[5];
    v48[5] = v41;
  }

  v6[2](v6);
  _Block_object_dispose(&v47, 8);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__CUUserAlert_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_autoInvalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_CUUserAlert <= 30
    && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
  {
    LogPrintF_safe( (uint64_t)&gLogCategory_CUUserAlert,  (uint64_t)"-[CUUserAlert _autoInvalidate]",  0x1Eu,  (uint64_t)"Auto-invalidate",  v2,  v3,  v4,  v5,  v13);
  }

  self->_invalidateCalled = 1;
  userRLS = self->_userRLS;
  if (userRLS)
  {
    id v8 = (const __CFString *)*MEMORY[0x1896051B0];
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, userRLS, v8);
    CFRelease(userRLS);
    self->_userRLS = 0LL;
  }

  userNotification = self->_userNotification;
  if (userNotification)
  {
    pthread_mutex_lock(&gCUUserAlertMutex);
    v11 = (void *)gCUUserAlertMap;
    [MEMORY[0x189607968] numberWithLong:userNotification];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:0 forKeyedSubscript:v12];

    pthread_mutex_unlock(&gCUUserAlertMutex);
    if (!self->_dismissed) {
      CFUserNotificationCancel(userNotification);
    }
    CFRelease(userNotification);
    self->_userNotification = 0LL;
  }

  -[CUUserAlert _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_userNotification)
  {
    v11 = (void (**)(id, uint64_t))_Block_copy(self->_actionHandler);
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0LL;

    if (v11) {
      v11[2](v11, -71148LL);
    }
    uint64_t v4 = (void (**)(void))_Block_copy(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    if (v4) {
      v4[2](v4);
    }
    self->_invalidateDone = 1;
    if (gLogCategory_CUUserAlert <= 30
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
    {
      LogPrintF_safe( (uint64_t)&gLogCategory_CUUserAlert,  (uint64_t)"-[CUUserAlert _invalidated]",  0x1Eu,  (uint64_t)"Invalidated",  v6,  v7,  v8,  v9,  v10);
    }
  }

- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__CUUserAlert__responseCallback_responseFlags___block_invoke;
  block[3] = &unk_189F32BE8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSBundle)localizationBundle
{
  return self->_localizationBundle;
}

- (void)setLocalizationBundle:(id)a3
{
}

- (NSString)localizationTableName
{
  return self->_localizationTableName;
}

- (void)setLocalizationTableName:(id)a3
{
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)titleParameter
{
  return self->_titleParameter;
}

- (void)setTitleParameter:(id)a3
{
}

- (NSString)subtitleKey
{
  return self->_subtitleKey;
}

- (void)setSubtitleKey:(id)a3
{
}

- (NSString)subtitleParameter
{
  return self->_subtitleParameter;
}

- (void)setSubtitleParameter:(id)a3
{
}

- (NSString)defaultButtonTitleKey
{
  return self->_defaultButtonTitleKey;
}

- (void)setDefaultButtonTitleKey:(id)a3
{
}

- (NSString)alternativeButtonTitleKey
{
  return self->_alternativeButtonTitleKey;
}

- (void)setAlternativeButtonTitleKey:(id)a3
{
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __47__CUUserAlert__responseCallback_responseFlags___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 16LL))
  {
    if (gLogCategory_CUUserAlert <= 30
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
    {
      LogPrintF_safe( (uint64_t)&gLogCategory_CUUserAlert,  (uint64_t)"-[CUUserAlert _responseCallback:responseFlags:]_block_invoke",  0x1Eu,  (uint64_t)"User alert response: Flags 0x%lX",  a5,  a6,  a7,  a8,  *(void *)(a1 + 48));
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 11LL) = 1;
    uint64_t v9 = *(void *)(a1 + 48);
    char v13 = (void (**)(id, uint64_t))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 120LL));
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 120);
    *(void *)(v10 + 120) = 0LL;

    if (v13)
    {
      if ((v9 & 3) == 3) {
        uint64_t v12 = 10LL;
      }
      else {
        uint64_t v12 = (v9 & 3) + 1;
      }
      v13[2](v13, v12);
    }

    [*(id *)(a1 + 32) _autoInvalidate];
  }

uint64_t __25__CUUserAlert_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = result;
  if (gLogCategory_CUUserAlert <= 30)
  {
    if (gLogCategory_CUUserAlert != -1
      || (result = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu), (_DWORD)result))
    {
      result = LogPrintF_safe( (uint64_t)&gLogCategory_CUUserAlert,  (uint64_t)"-[CUUserAlert invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate",  a5,  a6,  a7,  a8,  v10);
    }
  }

  uint64_t v9 = *(void *)(v8 + 32);
  if (!*(_BYTE *)(v9 + 9))
  {
    *(_BYTE *)(v9 + 9) = 1;
    return [*(id *)(v8 + 32) _autoInvalidate];
  }

  return result;
}

uint64_t __39__CUUserAlert__activateWithCompletion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    if (gLogCategory_CUUserAlert <= 90
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au)))
    {
      NSPrintF();
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe( (uint64_t)&gLogCategory_CUUserAlert,  (uint64_t)"-[CUUserAlert _activateWithCompletion:]_block_invoke",  0x5Au,  (uint64_t)"### Activate failed: %@",  v3,  v4,  v5,  v6,  (char)v2);
    }

    (*(void (**)(void))(*(void *)(v1 + 40) + 16LL))();
    return [*(id *)(v1 + 32) _autoInvalidate];
  }

  return result;
}

void __38__CUUserAlert_activateWithCompletion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v9 + 8))
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5BFLL);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_CUUserAlert <= 90
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au)))
    {
      NSPrintF();
      char v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe( (uint64_t)&gLogCategory_CUUserAlert,  (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke",  0x5Au,  (uint64_t)"### Activate failed: %@",  v11,  v12,  v13,  v14,  (char)v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) _autoInvalidate];
LABEL_16:

    return;
  }

  if (*(_BYTE *)(v9 + 9))
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFEEA14LL);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_CUUserAlert <= 90
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au)))
    {
      NSPrintF();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe( (uint64_t)&gLogCategory_CUUserAlert,  (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke",  0x5Au,  (uint64_t)"### Activate failed: %@",  v16,  v17,  v18,  v19,  (char)v15);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    goto LABEL_16;
  }

  if (gLogCategory_CUUserAlert <= 30)
  {
    if (gLogCategory_CUUserAlert != -1
      || (BOOL v20 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu), v9 = *(void *)(a1 + 32), v20))
    {
      LogPrintF_safe( (uint64_t)&gLogCategory_CUUserAlert,  (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke",  0x1Eu,  (uint64_t)"Activate: Timeout %.3f",  a5,  a6,  a7,  a8,  *(void *)(v9 + 112));
      uint64_t v9 = *(void *)(a1 + 32);
    }
  }

  *(_BYTE *)(v9 + 8) = 1;
  [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

@end