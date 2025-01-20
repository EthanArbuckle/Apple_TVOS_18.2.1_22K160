@interface CECIOCECInterface
+ (id)interfaceWithIOCECInterface:(__IOCECInterface *)a3 listener:(id)a4;
- (BOOL)errorIsNack:(id)a3;
- (BOOL)hibernate;
- (BOOL)hpd;
- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4;
- (CECIOCECInterface)init;
- (CECIOCECInterface)initWithIOCECInterface:(__IOCECInterface *)a3 listener:(id)a4;
- (OS_dispatch_workloop)receiveWorkloop;
- (__IOCECInterface)iocecInterface;
- (id)properties;
- (unsigned)packedPhysicalAddress;
- (void)_close;
- (void)_interfaceTerminated:(__IOCECInterface *)a3;
- (void)_open;
- (void)_updateStatusWithPhysicalAddress:(unsigned __int16)a3 HPD:(BOOL)a4 hibernate:(BOOL)a5;
- (void)dealloc;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setHibernate:(BOOL)a3;
- (void)setHpd:(BOOL)a3;
- (void)setPackedPhysicalAddress:(unsigned __int16)a3;
- (void)setReceiveWorkloop:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation CECIOCECInterface

+ (id)interfaceWithIOCECInterface:(__IOCECInterface *)a3 listener:(id)a4
{
  return  -[CECIOCECInterface initWithIOCECInterface:listener:]( objc_alloc(&OBJC_CLASS___CECIOCECInterface),  "initWithIOCECInterface:listener:",  a3,  a4);
}

- (CECIOCECInterface)init
{
  return 0LL;
}

- (CECIOCECInterface)initWithIOCECInterface:(__IOCECInterface *)a3 listener:(id)a4
{
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CECIOCECInterface;
  v7 = -[CECIOCECInterface init](&v10, "init");
  if (v7)
  {
    v8 = (CoreRCInterfaceListener *)a4;
    v7->_listener = v8;
    if (v8 && (v7->_iocecInterface = a3) != 0LL)
    {
      CFRetain(a3);
    }

    else
    {

      return 0LL;
    }
  }

  return v7;
}

- (void)dealloc
{
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    v3 = self;
    v4 = "-[CECIOCECInterface dealloc]";
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  -[CECIOCECInterface setDelegate:](self, "setDelegate:", 0LL, v3, v4);
  if (self->_iocecInterface)
  {
    -[CECIOCECInterface _close](self, "_close");
    CFRelease(self->_iocecInterface);
    self->_iocecInterface = 0LL;
  }

  self->_listener = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CECIOCECInterface;
  -[CECIOCECInterface dealloc](&v5, "dealloc");
}

