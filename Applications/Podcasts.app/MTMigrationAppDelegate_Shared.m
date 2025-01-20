@interface MTMigrationAppDelegate_Shared
+ (Class)appDelegateClass;
+ (void)destroyAndRebuildDatabase;
+ (void)moveSourceFile:(id)a3 toPath:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)didBecomeActiveWhileMigrating;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMigrating;
- (BOOL)respondsToSelector:(SEL)a3;
- (MTAppDelegateProtocol)appDelegate;
- (MTMigrationAppDelegate_Shared)init;
- (NSMutableArray)queuedInvocations;
- (UIWindow)window;
- (id)createWindowWithScene:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (int64_t)alertControllerStyleForInterfaceIdiom;
- (unint64_t)processAssertion;
- (void)applicationDidBecomeActive:(id)a3;
- (void)finishMigration;
- (void)flushInvocations;
- (void)forwardInvocation:(id)a3;
- (void)performIncompatibleDBDialogAction;
- (void)setAppDelegate:(id)a3;
- (void)setDidBecomeActiveWhileMigrating:(BOOL)a3;
- (void)setIsMigrating:(BOOL)a3;
- (void)setProcessAssertion:(unint64_t)a3;
- (void)setQueuedInvocations:(id)a3;
- (void)setWindow:(id)a3;
- (void)showIncompatibleDBDialog;
- (void)willConnectScene;
@end

@implementation MTMigrationAppDelegate_Shared

- (MTMigrationAppDelegate_Shared)init
{
  if (self)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[MTMigrationAppDelegate_Shared setQueuedInvocations:](self, "setQueuedInvocations:", v3);
  }

  return self;
}

+ (Class)appDelegateClass
{
  return 0LL;
}

- (MTAppDelegateProtocol)appDelegate
{
  appDelegate = self->_appDelegate;
  if (!appDelegate)
  {
    v4 = (MTAppDelegateProtocol *)objc_alloc_init((Class)[(id)objc_opt_class(self) appDelegateClass]);
    v5 = self->_appDelegate;
    self->_appDelegate = v4;

    appDelegate = self->_appDelegate;
  }

  return appDelegate;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v6 = a3;
  -[MTMigrationAppDelegate_Shared setDidBecomeActiveWhileMigrating:](self, "setDidBecomeActiveWhileMigrating:", 1LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTMigrationAppDelegate_Shared methodSignatureForSelector:]( self,  "methodSignatureForSelector:",  "applicationDidBecomeActive:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v4));
  [v5 setSelector:"applicationDidBecomeActive:"];
  [v5 setArgument:&v6 atIndex:2];
  -[MTMigrationAppDelegate_Shared forwardInvocation:](self, "forwardInvocation:", v5);
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v33 = a3;
  id v32 = a4;
  v34[0] = @"current_data_version";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[MTDB libraryDataVersion](&OBJC_CLASS___MTDB, "libraryDataVersion")));
  v35[0] = v6;
  v34[1] = @"current_core_data_version";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[MTDB coreDataVersion](&OBJC_CLASS___MTDB, "coreDataVersion")));
  v35[1] = v7;
  v35[2] = &off_100254758;
  v34[2] = @"new_data_version";
  v34[3] = @"new_core_data_version";
  v35[3] = &off_100254770;
  v34[4] = @"has_corrupt_db";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[MTDB isCorrupt](&OBJC_CLASS___MTDB, "isCorrupt")));
  v35[4] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  5LL));
  +[IMMetrics recordUserAction:dataSource:withData:]( &OBJC_CLASS___IMMetrics,  "recordUserAction:dataSource:withData:",  @"migration",  0LL,  v9);

  +[IMMetrics startTimer:](&OBJC_CLASS___IMMetrics, "startTimer:", @"migration");
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v11 = +[MTDB libraryDataVersion](&OBJC_CLASS___MTDB, "libraryDataVersion");
  id v12 = +[MTDB coreDataVersion](&OBJC_CLASS___MTDB, "coreDataVersion");
  LOBYTE(v9) = +[MTDB isCorrupt](&OBJC_CLASS___MTDB, "isCorrupt");
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  v14 = (char *)[v13 integerForKey:@"migrationAttemptCount"];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  [v15 setInteger:v14 + 1 forKey:@"migrationAttemptCount"];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100053F04;
  v29[3] = &unk_100240240;
  id v30 = v33;
  v31 = self;
  -[MTMigrationAppDelegate_Shared setProcessAssertion:]( self,  "setProcessAssertion:",  [v30 beginBackgroundTaskWithName:@"Database migration" expirationHandler:v29]);
  -[MTMigrationAppDelegate_Shared setIsMigrating:](self, "setIsMigrating:", 1LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[MTMigrationAppDelegate_Shared methodSignatureForSelector:]( self,  "methodSignatureForSelector:",  "application:willFinishLaunchingWithOptions:"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v16));
  [v17 setSelector:"application:willFinishLaunchingWithOptions:"];
  [v17 setArgument:&v33 atIndex:2];
  [v17 setArgument:&v32 atIndex:3];
  -[MTMigrationAppDelegate_Shared forwardInvocation:](self, "forwardInvocation:", v17);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053F80;
  block[3] = &unk_100241F68;
  block[4] = self;
  block[5] = v10;
  block[6] = v11;
  block[7] = 70LL;
  block[8] = v12;
  block[9] = 142LL;
  char v28 = (char)v9;
  dispatch_async(v19, block);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  char v21 = objc_opt_respondsToSelector(v20, "createWindowWithScene:");
  if ((v21 & 1) != 0)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    if ((objc_opt_respondsToSelector(v11, "willConnectScene") & 1) != 0)
    {

LABEL_8:
      goto LABEL_9;
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  char v23 = objc_opt_respondsToSelector(v22, "createWindowForApplication:");

  if ((v21 & 1) != 0) {
  if ((v23 & 1) != 0)
  }
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 createWindowForApplication:v33]);
    -[MTMigrationAppDelegate_Shared setWindow:](self, "setWindow:", v25);

    -[MTMigrationAppDelegate_Shared willConnectScene](self, "willConnectScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared window](self, "window"));
    [v20 makeKeyAndVisible];
    goto LABEL_8;
  }

