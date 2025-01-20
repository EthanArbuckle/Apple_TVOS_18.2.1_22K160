@interface GCGamepadHIDServicePlugin
+ (BOOL)matchService:(unsigned int)a3 options:(id)a4 score:(int64_t *)a5;
- ($536A88BB5CAE6CA76785073378A79450)batteryReport;
- (BOOL)isAnyHapticMotorEnabled;
- (BOOL)isBluetoothClassic;
- (BOOL)isBluetoothLE;
- (BOOL)isHapticsActive;
- (BOOL)isIdle;
- (BOOL)isTwoAxisInputIdle:(GCGamepadHIDServicePlugin *)self prevInput:(SEL)a2 noiseBuffer:;
- (BOOL)isUSB;
- (BOOL)isVirtualDevice;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5;
- (BOOL)shouldCreateBatteryDevice;
- (BOOL)shouldDisconnectWhenIdle;
- (BOOL)updateHapticMotor:(id)a3;
- (GCGamepadHIDServicePlugin)initWithService:(unsigned int)a3;
- (HIDConnection)client;
- (HIDDevice)device;
- (HIDEventDispatcher)dispatcher;
- (HIDUserDevice)batteryUserDevice;
- (NSArray)hapticMotors;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (float)defaultHapticDispatchFrequency;
- (float)defaultIdleTimeoutDuration;
- (float)defaultLeftAxisSnapRadius;
- (float)defaultLeftThumbstickDeadzoneRadius;
- (float)defaultLeftThumbstickNoiseBuffer;
- (float)defaultRightAxisSnapRadius;
- (float)defaultRightThumbstickDeadzoneRadius;
- (float)defaultRightThumbstickNoiseBuffer;
- (float)hapticDispatchFrequency;
- (float)idleTimeoutDuration;
- (float)leftThumbstickAxisSnapRadius;
- (float)leftThumbstickDeadzoneRadius;
- (float)leftThumbstickNoiseBuffer;
- (float)rightThumbstickAxisSnapRadius;
- (float)rightThumbstickDeadzoneRadius;
- (float)rightThumbstickNoiseBuffer;
- (id)createEvent:(unsigned int)a3 timestamp:(unint64_t)a4;
- (id)createHIDDeviceForService:(unsigned int)a3;
- (id)defaultHapticMotors;
- (id)eventMatching:(id)a3 forClient:(id)a4;
- (id)propertyForKey:(id)a3 client:(id)a4;
- (unint64_t)lastEventTime;
- (unsigned)numberOfTimesToSendZeroHapticReport;
- (unsigned)service;
- (void)activate;
- (void)applyDeadzone:(float)a3 axisSnapRadius:(float)a4 input:;
- (void)cancel;
- (void)clientNotification:(id)a3 added:(BOOL)a4;
- (void)connectToAdaptiveTriggersServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToBatteryServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToGameIntentServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToGenericDeviceDriverConfigurationServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToLightServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToMotionServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToNintendoJoyConFusionGestureServiceWithClient:(id)a3 reply:(id)a4;
- (void)createVirtualHIDDeviceForBattery;
- (void)dealloc;
- (void)disconnect;
- (void)dispatchEvent:(id)a3;
- (void)dispatchEvent:(id)a3 withInputDelay:(BOOL)a4;
- (void)dispatchGameControllerExtendedEventWithState:(id *)a3 timestamp:(unint64_t)a4;
- (void)dispatchGameControllerExtendedEventWithState:(id *)a3 timestamp:(unint64_t)a4 children:(id)a5;
- (void)dispatchHomeButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)dispatchIdleEvent:(id)a3;
- (void)dispatchIdleEvent:(id)a3 withInputDelay:(BOOL)a4;
- (void)dispatchMenuButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)dispatchMotionEventWithState:(id *)a3 timestamp:(unint64_t)a4;
- (void)dispatchOptionsButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)dispatchSearchButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)dispatchShareButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4;
- (void)enableHaptics;
- (void)enqueueTransient:(id)a3 hapticMotor:(unint64_t)a4;
- (void)fetchDeviceRegistryIDWithReply:(id)a3;
- (void)initGameControllerDaemonXPC;
- (void)readBatteryWithReply:(id)a3;
- (void)scheduleIdleTimer;
- (void)sendBatteryReport;
- (void)setCancelHandler:(id)a3;
- (void)setClient:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setEventDispatcher:(id)a3;
- (void)setHapticDispatchFrequency:(float)a3;
- (void)setHapticMotor:(unint64_t)a3 frequency:(float)a4 amplitude:(float)a5;
- (void)setHapticMotors:(id)a3;
- (void)setIdleTimeoutDuration:(float)a3;
- (void)setLeftThumbstickAxisSnapRadius:(float)a3;
- (void)setLeftThumbstickDeadzoneRadius:(float)a3;
- (void)setLeftThumbstickNoiseBuffer:(float)a3;
- (void)setRightThumbstickAxisSnapRadius:(float)a3;
- (void)setRightThumbstickDeadzoneRadius:(float)a3;
- (void)setRightThumbstickNoiseBuffer:(float)a3;
- (void)stopHaptics;
- (void)updateClientBattery;
- (void)updateIdleState;
@end

@implementation GCGamepadHIDServicePlugin

+ (BOOL)matchService:(unsigned int)a3 options:(id)a4 score:(int64_t *)a5
{
  return 1;
}

