@interface NEUserNotification
+ (BOOL)shouldPromptForLocalAuthentication;
+ (id)createLAContext;
+ (void)cancelCurrentNotificationWithResponse:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)executeOnMainLoop:(uint64_t)a1;
+ (void)promptForLocalAuthenticationWithReason:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (BOOL)postNotificationWithCallbackQueue:(void *)a3 callbackHandler:;
- (id)initAndShowAddConfigurationsForApp:(id)a3 warningHeader:(const char *)a4 warning:(const char *)a5 callbackQueue:(id)a6 callbackHandler:(id)a7;
- (id)initAndShowAlertWithHeader:(id)a3 message:(id)a4 alternateMessage:(id)a5 defaultMessage:(id)a6 noBoldDefault:(BOOL)a7 usePrivacyIcon:(BOOL)a8 extensionItem:(id)a9 callbackQueue:(id)a10 callbackHandler:(id)a11;
- (id)initAndShowAuthenticationWithHeader:(id)a3 options:(id)a4 flags:(unint64_t)a5 callbackQueue:(id)a6 callbackHandler:(id)a7;
- (id)initAndShowLocalNetworkAlertWithAppName:(id)a3 reasonString:(id)a4 extensionItem:(id)a5 callbackQueue:(id)a6 callbackHandler:(id)a7;
- (void)cancel;
@end

@implementation NEUserNotification

- (id)initAndShowAlertWithHeader:(id)a3 message:(id)a4 alternateMessage:(id)a5 defaultMessage:(id)a6 noBoldDefault:(BOOL)a7 usePrivacyIcon:(BOOL)a8 extensionItem:(id)a9 callbackQueue:(id)a10 callbackHandler:(id)a11
{
  BOOL v11 = a7;
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  id v21 = a11;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___NEUserNotification;
  v22 = -[NEUserNotification init](&v41, sel_init);
  if (!v22) {
    goto LABEL_27;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  uint64_t v23 = [(id)g_currentNotifications count];
  ne_log_obj();
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      [(id)g_currentNotifications firstObject];
      v40 = (NEUserNotification *)objc_claimAutoreleasedReturnValue();
      SInt32 error = 138412290;
      v43 = v40;
      _os_log_error_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_ERROR,  "Already have outstanding notification %@, cannot show an additional one",  (uint8_t *)&error,  0xCu);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
    goto LABEL_29;
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    SInt32 error = 138412290;
    v43 = v22;
    _os_log_debug_impl(&dword_1876B1000, v25, OS_LOG_TYPE_DEBUG, "Adding notification %@", (uint8_t *)&error, 0xCu);
  }

  v26 = (void *)g_currentNotifications;
  if (!g_currentNotifications)
  {
    id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
    v28 = (void *)g_currentNotifications;
    g_currentNotifications = (uint64_t)v27;

    v26 = (void *)g_currentNotifications;
  }

  [v26 addObject:v22];
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  SInt32 error = 0;
  objc_setProperty_atomic(v22, v29, 0LL, 16LL);
  v30 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    v33 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x189605680], v16);
    if (v17) {
      CFDictionarySetValue(v33, (const void *)*MEMORY[0x189605688], v17);
    }
    if (v18) {
      CFDictionarySetValue(v33, (const void *)*MEMORY[0x189605698], v18);
    }
    if (v19)
    {
      v34 = (const void **)MEMORY[0x1896056A8];
      if (!v11) {
        v34 = (const void **)MEMORY[0x1896056A0];
      }
      CFDictionarySetValue(v33, *v34, v19);
    }

    if (v11) {
      CFOptionFlags v35 = 35LL;
    }
    else {
      CFOptionFlags v35 = 1LL;
    }
    CFUserNotificationRef v36 = CFUserNotificationCreate(v30, 0.0, v35, &error, v33);
    CFRelease(v33);
    if (!v36 || error) {
      goto LABEL_28;
    }
    objc_setProperty_atomic(v22, v37, v36, 16LL);
  }

  if (!objc_getProperty(v22, v32, 16LL, 1)
    || (v22->_isAlert = 1,
        !-[NEUserNotification postNotificationWithCallbackQueue:callbackHandler:]((uint64_t)v22, v20, v21)))
  {
LABEL_28:
    -[NEUserNotification cancel](v22, "cancel");
LABEL_29:
    v38 = 0LL;
    goto LABEL_30;
  }

