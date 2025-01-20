@interface PBBluetoothDevice
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (PBBluetoothDevice)initWithBluetoothDevice:(id)a3;
- (PBBluetoothDevice)initWithPeripheral:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (unint64_t)vendorIdentifier;
- (void)setConnected:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PBBluetoothDevice

- (PBBluetoothDevice)initWithPeripheral:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBBluetoothDevice;
  v5 = -[PBBluetoothDevice init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    v7 = (NSString *)[v6 copy];
    name = v5->_name;
    v5->_name = v7;

    v5->_connected = [v4 isConnectedToSystem];
    v5->_vendorIdentifier = (unint64_t)objc_msgSend(v4, "tvs_vendorIdentifier");
    if (objc_msgSend(v4, "tvs_isBluetoothRemote"))
    {
      uint64_t v9 = 1LL;
    }

    else
    {
      if (!objc_msgSend(v4, "tvs_isBluetoothGamepad"))
      {
        v5->_type = 0LL;
        goto LABEL_8;
      }

      uint64_t v9 = 4LL;
    }

    v5->_type = v9;
  }

- (PBBluetoothDevice)initWithBluetoothDevice:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBBluetoothDevice;
  v5 = -[PBBluetoothDevice init](&v12, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    v7 = (NSString *)[v6 copy];
    name = v5->_name;
    v5->_name = v7;

    v5->_connected = [v4 connected];
    v5->_vendorIdentifier = [v4 vendorId];
    unsigned int v9 = [v4 type];
    if (v9 <= 0x2F)
    {
      if (((1LL << v9) & 0x8000009B0008LL) != 0)
      {
        uint64_t v10 = 3LL;
LABEL_5:
        v5->_type = v10;
        goto LABEL_6;
      }

      if (v9 == 24LL)
      {
        uint64_t v10 = 2LL;
        goto LABEL_5;
      }

      if (v9 == 26LL)
      {
        uint64_t v10 = 4LL;
        goto LABEL_5;
      }
    }

    uint64_t v10 = 0LL;
    goto LABEL_5;
  }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_name withName:@"name"];
  id v4 = [v3 appendBool:self->_connected withName:@"connected"];
  unint64_t v5 = self->_type - 1;
  if (v5 > 3) {
    v6 = @"Generic";
  }
  else {
    v6 = off_1003D2C80[v5];
  }
  [v3 appendString:v6 withName:@"type"];
  id v7 = [v3 appendUnsignedInteger:self->_vendorIdentifier withName:@"vendorIdentifier"];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBBluetoothDevice));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBBluetoothDevice name](self, "name"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10006DE60;
  v29[3] = &unk_1003D2B30;
  id v8 = v4;
  id v30 = v8;
  id v9 = [v6 appendString:v7 counterpart:v29];

  BOOL v10 = -[PBBluetoothDevice isConnected](self, "isConnected");
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10006DE80;
  v27[3] = &unk_1003D2B58;
  id v11 = v8;
  id v28 = v11;
  id v12 = [v6 appendBool:v10 counterpart:v27];
  unint64_t v13 = -[PBBluetoothDevice type](self, "type");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10006DE98;
  v25[3] = &unk_1003D2B80;
  id v14 = v11;
  id v26 = v14;
  id v15 = [v6 appendUnsignedInteger:v13 counterpart:v25];
  unint64_t v16 = -[PBBluetoothDevice vendorIdentifier](self, "vendorIdentifier");
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_10006DEB0;
  v23 = &unk_1003D2B80;
  id v24 = v14;
  id v17 = v14;
  id v18 = [v6 appendUnsignedInteger:v16 counterpart:&v20];
  LOBYTE(v16) = objc_msgSend(v6, "isEqual", v20, v21, v22, v23);

  return v16;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBBluetoothDevice name](self, "name"));
  id v5 = [v3 appendString:v4];

  id v6 = objc_msgSend(v3, "appendBool:", -[PBBluetoothDevice isConnected](self, "isConnected"));
  id v7 = objc_msgSend(v3, "appendUnsignedInteger:", -[PBBluetoothDevice type](self, "type"));
  id v8 = objc_msgSend(v3, "appendUnsignedInteger:", -[PBBluetoothDevice vendorIdentifier](self, "vendorIdentifier"));
  id v9 = [v3 hash];

  return (unint64_t)v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (unint64_t)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void).cxx_destruct
{
}

@end