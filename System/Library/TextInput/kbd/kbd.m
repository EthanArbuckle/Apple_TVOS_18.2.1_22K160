}

BOOL sub_1000019F8(id a1, NSURL *a2, NSError *a3)
{
  v4 = a2;
  v5 = a3;
  id v6 = TYALog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10000AB18(v4, (uint64_t)v5, v7);
  }

  return 1;
}

uint64_t _isTypologyURL(void *a1)
{
  id v1 = a1;
  id v12 = 0LL;
  unsigned int v2 = [v1 getResourceValue:&v12 forKey:NSURLIsDirectoryKey error:0];
  id v3 = v12;
  unsigned int v4 = [v1 isFileURL];
  if (v2) {
    unsigned int v5 = [v3 BOOLValue] ^ 1;
  }
  else {
    unsigned int v5 = 1;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v1 lastPathComponent]);
  unsigned int v7 = [v6 hasPrefix:@"typology"];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v1 pathExtension]);
  if ([v8 isEqualToString:@"log"])
  {
    unsigned int v9 = 1;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v1 pathExtension]);
    unsigned int v9 = [v10 isEqualToString:@"plist"];
  }

  return v4 & v2 & v5 & v7 & v9;
}

LABEL_14:
    id v6 = 0LL;
    goto LABEL_15;
  }

LABEL_8:
  id v6 = v5;
LABEL_15:

  return v6;
}

void sub_1000026EC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100002710( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id IXATestAppRelayLog()
{
  if (qword_10001E1C8 != -1) {
    dispatch_once(&qword_10001E1C8, &stru_1000146C0);
  }
  return (id)qword_10001E1C0;
}

void sub_100002760(id a1)
{
  os_log_t v1 = os_log_create("com.apple.inputanalytics", "testAppRelay");
  unsigned int v2 = (void *)qword_10001E1C0;
  qword_10001E1C0 = (uint64_t)v1;
}

void sub_1000027D0(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___IXATestAppRelayServer);
  unsigned int v2 = (void *)qword_10001E1D0;
  qword_10001E1D0 = (uint64_t)v1;
}

void sub_100003380(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___TIDiagnosticHelper);
  unsigned int v2 = (void *)qword_10001E1E0;
  qword_10001E1E0 = (uint64_t)v1;
}

uint64_t sub_100003814(mach_msg_id_t a1)
{
  msg.msgh_remote_port = dword_10001E1F0;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_bits = 0x1800000015LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = a1;
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

void sub_1000039BC(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  unsigned int v2 = (void *)qword_10001E1F8;
  qword_10001E1F8 = (uint64_t)v1;
}

void sub_100003CC4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TIKeyboardInputManagerLoader sharedLoader](&OBJC_CLASS___TIKeyboardInputManagerLoader, "sharedLoader"));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 hasActiveInputManagers];
}

LABEL_3:
  unsigned int v7 = 0;
LABEL_6:

  return v7;
}

void sub_100003E50(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeInputModeIdentifiers]);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t SWLayout = TIInputModeGetSWLayout(*(void *)(*((void *)&v11 + 1) + 8LL * (void)i));
        v10 = (void *)objc_claimAutoreleasedReturnValue(SWLayout);
        if (v10 && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v10, (void)v11))
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;

          goto LABEL_12;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_12:
}

void sub_100004200(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___TIEmojiAlternativesServer);
  id v2 = (void *)qword_10001E208;
  qword_10001E208 = (uint64_t)v1;
}

void sub_100004468(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (*(void *)(a1 + 32))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        __int128 v13 = 0LL;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v13), "candidate", (void)v15));
          [v8 addObject:v14];

          __int128 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_10000467C(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  id v2 = (void *)qword_10001E218;
  qword_10001E218 = v1;
}