- (void)_open
{
  id v5 = -[CECIOCECInterface serialQueue](self, "serialQueue");
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 40LL)))
  {
    iocecInterface = self->_iocecInterface;
    id v15 = v5;
    v12 = "-[CECIOCECInterface _open]";
    BOOL isOpen = self->_isOpen;
    v11 = self;
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if (!self->_isOpen)
  {
    v6 = self->_iocecInterface;
    if (v6 && v5 != 0LL)
    {
      uint64_t v8 = IOCECInterfaceOpenReceiveQueue(v6, 0LL, 100LL, v3, v4);
      if (gLogCategory_CoreRCInterface <= 40
        && (gLogCategory_CoreRCInterface != -1
         || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 40LL)))
      {
        v12 = "-[CECIOCECInterface _open]";
        BOOL isOpen = v8;
        v11 = self;
        LogPrintF(&gLogCategory_CoreRCInterface);
      }

      if (!(_DWORD)v8)
      {
        IOCECInterfaceRegisterTerminatedCallback(self->_iocecInterface, sub_1F40, self);
        IOCECInterfaceRegisterReceiveCallback(self->_iocecInterface, sub_1F94, self);
        IOCECInterfaceRegisterStatusCallback(self->_iocecInterface, sub_209C, self);
        -[CECIOCECInterface setReceiveWorkloop:]( self,  "setReceiveWorkloop:",  dispatch_workloop_create_inactive("IOCECInterface - Receive Workloop"));
        if (-[CECIOCECInterface receiveWorkloop](self, "receiveWorkloop"))
        {
          dispatch_workloop_set_scheduler_priority( -[CECIOCECInterface receiveWorkloop](self, "receiveWorkloop"),  63LL,  1LL);
          dispatch_activate((dispatch_object_t)-[CECIOCECInterface receiveWorkloop](self, "receiveWorkloop"));
          IOCECInterfaceScheduleWithDispatchQueue( self->_iocecInterface,  -[CECIOCECInterface receiveWorkloop](self, "receiveWorkloop"));
          self->_BOOL isOpen = 1;
          v17 = _NSConcreteStackBlock;
          v9 = sub_20FC;
          objc_super v10 = &v17;
          goto LABEL_18;
        }

        if (gLogCategory_CoreRCInterface <= 120
          && (gLogCategory_CoreRCInterface != -1
           || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 120LL)))
        {
          LogPrintF(&gLogCategory_CoreRCInterface);
        }
      }

      v16 = _NSConcreteStackBlock;
      v9 = sub_2238;
      objc_super v10 = &v16;
LABEL_18:
      v10[1] = (void **)3221225472LL;
      v10[2] = (void **)v9;
      v10[3] = (void **)&unk_4188;
      v10[4] = (void **)self;
      -[CECIOCECInterface dispatchAsyncHighPriority:]( self,  "dispatchAsyncHighPriority:",  v11,  v12,  isOpen,  iocecInterface,  v15);
    }
  }

- (void)_close
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 40LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if (self->_isOpen)
  {
    if (-[CECIOCECInterface receiveWorkloop](self, "receiveWorkloop"))
    {
      IOCECInterfaceUnscheduleFromDispatchQueue( self->_iocecInterface,  -[CECIOCECInterface receiveWorkloop](self, "receiveWorkloop"));
      IOCECInterfaceRegisterStatusCallback(self->_iocecInterface, 0LL, 0LL);
      IOCECInterfaceRegisterReceiveCallback(self->_iocecInterface, 0LL, 0LL);
      IOCECInterfaceRegisterTerminatedCallback(self->_iocecInterface, 0LL, 0LL);
    }

    IOCECInterfaceCloseReceiveQueue(self->_iocecInterface, 0LL);
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___CECIOCECInterface;
    -[CECIOCECInterface setAddressMask:error:](&v3, "setAddressMask:error:", 0LL, 0LL);
    self->_BOOL isOpen = 0;

    -[CECIOCECInterface setReceiveWorkloop:](self, "setReceiveWorkloop:", 0LL);
  }

- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4
{
  if (self->_isOpen) {
    int v5 = IOCECInterfaceSetLogicalAddressMask(self->_iocecInterface, a3);
  }
  else {
    int v5 = -536870195;
  }
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 40LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if (v5 && a4) {
    *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v5,  0LL);
  }
  return v5 == 0;
}