- (id)initAndShowAuthenticationWithHeader:(id)a3 options:(id)a4 flags:(unint64_t)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  v13 = (const __CFDictionary *)a4;
  id v14 = a6;
  id v15 = a7;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NEUserNotification;
  id v16 = -[NEUserNotification init](&v33, sel_init);
  if (!v16) {
    goto LABEL_20;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  uint64_t v17 = [(id)g_currentNotifications count];
  ne_log_obj();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      [(id)g_currentNotifications firstObject];
      v32 = (NEUserNotification *)objc_claimAutoreleasedReturnValue();
      SInt32 error = 138412290;
      CFOptionFlags v35 = v32;
      _os_log_error_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_ERROR,  "Already have outstanding notification %@, cannot show an additional one",  (uint8_t *)&error,  0xCu);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
    goto LABEL_22;
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    SInt32 error = 138412290;
    CFOptionFlags v35 = v16;
    _os_log_debug_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEBUG,  "No outstanding notification, we are now the current notification %@",  (uint8_t *)&error,  0xCu);
  }

  id v20 = (void *)g_currentNotifications;
  if (!g_currentNotifications)
  {
    id v21 = objc_alloc_init(MEMORY[0x189603FA8]);
    v22 = (void *)g_currentNotifications;
    g_currentNotifications = (uint64_t)v21;

    id v20 = (void *)g_currentNotifications;
  }

  [v20 addObject:v16];
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  SInt32 error = 0;
  objc_setProperty_atomic(v16, v23, 0LL, 16LL);
  if (v13)
  {
    NEResourcesCopyLocalizedNSString(@"CANCEL_BUTTON", @"CANCEL_BUTTON");
    v25 = (const void *)objc_claimAutoreleasedReturnValue();
    v26 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v13);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x189605680], v12);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x189605698], v25);
    CFUserNotificationRef v29 = CFUserNotificationCreate(v26, 150.0, a5, &error, MutableCopy);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    if (v25) {
      CFRelease(v25);
    }
    if (!v29 || error) {
      goto LABEL_21;
    }
    objc_setProperty_atomic(v16, v28, v29, 16LL);
  }

  if (!objc_getProperty(v16, v24, 16LL, 1)
    || !-[NEUserNotification postNotificationWithCallbackQueue:callbackHandler:]((uint64_t)v16, v14, v15))
  {
LABEL_21:
    -[NEUserNotification cancel](v16, "cancel");
LABEL_22:
    v30 = 0LL;
    goto LABEL_23;
  }

- (void)cancel
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __28__NEUserNotification_cancel__block_invoke;
  v2[3] = &unk_18A090390;
  v2[4] = self;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)&OBJC_CLASS___NEUserNotification, v2);
}

- (id)initAndShowAddConfigurationsForApp:(id)a3 warningHeader:(const char *)a4 warning:(const char *)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v10 = a7;
  id v11 = a6;
  id v12 = a3;
  objc_opt_self();
  if (!g_UIKitBundle)
  {
    unsigned __int8 v37 = 0;
    [MEMORY[0x1896078A8] defaultManager];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v13 fileExistsAtPath:@"/System/Library/PrivateFrameworks/UIKitCore.framework" isDirectory:&v37];
    int v15 = v37;

    if (v14 && v15 != 0)
    {
      uint64_t v17 = [MEMORY[0x1896077F8] bundleWithPath:@"/System/Library/PrivateFrameworks/UIKitCore.framework"];
      id v18 = (void *)g_UIKitBundle;
      g_UIKitBundle = v17;

      if (g_UIKitBundle)
      {
        [(id)g_UIKitBundle load];
        g_UIDeviceClass = [(id)g_UIKitBundle classNamed:@"UIDevice"];
        ne_log_obj();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v39 = "+[NEUserNotification getUIDeviceClass]";
          __int16 v40 = 2112;
          uint64_t v41 = g_UIKitBundle;
          __int16 v42 = 2112;
          uint64_t v43 = g_UIDeviceClass;
          _os_log_debug_impl(&dword_1876B1000, v19, OS_LOG_TYPE_DEBUG, "%s: bundle %@ class %@", buf, 0x20u);
        }
      }
    }
  }

  [(id)g_UIDeviceClass currentDevice];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = v20;
  if (v20)
  {
    [v20 localizedModel];
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v22 = @"Mac";
  }

  id v23 = objc_alloc(NSString);
  [NSString stringWithUTF8String:a4];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NEResourcesCopyLocalizedNSString(v24, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithFormat:", v25, v12);

  id v27 = objc_alloc(NSString);
  [NSString stringWithUTF8String:a5];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  NEResourcesCopyLocalizedNSString(v28, v28);
  CFUserNotificationRef v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v27, "initWithFormat:", v29, v22, v12);

  NEResourcesCopyLocalizedNSString(@"DONT_ALLOW_BUTTON", @"DONT_ALLOW_BUTTON");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NEResourcesCopyLocalizedNSString(@"ALLOW_BUTTON", @"ALLOW_BUTTON");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  id v33 = -[NEUserNotification initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:]( self,  "initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem: callbackQueue:callbackHandler:",  v26,  v30,  v32,  v31,  0LL,  0LL,  0LL,  v11,  v10);

  return v33;
}

