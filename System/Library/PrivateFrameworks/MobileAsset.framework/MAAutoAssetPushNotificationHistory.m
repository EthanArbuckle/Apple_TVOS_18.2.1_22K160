@interface MAAutoAssetPushNotificationHistory
+ (id)sharedInstance;
- (BOOL)_loadHistoryWithError:(id *)a3;
- (BOOL)addNotificationsToHistory:(id)a3 withError:(id *)a4;
- (BOOL)clearHistoryWithError:(id *)a3;
- (MAAutoAssetPushNotificationHistory)init;
- (NSArray)notificationHistory;
- (id)_historyURL;
- (void)setNotificationHistory:(id)a3;
@end

@implementation MAAutoAssetPushNotificationHistory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  return (id)sharedInstance_singleton;
}

void __52__MAAutoAssetPushNotificationHistory_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetPushNotificationHistory);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;
}

- (MAAutoAssetPushNotificationHistory)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MAAutoAssetPushNotificationHistory;
  v2 = -[MAAutoAssetPushNotificationHistory init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    id v11 = 0LL;
    -[MAAutoAssetPushNotificationHistory _loadHistoryWithError:](v2, "_loadHistoryWithError:", &v11);
    id v4 = v11;
    v9 = v4;
    if (v4) {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAAutoAssetPushNotificationHistory init]",  @"Error loading history: %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
    }
  }

  return v3;
}

- (NSArray)notificationHistory
{
  return self->_notificationHistory;
}

- (id)_historyURL
{
  v2 = (void *)MEMORY[0x189604030];
  getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/persisted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByAppendingPathComponent:@"PushNotificationManager"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByAppendingPathComponent:@"pushnotificationhistory.plist"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 fileURLWithPath:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_loadHistoryWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 path];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v5 fileExistsAtPath:v7];

  if (v8)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]",  @"Reading pushnotificationhistory.plist file",  v9,  v10,  v11,  v12,  v34);
    v13 = (void *)MEMORY[0x189603F18];
    v14 = -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
    [v13 arrayWithContentsOfURL:v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetPushNotificationHistory setNotificationHistory:](self, "setNotificationHistory:", v15);

LABEL_3:
    LOBYTE(v16) = 0;
    goto LABEL_9;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]",  @"pushnotificationhistory.plist file does not exist, create it",  v9,  v10,  v11,  v12,  v34);
  getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/persisted");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringByAppendingPathComponent:@"PushNotificationManager"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  char v35 = 0;
  if (([v5 fileExistsAtPath:v14 isDirectory:&v35] & 1) == 0)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]",  @"%@ doesn't exist, create it",  v18,  v19,  v20,  v21,  (uint64_t)v14);
    if (([v5 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:a3] & 1) == 0)
    {
      if (a3) {
        v33 = (const __CFString *)*a3;
      }
      else {
        v33 = @"no error";
      }
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]",  @"Error creating directory: %@",  v22,  v23,  v24,  v25,  (uint64_t)v33);
      goto LABEL_3;
    }
  }
  v26 = -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
  int v16 = [MEMORY[0x189604A58] writeToURL:v26 error:a3];

  v31 = @"failure";
  if (v16) {
    v31 = @"success";
  }
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]",  @"Created pushnotificationhistory.plist with result %@",  v27,  v28,  v29,  v30,  (uint64_t)v31);

LABEL_9:
  return v16;
}

- (BOOL)addNotificationsToHistory:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MAAutoAssetPushNotificationHistory _loadHistoryWithError:](self, "_loadHistoryWithError:", a4);
  -[MAAutoAssetPushNotificationHistory notificationHistory](self, "notificationHistory");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = (void *)[v7 mutableCopy];

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v13) historyRepresentation];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v14];

        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }
  v15 = -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
  char v16 = [v8 writeToURL:v15 error:a4];

  if ((v16 & 1) == 0) {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAAutoAssetPushNotificationHistory addNotificationsToHistory:withError:]",  @"Error writing notifications to history: %@",  v17,  v18,  v19,  v20,  (uint64_t)*a4);
  }

  return v16;
}

- (BOOL)clearHistoryWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [MEMORY[0x189604A58] writeToURL:v4 error:a3];

  return (char)a3;
}

- (void)setNotificationHistory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end