- (void)willConnectScene
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared window](self, "window"));
  v2 = objc_opt_new(&OBJC_CLASS___MTSplashViewController);
  [v3 setRootViewController:v2];
}

- (id)createWindowWithScene:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 createWindowWithScene:v4]);

  return v6;
}

- (void)showIncompatibleDBDialog
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  unsigned int v4 = [v3 isLibrarySyncEnabled];

  v5 = @"INCOMPATIBLE_DB_BUTTON_WITHOUT_SYNC";
  if (v4)
  {
    v5 = @"INCOMPATIBLE_DB_BUTTON_WITH_SYNC";
    id v6 = @"INCOMPATIBLE_DB_MESSAGE_WITH_SYNC";
  }

  else
  {
    id v6 = @"INCOMPATIBLE_DB_MESSAGE_WITHOUT_SYNC";
  }

  int64_t v7 = -[MTMigrationAppDelegate_Shared alertControllerStyleForInterfaceIdiom]( self,  "alertControllerStyleForInterfaceIdiom",  v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"INCOMPATIBLE_DB_TITLE" value:&stru_100248948 table:0]);
  __uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:v6 value:&stru_100248948 table:0]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  v11,  v7));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:v17 value:&stru_100248948 table:0]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100054704;
  v18[3] = &unk_100241F90;
  v18[4] = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  0LL,  v18));
  [v12 addAction:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController mt_rootViewController](&OBJC_CLASS___UIViewController, "mt_rootViewController"));
  [v16 presentViewController:v12 animated:1 completion:0];
}

- (int64_t)alertControllerStyleForInterfaceIdiom
{
  return 0LL;
}

- (void)performIncompatibleDBDialogAction
{
}

