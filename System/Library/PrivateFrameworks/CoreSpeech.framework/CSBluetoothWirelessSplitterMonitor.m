@interface CSBluetoothWirelessSplitterMonitor
+ (id)sharedInstance;
- (CSBluetoothWirelessSplitterMonitor)init;
- (unint64_t)splitterState;
@end

@implementation CSBluetoothWirelessSplitterMonitor

- (CSBluetoothWirelessSplitterMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSBluetoothWirelessSplitterMonitor;

  return 0LL;
}

- (unint64_t)splitterState
{
  return 0LL;
}

+ (id)sharedInstance
{
  return 0LL;
}

@end