- (void)initGameControllerDaemonXPC
{
  v3 = _os_activity_create( &dword_0,  "Connect To Daemon",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  v4 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.GameController.gamecontrollerd.driver",  4096LL);
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v4;

  objc_initWeak(&location, self->_daemonConnection);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_8E0C;
  v13[3] = &unk_145B8;
  objc_copyWeak(&v14, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_daemonConnection, "setInvalidationHandler:", v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_8EA0;
  v11[3] = &unk_145B8;
  objc_copyWeak(&v12, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_daemonConnection, "setInterruptionHandler:", v11);
  v6 = sub_5564();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSXPCConnection setRemoteObjectInterface:](self->_daemonConnection, "setRemoteObjectInterface:", v7);

  id v8 = sub_52BC();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSXPCConnection setExportedInterface:](self->_daemonConnection, "setExportedInterface:", v9);

  -[NSXPCConnection setExportedObject:](self->_daemonConnection, "setExportedObject:", self);
  -[NSXPCConnection resume](self->_daemonConnection, "resume");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_daemonConnection, "remoteObjectProxy"));
  [v10 driverCheckIn];

  os_activity_scope_leave(&state);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (GCGamepadHIDServicePlugin)initWithService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___GCGamepadHIDServicePlugin;
  v4 = -[GCGamepadHIDServicePlugin init](&v40, "init");
  if (v4)
  {
    id v5 = sub_438C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "initWithService: %d", buf, 8u);
    }

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.gamecontroller.serviceplugin", v8);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v9;

    v4->_service = v3;
    IOObjectRetain(v3);
    IORegistryEntryGetRegistryEntryID(v4->_service, &v4->_regID);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v4->_service, @"Transport", kCFAllocatorDefault, 0);
    id v12 = (void *)IORegistryEntryCreateCFProperty(v4->_service, @"isVirtual", kCFAllocatorDefault, 0);
    v4->_virtualDevice = [v12 BOOLValue];

    v4->_bluetoothClassic = [CFProperty isEqualToString:@"Bluetooth"];
    v4->_usb = [CFProperty isEqualToString:@"USB"];
    v4->_bluetoothLE = [CFProperty isEqualToString:@"BluetoothLowEnergy"];
    -[GCGamepadHIDServicePlugin defaultIdleTimeoutDuration](v4, "defaultIdleTimeoutDuration");
    v4->_idleTimeoutDuration = v13;
    v4->_lastEventTime = mach_absolute_time();
    id v14 = ($536A88BB5CAE6CA76785073378A79450 *)calloc(3uLL, 1uLL);
    v4->_batteryReport = v14;
    *(_WORD *)&v14->var0 = 25700;
    v15 = (NSString *)IORegistryEntryCreateCFProperty(v4->_service, @"SerialNumber", kCFAllocatorDefault, 0);
    uniqueIdentifier = v4->_uniqueIdentifier;
    v4->_uniqueIdentifier = v15;

    -[GCGamepadHIDServicePlugin defaultLeftThumbstickNoiseBuffer](v4, "defaultLeftThumbstickNoiseBuffer");
    v4->_leftThumbstickNoiseBuffer = v17;
    -[GCGamepadHIDServicePlugin defaultRightThumbstickNoiseBuffer](v4, "defaultRightThumbstickNoiseBuffer");
    v4->_rightThumbstickNoiseBuffer = v18;
    -[GCGamepadHIDServicePlugin defaultHapticDispatchFrequency](v4, "defaultHapticDispatchFrequency");
    v4->_hapticDispatchFrequency = v19;
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin defaultHapticMotors](v4, "defaultHapticMotors"));
    hapticMotors = v4->_hapticMotors;
    v4->_hapticMotors = (NSArray *)v20;

    -[GCGamepadHIDServicePlugin defaultLeftThumbstickDeadzoneRadius](v4, "defaultLeftThumbstickDeadzoneRadius");
    v4->_leftThumbstickDeadzoneRadius = v22;
    -[GCGamepadHIDServicePlugin defaultLeftAxisSnapRadius](v4, "defaultLeftAxisSnapRadius");
    v4->_leftThumbstickAxisSnapRadius = v23;
    -[GCGamepadHIDServicePlugin defaultRightThumbstickDeadzoneRadius](v4, "defaultRightThumbstickDeadzoneRadius");
    v4->_rightThumbstickDeadzoneRadius = v24;
    -[GCGamepadHIDServicePlugin defaultRightAxisSnapRadius](v4, "defaultRightAxisSnapRadius");
    v4->_rightThumbstickAxisSnapRadius = v25;
    id v26 = sub_438C();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t regID = v4->_regID;
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = regID;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "creating HIDDevice for service %#llx", buf, 0xCu);
    }

    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createHIDDeviceForService:](v4, "createHIDDeviceForService:", v3));
    device = v4->_device;
    v4->_device = (HIDDevice *)v29;

    if (v4->_device)
    {
      id v31 = sub_438C();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "opening HIDDevice", buf, 2u);
      }

      -[HIDDevice open](v4->_device, "open");
      if (-[GCGamepadHIDServicePlugin isBluetoothClassic](v4, "isBluetoothClassic"))
      {
        id v33 = sub_438C();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "registering for BTSessionCallbacks sessionEvent", buf, 2u);
        }

        *(void *)buf = sub_9384;
        BTSessionAttachWithQueue("com.apple.GameController.HID", buf, v4, v4->_internalQueue);
      }

      -[GCGamepadHIDServicePlugin createVirtualHIDDeviceForBattery](v4, "createVirtualHIDDeviceForBattery");
      id v35 = sub_438C();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_DEFAULT,  "registering for PBSPowerManagerDeviceWillSleepManualDistributedNotification",  buf,  2u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  v4,  (CFNotificationCallback)sub_9528,  PBSPowerManagerDeviceWillSleepManualDistributedNotification,  v4,  CFNotificationSuspensionBehaviorDeliverImmediately);
      -[GCGamepadHIDServicePlugin setupRawReportHandling](v4, "setupRawReportHandling");
      -[GCGamepadHIDServicePlugin initGameControllerDaemonXPC](v4, "initGameControllerDaemonXPC");
      v38 = v4;
    }

    else
    {
      v38 = 0LL;
    }
  }

  else
  {
    v38 = 0LL;
  }

  return v38;
}

- (void)dealloc
{
  id v3 = sub_438C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  PBSPowerManagerDeviceWillSleepManualDistributedNotification,  0LL);
  free(self->_batteryReport);
  if (self->_session) {
    BTSessionDetachWithQueue(&self->_session);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_queue_attr_t v7 = dispatchQueue;
  }

  else
  {
    dispatch_queue_attr_t v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  *(void *)buf = 0LL;
  v16 = buf;
  uint64_t v17 = 0x3032000000LL;
  float v18 = sub_9718;
  float v19 = sub_9728;
  uint64_t v20 = self->_device;
  device = self->_device;
  self->_device = 0LL;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_9730;
  block[3] = &unk_146A0;
  v10 = v7;
  float v13 = v10;
  id v14 = buf;
  dispatch_async(v10, block);
  IOObjectRelease(self->_service);

  _Block_object_dispose(buf, 8);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GCGamepadHIDServicePlugin;
  -[GCGamepadHIDServicePlugin dealloc](&v11, "dealloc");
}

- (NSString)description
{
  return (NSString *)@"GCGamepadHIDServicePlugin";
}