- (id)initAndShowLocalNetworkAlertWithAppName:(id)a3 reasonString:(id)a4 extensionItem:(id)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  return 0LL;
}

- (void).cxx_destruct
{
}

void __28__NEUserNotification_cancel__block_invoke(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    if (objc_getProperty(v3, v2, 24LL, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 24LL, 1);
      }
      v6 = (__CFRunLoopSource *)Property;
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1896051B0]);
      CFRelease(v6);
      v9 = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_18;
      }
      objc_setProperty_atomic(v9, v8, 0LL, 24LL);
    }

    id v10 = *(void **)(a1 + 32);
    if (!v10) {
      goto LABEL_18;
    }
    id v12 = objc_getProperty(v10, v4, 16LL, 1);
    id v13 = *(id *)(a1 + 32);
    if (!v12) {
      goto LABEL_15;
    }
    if (v13) {
      id v13 = objc_getProperty(v13, v11, 16LL, 1);
    }
    int v14 = (__CFUserNotification *)v13;
    CFUserNotificationCancel(v14);
    CFRelease(v14);
    id v16 = *(void **)(a1 + 32);
    if (v16)
    {
      objc_setProperty_atomic(v16, v15, 0LL, 16LL);
      id v13 = *(id *)(a1 + 32);
LABEL_15:
      if (v13)
      {
        objc_setProperty_nonatomic_copy(v13, v11, 0LL, 40LL);
        id v18 = *(void **)(a1 + 32);
        if (v18) {
          objc_setProperty_atomic(v18, v17, 0LL, 32LL);
        }
      }
    }
  }

+ (void)executeOnMainLoop:(uint64_t)a1
{
  v3 = a2;
  objc_opt_self();
  Current = CFRunLoopGetCurrent();
  if (Current == CFRunLoopGetMain())
  {
    v3[2]();
  }

  else
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __40__NEUserNotification_executeOnMainLoop___block_invoke;
    block[3] = &unk_18A090940;
    v5 = v3;
    dispatch_sync(MEMORY[0x1895F8AE0], block);
  }
}

uint64_t __40__NEUserNotification_executeOnMainLoop___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)postNotificationWithCallbackQueue:(void *)a3 callbackHandler:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __72__NEUserNotification_postNotificationWithCallbackQueue_callbackHandler___block_invoke;
  v13[3] = &unk_18A08FC00;
  v13[4] = a1;
  id v7 = v6;
  id v15 = v7;
  id v8 = v5;
  id v14 = v8;
  id v16 = &v17;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)&OBJC_CLASS___NEUserNotification, v13);
  if (*((_BYTE *)v18 + 24))
  {
    BOOL v9 = 1LL;
  }

  else
  {
    ne_log_obj();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_INFO,  "Failed to post new user notification: current notification in progress",  v12,  2u);
    }

    BOOL v9 = *((_BYTE *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __72__NEUserNotification_postNotificationWithCallbackQueue_callbackHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    int v28 = 138412290;
    uint64_t v29 = v27;
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "Displaying notification: %@", (uint8_t *)&v28, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  v4 = *(void **)(a1 + 32);
  if (!v4) {
    goto LABEL_8;
  }
  id v5 = objc_getProperty(v4, v3, 16LL, 1);
  if (!v5) {
    goto LABEL_8;
  }
  id v7 = v5;
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = objc_getProperty(v8, v6, 24LL, 1);
    if (v9)
    {

LABEL_8:
      os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
      return;
    }

    uint64_t v10 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  char v11 = [(id)g_currentNotifications containsObject:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  if ((v11 & 1) != 0)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v12, 16LL, 1);
    }
    id v14 = (__CFUserNotification *)Property;
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))authCallback;
    if (v15 && (*(_BYTE *)(v15 + 8) & 1) != 0) {
      id v16 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))alertCallback;
    }
    RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x189604DB0], v14, v16, 0LL);
    uint64_t v19 = *(void **)(a1 + 32);
    if (v19) {
      objc_setProperty_atomic(v19, v17, v14, 16LL);
    }

    if (RunLoopSource)
    {
      id v21 = *(void **)(a1 + 32);
      if (v21)
      {
        objc_setProperty_nonatomic_copy(v21, v20, *(id *)(a1 + 48), 40LL);
        id v23 = *(void **)(a1 + 32);
        if (v23) {
          objc_setProperty_atomic(v23, v22, *(id *)(a1 + 40), 32LL);
        }
      }

      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1896051B0]);
      v26 = *(void **)(a1 + 32);
      if (v26) {
        objc_setProperty_atomic(v26, v25, RunLoopSource, 24LL);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }
  }

