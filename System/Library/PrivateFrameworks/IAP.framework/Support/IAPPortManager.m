@interface IAPPortManager
- (BOOL)accessoryPowerModeOnDuringSleep;
- (BOOL)internalBatteryChargingState;
- (BOOL)isDeviceInLowPowerMode;
- (BOOL)isLowPowerModeSupported;
- (BOOL)sendReserveCurrentNotification;
- (BOOL)supportsPowerModeOnAcrossSleep;
- (BOOL)supportsUltraHighPowerMode;
- (IAPPortManager)initWithService:(unsigned int)a3 andNotificationPort:(IONotificationPort *)a4;
- (NSNumber)portNumber;
- (int)accessoryPowerState;
- (unsigned)availableCurrentFromAccInMa;
- (unsigned)maxInputCurrentFromAccInMa;
- (unsigned)reserveCurrentForAccInMa;
- (unsigned)service;
- (unsigned)ultraHighPowerModeCurrentLimit;
- (void)dealloc;
- (void)restoreAvailableCurrentFromAcc;
- (void)setAccessoryPowerModeOnDuringSleep:(BOOL)a3;
- (void)setAccessoryPowerState:(int)a3;
- (void)setAvailableCurrentFromAccInMa:(unsigned __int16)a3;
- (void)setInternalBatteryChargingState:(BOOL)a3;
- (void)setMaxInputCurrentFromAccInMa:(unsigned __int16)a3;
- (void)setReserveCurrentForAccInMa:(unsigned __int16)a3;
- (void)setSendReserveCurrentNotification:(BOOL)a3;
@end

@implementation IAPPortManager

- (IAPPortManager)initWithService:(unsigned int)a3 andNotificationPort:(IONotificationPort *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IAPPortManager;
  result = -[IAPPortManager init](&v14, "init");
  v7 = result;
  if (!result) {
    return v7;
  }
  io_connect_t connect = 0;
  *(_WORD *)&result->_supportsUltraHighPowerMode = -1;
  if ((((_BYTE)result + 16) & 7) == 0)
  {
    result->_notificationPortRef = a4;
    if ((((_BYTE)result + 40) & 3) == 0)
    {
      result->_accessoryPowerState = 1;
      result->_sendReserveCurrentNotification = 0;
      p_service = &result->_service;
      if (((unint64_t)&result->_service & 3) == 0)
      {
        unsigned int *p_service = a3;
        uint64_t v9 = IOObjectRetain(a3);
        if ((_DWORD)v9) {
          NSLog( @"ERROR - %s:%s - %d IOObjectRetain failed %#x",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager initWithService:andNotificationPort:]",  128LL,  v9);
        }
        uint64_t v10 = IOServiceOpen(*p_service, mach_task_self_, 0, &connect);
        if ((_DWORD)v10 || connect == 0)
        {
          NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager initWithService:andNotificationPort:]",  134LL,  v10);
        }

        else
        {
          uint64_t v12 = IOServiceAddInterestNotification( v7->_notificationPortRef,  v7->_service,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_1000CEDC8,  v7,  &v7->_notification);
          if ((_DWORD)v12) {
            NSLog( @"ERROR - %s:%s - %d couldn't add interest notification %#x",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager initWithService:andNotificationPort:]",  140LL,  v12);
          }
          IOServiceClose(connect);
        }

        result = -[NSNumber initWithInt:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInt:",  IOAccessoryManagerGetPrimaryPort(v7->_service));
        if (((unint64_t)&v7->_portNumber & 7) == 0)
        {
          v7->_portNumber = (NSNumber *)result;
          return v7;
        }
      }
    }
  }

  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  p_service = &self->_service;
  if (*p_service)
  {
    IOObjectRelease(*p_service);
    unsigned int *p_service = 0;
  }

  p_notification = &self->_notification;
  if (*p_notification)
  {
    IOObjectRelease(*p_notification);
    unsigned int *p_notification = 0;
  }

  if ((((_BYTE)self + 32) & 7) != 0)
  {
LABEL_9:
    __break(0x5516u);
  }

  else
  {

    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___IAPPortManager;
    -[IAPPortManager dealloc](&v5, "dealloc");
  }

- (BOOL)isLowPowerModeSupported
{
  return MGGetBoolAnswer(@"Birtx7GxrxCCUzsE1JQO8Q");
}

- (BOOL)isDeviceInLowPowerMode
{
  if (-[IAPPortManager isLowPowerModeSupported](self, "isLowPowerModeSupported")
    && (v2 = SCPreferencesCreate(kCFAllocatorDefault, @"com.apple.iapd", @"com.apple.radios.plist")) != 0LL)
  {
    v3 = v2;
    SCPreferencesSynchronize(v2);
    Value = (const __CFBoolean *)SCPreferencesGetValue(v3, @"LowPowerMode");
    objc_super v5 = Value;
    if (Value)
    {
      CFTypeID v6 = CFGetTypeID(Value);
      LOBYTE(v5) = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) == 1;
    }

    CFRelease(v3);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (void)setAccessoryPowerState:(int)a3
{
  p_accessoryPowerState = &self->_accessoryPowerState;
  if ((*p_accessoryPowerState | a3) >= 4)
  {
LABEL_24:
    __break(0x550Au);
    return;
  }

  if (*p_accessoryPowerState == a3) {
    return;
  }
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
LABEL_23:
    __break(0x5516u);
    goto LABEL_24;
  }

  uint64_t v6 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
  uint64_t v7 = connect;
  if ((_DWORD)v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = connect == 0;
  }
  if (!v8)
  {
    if (a3 == 2)
    {
      uint64_t v9 = 3LL;
    }

    else
    {
      if (a3 != 3)
      {
        uint64_t v9 = 1LL;
        goto LABEL_18;
      }

      uint64_t v9 = 4LL;
    }

    if (-[IAPPortManager isDeviceInLowPowerMode](self, "isDeviceInLowPowerMode"))
    {
LABEL_20:
      IOServiceClose(connect);
      goto LABEL_21;
    }

    uint64_t v7 = connect;
LABEL_18:
    uint64_t v10 = IOAccessoryManagerConfigurePower(v7, v9);
    if ((_DWORD)v10) {
      NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerConfigurePower failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setAccessoryPowerState:]",  238LL,  v10);
    }
    goto LABEL_20;
  }

  NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setAccessoryPowerState:]",  217LL,  v6);
