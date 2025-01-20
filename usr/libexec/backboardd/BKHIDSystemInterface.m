@interface BKHIDSystemInterface
+ (BKHIDSystemInterface)sharedInstance;
- (BKHIDClientConnectionManager)clientConnectionManager;
- (BKHIDEventDeliveryManager)deliveryManager;
- (BKHIDEventDeliveryManagerServer)deliveryManagerServer;
- (BKHIDEventSenderCache)senderCache;
- (BKHIDSystem)system;
- (BKHIDSystemInterface)init;
- (BOOL)_routeSqueezeEventToSystem;
- (OS_dispatch_mach)HIDSystemChannel;
- (__IOHIDEvent)systemEventOfType:(unsigned int)a3 matchingEvent:(__IOHIDEvent *)a4 options:(unsigned int)a5;
- (id)IOHIDServicesMatching:(id)a3;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5;
- (id)dispatcherForEvent:(__IOHIDEvent *)a3;
- (id)systemPropertyForKey:(id)a3;
- (unint64_t)permittedRuleChangeMaskForAuditToken:(id)a3;
- (void)hidSystem:(id)a3 receivedUpdatedDeviceOrientation:(int64_t)a4;
- (void)injectGSEvent:(__GSEvent *)a3;
- (void)injectHIDEvent:(__IOHIDEvent *)a3;
- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4;
- (void)registerIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6;
- (void)registerWatchdog;
- (void)setHIDSystemChannel:(id)a3;
- (void)setSystemProperty:(id)a3 forKey:(id)a4;
- (void)startEventProcessing;
- (void)startEventRouting;
- (void)startHIDSystem;
- (void)startServer;
- (void)unregisterIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6;
@end

@implementation BKHIDSystemInterface

- (BKHIDSystemInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BKHIDSystemInterface;
  v2 = -[BKHIDSystemInterface init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[BKHIDSystem sharedInstance](&OBJC_CLASS___BKHIDSystem, "sharedInstance"));
    system = v2->_system;
    v2->_system = (BKHIDSystem *)v3;

    -[BKHIDSystem setDelegate:](v2->_system, "setDelegate:", v2);
  }

  return v2;
}

- (void)startHIDSystem
{
}

- (void)startEventRouting
{
}

- (void)startEventProcessing
{
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](&OBJC_CLASS___BKHIDEventProcessorRegistry, "sharedInstance"));
  id v3 = objc_alloc_init(&OBJC_CLASS___BKHIDEventProcessorCreationContext);
  [v3 setSystemInterface:self];
  [v3 setEventDispatcher:self];
  [v3 setServiceMatcherDataProvider:self];
  [v3 setEventProcessorRegistry:v11];
  uint64_t v4 = BKHIDCreatePrimaryEventProcessor(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___BKMainDisplayObserver);
  id v7 = objc_alloc_init(&OBJC_CLASS___BKHIDEventDeliveryObserverService);
  v8 = -[BKHIDEventDeliveryManager initWithObserverService:]( objc_alloc(&OBJC_CLASS___BKHIDEventDeliveryManager),  "initWithObserverService:",  v7);
  v9 = -[BKHIDEventDeliveryManagerServer initWithDeliveryManager:ruleChangeAuthority:]( objc_alloc(&OBJC_CLASS___BKHIDEventDeliveryManagerServer),  "initWithDeliveryManager:ruleChangeAuthority:",  v8,  self);
  deliveryManagerServer = self->_deliveryManagerServer;
  self->_deliveryManagerServer = v9;

  -[BKHIDSystem startEventProcessor:mainDisplayObserver:deliveryManager:dispatcherProvider:]( self->_system,  "startEventProcessor:mainDisplayObserver:deliveryManager:dispatcherProvider:",  v5,  v6,  v8,  self);
}

- (void)startServer
{
  id v3 = sub_10002153C("BKHIDSystem MiG server", (uint64_t)"com.apple.backboard.hid.services", (uint64_t)&off_1000B8570);
  uint64_t v4 = (OS_dispatch_mach *)objc_claimAutoreleasedReturnValue(v3);
  HIDSystemChannel = self->_HIDSystemChannel;
  self->_HIDSystemChannel = v4;

  uint64_t v7 = BKLogCommon(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "starting HID server...", v9, 2u);
  }

  -[BKHIDSystem startServerWithChannel:](self->_system, "startServerWithChannel:", self->_HIDSystemChannel);
}

- (unint64_t)permittedRuleChangeMaskForAuditToken:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance"));
  if (v3) {
    [v3 realToken];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  else {
    unint64_t v5 = 58LL;
  }

  return v5;
}

- (BKHIDEventDeliveryManager)deliveryManager
{
  return (BKHIDEventDeliveryManager *)-[BKHIDSystem deliveryManager](self->_system, "deliveryManager");
}

