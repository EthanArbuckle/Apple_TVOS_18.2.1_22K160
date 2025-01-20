@interface LazyPromise
- (id)initOnScheduler:(id)a3 withExecutor:(id)a4;
- (id)joinWithPromise:(id)a3;
- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5;
@end

@implementation LazyPromise

- (id)initOnScheduler:(id)a3 withExecutor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LazyPromise;
  v9 = -[Promise init](&v13, "init");
  if (v9)
  {
    id v10 = [v8 copy];
    id executor = v9->_executor;
    v9->_id executor = v10;

    objc_storeStrong((id *)&v9->_scheduler, a3);
  }

  return v9;
}

- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5
{
  stateLock = self->super._stateLock;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10018D5AC;
  v13[3] = &unk_1003E9880;
  v13[4] = self;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  sub_1002C11C4(stateLock, v13);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LazyPromise;
  -[Promise thenPerform:orCatchError:onScheduler:](&v12, "thenPerform:orCatchError:onScheduler:", v11, v10, v9);
}

- (id)joinWithPromise:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018D6C4;
  v10[3] = &unk_1003E9D98;
  v10[4] = self;
  id v11 = a3;
  id v3 = v11;
  v4 = objc_retainBlock(v10);
  id v5 = sub_1001B71B0((uint64_t)&OBJC_CLASS___SyncTaskScheduler);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_10018C524((uint64_t)&OBJC_CLASS___LazyPromise, v6, v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (void).cxx_destruct
{
}

@end