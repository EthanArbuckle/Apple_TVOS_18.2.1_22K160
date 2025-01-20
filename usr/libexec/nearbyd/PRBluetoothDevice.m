@interface PRBluetoothDevice
- (BOOL)isMobilePhoneModel;
- (BOOL)isUwbCapable;
- (BOOL)isWifiRangingCapable;
- (BOOL)supportsCapabilities:(unsigned int)a3;
- (BOOL)systemKeyRelationship;
- (CBDevice)cbDevice;
- (NIDiscoveryToken)discoveryToken;
- (NSData)discoveryTokenData;
- (NSString)idsDeviceID;
- (NSString)name;
- (PRBluetoothDevice)initWithCBDevice:(id)a3;
- (array<unsigned)btAdvertisingAddress;
- (id)description;
- (unint64_t)u64Identifier;
@end

@implementation PRBluetoothDevice

- (PRBluetoothDevice)initWithCBDevice:(id)a3
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 btAddressData]);

  if (!v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"PRBluetoothDevice.mm", 20, @"Invalid parameter not satisfying: %@", @"cbDevice.btAddressData" object file lineNumber description];
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PRBluetoothDevice;
  v8 = -[PRBluetoothDevice init](&v15, "init");
  p_isa = (id *)&v8->super.isa;
  if (!v8
    || (objc_storeStrong((id *)&v8->_cbDevice, a3), ([p_isa systemKeyRelationship] & 1) != 0)
    || (v10 = (void *)objc_claimAutoreleasedReturnValue([p_isa[1] spatialInteractionTokenData]),
        v10,
        v10))
  {
    v11 = p_isa;
  }

  else
  {
    v13 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003969A8((uint64_t)v6, v13);
    }
    v11 = 0LL;
  }

  return v11;
}

- (NSData)discoveryTokenData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice spatialInteractionTokenData](self->_cbDevice, "spatialInteractionTokenData"));

  if (v3)
  {
    v4 = (NSData *)objc_claimAutoreleasedReturnValue(-[CBDevice spatialInteractionTokenData](self->_cbDevice, "spatialInteractionTokenData"));
LABEL_7:
    v7 = v4;
    return v7;
  }

  if (!-[PRBluetoothDevice systemKeyRelationship](self, "systemKeyRelationship")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDevice idsDeviceID](self, "idsDeviceID")),
        v5,
        !v5))
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Device does not have a discovery token nor is it a known device. %@",  self->_cbDevice);
    v4 = objc_opt_new(&OBJC_CLASS___NSData);
    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDevice idsDeviceID](self, "idsDeviceID"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);

  return v7;
}

- (NSString)idsDeviceID
{
  return (NSString *)-[CBDevice idsDeviceID](self->_cbDevice, "idsDeviceID");
}

- (NIDiscoveryToken)discoveryToken
{
  v3 = objc_alloc(&OBJC_CLASS___NIDiscoveryToken);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDevice discoveryTokenData](self, "discoveryTokenData"));
  v5 = -[NIDiscoveryToken initWithBytes:](v3, "initWithBytes:", v4);

  return v5;
}

- (array<unsigned)btAdvertisingAddress
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self->_cbDevice, "btAddressData"));
  if (!v3) {
    sub_100396A1C();
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self->_cbDevice, "btAddressData"));
  [v4 getBytes:&v10 length:6];

  v5 = (char *)&v11 + 1;
  id v6 = (char *)&v10 + 1;
  do
  {
    char v7 = *(v6 - 1);
    *(v6 - 1) = *v5;
    *v5-- = v7;
  }

  while (v6++ < v5);
  return (array<unsigned char, 6UL>)(v10 | ((unint64_t)v11 << 32));
}

- (unint64_t)u64Identifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self->_cbDevice, "btAddressData"));
  if (!v3) {
    sub_100396A44();
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self->_cbDevice, "btAddressData"));
  unint64_t v5 = sub_10000A584(v4);

  return v5;
}

- (BOOL)systemKeyRelationship
{
  if ((-[CBDevice deviceFlags](self->_cbDevice, "deviceFlags") & 0x80) != 0
    || (-[CBDevice deviceFlags](self->_cbDevice, "deviceFlags") & 0x100) != 0)
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    return ((unint64_t)-[CBDevice deviceFlags](self->_cbDevice, "deviceFlags") >> 9) & 1;
  }

  return v3;
}

- (NSString)name
{
  return (NSString *)-[CBDevice name](self->_cbDevice, "name");
}

- (BOOL)isUwbCapable
{
  return (-[CBDevice spatialInteractionFlags](self->_cbDevice, "spatialInteractionFlags") >> 3) & 1;
}

- (BOOL)isWifiRangingCapable
{
  return (-[CBDevice spatialInteractionFlags](self->_cbDevice, "spatialInteractionFlags") >> 4) & 1;
}

- (BOOL)isMobilePhoneModel
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice model](self->_cbDevice, "model"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice model](self->_cbDevice, "model"));
    unsigned __int8 v5 = [v4 hasPrefix:@"iPhone"];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)description
{
  return -[CBDevice description](self->_cbDevice, "description");
}

- (BOOL)supportsCapabilities:(unsigned int)a3
{
  return (-[CBDevice spatialInteractionUWBTokenFlags](self->_cbDevice, "spatialInteractionUWBTokenFlags") & a3) != 0;
}

- (CBDevice)cbDevice
{
  return (CBDevice *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end