- (BKHIDEventSenderCache)senderCache
{
  return (BKHIDEventSenderCache *)-[BKHIDSystem senderCache](self->_system, "senderCache");
}

- (BKHIDClientConnectionManager)clientConnectionManager
{
  return (BKHIDClientConnectionManager *)-[BKHIDSystem clientConnectionManager]( self->_system,  "clientConnectionManager");
}

- (id)systemPropertyForKey:(id)a3
{
  return -[BKHIDSystem systemPropertyForKey:](self->_system, "systemPropertyForKey:", a3);
}

- (void)setSystemProperty:(id)a3 forKey:(id)a4
{
}

- (void)injectHIDEvent:(__IOHIDEvent *)a3
{
}

- (void)injectGSEvent:(__GSEvent *)a3
{
}

- (__IOHIDEvent)systemEventOfType:(unsigned int)a3 matchingEvent:(__IOHIDEvent *)a4 options:(unsigned int)a5
{
  return (__IOHIDEvent *)-[BKHIDSystem systemEventOfType:matchingEvent:options:]( self->_system,  "systemEventOfType:matchingEvent:options:",  *(void *)&a3,  a4,  *(void *)&a5);
}

- (BOOL)_routeSqueezeEventToSystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[BKIOHIDServicePersistentPropertyController digitizerServicePersistentPropertyController]( &OBJC_CLASS___BKIOHIDServicePersistentPropertyController,  "digitizerServicePersistentPropertyController"));
  id v11 = @"SqueezeIsSystemShortcut";
  unsigned __int8 v3 = 1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventSenderDescriptor stylusOpaqueTouchDigitizer]( &OBJC_CLASS___BKSHIDEventSenderDescriptor,  "stylusOpaqueTouchDigitizer"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentPropertiesForKeys:v5 forSenderDescriptor:v6]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"SqueezeIsSystemShortcut"]);
  if (([v8 BOOLValue] & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
    unsigned __int8 v3 = [v9 isSqueezeForSystemShortcutEnabled];
  }

  return v3;
}

- (id)dispatcherForEvent:(__IOHIDEvent *)a3
{
  int Type = IOHIDEventGetType(a3, a2);
  uint64_t v6 = self;
  if (Type == 39)
  {
    unsigned int IntegerValue = IOHIDEventGetIntegerValue(a3, 2555904LL);
    if (IntegerValue < 2
      || IntegerValue == 5 && !-[BKHIDSystemInterface _routeSqueezeEventToSystem](v6, "_routeSqueezeEventToSystem"))
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[BKTouchDeliveryGenericGestureFocusObserver sharedInstance]( &OBJC_CLASS___BKTouchDeliveryGenericGestureFocusObserver,  "sharedInstance"));

      uint64_t v6 = (BKHIDSystemInterface *)v8;
    }
  }

  return v6;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  return -[BKHIDSystemInterface destinationsForEvent:fromSender:overrideSenderDescriptor:]( self,  "destinationsForEvent:fromSender:overrideSenderDescriptor:",  a3,  a4,  0LL);
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5
{
  id v8 = a5;
  if (!v8)
  {
    id v9 = a4;
    id v11 = objc_msgSend(v9, "senderDescriptorForEventType:", IOHIDEventGetType(a3, v10));
    id v8 = (id)objc_claimAutoreleasedReturnValue(v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDSystem deliveryManager](self->_system, "deliveryManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 destinationsForEvent:a3 sender:v8]);

  return v13;
}

- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4
{
}

- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[BKHIDSystemInterface destinationsForEvent:fromSender:]( self,  "destinationsForEvent:fromSender:",  a3,  a4));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        BKSendHIDEventToClientWithDestination(a3, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (id)IOHIDServicesMatching:(id)a3
{
  return -[BKHIDSystem IOHIDServicesMatching:](self->_system, "IOHIDServicesMatching:", a3);
}

- (void)registerIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
}

- (void)unregisterIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
}

- (void)hidSystem:(id)a3 receivedUpdatedDeviceOrientation:(int64_t)a4
{
  id v5 = sub_100065B98();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  sub_100067088((uint64_t)v6, a4);
}

- (void)registerWatchdog
{
}

- (OS_dispatch_mach)HIDSystemChannel
{
  return (OS_dispatch_mach *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setHIDSystemChannel:(id)a3
{
}

- (BKHIDSystem)system
{
  return self->_system;
}

- (BKHIDEventDeliveryManagerServer)deliveryManagerServer
{
  return self->_deliveryManagerServer;
}

- (void).cxx_destruct
{
}

+ (BKHIDSystemInterface)sharedInstance
{
  if (qword_1000DC2A8 != -1) {
    dispatch_once(&qword_1000DC2A8, &stru_1000B82E0);
  }
  return (BKHIDSystemInterface *)(id)qword_1000DC2A0;
}

@end