uint64_t sub_100004A84(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TIAppAutofillManager sharedInstance](&OBJC_CLASS___TIAppAutofillManager, "sharedInstance"));
  [v2 obtainCredential:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = objc_autoreleasePoolPush();
  pthread_set_qos_class_self_np(QOS_CLASS_USER_INTERACTIVE, 0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TIDiagnosticHelper sharedInstance](&OBJC_CLASS___TIDiagnosticHelper, "sharedInstance"));
  id v5 = [v4 registerForSignal:30 withBlock:&stru_100014828];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  [v6 addOperationWithBlock:&stru_100014848];

  +[TICoreAnalyticsEventController registerScheduledEventsActivity]( &OBJC_CLASS___TICoreAnalyticsEventController,  "registerScheduledEventsActivity");
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100014888);
  notify_register_dispatch("com.apple.language.changed", &out_token, &_dispatch_main_q, &stru_1000148A8);

  objc_autoreleasePoolPop(v3);
  id v7 = +[DDSServer sharedInstance](&OBJC_CLASS___DDSServer, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v8 run];

  return 0;
}

void sub_100004BE8(id a1, int a2)
{
  if (TICanLogMessageAtLevel(0LL))
  {
    uint64_t v2 = TIOSLogFacility();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10000B044();
    }
  }

  +[TILanguageModelLoaderManager performMaintenance](&OBJC_CLASS___TILanguageModelLoaderManager, "performMaintenance");
}

void sub_100004C40(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManager keyboardUserDirectory]( &OBJC_CLASS___TIKeyboardInputManager,  "keyboardUserDirectory"));
  id v19 = 0LL;
  unsigned __int8 v3 = [v1 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v4 = v19;

  if ((v3 & 1) == 0 && TICanLogMessageAtLevel(0LL))
  {
    uint64_t v5 = TIOSLogFacility();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10000B0DC((uint64_t)v4);
    }
  }

  id v7 = +[TIAssetManager sharedAssetManager](&OBJC_CLASS___TIAssetManager, "sharedAssetManager");
  id v8 =  +[TIKeyboardInputManagerServer sharedKeyboardInputManagerServer]( &OBJC_CLASS___TIKeyboardInputManagerServer,  "sharedKeyboardInputManagerServer");
  id v9 = +[TIRemoteDataServer sharedRemoteDataServer](&OBJC_CLASS___TIRemoteDataServer, "sharedRemoteDataServer");
  id v10 = +[TITypingAssertion sharedTypingAssertion](&OBJC_CLASS___TITypingAssertion, "sharedTypingAssertion");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TIUserDictionaryServer sharedInstance](&OBJC_CLASS___TIUserDictionaryServer, "sharedInstance"));
  [v11 startServer];

  id v12 = +[TILexiconServer sharedLexiconServer](&OBJC_CLASS___TILexiconServer, "sharedLexiconServer");
  id v13 =  +[EMFEmojiPreferencesService sharedServiceWithMachName:]( &OBJC_CLASS___EMFEmojiPreferencesService,  "sharedServiceWithMachName:",  0LL);
  id v14 =  +[TIAccessibilityServer sharedAccessibilityServer]( &OBJC_CLASS___TIAccessibilityServer,  "sharedAccessibilityServer");
  id v15 = +[TIImageCacheServer sharedInstance](&OBJC_CLASS___TIImageCacheServer, "sharedInstance");
  id v16 =  +[TIPreferencesControllerService sharedPreferencesController]( &OBJC_CLASS___TIPreferencesControllerService,  "sharedPreferencesController");
  id v17 = +[TIAutofillServer sharedAutofillServer](&OBJC_CLASS___TIAutofillServer, "sharedAutofillServer");
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  [v18 registerMaintenanceActivity];
}

void sub_100004E08(id a1, OS_xpc_object *a2)
{
  xdict = a2;
  BOOL v2 = xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary;
  unsigned __int8 v3 = xdict;
  if (v2)
  {
    id v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(xdict, _xpc_event_key_name));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if ([@"AppleKeyboardsPreferencesChangedNotification" isEqualToString:v5])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v6 postNotificationName:TIAppleKeyboardsPreferencesChangedNotification_Private object:0];
    }

    unsigned __int8 v3 = xdict;
  }
}

void sub_100004EBC(id a1, int a2)
{
}

void sub_100004ECC( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
}

  ;
}

void sub_100004F60(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  BOOL v2 = (void *)qword_10001E228;
  qword_10001E228 = v1;
}