LABEL_21:
  int *p_accessoryPowerState = a3;
}

- (BOOL)supportsUltraHighPowerMode
{
  int supportsUltraHighPowerMode = self->_supportsUltraHighPowerMode;
  if (supportsUltraHighPowerMode == 255)
  {
    v3 = self;
    if ((((int)self + 8) & 3LL) != 0)
    {
      __break(0x5516u);
      return (char)self;
    }

    int supportsUltraHighPowerMode = IOAccessoryManagerPowerModeIsSupported(self->_service, 4LL) != 0;
    v3->_int supportsUltraHighPowerMode = supportsUltraHighPowerMode;
  }

  LOBYTE(self) = supportsUltraHighPowerMode != 0;
  return (char)self;
}

- (BOOL)supportsPowerModeOnAcrossSleep
{
  int supportsPowerModeOnAcrossSleep = self->_supportsPowerModeOnAcrossSleep;
  if (supportsPowerModeOnAcrossSleep == 255)
  {
    v3 = self;
    if ((((int)self + 8) & 3LL) != 0)
    {
      __break(0x5516u);
      return (char)self;
    }

    int supportsPowerModeOnAcrossSleep = IOAccessoryManagerPowerDuringSleepIsSupported(self->_service, a2) != 0;
    v3->_int supportsPowerModeOnAcrossSleep = supportsPowerModeOnAcrossSleep;
  }

  LOBYTE(self) = supportsPowerModeOnAcrossSleep != 0;
  return (char)self;
}

- (BOOL)accessoryPowerModeOnDuringSleep
{
  else {
    LOBYTE(self) = IOAccessoryManagerGetPowerDuringSleep(self->_service, a2) != 0;
  }
  return (char)self;
}

- (void)setAccessoryPowerModeOnDuringSleep:(BOOL)a3
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    BOOL v3 = a3;
    uint64_t v4 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    if ((_DWORD)v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = connect == 0;
    }
    if (v5)
    {
      NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setAccessoryPowerModeOnDuringSleep:]",  283LL,  v4);
    }

    else
    {
      uint64_t v6 = IOAccessoryManagerSetPowerDuringSleep(connect, v3);
      if ((_DWORD)v6)
      {
        if ((_DWORD)v6 == -536870183) {
          NSLog( @"INFO - %s:%s - %d IOAccessoryManagerSetPowerDuringSleep not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setAccessoryPowerModeOnDuringSleep:]",  291LL,  3758097113LL);
        }
        else {
          NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerSetPowerDuringSleep failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setAccessoryPowerModeOnDuringSleep:]",  295LL,  v6);
        }
      }

      IOServiceClose(connect);
    }
  }

- (unsigned)availableCurrentFromAccInMa
{
  int v5 = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
    return (unsigned __int16)self;
  }

  uint64_t USBCurrentLimitBase = IOAccessoryManagerGetUSBCurrentLimitBase(self->_service, &v5);
  if ((_DWORD)USBCurrentLimitBase == -536870183)
  {
    NSLog( @"INFO - %s:%s - %d IOAccessoryManagerGetUSBCurrentLimitBase not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager availableCurrentFromAccInMa]",  310LL,  3758097113LL);
LABEL_7:
    __int16 v3 = 0;
    goto LABEL_8;
  }

  if ((_DWORD)USBCurrentLimitBase)
  {
    NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerGetUSBCurrentLimitBase failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager availableCurrentFromAccInMa]",  314LL,  USBCurrentLimitBase);
    goto LABEL_7;
  }

  __int16 v3 = v5;
