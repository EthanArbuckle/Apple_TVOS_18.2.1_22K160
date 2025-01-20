@interface ComponentBluetooth
- (BOOL)isPresent;
- (id)bluetoothAddress;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentBluetooth

- (BOOL)isPresent
{
  return findDeviceWithName("bluetooth") || findDeviceWithName("marconi-bt");
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ComponentBluetooth bluetoothAddress](self, "bluetoothAddress"));
  [v4 setObject:v5 forKeyedSubscript:@"bluetoothAddress"];
}

- (id)bluetoothAddress
{
  v2 = (void *)MGCopyAnswer(@"BluetoothAddress", 0LL);
  id v3 = stringOrNull(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

@end