void sub_100005534(uint64_t a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[TITypingAssertion sharedTypingAssertion](&OBJC_CLASS___TITypingAssertion, "sharedTypingAssertion"));
  [v2 restResetTouches];

  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[TITransientLexiconManager sharedInstance](&OBJC_CLASS___TITransientLexiconManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 supplementalLexicons]);
  [v4 clearActiveLexicon];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 interactingConnection]);
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[TIKeyboardInputManagerLoader sharedLoader](&OBJC_CLASS___TIKeyboardInputManagerLoader, "sharedLoader"));
    [v8 setInteractingConnection:0];
  }

void sub_100005B80(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  BOOL v2 = (void *)qword_10001E238;
  qword_10001E238 = v1;
}

void sub_100006008(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  BOOL v2 = (void *)qword_10001E248;
  qword_10001E248 = v1;
}

void sub_100006624(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TILexiconEntry entryWithDocumentText:userInput:]( &OBJC_CLASS___TILexiconEntry,  "entryWithDocumentText:userInput:",  a2,  0LL));
  [v2 addObject:v3];
}

uint64_t sub_100006788(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006798(uint64_t a1)
{
}

void sub_1000067A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(&OBJC_CLASS___TIWordTokenizer);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)v9)]);
        [*(id *)(a1 + 32) addContact:v10 toEntries:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) usingTokenizer:v4];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TIUserDictionaryServer sharedInstance](&OBJC_CLASS___TIUserDictionaryServer, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100006954;
  v14[3] = &unk_100014920;
  v14[4] = *(void *)(a1 + 32);
  __int128 v13 = *(_OWORD *)(a1 + 40);
  id v12 = (id)v13;
  __int128 v15 = v13;
  [v11 getPhraseShortcutPairs:v14];
}

void sub_100006954(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 count];
  if (v3)
  {
    unint64_t v4 = (unint64_t)v3;
    for (unint64_t i = 0LL; i < v4; i += 2LL)
    {
      id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:i]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:i + 1]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TILexiconEntry entryWithDocumentText:userInput:]( &OBJC_CLASS___TILexiconEntry,  "entryWithDocumentText:userInput:",  v7,  v8));
      [v6 addObject:v9];
    }
  }

  [*(id *)(a1 + 32) finishRequestWithEntries:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) completion:*(void *)(a1 + 40)];
}

void sub_1000070DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v13 = v5;
  if (v5)
  {
    id v7 = (objc_class *)objc_opt_class(v6);
    uint64_t v8 = NSStringFromClass(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    NSLog(@"%@: Account query failed with error: %@", v9, v13);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cond]);
    [v10 lock];

    [*(id *)(a1 + 32) setValid:0];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cond]);
    [v11 broadcast];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cond]);
    [v12 unlock];
  }

  else
  {
    [v6 searchAccounts:a2];
  }
}

void sub_100007B3C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___TYATypologyAccessServer);
  BOOL v2 = (void *)qword_10001E258;
  qword_10001E258 = (uint64_t)v1;
}

id TYALog()
{
  if (qword_10001E270 != -1) {
    dispatch_once(&qword_10001E270, &stru_1000149B0);
  }
  return (id)qword_10001E268;
}

void sub_1000081E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TextInput", "typologyAccess");
  BOOL v2 = (void *)qword_10001E268;
  qword_10001E268 = (uint64_t)v1;
}

void sub_100008358(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___TILinguisticAssetDownloadServer);
  BOOL v2 = (void *)qword_10001E278;
  qword_10001E278 = (uint64_t)v1;
}

void sub_1000083C0(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
  unint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.TextInput.linguistic-asset-download-server", v4);
  id v3 = (void *)qword_10001E288;
  qword_10001E288 = (uint64_t)v2;
}

uint64_t sub_100008488(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = 1;
  return result;
}

uint64_t sub_10000850C(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = 0;
  return result;
}

void sub_1000085E8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isStarted])
  {
    dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TIAssetManager sharedAssetManager](&OBJC_CLASS___TIAssetManager, "sharedAssetManager"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000086AC;
    v4[3] = &unk_100014A20;
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    [v2 requestAssetDownloadForLanguage:v3 completion:v4];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

uint64_t sub_1000086AC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

Class sub_100008964(uint64_t a1)
{
  if (!dlopen( (const char *)[@"/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices" UTF8String],  1))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v3 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"TIRemoteDataServer.m" lineNumber:238 description:@"Could not load AssistantServices.framework"];
  }

  Class result = objc_getClass("AFPreferences");
  qword_10001E2A8 = (uint64_t)result;
  return result;
}

