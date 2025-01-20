@interface MSCRODMobileBrailleDisplay
+ (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 modelIdentifier:(id)a5 mainSize:(id)a6 statusSize:(id)a7 inputMode:(id)a8 delegate:(id)a9 reconnectionEnabled:(BOOL)a10;
+ (id)displayWithIOElement:(id)a3 cachedInfo:(id)a4 delegate:(id)a5 reconnectionEnabled:(BOOL)a6;
+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5;
+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5 reconnectionEnabled:(BOOL)a6;
- (BOOL)isBluetoothHID;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPersistentConnection;
- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 ioElement:(id)a5 delegate:(id)a6;
- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 modelIdentifier:(id)a5 ioElement:(id)a6 mainSize:(int64_t)a7 statusSize:(int64_t)a8 inputMode:(int)a9 delegate:(id)a10 reconnectionEnabled:(BOOL)a11;
- (id)bluetoothAddress;
- (id)configuration;
- (id)description;
- (void)_delayedAddDeviceNotification:(id)a3;
- (void)_delayedDeviceUpdatedNotification:(id)a3;
- (void)_delayedDisplayLoad;
- (void)_delayedRemoveDeviceNotification:(id)a3;
- (void)_enableReconnectionTimer:(BOOL)a3;
- (void)_processDeviceConnectionCallback:(int)a3 brailleDriver:(id)a4 ioElement:(id)a5;
- (void)_processInitialDeviceConnectionCallback:(int)a3 device:(id)a4 brailleDriver:(id)a5 ioElement:(id)a6;
- (void)_reconnectionEventHandler;
- (void)_reconnectionTriggeredHandler;
- (void)_reloadDriver;
- (void)_resetReconnectionTimer;
- (void)_runThread;
- (void)_setupDriverSupport;
- (void)_startWatchingForDevices;
- (void)_stopWatchingForDevices;
- (void)_unloadHandler;
- (void)addDeviceFailedNotification:(id)a3;
- (void)addDeviceNotification:(id)a3;
- (void)connectionStatusChanged:(id)a3;
- (void)dealloc;
- (void)deviceUpdatedNotification:(id)a3;
- (void)invalidate;
- (void)removeDeviceNotification:(id)a3;
- (void)sleep;
- (void)unsleep;
@end

@implementation MSCRODMobileBrailleDisplay

+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  LOBYTE(v6) = 1;
  return +[MSCRODMobileBrailleDisplay _displayWithIOElement:driverIdentifier:modelIdentifier:mainSize:statusSize:inputMode:delegate:reconnectionEnabled:]( &OBJC_CLASS___MSCRODMobileBrailleDisplay,  "_displayWithIOElement:driverIdentifier:modelIdentifier:mainSize:statusSize:inputMode:delegate:reconnectionEnabled:",  a3,  a4,  0LL,  0LL,  0LL,  0LL,  a5,  v6);
}

+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5 reconnectionEnabled:(BOOL)a6
{
  LOBYTE(v7) = a6;
  return +[MSCRODMobileBrailleDisplay _displayWithIOElement:driverIdentifier:modelIdentifier:mainSize:statusSize:inputMode:delegate:reconnectionEnabled:]( &OBJC_CLASS___MSCRODMobileBrailleDisplay,  "_displayWithIOElement:driverIdentifier:modelIdentifier:mainSize:statusSize:inputMode:delegate:reconnectionEnabled:",  a3,  a4,  0LL,  0LL,  0LL,  0LL,  a5,  v7);
}

+ (id)displayWithIOElement:(id)a3 cachedInfo:(id)a4 delegate:(id)a5 reconnectionEnabled:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kSCROBrailleDisplayDriverIdentifier]);
  if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kSCROBrailleDisplayModelIdentifier]);
    if ((objc_opt_isKindOfClass(v15, v13) & 1) == 0)
    {

      v15 = 0LL;
    }

    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kSCROBrailleDisplayMainSize]);
    if ((objc_opt_isKindOfClass(v18, v17) & 1) == 0)
    {

      v18 = 0LL;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kSCROBrailleDisplayStatusSize]);
    if ((objc_opt_isKindOfClass(v19, v17) & 1) == 0)
    {

      v19 = 0LL;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kSCROBrailleDisplayBrailleInputMode]);
    if ((objc_opt_isKindOfClass(v20, v17) & 1) == 0)
    {

      v20 = 0LL;
    }

    LOBYTE(v23) = a6;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODMobileBrailleDisplay _displayWithIOElement:driverIdentifier:modelIdentifier:mainSize:statusSize:inputMode:delegate:reconnectionEnabled:]( &OBJC_CLASS___MSCRODMobileBrailleDisplay,  "_displayWithIOElement:driverIdentifier:modelIdentifier:mainSize:statusSize:inputMode:delegate:reco nnectionEnabled:",  v9,  v14,  v15,  v18,  v19,  v20,  v11,  v23));
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

