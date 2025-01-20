@interface _HMDGlobalDeviceHandle
+ (BOOL)isValidDestination:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGlobal;
- (HMDAccountHandle)accountHandle;
- (NSData)pushToken;
- (_HMDGlobalDeviceHandle)initWithCoder:(id)a3;
- (_HMDGlobalDeviceHandle)initWithDestination:(id)a3;
- (_HMDGlobalDeviceHandle)initWithPushToken:(id)a3 accountHandle:(id)a4;
- (id)description;
- (id)destination;
- (id)privateDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDGlobalDeviceHandle

- (_HMDGlobalDeviceHandle)initWithPushToken:(id)a3 accountHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 URI]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 prefixedURI]);
    v11 = (void *)IDSCopyIDForTokenWithID(v6, v10);

    v12 = -[_HMDGlobalDeviceHandle initWithDestination:](self, "initWithDestination:", v11);
    v13 = v12;
  }

  else
  {
    v14 = objc_autoreleasePoolPush();
    v12 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier(v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v20 = 138543362;
      v21 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@Missing push token parameter",  (uint8_t *)&v20,  0xCu);
    }

    objc_autoreleasePoolPop(v14);
    v13 = 0LL;
  }

  return v13;
}

- (_HMDGlobalDeviceHandle)initWithDestination:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v32 = 0LL;
    id v33 = 0LL;
    id v30 = 0LL;
    id v31 = 0LL;
    char v6 = sub_100005170(v4, &v33, &v32, &v31, &v30);
    id v7 = v33;
    id v8 = v32;
    id v9 = v31;
    id v10 = v30;
    if ((v6 & 1) != 0)
    {
      v29.receiver = self;
      v29.super_class = (Class)&OBJC_CLASS____HMDGlobalDeviceHandle;
      v11 = -[_HMDDeviceHandle initWithIdentifier:](&v29, "initWithIdentifier:", v7);
      if (v11)
      {
        v12 = (NSData *)[v8 copy];
        pushToken = v11->_pushToken;
        v11->_pushToken = v12;

        v14 = (HMDAccountHandle *)[v9 copy];
        accountHandle = v11->_accountHandle;
        v11->_accountHandle = v14;
      }

      v16 = v11;
      uint64_t v17 = v16;
    }

    else
    {
      v23 = objc_autoreleasePoolPush();
      v16 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = HMFGetLogIdentifier(v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 138543874;
        v35 = v27;
        __int16 v36 = 2112;
        v37 = v5;
        __int16 v38 = 2112;
        id v39 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@Failed to parse destination, %@, with error: %@",  buf,  0x20u);
      }

      objc_autoreleasePoolPop(v23);
      uint64_t v17 = 0LL;
    }
  }

  else
  {
    v18 = objc_autoreleasePoolPush();
    v16 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier(v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543362;
      v35 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%{public}@Missing destination parameter",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v18);
    uint64_t v17 = 0LL;
  }

  return v17;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle pushToken](self, "pushToken"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (_HMDGlobalDeviceHandle *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS____HMDGlobalDeviceHandle, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      id v7 = v5;
    }
    else {
      id v7 = 0LL;
    }
    id v8 = v7;
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle pushToken](self, "pushToken"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle pushToken](v8, "pushToken"));
      unsigned __int8 v11 = [v9 isEqualToData:v10];
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle pushToken](self, "pushToken"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hmf_hexadecimalStringWithOptions:", 0));

  return v3;
}

- (id)privateDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[HMFPrivateObjectFormatter defaultFormatter]( &OBJC_CLASS___HMFPrivateObjectFormatter,  "defaultFormatter"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle description](self, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 privateStringForObjectValue:v4]);

  return v5;
}

- (BOOL)isGlobal
{
  return 1;
}

- (id)destination
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle pushToken](self, "pushToken"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle accountHandle](self, "accountHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URI]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 prefixedURI]);
  id v7 = (void *)IDSCopyIDForTokenWithID(v3, v6);

  return v7;
}

- (_HMDGlobalDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"HM.token");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS____HMDGlobalDeviceHandle;
    id v8 = -[_HMDDeviceHandle initWithCoder:](&v22, "initWithCoder:", v4);
    id v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_pushToken, v7);
      id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(HMDAccountHandle, v10),  @"HM.account");
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      accountHandle = v9->_accountHandle;
      v9->_accountHandle = (HMDAccountHandle *)v12;
    }

    v14 = v9;
    uint64_t v15 = v14;
  }

  else
  {
    v16 = objc_autoreleasePoolPush();
    v14 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier(v14);
      int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = @"HM.token";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@Missing required object for key '%@'",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v16);
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____HMDGlobalDeviceHandle;
  id v4 = a3;
  -[_HMDDeviceHandle encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle pushToken](self, "pushToken", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"HM.token"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDGlobalDeviceHandle accountHandle](self, "accountHandle"));
  [v4 encodeObject:v6 forKey:@"HM.account"];
}

- (HMDAccountHandle)accountHandle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void).cxx_destruct
{
}

+ (BOOL)isValidDestination:(id)a3
{
  return sub_100005170(a3, 0LL, 0LL, 0LL, 0LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end