- (BOOL)errorIsNack:(id)a3
{
  if (a3)
  {
    unsigned int v4 = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", NSMachErrorDomain);
    if (v4) {
      LOBYTE(v4) = [a3 code] == (id)-535724032;
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  int v7 = -536870206;
  __int128 __dst = 0uLL;
  char v16 = 0;
  if (self->_isOpen)
  {
    char v8 = *((_BYTE *)a3 + 16);
    if ((v8 & 0x1Fu) - 17 >= 0xFFFFFFF0)
    {
      uint64_t v9 = a4;
      memcpy(&__dst, a3, v8 & 0x1F);
      char v16 = v16 & 0xF0 | (v8 - 1) & 0xF;
      iocecInterface = self->_iocecInterface;
      __int128 v13 = __dst;
      char v14 = v16;
      int v7 = IOCECInterfaceSendFrame(iocecInterface, &v13, v9);
      if (!v7) {
        return 1;
      }
    }
  }

  else
  {
    int v7 = -536870195;
  }

  if (!a5) {
    return 0;
  }
  v12 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v7,  0LL);
  BOOL result = 0;
  *a5 = v12;
  return result;
}

- (id)properties
{
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 10LL)))
  {
    int v5 = "-[CECIOCECInterface properties]";
    uint64_t packedPhysicalAddress = self->_packedPhysicalAddress;
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  v7[0] = kCECInterfacePropertyIsValid;
  v7[1] = kCECInterfacePropertyHasLink;
  if (self->_hpd) {
    objc_super v3 = &__kCFBooleanTrue;
  }
  else {
    objc_super v3 = &__kCFBooleanFalse;
  }
  v8[0] = &__kCFBooleanTrue;
  v8[1] = v3;
  v7[2] = kCECInterfacePropertyPhysicalAddress;
  v8[2] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_packedPhysicalAddress,  v5,  packedPhysicalAddress);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL);
}

- (void)_updateStatusWithPhysicalAddress:(unsigned __int16)a3 HPD:(BOOL)a4 hibernate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = a3;
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 40LL)))
  {
    uint64_t v9 = self;
    objc_super v10 = "-[CECIOCECInterface _updateStatusWithPhysicalAddress:HPD:hibernate:]";
    BOOL v12 = v6;
    BOOL v13 = v5;
    uint64_t v11 = v7;
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  -[CECIOCECInterface setPackedPhysicalAddress:](self, "setPackedPhysicalAddress:", v7, v9, v10, v11, v12, v13);
  -[CECIOCECInterface setHpd:](self, "setHpd:", v6);
  if (-[CECIOCECInterface hibernate](self, "hibernate") != v5)
  {
    -[CECIOCECInterface setHibernate:](self, "setHibernate:", v5);
    -[CECIOCECInterface hibernationChanged:](self, "hibernationChanged:", v5);
  }

  -[CECIOCECInterface didChangeProperties](self, "didChangeProperties");
}

- (void)_interfaceTerminated:(__IOCECInterface *)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 40LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if (self->_iocecInterface == a3) {
    -[CoreRCInterfaceListener removeInterface:](self->_listener, "removeInterface:", self);
  }
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 40LL)))
  {
    BOOL v6 = "-[CECIOCECInterface scheduleWithDispatchQueue:]";
    id v7 = a3;
    BOOL v5 = self;
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if (!-[CECIOCECInterface serialQueue](self, "serialQueue", v5, v6, v7))
  {
    -[CECIOCECInterface setSerialQueue:](self, "setSerialQueue:", a3);
    -[CECIOCECInterface _open](self, "_open");
  }

- (void)unscheduleFromDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 40LL)))
  {
    BOOL v6 = "-[CECIOCECInterface unscheduleFromDispatchQueue:]";
    id v7 = a3;
    BOOL v5 = self;
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if (-[CECIOCECInterface serialQueue](self, "serialQueue", v5, v6, v7) == a3)
  {
    -[CECIOCECInterface _close](self, "_close");
    -[CECIOCECInterface setSerialQueue:](self, "setSerialQueue:", 0LL);
  }

- (OS_dispatch_workloop)receiveWorkloop
{
  return self->_receiveWorkloop;
}

- (void)setReceiveWorkloop:(id)a3
{
}

- (__IOCECInterface)iocecInterface
{
  return self->_iocecInterface;
}

- (BOOL)hpd
{
  return self->_hpd;
}

- (void)setHpd:(BOOL)a3
{
  self->_hpd = a3;
}

- (BOOL)hibernate
{
  return self->_hibernate;
}

- (void)setHibernate:(BOOL)a3
{
  self->_hibernate = a3;
}

- (unsigned)packedPhysicalAddress
{
  return self->_packedPhysicalAddress;
}

- (void)setPackedPhysicalAddress:(unsigned __int16)a3
{
  self->_uint64_t packedPhysicalAddress = a3;
}

@end