+ (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 modelIdentifier:(id)a5 mainSize:(id)a6 statusSize:(id)a7 inputMode:(id)a8 delegate:(id)a9 reconnectionEnabled:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = 0LL;
  if (v16 && v17)
  {
    if ([v16 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol])
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle brailleDriverBundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "brailleDriverBundleWithIdentifier:",  v17));
      v70 = v24;
      if (v24)
      {
        v25 = (objc_class *)[v24 principalClass];
        if ((+[SCROBrailleDisplay brailleDriverClassIsValid:]( &OBJC_CLASS___SCROBrailleDisplay,  "brailleDriverClassIsValid:",  v25) & 1) != 0)
        {
          id v68 = v18;
          id v26 = [objc_allocWithZone(v25) init];
          id v27 = v26;
          if (v26)
          {
            if ([v26 interfaceVersion] == (id)4)
            {
              id v66 = objc_allocWithZone((Class)objc_opt_class(a1, v28));
              id v29 = [v19 integerValue];
              id v30 = [v20 integerValue];
              LOBYTE(v64) = a10;
              LODWORD(v63) = [v21 integerValue];
              id v23 = [v66 _initWithDriver:v27 driverIdentifier:v17 modelIdentifier:v68 ioElement:v16 mainSize:v29 statusSize:v30 inputMode:v63 delegate:v22  reconnectionEnabled:v64];
              uint64_t v31 = AXLogBrailleHW(v23);
              v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              v33 = v27;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v72 = v23;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Making display: %@", buf, 0xCu);
              }

              if (v23) {
                [v23 performSelector:"_delayedDisplayLoad" withObject:0 afterDelay:0.0];
              }
              goto LABEL_30;
            }

            v56 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            unsigned __int8 v57 = [v56 ignoreLogging];

            if ((v57 & 1) != 0)
            {
LABEL_29:
              id v23 = 0LL;
              v33 = v27;
LABEL_30:
              id v18 = v68;
LABEL_38:

              goto LABEL_39;
            }

            v58 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
            uint64_t v59 = AXLoggerForFacility();
            v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);

            os_log_type_t v53 = AXOSLogLevelFromAXLogLevel(0LL);
            v33 = v27;
            id v18 = v68;
            if (!os_log_type_enabled(v52, v53)) {
              goto LABEL_36;
            }
            uint64_t v60 = AXColorizeFormatLog( 0LL,  @"Error: invalid principal class encountered while configuring braille driver (invalid interface version): %{public}@.");
            v65 = (void *)objc_claimAutoreleasedReturnValue(v60);
            uint64_t v61 = _AXStringForArgs(v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue(v61);
            if (!os_log_type_enabled(v52, v53)) {
              goto LABEL_35;
            }
            *(_DWORD *)buf = 138543362;
            id v72 = v67;
          }

          else
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            unsigned __int8 v49 = [v48 ignoreLogging];

            if ((v49 & 1) != 0) {
              goto LABEL_29;
            }
            v50 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
            uint64_t v51 = AXLoggerForFacility();
            v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);

            os_log_type_t v53 = AXOSLogLevelFromAXLogLevel(0LL);
            v33 = 0LL;
            id v18 = v68;
            if (!os_log_type_enabled(v52, v53)) {
              goto LABEL_36;
            }
            uint64_t v54 = AXColorizeFormatLog(0LL, @"Error: unable to instantiate braille driver: %{public}@");
            v65 = (void *)objc_claimAutoreleasedReturnValue(v54);
            uint64_t v55 = _AXStringForArgs(v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue(v55);
            if (!os_log_type_enabled(v52, v53))
            {
LABEL_35:

LABEL_36:
              goto LABEL_37;
            }

            *(_DWORD *)buf = 138543362;
            id v72 = v67;
          }

          _os_log_impl((void *)&_mh_execute_header, v52, v53, "%{public}@", buf, 0xCu);
          goto LABEL_35;
        }

        v42 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        unsigned __int8 v43 = [v42 ignoreLogging];

        if ((v43 & 1) != 0)
        {
LABEL_18:
          id v23 = 0LL;
LABEL_39:

          goto LABEL_40;
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        uint64_t v45 = AXLoggerForFacility();
        v33 = (void *)objc_claimAutoreleasedReturnValue(v45);

        os_log_type_t v38 = AXOSLogLevelFromAXLogLevel(0LL);
        if (os_log_type_enabled((os_log_t)v33, v38))
        {
          uint64_t v46 = AXColorizeFormatLog( 0LL,  @"Error: invalid principal class encountered while configuring braille driver: %{public}@");
          v69 = (void *)objc_claimAutoreleasedReturnValue(v46);
          uint64_t v47 = _AXStringForArgs(v69);
          v41 = (void *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled((os_log_t)v33, v38))
          {
            *(_DWORD *)buf = 138543362;
            id v72 = v41;
            goto LABEL_22;
          }

          goto LABEL_23;
        }
      }

      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        unsigned __int8 v35 = [v34 ignoreLogging];

        if ((v35 & 1) != 0) {
          goto LABEL_18;
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        uint64_t v37 = AXLoggerForFacility();
        v33 = (void *)objc_claimAutoreleasedReturnValue(v37);

        os_log_type_t v38 = AXOSLogLevelFromAXLogLevel(0LL);
        if (os_log_type_enabled((os_log_t)v33, v38))
        {
          uint64_t v39 = AXColorizeFormatLog( 0LL,  @"Error: could not find bundle while configuring braille driver: %{public}@");
          v69 = (void *)objc_claimAutoreleasedReturnValue(v39);
          uint64_t v40 = _AXStringForArgs(v69);
          v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled((os_log_t)v33, v38))
          {
            *(_DWORD *)buf = 138543362;
            id v72 = v41;
LABEL_22:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v33, v38, "%{public}@", buf, 0xCu);
          }

- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 ioElement:(id)a5 delegate:(id)a6
{
  LOBYTE(v8) = 1;
  LODWORD(v7) = 0;
  return -[MSCRODMobileBrailleDisplay _initWithDriver:driverIdentifier:modelIdentifier:ioElement:mainSize:statusSize:inputMode:delegate:reconnectionEnabled:]( self,  "_initWithDriver:driverIdentifier:modelIdentifier:ioElement:mainSize:statusSize:inputMode:delegate:reconnectionEnabled:",  a3,  a4,  0LL,  a5,  0LL,  0LL,  v7,  a6,  v8);
}

- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 modelIdentifier:(id)a5 ioElement:(id)a6 mainSize:(int64_t)a7 statusSize:(int64_t)a8 inputMode:(int)a9 delegate:(id)a10 reconnectionEnabled:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MSCRODMobileBrailleDisplay;
  id v20 = -[MSCRODMobileBrailleDisplay _initWithDriver:driverIdentifier:ioElement:delegate:]( &v25,  "_initWithDriver:driverIdentifier:ioElement:delegate:",  v17,  v18,  a6,  a10);
  uint64_t v21 = AXLogBrailleHW(v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v17;
    __int16 v28 = 2112;
    id v29 = v18;
    __int16 v30 = 2048;
    uint64_t v31 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "_initWithDriver call with driver: %@, driverIdentifier: %@, display: %p",  buf,  0x20u);
  }

  if (v20)
  {
    v20[232] = a11;
    objc_storeStrong((id *)&v20[OBJC_IVAR___SCROBrailleDisplay__driverModelIdentifier], a5);
    *(void *)&v20[OBJC_IVAR___SCROBrailleDisplay__mainSize] = a7;
    *(void *)&v20[OBJC_IVAR___SCROBrailleDisplay__statusSize] = a8;
    *(_DWORD *)&v20[OBJC_IVAR___SCROBrailleDisplay__brailleInputMode] = a9;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v20,  (CFNotificationCallback)sub_100009148,  kAXSVoiceOverTouchBrailleReconnectionTriggeredNotification,  0LL,  (CFNotificationSuspensionBehavior)1028LL);
  }

  return v20;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCRODMobileBrailleDisplay;
  -[MSCRODMobileBrailleDisplay dealloc](&v3, "dealloc");
}

- (void)_delayedDisplayLoad
{
  if (!self->_startedThread)
  {
    -[MSCRODMobileBrailleDisplay performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_runThread",  0LL,  0LL);
    self->_startedThread = 1;
  }

- (void)sleep
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__runLoop;
  v4 = *(__CFRunLoop **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop];
  if (v4)
  {
    CFRunLoopRemoveTimer( v4,  *(CFRunLoopTimerRef *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer],  kCFRunLoopDefaultMode);
    CFRunLoopRemoveTimer( *(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v3],  *(CFRunLoopTimerRef *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer],  kCFRunLoopDefaultMode);
  }

  if (self->_isReconnectionEnabled) {
    -[MSCRODMobileBrailleDisplay _enableReconnectionTimer:](self, "_enableReconnectionTimer:", 0LL);
  }
}

- (void)unsleep
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__runLoop;
  v4 = *(__CFRunLoop **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop];
  if (v4)
  {
    v5 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer];
    if (v5) {
      CFRunLoopAddTimer(v4, v5, kCFRunLoopDefaultMode);
    }
    uint64_t v6 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer];
    if (v6) {
      CFRunLoopAddTimer(*(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v3], v6, kCFRunLoopDefaultMode);
    }
  }

  if (self->_isReconnectionEnabled) {
    -[MSCRODMobileBrailleDisplay _enableReconnectionTimer:](self, "_enableReconnectionTimer:", 1LL);
  }
}

