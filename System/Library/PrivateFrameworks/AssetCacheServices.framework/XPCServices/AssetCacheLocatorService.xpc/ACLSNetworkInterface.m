@interface ACLSNetworkInterface
- (BOOL)isNCM;
- (BOOL)shareable;
- (BOOL)useful;
- (BOOL)wired;
- (NSNumber)locationID;
- (NSString)bsdName;
- (NSString)deviceID;
- (NSString)interfaceType;
- (NSString)ipAddress;
- (NSString)userReadable;
- (double)speed;
- (id)description;
- (void)setBsdName:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setInterfaceType:(id)a3;
- (void)setIpAddress:(id)a3;
- (void)setIsNCM:(BOOL)a3;
- (void)setLocationID:(id)a3;
- (void)setShareable:(BOOL)a3;
- (void)setSpeed:(double)a3;
- (void)setUseful:(BOOL)a3;
- (void)setUserReadable:(id)a3;
- (void)setWired:(BOOL)a3;
@end

@implementation ACLSNetworkInterface

- (id)description
{
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSNetworkInterface ipAddress](self, "ipAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSNetworkInterface bsdName](self, "bsdName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSNetworkInterface deviceID](self, "deviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSNetworkInterface userReadable](self, "userReadable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSNetworkInterface locationID](self, "locationID"));
  id v7 = [v6 unsignedIntValue];
  v8 = @"YES";
  if (-[ACLSNetworkInterface wired](self, "wired")) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSNetworkInterface interfaceType](self, "interfaceType"));
  if (!-[ACLSNetworkInterface isNCM](self, "isNCM")) {
    v8 = @"NO";
  }
  -[ACLSNetworkInterface speed](self, "speed");
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{IP Address = %@, BSD Name = %@, Device ID = %@, User Readable = %@, IO Path Location = %#x, Wired = %@, Interface Type = %@, NCM = %@, Speed = %.1f Mbps}",  v14,  v3,  v4,  v5,  v7,  v9,  v10,  v8,  v11));

  return v12;
}

- (NSString)ipAddress
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIpAddress:(id)a3
{
}

- (NSString)bsdName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBsdName:(id)a3
{
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)userReadable
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUserReadable:(id)a3
{
}

- (NSNumber)locationID
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLocationID:(id)a3
{
}

- (BOOL)wired
{
  return self->_wired;
}

- (void)setWired:(BOOL)a3
{
  self->_wired = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (NSString)interfaceType
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setInterfaceType:(id)a3
{
}

- (BOOL)isNCM
{
  return self->_isNCM;
}

- (void)setIsNCM:(BOOL)a3
{
  self->_isNCM = a3;
}

- (BOOL)shareable
{
  return self->_shareable;
}

- (void)setShareable:(BOOL)a3
{
  self->_shareable = a3;
}

- (BOOL)useful
{
  return self->_useful;
}

- (void)setUseful:(BOOL)a3
{
  self->_useful = a3;
}

- (void).cxx_destruct
{
}

@end