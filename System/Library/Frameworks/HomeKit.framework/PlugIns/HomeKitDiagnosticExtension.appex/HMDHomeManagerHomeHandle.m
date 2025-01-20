@interface HMDHomeManagerHomeHandle
+ (BOOL)supportsSecureCoding;
- (HMDHomeManagerHomeHandle)initWithBackingStoreUUID:(id)a3 homeUUID:(id)a4;
- (HMDHomeManagerHomeHandle)initWithCoder:(id)a3;
- (NSUUID)backingStoreUUID;
- (NSUUID)homeUUID;
- (id)attributeDescriptions;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDHomeManagerHomeHandle

- (HMDHomeManagerHomeHandle)initWithBackingStoreUUID:(id)a3 homeUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___HMDHomeManagerHomeHandle;
  v9 = -[HMDHomeManagerHomeHandle init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStoreUUID, a3);
    objc_storeStrong((id *)&v10->_homeUUID, a4);
  }

  return v10;
}

- (HMDHomeManagerHomeHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), @"HMHH.b");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v8), @"HMHH.h");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[HMDHomeManagerHomeHandle initWithBackingStoreUUID:homeUUID:]( self,  "initWithBackingStoreUUID:homeUUID:",  v7,  v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDHomeManagerHomeHandle backingStoreUUID](self, "backingStoreUUID"));
  [v4 encodeObject:v5 forKey:@"HMHH.b"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[HMDHomeManagerHomeHandle homeUUID](self, "homeUUID"));
  [v4 encodeObject:v6 forKey:@"HMHH.h"];
}

- (id)shortDescription
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "shortDescription");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDHomeManagerHomeHandle homeUUID](self, "homeUUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMDHomeManagerHomeHandle backingStoreUUID](self, "backingStoreUUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@,%@",  v4,  v5,  v6));

  return v7;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMDHomeManagerHomeHandle homeUUID](self, "homeUUID"));
  id v5 = [v3 initWithName:@"homeUUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMDHomeManagerHomeHandle backingStoreUUID](self, "backingStoreUUID"));
  id v8 = [v6 initWithName:@"backingStoreUUID" value:v7];
  v11[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));

  return v9;
}

- (NSUUID)backingStoreUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end