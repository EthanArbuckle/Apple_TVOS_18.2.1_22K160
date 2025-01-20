@interface OSDBluetoothDevice
- (NSString)address;
- (NSString)defaultName;
- (NSString)name;
- (id)description;
- (unsigned)deviceClass;
- (unsigned)deviceType;
- (void)setAddress:(id)a3;
- (void)setDefaultName:(id)a3;
- (void)setDeviceClass:(unsigned int)a3;
- (void)setDeviceType:(unsigned int)a3;
- (void)setName:(id)a3;
@end

@implementation OSDBluetoothDevice

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OSDBluetoothDevice;
  id v3 = -[OSDBluetoothDevice description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDBluetoothDevice name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDBluetoothDevice defaultName](self, "defaultName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDBluetoothDevice address](self, "address"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ %@ [%@]",  v4,  v5,  v6,  v7));

  return v8;
}

- (NSString)defaultName
{
  return self->_defaultName;
}

- (void)setDefaultName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(unsigned int)a3
{
  self->_deviceClass = a3;
}

- (void).cxx_destruct
{
}

@end