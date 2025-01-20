@interface CSCommandControlBehaviorMonitor
+ (id)sharedInstance;
- (CSCommandControlBehaviorMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5;
- (void)notifyDidStopStream:(id)a3;
- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4;
- (void)notifyWillStopStream:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSCommandControlBehaviorMonitor

- (CSCommandControlBehaviorMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSCommandControlBehaviorMonitor;
  v2 = -[CSCommandControlBehaviorMonitor init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSCommandControlBehaviorMonitor", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }

  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B6688;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B6648;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B64CC;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000B634C;
  v13[3] = &unk_10022DB78;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)notifyWillStopStream:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B61D4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyDidStopStream:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B605C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FF50 != -1) {
    dispatch_once(&qword_10027FF50, &stru_10022C408);
  }
  return (id)qword_10027FF48;
}

@end