@interface PDPassUpdateContext
+ (BOOL)supportsSecureCoding;
- (NSData)manifestHash;
- (NSDate)lastModifiedDate;
- (NSString)authenticationToken;
- (NSString)lastModifiedTag;
- (NSString)passUniqueIdentifier;
- (NSString)serialNumber;
- (PDPassUpdateContext)initWithCoder:(id)a3;
- (int64_t)lastModifiedSource;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setLastModifiedSource:(int64_t)a3;
- (void)setLastModifiedTag:(id)a3;
- (void)setManifestHash:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation PDPassUpdateContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassUpdateContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___PDPassUpdateContext;
  v6 = -[PDPassUpdateContext init](&v31, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"passUniqueIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    passUniqueIdentifier = v6->_passUniqueIdentifier;
    v6->_passUniqueIdentifier = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"serialNumber");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    serialNumber = v6->_serialNumber;
    v6->_serialNumber = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"authenticationToken");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    authenticationToken = v6->_authenticationToken;
    v6->_authenticationToken = (NSString *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v18),  @"manifestHash");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    manifestHash = v6->_manifestHash;
    v6->_manifestHash = (NSData *)v20;

    id v23 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v22),  @"lastModifiedTag");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    lastModifiedTag = v6->_lastModifiedTag;
    v6->_lastModifiedTag = (NSString *)v24;

    id v27 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v26),  @"lastModifiedDate");
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    lastModifiedDate = v6->_lastModifiedDate;
    v6->_lastModifiedDate = (NSDate *)v28;

    v6->_lastModifiedSource = (int64_t)[v4 decodeIntegerForKey:@"lastModifiedSource"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  passUniqueIdentifier = self->_passUniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_authenticationToken forKey:@"authenticationToken"];
  [v5 encodeObject:self->_manifestHash forKey:@"manifestHash"];
  [v5 encodeObject:self->_lastModifiedTag forKey:@"lastModifiedTag"];
  [v5 encodeObject:self->_lastModifiedDate forKey:@"lastModifiedDate"];
  [v5 encodeInteger:self->_lastModifiedSource forKey:@"lastModifiedSource"];
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)lastModifiedTag
{
  return self->_lastModifiedTag;
}

- (void)setLastModifiedTag:(id)a3
{
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (int64_t)lastModifiedSource
{
  return self->_lastModifiedSource;
}

- (void)setLastModifiedSource:(int64_t)a3
{
  self->_lastModifiedSource = a3;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end