- (void)invalidate
{
  uint64_t v3 = AXLogBrailleHW(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Invalidating braille display [%{public}@]",  (uint8_t *)&v18,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__eventDispatcher] invalidate];
  uint64_t v7 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid] = 0;
  -[MSCRODMobileBrailleDisplay _stopWatchingForDevices](self, "_stopWatchingForDevices");
  uint64_t v8 = OBJC_IVAR___SCROBrailleDisplay__inputEventTimer;
  id v9 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer];
  if (v9)
  {
    CFRunLoopTimerInvalidate(v9);
    CFRelease(*(CFTypeRef *)&self->SCROBrailleDisplay_opaque[v8]);
    *(void *)&self->SCROBrailleDisplay_opaque[v8] = 0LL;
  }

  uint64_t v10 = OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer;
  id v11 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer];
  if (v11)
  {
    CFRunLoopTimerInvalidate(v11);
    CFRelease(*(CFTypeRef *)&self->SCROBrailleDisplay_opaque[v10]);
    *(void *)&self->SCROBrailleDisplay_opaque[v10] = 0LL;
  }

  uint64_t v12 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine];
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine] = 0LL;

  uint64_t v13 = OBJC_IVAR___SCROBrailleDisplay__brailleDriver;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver] unloadDriver];
  v14 = *(void **)&self->SCROBrailleDisplay_opaque[v13];
  *(void *)&self->SCROBrailleDisplay_opaque[v13] = 0LL;

  uint64_t v16 = AXLogBrailleHW(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    id v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver set to nil in invalidate for Display %p",  (uint8_t *)&v18,  0xCu);
  }

  [*(id *)&self->SCROBrailleDisplay_opaque[v7] unlock];
}

- (void)_runThread
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__brailleDriver;
  if (!*(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver])
  {
    uint64_t v4 = AXLogBrailleHW(self);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unsigned __int8 v49 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver == nil in _runThread for %p",  buf,  0xCu);
    }
  }

  uint64_t v6 = AXLogBrailleHW(self);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v49 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting thread for: %@", buf, 0xCu);
  }

  uint64_t v8 = objc_autoreleasePoolPush();
  -[MSCRODMobileBrailleDisplay _startWatchingForDevices](self, "_startWatchingForDevices");
  objc_autoreleasePoolPop(v8);
  uint64_t v9 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    id v10 = *(id *)&self->SCROBrailleDisplay_opaque[v3];
    id v11 = *(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement];
    [*(id *)&self->SCROBrailleDisplay_opaque[v9] unlock];
    id v12 = (id)-[MSCRODMobileBrailleDisplay isBluetoothHID](self, "isBluetoothHID");
    if ((v12 & 1) != 0
      || (id v12 = [v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol], !(_DWORD)v12))
    {
      BOOL v13 = 0LL;
    }

    else
    {
      id v12 = [v11 hidDevice];
      BOOL v13 = v12 != 0LL;
    }

    uint64_t v14 = AXLogBrailleHW(v12);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v11 transport]));
      *(_DWORD *)buf = 138412802;
      unsigned __int8 v49 = self;
      __int16 v50 = 2112;
      uint64_t v51 = v16;
      __int16 v52 = 2112;
      os_log_type_t v53 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Starting connection for %@ -> isHID: %@, transport: %@",  buf,  0x20u);
    }

    self->_isDriverLoading = 1;
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v11 bluetoothAddress]);
    id v19 = sub_100009AF8(v18);
    id v20 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue(v19);

    uint64_t v22 = AXLogBrailleHW(v21);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v49 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "_isDriverLoading set to YES in _runThread - device: %@",  buf,  0xCu);
    }

    BOOL v38 = v13;
    uint64_t v39 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay address](v20, "address"));
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 connectingDevices]);

    id v27 = [v26 countByEnumeratingWithState:&v44 objects:buf count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v45;
      while (2)
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v44 + 1) + 8 * (void)i) address]);
          unsigned int v32 = [v24 isEqualToString:v31];

          if (v32)
          {

            id v10 = v39;
            goto LABEL_30;
          }
        }

        id v28 = [v26 countByEnumeratingWithState:&v44 objects:buf count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }

    id v10 = v39;
    if (v38)
    {
LABEL_30:
      -[MSCRODMobileBrailleDisplay _processInitialDeviceConnectionCallback:device:brailleDriver:ioElement:]( self,  "_processInitialDeviceConnectionCallback:device:brailleDriver:ioElement:",  0LL,  v20,  v10,  v11);
    }

    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleConnectionHelper sharedHelper]( &OBJC_CLASS___MSCRODBrailleConnectionHelper,  "sharedHelper"));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_100009C48;
      v40[3] = &unk_100014900;
      v40[4] = self;
      v41 = v20;
      id v42 = v39;
      id v43 = v11;
      id v34 = v11;
      id v35 = v39;
      v36 = v20;
      [v33 queueDeviceConnection:v36 withCallback:v40];
    }
  }

  else
  {
    [*(id *)&self->SCROBrailleDisplay_opaque[v9] unlock];
    uint64_t v37 = objc_autoreleasePoolPush();
    -[MSCRODMobileBrailleDisplay _stopWatchingForDevices](self, "_stopWatchingForDevices");
    objc_autoreleasePoolPop(v37);
  }

- (void)_processInitialDeviceConnectionCallback:(int)a3 device:(id)a4 brailleDriver:(id)a5 ioElement:(id)a6
{
  v71 = (MSCRODMobileBrailleDisplay *)a4;
  uint64_t v9 = (MSCRODMobileBrailleDisplay *)a5;
  id v10 = a6;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v12 = AXLogBrailleHW(v10);
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v73 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "brailleDriver == nil in _processInitialDeviceConnectionCallback for %p",  buf,  0xCu);
    }
  }

  id v14 = (id)-[MSCRODMobileBrailleDisplay isBluetoothHID](self, "isBluetoothHID");
  if ((v14 & 1) != 0
    || (id v14 = [v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol], !(_DWORD)v14))
  {
    BOOL v69 = 0;
  }

  else
  {
    id v14 = [v11 hidDevice];
    BOOL v69 = v14 != 0LL;
  }

  uint64_t v15 = AXLogBrailleHW(v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  a3));
    int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v11 transport]));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v69));
    *(_DWORD *)buf = 138544130;
    v73 = v71;
    __int16 v74 = 2112;
    v75 = v17;
    __int16 v76 = 2112;
    v77 = v18;
    __int16 v78 = 2112;
    v79 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Initial device connection callback [%{public}@] (BTResult:%@) Transport: %@, isHID: %@",  buf,  0x2Au);
  }

  id v20 = -[MSCRODMobileBrailleDisplay loadDriverWithIOElement:](v9, "loadDriverWithIOElement:", v11);
  int v70 = (int)v20;
  if (v9) {
    BOOL v21 = (_DWORD)v20 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  uint64_t v22 = v21;
  uint64_t v23 = AXLogBrailleHW(v20);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v25 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
    *(_DWORD *)buf = 138412290;
    v73 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Braille driver load succeeded: %@ in processInitiaDeviceConnectionCallback",  buf,  0xCu);
  }

  self->_isDriverLoading = 0;
  self->_isDriverLoaded = 0;
  uint64_t v27 = AXLogBrailleHW(v26);
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "_isDriverLoading set to NO in _processInitialDeviceConnectionCallback",  buf,  2u);
  }

  uint64_t v29 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  __int16 v30 = (id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver];
  objc_storeStrong(v30, a5);
  uint64_t v32 = AXLogBrailleHW(v31);
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v73 = v9;
    __int16 v74 = 2048;
    v75 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver set to %@ in _processInitialDeviceConnectionCallback for Display %p",  buf,  0x16u);
  }

  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop] = Current;
    if ((_DWORD)v22)
    {
      uint64_t v36 = AXLogBrailleHW(Current);
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Load succeeded and Valid: setting up driver and starting the event processor.",  buf,  2u);
      }

      -[MSCRODMobileBrailleDisplay _setupDriverSupport](self, "_setupDriverSupport");
      char v38 = objc_opt_respondsToSelector(*v30, "setBrailleDriverDelegate:");
      goto LABEL_47;
    }

    if (!self->_isReconnectionEnabled)
    {
LABEL_49:
      int v41 = 1;
      goto LABEL_50;
    }

    uint64_t v42 = AXLogBrailleHW(Current);
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v44 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  a3 != 0));
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v69));
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v70 == 3));
      *(_DWORD *)buf = 138413058;
      v73 = v44;
      __int16 v74 = 2112;
      v75 = v71;
      __int16 v76 = 2112;
      v77 = v45;
      __int16 v78 = 2112;
      v79 = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Reconnection enabled: trying again (fail %@) %@ is HID %@, Is invalid: %@",  buf,  0x2Au);
    }

    if (a3)
    {
      char v48 = v69;
      if (v70 == 3) {
        char v48 = 1;
      }
      if ((v48 & 1) != 0) {
        goto LABEL_46;
      }
    }

    else
    {
      id v47 = -[MSCRODMobileBrailleDisplay connected](v71, "connected");
      if (((v47 ^ 1 | v69) & 1) != 0 || v70 == 3)
      {
LABEL_46:
        [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__eventDispatcher] start];
        char v38 = objc_opt_respondsToSelector(*v30, "setBrailleDriverDelegate:");
LABEL_47:
        if ((v38 & 1) != 0) {
          [*v30 setBrailleDriverDelegate:self];
        }
        goto LABEL_49;
      }
    }

    uint64_t v49 = AXLogBrailleHW(v47);
    __int16 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v73 = v71;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Disconnecting from [%{public}@]", buf, 0xCu);
    }

    uint64_t v51 = AXLogBrailleHW(-[MSCRODMobileBrailleDisplay disconnect](v71, "disconnect"));
    __int16 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v73 = v71;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Reconnecting braille services to device [%{public}@]",  buf,  0xCu);
    }

    os_log_type_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleConnectionHelper sharedHelper]( &OBJC_CLASS___MSCRODBrailleConnectionHelper,  "sharedHelper"));
    [v53 queueDeviceConnection:v71 withCallback:0];

    goto LABEL_46;
  }

  uint64_t v39 = AXLogBrailleHW(v34);
  uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Display invalid: returning from _processInitialDeviceConnectionCallback",  buf,  2u);
  }

  int v41 = 0;
  self->_startedThread = 0;
