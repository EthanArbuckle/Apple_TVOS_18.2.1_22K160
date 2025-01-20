@interface AMSDDismissQRDialogService
+ (AMSDDismissQRDialogService)sharedService;
+ (BOOL)isConnectionEntitled:(id)a3;
- (AMSDDismissQRDialogService)init;
- (NSMutableDictionary)dismissalCompletionQueue;
- (OS_dispatch_queue)taskQueue;
- (os_unfair_lock_s)queueLock;
- (void)notifyDismissDialogWithIdentifier:(id)a3;
- (void)observeQRDialogDismissalNotificationForIdentifier:(id)a3 completion:(id)a4;
- (void)removeQRDialogDismissalObserverForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation AMSDDismissQRDialogService

- (AMSDDismissQRDialogService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AMSDDismissQRDialogService;
  v2 = -[AMSDDismissQRDialogService init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AppleMediaServices.QRCodeDismissal", v4);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dismissalCompletionQueue = v2->_dismissalCompletionQueue;
    v2->_dismissalCompletionQueue = v7;

    v2->_queueLock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

+ (AMSDDismissQRDialogService)sharedService
{
  if (qword_1000F1FA8 != -1) {
    dispatch_once(&qword_1000F1FA8, &stru_1000D6300);
  }
  return (AMSDDismissQRDialogService *)(id)qword_1000F1FB0;
}

- (void)observeQRDialogDismissalNotificationForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDismissQRDialogService taskQueue](self, "taskQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100016FE4;
  v11[3] = &unk_1000D6010;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingBlock:",  @"com.apple.amsaccountsd.qrcodedismissal",  v8,  v11);
}

- (void)removeQRDialogDismissalObserverForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDismissQRDialogService taskQueue](self, "taskQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100017228;
  v11[3] = &unk_1000D6010;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingBlock:",  @"com.apple.amsaccountsd.qrcodedismissal",  v8,  v11);
}

- (void)notifyDismissDialogWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDismissQRDialogService taskQueue](self, "taskQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001743C;
  v7[3] = &unk_1000D60B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingBlock:",  @"com.apple.amsaccountsd.qrcodedismissal",  v5,  v7);
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  unsigned __int8 v7 = [v6 BOOLValue];
  return v7;
}

- (OS_dispatch_queue)taskQueue
{
  return self->_taskQueue;
}

- (os_unfair_lock_s)queueLock
{
  return self->_queueLock;
}

- (NSMutableDictionary)dismissalCompletionQueue
{
  return self->_dismissalCompletionQueue;
}

- (void).cxx_destruct
{
}

@end