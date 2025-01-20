@interface MTBaseProcessor
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)isRunning;
- (BOOL)isStopping;
- (BOOL)start;
- (MTBaseProcessor)init;
- (MTBaseQueryObserver)queryObserver;
- (MTDefaultsChangeNotifier)defaultsNotifier;
- (NSObject)isStoppingLock;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)timer;
- (double)updatePredicateDuration;
- (id)createQueryObserver;
- (id)defaultPropertiesThatAffectPredicate;
- (id)entityName;
- (id)predicate;
- (void)enqueueWorkBlock:(id)a3;
- (void)results:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)setDefaultsNotifier:(id)a3;
- (void)setIsStopping:(BOOL)a3;
- (void)setIsStoppingLock:(id)a3;
- (void)setQueryObserver:(id)a3;
- (void)setTimer:(id)a3;
- (void)stop;
- (void)updatePredicate;
@end

@implementation MTBaseProcessor

+ (void)initialize
{
  if (qword_1002B6A10 != -1) {
    dispatch_once(&qword_1002B6A10, &stru_1002428B8);
  }
}

+ (id)sharedInstance
{
  v3 = NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (id)qword_1002B6A08;
  objc_sync_enter(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue([(id)qword_1002B6A08 objectForKey:v4]);
  objc_sync_exit(v5);

  if (!v6)
  {
    id v7 = (id)qword_1002B6A08;
    objc_sync_enter(v7);
    id v6 = (id)objc_claimAutoreleasedReturnValue([(id)qword_1002B6A08 objectForKey:v4]);
    if (!v6)
    {
      v9.receiver = a1;
      v9.super_class = (Class)&OBJC_METACLASS___MTBaseProcessor;
      id v6 = objc_msgSend(objc_msgSendSuper2(&v9, "allocWithZone:", 0), "init");
      [(id)qword_1002B6A08 setObject:v6 forKey:v4];
    }

    objc_sync_exit(v7);
  }

  return v6;
}

- (MTBaseProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTBaseProcessor;
  v2 = -[MTBaseProcessor init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSObject);
    isStoppingLock = v2->_isStoppingLock;
    v2->_isStoppingLock = v3;

    v2->_isStopping = 0;
  }

  return v2;
}

- (BOOL)start
{
  unsigned __int8 v3 = -[MTBaseProcessor isStopping](self, "isStopping");
  if ((v3 & 1) == 0)
  {
    v4 = (objc_class *)objc_opt_class(self);
    id v5 = NSStringFromClass(v4);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@SerialQueue",  v6));

    id v8 = v7;
    objc_super v9 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v8 UTF8String], 0);
    workQueue = self->_workQueue;
    self->_workQueue = v9;

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007D5F8;
    v12[3] = &unk_100242908;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v3 ^ 1;
}

- (void)stop
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor queryObserver](self, "queryObserver"));
  [v3 stop];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor defaultsNotifier](self, "defaultsNotifier"));
  [v4 stop];
}

- (BOOL)isStopping
{
  v2 = self;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor isStoppingLock](self, "isStoppingLock"));
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_isStopping;
  objc_sync_exit(v3);

  return (char)v2;
}

- (void)setIsStopping:(BOOL)a3
{
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor isStoppingLock](self, "isStoppingLock"));
  objc_sync_enter(obj);
  self->_isStopping = a3;
  objc_sync_exit(obj);
}

- (BOOL)isRunning
{
  if (self->_workQueue) {
    return !-[MTBaseProcessor isStopping](self, "isStopping");
  }
  else {
    return 0;
  }
}

- (id)createQueryObserver
{
  unsigned __int8 v3 = objc_alloc(&OBJC_CLASS___MTSafeUuidQueryObserver);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor entityName](self, "entityName"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor predicate](self, "predicate"));
  objc_super v6 = -[MTSafeUuidQueryObserver initWithEntityName:predicate:](v3, "initWithEntityName:predicate:", v4, v5);

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10007DBF4;
  v9[3] = &unk_100242958;
  objc_copyWeak(&v10, &location);
  id v7 = -[MTSafeUuidQueryObserver addResultsChangedHandler:](v6, "addResultsChangedHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (void)updatePredicate
{
  uint64_t v3 = _MTLogCategoryDefault(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class(self);
    objc_super v6 = NSStringFromClass(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ updated predicate",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor queryObserver](self, "queryObserver"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor predicate](self, "predicate"));
  [v8 setPredicate:v9];
}

- (double)updatePredicateDuration
{
  return 0.0;
}

- (id)entityName
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"entityName must be implemented by subclasses",  0LL));
  objc_exception_throw(v2);
  return -[MTBaseProcessor predicate](v3, v4);
}

- (id)predicate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"Predicate must be implemented by subclasses",  0LL));
  objc_exception_throw(v2);
  -[MTBaseProcessor resultsChangedWithDeletedIds:insertIds:updatedIds:](v3, v4, v5, v6, v7);
  return result;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"resulstChanged must be implemented by subclasses",  0LL));
  objc_exception_throw(v10);
  -[MTBaseProcessor results:](v11, v12, v13);
}

- (void)results:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor queryObserver](self, "queryObserver"));
  [v5 results:v4];
}

- (id)defaultPropertiesThatAffectPredicate
{
  return 0LL;
}

- (void)enqueueWorkBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor workQueue](self, "workQueue"));

  if (v5)
  {
    BOOL v7 = -[MTBaseProcessor isStopping](self, "isStopping");
    if (!v7)
    {
      objc_initWeak(buf, self);
      SEL v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor workQueue](self, "workQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10007E0D0;
      v13[3] = &unk_100240B98;
      objc_copyWeak(&v15, buf);
      id v14 = v4;
      dispatch_async(v12, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(buf);
      goto LABEL_10;
    }

    uint64_t v8 = _MTLogCategoryDefault(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v10 = "Attempting to enqueue work after the processor has stopped.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)buf, 2u);
    }
  }

  else
  {
    uint64_t v11 = _MTLogCategoryDefault(v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v10 = "Attempting to enqueue work before processor has been started.";
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (MTBaseQueryObserver)queryObserver
{
  return self->_queryObserver;
}

- (void)setQueryObserver:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (MTDefaultsChangeNotifier)defaultsNotifier
{
  return self->_defaultsNotifier;
}

- (void)setDefaultsNotifier:(id)a3
{
}

- (NSObject)isStoppingLock
{
  return self->_isStoppingLock;
}

- (void)setIsStoppingLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end