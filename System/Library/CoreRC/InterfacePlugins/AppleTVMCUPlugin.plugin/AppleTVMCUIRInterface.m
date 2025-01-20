@interface AppleTVMCUIRInterface
- (AppleTVMCUPlugin)plugin;
- (BOOL)setPairState:(BOOL)a3 forDeviceUID:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)propertyForKey:(id)a3 error:(id *)a4;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setPlugin:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation AppleTVMCUIRInterface

- (id)propertyForKey:(id)a3 error:(id *)a4
{
  return -[AppleTVMCUPlugin propertyForKey:error:](self->_plugin, "propertyForKey:error:", a3, a4);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  return -[AppleTVMCUPlugin setProperty:forKey:error:](self->_plugin, "setProperty:forKey:error:", a3, a4, a5);
}

- (BOOL)setPairState:(BOOL)a3 forDeviceUID:(unsigned __int8)a4 error:(id *)a5
{
  v11 = 0LL;
  if (a3) {
    v7 = @"pair";
  }
  else {
    v7 = @"unpair";
  }
  v8 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v7,  @"action",  +[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", a4),  @"deviceUID",  0LL);
  if (v8)
  {
    BOOL v9 = -[AppleTVMCUPlugin setProperty:forKey:error:]( self->_plugin,  "setProperty:forKey:error:",  v8,  @"com.apple.AppleTVHID.pairControl",  &v11);
  }

  else
  {
    BOOL v9 = 0;
    v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6728LL,  0LL);
  }

  if (a5) {
    *a5 = v11;
  }
  return v9;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (-[AppleTVMCUIRInterface serialQueue](self, "serialQueue"))
  {
    if (dword_10CF8 <= 60 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 60LL))) {
      LogPrintF( &dword_10CF8,  "-[AppleTVMCUIRInterface scheduleWithDispatchQueue:]",  60LL,  "%@ error: already scheduled on: %p (queue=%p)\n",  self,  -[AppleTVMCUIRInterface serialQueue](self, "serialQueue"),  a3);
    }
  }

  else
  {
    -[AppleTVMCUIRInterface setSerialQueue:](self, "setSerialQueue:", a3);
  }

- (void)unscheduleFromDispatchQueue:(id)a3
{
  if (-[AppleTVMCUIRInterface serialQueue](self, "serialQueue") == a3)
  {
    -[AppleTVMCUIRInterface setSerialQueue:](self, "setSerialQueue:", 0LL);
  }

  else if (dword_10CF8 <= 60 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 60LL)))
  {
    LogPrintF( &dword_10CF8,  "-[AppleTVMCUIRInterface unscheduleFromDispatchQueue:]",  60LL,  "%@ error: invalid queue: %p\n",  self,  a3);
  }

- (AppleTVMCUPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

@end