@interface CloudDevice
+ (CloudDevice)deviceWithIDSDevice:(id)a3;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (CloudDevice)initWithCoder:(id)a3;
- (CloudDevice)initWithIDSDevice:(id)a3;
- (IDSDevice)idsDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stateString;
- (unint64_t)hash;
- (unint64_t)state;
- (void)setIsConnected:(BOOL)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation CloudDevice

+ (CloudDevice)deviceWithIDSDevice:(id)a3
{
  id v3 = a3;
  v4 = -[CloudDevice initWithIDSDevice:](objc_alloc(&OBJC_CLASS___CloudDevice), "initWithIDSDevice:", v3);

  return v4;
}

- (CloudDevice)initWithIDSDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CloudDevice;
  v6 = -[CloudDevice init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_idsDevice, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CloudDevice);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDevice]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudDevice idsDevice](self, "idsDevice"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
    unsigned __int8 v10 = [v7 isEqualToString:v9];
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudDevice idsDevice](self, "idsDevice"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueID]);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudDevice idsDevice](self, "idsDevice"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 cpDescription]);

  return v3;
}

- (id)stateString
{
  unint64_t state = self->_state;
  if (state > 6) {
    return @"unknown";
  }
  else {
    return (id)*((void *)&off_100208FA8 + state);
  }
}

- (CloudDevice)initWithCoder:(id)a3
{
  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CloudDevice init](+[CloudDevice allocWithZone:](&OBJC_CLASS___CloudDevice, "allocWithZone:", a3), "init");
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (void).cxx_destruct
{
}

@end