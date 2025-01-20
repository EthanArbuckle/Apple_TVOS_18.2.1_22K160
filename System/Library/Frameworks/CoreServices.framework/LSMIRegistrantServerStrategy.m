@interface LSMIRegistrantServerStrategy
- (id)notificationJournallerForBundleIdentifier:(id)a3 registeringPlaceholder:(BOOL)a4;
- (id)preUnregistrationContextForBundleIdentifier:(id)a3;
- (void)runSyncBlockInWriteContext:(id)a3;
@end

@implementation LSMIRegistrantServerStrategy

- (id)preUnregistrationContextForBundleIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  v4 = +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  v9[0] = v3;
  [MEMORY[0x189603F18] arrayWithObjects:v9 count:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 _prepareApplicationProxiesForNotification:0 identifiers:v5 withPlugins:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 firstObject];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)runSyncBlockInWriteContext:(id)a3
{
  id v3 = a3;
  v4 = +[LSDBExecutionContext sharedServerInstance]();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __59__LSMIRegistrantServerStrategy_runSyncBlockInWriteContext___block_invoke;
  v6[3] = &unk_189D73FA8;
  id v5 = v3;
  id v7 = v5;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v4, v6);
}

void __59__LSMIRegistrantServerStrategy_runSyncBlockInWriteContext___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___LSMIResultRegistrantServerDatabaseContextProviding);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)notificationJournallerForBundleIdentifier:(id)a3 registeringPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = -[_LSRegistrationNotificationJournaller initWithPrimaryBundleID:placeholder:]( objc_alloc(&OBJC_CLASS____LSRegistrationNotificationJournaller),  "initWithPrimaryBundleID:placeholder:",  v5,  v4);

  return v6;
}

@end