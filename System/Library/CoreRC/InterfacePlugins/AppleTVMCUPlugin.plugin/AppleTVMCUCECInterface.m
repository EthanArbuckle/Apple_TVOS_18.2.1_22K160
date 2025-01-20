@interface AppleTVMCUCECInterface
- (AppleTVMCUCECInterface)init;
- (AppleTVMCUPlugin)plugin;
- (BOOL)errorIsNack:(id)a3;
- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setSnoopingMode:(BOOL)a3 error:(id *)a4;
- (id)properties;
- (id)propertyForKey:(id)a3 error:(id *)a4;
- (int)_registerForIOAVServicePublishOnQueue:(id)a3;
- (void)_addedService:(unsigned int)a3;
- (void)_checkIfInterfacePropertiesChanged;
- (void)_receivedFrame:(CECFrame *)a3 snooping:(BOOL)a4;
- (void)_servicePublishedNotification:(unsigned int)a3;
- (void)_setHasLink:(BOOL)a3;
- (void)_setPhysicalAddress:(unsigned __int16)a3;
- (void)_unregisterForIOAVServiceNotifications;
- (void)_updatePhysicalAddressFromIOAVService:(unsigned int)a3;
- (void)dealloc;
- (void)mcuExitedStandby:(unsigned __int16)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setPlugin:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation AppleTVMCUCECInterface

- (AppleTVMCUCECInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppleTVMCUCECInterface;
  result = -[AppleTVMCUCECInterface init](&v3, "init");
  if (result)
  {
    result->_hasLink = 0;
    result->_pendingHasLink = 0;
    result->_physicalAddress = -1;
    result->_pendingPhysicalAddress = -1;
    result->_notificationPort = 0LL;
    result->_servicePublishedIterator = 0;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppleTVMCUCECInterface;
  -[AppleTVMCUCECInterface dealloc](&v3, "dealloc");
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (-[AppleTVMCUCECInterface serialQueue](self, "serialQueue"))
  {
    if (dword_10CF8 <= 60 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 60LL))) {
      LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface scheduleWithDispatchQueue:]",  60LL,  "%@ error: already scheduled on: %p (queue=%p)\n",  self,  -[AppleTVMCUCECInterface serialQueue](self, "serialQueue"),  a3);
    }
  }

  else
  {
    -[AppleTVMCUCECInterface setSerialQueue:](self, "setSerialQueue:", a3);
    self->_physicalAddress = -1;
    -[AppleTVMCUCECInterface _setHasLink:]( self,  "_setHasLink:",  -[AppleTVMCUPlugin mcuHasLink](-[AppleTVMCUCECInterface plugin](self, "plugin"), "mcuHasLink"));
    uint64_t v5 = -[AppleTVMCUCECInterface _registerForIOAVServicePublishOnQueue:]( self,  "_registerForIOAVServicePublishOnQueue:",  a3);
    if ((_DWORD)v5)
    {
      if (dword_10CF8 > 120) {
        return;
      }
      uint64_t v6 = v5;
      if (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 120LL))
      {
        v7 = mach_error_string(v6);
        LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface scheduleWithDispatchQueue:]",  120LL,  "%@ error registering for HPD notifications: %s (0x%08x)\n",  self,  v7,  v6);
      }
    }

    if (dword_10CF8 <= 10 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 10LL))) {
      LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface scheduleWithDispatchQueue:]",  10LL,  "%@ scheduled\n",  self,  v8,  v9);
    }
  }

- (void)unscheduleFromDispatchQueue:(id)a3
{
  if (-[AppleTVMCUCECInterface serialQueue](self, "serialQueue") == a3)
  {
    -[AppleTVMCUCECInterface _setHasLink:](self, "_setHasLink:", 0LL);
    -[AppleTVMCUCECInterface _unregisterForIOAVServiceNotifications](self, "_unregisterForIOAVServiceNotifications");
    -[AppleTVMCUCECInterface setSerialQueue:](self, "setSerialQueue:", 0LL);
  }

  else if (dword_10CF8 <= 60 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 60LL)))
  {
    LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface unscheduleFromDispatchQueue:]",  60LL,  "%@ error: invalid queue: %p\n",  self,  a3);
  }

- (void)_updatePhysicalAddressFromIOAVService:(unsigned int)a3
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a3, @"Physical Address", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    uint64_t v5 = (void *)CFProperty;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0 && [v5 length] == (char *)&dword_0 + 2)
    {
      [v5 getBytes:&v7 length:2];
      -[AppleTVMCUCECInterface _setPhysicalAddress:](self, "_setPhysicalAddress:", bswap32(v7) >> 16);
    }

    CFRelease(v5);
  }

- (int)_registerForIOAVServicePublishOnQueue:(id)a3
{
  uint64_t v5 = IONotificationPortCreate(kIOMasterPortDefault);
  self->_notificationPort = v5;
  if (!v5) {
    return 5;
  }
  IONotificationPortSetDispatchQueue(v5, (dispatch_queue_t)a3);
  notificationPort = self->_notificationPort;
  unsigned __int16 v7 = IOServiceMatching("IOAVService");
  int result = IOServiceAddMatchingNotification( notificationPort,  "IOServicePublish",  v7,  (IOServiceMatchingCallback)sub_1EE0,  self,  &self->_servicePublishedIterator);
  if (!result)
  {
    -[AppleTVMCUCECInterface _servicePublishedNotification:]( self,  "_servicePublishedNotification:",  self->_servicePublishedIterator);
    return 0;
  }

  return result;
}

