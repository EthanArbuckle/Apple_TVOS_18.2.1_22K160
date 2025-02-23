@interface MTIDCloudKitPromiseManager
- (MTIDCloudKitPromiseManager)initWithCallbackQueue:(id)a3;
- (NSMutableDictionary)dict;
- (OS_dispatch_queue)callbackQueue;
- (id)waitForRecordToSync:(id)a3 timeout:(double)a4;
- (void)finishPromisesOfRecord:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDict:(id)a3;
@end

@implementation MTIDCloudKitPromiseManager

- (MTIDCloudKitPromiseManager)initWithCallbackQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTIDCloudKitPromiseManager;
  v5 = -[MTIDCloudKitPromiseManager init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[MTIDCloudKitPromiseManager setCallbackQueue:](v5, "setCallbackQueue:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MTIDCloudKitPromiseManager setDict:](v6, "setDict:", v7);
  }

  return v6;
}

- (id)waitForRecordToSync:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  if (objc_msgSend(v6, "mt_isSynchronized"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", v6));
  }

  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);

    v10 = objc_alloc(&OBJC_CLASS___MTPromiseWithTimeout);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitPromiseManager callbackQueue](self, "callbackQueue"));
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_1000128AC;
    v22 = &unk_100020DC8;
    id v23 = v6;
    objc_copyWeak(&v25, &location);
    id v12 = v9;
    id v24 = v12;
    v13 = -[MTPromiseWithTimeout initWithTimeout:queue:timeoutBlock:]( v10,  "initWithTimeout:queue:timeoutBlock:",  v11,  &v19,  a4);

    v14 = self;
    objc_sync_enter(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitPromiseManager dict](v14, "dict", v19, v20, v21, v22));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v12]);

    if (!v16)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitPromiseManager dict](v14, "dict"));
      [v17 setObject:v16 forKeyedSubscript:v12];
    }

    [v16 addObject:v13];

    objc_sync_exit(v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout promise](v13, "promise"));

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)finishPromisesOfRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);

  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitPromiseManager dict](v7, "dict"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitPromiseManager dict](v7, "dict"));
    [v10 setObject:0 forKeyedSubscript:v6];

    objc_sync_exit(v7);
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitPromiseManager callbackQueue](v7, "callbackQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100012AB4;
    v12[3] = &unk_1000209E0;
    id v13 = v9;
    id v14 = v4;
    dispatch_async(v11, v12);
  }

  else
  {
    objc_sync_exit(v7);
  }
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end