@interface AXTVCoreBluetoothDevice
- ($294CB042FB18EDF8FD74FDF4F765ED39)syncSettings;
- (AXTVCoreBluetoothDevice)initWithDevice:(BTDeviceImpl *)a3 address:(id)a4;
- (BOOL)_isNameCached;
- (BOOL)cloudPaired;
- (BOOL)connected;
- (BOOL)inEarDetectEnabled;
- (BOOL)isAccessory;
- (BOOL)isAppleAudioDevice;
- (BOOL)isServiceSupported:(unsigned int)a3;
- (BOOL)magicPaired;
- (BOOL)magicPairedDeviceNameUpdated;
- (BOOL)paired;
- (BOOL)setDoubleTapAction:(unsigned int)a3;
- (BOOL)setInEarDetectEnabled:(BOOL)a3;
- (BOOL)setMicMode:(unsigned int)a3;
- (BOOL)setUserName:(id)a3;
- (BOOL)supportsBatteryLevel;
- (BTDeviceImpl)device;
- (id)address;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getServiceSetting:(unsigned int)a3 key:(id)a4;
- (id)name;
- (id)scoUID;
- (id)syncGroups;
- (int)batteryLevel;
- (int)type;
- (int64_t)compare:(id)a3;
- (unint64_t)connectedServices;
- (unint64_t)connectedServicesCount;
- (unsigned)deviceClass;
- (unsigned)doubleTapAction;
- (unsigned)majorClass;
- (unsigned)micMode;
- (unsigned)minorClass;
- (unsigned)productId;
- (unsigned)vendorId;
- (void)_clearName;
- (void)acceptSSP:(int64_t)a3;
- (void)connect;
- (void)connectWithServices:(unsigned int)a3;
- (void)disconnect;
- (void)endVoiceCommand;
- (void)setDevice:(BTDeviceImpl *)a3;
- (void)setPIN:(id)a3;
- (void)setServiceSetting:(unsigned int)a3 key:(id)a4 value:(id)a5;
- (void)setSyncGroup:(int)a3 enabled:(BOOL)a4;
- (void)setSyncSettings:(id)a3;
- (void)startVoiceCommand;
- (void)unpair;
@end

@implementation AXTVCoreBluetoothDevice

- (AXTVCoreBluetoothDevice)initWithDevice:(BTDeviceImpl *)a3 address:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AXTVCoreBluetoothDevice;
  v8 = -[AXTVCoreBluetoothDevice init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[AXTVCoreBluetoothDevice setDevice:](v8, "setDevice:", a3);
    objc_storeStrong((id *)&v9->_address, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(id)objc_opt_class(self) allocWithZone:a3];
  id v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_address, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  [v5 setDevice:self->_device];
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCoreBluetoothDevice name](self, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);

  id v7 = [v5 compare:v6 options:1];
  return (int64_t)v7;
}

- (BTDeviceImpl)device
{
  return self->_device;
}

- (void)setDevice:(BTDeviceImpl *)a3
{
  if (self->_device != a3) {
    self->_device = a3;
  }
}

- (void)_clearName
{
  name = self->_name;
  self->_name = 0LL;
}

- (BOOL)_isNameCached
{
  return self->_name != 0LL;
}

- (id)name
{
  p_name = &self->_name;
  name = self->_name;
  if (name) {
    return name;
  }
  if (BTDeviceGetName(self->_device, v9, 248LL)
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9))) == 0LL)
  {
    else {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
    }
    return v6;
  }

  else
  {
    id v8 = v7;
    objc_storeStrong((id *)p_name, v7);
    return v8;
  }

- (id)address
{
  address = self->_address;
  if (!address)
  {
    id v4 = AddressForBTDevice((uint64_t)self->_device);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = self->_address;
    self->_address = v5;

    address = self->_address;
  }

  return address;
}

- (int)type
{
  else {
    return v3;
  }
}

- (unsigned)majorClass
{
  else {
    return v3 & 0x1F00;
  }
}

- (unsigned)minorClass
{
  else {
    return v3 & 0xFC;
  }
}

- (unsigned)deviceClass
{
  else {
    return v3;
  }
}

- (id)description
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCoreBluetoothDevice name](self, "name"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCoreBluetoothDevice address](self, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v3, v4));

  return v5;
}

- (id)scoUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCoreBluetoothDevice address](self, "address"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v2,  @"-tsco"));

  return v3;
}

- (unsigned)vendorId
{
  else {
    return v5;
  }
}

- (unsigned)productId
{
  else {
    return HIDWORD(v3);
  }
}

- (BOOL)paired
{
  int v3 = 0;
  BTDeviceGetPairingStatus(self->_device, &v3);
  return v3 == -1;
}

