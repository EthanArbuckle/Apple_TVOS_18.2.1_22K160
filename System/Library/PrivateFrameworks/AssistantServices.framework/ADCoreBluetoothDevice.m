@interface ADCoreBluetoothDevice
- (ADCoreBluetoothDevice)initWithIdentifier:(id)a3 name:(id)a4 RSSI:(id)a5 state:(id)a6;
- (NSNumber)RSSI;
- (NSString)index;
- (NSString)name;
- (NSString)state;
- (NSUUID)identifier;
- (id)dictionaryRepresentation;
- (void)setIndex:(id)a3;
@end

@implementation ADCoreBluetoothDevice

- (ADCoreBluetoothDevice)initWithIdentifier:(id)a3 name:(id)a4 RSSI:(id)a5 state:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ADCoreBluetoothDevice;
  v15 = -[ADCoreBluetoothDevice init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_name, a4);
    objc_storeStrong((id *)&v16->_RSSI, a5);
    objc_storeStrong((id *)&v16->_state, a6);
  }

  return v16;
}

- (id)dictionaryRepresentation
{
  v3 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  v4 = v3;
  if (self->_identifier)
  {
    index = self->_index;
    if (index) {
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", index, @"index");
    }
  }

  RSSI = self->_RSSI;
  if (RSSI) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", RSSI, @"RSSI");
  }
  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)RSSI
{
  return self->_RSSI;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (void).cxx_destruct
{
}

@end