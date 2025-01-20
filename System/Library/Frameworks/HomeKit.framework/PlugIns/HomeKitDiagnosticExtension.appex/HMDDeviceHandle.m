@interface HMDDeviceHandle
+ (BOOL)supportsSecureCoding;
+ (id)deviceHandleForDestination:(id)a3;
+ (id)deviceHandleForDeviceIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGlobal;
- (BOOL)isLocal;
- (BOOL)matchesPushToken:(id)a3;
- (HMDAccountHandle)accountHandle;
- (HMDDeviceHandle)init;
- (HMDDeviceHandle)initWithCoder:(id)a3;
- (HMDDeviceHandle)initWithInternal:(id)a3;
- (NSData)pushToken;
- (NSString)destination;
- (NSUUID)identifier;
- (_HMDDeviceHandle)internal;
- (id)attributeDescriptions;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDDeviceHandle

- (HMDDeviceHandle)init
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return -[HMDDeviceHandle initWithInternal:](v6, v7, v8);
}

- (HMDDeviceHandle)initWithInternal:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___HMDDeviceHandle;
    id v5 = -[HMDDeviceHandle init](&v16, "init");
    if (v5)
    {
      v6 = (_HMDDeviceHandle *)[v4 copy];
      internal = v5->_internal;
      v5->_internal = v6;
    }

    id v8 = v5;
    v9 = v8;
  }

  else
  {
    v10 = objc_autoreleasePoolPush();
    id v8 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@Missing internal parameter",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v10);
    v9 = 0LL;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HMDDeviceHandle *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMDDeviceHandle, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      SEL v7 = v5;
    }
    else {
      SEL v7 = 0LL;
    }
    id v8 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](v8, "internal"));
      unsigned __int8 v11 = [v9 isEqual:v10];
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (id)shortDescription
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "shortDescription");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle identifier](self, "identifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v6));

  return v7;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle identifier](self, "identifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = [v3 initWithName:@"Identifier" value:v5];
  v18[0] = v6;
  id v7 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  if (-[HMDDeviceHandle isGlobal](self, "isGlobal")) {
    id v8 = @"Global";
  }
  else {
    id v8 = @"Local";
  }
  id v9 = [v7 initWithName:@"Type" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  id v12 = [v10 initWithName:@"Value" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle accountHandle](self, "accountHandle"));
  id v15 = [v13 initWithName:@"Account Handle" value:v14 options:1 formatter:0];
  v18[3] = v15;
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 4LL));

  return v16;
}

- (NSUUID)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSUUID *)v3;
}

- (BOOL)isLocal
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  unsigned __int8 v3 = [v2 isLocal];

  return v3;
}

- (BOOL)isGlobal
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  unsigned __int8 v3 = [v2 isGlobal];

  return v3;
}

- (HMDAccountHandle)accountHandle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountHandle]);

  return (HMDAccountHandle *)v3;
}

- (NSString)destination
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 destination]);

  return (NSString *)v3;
}

- (NSData)pushToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS____HMDGlobalDeviceHandle, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  if (v6) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pushToken]);
  }
  else {
    id v7 = 0LL;
  }

  return (NSData *)v7;
}

- (BOOL)matchesPushToken:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS____HMDGlobalDeviceHandle, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    id v8 = v5;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pushToken]);
    unsigned __int8 v11 = [v10 isEqualToData:v4];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (HMDDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(_HMDDeviceHandle, v5),  @"HM.internal");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = -[HMDDeviceHandle initWithInternal:](self, "initWithInternal:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[HMDDeviceHandle internal](self, "internal"));
  [v4 encodeObject:v5 forKey:@"HM.internal"];
}

- (_HMDDeviceHandle)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
}

+ (id)deviceHandleForDestination:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    unsigned __int8 v11 = objc_autoreleasePoolPush();
    id v12 = a1;
    uint64_t v13 = HMFGetOSLogHandle();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier(v12);
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v24 = 138543362;
      v25 = v16;
      v17 = "%{public}@Invalid destination, nil";
      v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, (uint8_t *)&v24, v20);
    }

+ (id)deviceHandleForDeviceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[_HMDLocalDeviceHandle initWithDeviceIdentifier:]( objc_alloc(&OBJC_CLASS____HMDLocalDeviceHandle),  "initWithDeviceIdentifier:",  v3);

  if (v4) {
    id v5 = -[HMDDeviceHandle initWithInternal:](objc_alloc(&OBJC_CLASS___HMDDeviceHandle), "initWithInternal:", v4);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end