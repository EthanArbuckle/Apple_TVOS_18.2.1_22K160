@interface CKDiscretionaryImmediateScheduler
+ (double)minStartDelay;
+ (id)scheduleOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11;
@end

@implementation CKDiscretionaryImmediateScheduler

+ (id)scheduleOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11
{
  id v12 = a10;
  v13 = (dispatch_queue_s *)a9;
  v14 = objc_alloc_init(&OBJC_CLASS___CKDiscretionarySchedulerTask);
  -[CKDiscretionarySchedulerTask setState:](v14, "setState:", a8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000753C;
  block[3] = &unk_1000105A0;
  id v18 = v12;
  id v15 = v12;
  dispatch_async(v13, block);

  return v14;
}

+ (double)minStartDelay
{
  return 0.0;
}

@end