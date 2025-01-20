@interface SOSTrustedDeviceAttributes
+ (BOOL)supportsSecureCoding;
- (NSString)machineID;
- (NSString)serialNumber;
- (SOSTrustedDeviceAttributes)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMachineID:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation SOSTrustedDeviceAttributes

- (SOSTrustedDeviceAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SOSTrustedDeviceAttributes;
  v5 = -[SOSTrustedDeviceAttributes init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"machineID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    machineID = v5->_machineID;
    v5->_machineID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"serialNumber"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  machineID = self->_machineID;
  id v5 = a3;
  [v5 encodeObject:machineID forKey:@"machineID"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMachineID:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end