void sub_100008A58(uint64_t a1)
{
  uint64_t v2 = objc_opt_new(*(void *)(a1 + 32));
  uint64_t v3 = (void *)qword_10001E2B0;
  qword_10001E2B0 = v2;
}

void sub_100009170(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (v3)
  {
    id v14 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CNContactVCardSerialization dataWithContacts:error:]( &OBJC_CLASS___CNContactVCardSerialization,  "dataWithContacts:error:",  v5,  0LL));
  }

  else
  {
    id v6 = 0LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TIRemoteDataServer sharedRemoteDataServer]( &OBJC_CLASS___TIRemoteDataServer,  "sharedRemoteDataServer"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dispatchQueue]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000092B4;
  v11[3] = &unk_100014A90;
  id v9 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  TIDispatchAsync(v8, v11);
}

uint64_t sub_1000092B4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_1000093D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TIRemoteDataServer sharedRemoteDataServer]( &OBJC_CLASS___TIRemoteDataServer,  "sharedRemoteDataServer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dispatchQueue]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100009490;
  v8[3] = &unk_100014A90;
  id v6 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  TIDispatchAsync(v5, v8);
}

uint64_t sub_100009490(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_1000094B0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = -[objc_class defaultWorkspace](NSClassFromString(@"LSApplicationWorkspace"), "defaultWorkspace");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));

  id v9 = 0LL;
  LOBYTE(v4) = [v6 openSensitiveURL:v7 withOptions:v3 error:&v9];

  id v8 = v9;
}

void sub_100009708(uint64_t a1)
{
  if (qword_10001E2C0)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    SInt32 error = 0;
    uint64_t v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationDetailsForType:*(void *)(a1 + 48)]);
    if (*(void *)(a1 + 48) == 2LL) {
      CFOptionFlags v3 = 35LL;
    }
    else {
      CFOptionFlags v3 = 0LL;
    }
    qword_10001E2C0 = (uint64_t)CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v3, &error, v2);
    id v4 = *(void (***)(void, void))(a1 + 40);
    qword_10001E2C8 = *(void *)(a1 + 48);
    if (error)
    {
      v4[2](v4, 0LL);
    }

    else
    {
      id v5 = [v4 copy];
      id v6 = (void *)qword_10001E298;
      qword_10001E298 = (uint64_t)v5;

      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( kCFAllocatorDefault,  (CFUserNotificationRef)qword_10001E2C0,  (CFUserNotificationCallBack)sub_100009854,  0LL);
      if (RunLoopSource)
      {
        id v8 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v8, kCFRunLoopCommonModes);
        CFRelease(v8);
      }

      else
      {
        (*(void (**)(uint64_t, void))(qword_10001E298 + 16))(qword_10001E298, 0LL);
        if (qword_10001E2C0)
        {
          CFUserNotificationCancel((CFUserNotificationRef)qword_10001E2C0);
          CFRelease((CFTypeRef)qword_10001E2C0);
          qword_10001E2C0 = 0LL;
        }
      }
    }
  }

