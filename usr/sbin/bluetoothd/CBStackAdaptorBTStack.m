@interface CBStackAdaptorBTStack
- (Class)accessoryMonitorClass;
- (Class)addressMonitorClass;
- (Class)bleAdvertiserClass;
- (Class)bleScannerClass;
- (Class)classicScannerClass;
- (Class)controllerClass;
- (Class)deviceMonitorClass;
- (Class)userControllerClass;
@end

@implementation CBStackAdaptorBTStack

- (Class)accessoryMonitorClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CBStackAccessoryMonitorBTStack);
}

- (Class)addressMonitorClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CBStackAddressMonitorBTStack);
}

- (Class)bleAdvertiserClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CBStackBLEAdvertiserBTStack);
}

- (Class)bleScannerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CBStackBLEScannerBTStack);
}

- (Class)classicScannerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CBStackClassicScannerBTStack);
}

- (Class)controllerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CBStackControllerBTStack);
}

- (Class)deviceMonitorClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CBStackDeviceMonitorBTStack);
}

- (Class)userControllerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CBUserController);
}

@end