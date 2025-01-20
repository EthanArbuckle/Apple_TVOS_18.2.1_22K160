@interface CKDiscretionaryDASScheduler
+ (double)minStartDelay;
+ (id)scheduleOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11;
@end

@implementation CKDiscretionaryDASScheduler

+ (id)scheduleOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11
{
  BOOL v13 = a6;
  id v17 = a11;
  id v18 = a10;
  v19 = (dispatch_queue_s *)a9;
  id v20 = a7;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  dispatch_assert_queue_V2(v19);
  v24 = -[CKDiscretionaryDASSchedulerTask initWithOperationID:group:bundleID:requiresPastBuddy:options:state:queue:startHandler:suspendHandler:]( objc_alloc(&OBJC_CLASS___CKDiscretionaryDASSchedulerTask),  "initWithOperationID:group:bundleID:requiresPastBuddy:options:state:queue:startHandler:suspendHandler:",  v23,  v22,  v21,  v13,  v20,  a8,  v19,  v18,  v17);

  -[CKDiscretionaryDASSchedulerTask _schedule](v24, "_schedule");
  return v24;
}

+ (double)minStartDelay
{
  return 1.0;
}

@end