LABEL_50:
  id v54 = [*(id *)&self->SCROBrailleDisplay_opaque[v29] unlock];
  if (v41)
  {
    if ((_DWORD)v22)
    {
      uint64_t v55 = objc_autoreleasePoolPush();
      uint64_t v56 = AXLogBrailleHW(v55);
      unsigned __int8 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Load succeeded: informing the manager of our progress.",  buf,  2u);
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleDisplayManager sharedManager]( &OBJC_CLASS___MSCRODBrailleDisplayManager,  "sharedManager"));
      [v58 addToDisplays:self];

      id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
      [WeakRetained brailleDisplay:self driverDidLoad:1];

      objc_autoreleasePoolPop(v55);
LABEL_59:
      AXSetThreadPriority(56LL);
      goto LABEL_65;
    }

    int v60 = v69;
    if (self->_isReconnectionEnabled) {
      int v60 = 1;
    }
    if (v60 == 1 && v70 != 3) {
      goto LABEL_59;
    }
    uint64_t v61 = AXLogBrailleHW(v54);
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isReconnectionEnabled));
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v69));
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v70 == 3));
      *(_DWORD *)buf = 138413058;
      v73 = v71;
      __int16 v74 = 2112;
      v75 = v63;
      __int16 v76 = 2112;
      v77 = v64;
      __int16 v78 = 2112;
      v79 = v65;
      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Disconnecting device %@ because reconnection is not enabled[%@], (HID: %@), (Invalid: %@)",  buf,  0x2Au);
    }

    id v66 = objc_autoreleasePoolPush();
    if (!v69 && v70 != 3) {
      -[MSCRODMobileBrailleDisplay disconnect](v71, "disconnect");
    }
    id v67 = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
    [v67 brailleDisplay:self driverDidLoad:0];

    objc_autoreleasePoolPop(v66);
    self->_startedThread = 0;
  }

- (void)_setupDriverSupport
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__brailleDriver;
  uint64_t v4 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver];
  if (!v4)
  {
    uint64_t v5 = AXLogBrailleHW(0LL);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 134217984;
      v24 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver == nil in _setupDriverSupport for Display %p",  (uint8_t *)&v23,  0xCu);
    }

    uint64_t v4 = *(void **)&self->SCROBrailleDisplay_opaque[v3];
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 modelIdentifier]);
  uint64_t v8 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__driverModelIdentifier];
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__driverModelIdentifier] = v7;

  uint64_t v9 = (uint64_t)[*(id *)&self->SCROBrailleDisplay_opaque[v3] mainSize];
  uint64_t v10 = OBJC_IVAR___SCROBrailleDisplay__mainSize;
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__mainSize] = v9 & ~(v9 >> 63);
  uint64_t v11 = (uint64_t)[*(id *)&self->SCROBrailleDisplay_opaque[v3] statusSize];
  uint64_t v12 = OBJC_IVAR___SCROBrailleDisplay__statusSize;
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__statusSize] = v11 & ~(v11 >> 63);
  unsigned __int8 v13 = [*(id *)&self->SCROBrailleDisplay_opaque[v3] postsKeyboardEvents];
  self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__postsKeyboardEvents] = v13;
  unsigned int v14 = [*(id *)&self->SCROBrailleDisplay_opaque[v3] brailleInputMode];
  *(_DWORD *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleInputMode] = v14;
  id v15 = [objc_allocWithZone(SCROBrailleLine) initWithDriver:*(void *)&self->SCROBrailleDisplay_opaque[v3] mainSize:*(void *)&self->SCROBrailleDisplay_opaque[v10] statusSize:*(void *)&self->SCROBrailleDisplay_opaque[v12]];
  uint64_t v16 = OBJC_IVAR___SCROBrailleDisplay__brailleLine;
  id v17 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine];
  *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine] = v15;

  [*(id *)&self->SCROBrailleDisplay_opaque[v16] setTranslationDelegate:self];
  unsigned __int8 v18 = [*(id *)&self->SCROBrailleDisplay_opaque[v3] isInputEnabled];
  uint64_t v19 = OBJC_IVAR___SCROBrailleDisplay__inputEnabled;
  self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEnabled] = v18;
  uint64_t v20 = OBJC_IVAR___SCROBrailleDisplay__runLoop;
  if (*(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop])
  {
    uint64_t v21 = OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer;
    if (*(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer]
      && [*(id *)&self->SCROBrailleDisplay_opaque[v3] supportsBlinkingCursor])
    {
      CFRunLoopAddTimer( *(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v20],  *(CFRunLoopTimerRef *)&self->SCROBrailleDisplay_opaque[v21],  kCFRunLoopDefaultMode);
    }

    if (self->SCROBrailleDisplay_opaque[v19])
    {
      uint64_t v22 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer];
      if (v22) {
        CFRunLoopAddTimer(*(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v20], v22, kCFRunLoopDefaultMode);
      }
    }
  }

  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__eventDispatcher] start];
}