void sub_100009854(uint64_t a1, uint64_t a2)
{
  if (qword_10001E2C0 != a1)
  {
    NSLog(@"Unexpected notification response received");
    return;
  }

  if (qword_10001E298)
  {
    if (a2) {
      goto LABEL_5;
    }
LABEL_17:
    uint64_t v3 = 2LL;
    goto LABEL_18;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void _HandleUserNotificationCallBack(CFUserNotificationRef, CFOptionFlags)"));
  [v5 handleFailureInFunction:v6 file:@"TIRemoteDataServer.m" lineNumber:150 description:@"Required completion handler is missing"];

  if (!a2) {
    goto LABEL_17;
  }
LABEL_5:
  if (a2 == 2)
  {
    uint64_t v3 = 3LL;
  }

  else if (a2 == 1)
  {
    if (qword_10001E2C8)
    {
      if (qword_10001E2C8 == 1)
      {
        sub_1000094B0(@"prefs:root=General&path=Keyboard/KEYBOARDS/AddNewKeyboard", 0LL);
        uint64_t v3 = 1LL;
      }

      else if (qword_10001E2C8 == 2)
      {
        uint64_t v3 = 3LL;
      }

      else
      {
        uint64_t v3 = 1LL;
      }
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10001E2A8 sharedPreferences]);
      uint64_t v3 = 1LL;
      [v4 setDictationIsEnabled:1];
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

LABEL_18:
  (*(void (**)(uint64_t, uint64_t))(qword_10001E298 + 16))(qword_10001E298, v3);
  if (qword_10001E2C0)
  {
    CFUserNotificationCancel((CFUserNotificationRef)qword_10001E2C0);
    CFRelease((CFTypeRef)qword_10001E2C0);
    qword_10001E2C0 = 0LL;
  }

  id v7 = (void *)qword_10001E298;
  qword_10001E298 = 0LL;
}

uint64_t sub_100009E8C(uint64_t a1)
{
  uint64_t v2 = (__CFUserNotification *)qword_10001E2C0;
  if (qword_10001E2C0)
  {
    if (!qword_10001E298)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void _DismissUserNotification(void)"));
      [v5 handleFailureInFunction:v6 file:@"TIRemoteDataServer.m" lineNumber:214 description:@"Required completion handler is missing"];

      uint64_t v2 = (__CFUserNotification *)qword_10001E2C0;
    }

    CFUserNotificationCancel(v2);
    CFRelease((CFTypeRef)qword_10001E2C0);
    qword_10001E2C0 = 0LL;
    (*(void (**)(uint64_t, void))(qword_10001E298 + 16))(qword_10001E298, 0LL);
    uint64_t v3 = (void *)qword_10001E298;
    qword_10001E298 = 0LL;
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000A024(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:TIKeyboardInputManagerDynamicDictionariesRemovedNotification object:*(void *)(a1 + 32)];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManager keyboardUserDirectory]( &OBJC_CLASS___TIKeyboardInputManager,  "keyboardUserDirectory"));
  +[TILanguageModelLoaderManager clearDynamicResourcesAtPath:]( &OBJC_CLASS___TILanguageModelLoaderManager,  "clearDynamicResourcesAtPath:",  v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TILanguageModelOfflineLearningAgent sharedLearningAgent]( &OBJC_CLASS___TILanguageModelOfflineLearningAgent,  "sharedLearningAgent"));
  [v4 handleRemovalOfLearnedModels];

  +[TIKeyboardInputManager resetResponseKit](&OBJC_CLASS___TIKeyboardInputManager, "resetResponseKit");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[EMFEmojiPreferencesService sharedServiceWithMachName:]( &OBJC_CLASS___EMFEmojiPreferencesService,  "sharedServiceWithMachName:",  0LL));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 preferences]);

  [v7 resetEmojiDefaults];
  [v7 writeEmojiDefaults];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"AppleEmojiKeyboardPreferencesChangedNotification",  0LL,  0LL,  1u);
  notify_post((const char *)[TIKeyboardInputManagerDynamicDictionariesRemovedDarwinNotificationName UTF8String]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000A6D0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TIEmojiAlternativesServer sharedInstance](&OBJC_CLASS___TIEmojiAlternativesServer, "sharedInstance"));
  [v2 updateForActiveLocaleIdentifiers:*(void *)(a1 + 32)];
}

void sub_10000A790(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TIEmojiAlternativesServer sharedInstance](&OBJC_CLASS___TIEmojiAlternativesServer, "sharedInstance"));
  [v2 updateKeyboardType:*(void *)(a1 + 40) appIdentifier:*(void *)(a1 + 32)];
}