- (id)propertyForKey:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"BatteryCapacity"])
  {
    id v8 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", self->_batteryReport->var0);
LABEL_17:
    dispatch_queue_t v9 = v8;
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"IsPowerSupplyConnected"])
  {
    id v8 = -[NSNumber initWithBool:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithBool:", self->_batteryReport->var2 != 0);
    goto LABEL_17;
  }

  if ([v6 isEqualToString:@"ServicePluginDebug"])
  {
    dispatch_queue_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    objc_super v11 = (objc_class *)objc_opt_class(self, v10);
    id v12 = NSStringFromClass(v11);
    float v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, @"PluginName");

    if (self->_cancelHandler) {
      id v14 = &__kCFBooleanTrue;
    }
    else {
      id v14 = &__kCFBooleanFalse;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v14, @"cancelHandler");
    if (self->_dispatchQueue) {
      v15 = &__kCFBooleanTrue;
    }
    else {
      v15 = &__kCFBooleanFalse;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, @"dispatchQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_activated));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, @"activated");

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_clientAdded));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, @"clientAdded");

    float v18 = (void *)objc_claimAutoreleasedReturnValue( -[GCGamepadHIDServicePlugin propertyForKey:client:]( self,  "propertyForKey:client:",  @"BatteryCapacity",  v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v18,  @"BatteryCapacity");

    float v19 = (void *)objc_claimAutoreleasedReturnValue( -[GCGamepadHIDServicePlugin propertyForKey:client:]( self,  "propertyForKey:client:",  @"IsPowerSupplyConnected",  v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v19,  @"IsPowerSupplyConnected");
  }

  else
  {
    if ([v6 isEqualToString:@"GameControllerPointer"])
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      goto LABEL_17;
    }

    if ([v6 isEqualToString:@"InputDelay"])
    {
      id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_inputEventDelay));
      goto LABEL_17;
    }

    unsigned int v21 = [v6 isEqualToString:@"DeviceUsagePairs"];
    dispatch_queue_t v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[HIDDevice propertyForKey:](self->_device, "propertyForKey:", v6));
    if (v21)
    {
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray, v22);
      if ((objc_opt_isKindOfClass(v9, v23) & 1) != 0)
      {
        float v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &stru_146E0));
        uint64_t v25 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary filteredArrayUsingPredicate:](v9, "filteredArrayUsingPredicate:", v24));

        dispatch_queue_t v9 = (NSMutableDictionary *)v25;
      }
    }
  }

- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (sub_40CC())
  {
    id v15 = sub_438C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_CD10((uint64_t)v7, (uint64_t)v8, v16);
    }
  }

  if ([v8 isEqualToString:@"InputDelay"])
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      [v7 doubleValue];
      self->_inputEventDelay = v11;
      unsigned __int8 v12 = 1;
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  else
  {
    float v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin device](self, "device"));
    unsigned __int8 v12 = [v13 setProperty:v7 forKey:v8];
  }

  return v12;
}

- (id)eventMatching:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = sub_438C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "eventMatching: %@ client: %@", (uint8_t *)&v13, 0x16u);
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"EventType"]);
    uint64_t v10 = v9;
    if (v9)
    {
      else {
        id v9 = 0LL;
      }
    }

    id v11 = v9;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (void)setEventDispatcher:(id)a3
{
  id v4 = a3;
  id v5 = sub_438C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "setEventDispatcher %@", (uint8_t *)&v7, 0xCu);
  }

  objc_storeWeak((id *)&self->_dispatcher, v4);
}

- (void)setCancelHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_438C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v14 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "setCancelHandler %p", buf, 0xCu);
  }

  id v8 = objc_retainBlock(v4);
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = v8;

  objc_initWeak((id *)buf, self);
  device = self->_device;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_A074;
  v11[3] = &unk_145B8;
  objc_copyWeak(&v12, (id *)buf);
  -[HIDDevice setCancelHandler:](device, "setCancelHandler:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)activate
{
  id v3 = sub_438C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "activate", v5, 2u);
  }

  -[HIDDevice activate](self->_device, "activate");
  -[GCGamepadHIDServicePlugin scheduleIdleTimer](self, "scheduleIdleTimer");
  self->_activated = 1;
}

- (void)cancel
{
  id v3 = sub_438C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "cancel", buf, 2u);
  }

  -[NSXPCConnection invalidate](self->_daemonConnection, "invalidate");
  -[HIDDevice cancel](self->_device, "cancel");
  -[HIDDevice close](self->_device, "close");
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_A240;
  block[3] = &unk_14708;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  id v5 = sub_438C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    uint64_t v10 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "setDispatchQueue %p", (uint8_t *)&v9, 0xCu);
  }

  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v4;
  id v8 = v4;

  -[HIDDevice setDispatchQueue:](self->_device, "setDispatchQueue:", self->_dispatchQueue);
}

- (void)clientNotification:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_438C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "clientNotification %@ added: %d", (uint8_t *)&v10, 0x12u);
  }

  if (v4) {
    int v9 = v6;
  }
  else {
    int v9 = 0LL;
  }
  self->_clientAdded = v4;
  objc_storeWeak((id *)&self->_client, v9);
}

- (id)createHIDDeviceForService:(unsigned int)a3
{
  return -[HIDDevice initWithService:](objc_alloc(&OBJC_CLASS___HIDDevice), "initWithService:", *(void *)&a3);
}

