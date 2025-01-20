@interface _ACCBTConnectionStatusComponent
- (BOOL)enabled;
- (BOOL)needToUnplugBTDevice;
- (BOOL)updateStarted;
- (NSData)macAddr;
- (NSString)accessoryUID;
- (NSString)componentUID;
- (NSString)name;
- (_ACCBTConnectionStatusComponent)initWithUID:(id)a3 componentUID:(id)a4 name:(id)a5 macAddr:(id)a6;
- (id)copyDictionary;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setNeedToUnplugBTDevice:(BOOL)a3;
- (void)setUpdateStarted:(BOOL)a3;
@end

@implementation _ACCBTConnectionStatusComponent

- (_ACCBTConnectionStatusComponent)initWithUID:(id)a3 componentUID:(id)a4 name:(id)a5 macAddr:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____ACCBTConnectionStatusComponent;
  v15 = -[_ACCBTConnectionStatusComponent init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessoryUID, a3);
    objc_storeStrong((id *)&v16->_componentUID, a4);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_macAddr, a6);
    *(_WORD *)&v16->_enabled = 0;
    v16->_needToUnplugBTDevice = 0;
  }

  return v16;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0LL;

  componentUID = self->_componentUID;
  self->_componentUID = 0LL;

  name = self->_name;
  self->_name = 0LL;

  macAddr = self->_macAddr;
  self->_macAddr = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____ACCBTConnectionStatusComponent;
  -[_ACCBTConnectionStatusComponent dealloc](&v7, "dealloc");
}

- (id)copyDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  self->_accessoryUID,  @"ACCBluetoothStatusComponentInfoAccessoryUID");
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  self->_componentUID,  @"ACCBluetoothStatusComponentInfoUID");
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  self->_macAddr,  @"ACCBluetoothStatusComponentInfoMACAddr");
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  self->_name,  @"ACCBluetoothStatusComponentInfoName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_enabled));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"ACCBluetoothStatusComponentInfoEnabled");

  return v3;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (NSString)componentUID
{
  return self->_componentUID;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)macAddr
{
  return self->_macAddr;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)updateStarted
{
  return self->_updateStarted;
}

- (void)setUpdateStarted:(BOOL)a3
{
  self->_updateStarted = a3;
}

- (BOOL)needToUnplugBTDevice
{
  return self->_needToUnplugBTDevice;
}

- (void)setNeedToUnplugBTDevice:(BOOL)a3
{
  self->_needToUnplugBTDevice = a3;
}

- (void).cxx_destruct
{
}

@end