void sub_10000A86C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TIEmojiAlternativesServer sharedInstance](&OBJC_CLASS___TIEmojiAlternativesServer, "sharedInstance"));
  [v2 alternativesForText:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

void *sub_10000A900(uint64_t a1)
{
  id v4 = 0LL;
  if (!qword_10001E2D8)
  {
    __int128 v5 = off_100014B50;
    uint64_t v6 = 0LL;
    qword_10001E2D8 = _sl_dlopen(&v5, &v4);
  }

  id v2 = (void *)qword_10001E2D8;
  if (!qword_10001E2D8) {
    sub_10000BAE4(&v4);
  }
  if (v4) {
    free(v4);
  }
  Class result = dlsym(v2, "AFDeviceHighestLanguageModelCapabilityIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  off_10001E2D0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_10000A9D8(uint64_t a1)
{
  uint64_t v3 = 0LL;
  if (!qword_10001E2E8)
  {
    __int128 v4 = off_100014B68;
    uint64_t v5 = 0LL;
    qword_10001E2E8 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_10001E2E8) {
    sub_10000BB60(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("OBBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_10000BBDC();
  }
  qword_10001E2E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

  ;
}

  ;
}

  ;
}

void sub_10000AAE4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AB18(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 relativePath]);
  sub_1000026FC();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to enumerate typology url at path=%@ (error=%@)",  v6,  0x16u);
}

void sub_10000ABC0(void *a1, os_log_s *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([a1 lastPathComponent]);
  [v3 UTF8String];
  sub_1000026FC();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to issue sandbox extension for typology url with name %{private}s",  v4,  0xCu);
}

void sub_10000AC58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AC8C()
{
}

void sub_10000ACEC()
{
}

void sub_10000AD4C()
{
}

void sub_10000ADAC()
{
}

void sub_10000ADD8()
{
}

void sub_10000AE04()
{
}

void sub_10000AE30( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AE94( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AEF8()
{
}

void sub_10000AF24( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AF8C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Could not read entitlement: %@",  "-[TIAutofillServer checkEntitlementForAddEntryStringWithAuditToken:]",  *a1));
  *(_DWORD *)buf = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void sub_10000B044()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Manually saving language models"));
  sub_100004ECC((void *)&_mh_execute_header, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"main_block_invoke", v7, 2u);

  sub_100004EE0();
}

void sub_10000B0DC(uint64_t a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Couldn't create keyboard user directory: %@"));
  sub_100004ECC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"main_block_invoke", a1, 2u);

  sub_100004EE0();
}

void sub_10000B178(void *a1)
{
  id v8 = [a1 processIdentifier];
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Allowing connection from pid %d to kbd accessibility server"));
  sub_100004ECC( (void *)&_mh_execute_header,  v2,  v3,  "%@",  v4,  v5,  v6,  v7,  (uint64_t)"-[TIAccessibilityServer listener:shouldAcceptNewConnection:]",  (uint64_t)v8,  2u);

  sub_100004EE0();
}

void sub_10000B218(void *a1)
{
  id v8 = [a1 processIdentifier];
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s process %d tried to connect to the kbd accessibility server, but it was not entitled!"));
  sub_100004ECC( (void *)&_mh_execute_header,  v2,  v3,  "%@",  v4,  v5,  v6,  v7,  (uint64_t)"-[TIAccessibilityServer listener:shouldAcceptNewConnection:]",  (uint64_t)v8,  2u);

  sub_100004EE0();
}

void sub_10000B2B8(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Could not read entitlement: %@",  "-[TILexiconDataHandler checkEntitlementForAddEntryStringWithAuditToken:]",  *a1));
  *(_DWORD *)buf = 138412290;
  int v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void sub_10000B370(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to acccept new connection: client does not have entitlement.",  v1,  2u);
}

void sub_10000B3B0(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not read entitlement: %@",  (uint8_t *)&v3,  0xCu);
}

void sub_10000B428(void *a1)
{
  id v8 = [a1 processIdentifier];
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Establishing connection with PID %d"));
  sub_10000AAB4();
  sub_100004ECC( (void *)&_mh_execute_header,  v2,  v3,  "%@",  v4,  v5,  v6,  v7,  (uint64_t)"-[TIRemoteDataServer listener:shouldAcceptNewConnection:]",  (uint64_t)v8,  v9);

  sub_100004EE0();
}

void sub_10000B4C4(uint64_t *a1)
{
  uint64_t v8 = *a1;
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Could not read entitlement: %@"));
  sub_10000AAB4();
  sub_100004ECC( (void *)&_mh_execute_header,  v2,  v3,  "%@",  v4,  v5,  v6,  v7,  (uint64_t)"+[TIRemoteDataHandle shouldAcceptRequestForMeCardWithAuditToken:]",  v8,  v9);

  sub_100004EE0();
}

void sub_10000B560()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v8 = [v0 processIdentifier];
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Rejecting request for me card from PID %d"));
  sub_10000AAB4();
  sub_100004ECC( (void *)&_mh_execute_header,  v2,  v3,  "%@",  v4,  v5,  v6,  v7,  (uint64_t)"-[TIRemoteDataHandle requestMeCardWithCompletionHandler:]",  (uint64_t)v8,  v9);

  sub_10000AAC0();
}

void sub_10000B618()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v8 = [v0 processIdentifier];
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Rejecting request for me card from PID %d"));
  sub_10000AAB4();
  sub_100004ECC( (void *)&_mh_execute_header,  v2,  v3,  "%@",  v4,  v5,  v6,  v7,  (uint64_t)"-[TIRemoteDataHandle requestMeContactWithCompletionHandler:]",  (uint64_t)v8,  v9);

  sub_10000AAC0();
}

void sub_10000B6D0()
{
  v0[0] = 136315394;
  sub_10000AAD0();
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s  Unable to launch Keyboard Settings (error: %@)",  (uint8_t *)v0,  0x16u);
}

void sub_10000B754()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSInteger _AFDeviceHighestLanguageModelCapabilityIdentifier(void)"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"TIRemoteDataServer.m",  48,  @"%s",  dlerror());

  __break(1u);
}