- (void)_unloadHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
  [WeakRetained brailleDriverDisconnected:self];

  uint64_t v4 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver] unloadDriver];
    self->_isDriverLoaded = 0;
    uint64_t v5 = OBJC_IVAR___SCROBrailleDisplay__runLoop;
    uint64_t v6 = *(__CFRunLoop **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__runLoop];
    if (v6)
    {
      uint64_t v7 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__inputEventTimer];
      if (v7) {
        CFRunLoopRemoveTimer(v6, v7, kCFRunLoopDefaultMode);
      }
      uint64_t v8 = *(__CFRunLoopTimer **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__blinkerEventTimer];
      if (v8) {
        CFRunLoopRemoveTimer(*(CFRunLoopRef *)&self->SCROBrailleDisplay_opaque[v5], v8, kCFRunLoopDefaultMode);
      }
    }

    if (self->_isReconnectionEnabled) {
      -[MSCRODMobileBrailleDisplay _enableReconnectionTimer:](self, "_enableReconnectionTimer:", 1LL);
    }
    uint64_t v9 = *(void **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine];
    *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleLine] = 0LL;
  }

  [*(id *)&self->SCROBrailleDisplay_opaque[v4] unlock];
}

- (void)_reconnectionTriggeredHandler
{
  if (self->_isDriverLoading)
  {
    uint64_t v3 = AXLogBrailleHW(self);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Turning off _isDriverLoading and _isDriverLoaded for a triggered reconnection",  v5,  2u);
    }
  }

  self->_isDriverLoading = 0;
  self->_isDriverLoaded = 0;
  -[MSCRODMobileBrailleDisplay _reconnectionEventHandler](self, "_reconnectionEventHandler");
}

- (void)_reconnectionEventHandler
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__brailleDriver;
  if (!*(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver])
  {
    uint64_t v4 = AXLogBrailleHW(self);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v28 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver == nil in _reconnectionEventHandler for Display %p",  buf,  0xCu);
    }
  }

  uint64_t v6 = AXLogBrailleHW(self);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isDriverLoading));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isDriverLoaded));
    *(_DWORD *)buf = 138412802;
    id v28 = v8;
    __int16 v29 = 2112;
    __int16 v30 = v9;
    __int16 v31 = 2112;
    uint64_t v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling reconnection[%@:%@]: %@", buf, 0x20u);
  }

  if (!self->_isDriverLoading && !self->_isDriverLoaded)
  {
    uint64_t v10 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
    [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
    int v11 = self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid];
    if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
    {
      id v12 = *(id *)&self->SCROBrailleDisplay_opaque[v3];
      id v13 = *(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement];
    }

    else
    {
      id v13 = 0LL;
      id v12 = 0LL;
    }

    uint64_t v14 = AXLogBrailleHW([*(id *)&self->SCROBrailleDisplay_opaque[v10] unlock]);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v11 != 0));
      *(_DWORD *)buf = 138412290;
      id v28 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Is device valid for reconnection: %@",  buf,  0xCu);
    }

    if (v11)
    {
      self->_isDriverLoading = 1;
      uint64_t v18 = AXLogBrailleHW(v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "_isDriverLoading set to YES in _reconnectionEventHandler",  buf,  2u);
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 bluetoothAddress]);
      id v21 = sub_100009AF8(v20);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      int v23 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleConnectionHelper sharedHelper]( &OBJC_CLASS___MSCRODBrailleConnectionHelper,  "sharedHelper"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10000AD60;
      v24[3] = &unk_100014928;
      v24[4] = self;
      id v25 = v12;
      id v26 = v13;
      [v23 queueDeviceConnection:v22 withCallback:v24];
    }
  }

- (void)_processDeviceConnectionCallback:(int)a3 brailleDriver:(id)a4 ioElement:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v9)
  {
    id v12 = v10;
    uint64_t v13 = AXLogBrailleHW(v10);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "brailleDriver == nil in _processDeviceConnectionCallback",  buf,  2u);
    }

    id v11 = v12;
  }

  uint64_t v39 = v11;
  id v15 = objc_msgSend(v9, "loadDriverWithIOElement:");
  id v16 = v15;
  if (v9) {
    BOOL v17 = (_DWORD)v15 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  BOOL v18 = v17;
  uint64_t v19 = AXLogBrailleHW(v15);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v16));
    uint64_t v22 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v18));
    int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    *(_DWORD *)buf = 138413058;
    id v41 = v21;
    __int16 v42 = 2112;
    id v43 = v22;
    __int16 v44 = 2112;
    __int128 v45 = v23;
    __int16 v46 = 2112;
    id v47 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Connected and loaded: driverLoadReturn %@, loadSucceeded %@ (BT result: %@) for Display %@",  buf,  0x2Au);
  }

  self->_isDriverLoading = 0;
  self->_isDriverLoaded = v18;
  uint64_t v25 = AXLogBrailleHW(v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "_isDriverLoading set to NO in _processDeviceConnectionCallback",  buf,  2u);
  }

  uint64_t v27 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  objc_storeStrong((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver], a4);
  uint64_t v29 = AXLogBrailleHW(v28);
  __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v9;
    __int16 v42 = 2048;
    id v43 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver set to %@ in _processDeviceConnectionCallback for Display %p",  buf,  0x16u);
  }

  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    if ((_DWORD)v16)
    {
      uint64_t v32 = AXLogBrailleHW(v31);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
        *(_DWORD *)buf = 138412290;
        id v41 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Unsuccessful connect %@", buf, 0xCu);
      }
    }

    else
    {
      -[MSCRODMobileBrailleDisplay _enableReconnectionTimer:](self, "_enableReconnectionTimer:", 0LL);
      uint64_t v36 = AXLogBrailleHW(-[MSCRODMobileBrailleDisplay _setupDriverSupport](self, "_setupDriverSupport"));
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
        *(_DWORD *)buf = 138412290;
        id v41 = v37;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Succeeded on reconnect %@", buf, 0xCu);
      }
    }

    int v35 = 0;
  }

  else
  {
    int v35 = 1;
  }

  [*(id *)&self->SCROBrailleDisplay_opaque[v27] unlock];
  if (!(v35 | !v18))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
    [WeakRetained brailleDisplay:self driverDidLoad:1];
  }
}

- (void)_resetReconnectionTimer
{
  if (self->_reconnectionEventTimer)
  {
    v2 = self;
    if (self->_reconnectionInterval < 30.0)
    {
      self = (MSCRODMobileBrailleDisplay *)-[NSMutableDictionary count](self->_bluetoothConnectedDevices, "count");
      if ((unint64_t)self < 4)
      {
        if (CFAbsoluteTimeGetCurrent() - v2->_beganReconnectionInterval >= 180.0)
        {
          v2->_reconnectionInterval = fmin(v2->_reconnectionInterval, 30.0);
          v2->_beganReconnectionInterval = CFAbsoluteTimeGetCurrent();
        }
      }

      else
      {
        v2->_reconnectionInterval = 30.0;
      }
    }

    uint64_t v3 = AXLogBrailleHW(self);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v2->_reconnectionInterval));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](v2, "bluetoothAddress"));
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Change reconnection timer to %@ %@",  (uint8_t *)&v7,  0x16u);
    }
  }