- (void)disconnect
{
  if (-[GCGamepadHIDServicePlugin isBluetoothClassic](self, "isBluetoothClassic"))
  {
    id v3 = (void *)IORegistryEntrySearchCFProperty( self->_service,  "IOService",  @"SerialNumber",  kCFAllocatorDefault,  3u);
    BOOL v4 = v3;
    if (self->_session)
    {
      id v5 = [v3 cStringUsingEncoding:1];
      int v6 = BTDeviceAddressFromString(v5, v21);
      if (v6)
      {
        int v7 = v6;
        id v8 = sub_438C();
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v22 = 136315394;
          *(void *)&v22[4] = v5;
          __int16 v23 = 1024;
          int v24 = v7;
          int v10 = "GCHIDLog::disconnect: unable to get device address from %s; errCode = %d";
          id v11 = v22;
          __int16 v12 = v9;
          uint32_t v13 = 18;
LABEL_16:
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, v10, v11, v13);
        }

- (void)createVirtualHIDDeviceForBattery
{
  if (-[GCGamepadHIDServicePlugin shouldCreateBatteryDevice](self, "shouldCreateBatteryDevice"))
  {
    id v3 = sub_438C();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "creating battery device", (uint8_t *)&v19, 2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v6 = sub_45B0();
    int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 setObject:v7 forKeyedSubscript:@"ReportDescriptor"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_regID));
    [v5 setObject:v8 forKeyedSubscript:@"PhysicalDeviceUniqueID"];

    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_regID));
    [v5 setObject:v9 forKeyedSubscript:@"SerialNumber"];

    CFProperty = (void *)IORegistryEntryCreateCFProperty(self->_service, @"Transport", kCFAllocatorDefault, 0);
    [v5 setObject:CFProperty forKeyedSubscript:@"Transport"];

    id v11 = (void *)IORegistryEntryCreateCFProperty(self->_service, @"ProductID", kCFAllocatorDefault, 0);
    [v5 setObject:v11 forKeyedSubscript:@"ProductID"];

    __int16 v12 = (void *)IORegistryEntryCreateCFProperty(self->_service, @"VendorID", kCFAllocatorDefault, 0);
    [v5 setObject:v12 forKeyedSubscript:@"VendorID"];

    uint32_t v13 = (void *)IORegistryEntryCreateCFProperty(self->_service, @"Product", kCFAllocatorDefault, 0);
    [v5 setObject:v13 forKeyedSubscript:@"Product"];

    [v5 setObject:&off_15428 forKeyedSubscript:@"GameControllerType"];
    id v14 = -[HIDUserDevice initWithProperties:](objc_alloc(&OBJC_CLASS___HIDUserDevice), "initWithProperties:", v5);
    batteryUserDevice = self->_batteryUserDevice;
    self->_batteryUserDevice = v14;

    id v16 = sub_438C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = self->_batteryUserDevice;
      int v19 = 138412546;
      BOOL v20 = v18;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "created battery device %@ with properties %@",  (uint8_t *)&v19,  0x16u);
    }
  }

- (void)updateClientBattery
{
  if (self->_batteryReport)
  {
    id v3 = sub_438C();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int var0 = self->_batteryReport->var0;
      v6[0] = 67109120;
      v6[1] = var0;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "updateClientBattery reporting battery level %d%%",  (uint8_t *)v6,  8u);
    }

    -[GCBatteryServiceClientInterface updateBattery:isCharging:]( self->_batteryClient,  "updateBattery:isCharging:",  self->_batteryReport->var0,  self->_batteryReport->var2 != 0);
  }

- (void)sendBatteryReport
{
  if (self->_batteryUserDevice)
  {
    id v3 = sub_438C();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int var0 = self->_batteryReport->var0;
      v7[0] = 67109120;
      v7[1] = var0;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "updateBatteryStats reporting battery level %d%%",  (uint8_t *)v7,  8u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  self->_batteryReport,  3LL,  0LL));
    -[HIDUserDevice handleReport:error:](self->_batteryUserDevice, "handleReport:error:", v6, 0LL);
  }

- (BOOL)shouldCreateBatteryDevice
{
  return 1;
}

- (void)scheduleIdleTimer
{
  id v3 = sub_438C();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "scheduleIdleTimer", buf, 2u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_ABC8;
  block[3] = &unk_14708;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)updateIdleState
{
  if (-[GCGamepadHIDServicePlugin isIdle](self, "isIdle")
    && -[GCGamepadHIDServicePlugin shouldDisconnectWhenIdle](self, "shouldDisconnectWhenIdle"))
  {
    dispatch_source_cancel((dispatch_source_t)self->_idleDispatchSource);
    idleDispatchSource = self->_idleDispatchSource;
    self->_idleDispatchSource = 0LL;

    id v4 = sub_438C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "disconnectIfIdle disconnecting...", v6, 2u);
    }

    -[GCGamepadHIDServicePlugin disconnect](self, "disconnect");
  }

- (BOOL)isIdle
{
  unint64_t v3 = -[GCGamepadHIDServicePlugin lastEventTime](self, "lastEventTime");
  uint64_t v4 = mach_absolute_time() - v3;
  if (qword_1B460 != -1) {
    dispatch_once(&qword_1B460, &stru_14728);
  }
  float v5 = (float)(v4 * dword_1B468 / *(unsigned int *)algn_1B46C) / 1000000000.0;
  float idleTimeoutDuration = self->_idleTimeoutDuration;
  id v7 = sub_438C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = &stru_14970;
    if (v5 > idleTimeoutDuration) {
      int v9 = @" - will disconnect if permitted";
    }
    int v11 = 134218242;
    double v12 = v5;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "isIdle for %.2f seconds%@", (uint8_t *)&v11, 0x16u);
  }

  return v5 > idleTimeoutDuration;
}

- (BOOL)shouldDisconnectWhenIdle
{
  return 0;
}

- (id)createEvent:(unsigned int)a3 timestamp:(unint64_t)a4
{
  return  [[HIDEvent alloc] initWithType:*(void *)&a3 timestamp:a4 senderID:self->_regID];
}

- (void)dispatchEvent:(id)a3
{
}

- (void)dispatchIdleEvent:(id)a3
{
}

- (void)dispatchEvent:(id)a3 withInputDelay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4 && self->_inputEventDelay > 0.0)
  {
    kdebug_trace(835453012, self->_regID, [v6 timestamp], objc_msgSend(v6, "type"), 0);
    dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(self->_inputEventDelay * 1000000000.0));
    int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin dispatchQueue](self, "dispatchQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_B060;
    v10[3] = &unk_14750;
    v10[4] = self;
    id v11 = v7;
    dispatch_after(v8, v9, v10);
  }

  else
  {
    -[GCGamepadHIDServicePlugin dispatchEvent:](self, "dispatchEvent:", v6);
  }
}

- (void)dispatchIdleEvent:(id)a3 withInputDelay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4 && self->_inputEventDelay > 0.0)
  {
    kdebug_trace(835453012, self->_regID, [v6 timestamp], objc_msgSend(v6, "type"), 0);
    dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(self->_inputEventDelay * 1000000000.0));
    int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin dispatchQueue](self, "dispatchQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_B180;
    v10[3] = &unk_14750;
    v10[4] = self;
    id v11 = v7;
    dispatch_after(v8, v9, v10);
  }

  else
  {
    -[GCGamepadHIDServicePlugin dispatchIdleEvent:](self, "dispatchIdleEvent:", v6);
  }
}

