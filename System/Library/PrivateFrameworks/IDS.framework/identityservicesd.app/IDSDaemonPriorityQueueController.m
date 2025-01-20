@interface IDSDaemonPriorityQueueController
+ (id)sharedInstance;
- (IDSDaemonPriorityQueueController)init;
- (id)_queueForImplicitPriority:(int64_t)a3;
- (id)queueForPriority:(int64_t)a3;
- (void)assertRunningOnMain;
- (void)assertRunningWithPriority:(int64_t)a3;
- (void)performBlock:(id)a3 withImplicitPriority:(int64_t)a4;
- (void)performBlockDefaultPriority:(id)a3;
- (void)performBlockMainQueue:(id)a3;
- (void)performBlockMainQueue:(id)a3 afterTimeMSec:(unsigned int)a4;
- (void)performBlockSYNCHRONOUSLYWithPriority:(id)a3 priority:(int64_t)a4;
- (void)performBlockSyncPriority:(id)a3;
- (void)performBlockUrgentPriority:(id)a3;
- (void)performBlockWithPriority:(id)a3 priority:(int64_t)a4;
@end

@implementation IDSDaemonPriorityQueueController

+ (id)sharedInstance
{
  if (qword_1009C0C20 != -1) {
    dispatch_once(&qword_1009C0C20, &stru_100902AA0);
  }
  return (id)qword_1009C0C28;
}

- (IDSDaemonPriorityQueueController)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSDaemonPriorityQueueController;
  v2 = -[IDSDaemonPriorityQueueController init](&v18, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("IDSDaemonPriorityQueueSync", v6);
    sync_queue = v2->_sync_queue;
    v2->_sync_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("IDSDaemonPriorityQueueDefault", v10);
    default_queue = v2->_default_queue;
    v2->_default_queue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("IDSDaemonPriorityQueueUrgent", v14);
    urgent_queue = v2->_urgent_queue;
    v2->_urgent_queue = (OS_dispatch_queue *)v15;
  }

  return v2;
}

- (id)queueForPriority:(int64_t)a3
{
  switch(a3)
  {
    case 100LL:
      uint64_t v3 = 1LL;
      break;
    case 300LL:
      uint64_t v3 = 3LL;
      break;
    case 200LL:
      uint64_t v3 = 2LL;
      break;
    default:
      abort();
  }

  return (&self->super.isa)[v3];
}

- (id)_queueForImplicitPriority:(int64_t)a3
{
  switch(a3)
  {
    case 300LL:
      urgent_queue = self->_urgent_queue;
      return urgent_queue;
    case 200LL:
      urgent_queue = self->_default_queue;
      return urgent_queue;
    case 100LL:
      urgent_queue = self->_sync_queue;
      return urgent_queue;
  }

  uint64_t v5 = im_primary_queue(self, a2);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (void)performBlock:(id)a3 withImplicitPriority:(int64_t)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[IDSDaemonPriorityQueueController _queueForImplicitPriority:]( self,  "_queueForImplicitPriority:",  a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039C0B8;
  block[3] = &unk_1008F6330;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)performBlockSyncPriority:(id)a3
{
  id v4 = a3;
  sync_queue = (dispatch_queue_s *)self->_sync_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039C168;
  block[3] = &unk_1008F6330;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sync_queue, block);
}

- (void)performBlockDefaultPriority:(id)a3
{
  id v4 = a3;
  default_queue = (dispatch_queue_s *)self->_default_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039C218;
  block[3] = &unk_1008F6330;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(default_queue, block);
}

- (void)performBlockUrgentPriority:(id)a3
{
  id v4 = a3;
  urgent_queue = (dispatch_queue_s *)self->_urgent_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039C2C8;
  block[3] = &unk_1008F6330;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(urgent_queue, block);
}

- (void)performBlockMainQueue:(id)a3
{
  id v3 = a3;
  uint64_t v5 = im_primary_queue(v3, v4);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039C384;
  block[3] = &unk_1008F6330;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, block);
}

- (void)performBlockMainQueue:(id)a3 afterTimeMSec:(unsigned int)a4
{
  id v6 = a3;
  if (a4)
  {
    dispatch_time_t v7 = dispatch_time(0LL, 1000000LL * a4);
    uint64_t v9 = im_primary_queue(v7, v8);
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10039C47C;
    block[3] = &unk_1008F6330;
    id v12 = v6;
    dispatch_after(v7, v10, block);
  }

  else
  {
    -[IDSDaemonPriorityQueueController performBlockMainQueue:](self, "performBlockMainQueue:", v6);
  }
}

- (void)performBlockWithPriority:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  dispatch_time_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDaemonPriorityQueueController queueForPriority:](self, "queueForPriority:", a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039C550;
  block[3] = &unk_1008F6330;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)performBlockSYNCHRONOUSLYWithPriority:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  -[IDSDaemonPriorityQueueController assertRunningOnMain](self, "assertRunningOnMain");
  dispatch_time_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDaemonPriorityQueueController queueForPriority:](self, "queueForPriority:", a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039C62C;
  block[3] = &unk_1008F6330;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)assertRunningWithPriority:(int64_t)a3
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDaemonPriorityQueueController queueForPriority:](self, "queueForPriority:", a3));
  dispatch_assert_queue_V2(v3);
}

- (void)assertRunningOnMain
{
  if (!pthread_main_np())
  {
    uint64_t v2 = im_primary_base_queue();
    id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
    dispatch_assert_queue_V2(v3);
  }

- (void).cxx_destruct
{
}

@end