@interface TVSettingsSiriAccessFacade
+ (id)sharedInstance;
- (BOOL)setAllowAccess:(BOOL)a3 forInfo:(id)a4;
- (id)fetchEnabledAppIds;
- (id)fetchInfoMapping;
@end

@implementation TVSettingsSiriAccessFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A36D8;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1A08 != -1) {
    dispatch_once(&qword_1001E1A08, block);
  }
  return (id)qword_1001E1A00;
}

- (id)fetchInfoMapping
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A37E0;
  v9[3] = &unk_100192FF0;
  v9[4] = self;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v10 = v4;
  dispatch_semaphore_t v11 = v3;
  v5 = v3;
  +[NSExtension _intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion:]( &OBJC_CLASS___NSExtension,  "_intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion:",  v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v6 = v11;
  v7 = v4;

  return v7;
}

- (id)fetchEnabledAppIds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = (id)TCCAccessCopyInformation(kTCCServiceSiri);
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v9 = (__CFBundle *)objc_msgSend(v8, "objectForKey:", kTCCInfoBundle, (void)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kTCCInfoGranted]);
        if ([v10 BOOLValue])
        {
          CFStringRef Identifier = CFBundleGetIdentifier(v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue(Identifier);
          [v2 addObject:v12];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }

  return v2;
}

- (BOOL)setAllowAccess:(BOOL)a3 forInfo:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsSiriAccessFacade;
  BOOL v4 = -[TVSettingsTCCFacade setAllowAccess:forInfo:](&v6, "setAllowAccess:forInfo:", a3, a4);
  if (v4) {
    notify_post("com.apple.assistant.siri_settings_did_change");
  }
  return v4;
}

@end