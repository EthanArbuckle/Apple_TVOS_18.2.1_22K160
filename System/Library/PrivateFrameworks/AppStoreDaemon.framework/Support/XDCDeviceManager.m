@interface XDCDeviceManager
- (XDCDeviceManager)init;
@end

@implementation XDCDeviceManager

- (XDCDeviceManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___XDCDeviceManager;
  v2 = -[XDCDeviceManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.XDCDeviceManager", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    devices = v2->_devices;
    v2->_devices = v7;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end