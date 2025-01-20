@interface ODRDownloadManager
- (ODRDownloadManager)init;
@end

@implementation ODRDownloadManager

- (ODRDownloadManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ODRDownloadManager;
  v2 = -[ODRDownloadManager init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.ODRDownloadManager.callout", v4);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.appstored.ODRDownloadManager.dispatch", v8);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v9;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end