- (BOOL)cloudPaired
{
  int v3 = 0;
  BTDeviceGetCloudPairingStatus(self->_device, &v3);
  return v3 == -1;
}

- (BOOL)magicPaired
{
  int v3 = 0;
  BTDeviceGetMagicPairingStatus(self->_device, &v3);
  return v3 == -1;
}

- (BOOL)connected
{
  int v4 = 0;
  else {
    BOOL v2 = v4 == 0;
  }
  return !v2;
}

- (unint64_t)connectedServices
{
  unsigned int v3 = 0;
  BTDeviceGetConnectedServices(self->_device, &v3);
  return v3;
}

- (unint64_t)connectedServicesCount
{
  unsigned int v7 = 0;
  int ConnectedServices = BTDeviceGetConnectedServices(self->_device, &v7);
  unsigned int v3 = v7;
  BOOL v5 = ConnectedServices == 0;
  unint64_t result = 0LL;
  BOOL v5 = !v5 || v7 == 0;
  if (!v5)
  {
    do
    {
      result += v3 & 1;
      BOOL v6 = v3 > 1;
      v3 >>= 1;
    }

    while (v6);
  }

  return result;
}

- (BOOL)supportsBatteryLevel
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  LODWORD(self) = BTAccessoryManagerGetDeviceBatteryLevel( [v3 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  &v5);

  return (_DWORD)self == 0;
}

- (int)batteryLevel
{
  unsigned __int8 v5 = 0;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  LODWORD(self) = BTAccessoryManagerGetDeviceBatteryLevel( [v3 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  &v5);

  if ((_DWORD)self) {
    return -1;
  }
  else {
    return v5;
  }
}

- (BOOL)inEarDetectEnabled
{
  int v11 = -1;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  uint64_t v4 = BTAccessoryManagerGetInEarDetectionEnable( [v3 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  &v11);

  if ((_DWORD)v4)
  {
    _AXTVBTLog(16LL, 2LL, @"Failed to get inEar detect enabled : %d", v5, v6, v7, v8, v9, v4);
    return v11 != 0;
  }

  else
  {
    _AXTVBTLog(1LL, 2LL, @"inEarDetectEnabled : %d", v5, v6, v7, v8, v9, v11 == -1);
    return v11 == -1;
  }

- (BOOL)setInEarDetectEnabled:(BOOL)a3
{
  uint64_t v9 = (a3 << 31 >> 31);
  _AXTVBTLog(1LL, 2LL, @"Set inEarDetectEnabled : %d", v3, v4, v5, v6, v7, a3 << 63 >> 63);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  uint64_t v11 = BTAccessoryManagerSetInEarDetectionEnable( [v10 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  v9);

  if ((_DWORD)v11) {
    _AXTVBTLog(16LL, 2LL, @"Failed to set inEar detect enabled : %d", v12, v13, v14, v15, v16, v11);
  }
  return (_DWORD)v11 == 0;
}

- (unsigned)micMode
{
  unsigned int v11 = 0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  uint64_t MicMode = BTAccessoryManagerGetMicMode( [v3 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  &v11);

  if ((_DWORD)MicMode) {
    _AXTVBTLog(16LL, 2LL, @"Failed to get mic mode : %d", v5, v6, v7, v8, v9, MicMode);
  }
  else {
    _AXTVBTLog(1LL, 2LL, @"micMode : %d", v5, v6, v7, v8, v9, v11);
  }
  return v11;
}

- (BOOL)setMicMode:(unsigned int)a3
{
  uint64_t v8 = *(void *)&a3;
  _AXTVBTLog(1LL, 2LL, @"Set micMode : %d", v3, v4, v5, v6, v7, *(uint64_t *)&a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  uint64_t v11 = BTAccessoryManagerSetMicMode( [v10 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  v8);

  if ((_DWORD)v11) {
    _AXTVBTLog(16LL, 2LL, @"Failed to set mic mode : %d", v12, v13, v14, v15, v16, v11);
  }
  return (_DWORD)v11 == 0;
}

- (unsigned)doubleTapAction
{
  unsigned int v11 = 1;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  uint64_t DoubleTapAction = BTAccessoryManagerGetDoubleTapAction( [v3 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  &v11);

  if ((_DWORD)DoubleTapAction)
  {
    _AXTVBTLog(16LL, 2LL, @"Failed to get doubleTap action : %d", v5, v6, v7, v8, v9, DoubleTapAction);
    return 0;
  }

  else
  {
    _AXTVBTLog(1LL, 2LL, @"doubleTapAction : %d", v5, v6, v7, v8, v9, v11);
    return v11;
  }

- (BOOL)setDoubleTapAction:(unsigned int)a3
{
  uint64_t v8 = *(void *)&a3;
  _AXTVBTLog(1LL, 2LL, @"Set doubleTapAction : %d", v3, v4, v5, v6, v7, *(uint64_t *)&a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  uint64_t v11 = BTAccessoryManagerSetDoubleTapAction( [v10 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  v8);

  if ((_DWORD)v11) {
    _AXTVBTLog(16LL, 2LL, @"Failed to set doubleTap action : %d", v12, v13, v14, v15, v16, v11);
  }
  return (_DWORD)v11 == 0;
}

- (BOOL)magicPairedDeviceNameUpdated
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
  if (!v4) {
    return 0;
  }
  v10 = (void *)v4;
  BOOL v3 = 1;
  _AXTVBTLog(1LL, 2LL, @"Magic paired device name updated to %@", v5, v6, v7, v8, v9, v4);
  -[AXTVCoreBluetoothDevice _clearName](self, "_clearName");
  uint64_t v11 = (NSString *)[v10 copy];
  name = self->_name;
  self->_name = v11;

  return v3;
}

- (BOOL)isAccessory
{
  int v5 = 0;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  BTAccessoryManagerIsAccessory( [v3 _accessoryManager],  -[AXTVCoreBluetoothDevice device](self, "device"),  &v5);

  return v5 == -1;
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  int v7 = 0;
  int SupportedServices = BTDeviceGetSupportedServices(self->_device, &v7);
  return (v7 & a3) != 0 && SupportedServices == 0;
}

- (id)getServiceSetting:(unsigned int)a3 key:(id)a4
{
  if (BTDeviceGetServiceSettings( self->_device, *(void *)&a3, [a4 UTF8String], v5)) {
    return 0LL;
  }
  else {
    return -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v5);
  }
}

- (void)setServiceSetting:(unsigned int)a3 key:(id)a4 value:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  device = self->_device;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 UTF8String];
  id v12 = v10;
  id v13 = [v12 UTF8String];

  if (BTDeviceSetServiceSettings(device, v6, v11, v13))
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[AXTVCoreBluetoothDevice name](self, "name"));
    _AXTVBTLog( 16LL,  2LL,  @"Failed to set service setting for device \"%@\"",  v14,  v15,  v16,  v17,  v18,  (uint64_t)v19);
  }

- (void)connect
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v3 connectDevice:self];
}

- (void)connectWithServices:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v5 connectDevice:self withServices:v3];
}

- (void)disconnect
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v3 disconnectDevice:self];
}

