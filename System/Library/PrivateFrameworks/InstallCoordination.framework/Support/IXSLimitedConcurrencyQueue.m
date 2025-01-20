@interface IXSLimitedConcurrencyQueue
+ (id)launchServicesQueue;
+ (id)uninstallConcurrencyQueue;
- (IXSLimitedConcurrencyQueue)initWithWidth:(unint64_t)a3;
- (NSMutableArray)identityQueue;
- (NSMutableDictionary)waitingOperations;
- (NSMutableSet)activeIdentities;
- (OS_dispatch_queue)internalQueue;
- (unint64_t)width;
- (void)_onQueue_deQueueIfNeeded;
- (void)_onQueue_runAsyncForIdentity:(id)a3 description:(id)a4 operation:(id)a5;
- (void)runAsyncForIdentity:(id)a3 description:(id)a4 operation:(id)a5;
@end

@implementation IXSLimitedConcurrencyQueue

+ (id)launchServicesQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011064;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8E70 != -1) {
    dispatch_once(&qword_1000E8E70, block);
  }
  return (id)qword_1000E8E68;
}

+ (id)uninstallConcurrencyQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011108;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8E80 != -1) {
    dispatch_once(&qword_1000E8E80, block);
  }
  return (id)qword_1000E8E78;
}

- (IXSLimitedConcurrencyQueue)initWithWidth:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IXSLimitedConcurrencyQueue;
  v4 = -[IXSLimitedConcurrencyQueue init](&v17, "init");
  v5 = v4;
  if (v4)
  {
    v4->_width = a3;
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.installcoordinationd.LimitedConcurrencyQueue", v7);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
    waitingOperations = v5->_waitingOperations;
    v5->_waitingOperations = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
    activeIdentities = v5->_activeIdentities;
    v5->_activeIdentities = (NSMutableSet *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
    identityQueue = v5->_identityQueue;
    v5->_identityQueue = (NSMutableArray *)v14;
  }

  return v5;
}

- (void)runAsyncForIdentity:(id)a3 description:(id)a4 operation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue internalQueue](self, "internalQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100011300;
  v15[3] = &unk_1000CCE80;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  sub_10005A8F0(v11, v15);
}

- (void)_onQueue_deQueueIfNeeded
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue waitingOperations](self, "waitingOperations"));
  id v5 = [v4 count];

  if (v5)
  {
    dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue activeIdentities](self, "activeIdentities"));
    id v7 = [v6 count];
    unint64_t v8 = -[IXSLimitedConcurrencyQueue width](self, "width");

    if ((unint64_t)v7 >= v8)
    {
      v29 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10007A684(self);
      }
    }

    else
    {
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue identityQueue](self, "identityQueue"));
      id v10 = [v9 countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (v10)
      {
        id v12 = v10;
        uint64_t v13 = *(void *)v64;
        *(void *)&__int128 v11 = 136315394LL;
        __int128 v58 = v11;
LABEL_5:
        uint64_t v14 = 0LL;
        while (1)
        {
          if (*(void *)v64 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v63 + 1) + 8 * v14);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue activeIdentities](self, "activeIdentities", v58));
          unsigned int v17 = [v16 containsObject:v15];

          if (!v17) {
            break;
          }
          id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v58;
            v68 = "-[IXSLimitedConcurrencyQueue _onQueue_deQueueIfNeeded]";
            __int16 v69 = 2112;
            v70 = v15;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s: Skipping dequeue for %@; work item already active for that identity",
              buf,
              0x16u);
          }

          if (v12 == (id)++v14)
          {
            id v12 = [v9 countByEnumeratingWithState:&v63 objects:v71 count:16];
            if (v12) {
              goto LABEL_5;
            }
            goto LABEL_13;
          }
        }

        v21 = v15;

        if (!v21) {
          goto LABEL_26;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue waitingOperations](self, "waitingOperations"));
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v21]);

        if (!v31)
        {
          v47 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_10007A430();
          }
          goto LABEL_39;
        }

        if (![v31 count])
        {
          v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_10007A49C();
          }
          goto LABEL_39;
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndex:0]);
        [v31 removeObjectAtIndex:0];
        if ([v31 count])
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue identityQueue](self, "identityQueue"));
          id v34 = [v33 count];

          if (v34 == (id)1)
          {
LABEL_36:
            v53 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
              sub_10007A508((uint64_t)v21, v32);
            }

            v55 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue activeIdentities](self, "activeIdentities"));
            [v55 addObject:v21];

            dispatch_queue_global_t v56 = sub_10005A9D4();
            v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
            v59[0] = _NSConcreteStackBlock;
            v59[1] = 3221225472LL;
            v59[2] = sub_100011834;
            v59[3] = &unk_1000CCF90;
            id v60 = v32;
            v61 = self;
            v62 = v21;
            v48 = v32;
            sub_10005A8F0(v57, v59);

LABEL_39:
            goto LABEL_40;
          }

          v35 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            sub_10007A618();
          }

          v37 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue identityQueue](self, "identityQueue"));
          [v37 removeObject:v21];

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue identityQueue](self, "identityQueue"));
          [v38 addObject:v21];
        }

        else
        {
          v50 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
            sub_10007A5AC();
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue waitingOperations](self, "waitingOperations"));
          [v52 removeObjectForKey:v21];

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue identityQueue](self, "identityQueue"));
          [v38 removeObject:v21];
        }

        goto LABEL_36;
      }

- (void)_onQueue_runAsyncForIdentity:(id)a3 description:(id)a4 operation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10007A7D4();
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue waitingOperations](self, "waitingOperations"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v8]);

  if (!v15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue waitingOperations](self, "waitingOperations"));
    [v16 setObject:v15 forKeyedSubscript:v8];
  }

  unsigned int v17 = -[IXSLimitedConcurrencyOperation initWithBlock:description:]( objc_alloc(&OBJC_CLASS___IXSLimitedConcurrencyOperation),  "initWithBlock:description:",  v10,  v9);

  [v15 addObject:v17];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue identityQueue](self, "identityQueue"));
  unsigned __int8 v19 = [v18 containsObject:v8];

  if ((v19 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSLimitedConcurrencyQueue identityQueue](self, "identityQueue"));
    [v20 addObject:v8];
  }

  -[IXSLimitedConcurrencyQueue _onQueue_deQueueIfNeeded](self, "_onQueue_deQueueIfNeeded");
}

- (unint64_t)width
{
  return self->_width;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)waitingOperations
{
  return self->_waitingOperations;
}

- (NSMutableSet)activeIdentities
{
  return self->_activeIdentities;
}

- (NSMutableArray)identityQueue
{
  return self->_identityQueue;
}

- (void).cxx_destruct
{
}

@end