@interface TPPolicyVersion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)policyHash;
- (TPPolicyVersion)initWithCoder:(id)a3;
- (TPPolicyVersion)initWithVersion:(unint64_t)a3 hash:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)versionNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPPolicyVersion

- (TPPolicyVersion)initWithVersion:(unint64_t)a3 hash:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TPPolicyVersion;
  v7 = -[TPPolicyVersion init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_versionNumber = a3;
    v9 = +[TPStringTable defaultTable](&OBJC_CLASS___TPStringTable, "defaultTable");
    uint64_t v10 = [v9 stringWithString:v6];
    policyHash = v8->_policyHash;
    v8->_policyHash = (NSString *)v10;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = (void *)NSString;
  unint64_t v4 = -[TPPolicyVersion versionNumber](self, "versionNumber");
  v5 = -[TPPolicyVersion policyHash](self, "policyHash");
  [v3 stringWithFormat:@"<TPPolicyVersion: %llu, %@>", v4, v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    uint64_t v6 = [v5 versionNumber];
    if (v6 == -[TPPolicyVersion versionNumber](self, "versionNumber"))
    {
      [v5 policyHash];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TPPolicyVersion policyHash](self, "policyHash");
      char v9 = [v7 isEqualToString:v8];
    }

    else
    {
      char v9 = 0;
    }
  }

  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___TPPolicyVersion);
  unint64_t v5 = -[TPPolicyVersion versionNumber](self, "versionNumber");
  -[TPPolicyVersion policyHash](self, "policyHash");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 copy];
  v8 = -[TPPolicyVersion initWithVersion:hash:](v4, "initWithVersion:hash:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  -[TPPolicyVersion policyHash](self, "policyHash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"policyHash"];

  objc_msgSend( v5,  "encodeInt64:forKey:",  -[TPPolicyVersion versionNumber](self, "versionNumber"),  @"policyVersion");
}

- (TPPolicyVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TPPolicyVersion;
  id v5 = -[TPPolicyVersion init](&v9, sel_init);
  if (v5)
  {
    v5->_versionNumber = [v4 decodeInt64ForKey:@"policyVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"policyHash"];
    policyHash = v5->_policyHash;
    v5->_policyHash = (NSString *)v6;
  }

  return v5;
}

- (unint64_t)versionNumber
{
  return self->_versionNumber;
}

- (NSString)policyHash
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end