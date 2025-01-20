@interface HMDAccountHandle
+ (BOOL)supportsSecureCoding;
+ (id)accountHandleForDestination:(id)a3;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)isLocallyTracked;
- (CKUserIdentityLookupInfo)cloudKitLookupInfo;
- (CNContact)contact;
- (HMDAccountHandle)init;
- (HMDAccountHandle)initWithCoder:(id)a3;
- (HMDAccountHandle)initWithURI:(id)a3;
- (HMDAccountHandle)initWithURI:(id)a3 local:(BOOL)a4;
- (IDSURI)URI;
- (NSString)value;
- (NSUUID)identifier;
- (NSUUID)modelParentIdentifier;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)remoteDestinationString;
- (id)shortDescription;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocallyTracked:(BOOL)a3;
- (void)setModelParentIdentifier:(id)a3;
@end

@implementation HMDAccountHandle

- (HMDAccountHandle)init
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return -[HMDAccountHandle initWithURI:](v6, v7, v8);
}

- (HMDAccountHandle)initWithURI:(id)a3
{
  return -[HMDAccountHandle initWithURI:local:](self, "initWithURI:local:", a3, 0LL);
}

- (HMDAccountHandle)initWithURI:(id)a3 local:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___HMDAccountHandle;
    SEL v7 = -[HMDAccountHandle init](&v20, "init");
    if (v7)
    {
      uint64_t v8 = qword_100032D10;
      id v9 = v6;
      if (v8 != -1) {
        dispatch_once(&qword_100032D10, &stru_1000289B8);
      }
      v10 = objc_alloc(&OBJC_CLASS___NSUUID);
      uint64_t v11 = qword_100032D08;
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 prefixedURI]);

      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataUsingEncoding:4]);
      v14 = -[NSUUID initWithNamespace:data:](v10, "initWithNamespace:data:", v11, v13);

      identifier = v7->_identifier;
      v7->_identifier = v14;

      v16 = (IDSURI *)[v9 copy];
      URI = v7->_URI;
      v7->_URI = v16;

      v7->_local = a4;
    }

    self = v7;
    v18 = self;
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

- (NSString)value
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle URI](self, "URI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 unprefixedURI]);

  return (NSString *)v3;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle URI](self, "URI"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HMDAccountHandle *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMDAccountHandle, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      SEL v7 = v5;
    }
    else {
      SEL v7 = 0LL;
    }
    uint64_t v8 = v7;
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle URI](self, "URI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle URI](v8, "URI"));
      unsigned __int8 v11 = [v9 isEqualToURI:v10];
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
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle identifier](self, "identifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v6));

  return v7;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle identifier](self, "identifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = [v3 initWithName:@"ID" value:v5];
  v22[0] = v6;
  id v7 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  int64_t v8 = -[HMDAccountHandle type](self, "type");
  id v9 = @"Unknown";
  if (v8 == 2) {
    id v9 = @"Phone";
  }
  if (v8 == 1) {
    v10 = @"Email";
  }
  else {
    v10 = v9;
  }
  id v11 = [v7 initWithName:@"TP" value:v10];
  v22[1] = v11;
  id v12 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  uint64_t v13 = HMFBooleanToString(-[HMDAccountHandle isLocal](self, "isLocal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v12 initWithName:@"LC" value:v14];
  v22[2] = v15;
  id v16 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle value](self, "value"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[HMDAccountHandleFormatter defaultFormatter]( &OBJC_CLASS___HMDAccountHandleFormatter,  "defaultFormatter"));
  id v19 = [v16 initWithName:@"VA" value:v17 options:0 formatter:v18];
  v22[3] = v19;
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL));

  return v20;
}

- (int64_t)type
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle URI](self, "URI"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 unprefixedURI]);
  unsigned __int8 v5 = [v4 _appearsToBeEmail];

  if ((v5 & 1) != 0) {
    return 1LL;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle URI](self, "URI"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 unprefixedURI]);
  unsigned int v9 = [v8 _appearsToBePhoneNumber];

  if (v9) {
    return 2LL;
  }
  else {
    return 0LL;
  }
}

- (CNContact)contact
{
  v2 = NSStringFromSelector(a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return (CNContact *)-[HMDAccountHandle cloudKitLookupInfo](v6, v7);
}

- (CKUserIdentityLookupInfo)cloudKitLookupInfo
{
  v2 = NSStringFromSelector(a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return (CKUserIdentityLookupInfo *)-[HMDAccountHandle initWithCoder:](v6, v7, v8);
}

- (HMDAccountHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(IDSURI, v5), @"HMD.URI");
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = -[HMDAccountHandle initWithURI:local:]( self,  "initWithURI:local:",  v7,  [v4 decodeBoolForKey:@"HMD.local"]);
  if (v8)
  {
    v8->_locallyTracked = [v4 decodeBoolForKey:@"HMD.locallyTracked"];
    if ([v4 containsValueForKey:@"HMD.modelParentIdentifier"])
    {
      id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSUUID, v9),  @"HMD.modelParentIdentifier");
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      modelParentIdentifier = v8->_modelParentIdentifier;
      v8->_modelParentIdentifier = (NSUUID *)v11;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle URI](self, "URI"));
  [v5 encodeObject:v4 forKey:@"HMD.URI"];

  objc_msgSend(v5, "encodeBool:forKey:", -[HMDAccountHandle isLocal](self, "isLocal"), @"HMD.local");
  if (objc_msgSend(v5, "hmd_isForLocalStore")) {
    objc_msgSend( v5,  "encodeBool:forKey:",  -[HMDAccountHandle isLocallyTracked](self, "isLocallyTracked"),  @"HMD.locallyTracked");
  }
}

- (id)remoteDestinationString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle URI](self, "URI"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 prefixedURI]);

  return v3;
}

- (id)logIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandle identifier](self, "identifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)isLocal
{
  return self->_local;
}

- (IDSURI)URI
{
  return (IDSURI *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSUUID)modelParentIdentifier
{
  return self->_modelParentIdentifier;
}

- (void)setModelParentIdentifier:(id)a3
{
}

- (BOOL)isLocallyTracked
{
  return self->_locallyTracked;
}

- (void)setLocallyTracked:(BOOL)a3
{
  self->_locallyTracked = a3;
}

- (void).cxx_destruct
{
}

+ (id)accountHandleForDestination:(id)a3
{
  id v3 = (void *)IDSCopyAddressDestinationForDestination(a3);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[HMDAccountHandleFormatter defaultFormatter]( &OBJC_CLASS___HMDAccountHandleFormatter,  "defaultFormatter"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountHandleFromString:v3]);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (qword_100032CF8 != -1) {
    dispatch_once(&qword_100032CF8, &stru_100028998);
  }
  return (id)qword_100032D00;
}

@end