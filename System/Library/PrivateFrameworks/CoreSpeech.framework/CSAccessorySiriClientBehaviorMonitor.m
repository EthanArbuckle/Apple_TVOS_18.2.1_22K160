@interface CSAccessorySiriClientBehaviorMonitor
+ (id)sharedInstance;
- (CSAccessorySiriClientBehaviorMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)_init;
- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5 withEventUUID:(id)a6 forAccessory:(id)a7;
- (void)notifyDidStopStream:(id)a3 reason:(unint64_t)a4 withEventUUID:(id)a5 forAccessory:(id)a6;
- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4 forAccessory:(id)a5;
- (void)notifyWillStopStream:(id)a3 reason:(unint64_t)a4 forAccessory:(id)a5;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSAccessorySiriClientBehaviorMonitor

- (void)_init
{
  v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  observers = self->_observers;
  self->_observers = v3;

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v8 = (id)objc_claimAutoreleasedReturnValue(global_queue);
  v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:withQualityOfService:andTargetQueue:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:withQualityOfService:andTargetQueue:",  @"com.apple.corespeech.CSAccessorySiriClientBehaviourMonitor",  33LL,  v8));
  queue = self->_queue;
  self->_queue = v6;
}

- (CSAccessorySiriClientBehaviorMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAccessorySiriClientBehaviorMonitor;
  v2 = -[CSAccessorySiriClientBehaviorMonitor init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[CSAccessorySiriClientBehaviorMonitor _init](v2, "_init");
  }
  return v3;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C389C;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C385C;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C36F8;
  v15[3] = &unk_10022E368;
  id v16 = v10;
  v17 = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5 withEventUUID:(id)a6 forAccessory:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C358C;
  v21[3] = &unk_10022C8E0;
  id v22 = v15;
  v23 = self;
  BOOL v27 = a4;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async(queue, v21);
}

- (void)notifyWillStopStream:(id)a3 reason:(unint64_t)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C3428;
  v13[3] = &unk_10022C908;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  unint64_t v17 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

- (void)notifyDidStopStream:(id)a3 reason:(unint64_t)a4 withEventUUID:(id)a5 forAccessory:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C32C0;
  block[3] = &unk_10022E968;
  id v18 = v12;
  id v19 = self;
  id v21 = v11;
  unint64_t v22 = a4;
  id v20 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(queue, block);
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
  if (qword_10027FF80 != -1) {
    dispatch_once(&qword_10027FF80, &stru_10022C8B8);
  }
  return (id)qword_10027FF78;
}

@end