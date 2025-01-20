@interface CURangingPeer
- (BOOL)isEqual:(id)a3;
- (NSData)deviceAddress;
- (NSData)deviceIRK;
- (NSString)deviceModel;
- (id)description;
- (unint64_t)hash;
- (void)setDeviceAddress:(id)a3;
- (void)setDeviceIRK:(id)a3;
- (void)setDeviceModel:(id)a3;
@end

@implementation CURangingPeer

- (id)description
{
  return NSPrintF();
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CURangingPeer *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      deviceAddress = self->_deviceAddress;
      v7 = -[CURangingPeer deviceAddress](v5, "deviceAddress");
      v8 = deviceAddress;
      v9 = v7;
      if (v8 == v9)
      {
      }

      else
      {
        v10 = v9;
        if ((v8 == 0LL) == (v9 != 0LL)) {
          goto LABEL_18;
        }
        int v11 = -[NSData isEqual:](v8, "isEqual:", v9);

        if (!v11) {
          goto LABEL_13;
        }
      }

      deviceIRK = self->_deviceIRK;
      v14 = -[CURangingPeer deviceIRK](v5, "deviceIRK");
      v8 = deviceIRK;
      v15 = v14;
      if (v8 == v15)
      {
      }

      else
      {
        v10 = v15;
        if ((v8 == 0LL) == (v15 != 0LL)) {
          goto LABEL_18;
        }
        int v16 = -[NSData isEqual:](v8, "isEqual:", v15);

        if (!v16)
        {
LABEL_13:
          char v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }

      deviceModel = self->_deviceModel;
      v18 = -[CURangingPeer deviceModel](v5, "deviceModel");
      v8 = deviceModel;
      v19 = v18;
      if (v8 == v19)
      {
        char v12 = 1;
        v10 = v8;
        goto LABEL_19;
      }

      v10 = v19;
      if ((v8 == 0LL) != (v19 != 0LL))
      {
        char v12 = -[NSData isEqual:](v8, "isEqual:", v19);
LABEL_19:

        goto LABEL_20;
      }

- (unint64_t)hash
{
  uint64_t v3 = -[NSData hash](self->_deviceAddress, "hash");
  uint64_t v4 = -[NSData hash](self->_deviceIRK, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_deviceModel, "hash");
}

- (NSData)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (NSData)deviceIRK
{
  return self->_deviceIRK;
}

- (void)setDeviceIRK:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end