+ (void)cancelCurrentNotificationWithResponse:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke;
  v11[3] = &unk_18A08FCA0;
  id v13 = v8;
  unint64_t v14 = a3;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)&OBJC_CLASS___NEUserNotification, v11);
}

+ (BOOL)shouldPromptForLocalAuthentication
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = 0LL;
  char v3 = [v2 canEvaluatePolicy:2 error:&v8];
  id v4 = v8;
  id v5 = v4;
  BOOL v6 = (v3 & 1) != 0 || !v4 || [v4 code] != -5;

  return v6;
}

+ (void)promptForLocalAuthenticationWithReason:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = (dispatch_queue_s *)a4;
  id v9 = a5;
  +[NEUserNotification createLAContext]();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = v10;
  if (v10)
  {
    id v22 = 0LL;
    int v12 = [v10 canEvaluatePolicy:2 error:&v22];
    id v13 = v22;
    if (v12)
    {
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_2;
      v19[3] = &unk_18A08FC78;
      char v20 = v8;
      id v21 = v9;
      [v11 evaluatePolicy:2 localizedReason:v7 reply:v19];

      unint64_t v14 = v20;
    }

    else
    {
      ne_log_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v13;
        _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "Device cannot evaluate Local Authentication: %@",  buf,  0xCu);
      }

      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_26;
      v17[3] = &unk_18A090940;
      id v18 = (dispatch_queue_s *)v9;
      dispatch_async(v8, v17);
      unint64_t v14 = v18;
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to create the LocalAuthentication context",  buf,  2u);
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_18A090940;
    id v24 = v9;
    dispatch_async(v8, block);
    id v13 = v24;
  }
}

+ (id)createLAContext
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!g_LABundle)
  {
    unsigned __int8 v8 = 0;
    [MEMORY[0x1896078A8] defaultManager];
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    int v1 = [v0 fileExistsAtPath:@"/System/Library/Frameworks/LocalAuthentication.framework" isDirectory:&v8];
    int v2 = v8;

    if (v1 && v2 != 0)
    {
      uint64_t v4 = [MEMORY[0x1896077F8] bundleWithPath:@"/System/Library/Frameworks/LocalAuthentication.framework"];
      id v5 = (void *)g_LABundle;
      g_LABundle = v4;

      if (g_LABundle)
      {
        [(id)g_LABundle load];
        g_LAContextClass = [(id)g_LABundle classNamed:@"LAContext"];
        ne_log_obj();
        BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          id v10 = "+[NEUserNotification createLAContext]";
          __int16 v11 = 2112;
          uint64_t v12 = g_LABundle;
          __int16 v13 = 2112;
          uint64_t v14 = g_LAContextClass;
          _os_log_debug_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEBUG, "%s: bundle %@ class %@", buf, 0x20u);
        }
      }
    }
  }

  return objc_alloc_init((Class)g_LAContextClass);
}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_2( uint64_t a1,  int a2,  void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  ne_log_obj();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEBUG,  "User successfully passed Local Authentication",  buf,  2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "User failed Local Authentication, SInt32 error = %@",  buf,  0xCu);
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_24;
  v9[3] = &unk_18A08FC50;
  unsigned __int8 v8 = *(dispatch_queue_s **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v11 = a2;
  dispatch_async(v8, v9);
}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_26( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_24( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

void __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke( uint64_t a1)
{
  int v2 = (id *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  if (v2)
  {
    uint64_t v4 = (dispatch_queue_s *)objc_getProperty(v2, v3, 32LL, 1);
    id v5 = v2[5];
    [v2 cancel];
    if (v4) {
      BOOL v6 = v5 == 0LL;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke_2;
      v9[3] = &unk_18A08FC28;
      id v7 = v5;
      uint64_t v8 = *(void *)(a1 + 48);
      id v10 = v7;
      uint64_t v11 = v8;
      dispatch_async(v4, v9);
    }
  }

  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

uint64_t __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40),  0LL);
}

@end