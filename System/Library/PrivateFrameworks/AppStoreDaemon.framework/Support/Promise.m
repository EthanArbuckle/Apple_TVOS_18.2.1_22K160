@interface Promise
- (Promise)init;
- (id)initOnScheduler:(id)a3 withExecutor:(id)a4;
- (id)joinWithPromise:(id)a3;
- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5;
@end

@implementation Promise

- (Promise)init
{
  return (Promise *)sub_10018C6C8((id *)&self->super.isa, 0LL, 0LL);
}

- (id)initOnScheduler:(id)a3 withExecutor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[Promise init](self, "init");
  v9 = v8;
  if (v8) {
    sub_10018C7D8((uint64_t)v8, v7, v6);
  }

  return v9;
}

- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  stateLock = self->_stateLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10018CA10;
  v15[3] = &unk_1003E9C58;
  id v18 = v8;
  id v19 = v9;
  id v16 = v10;
  v17 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  sub_1002C11C4(stateLock, v15);
}

- (id)joinWithPromise:(id)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10018CF20;
  v12[3] = &unk_1003E9D20;
  id v13 = a3;
  id v14 = objc_alloc_init(&OBJC_CLASS___Promise);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018D0AC;
  v10[3] = &unk_1003E9CA8;
  v4 = v14;
  v11 = v4;
  id v5 = v13;
  id v6 = objc_opt_new(&OBJC_CLASS___SyncTaskScheduler);
  -[Promise thenPerform:orCatchError:onScheduler:](self, "thenPerform:orCatchError:onScheduler:", v12, v10, v6);

  id v7 = v11;
  id v8 = v4;

  return v8;
}

- (void).cxx_destruct
{
}

@end