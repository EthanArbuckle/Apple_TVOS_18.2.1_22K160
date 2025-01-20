@interface HMDRPIdentity
+ (BOOL)supportsSecureCoding;
+ (id)identityWithRPIdentity:(id)a3;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRPIndentity:(id)a3;
- (HMDRPIdentity)init;
- (HMDRPIdentity)initWithCoder:(id)a3;
- (HMDRPIdentity)initWithDeviceIRK:(id)a3;
- (HMFKey)deviceIRK;
- (id)logIdentifier;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDRPIdentity

- (HMDRPIdentity)init
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return -[HMDRPIdentity initWithDeviceIRK:](v6, v7, v8);
}

- (HMDRPIdentity)initWithDeviceIRK:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___HMDRPIdentity;
    id v5 = -[HMDRPIdentity init](&v10, "init");
    if (v5)
    {
      v6 = (HMFKey *)[v4 copy];
      deviceIRK = v5->_deviceIRK;
      v5->_deviceIRK = v6;
    }

    self = v5;
    id v8 = self;
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)shortDescription
{
  return objc_msgSend((id)objc_opt_class(self, a2), "shortDescription");
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDRPIdentity deviceIRK](self, "deviceIRK"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HMDRPIdentity *)a3;
  if (v5 == self)
  {
    char v12 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMDRPIdentity, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      SEL v7 = v5;
    }
    else {
      SEL v7 = 0LL;
    }
    id v8 = v7;
    v9 = v8;
    if (v8)
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMDRPIdentity deviceIRK](v8, "deviceIRK"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HMDRPIdentity deviceIRK](self, "deviceIRK"));
      char v12 = HMFEqualObjects(v10, v11);
    }

    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (BOOL)isEqualToRPIndentity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDRPIdentity deviceIRK](self, "deviceIRK"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIRKData]);

  LOBYTE(v4) = [v5 isEqualToData:v6];
  return (char)v4;
}

- (id)logIdentifier
{
  return objc_msgSend((id)objc_opt_class(self, a2), "shortDescription");
}

- (HMDRPIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(HMFKey, v5),  HMDeviceRPDeviceIRKCodingKey);
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = -[HMDRPIdentity initWithDeviceIRK:](self, "initWithDeviceIRK:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[HMDRPIdentity deviceIRK](self, "deviceIRK"));
  [v4 encodeObject:v5 forKey:HMDeviceRPDeviceIRKCodingKey];
}

- (HMFKey)deviceIRK
{
  return (HMFKey *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)identityWithRPIdentity:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc(&OBJC_CLASS___HMFKey);
    uint64_t v6 = HMFKeyTypeIRK;
    uint64_t v7 = HMFKeySizeIRK128;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIRKData]);

    v9 = -[HMFKey initWithType:size:data:](v5, "initWithType:size:data:", v6, v7, v8);
    id v11 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v10)), "initWithDeviceIRK:", v9);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)logCategory
{
  if (qword_100032C90 != -1) {
    dispatch_once(&qword_100032C90, &stru_100028938);
  }
  return (id)qword_100032C98;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end