- (void)_enableReconnectionTimer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = AXLogBrailleHW(self);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isDriverLoaded));
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
    *(_DWORD *)buf = 138412802;
    id v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    __int16 v29 = 2112;
    __int16 v30 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Enabled reconnection: %@, driver loaded: %@, %@",  buf,  0x20u);
  }

  if (v3 && !self->_isDriverLoaded)
  {
    if (self->_reconnectionEventTimer)
    {
      -[MSCRODMobileBrailleDisplay _resetReconnectionTimer](self, "_resetReconnectionTimer");
    }

    else
    {
      self->_beganReconnectionInterval = CFAbsoluteTimeGetCurrent();
      self->_double reconnectionInterval = 15.0;
      id v15 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
      reconnectionEventTimer = self->_reconnectionEventTimer;
      self->_reconnectionEventTimer = v15;
    }

    id v17 = -[AXDispatchTimer isPending](self->_reconnectionEventTimer, "isPending");
    if (!(_DWORD)v17
      || (id v17 = -[AXDispatchTimer isCancelled](self->_reconnectionEventTimer, "isCancelled"), (_DWORD)v17))
    {
      uint64_t v18 = AXLogBrailleHW(v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_reconnectionInterval));
        *(_DWORD *)buf = 138412546;
        id v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Restart reconnection: %@ %@", buf, 0x16u);
      }

      uint64_t v22 = self->_reconnectionEventTimer;
      double reconnectionInterval = self->_reconnectionInterval;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10000B630;
      v24[3] = &unk_100014770;
      v24[4] = self;
      -[AXDispatchTimer afterDelay:processBlock:](v22, "afterDelay:processBlock:", v24, reconnectionInterval);
    }
  }

  else
  {
    -[AXDispatchTimer cancel](self->_reconnectionEventTimer, "cancel");
    id v10 = self->_reconnectionEventTimer;
    self->_reconnectionEventTimer = 0LL;

    uint64_t v12 = AXLogBrailleHW(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
      *(_DWORD *)buf = 138412290;
      id v26 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Turning reconnection timer off: %@",  buf,  0xCu);
    }
  }

- (BOOL)requiresPersistentConnection
{
  if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 voiceOverBrailleDisconnectOnSleep]);
      int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

      if (v7)
      {
        unsigned int v8 = [v7 BOOLValue] ^ 1;
      }

      else
      {
        uint64_t v9 = OBJC_IVAR___SCROBrailleDisplay__ioElement;
        if (![*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement] conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]
          || ![*(id *)&self->SCROBrailleDisplay_opaque[v9] hidDevice])
        {
          LOBYTE(v8) = 0;
          goto LABEL_12;
        }

        LOBYTE(v8) = 1;
      }

LABEL_12:
      return v8;
    }

    LOBYTE(v8) = 1;
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)_reloadDriver
{
  uint64_t v3 = (id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleDriver];
  if (!*v3)
  {
    uint64_t v4 = AXLogBrailleHW(self);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver == nil in _reloadDriver for Display %@",  buf,  0xCu);
    }
  }

  if (self->_isDriverLoading || self->_isDriverLoaded)
  {
    uint64_t v6 = AXLogBrailleHW(self);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isDriverLoading));
      uint64_t v9 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isDriverLoaded));
      *(_DWORD *)buf = 138412802;
      id v54 = v8;
      __int16 v55 = 2112;
      uint64_t v56 = v9;
      __int16 v57 = 2114;
      v58 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not reloading driver: %@/%@ [%{public}@]",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v10 = AXLogBrailleHW(self);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v54 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Reloading braille driver for display [%{public}@]",  buf,  0xCu);
    }

    uint64_t v52 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
    [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
    if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
    {
      uint64_t v50 = OBJC_IVAR___SCROBrailleDisplay__isValid;
      id obj = *v3;
      int v7 = (os_log_s *)*v3;
      id v12 = *v3;
      *uint64_t v3 = 0LL;

      uint64_t v14 = AXLogBrailleHW(v13);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v54 = (MSCRODMobileBrailleDisplay *)v7;
        __int16 v55 = 2048;
        uint64_t v56 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver set to nil (from %p) in _reloadDriver for Display %p",  buf,  0x16u);
      }

      id v16 = *(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement];
      id v17 = [*(id *)&self->SCROBrailleDisplay_opaque[v52] unlock];
      self->_isDriverLoading = 1;
      uint64_t v18 = AXLogBrailleHW(v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "_isDriverLoading set to YES in _reloadDriver",  buf,  2u);
      }

      uint64_t v20 = objc_autoreleasePoolPush();
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 bluetoothAddress]);
      id v22 = sub_100009AF8(v21);
      int v23 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue(v22);

      if (-[MSCRODMobileBrailleDisplay connected](v23, "connected"))
      {
        if ((-[MSCRODMobileBrailleDisplay connectedServices](v23, "connectedServices") & 0x2000) != 0)
        {
          id v32 = -[os_log_s loadDriverWithIOElement:](v7, "loadDriverWithIOElement:", v16);
          int v30 = (int)v32;
          uint64_t v33 = AXLogBrailleHW(v32);
          __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            if (v7) {
              BOOL v34 = v30 == 0;
            }
            else {
              BOOL v34 = 0;
            }
            uint64_t v35 = v34;
            uint64_t v36 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  v35,  v16));
            *(_DWORD *)buf = 138412290;
            id v54 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Braille driver load succeeded: %@ in _reloadDriver",  buf,  0xCu);

            id v16 = v49;
          }
        }

        else
        {
          id v24 = [v16 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol];
          if (!(_DWORD)v24 || (id v24 = [v16 hidDevice]) == 0)
          {
            uint64_t v25 = AXLogBrailleHW(v24);
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v54 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Disconnecting in reload from [%{public}@]",  buf,  0xCu);
            }

            id v24 = -[MSCRODMobileBrailleDisplay disconnect](v23, "disconnect");
          }

          uint64_t v27 = AXLogBrailleHW(v24);
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v54 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Reconnecting braille services to device [%{public}@]",  buf,  0xCu);
          }

          __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleConnectionHelper sharedHelper]( &OBJC_CLASS___MSCRODBrailleConnectionHelper,  "sharedHelper"));
          -[os_log_s queueDeviceConnection:withCallback:](v29, "queueDeviceConnection:withCallback:", v23, 0LL);
          int v30 = 1;
        }
      }

      else
      {
        int v30 = 1;
      }

      if (v7) {
        BOOL v37 = v30 == 0;
      }
      else {
        BOOL v37 = 0;
      }
      BOOL v38 = v37;

      objc_autoreleasePoolPop(v20);
      self->_isDriverLoading = 0;
      self->_isDriverLoaded = v38;
      uint64_t v40 = AXLogBrailleHW(v39);
      id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "_isDriverLoading set to NO in _reloadDriver",  buf,  2u);
      }

      [*(id *)&self->SCROBrailleDisplay_opaque[v52] lock];
      objc_storeStrong(v3, obj);
      uint64_t v43 = AXLogBrailleHW(v42);
      __int16 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v54 = (MSCRODMobileBrailleDisplay *)v7;
        __int16 v55 = 2048;
        uint64_t v56 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "_brailleDriver set to %@ in _reloadDriver for Display %p",  buf,  0x16u);
      }

      if (self->SCROBrailleDisplay_opaque[v50])
      {
        int v45 = 0;
        if (v7 && !v30)
        {
          -[MSCRODMobileBrailleDisplay _setupDriverSupport](self, "_setupDriverSupport");
          int v45 = 0;
        }
      }

      else
      {
        CFRunLoopRef Current = CFRunLoopGetCurrent();
        CFRunLoopStop(Current);
        int v45 = 1;
      }

      [*(id *)&self->SCROBrailleDisplay_opaque[v52] unlock];
      if (((v45 | !v38) & 1) == 0)
      {
        id v47 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleDisplayManager sharedManager]( &OBJC_CLASS___MSCRODBrailleDisplayManager,  "sharedManager"));
        [v47 addToDisplays:self];

        id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
        [WeakRetained brailleDisplay:self driverDidLoad:1];

        -[MSCRODMobileBrailleDisplay _enableReconnectionTimer:](self, "_enableReconnectionTimer:", 0LL);
      }
    }

    else
    {
      [*(id *)&self->SCROBrailleDisplay_opaque[v52] unlock];
      uint64_t v31 = CFRunLoopGetCurrent();
      CFRunLoopStop(v31);
      int v7 = 0LL;
      id v16 = 0LL;
    }
  }
}

