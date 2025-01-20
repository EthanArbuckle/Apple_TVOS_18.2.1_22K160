@interface NDStatusMonitor
+ (id)sharedMonitor;
- (NDStatusMonitor)init;
- (void)dealloc;
- (void)handleBetterNetworkEvent;
- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 delay:(int64_t)a5;
- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 numberOfPreviousRetries:(unint64_t)a5;
- (void)simulateNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4;
- (void)start;
- (void)startMonitoringDynamicStore;
- (void)stop;
- (void)stopMonitoringDynamicStore;
@end

@implementation NDStatusMonitor

- (NDStatusMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NDStatusMonitor;
  v2 = -[NDStatusMonitor init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v3;

    v2->_networkChangeEventCount = 0LL;
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nsurlsessiond.status-monitor", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }

  return v2;
}

- (void)dealloc
{
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NDStatusMonitor;
  -[NDStatusMonitor dealloc](&v4, "dealloc");
}

- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 numberOfPreviousRetries:(unint64_t)a5
{
}

- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 delay:(int64_t)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002DB30;
  v11[3] = &unk_100079350;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  int64_t v14 = a5;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)queue, v11);
}

- (void)simulateNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DA30;
  block[3] = &unk_100079C58;
  v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)handleBetterNetworkEvent
{
  v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received symptom that we may be on a better network",  buf,  2u);
  }

  if (-[NSMutableSet count](self->_clients, "count"))
  {
    objc_super v4 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "executing blocks waiting for network change",  buf,  2u);
    }

    dispatch_queue_attr_t v5 = self->_clients;
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clients = self->_clients;
    self->_clients = v6;

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = v5;
    id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          unint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "client", (void)v15));
          objc_msgSend( v13,  "statusMonitor:callbackForIdentifier:networkChanged:",  self,  objc_msgSend(v12, "identifier"),  1);
        }

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
      }

      while (v9);
    }

    uint64_t v14 = symptom_create("com.apple.symptoms.discretionary.no.task");
    symptom_send(v14);
  }

- (void)startMonitoringDynamicStore
{
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    goto LABEL_10;
  }
  context.version = 0LL;
  context.info = self;
  memset(&context.retain, 0, 24);
  objc_super v4 = SCDynamicStoreCreate(0LL, @"com.apple.nsurlsessiond", (SCDynamicStoreCallBack)sub_10002DA1C, &context);
  if (v4)
  {
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    CFStringRef v6 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetIPv6);
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetIPv4);
    CFStringRef v8 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0LL, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv6);
    Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    uint64_t v10 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, NetworkGlobalEntity);
    CFArrayAppendValue(Mutable, v6);
    CFArrayAppendValue(v10, NetworkInterfaceEntity);
    CFArrayAppendValue(v10, v8);
    if (SCDynamicStoreSetNotificationKeys(v4, Mutable, v10))
    {
      self->_dynamicStore = v4;
    }

    else
    {
      v11 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = SCError();
        unint64_t v13 = SCErrorString(v12);
        int v14 = SCError();
        *(_DWORD *)buf = 136315394;
        __int128 v17 = v13;
        __int16 v18 = 1024;
        int v19 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "SCDynamicStoreSetNotificationKeys failed: %s [%d]",  buf,  0x12u);
      }

      CFRelease(v4);
    }

    CFRelease(NetworkGlobalEntity);
    CFRelease(v6);
    CFRelease(NetworkInterfaceEntity);
    CFRelease(v8);
    CFRelease(Mutable);
    CFRelease(v10);
  }

  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
LABEL_10:
  }
    SCDynamicStoreSetDispatchQueue(dynamicStore, (dispatch_queue_t)self->_queue);
}

- (void)stopMonitoringDynamicStore
{
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    SCDynamicStoreSetDispatchQueue(dynamicStore, 0LL);
  }
}

- (void)start
{
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10002DA14;
  handler[3] = &unk_100079378;
  handler[4] = self;
  notify_register_dispatch( "com.apple.symptoms.managed_events.joined-known-good-network",  &self->_symptomToken,  (dispatch_queue_t)queue,  handler);
}

- (void)stop
{
  int symptomToken = self->_symptomToken;
  if (symptomToken)
  {
    notify_cancel(symptomToken);
    self->_int symptomToken = 0;
  }

- (void).cxx_destruct
{
}

+ (id)sharedMonitor
{
  if (qword_100083918 != -1) {
    dispatch_once(&qword_100083918, &stru_100079328);
  }
  return (id)qword_100083920;
}

@end