@interface CSOpportuneSpeakBehaviorMonitor
+ (id)sharedInstance;
- (CSOpportuneSpeakBehaviorMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)notifyDidStartStreamWithContext:(id)a3 audioProviderUUID:(id)a4 successfully:(BOOL)a5 option:(id)a6;
- (void)notifyDidStopStream:(id)a3;
- (void)notifyWillStartStreamWithContext:(id)a3 audioProviderUUID:(id)a4 option:(id)a5;
- (void)notifyWillStopStream:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSOpportuneSpeakBehaviorMonitor

- (CSOpportuneSpeakBehaviorMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSOpportuneSpeakBehaviorMonitor;
  v2 = -[CSOpportuneSpeakBehaviorMonitor init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSOpportuneSpeakBehaviorMonitor", 0LL);
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
  v7[2] = sub_10011AA7C;
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
  v7[2] = sub_10011AA3C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyWillStartStreamWithContext:(id)a3 audioProviderUUID:(id)a4 option:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10011A8EC;
  v15[3] = &unk_10022E368;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)notifyDidStartStreamWithContext:(id)a3 audioProviderUUID:(id)a4 successfully:(BOOL)a5 option:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011A798;
  block[3] = &unk_10022DC10;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (void)notifyWillStopStream:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011A64C;
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
  v7[2] = sub_10011A500;
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
  if (qword_100280108 != -1) {
    dispatch_once(&qword_100280108, &stru_10022DBE8);
  }
  return (id)qword_100280100;
}

@end