- (void)finishMigration
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 setDelegate:v3];

  -[MTMigrationAppDelegate_Shared flushInvocations](self, "flushInvocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  if ((objc_opt_respondsToSelector(v5, "createWindowWithScene:") & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    char v7 = objc_opt_respondsToSelector(v6, "willConnectScene");

    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared window](self, "window"));
    __uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 windowScene]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 createWindowWithScene:v10]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    [v12 setWindow:v11];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    [v13 willConnectScene];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
    [v14 makeKeyAndVisible];
  }

LABEL_5:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared window](self, "window"));
  [v15 setHidden:1];

  -[MTMigrationAppDelegate_Shared setWindow:](self, "setWindow:", 0LL);
  if (-[MTMigrationAppDelegate_Shared processAssertion](self, "processAssertion"))
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    objc_msgSend(v16, "endBackgroundTask:", -[MTMigrationAppDelegate_Shared processAssertion](self, "processAssertion"));
  }

- (void)forwardInvocation:(id)a3
{
  id v6 = a3;
  if (-[MTMigrationAppDelegate_Shared isMigrating](self, "isMigrating"))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared queuedInvocations](self, "queuedInvocations"));
    objc_sync_enter(v4);
    [v6 retainArguments];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared queuedInvocations](self, "queuedInvocations"));
    [v5 addObject:v6];

    objc_sync_exit(v4);
  }

  else
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
    [v6 invokeWithTarget:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 methodSignatureForSelector:a3]);

  return v5;
}

- (void)flushInvocations
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared queuedInvocations](self, "queuedInvocations"));
  objc_sync_enter(v3);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared queuedInvocations](self, "queuedInvocations", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      char v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
        [v8 invokeWithTarget:v9];

        char v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  objc_sync_exit(v3);
}

- (BOOL)isKindOfClass:(Class)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  LOBYTE(a3) = objc_opt_isKindOfClass(v4, a3);

  return a3 & 1;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  LOBYTE(a3) = objc_opt_respondsToSelector(v4, a3);

  return a3 & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMigrationAppDelegate_Shared appDelegate](self, "appDelegate"));
  unsigned __int8 v6 = [v5 conformsToProtocol:v4];

  return v6;
}

+ (void)destroyAndRebuildDatabase
{
  uint64_t v3 = _MTLogCategoryDatabase(a1);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Rebuilding library database", buf, 2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", @"yyyy-MM-dd-hh:mm:ss");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"backup_%@", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](&OBJC_CLASS___MTConstants, "sharedDocumentsDirectory"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v8]);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:0];

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryPath](&OBJC_CLASS___MTDB, "libraryPath"));
  [a1 moveSourceFile:v12 toPath:v10];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryShmPath](&OBJC_CLASS___MTDB, "libraryShmPath"));
  [a1 moveSourceFile:v13 toPath:v10];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryWalPath](&OBJC_CLASS___MTDB, "libraryWalPath"));
  [a1 moveSourceFile:v14 toPath:v10];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SyncControllerFactory resolvedSyncController]( &OBJC_CLASS____TtC8Podcasts21SyncControllerFactory,  "resolvedSyncController"));
  [v15 resetMetadataToInitialState];

  +[MTDB setCorrupt:](&OBJC_CLASS___MTDB, "setCorrupt:", 0LL);
  +[MTLibraryMigrator needsMigration](&OBJC_CLASS___MTLibraryMigrator, "needsMigration");
}

+ (void)moveSourceFile:(id)a3 toPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v9]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v8 moveItemAtURL:v6 toURL:v7 error:0];
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)isMigrating
{
  return self->_isMigrating;
}

- (void)setIsMigrating:(BOOL)a3
{
  self->_isMigrating = a3;
}

- (void)setAppDelegate:(id)a3
{
}

- (NSMutableArray)queuedInvocations
{
  return self->_queuedInvocations;
}

- (void)setQueuedInvocations:(id)a3
{
}

- (unint64_t)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(unint64_t)a3
{
  self->_processAssertion = a3;
}

- (BOOL)didBecomeActiveWhileMigrating
{
  return self->_didBecomeActiveWhileMigrating;
}

- (void)setDidBecomeActiveWhileMigrating:(BOOL)a3
{
  self->_didBecomeActiveWhileMigrating = a3;
}

- (void).cxx_destruct
{
}

@end