LABEL_8:
  LOWORD(self) = v3;
  return (unsigned __int16)self;
}

- (void)setAvailableCurrentFromAccInMa:(unsigned __int16)a3
{
  io_connect_t connect = 0;
  uint64_t v3 = a3;
  uint64_t v5 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
  uint64_t v6 = connect;
  if ((_DWORD)v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = connect == 0;
  }
  if (v7)
  {
    NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setAvailableCurrentFromAccInMa:]",  328LL,  v5);
    return;
  }

  self->_sendReserveCurrentNotification = 0;
  uint64_t v8 = IOAccessoryManagerSetUSBCurrentLimitBase(v6, v3);
  if ((_DWORD)v8)
  {
    if ((_DWORD)v8 == -536870183) {
      NSLog( @"INFO - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitBase not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setAvailableCurrentFromAccInMa:]",  337LL,  3758097113LL);
    }
    else {
      NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitBase failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setAvailableCurrentFromAccInMa:]",  341LL,  v8);
    }
    goto LABEL_15;
  }

  uint64_t v9 = sub_10002662C(-[NSNumber intValue](-[IAPPortManager portNumber](self, "portNumber"), "intValue"));
  if (v9)
  {
    if ((v9 & 7) == 0)
    {
      (*(void (**)(uint64_t *, uint64_t))(*v9 + 328))(v9, v3);
      goto LABEL_15;
    }

- (void)restoreAvailableCurrentFromAcc
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    uint64_t v3 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    uint64_t v4 = connect;
    if ((_DWORD)v3) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = connect == 0;
    }
    if (v5)
    {
      NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager restoreAvailableCurrentFromAcc]",  379LL,  v3);
    }

    else
    {
      self->_sendReserveCurrentNotification = 0;
      uint64_t v6 = IOAccessoryManagerRestoreUSBCurrentLimitBase(v4);
      if ((_DWORD)v6)
      {
        if ((_DWORD)v6 == -536870183) {
          NSLog( @"INFO - %s:%s - %d IOAccessoryManagerRestoreUSBcurrentLimitBase not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager restoreAvailableCurrentFromAcc]",  367LL,  3758097113LL);
        }
        else {
          NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerRestoreUSBcurrentLimitBase failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager restoreAvailableCurrentFromAcc]",  371LL,  v6);
        }
      }

      IOServiceClose(connect);
    }
  }

- (unsigned)reserveCurrentForAccInMa
{
  int v4 = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
    goto LABEL_11;
  }

  self = (IAPPortManager *)IOAccessoryManagerGetUSBCurrentLimitOffset(self->_service, &v4);
  if ((_DWORD)self)
  {
    if ((_DWORD)self == -536870183) {
      NSLog( @"INFO - %s:%s - %d IOAccessoryManagerGetUSBCurrentLimitOffset not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager reserveCurrentForAccInMa]",  394LL,  3758097113LL);
    }
    else {
      NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerGetUSBCurrentLimitOffset failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager reserveCurrentForAccInMa]",  398LL,  self);
    }
    LOWORD(v2) = 0;
    goto LABEL_9;
  }

  if (v4 == 0x80000000)
  {
LABEL_11:
    __break(0x550Cu);
    return (unsigned __int16)self;
  }

  int v2 = -v4;
LABEL_9:
  LOWORD(self) = v2;
  return (unsigned __int16)self;
}

- (void)setReserveCurrentForAccInMa:(unsigned __int16)a3
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    int v3 = a3;
    uint64_t v5 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    if ((_DWORD)v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = connect == 0;
    }
    if (v6)
    {
      NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setReserveCurrentForAccInMa:]",  416LL,  v5);
    }

    else
    {
      uint64_t v7 = IOAccessoryManagerSetUSBCurrentOffset(connect, -v3);
      if ((_DWORD)v7)
      {
        if ((_DWORD)v7 == -536870183) {
          NSLog( @"INFO - %s:%s - %d IOAccessoryManagerSetUSBCurrentOffset not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setReserveCurrentForAccInMa:]",  424LL,  3758097113LL);
        }
        else {
          NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerSetUSBCurrentOffset failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setReserveCurrentForAccInMa:]",  428LL,  v7);
        }
      }

      else
      {
        self->_sendReserveCurrentNotification = 1;
      }

      IOServiceClose(connect);
    }
  }

