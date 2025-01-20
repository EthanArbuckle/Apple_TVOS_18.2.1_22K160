@interface XPCNotificationCenter
- (XPCNotificationCenter)init;
@end

@implementation XPCNotificationCenter

- (XPCNotificationCenter)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___XPCNotificationCenter;
  v2 = -[XPCNotificationCenter init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AppStoreFoundation.XPCNotificationCenter", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    notificationClients = v2->_notificationClients;
    v2->_notificationClients = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    notificationSources = v2->_notificationSources;
    v2->_notificationSources = v9;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end