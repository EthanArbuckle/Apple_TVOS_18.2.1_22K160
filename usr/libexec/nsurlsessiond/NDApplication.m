@interface NDApplication
+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3;
+ (NDApplication)applicationWithIdentifier:(id)a3;
+ (id)springboardApplicationWithBundleIdentifier:(id)a3;
+ (void)initialize;
- (BOOL)backgroundUpdatesEnabled;
- (BOOL)canBeSuspended;
- (BOOL)hasBackgroundTaskCompletion;
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)isForeground;
- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4;
- (BOOL)isInTransitionalDiscretionaryPeriod;
- (BOOL)maySupportWakesLater;
- (BOOL)shouldElevateDiscretionaryPriority;
- (BOOL)supportsWakes;
- (BOOL)usesContainerManagerForAVAsset;
- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5;
- (NDApplication)initWithIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (double)currentRequestDelay;
- (id)containerURL;
- (void)_onqueue_resetRequestDelay;
- (void)addObserver:(id)a3;
- (void)invokeSelectorForAllObservers:(SEL)a3;
- (void)invokeSelectorForAllObservers:(SEL)a3 pid:(int)a4;
- (void)removeObserver:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCurrentRequestDelay:(double)a3;
- (void)setIsInTransitionalDiscretionaryPeriod:(BOOL)a3;
@end

@implementation NDApplication

- (NDApplication)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NDApplication;
  v6 = -[NDApplication init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    observers = v7->_observers;
    v7->_observers = (NSMutableArray *)v8;

    v7->isInTransitionalDiscretionaryPeriod = 0;
  }

  return v7;
}

- (id)containerURL
{
  return 0LL;
}

- (BOOL)usesContainerManagerForAVAsset
{
  return 1;
}

- (BOOL)supportsWakes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NDUserEventAgentConnection sharedUserEventAgentConnection]( &OBJC_CLASS___NDUserEventAgentConnection,  "sharedUserEventAgentConnection"));
  LOBYTE(self) = [v3 canLaunchProcessWithIdentifier:self->_bundleIdentifier];

  return (char)self;
}

- (BOOL)maySupportWakesLater
{
  uint64_t v2 = objc_opt_class(self);
  return v2 == objc_opt_class(&OBJC_CLASS___NDApplication);
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  id v6 = a3;
  v7 = self->_bundleIdentifier;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NDUserEventAgentConnection sharedUserEventAgentConnection]( &OBJC_CLASS___NDUserEventAgentConnection,  "sharedUserEventAgentConnection"));
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10003199C;
  v16 = &unk_100079C30;
  v9 = v7;
  v17 = v9;
  id v10 = v6;
  id v18 = v10;
  [v8 performWake:&v13 uponNotification:self->_bundleIdentifier sessionIdentifier:v10];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NDUserEventAgentConnection sharedUserEventAgentConnection]( &OBJC_CLASS___NDUserEventAgentConnection,  "sharedUserEventAgentConnection",  v13,  v14,  v15,  v16));
  [v11 launchProcessWithIdentifier:v9 sessionIdentifier:v10];

  return 1;
}

- (BOOL)shouldElevateDiscretionaryPriority
{
  return 0;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 0;
}

- (BOOL)isForeground
{
  return 0;
}

- (BOOL)canBeSuspended
{
  return 0;
}

- (BOOL)hasBackgroundTaskCompletion
{
  return 0;
}

- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4
{
  return 0;
}

- (void)addObserver:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  -[NSMutableArray addObject:](obj->_observers, "addObject:", v4);

  objc_sync_exit(obj);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = -[NSMutableArray indexOfObject:](v4->_observers, "indexOfObject:", v6);
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableArray removeObjectAtIndex:](v4->_observers, "removeObjectAtIndex:", v5);
  }
  objc_sync_exit(v4);
}

- (void)invokeSelectorForAllObservers:(SEL)a3
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100031840;
  v7[3] = &unk_100079C80;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

- (void)invokeSelectorForAllObservers:(SEL)a3 pid:(int)a4
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000316E0;
  block[3] = &unk_1000794E8;
  block[4] = self;
  block[5] = a3;
  int v10 = a4;
  dispatch_async(v8, block);
}

- (BOOL)backgroundUpdatesEnabled
{
  return 1;
}

- (void)_onqueue_resetRequestDelay
{
  v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v5 = 138412290;
    id v6 = bundleIdentifier;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Resetting request delay for %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NDApplication setCurrentRequestDelay:](self, "setCurrentRequestDelay:", 0.0);
}

- (BOOL)isInTransitionalDiscretionaryPeriod
{
  return self->isInTransitionalDiscretionaryPeriod;
}

- (void)setIsInTransitionalDiscretionaryPeriod:(BOOL)a3
{
  self->isInTransitionalDiscretionaryPeriod = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (double)currentRequestDelay
{
  return self->_currentRequestDelay;
}

- (void)setCurrentRequestDelay:(double)a3
{
  self->_currentRequestDelay = a3;
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if (qword_100083958 != -1) {
    dispatch_once(&qword_100083958, &stru_1000794C0);
  }
}

+ (NDApplication)applicationWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NDApplication);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100083948 objectForKeyedSubscript:v3]);

  if (!v6)
  {
    id v7 = [objc_alloc((Class)objc_opt_class(NDApplication)) initWithIdentifier:v3];
    [(id)qword_100083948 setObject:v7 forKeyedSubscript:v3];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100083948 objectForKeyedSubscript:v3]);
  objc_sync_exit(v5);

  return (NDApplication *)v8;
}

+ (id)springboardApplicationWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NDApplication);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100083950 objectForKeyedSubscript:v3]);

  if (!v6)
  {
    id v7 = -[NDSpringBoardApplication initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NDSpringBoardApplication),  "initWithIdentifier:",  v3);
    [(id)qword_100083950 setObject:v7 forKeyedSubscript:v3];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100083950 objectForKeyedSubscript:v3]);
  objc_sync_exit(v5);

  return v8;
}

+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  unsigned __int8 v5 = [v4 identifierIsForSpringBoardApplication:v3];

  return v5;
}

@end