- (void)applyDeadzone:(float)a3 axisSnapRadius:(float)a4 input:
{
  v5.f32[0] = fabsf(COERCE_FLOAT(*v4));
  float32x2_t v6 = (float32x2_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&a4, v5), 0);
  v7.i32[1] = HIDWORD(*(unint64_t *)v4);
  v7.i32[0] = 0;
  int8x8_t v8 = vbsl_s8((int8x8_t)v6, v7, *v4);
  v6.f32[0] = fabsf(*(float *)&v8.i32[1]);
  float32x2_t v9 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&a4, v6), 0), (int8x8_t)v8.u32[0], v8);
  float32x2_t v10 = vmul_f32(v9, v9);
  float v11 = sqrtf(vaddv_f32(v10));
  float32x2_t v12 = 0LL;
  if (v11 > a3)
  {
    float32x2_t v13 = vadd_f32(v10, (float32x2_t)vdup_lane_s32((int32x2_t)v10, 1));
    float v14 = v11 - a3;
    float32x2_t v15 = vrsqrte_f32(v13);
    float32x2_t v16 = vmul_f32(v15, vrsqrts_f32(v13, vmul_f32(v15, v15)));
    *(float *)v17.i32 = 1.0 - a3;
    float32x2_t v18 = vdiv_f32( vmul_n_f32(vmul_n_f32(v9, vmul_f32(v16, vrsqrts_f32(v13, vmul_f32(v16, v16))).f32[0]), v14),  (float32x2_t)vdup_lane_s32(v17, 0));
    __asm { FMOV            V1.2S, #1.0 }

    float32x2_t v24 = vminnm_f32(v18, _D1);
    __asm { FMOV            V1.2S, #-1.0 }

    float32x2_t v12 = vmaxnm_f32(v24, _D1);
  }

  int8x8_t *v4 = (int8x8_t)v12;
}

- (BOOL)isTwoAxisInputIdle:(GCGamepadHIDServicePlugin *)self prevInput:(SEL)a2 noiseBuffer:
{
  float32x2_t v5 = *v2;
  BOOL v6 = COERCE_FLOAT(HIDWORD(*(unint64_t *)v3)) == 0.0;
  if (COERCE_FLOAT(*v3) != 0.0) {
    BOOL v6 = 0;
  }
  BOOL v7 = v5.f32[0] != 0.0 || v6;
  float32x2_t v8 = vsub_f32(v5, *v3);
  return sqrtf(vaddv_f32(vmul_f32(v8, v8))) < v4 && v7;
}

- (void)dispatchMotionEventWithState:(id *)a3 timestamp:(unint64_t)a4
{
  if (a3->var0 || a3->var4 || a3->var8)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 1LL, a4));
    [v11 setIntegerValue:65280 forField:0x10000];
    [v11 setIntegerValue:59 forField:65537];
    [v11 setIntegerValue:1 forField:65538];
    if (a3->var0)
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 20LL, a4));
      IOHIDEventSetEventFlags(v7, 1LL);
      [v7 setDoubleValue:1310720 forField:a3->var1];
      [v7 setDoubleValue:1310721 forField:a3->var2];
      [v7 setDoubleValue:1310722 forField:a3->var3];
      [v7 setIntegerValue:self->_motionSequenceNumber forField:1310725];
      IOHIDEventAppendEvent(v11, v7, 0LL);
    }

    if (a3->var4)
    {
      float32x2_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 13LL, a4));
      IOHIDEventSetEventFlags(v8, 1LL);
      [v8 setDoubleValue:851968 forField:a3->var5];
      [v8 setDoubleValue:851969 forField:a3->var6];
      [v8 setDoubleValue:851970 forField:a3->var7];
      [v8 setIntegerValue:self->_motionSequenceNumber forField:851973];
      IOHIDEventAppendEvent(v11, v8, 0LL);
    }

    if (a3->var8)
    {
      uint64_t v9 = mach_absolute_time();
      QuaternionOrientationEvent = (void *)IOHIDEventCreateQuaternionOrientationEvent( kCFAllocatorDefault,  v9,  1LL,  a3->var12,  a3->var9,  a3->var10,  a3->var11);
      IOHIDEventAppendEvent(v11, QuaternionOrientationEvent, 0LL);
    }

    ++self->_motionSequenceNumber;
    -[GCGamepadHIDServicePlugin dispatchIdleEvent:withInputDelay:](self, "dispatchIdleEvent:withInputDelay:", v11, 1LL);
  }

