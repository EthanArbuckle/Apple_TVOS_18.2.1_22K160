@interface ActivityManager
- (ActivityManager)init;
@end

@implementation ActivityManager

- (ActivityManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ActivityManager;
  v2 = -[ActivityManager init](&v18, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.ActivityManager.callout", v4);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.appstored.ActivityManager.dispatch", v8);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v9;

    id v11 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    unsigned __int8 v13 = [v12 isHRNMode];

    if ((v13 & 1) == 0)
    {
      v14 = (dispatch_queue_s *)v2->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100195EC0;
      block[3] = &unk_1003E9880;
      v17 = v2;
      dispatch_async(v14, block);
    }
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end