- (unsigned)maxInputCurrentFromAccInMa
{
  int v5 = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
    return (unsigned __int16)self;
  }

  uint64_t USBCurrentLimitMaximum = IOAccessoryManagerGetUSBCurrentLimitMaximum(self->_service, &v5);
  if ((_DWORD)USBCurrentLimitMaximum == -536870160)
  {
    NSLog( @"INFO - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitMaximum not found %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager maxInputCurrentFromAccInMa]",  445LL,  3758097136LL);
LABEL_7:
    __int16 v3 = 0;
    goto LABEL_8;
  }

  if ((_DWORD)USBCurrentLimitMaximum)
  {
    NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitMaximum failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager maxInputCurrentFromAccInMa]",  449LL,  USBCurrentLimitMaximum);
    goto LABEL_7;
  }

  __int16 v3 = v5;
LABEL_8:
  LOWORD(self) = v3;
  return (unsigned __int16)self;
}

- (void)setMaxInputCurrentFromAccInMa:(unsigned __int16)a3
{
  io_connect_t connect = 0;
  uint64_t v3 = a3;
  uint64_t v5 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
  if ((_DWORD)v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = connect == 0;
  }
  if (v6)
  {
    NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setMaxInputCurrentFromAccInMa:]",  463LL,  v5);
    return;
  }

  uint64_t v7 = IOAccessoryManagerSetUSBCurrentLimitMaximum(connect, v3);
  if ((_DWORD)v7)
  {
    if ((_DWORD)v7 == -536870183) {
      NSLog( @"INFO - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitMaximum not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setMaxInputCurrentFromAccInMa:]",  471LL,  3758097113LL);
    }
    else {
      NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitMaximum failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setMaxInputCurrentFromAccInMa:]",  475LL,  v7);
    }
    goto LABEL_17;
  }

  uint64_t v8 = sub_10002662C(-[NSNumber intValue](-[IAPPortManager portNumber](self, "portNumber"), "intValue"));
  if (!v8)
  {
    uint64_t v8 = sub_1000266D8(-[NSNumber intValue](-[IAPPortManager portNumber](self, "portNumber"), "intValue"));
    if (!v8)
    {
      NSLog( @"ERROR - setMaxInputCurrentFromAccInMa Still no podTransport for manager %d",  -[NSNumber intValue](-[IAPPortManager portNumber](self, "portNumber"), "intValue"));
      goto LABEL_17;
    }
  }

  uint64_t v9 = (uint64_t)v8;
  uint64_t v10 = sub_1000451B0();
  if (!v10 || (v10 & 7) != 0)
  {
LABEL_20:
    __break(0x5516u);
    return;
  }

  sub_100046CBC(v10, v9, 0LL);
LABEL_17:
  IOServiceClose(connect);
}

- (void)setInternalBatteryChargingState:(BOOL)a3
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    BOOL v3 = a3;
    uint64_t v4 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    if ((_DWORD)v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = connect == 0;
    }
    if (v5)
    {
      NSLog( @"ERROR - %s:%s - %d IOServiceOpen failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setInternalBatteryChargingState:]",  502LL,  v4);
    }

    else
    {
      uint64_t v6 = IOAccessoryManagerSetBatteryPackMode(connect, !v3);
      if ((_DWORD)v6)
      {
        if ((_DWORD)v6 == -536870183) {
          NSLog( @"INFO - %s:%s - %d IOAccessoryManagerSetBatteryPackMode not attached %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setInternalBatteryChargingState:]",  510LL,  3758097113LL);
        }
        else {
          NSLog( @"ERROR - %s:%s - %d IOAccessoryManagerSetBatteryPackMode failed %#x\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm",  "-[IAPPortManager setInternalBatteryChargingState:]",  514LL,  v6);
        }
      }

      IOServiceClose(connect);
    }
  }

- (BOOL)internalBatteryChargingState
{
  else {
    LOBYTE(self) = IOAccessoryManagerGetBatteryPackMode(self->_service, a2) == 0;
  }
  return (char)self;
}

- (unsigned)ultraHighPowerModeCurrentLimit
{
  else {
    LODWORD(self) = IOAccessoryManagerPowerModeCurrentLimit(self->_service, 4LL);
  }
  return self;
}

- (unsigned)service
{
  return self->_service;
}

- (NSNumber)portNumber
{
  return self->_portNumber;
}

- (int)accessoryPowerState
{
  int result = self->_accessoryPowerState;
  return result;
}

- (BOOL)sendReserveCurrentNotification
{
  unsigned int sendReserveCurrentNotification = self->_sendReserveCurrentNotification;
  if (sendReserveCurrentNotification >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = sendReserveCurrentNotification != 0;
  }
  return (char)self;
}

- (void)setSendReserveCurrentNotification:(BOOL)a3
{
  self->_unsigned int sendReserveCurrentNotification = a3;
}

@end