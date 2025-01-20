@interface W5BluetoothDeviceInternal
- (BOOL)__isAppleDevice;
- (BOOL)__isCloudPaired;
- (BOOL)__isConnected;
- (BOOL)__isLowEnergy;
- (BOOL)__isPaired;
- (id)__address;
- (id)__name;
- (id)device;
- (unint64_t)__majorClass;
- (unint64_t)__minorClass;
- (void)dealloc;
- (void)setBluetoothDevice:(id)a3;
- (void)setPeripheral:(id)a3 centralManager:(id)a4;
@end

@implementation W5BluetoothDeviceInternal

- (void)setPeripheral:(id)a3 centralManager:(id)a4
{
  self->_peripheral = (CBPeripheral *)a3;

  self->_centralManager = (CBCentralManager *)a4;
}

- (void)setBluetoothDevice:(id)a3
{
  self->_device = (BluetoothDevice *)a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___W5BluetoothDeviceInternal;
  -[W5BluetoothDeviceInternal dealloc](&v3, "dealloc");
}

- (id)device
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5BluetoothDevice);
  objc_msgSend(v3, "setName:", -[W5BluetoothDeviceInternal __name](self, "__name"));
  objc_msgSend(v3, "setAddress:", -[W5BluetoothDeviceInternal __address](self, "__address"));
  objc_msgSend(v3, "setIsPaired:", -[W5BluetoothDeviceInternal __isPaired](self, "__isPaired"));
  objc_msgSend(v3, "setIsConnected:", -[W5BluetoothDeviceInternal __isConnected](self, "__isConnected"));
  objc_msgSend(v3, "setIsCloudPaired:", -[W5BluetoothDeviceInternal __isCloudPaired](self, "__isCloudPaired"));
  objc_msgSend(v3, "setMajorClass:", -[W5BluetoothDeviceInternal __majorClass](self, "__majorClass"));
  objc_msgSend(v3, "setMinorClass:", -[W5BluetoothDeviceInternal __minorClass](self, "__minorClass"));
  objc_msgSend(v3, "setIsLowEnergy:", -[W5BluetoothDeviceInternal __isLowEnergy](self, "__isLowEnergy"));
  objc_msgSend(v3, "setIsAppleDevice:", -[W5BluetoothDeviceInternal __isAppleDevice](self, "__isAppleDevice"));
  return v3;
}

- (id)__name
{
  device = self->_device;
  if (!device) {
    device = self->_peripheral;
  }
  return [device name];
}

- (id)__address
{
  device = self->_device;
  if (device) {
    return -[BluetoothDevice address](device, "address");
  }
  else {
    return objc_msgSend(-[CBPeripheral identifier](self->_peripheral, "identifier"), "UUIDString");
  }
}

- (BOOL)__isPaired
{
  device = self->_device;
  if (device) {
    return -[BluetoothDevice paired](device, "paired");
  }
  else {
    return objc_msgSend( -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent"),  "isPeerPaired:",  self->_peripheral);
  }
}

- (BOOL)__isCloudPaired
{
  device = self->_device;
  if (device) {
    return -[BluetoothDevice cloudPaired](device, "cloudPaired");
  }
  else {
    return objc_msgSend( -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent"),  "isPeerCloudPaired:");
  }
}

- (BOOL)__isConnected
{
  device = self->_device;
  if (device) {
    return -[BluetoothDevice connected](device, "connected");
  }
  else {
    return -[CBPeripheral isConnectedToSystem](self->_peripheral, "isConnectedToSystem");
  }
}

- (BOOL)__isLowEnergy
{
  device = self->_device;
  if (device) {
    LOBYTE(v4) = -[BluetoothDevice type](device, "type") == 48;
  }
  else {
    return self->_peripheral != 0LL;
  }
  return v4;
}

- (BOOL)__isAppleDevice
{
  device = self->_device;
  if (device) {
    LOBYTE(device) = -[BluetoothDevice isAppleAudioDevice](device, "isAppleAudioDevice");
  }
  return (char)device;
}

- (unint64_t)__majorClass
{
  return -[BluetoothDevice majorClass](self->_device, "majorClass");
}

- (unint64_t)__minorClass
{
  return -[BluetoothDevice minorClass](self->_device, "minorClass");
}

@end