- (void)dispatchGameControllerExtendedEventWithState:(id *)a3 timestamp:(unint64_t)a4 children:(id)a5
{
  id v8 = a5;
  float64x2_t v9 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[2]);
  float64x2_t v52 = vcvtq_f64_f32(*(float32x2_t *)a3->var1);
  float64x2_t v53 = v9;
  float64x2_t v10 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[6]);
  float64x2_t v54 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[4]);
  float64x2_t v55 = v10;
  float64x2_t v11 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[18]);
  float64x2_t v56 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1[8]);
  float64x2_t v57 = v11;
  v12.i32[0] = LODWORD(a3->var1[10]);
  v12.i32[1] = LODWORD(a3->var1[13]);
  int32x2_t v13 = (int32x2_t)vsub_f32(v12, *(float32x2_t *)&a3->var1[11]);
  *(float *)v11.f64 = a3->var1[14];
  float32x2_t v14 = *(float32x2_t *)&a3->var1[15];
  HIDWORD(v11.f64[0]) = LODWORD(a3->var1[17]);
  uint64_t v59 = 0LL;
  double v15 = COERCE_DOUBLE(vrev64_s32(v13));
  *(int32x2_t *)&v11.f64[0] = vrev64_s32((int32x2_t)vsub_f32(*(float32x2_t *)&v11.f64[0], v14));
  *(double *)&__int128 v58 = v15;
  *((void *)&v58 + 1) = *(void *)&v11.f64[0];
  *(float *)v11.f64 = a3->var1[21];
  LOBYTE(v59) = a3->var1[20] != 0.0;
  BYTE1(v59) = *(float *)v11.f64 != 0.0;
  *(float *)&double v15 = self->_leftThumbstickDeadzoneRadius;
  *(float *)v11.f64 = self->_leftThumbstickAxisSnapRadius;
  -[GCGamepadHIDServicePlugin applyDeadzone:axisSnapRadius:input:]( self,  "applyDeadzone:axisSnapRadius:input:",  &v58,  v15,  v11.f64[0]);
  *(float *)&double v16 = self->_rightThumbstickDeadzoneRadius;
  *(float *)&double v17 = self->_rightThumbstickAxisSnapRadius;
  -[GCGamepadHIDServicePlugin applyDeadzone:axisSnapRadius:input:]( self,  "applyDeadzone:axisSnapRadius:input:",  (char *)&v58 + 8,  v16,  v17);
  *(float *)&double v18 = self->_leftThumbstickNoiseBuffer;
  unsigned __int8 v19 = -[GCGamepadHIDServicePlugin isTwoAxisInputIdle:prevInput:noiseBuffer:]( self,  "isTwoAxisInputIdle:prevInput:noiseBuffer:",  &v58,  self->_anon_98,  v18);
  *(float *)&double v20 = self->_rightThumbstickNoiseBuffer;
  unsigned __int8 v21 = -[GCGamepadHIDServicePlugin isTwoAxisInputIdle:prevInput:noiseBuffer:]( self,  "isTwoAxisInputIdle:prevInput:noiseBuffer:",  (char *)&v58 + 8,  &self->_anon_98[8],  v20);
  if ((v19 & 1) == 0) {
    a3->var0 |= 0x3C00uLL;
  }
  if ((v21 & 1) == 0) {
    a3->var0 |= 0x3C000uLL;
  }
  for (uint64_t i = 0LL; i != 47; ++i)
  {
  }

  if (a3->var0)
  {
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 35LL, a4));
    [v23 setDoubleValue:2293761 forField:v52.f64[0]];
    [v23 setDoubleValue:2293762 forField:v52.f64[1]];
    [v23 setDoubleValue:2293763 forField:v53.f64[0]];
    [v23 setDoubleValue:2293764 forField:v53.f64[1]];
    [v23 setDoubleValue:2293767 forField:v55.f64[0]];
    [v23 setDoubleValue:2293768 forField:v55.f64[1]];
    [v23 setDoubleValue:2293765 forField:v54.f64[0]];
    [v23 setDoubleValue:2293766 forField:v54.f64[1]];
    [v23 setDoubleValue:2293769 forField:v56.f64[0]];
    [v23 setDoubleValue:2293771 forField:v57.f64[0]];
    [v23 setIntegerValue:v59 forField:2293777];
    [v23 setDoubleValue:2293770 forField:v56.f64[1]];
    [v23 setDoubleValue:2293772 forField:v57.f64[1]];
    [v23 setIntegerValue:BYTE1(v59) forField:2293778];
    [v23 setDoubleValue:2293773 forField:*(float *)&v58];
    [v23 setDoubleValue:2293774 forField:*((float *)&v58 + 1)];
    [v23 setDoubleValue:2293775 forField:*((float *)&v58 + 2)];
    [v23 setDoubleValue:2293776 forField:*((float *)&v58 + 3)];
    [v23 setIntegerValue:HIDWORD(v59) forField:2293760];
    v24.i32[0] = v58;
    int32x2_t v25 = *(int32x2_t *)((char *)&v58 + 8);
    float32x2_t v26 = (float32x2_t)vrev64_s32(*(int32x2_t *)&v58);
    a3->var1[10] = fmaxf(*((float *)&v58 + 1), 0.0);
    *(int8x8_t *)&a3->var1[11] = vand_s8((int8x8_t)vneg_f32(v26), (int8x8_t)vcltz_f32(v26));
    v24.i32[1] = v25.i32[1];
    float32x2_t v27 = (float32x2_t)vrev64_s32(v25);
    *(float32x2_t *)&a3->var1[13] = vmaxnm_f32(v24, 0LL);
    *(int8x8_t *)&a3->var1[15] = vand_s8((int8x8_t)vneg_f32(v27), (int8x8_t)vcltz_f32(v27));
    a3->var1[17] = fmaxf(*(float *)v25.i32, 0.0);
    uint64_t v28 = mach_absolute_time();
    VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent( kCFAllocatorDefault,  v28,  0x10000LL,  65537LL,  1LL,  a3,  200LL,  0LL);
    IOHIDEventSetIntegerValue(VendorDefinedEvent, 0x10000LL, 65280LL);
    IOHIDEventSetIntegerValue(VendorDefinedEvent, 65537LL, 67LL);
    IOHIDEventAppendEvent(v23, VendorDefinedEvent, 0LL);
    if (VendorDefinedEvent) {
      CFRelease(VendorDefinedEvent);
    }
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v30 = v8;
    id v31 = [v30 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v49;
      do
      {
        for (j = 0LL; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v49 != v33) {
            objc_enumerationMutation(v30);
          }
          objc_msgSend(v23, "appendEvent:", *(void *)(*((void *)&v48 + 1) + 8 * (void)j), (void)v48);
        }

        id v32 = [v30 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }

      while (v32);
    }

    -[GCGamepadHIDServicePlugin dispatchEvent:withInputDelay:](self, "dispatchEvent:withInputDelay:", v23, 1LL);
    float64x2_t v35 = v53;
    *(float64x2_t *)&self->_gameControllerState.directionPadUp = v52;
    *(float64x2_t *)&self->_gameControllerState.directionPadLeft = v35;
    float64x2_t v36 = v55;
    *(float64x2_t *)&self->_gameControllerState.buttonA = v54;
    *(float64x2_t *)&self->_gameControllerState.buttonX = v36;
    *(void *)&self->_anon_98[16] = v59;
    __int128 v37 = v58;
    float64x2_t v38 = v56;
    *(float64x2_t *)&self->_gameControllerState.buttonL2 = v57;
    *(_OWORD *)self->_anon_98 = v37;
    *(float64x2_t *)&self->_gameControllerState.buttonL1 = v38;
    *(_OWORD *)&self->_gameControllerExtendedState.mask = *(_OWORD *)&a3->var0;
    __int128 v39 = *(_OWORD *)&a3->var1[2];
    __int128 v40 = *(_OWORD *)&a3->var1[6];
    __int128 v41 = *(_OWORD *)&a3->var1[14];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[10] = *(_OWORD *)&a3->var1[10];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[14] = v41;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[2] = v39;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[6] = v40;
    __int128 v42 = *(_OWORD *)&a3->var1[18];
    __int128 v43 = *(_OWORD *)&a3->var1[22];
    __int128 v44 = *(_OWORD *)&a3->var1[30];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[26] = *(_OWORD *)&a3->var1[26];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[30] = v44;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[18] = v42;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[22] = v43;
    __int128 v45 = *(_OWORD *)&a3->var1[34];
    __int128 v46 = *(_OWORD *)&a3->var1[38];
    __int128 v47 = *(_OWORD *)&a3->var1[42];
    *(void *)&self->_gameControllerExtendedState.buttons[46] = *(void *)&a3->var1[46];
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[38] = v46;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[42] = v47;
    *(_OWORD *)&self->_gameControllerExtendedState.buttons[34] = v45;
  }
}