- (id)bluetoothAddress
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay ioElement](self, "ioElement"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MSCRODIOBluetoothElement, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay ioElement](self, "ioElement"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bluetoothAddress]);
  }

  else
  {
    unsigned int v8 = 0LL;
  }

  return v8;
}

- (void)_startWatchingForDevices
{
  if (!self->_bluetoothConnectedDevices)
  {
    uint64_t v3 = (NSMutableDictionary *)[objc_allocWithZone(NSMutableDictionary) init];
    bluetoothConnectedDevices = self->_bluetoothConnectedDevices;
    self->_bluetoothConnectedDevices = v3;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pairedDevices]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v25;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v23 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (objc_msgSend(v13, "connected", v23, (void)v24))
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 address]);
          unsigned int v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            uint64_t v18 = AXLogBrailleHW(v17);
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              __int16 v29 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Monitoring paired device: %@",  buf,  0xCu);
            }

            uint64_t v20 = self->_bluetoothConnectedDevices;
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v13 address]);
            -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v13, v21);
          }
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }

    while (v10);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v22 addObserver:self selector:"addDeviceNotification:" name:BluetoothDeviceConnectSuccessNotification object:0];
  [v22 addObserver:self selector:"addDeviceFailedNotification:" name:BluetoothDeviceConnectFailedNotification object:0];
  [v22 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
  [v22 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
  [v22 addObserver:self selector:"deviceUpdatedNotification:" name:BluetoothDeviceUpdatedNotification object:0];
  [v22 addObserver:self selector:"connectionStatusChanged:" name:BluetoothConnectionStatusChangedNotification object:0];
}

- (void)_stopWatchingForDevices
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:BluetoothDeviceConnectSuccessNotification object:0];
  [v4 removeObserver:self name:BluetoothDeviceConnectFailedNotification object:0];
  [v4 removeObserver:self name:BluetoothDeviceDisconnectSuccessNotification object:0];
  [v4 removeObserver:self name:BluetoothDeviceDisconnectFailedNotification object:0];
  [v4 removeObserver:self name:BluetoothDeviceUpdatedNotification object:0];
  [v4 removeObserver:self name:BluetoothConnectionStatusChangedNotification object:0];
  bluetoothConnectedDevices = self->_bluetoothConnectedDevices;
  self->_bluetoothConnectedDevices = 0LL;
}

- (void)addDeviceFailedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v6 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue([v5 address]);
  id v7 = v6;
  if (v5 && v6 && (uint64_t v6 = (MSCRODMobileBrailleDisplay *)[v5 connected], !(_DWORD)v6))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleConnectionHelper sharedHelper]( &OBJC_CLASS___MSCRODBrailleConnectionHelper,  "sharedHelper"));
    [v11 handleBluetoothConnectionEventForQueue:v5 forceProcess:0];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
    unsigned int v13 = [v12 isEqualToString:v7];

    if (v13)
    {
      uint64_t v15 = AXLogBrailleHW(v14);
      unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isReconnectionEnabled));
        int v18 = 138412802;
        id v19 = v4;
        __int16 v20 = 2114;
        id v21 = self;
        __int16 v22 = 2114;
        __int128 v23 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "FAILED: Add device failed: Reset reconnect %@ [%{public}@] - %{public}@",  (uint8_t *)&v18,  0x20u);
      }

      -[MSCRODMobileBrailleDisplay _enableReconnectionTimer:]( self,  "_enableReconnectionTimer:",  self->_isReconnectionEnabled);
    }
  }

  else
  {
    uint64_t v8 = AXLogBrailleHW(v6);
    __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 connected]));
      int v18 = 138412802;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      __int128 v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Delayed device remove not processing: %@/%@/%@",  (uint8_t *)&v18,  0x20u);
    }
  }
}

- (void)addDeviceNotification:(id)a3
{
}

- (BOOL)isBluetoothHID
{
  return [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement] transport] == 8;
}

- (void)_delayedAddDeviceNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 address]);
  id v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay bluetoothAddress](self, "bluetoothAddress"));
      unsigned int v9 = [v8 isEqualToString:v7];

      if (v9)
      {
        uint64_t v11 = AXLogBrailleHW(v10);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid]));
          *(_DWORD *)buf = 138543874;
          uint64_t v39 = self;
          __int16 v40 = 2114;
          id v41 = v4;
          __int16 v42 = 2112;
          uint64_t v43 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "SUCCESS: Connection success for display [%{public}@] - %{public}@ valid: %@",  buf,  0x20u);
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleConnectionHelper sharedHelper]( &OBJC_CLASS___MSCRODBrailleConnectionHelper,  "sharedHelper"));
        [v14 handleBluetoothConnectionEventForQueue:v5];

        if (self->_isDriverLoading)
        {
          uint64_t v16 = AXLogBrailleHW(v15);
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Turning off _isDriverLoading", buf, 2u);
          }
        }

        self->_isDriverLoading = 0;
        uint64_t v18 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
        [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
        if (self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__isValid])
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_bluetoothConnectedDevices, "objectForKey:", v7));
          BOOL v20 = v19 == 0LL;

          if (!v20) {
            -[NSMutableDictionary setObject:forKey:](self->_bluetoothConnectedDevices, "setObject:forKey:", v5, v7);
          }
          uint64_t v21 = OBJC_IVAR___SCROBrailleDisplay__ioElement;
          if ([*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement] conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]) {
            uint64_t v22 = 1048736LL;
          }
          else {
            uint64_t v22 = 1056896LL;
          }
          unint64_t v23 = (unint64_t)[v5 connectedServices];
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->SCROBrailleDisplay_opaque[v21] bluetoothAddress]);
          unsigned int v25 = [v7 isEqualToString:v24];
          unint64_t v26 = v23 & v22;
          if ((v23 & v22) != 0) {
            uint64_t v27 = v25;
          }
          else {
            uint64_t v27 = 0LL;
          }

          uint64_t v29 = AXLogBrailleHW(v28);
          int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = v18;
            uint64_t v31 = (MSCRODMobileBrailleDisplay *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v27));
            id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v22));
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26 != 0));
            BOOL v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 connectedServices]));
            *(_DWORD *)buf = 138413314;
            uint64_t v39 = v31;
            __int16 v40 = 2112;
            id v41 = v32;
            __int16 v42 = 2112;
            uint64_t v43 = v33;
            __int16 v44 = 2112;
            int v45 = v34;
            __int16 v46 = 2048;
            id v47 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Should reload: %@ required service: %@ service connected: %@, connected services: %@, device: %p",  buf,  0x34u);

            uint64_t v18 = v37;
          }

          int v35 = 0;
        }

        else
        {
          CFRunLoopRef Current = CFRunLoopGetCurrent();
          CFRunLoopStop(Current);
          LODWORD(v27) = 0;
          int v35 = 1;
        }

        [*(id *)&self->SCROBrailleDisplay_opaque[v18] unlock];
      }
    }
  }
}

- (void)removeDeviceNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogBrailleHW(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device remove: %@", (uint8_t *)&v7, 0xCu);
  }

  -[MSCRODMobileBrailleDisplay performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_delayedRemoveDeviceNotification:",  v4,  0LL);
}

