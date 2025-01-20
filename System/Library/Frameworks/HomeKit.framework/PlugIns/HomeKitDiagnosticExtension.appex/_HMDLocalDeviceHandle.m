@interface _HMDLocalDeviceHandle
+ (BOOL)isValidDestination:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (NSUUID)deviceIdentifier;
- (_HMDLocalDeviceHandle)initWithCoder:(id)a3;
- (_HMDLocalDeviceHandle)initWithDestination:(id)a3;
- (_HMDLocalDeviceHandle)initWithDeviceIdentifier:(id)a3;
- (id)description;
- (id)destination;
- (id)privateDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDLocalDeviceHandle

- (_HMDLocalDeviceHandle)initWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([@"device:" stringByAppendingString:v6]);

    v8 = -[_HMDLocalDeviceHandle initWithDestination:](self, "initWithDestination:", v7);
    v9 = v8;
  }

  else
  {
    v10 = objc_autoreleasePoolPush();
    v8 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      int v16 = 138543362;
      v17 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@Missing device identifier parameter",  (uint8_t *)&v16,  0xCu);
    }

    objc_autoreleasePoolPop(v10);
    v9 = 0LL;
  }

  return v9;
}

- (_HMDLocalDeviceHandle)initWithDestination:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v30 = 0LL;
    v6 = sub_100005B50(v4, &v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = v30;
    if (v7)
    {
      v9 = objc_alloc(&OBJC_CLASS___NSUUID);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[_HMDDeviceHandle identifierNamespace](&OBJC_CLASS____HMDDeviceHandle, "identifierNamespace"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:4]);
      v12 = -[NSUUID initWithNamespace:data:](v9, "initWithNamespace:data:", v10, v11);

      v29.receiver = self;
      v29.super_class = (Class)&OBJC_CLASS____HMDLocalDeviceHandle;
      uint64_t v13 = -[_HMDDeviceHandle initWithIdentifier:](&v29, "initWithIdentifier:", v12);
      if (v13)
      {
        v14 = (NSUUID *)[v7 copy];
        deviceIdentifier = v13->_deviceIdentifier;
        v13->_deviceIdentifier = v14;
      }

      int v16 = v13;

      v17 = v16;
    }

    else
    {
      v23 = objc_autoreleasePoolPush();
      int v16 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = HMFGetLogIdentifier(v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 138543874;
        v32 = v27;
        __int16 v33 = 2112;
        v34 = v5;
        __int16 v35 = 2112;
        id v36 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@Failed to parse destination, %@, with error: %@",  buf,  0x20u);
      }

      objc_autoreleasePoolPop(v23);
      v17 = 0LL;
    }
  }

  else
  {
    v18 = objc_autoreleasePoolPush();
    int v16 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier(v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543362;
      v32 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%{public}@Missing destination parameter",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v18);
    v17 = 0LL;
  }

  return v17;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (_HMDLocalDeviceHandle *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS____HMDLocalDeviceHandle, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      v7 = v5;
    }
    else {
      v7 = 0LL;
    }
    id v8 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDLocalDeviceHandle deviceIdentifier](v8, "deviceIdentifier"));
      unsigned __int8 v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

- (id)privateDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[HMFPrivateObjectFormatter defaultFormatter]( &OBJC_CLASS___HMFPrivateObjectFormatter,  "defaultFormatter"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDLocalDeviceHandle description](self, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 privateStringForObjectValue:v4]);

  return v5;
}

- (BOOL)isLocal
{
  return 1;
}

- (id)destination
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([@"device:" stringByAppendingString:v3]);

  return v4;
}

- (_HMDLocalDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____HMDLocalDeviceHandle;
  uint64_t v6 = -[_HMDDeviceHandle initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), @"HM.deviceID");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSUUID *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____HMDLocalDeviceHandle;
  id v4 = a3;
  -[_HMDDeviceHandle encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"HM.deviceID"];
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
}

+ (BOOL)isValidDestination:(id)a3
{
  id v3 = sub_100005B50(a3, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = v4 != 0LL;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end