- (void)dispatchGameControllerExtendedEventWithState:(id *)a3 timestamp:(unint64_t)a4
{
  __int128 v4 = *(_OWORD *)&a3->var1[42];
  v10[10] = *(_OWORD *)&a3->var1[38];
  v10[11] = v4;
  uint64_t v11 = *(void *)&a3->var1[46];
  __int128 v5 = *(_OWORD *)&a3->var1[26];
  v10[6] = *(_OWORD *)&a3->var1[22];
  v10[7] = v5;
  __int128 v6 = *(_OWORD *)&a3->var1[34];
  v10[8] = *(_OWORD *)&a3->var1[30];
  v10[9] = v6;
  __int128 v7 = *(_OWORD *)&a3->var1[10];
  v10[2] = *(_OWORD *)&a3->var1[6];
  v10[3] = v7;
  __int128 v8 = *(_OWORD *)&a3->var1[18];
  v10[4] = *(_OWORD *)&a3->var1[14];
  void v10[5] = v8;
  __int128 v9 = *(_OWORD *)&a3->var1[2];
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v9;
  -[GCGamepadHIDServicePlugin dispatchGameControllerExtendedEventWithState:timestamp:children:]( self,  "dispatchGameControllerExtendedEventWithState:timestamp:children:",  v10,  a4,  0LL);
}

- (void)dispatchHomeButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonHome != a3)
  {
    BOOL v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 3LL, a4));
    IOHIDEventSetEventFlags(v6, 1LL);
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:547 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    -[GCGamepadHIDServicePlugin dispatchEvent:withInputDelay:](self, "dispatchEvent:withInputDelay:", v6, 1LL);
    self->_buttonHome = v4;
  }

- (void)dispatchMenuButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonMenu != a3)
  {
    BOOL v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 3LL, a4));
    IOHIDEventSetEventFlags(v6, 1LL);
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:516 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    -[GCGamepadHIDServicePlugin dispatchEvent:withInputDelay:](self, "dispatchEvent:withInputDelay:", v6, 1LL);
    self->_buttonMenu = v4;
  }

- (void)dispatchOptionsButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonOptions != a3)
  {
    BOOL v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 3LL, a4));
    IOHIDEventSetEventFlags(v6, 1LL);
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:521 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    -[GCGamepadHIDServicePlugin dispatchEvent:withInputDelay:](self, "dispatchEvent:withInputDelay:", v6, 1LL);
    self->_buttonOptions = v4;
  }

- (void)dispatchSearchButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonSearch != a3)
  {
    BOOL v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 3LL, a4));
    IOHIDEventSetEventFlags(v6, 1LL);
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:545 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    -[GCGamepadHIDServicePlugin dispatchEvent:withInputDelay:](self, "dispatchEvent:withInputDelay:", v6, 1LL);
    self->_buttonSearch = v4;
  }

- (void)dispatchShareButtonEventWithValue:(BOOL)a3 timestamp:(unint64_t)a4
{
  if (self->_buttonShare != a3)
  {
    BOOL v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin createEvent:timestamp:](self, "createEvent:timestamp:", 3LL, a4));
    IOHIDEventSetEventFlags(v6, 1LL);
    [v6 setIntegerValue:12 forField:196608];
    [v6 setIntegerValue:178 forField:196609];
    [v6 setIntegerValue:v4 forField:196610];
    [v6 setIntegerValue:1 forField:196612];
    -[GCGamepadHIDServicePlugin dispatchEvent:withInputDelay:](self, "dispatchEvent:withInputDelay:", v6, 1LL);
    self->_buttonShare = v4;
  }

- (BOOL)isAnyHapticMotorEnabled
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin hapticMotors](self, "hapticMotors", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v5) {
        objc_enumerationMutation(v2);
      }
      __int128 v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
      [v7 frequency];
      if (v8 <= 0.0)
      {
        BOOL v9 = 0;
      }

      else if ([v7 features])
      {
        [v7 amplitude];
        BOOL v9 = v10 > 0.0;
      }

      else
      {
        BOOL v9 = 1;
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 queuedTransients]);
      id v12 = [v11 count];

      BOOL v13 = 1;
      if (v9 || v12) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }

  else
  {
LABEL_15:
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isHapticsActive
{
  return self->_hapticsActive;
}

- (unsigned)numberOfTimesToSendZeroHapticReport
{
  return 1;
}

- (void)stopHaptics
{
  if (self->_hapticsActive)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin hapticMotors](self, "hapticMotors", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          BOOL v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          LODWORD(v5) = 0;
          [v9 setFrequency:v5];
          LODWORD(v10) = 0;
          [v9 setAmplitude:v10];
        }

        id v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v6);
    }

    if (!self->_pendingHapticZeroReports) {
      self->_pendingHapticZeroReports = -[GCGamepadHIDServicePlugin numberOfTimesToSendZeroHapticReport]( self,  "numberOfTimesToSendZeroHapticReport");
    }
    -[GCGamepadHIDServicePlugin dispatchHapticEvent](self, "dispatchHapticEvent");
    int v11 = self->_pendingHapticZeroReports - 1;
    self->_pendingHapticZeroReports = v11;
    if (!v11)
    {
      self->_hapticsActive = 0;
      dispatch_source_cancel((dispatch_source_t)self->_hapticDispatchSource);
      hapticDispatchSource = self->_hapticDispatchSource;
      self->_hapticDispatchSource = 0LL;
    }
  }

- (BOOL)updateHapticMotor:(id)a3
{
  id v4 = a3;
  if (([v4 index] & 0x80000000) == 0)
  {
    signed int v5 = [v4 index];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin hapticMotors](self, "hapticMotors"));
    id v7 = [v6 count];

    if ((unint64_t)v7 > v5)
    {
      float v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin hapticMotors](self, "hapticMotors"));
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", (int)objc_msgSend(v4, "index")));

      [v9 applyValuesFrom:v4];
    }
  }

  return 1;
}