- (void)setPIN:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v5 setPincode:v4 forDevice:self];
}

- (void)acceptSSP:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v5 acceptSSP:a3 forDevice:self];
}

- (void)unpair
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v3 unpairDevice:self];
}

- (void)startVoiceCommand
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v3 startVoiceCommand:self];
}

- (void)endVoiceCommand
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
  [v3 endVoiceCommand:self];
}

- ($294CB042FB18EDF8FD74FDF4F765ED39)syncSettings
{
  unsigned int v3 = 0;
  BTDeviceGetSyncSettings(self->_device, &v3);
  return ($294CB042FB18EDF8FD74FDF4F765ED39)(v3 & 1 | (((v3 >> 3) & 1) << 16) & 0xFEFFFEFF | (((v3 >> 2) & 1) << 24) | (((v3 >> 1) & 1) << 8));
}

- (void)setSyncSettings:(id)a3
{
}

- (id)syncGroups
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v8 = 0LL;
  else {
    BOOL v4 = v8 == 0;
  }
  if (!v4)
  {
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9[v5]));
      [v3 addObject:v6];

      ++v5;
    }

    while (v5 < v8);
  }

  return v3;
}

- (void)setSyncGroup:(int)a3 enabled:(BOOL)a4
{
}

- (BOOL)isAppleAudioDevice
{
  return -[AXTVCoreBluetoothDevice vendorId](self, "vendorId") == 76
      && -[AXTVCoreBluetoothDevice productId](self, "productId") >= 0x2002
      && -[AXTVCoreBluetoothDevice productId](self, "productId") < 0x200A;
}

- (BOOL)setUserName:(id)a3
{
  id v4 = a3;
  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", v4)) {
    goto LABEL_5;
  }
  id v5 = v4;
  uint64_t v6 = BTDeviceSetUserName(self->_device, [v5 cStringUsingEncoding:4]);
  if (!(_DWORD)v6)
  {
    -[AXTVCoreBluetoothDevice _clearName](self, "_clearName");
    unint64_t v8 = (NSString *)[v5 copy];
    name = self->_name;
    self->_name = v8;

LABEL_5:
    BOOL v7 = 1;
    goto LABEL_6;
  }

  NSLog(@"BTM : Failed to set user-defined name with error: %d", v6);
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (void).cxx_destruct
{
}

@end