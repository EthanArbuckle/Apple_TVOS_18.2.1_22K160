@interface INCachedDeviceInfo
+ (id)currentDeviceInfo;
- (INCachedDeviceInfo)initWithDeviceInfo:(id)a3;
- (NSString)deviceEnclosureColor;
- (NSString)mobileEquipmentIdentifier;
@end

@implementation INCachedDeviceInfo

- (INCachedDeviceInfo)initWithDeviceInfo:(id)a3
{
  id v5 = a3;
  v6 = -[INCachedDeviceInfo init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceInfo, a3);
  }

  return v7;
}

+ (id)currentDeviceInfo
{
  if (qword_10002C238 != -1) {
    dispatch_once(&qword_10002C238, &stru_100025178);
  }
  return (id)qword_10002C230;
}

- (NSString)mobileEquipmentIdentifier
{
  mobileEquipmentIdentifier = self->_mobileEquipmentIdentifier;
  if (!mobileEquipmentIdentifier)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[AADeviceInfo mobileEquipmentIdentifier](self->_deviceInfo, "mobileEquipmentIdentifier"));
    id v5 = self->_mobileEquipmentIdentifier;
    self->_mobileEquipmentIdentifier = v4;

    mobileEquipmentIdentifier = self->_mobileEquipmentIdentifier;
  }

  return mobileEquipmentIdentifier;
}

- (NSString)deviceEnclosureColor
{
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (!deviceEnclosureColor)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[AADeviceInfo deviceEnclosureColor](self->_deviceInfo, "deviceEnclosureColor"));
    id v5 = self->_deviceEnclosureColor;
    self->_deviceEnclosureColor = v4;

    deviceEnclosureColor = self->_deviceEnclosureColor;
  }

  return deviceEnclosureColor;
}

- (void).cxx_destruct
{
}

@end