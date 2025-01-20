@interface NESMProviderManager
- (NESMProviderManager)init;
@end

@implementation NESMProviderManager

- (NESMProviderManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NESMProviderManager;
  v2 = -[NESMProviderManager init](&v15, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("NESMProviderManager queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = xpc_event_publisher_create("com.apple.networkextension.provider.matching", v2->_queue);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    eventPublisher = v2->_eventPublisher;
    v2->_eventPublisher = (OS_xpc_event_publisher *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    registrationMap = v2->_registrationMap;
    v2->_registrationMap = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    extensionsBeingUpdated = v2->_extensionsBeingUpdated;
    v2->_extensionsBeingUpdated = v12;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end