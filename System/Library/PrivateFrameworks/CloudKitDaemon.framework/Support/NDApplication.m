@interface NDApplication
+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3;
+ (id)applicationWithIdentifier:(id)a3;
+ (id)springboardApplicationWithBundleIdentifier:(id)a3;
+ (void)initialize;
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)isForeground;
- (NDApplication)initWithOperationID:(id)a3;
- (void)addObserver:(id)a3;
- (void)invokeSelectorForAllObservers:(SEL)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NDApplication

+ (void)initialize
{
  if (qword_1000160F8 != -1) {
    dispatch_once(&qword_1000160F8, &stru_100010470);
  }
}

+ (id)applicationWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NDApplication, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100016100 objectForKeyedSubscript:v3]);

  if (!v7)
  {
    id v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(NDApplication, v8)), "initWithOperationID:", v3);
    [(id)qword_100016100 setObject:v9 forKeyedSubscript:v3];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100016100 objectForKeyedSubscript:v3]);
  objc_sync_exit(v6);

  return v10;
}

+ (id)springboardApplicationWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NDApplication, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100016100 objectForKeyedSubscript:v3]);

  if (!v7)
  {
    uint64_t v8 = -[NDSpringBoardApplication initWithOperationID:]( objc_alloc(&OBJC_CLASS___NDSpringBoardApplication),  "initWithOperationID:",  v3);
    [(id)qword_100016100 setObject:v8 forKeyedSubscript:v3];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100016100 objectForKeyedSubscript:v3]);
  objc_sync_exit(v6);

  return v9;
}

+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  unsigned __int8 v5 = [v4 identifierIsForSpringBoardApplication:v3];

  return v5;
}

- (NDApplication)initWithOperationID:(id)a3
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
  }

  return v7;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 0;
}

- (BOOL)isForeground
{
  return 0;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
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
  v7[2] = sub_1000052D0;
  v7[3] = &unk_100010498;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

- (void).cxx_destruct
{
}

@end