@interface TVSSBannerQueue
- (BOOL)isNonHighPrioritySuspendedWithLevel:(int64_t)a3;
- (BOOL)isSuspended;
- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4;
- (BOOL)setSuspended:(BOOL)a3 forRequesterWithIdentifier:(id)a4 reason:(id)a5;
- (NSArray)prioritizedQueues;
- (NSSet)activeSuspensionReasons;
- (NSString)penderIdentifier;
- (OS_dispatch_queue)workQueue;
- (TVSSBannerQueue)init;
- (id)peekPresentable;
- (id)pullPresentablesWithIdentification:(id)a3;
- (void)enqueuePresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5;
- (void)setNonHighPrioritySuspended:(BOOL)a3 level:(int64_t)a4;
- (void)setPenderIdentifier:(id)a3;
- (void)setPrioritizedQueues:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation TVSSBannerQueue

- (TVSSBannerQueue)init
{
  SEL v25 = a2;
  v26 = 0LL;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVSSBannerQueue;
  v26 = -[TVSSBannerQueue init](&v24, "init");
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.TVSystemUIService.TVSSBannerQueue", 0LL);
    workQueue = v26->_workQueue;
    v26->_workQueue = (OS_dispatch_queue *)v2;

    id v23 = objc_retainBlock(&stru_1001B7BC8);
    id v17 = (id)(*((uint64_t (**)(id, void))v23 + 2))(v23, 0LL);
    v28[0] = v17;
    id v16 = (id)(*((uint64_t (**)(id, uint64_t))v23 + 2))(v23, 1LL);
    v28[1] = v16;
    id v15 = (id)(*((uint64_t (**)(id, uint64_t))v23 + 2))(v23, 2LL);
    v28[2] = v15;
    id v14 = (id)(*((uint64_t (**)(id, uint64_t))v23 + 2))(v23, 3LL);
    v28[3] = v14;
    v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 4LL);
    prioritizedQueues = v26->_prioritizedQueues;
    v26->_prioritizedQueues = v4;

    if ((id)-[NSArray count](v26->_prioritizedQueues, "count") != (id)4)
    {
      v22 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_prioritizedQueues count] == TVSSBannerQueuePriorityCount");
      id v21 = &_os_log_default;
      char v20 = 16;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        log = (os_log_s *)v21;
        os_log_type_t type = v20;
        v13 = NSStringFromSelector(v25);
        v9 = v13;
        v19 = v9;
        v6 = (objc_class *)objc_opt_class(v26);
        v12 = NSStringFromClass(v6);
        v18 = v12;
        sub_10000583C( (uint64_t)v27,  (uint64_t)v9,  (uint64_t)v18,  (uint64_t)v26,  (uint64_t)@"TVSSBannerQueue.m",  60,  (uint64_t)v22);
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v27,  0x3Au);

        objc_storeStrong((id *)&v18, 0LL);
        objc_storeStrong((id *)&v19, 0LL);
      }

      objc_storeStrong(&v21, 0LL);
      _bs_set_crash_log_message(-[NSString UTF8String](v22, "UTF8String"));
      __break(0);
      JUMPOUT(0x10004F790LL);
    }

    objc_storeStrong(&v23, 0LL);
  }

  v8 = v26;
  objc_storeStrong((id *)&v26, 0LL);
  return v8;
}

- (BOOL)isNonHighPrioritySuspendedWithLevel:(int64_t)a3
{
  v18 = self;
  SEL v17 = a2;
  id v16 = (void *)a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v12 = 0LL;
  v13 = &v12;
  int v14 = 0x20000000;
  int v15 = 32;
  queue = (dispatch_queue_s *)v18->_workQueue;
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_10004F9C8;
  v10 = &unk_1001B7BF0;
  v11[2] = v16;
  v11[1] = &v12;
  v11[0] = v18;
  dispatch_sync(queue, &v6);
  char v5 = *((_BYTE *)v13 + 24);
  objc_storeStrong(v11, 0LL);
  _Block_object_dispose(&v12, 8);
  return v5 & 1;
}

- (void)setNonHighPrioritySuspended:(BOOL)a3 level:(int64_t)a4
{
  int v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  uint64_t v12 = (void *)a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  queue = (dispatch_queue_s *)v15->_workQueue;
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_10004FEB8;
  v9 = &unk_1001B7C18;
  v10[1] = v12;
  v10[0] = v15;
  BOOL v11 = v13;
  dispatch_sync(queue, &v5);
  objc_storeStrong(v10, 0LL);
}

