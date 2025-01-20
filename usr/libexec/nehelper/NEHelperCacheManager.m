@interface NEHelperCacheManager
- (NEHelperCacheManager)init;
- (NEHelperCacheManager)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)dealloc;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperCacheManager

- (NEHelperCacheManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEHelperCacheManager;
  v5 = -[NEHelperCacheManager init](&v16, "init");
  if (v5)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    v8 = v7;
    if (v7)
    {
      pid_t pid = xpc_connection_get_pid(v7);
      uint64_t v10 = proc_name(pid, buffer, 0x100u);
      if ((int)v10 < 1)
      {
        uint64_t v14 = ne_log_obj(v10, v11);
        clientName = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(clientName, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          pid_t v18 = pid;
          _os_log_error_impl( (void *)&_mh_execute_header,  clientName,  OS_LOG_TYPE_ERROR,  "Failed to get the process name for %d",  buf,  8u);
        }
      }

      else
      {
        v12 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  buffer,  4LL);
        clientName = (os_log_s *)v5->_clientName;
        v5->_clientName = v12;
      }
    }
  }

  return v5;
}

- (NEHelperCacheManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEHelperCacheManager;
  v2 = -[NEHelperCacheManager init](&v10, "init");
  if (!v2) {
    goto LABEL_3;
  }
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("nehelper cache manager", v4);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  SCPreferencesRef v7 = SCPreferencesCreate( kCFAllocatorDefault,  @"nehelper",  @"/Library/Preferences/com.apple.networkextension.cache.plist");
  v2->_prefs = v7;
  if (!v7) {
    v8 = 0LL;
  }
  else {
LABEL_3:
  }
    v8 = v2;

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEHelperCacheManager;
  -[NEHelperCacheManager dealloc](&v3, "dealloc");
}

- (OS_dispatch_queue)handlerQueue
{
  id v2 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
  id Property = (id)objc_claimAutoreleasedReturnValue(v2);
  dispatch_queue_t v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 8LL, 1);
  }
  v6 = (OS_dispatch_queue *)Property;

  return v6;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
  selfa = (SCPreferencesRef *)objc_claimAutoreleasedReturnValue(v5);
  if (self) {
    id Property = objc_getProperty(self, v6, 24LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v8 = selfa;
  if (selfa)
  {
    objc_setProperty_atomic(selfa, v6, Property, 24LL);
    v8 = selfa;
  }

  sub_10001E0D8(v8, v4);
}

- (void).cxx_destruct
{
}

@end