- (void)_unregisterForIOAVServiceNotifications
{
  io_object_t servicePublishedIterator = self->_servicePublishedIterator;
  if (servicePublishedIterator)
  {
    IOObjectRelease(servicePublishedIterator);
    self->_io_object_t servicePublishedIterator = 0;
  }

  io_object_t serviceMessageNotifier = self->_serviceMessageNotifier;
  if (serviceMessageNotifier)
  {
    IOObjectRelease(serviceMessageNotifier);
    self->_io_object_t serviceMessageNotifier = 0;
  }

  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0LL;
  }

- (void)_servicePublishedNotification:(unsigned int)a3
{
  uint64_t v5 = IOIteratorNext(a3);
  if ((_DWORD)v5)
  {
    uint64_t v6 = v5;
    do
    {
      -[AppleTVMCUCECInterface _addedService:](self, "_addedService:", v6);
      IOObjectRelease(v6);
      uint64_t v6 = IOIteratorNext(a3);
    }

    while ((_DWORD)v6);
  }

- (void)_addedService:(unsigned int)a3
{
  io_object_t serviceMessageNotifier = self->_serviceMessageNotifier;
  if (serviceMessageNotifier)
  {
    IOObjectRelease(serviceMessageNotifier);
    self->_io_object_t serviceMessageNotifier = 0;
  }

  IOServiceAddInterestNotification( self->_notificationPort,  a3,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_2018,  self,  &self->_serviceMessageNotifier);
}

- (void)_setPhysicalAddress:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (a3 == 0xFFFF)
  {
    if (dword_10CF8 > 50) {
      goto LABEL_16;
    }
  }

  else
  {
    if (dword_10CF8 > 50) {
      goto LABEL_16;
    }
    if (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL))
    {
      v9[1] = CECPhysicalAddressStringWithAddress(v3);
      LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface _setPhysicalAddress:]",  50LL,  "got physical address %s (0x%04x)\n");
    }
  }

  if (dword_10CF8 <= 30 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 30LL))) {
    LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface _setPhysicalAddress:]",  30LL,  "_setPhysicalAddress: 0x%04x (_pendingPhysicalAddress=0x%04x, current _physicalAddress=0x%04x)\n",  v3,  self->_pendingPhysicalAddress,  self->_physicalAddress);
  }
LABEL_16:
  int physicalAddress = self->_physicalAddress;
  if (physicalAddress != (_DWORD)v3)
  {
    if (!self->_hasLink || (_DWORD)v3 == 0xFFFF || physicalAddress == 0xFFFF)
    {
      self->_pendingPhysicalAddress = v3;
      -[AppleTVMCUCECInterface _checkIfInterfacePropertiesChanged](self, "_checkIfInterfacePropertiesChanged");
    }

    else if (dword_10CF8 <= 90 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 90LL)))
    {
      v9[0] = CECPhysicalAddressStringWithAddress(v3);
      uint64_t v8 = CECPhysicalAddressStringWithAddress(self->_physicalAddress);
      LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface _setPhysicalAddress:]",  90LL,  "_setPhysicalAddress: requested address change to %s while address is already %s\n",  (const char *)v9,  (const char *)&v8);
    }
  }

- (void)_setHasLink:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL)))
  {
    uint64_t v5 = "NO";
    if (v3) {
      uint64_t v6 = "YES";
    }
    else {
      uint64_t v6 = "NO";
    }
    if (self->_pendingHasLink) {
      unsigned __int16 v7 = "YES";
    }
    else {
      unsigned __int16 v7 = "NO";
    }
    if (self->_hasLink) {
      uint64_t v5 = "YES";
    }
    LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface _setHasLink:]",  50LL,  "_setHasLink inHasLink: %s, (_pendingHasLink=%s, current _hasLink=%s)\n",  v6,  v7,  v5);
  }

  if (self->_hasLink != v3)
  {
    self->_pendingHasLink = v3;
    -[AppleTVMCUCECInterface _checkIfInterfacePropertiesChanged](self, "_checkIfInterfacePropertiesChanged");
  }

