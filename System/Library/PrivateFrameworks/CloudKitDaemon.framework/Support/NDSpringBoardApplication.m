@interface NDSpringBoardApplication
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)isForeground;
- (NDSpringBoardApplication)containingApplication;
- (NDSpringBoardApplication)initWithOperationID:(id)a3;
- (void)addObserver:(id)a3;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setContainingApplication:(id)a3;
@end

@implementation NDSpringBoardApplication

- (NDSpringBoardApplication)initWithOperationID:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  v3 = -[NDApplication initWithOperationID:](&v16, "initWithOperationID:", a3);
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord);
    bundleIdentifier = v3->super._bundleIdentifier;
    id v15 = 0LL;
    id v6 = [v4 initWithBundleIdentifier:bundleIdentifier error:&v15];
    id v7 = v15;
    if (v7)
    {
      if (ck_log_initialization_predicate != -1LL) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v8 = (os_log_s *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v9 = v3->super._bundleIdentifier;
        *(_DWORD *)buf = 138412546;
        v18 = v9;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Bundle ID %@ doesn't belong to an extension: %@",  buf,  0x16u);
      }
    }

    else if (v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 containingBundleRecord]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);

      if (v11)
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NDApplication springboardApplicationWithBundleIdentifier:]( &OBJC_CLASS___NDApplication,  "springboardApplicationWithBundleIdentifier:",  v11));
        containingApplication = v3->_containingApplication;
        v3->_containingApplication = (NDSpringBoardApplication *)v12;
      }
    }
  }

  return v3;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 1;
}

- (BOOL)isForeground
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = [v3 applicationIsForeground:self->super._bundleIdentifier];

  return (char)self;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    [v6 startMonitoringBundleID:v5->super._bundleIdentifier];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    [v7 addObserver:v5 forApplication:v5->super._bundleIdentifier];
  }

  v8.receiver = v5;
  v8.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication addObserver:](&v8, "addObserver:", v4);
  objc_sync_exit(v5);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication removeObserver:](&v8, "removeObserver:", v4);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    [v6 removeObserver:v5 forApplication:v5->super._bundleIdentifier];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    [v7 stopMonitoringBundleID:v5->super._bundleIdentifier];
  }

  objc_sync_exit(v5);
}

- (void)applicationEnteredForeground:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:]( &v3,  "invokeSelectorForAllObservers:",  "applicationEnteredForeground:");
}

- (void)applicationNoLongerInForeground:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:]( &v3,  "invokeSelectorForAllObservers:",  "applicationNoLongerInForeground:");
}

- (NDSpringBoardApplication)containingApplication
{
  return self->_containingApplication;
}

- (void)setContainingApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end