- (void)_delayedRemoveDeviceNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 address]);
  uint64_t v6 = v5;
  if (v4)
  {
    if (v5)
    {
      id v5 = [v4 connected];
      if (!(_DWORD)v5)
      {
        uint64_t v13 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
        id v14 = [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
        self->_isDriverLoaded = 0;
        self->_isDriverLoading = 0;
        uint64_t v15 = AXLogBrailleHW(v14);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_isDriverLoading set to YES in _delayedRemoveDeviceNotification",  (uint8_t *)&v33,  2u);
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_bluetoothConnectedDevices, "objectForKey:", v6));
        if (v17) {
          -[NSMutableDictionary removeObjectForKey:](self->_bluetoothConnectedDevices, "removeObjectForKey:", v6);
        }
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement] bluetoothAddress]);
        uint64_t v18 = AXLogBrailleHW(v8);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138412290;
          BOOL v34 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Handling device removal: %@",  (uint8_t *)&v33,  0xCu);
        }

        id v20 = [*(id *)&self->SCROBrailleDisplay_opaque[v13] unlock];
        if (!v8
          || (id v20 = [v6 isEqualToString:v8], !(_DWORD)v20)
          || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance")),
              unsigned int v22 = [v21 available],
              v21,
              !v22))
        {
          uint64_t v26 = AXLogBrailleHW(v20);
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8 == 0LL));
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v28 available]));
            int v33 = 138413058;
            BOOL v34 = v27;
            __int16 v35 = 2112;
            uint64_t v36 = v6;
            __int16 v37 = 2112;
            BOOL v38 = v8;
            __int16 v39 = 2112;
            __int16 v40 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_delayedRemoveDeviceNotification: bluetoothAddress == nil (%@) or address (%@) != bluetoothAddress (%@) or BluetoothManager.sharedInstance not available (%@)",  (uint8_t *)&v33,  0x2Au);
          }

          goto LABEL_22;
        }

        id v23 = [v4 paired];
        if ((_DWORD)v23)
        {
          uint64_t v24 = AXLogBrailleHW(v23);
          unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = 138412290;
            BOOL v34 = (os_log_s *)v4;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Device still paired after disconnect, commencing reconnect strategy: %@",  (uint8_t *)&v33,  0xCu);
          }

          -[MSCRODMobileBrailleDisplay _enableReconnectionTimer:]( self,  "_enableReconnectionTimer:",  self->_isReconnectionEnabled);
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleConnectionHelper sharedHelper]( &OBJC_CLASS___MSCRODBrailleConnectionHelper,  "sharedHelper"));
          -[os_log_s handleBluetoothConnectionEventForQueue:](v9, "handleBluetoothConnectionEventForQueue:", v4);
          goto LABEL_22;
        }

        int v30 = (void *)objc_claimAutoreleasedReturnValue( +[MSCRODBrailleDisplayManager sharedManager]( &OBJC_CLASS___MSCRODBrailleDisplayManager,  "sharedManager"));
        [v30 removeBluetoothDriverWithAddress:v6];

        uint64_t v32 = AXLogBrailleHW(v31);
        unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
LABEL_22:

          goto LABEL_23;
        }

        int v33 = 138412290;
        BOOL v34 = v8;
        uint64_t v10 = "Removing address from preferences: %@";
        uint64_t v11 = v9;
        uint32_t v12 = 12;
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v33, v12);
        goto LABEL_22;
      }
    }
  }

  uint64_t v7 = AXLogBrailleHW(v5);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 connected]));
    int v33 = 138412802;
    BOOL v34 = (os_log_s *)v4;
    __int16 v35 = 2112;
    uint64_t v36 = v6;
    __int16 v37 = 2112;
    BOOL v38 = v9;
    uint64_t v10 = "Delayed device remove not processing: %@/%@/%@";
    uint64_t v11 = v8;
    uint32_t v12 = 32;
    goto LABEL_6;
  }

- (void)deviceUpdatedNotification:(id)a3
{
}

- (void)connectionStatusChanged:(id)a3
{
}

- (void)_delayedDeviceUpdatedNotification:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__delegate]);
  [WeakRetained configurationChangedForBrailleDisplay:self];
}

- (id)configuration
{
  uint64_t v3 = OBJC_IVAR___SCROBrailleDisplay__contentLock;
  [*(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__contentLock] lock];
  id v4 = *(const __CFString **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__driverIdentifier];
  if (v4) {
    Copy = (__CFString *)CFStringCreateCopy(0LL, v4);
  }
  else {
    Copy = 0LL;
  }
  uint64_t v6 = *(const __CFString **)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__driverModelIdentifier];
  if (v6) {
    uint64_t v7 = (__CFString *)CFStringCreateCopy(0LL, v6);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__mainSize];
  uint64_t v9 = *(void *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__statusSize];
  uint64_t v10 = *(unsigned int *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__brailleInputMode];
  id v11 = *(id *)&self->SCROBrailleDisplay_opaque[OBJC_IVAR___SCROBrailleDisplay__ioElement];
  [*(id *)&self->SCROBrailleDisplay_opaque[v3] unlock];
  uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  10LL));
  uint64_t v13 = v12;
  if (Copy) {
    [v12 setObject:Copy forKey:kSCROBrailleDisplayDriverIdentifier];
  }
  if (v7)
  {
    [v13 setObject:v7 forKey:kSCROBrailleDisplayModelIdentifier];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
    [v13 setObject:v14 forKey:kSCROBrailleDisplayMainSize];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
    [v13 setObject:v15 forKey:kSCROBrailleDisplayStatusSize];
  }

  if (!v11)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 0LL));
    [v13 setObject:v31 forKey:kSCROBrailleDisplayTransport];
    goto LABEL_28;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (int)[v11 identifier]));
  [v13 setObject:v16 forKey:kSCROBrailleDisplayToken];

  unsigned int v17 = [v11 transport];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v17));
  [v13 setObject:v18 forKey:kSCROBrailleDisplayTransport];

  BOOL v19 = v17 > 0x20 || ((1LL << v17) & 0x100000104LL) == 0;
  if (!v19
    && (([v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol] & 1) != 0
     || [v11 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBTLESerialElementProtocol]))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 bluetoothAddress]);
    if (v20) {
      [v13 setObject:v20 forKey:kSCROBrailleDisplayBluetoothAddress];
    }
    id v21 = sub_100009AF8(v20);
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = v22;
    if (v22)
    {
      uint64_t v24 = v7;
      unsigned int v25 = Copy;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
    }

    else
    {
      uint64_t v24 = v7;
      unsigned int v25 = Copy;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 productName]);
      if (!v26)
      {
LABEL_23:

        Copy = v25;
        uint64_t v7 = v24;
LABEL_24:

        goto LABEL_25;
      }
    }

    [v13 setObject:v26 forKey:kSCROBrailleDisplayBluetoothName];
    goto LABEL_23;
  }

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay configuration](self, "configuration"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSCROBrailleDisplayBluetoothAddress]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay configuration](self, "configuration"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSCROBrailleDisplayModelIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay configuration](self, "configuration"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSCROBrailleDisplayTransport]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%p]\n\tBT Address: %@\n\tDriver Model: %@\n\tTransport: %@",  v3,  self,  v5,  v7,  v9));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  BOOL v10 = 0;
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODMobileBrailleDisplay configuration](self, "configuration"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 configuration]);

    LOBYTE(v7) = [v8 isEqual:v9];
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end