- (void)_checkIfInterfacePropertiesChanged
{
  if (self->_hasLink)
  {
    if (!self->_pendingHasLink)
    {
      self->_hasLink = 0;
      self->_int physicalAddress = -1;
      if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL))) {
        LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface _checkIfInterfacePropertiesChanged]",  50LL,  "_checkIfInterfacePropertiesChanged: HPD low, _physicalAddress invalidated\n");
      }
      objc_msgSend(-[AppleTVMCUCECInterface delegate](self, "delegate"), "interfacePropertiesChanged:", self);
      p_int pendingPhysicalAddress = &self->_pendingPhysicalAddress;
      goto LABEL_15;
    }
  }

  else if (!self->_pendingHasLink)
  {
    return;
  }

  p_int pendingPhysicalAddress = &self->_pendingPhysicalAddress;
  int pendingPhysicalAddress = self->_pendingPhysicalAddress;
  if (pendingPhysicalAddress == 0xFFFF) {
    return;
  }
  self->_int physicalAddress = pendingPhysicalAddress;
  self->_hasLink = 1;
  if (dword_10CF8 <= 50)
  {
    uint64_t v5 = "YES";
    if (dword_10CF8 == -1)
    {
      int pendingPhysicalAddress = self->_physicalAddress;
      if (!self->_hasLink) {
        uint64_t v5 = "NO";
      }
    }

    LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface _checkIfInterfacePropertiesChanged]",  50LL,  "_checkIfInterfacePropertiesChanged: update _hasLink=%s, _physicalAddress=0x%04x\n",  v5,  pendingPhysicalAddress);
  }

- (void)mcuExitedStandby:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  -[AppleTVMCUCECInterface hibernationChanged:](self, "hibernationChanged:", 0LL);
  if ((_DWORD)v3 != 0xFFFF)
  {
    if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL)))
    {
      uint64_t v11 = CECPhysicalAddressStringWithAddress(v3);
      LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface mcuExitedStandby:]",  50LL,  "simulating <Set Stream Path> [%s]\n",  (const char *)&v11);
    }

    __int16 v5 = -31217;
    char v6 = BYTE1(v3);
    char v7 = v3;
    uint64_t v8 = 0LL;
    int v9 = 0;
    char v10 = 4;
    -[AppleTVMCUCECInterface receivedFrame:](self, "receivedFrame:", &v5);
  }

- (BOOL)errorIsNack:(id)a3
{
  return [a3 code] == (id)-6758;
}

- (id)properties
{
  v4[0] = kCECInterfacePropertyIsValid;
  v4[1] = kCECInterfacePropertyHasLink;
  if (self->_hasLink) {
    v2 = &__kCFBooleanTrue;
  }
  else {
    v2 = &__kCFBooleanFalse;
  }
  v5[0] = &__kCFBooleanTrue;
  v5[1] = v2;
  v4[2] = kCECInterfacePropertyPhysicalAddress;
  v5[2] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_physicalAddress);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  3LL);
}

- (id)propertyForKey:(id)a3 error:(id *)a4
{
  return -[AppleTVMCUPlugin propertyForKey:error:](self->_plugin, "propertyForKey:error:", a3, a4);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  return -[AppleTVMCUPlugin setProperty:forKey:error:](self->_plugin, "setProperty:forKey:error:", a3, a4, a5);
}

- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4
{
  int v5 = a3;
  if (dword_10CF8 <= 30 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 30LL))) {
    LogPrintF( &dword_10CF8,  "-[AppleTVMCUCECInterface setHardwareAddressMask:error:]",  30LL,  "Set CEC address mask: 0x%04x (MCU: 0x%04x)\n",  v5,  v5 & 0x7FFF);
  }
  return -[AppleTVMCUPlugin setProperty:forKey:error:]( self->_plugin,  "setProperty:forKey:error:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5 & 0x7FFF),  @"com.apple.AppleTVHID.cecSetAddressMask",  a4);
}

- (BOOL)setSnoopingMode:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if (dword_10CF8 <= 30 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 30LL)))
  {
    char v7 = "OFF";
    if (v5) {
      char v7 = "ON";
    }
    LogPrintF(&dword_10CF8, "-[AppleTVMCUCECInterface setSnoopingMode:error:]", 30LL, "Set CEC snooping mode: %s\n", v7);
  }

  if (v5) {
    uint64_t v8 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v8 = &__kCFBooleanFalse;
  }
  BOOL v9 = -[AppleTVMCUPlugin setProperty:forKey:error:]( self->_plugin,  "setProperty:forKey:error:",  v8,  @"com.apple.AppleTVHID.cecSetSnoopinguousMode",  a4);
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___AppleTVMCUCECInterface;
    -[AppleTVMCUCECInterface setSnoopingMode:error:](&v11, "setSnoopingMode:error:", v5, a4);
  }

  return v9;
}

- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  unsigned __int8 v10 = a4;
  uint64_t v8 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &v10,  1LL);
  -[NSMutableData appendBytes:length:](v8, "appendBytes:length:", a3, *((_BYTE *)a3 + 16) & 0x1F);
  LOBYTE(a5) = -[AppleTVMCUPlugin setProperty:forKey:error:]( self->_plugin,  "setProperty:forKey:error:",  v8,  @"com.apple.AppleTVHID.CEC.TransmitFrame",  a5);

  return (char)a5;
}

- (void)_receivedFrame:(CECFrame *)a3 snooping:(BOOL)a4
{
  if (!a4 || -[AppleTVMCUCECInterface snoopingMode](self, "snoopingMode"))
  {
    __int128 v6 = *(_OWORD *)a3->var0;
    int v7 = *((_DWORD *)a3 + 4);
    -[AppleTVMCUCECInterface receivedFrame:](self, "receivedFrame:", &v6);
  }

- (AppleTVMCUPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

@end