- (void)enableHaptics
{
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_C230;
  v4[3] = &unk_145B8;
  objc_copyWeak(&v5, &location);
  dispatch_async(internalQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (float)defaultLeftThumbstickNoiseBuffer
{
  return 0.0;
}

- (float)defaultRightThumbstickNoiseBuffer
{
  return 0.0;
}

- (float)defaultIdleTimeoutDuration
{
  return 900.0;
}

- (float)defaultLeftThumbstickDeadzoneRadius
{
  return 0.125;
}

- (float)defaultRightThumbstickDeadzoneRadius
{
  return 0.125;
}

- (float)defaultLeftAxisSnapRadius
{
  return 0.0;
}

- (float)defaultRightAxisSnapRadius
{
  return 0.0;
}

- (id)defaultHapticMotors
{
  return +[NSArray array](&OBJC_CLASS___NSArray, "array");
}

- (float)defaultHapticDispatchFrequency
{
  return 0.015;
}

- (void)fetchDeviceRegistryIDWithReply:(id)a3
{
  if (self) {
    unint64_t regID = self->_regID;
  }
  else {
    unint64_t regID = 0LL;
  }
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", regID));
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0LL);
}

- (void)setHapticMotor:(unint64_t)a3 frequency:(float)a4 amplitude:(float)a5
{
  BOOL v9 = objc_alloc(&OBJC_CLASS___GCHapticMotor);
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  id v12 = -[GCHapticMotor initWithIndex:name:features:frequency:amplitude:]( v9,  "initWithIndex:name:features:frequency:amplitude:",  a3,  0LL,  1LL,  v10,  v11);
  -[GCGamepadHIDServicePlugin updateHapticMotor:](self, "updateHapticMotor:", v12);
}

- (void)enqueueTransient:(id)a3 hapticMotor:(unint64_t)a4
{
  id v10 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin hapticMotors](self, "hapticMotors"));
  id v7 = [v6 count];

  if ((unint64_t)v7 > a4)
  {
    float v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCGamepadHIDServicePlugin hapticMotors](self, "hapticMotors"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:a4]);

    [v9 enqueueHapticTransientEvent:v10];
  }
}

- (void)connectToNintendoJoyConFusionGestureServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToLightServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToAdaptiveTriggersServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToMotionServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToBatteryServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = (GCBatteryServiceClientInterface *)a3;
  id v7 = (void (**)(id, GCGamepadHIDServicePlugin *, void))a4;
  id v8 = sub_438C();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "connectToBatteryServiceWithClient %@", (uint8_t *)&v11, 0xCu);
  }

  batteryClient = self->_batteryClient;
  self->_batteryClient = v6;

  v7[2](v7, self, 0LL);
}

- (void)connectToGameIntentServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)connectToGenericDeviceDriverConfigurationServiceWithClient:(id)a3 reply:(id)a4
{
}

- (void)readBatteryWithReply:(id)a3
{
  id v5 = a3;
  if (-[GCGamepadHIDServicePlugin batteryReport](self, "batteryReport")
    && *(_BYTE *)-[GCGamepadHIDServicePlugin batteryReport](self, "batteryReport"))
  {
    -[GCGamepadHIDServicePlugin batteryReport](self, "batteryReport");
    -[GCGamepadHIDServicePlugin batteryReport](self, "batteryReport");
    id v4 = (void (*)(void))v5[2];
  }

  else
  {
    id v4 = (void (*)(void))v5[2];
  }

  v4();
}

- (HIDConnection)client
{
  return (HIDConnection *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
}

- (HIDEventDispatcher)dispatcher
{
  return (HIDEventDispatcher *)objc_loadWeakRetained((id *)&self->_dispatcher);
}

- (void)setDispatcher:(id)a3
{
}

- (unsigned)service
{
  return self->_service;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (HIDDevice)device
{
  return self->_device;
}

- (HIDUserDevice)batteryUserDevice
{
  return self->_batteryUserDevice;
}

- (unint64_t)lastEventTime
{
  return self->_lastEventTime;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- ($536A88BB5CAE6CA76785073378A79450)batteryReport
{
  return self->_batteryReport;
}

- (BOOL)isBluetoothClassic
{
  return self->_bluetoothClassic;
}

- (BOOL)isUSB
{
  return self->_usb;
}

- (BOOL)isBluetoothLE
{
  return self->_bluetoothLE;
}

- (BOOL)isVirtualDevice
{
  return self->_virtualDevice;
}

- (float)idleTimeoutDuration
{
  return self->_idleTimeoutDuration;
}

- (void)setIdleTimeoutDuration:(float)a3
{
  self->_float idleTimeoutDuration = a3;
}

- (float)leftThumbstickNoiseBuffer
{
  return self->_leftThumbstickNoiseBuffer;
}

- (void)setLeftThumbstickNoiseBuffer:(float)a3
{
  self->_leftThumbstickNoiseBuffer = a3;
}

- (float)rightThumbstickNoiseBuffer
{
  return self->_rightThumbstickNoiseBuffer;
}

- (void)setRightThumbstickNoiseBuffer:(float)a3
{
  self->_rightThumbstickNoiseBuffer = a3;
}

- (float)hapticDispatchFrequency
{
  return self->_hapticDispatchFrequency;
}

- (void)setHapticDispatchFrequency:(float)a3
{
  self->_hapticDispatchFrequency = a3;
}

- (NSArray)hapticMotors
{
  return self->_hapticMotors;
}

- (void)setHapticMotors:(id)a3
{
}

- (float)leftThumbstickDeadzoneRadius
{
  return self->_leftThumbstickDeadzoneRadius;
}

- (void)setLeftThumbstickDeadzoneRadius:(float)a3
{
  self->_leftThumbstickDeadzoneRadius = a3;
}

- (float)leftThumbstickAxisSnapRadius
{
  return self->_leftThumbstickAxisSnapRadius;
}

- (void)setLeftThumbstickAxisSnapRadius:(float)a3
{
  self->_leftThumbstickAxisSnapRadius = a3;
}

- (float)rightThumbstickDeadzoneRadius
{
  return self->_rightThumbstickDeadzoneRadius;
}

- (void)setRightThumbstickDeadzoneRadius:(float)a3
{
  self->_rightThumbstickDeadzoneRadius = a3;
}

- (float)rightThumbstickAxisSnapRadius
{
  return self->_rightThumbstickAxisSnapRadius;
}

- (void)setRightThumbstickAxisSnapRadius:(float)a3
{
  self->_rightThumbstickAxisSnapRadius = a3;
}

- (void).cxx_destruct
{
}

@end