- (void)enqueuePresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  v19 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v17 = (void *)a4;
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  dispatch_assert_queue_not_V2(v19[2]);
  if (location[0])
  {
    queue = v19[2];
    int v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    BOOL v11 = sub_100050388;
    uint64_t v12 = &unk_1001B7C40;
    BOOL v13 = v19;
    id v14 = location[0];
    v15[1] = v17;
    v15[0] = v16;
    dispatch_sync(queue, &v8);
    objc_storeStrong(v15, 0LL);
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)peekPresentable
{
  v18 = self;
  v17[1] = (id)a2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  int v13 = 838860800;
  int v14 = 48;
  int v15 = sub_10005091C;
  id v16 = sub_100050970;
  v17[0] = 0LL;
  queue = (dispatch_queue_s *)v18->_workQueue;
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_10005099C;
  int v9 = &unk_1001B7C68;
  v10[1] = &v11;
  v10[0] = v18;
  dispatch_sync(queue, &v5);
  id v4 = (id)v12[5];
  objc_storeStrong(v10, 0LL);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0LL);
  return v4;
}

- (id)pullPresentablesWithIdentification:(id)a3
{
  id v21 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_not_V2(v21[2]);
  uint64_t v13 = 0LL;
  int v14 = &v13;
  int v15 = 838860800;
  int v16 = 48;
  SEL v17 = sub_10005091C;
  v18 = sub_100050970;
  id v19 = 0LL;
  queue = v21[2];
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_100050F68;
  int v10 = &unk_1001B7C90;
  v12[1] = &v13;
  uint64_t v11 = v21;
  v12[0] = location[0];
  dispatch_sync(queue, &v6);
  id v5 = (id)v14[5];
  objc_storeStrong(v12, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (BOOL)isSuspended
{
  int v16 = self;
  SEL v15 = a2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  queue = (dispatch_queue_s *)v16->_workQueue;
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_100051310;
  int v9 = &unk_1001B7C68;
  v10[1] = &v11;
  v10[0] = v16;
  dispatch_sync(queue, &v5);
  char v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0LL);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4
{
  id v23 = (dispatch_queue_t *)self;
  SEL v22 = a2;
  BOOL v21 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  dispatch_assert_queue_not_V2(v23[2]);
  uint64_t v15 = 0LL;
  int v16 = &v15;
  int v17 = 0x20000000;
  int v18 = 32;
  char v19 = 0;
  queue = v23[2];
  int v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  int v10 = sub_1000516D0;
  uint64_t v11 = &unk_1001B7CB8;
  v13[1] = &v15;
  uint64_t v12 = v23;
  BOOL v14 = v21;
  v13[0] = location;
  dispatch_sync(queue, &v7);
  char v6 = *((_BYTE *)v16 + 24);
  objc_storeStrong(v13, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  _Block_object_dispose(&v15, 8);
  objc_storeStrong(&location, 0LL);
  return v6 & 1;
}

- (NSSet)activeSuspensionReasons
{
  int v13 = self;
  v12[1] = (id)a2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  v12[0] = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  queue = (dispatch_queue_s *)v13->_workQueue;
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_100051840;
  int v9 = &unk_1001B61C0;
  int v10 = v13;
  id v11 = v12[0];
  dispatch_sync(queue, &v5);
  id v4 = [v12[0] copy];
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(v12, 0LL);
  return (NSSet *)v4;
}

- (BOOL)setSuspended:(BOOL)a3 forRequesterWithIdentifier:(id)a4 reason:(id)a5
{
  v26 = (dispatch_queue_t *)self;
  SEL v25 = a2;
  BOOL v24 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v22 = 0LL;
  objc_storeStrong(&v22, a5);
  dispatch_assert_queue_not_V2(v26[2]);
  uint64_t v18 = 0LL;
  char v19 = &v18;
  int v20 = 0x20000000;
  int v21 = 32;
  queue = v26[2];
  int v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  uint64_t v12 = sub_100051BC8;
  int v13 = &unk_1001B7CE0;
  v16[1] = &v18;
  BOOL v14 = v26;
  BOOL v17 = v24;
  id v15 = location;
  v16[0] = v22;
  dispatch_sync(queue, &v9);
  char v8 = *((_BYTE *)v19 + 24);
  objc_storeStrong(v16, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  _Block_object_dispose(&v18, 8);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&location, 0LL);
  return v8 & 1;
}

- (NSString)penderIdentifier
{
  return self->_penderIdentifier;
}

- (void)setPenderIdentifier:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSArray)prioritizedQueues
{
  return self->_prioritizedQueues;
}

- (void)setPrioritizedQueues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end