void sub_10000B7C8()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Received request to delete all learned keyboard dictionaries."));
  sub_10000AAB4();
  sub_100004ECC( (void *)&_mh_execute_header,  v1,  v2,  "%@",  v3,  v4,  v5,  v6,  (uint64_t)"-[TIRemoteDataHandle removeAllDynamicDictionariesWithCompletionHandler:]",  v7,  v8);

  sub_100004EE0();
}

void sub_10000B85C(char a1, uint64_t a2, os_log_s *a3)
{
  int v4 = "NO";
  if ((a1 & 1) != 0) {
    int v4 = "YES";
  }
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Responding with isExempt = %s for string %@",  "-[TIRemoteDataHandle string:isExemptFromTextCheckerWithCompletionHandler:]",  v4,  a2));
  *(_DWORD *)buf = 138412290;
  uint64_t v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void sub_10000B92C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Reading UITextChecker local dictionary"));
  sub_10000AAB4();
  sub_100004ECC( (void *)&_mh_execute_header,  v1,  v2,  "%@",  v3,  v4,  v5,  v6,  (uint64_t)"-[TIRemoteDataHandle requestTextCheckerLocalDictionaryWithCompletionHandler:]",  v7,  v8);

  sub_100004EE0();
}

void sub_10000B9C0(uint64_t a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s Appending %@ to UITextChecker local dictionary"));
  sub_10000AAB4();
  sub_100004ECC( (void *)&_mh_execute_header,  v2,  v3,  "%@",  v4,  v5,  v6,  v7,  (uint64_t)"-[TIRemoteDataHandle appendWordToTextCheckerLocalDictionary:]",  a1,  v9);

  sub_100004EE0();
}

void sub_10000BA58()
{
  v2[0] = 136315650;
  sub_10000AAD0();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s  Called ingestion pipeline for parsed phrases for inline completions personalization with:\n sentence: %@ \n for language: %@",  (uint8_t *)v2,  0x20u);
}

void sub_10000BAE4(void *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *AssistantServicesLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"TIRemoteDataServer.m",  47,  @"%s",  *a1);

  __break(1u);
}

void sub_10000BB60(void *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *OnBoardingKitLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"TIRemoteDataServer.m",  53,  @"%s",  *a1);

  __break(1u);
}

void sub_10000BBDC()
{
  __int16 v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getOBBundleClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"TIRemoteDataServer.m",  54,  @"Unable to find class %s",  "OBBundle");

  __break(1u);
  CFBooleanGetTypeID();
}

id objc_msgSend_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLinguisticAssetsAssertionForLanguage:assertionID:region:clientID:withHandler:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}