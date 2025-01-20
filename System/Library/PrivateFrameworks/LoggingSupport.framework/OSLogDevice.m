@interface OSLogDevice
- (NSString)uid;
- (OSLogDevice)init;
- (OSLogDevice)initWithMobileDevice:(void *)a3 andUDID:(id)a4;
- (OSLogDevice)initWithSimualatedDevice:(id)a3;
- (SimDevice)simDev;
- (id)description;
- (int64_t)devType;
- (void)dealloc;
- (void)mobileDeviceRef;
- (void)setDevType:(int64_t)a3;
- (void)setMobileDeviceRef:(void *)a3;
- (void)setSimDev:(id)a3;
- (void)setUid:(id)a3;
@end

@implementation OSLogDevice

- (OSLogDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___OSLogDevice;
  v2 = -[OSLogDevice init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_devType = 0LL;
    v2->_mobileDeviceRef = 0LL;
    simDev = v2->_simDev;
    v2->_simDev = 0LL;

    uid = v3->_uid;
    v3->_uid = 0LL;
  }

  return v3;
}

- (id)description
{
  int64_t v3 = -[OSLogDevice devType](self, "devType");
  if (v3 == 2)
  {
    v10 = (void *)NSString;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[OSLogDevice simDev](self, "simDev");
    v12 = -[OSLogDevice uid](self, "uid");
    [v10 stringWithFormat:@"%@(Simulated): %@, %@", v6, v8, v12];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = (void *)NSString;
    if (v3 == 1)
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v7 = -[OSLogDevice mobileDeviceRef](self, "mobileDeviceRef");
      v8 = -[OSLogDevice uid](self, "uid");
      [v4 stringWithFormat:@"%@(Mobile): %p, %@", v6, v7, v8];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[OSLogDevice mobileDeviceRef](self, "mobileDeviceRef");
      v8 = -[OSLogDevice simDev](self, "simDev");
      v15 = -[OSLogDevice uid](self, "uid");
      [v4 stringWithFormat:@"%@(Unknown): %p, %@, %@", v6, v14, v8, v15];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (OSLogDevice)initWithMobileDevice:(void *)a3 andUDID:(id)a4
{
  v6 = (NSString *)a4;
  objc_super v7 = -[OSLogDevice init](self, "init");
  v7->_devType = 1LL;
  if (a3) {
    v8 = (void *)CFRetain(a3);
  }
  else {
    v8 = 0LL;
  }
  simDev = v7->_simDev;
  v7->_mobileDeviceRef = v8;
  v7->_simDev = 0LL;

  uid = v7->_uid;
  v7->_uid = v6;

  return v7;
}

- (OSLogDevice)initWithSimualatedDevice:(id)a3
{
  v4 = (SimDevice *)a3;
  v5 = -[OSLogDevice init](self, "init");
  v5->_devType = 2LL;
  v5->_mobileDeviceRef = 0LL;
  simDev = v5->_simDev;
  v5->_simDev = v4;
  objc_super v7 = v4;
  v8 = -[SimDevice UDID](v7, "UDID");
  uint64_t v9 = [v8 UUIDString];
  uid = v5->_uid;
  v5->_uid = (NSString *)v9;

  return v5;
}

- (void)dealloc
{
  mobileDeviceRef = self->_mobileDeviceRef;
  if (mobileDeviceRef) {
    CFRelease(mobileDeviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OSLogDevice;
  -[OSLogDevice dealloc](&v4, sel_dealloc);
}

- (int64_t)devType
{
  return self->_devType;
}

- (void)setDevType:(int64_t)a3
{
  self->_devType = a3;
}

- (void)mobileDeviceRef
{
  return self->_mobileDeviceRef;
}

- (void)setMobileDeviceRef:(void *)a3
{
  self->_mobileDeviceRef = a3;
}

- (SimDevice)simDev
{
  return self->_simDev;
}

- (void)setSimDev:(id)a3
{
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end