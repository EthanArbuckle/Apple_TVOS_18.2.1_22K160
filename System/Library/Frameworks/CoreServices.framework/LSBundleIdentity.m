@interface LSBundleIdentity
+ (BOOL)supportsSecureCoding;
+ (id)bundleIdentityForIdentityString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LSBundleIdentity)initWithCoder:(id)a3;
- (LSBundleIdentity)initWithIdentityString:(id)a3 personaUniqueString:(id)a4 personaType:(unint64_t)a5;
- (NSString)bundleIdentifier;
- (NSString)identityString;
- (NSString)personaUniqueString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)personaType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSBundleIdentity

- (LSBundleIdentity)initWithIdentityString:(id)a3 personaUniqueString:(id)a4 personaType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LSBundleIdentity;
  v10 = -[LSBundleIdentity init](&v16, sel_init);
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identityString = v10->_identityString;
    v10->_identityString = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    personaUniqueString = v10->_personaUniqueString;
    v10->_personaUniqueString = (NSString *)v13;

    v10->_personaType = a5;
  }

  return v10;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
}

- (NSString)identityString
{
  return self->_identityString;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSBundleIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identityString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"personaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v4 decodeIntegerForKey:@"personaType"];

  if (v5)
  {
    id v8 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:]( self,  "initWithIdentityString:personaUniqueString:personaType:",  v5,  v6,  v7);
  }

  else
  {

    id v8 = 0LL;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  identityString = self->_identityString;
  id v5 = a3;
  [v5 encodeObject:identityString forKey:@"identityString"];
  [v5 encodeObject:self->_personaUniqueString forKey:@"personaUniqueString"];
  [v5 encodeInteger:self->_personaType forKey:@"personaType"];
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identityString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    BOOL v7 = -[NSString isEqual:](self->_identityString, "isEqual:", v5[1])
      && ((personaUniqueString = self->_personaUniqueString, personaUniqueString == (NSString *)v5[2])
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, self->_identityString];
}

+ (id)bundleIdentityForIdentityString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1896078D8];
  [v3 dataUsingEncoding:4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 JSONObjectWithData:v5 options:0 error:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [v6 objectForKey:@"it"];
    id v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      id v9 = 0LL;
    }

    uint64_t v11 = [v9 unsignedIntegerValue];
    if (v11)
    {
      if (v11 != 1)
      {
        uint64_t v13 = 0LL;
        goto LABEL_15;
      }

      v12 = off_189D707E0;
    }

    else
    {
      v12 = off_189D706E8;
    }

    uint64_t v13 = (void *)[objc_alloc(*v12) initWithIdentityString:v3 parsedIdentityStringDictionary:v6 error:0];
LABEL_15:

    goto LABEL_16;
  }

  uint64_t v13 = 0LL;
LABEL_16:

  return v13;
}

- (unint64_t)personaType
{
  return self->_personaType;
}

- (NSString)bundleIdentifier
{
  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0LL;
}

@end