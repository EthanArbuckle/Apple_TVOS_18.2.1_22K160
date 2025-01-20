@interface TILexiconDataHandler
- (BOOL)checkEntitlementForAddEntryStringWithAuditToken:(id *)a3;
- (BOOL)validateBundlePath:(id)a3;
- (NSString)bundleID;
- (void)addContact:(id)a3 toEntries:(id)a4 usingTokenizer:(id)a5;
- (void)addEntryString:(id)a3 forRecentInputIdentifier:(id)a4;
- (void)finishRequestWithEntries:(id)a3 completion:(id)a4;
- (void)requestLexiconForRecentInputIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestLexiconFromBundlePath:(id)a3 completionHandler:(id)a4;
- (void)requestRemovalOfLexiconForRecentInputIdentifier:(id)a3;
- (void)setBundleID:(id)a3;
@end

@implementation TILexiconDataHandler

- (BOOL)validateBundlePath:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", a3));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]),
        unsigned int v8 = [v7 isEqualToString:self->_bundleID],
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 infoDictionary]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"CFBundlePackageType"]);

    if ([v10 isEqualToString:@"XPC!"])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 infoDictionary]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"NSExtension"]);

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"NSExtensionPointIdentifier"]);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
          unsigned __int8 v16 = [v14 isEqualToString:@"com.apple.keyboard-service"];
        }
        else {
          unsigned __int8 v16 = 0;
        }
      }

      else
      {
        unsigned __int8 v16 = 0;
      }
    }

    else
    {
      unsigned __int8 v16 = 0;
    }
  }

  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (void)finishRequestWithEntries:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    v11 = v5;
    id v6 = [a3 mutableCopy];
    id v7 = [v6 count];
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7;
      uint64_t v9 = 0LL;
      do
      {
        [v6 exchangeObjectAtIndex:v9 withObjectAtIndex:arc4random() % v8 + v9];
        ++v9;
        --v8;
      }

      while (v8);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TILexicon lexiconWithEntries:](&OBJC_CLASS___TILexicon, "lexiconWithEntries:", v6));
    v11[2](v11, v10);

    uint64_t v5 = v11;
  }
}

- (void)addContact:(id)a3 toEntries:(id)a4 usingTokenizer:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a3 flatten]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([v8 allTokensForString:*(void *)(*((void *)&v17 + 1) + 8 * (void)v13)]);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_100006624;
        v15[3] = &unk_1000148F8;
        id v16 = v7;
        [v14 enumerateObjectsUsingBlock:v15];

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

- (void)requestLexiconFromBundlePath:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (-[TILexiconDataHandler validateBundlePath:](self, "validateBundlePath:", a3))
  {
    v11[0] = 0LL;
    v11[1] = v11;
    v11[2] = 0x3032000000LL;
    v11[3] = sub_100006788;
    v11[4] = sub_100006798;
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TITransientLexiconManager sharedInstance]( &OBJC_CLASS___TITransientLexiconManager,  "sharedInstance"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000067A0;
    v8[3] = &unk_100014948;
    v8[4] = self;
    id v10 = v11;
    id v9 = v6;
    [v7 getOnce:v8];

    _Block_object_dispose(v11, 8);
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (void)requestLexiconForRecentInputIdentifier:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  uint64_t v5 = (void (**)(id, void *))a4;
  if ((+[TIRecentInputs identifierIsSystemIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "identifierIsSystemIdentifier:",  v8) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManager recentsFilePathForIdentifier:]( &OBJC_CLASS___TIKeyboardInputManager,  "recentsFilePathForIdentifier:",  v8));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TIRecentInputs recentInputAtPath:](&OBJC_CLASS___TIRecentInputs, "recentInputAtPath:", v6));

    v5[2](v5, v7);
  }

  else
  {
    v5[2](v5, 0LL);
  }
}

- (void)requestRemovalOfLexiconForRecentInputIdentifier:(id)a3
{
  id v5 = a3;
  if (+[TIRecentInputs identifierIsSystemIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "identifierIsSystemIdentifier:"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManager recentsFilePathForIdentifier:]( &OBJC_CLASS___TIKeyboardInputManager,  "recentsFilePathForIdentifier:",  v5));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v4 removeItemAtPath:v3 error:0];
  }
}

- (BOOL)checkEntitlementForAddEntryStringWithAuditToken:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0LL, &cf);
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  *(void *)cf.val = 0LL;
  id v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement( v4,  @"com.apple.TextInput.lexicon-source",  (CFErrorRef *)&cf);
  if (v6)
  {
    id v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }

  else
  {
    if (*(void *)cf.val)
    {
      if (TICanLogMessageAtLevel(0LL))
      {
        uint64_t v10 = TIOSLogFacility();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_10000B2B8(&cf, v11);
        }
      }

      CFRelease(*(CFTypeRef *)cf.val);
    }

    BOOL v9 = 0;
  }

  CFRelease(v5);
  return v9;
}

- (void)addEntryString:(id)a3 forRecentInputIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[TIRecentInputs identifierIsSystemIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "identifierIsSystemIdentifier:",  v7))
  {
    CFTypeID v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    BOOL v9 = v8;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    unsigned int v10 = -[TILexiconDataHandler checkEntitlementForAddEntryStringWithAuditToken:]( self,  "checkEntitlementForAddEntryStringWithAuditToken:",  v12);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManager recentsFilePathForIdentifier:]( &OBJC_CLASS___TIKeyboardInputManager,  "recentsFilePathForIdentifier:",  v7));
      +[TIRecentInputs storeInput:forSystemIdentifier:atPath:]( &OBJC_CLASS___TIRecentInputs,  "storeInput:forSystemIdentifier:atPath:",  v6,  v7,  v11);
    }
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end