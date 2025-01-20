@interface _SFAccessPolicy
+ (BOOL)supportsSecureCoding;
+ (id)accessPolicyWithSecAccessibility:(__CFString *)a3 error:(id *)a4;
- ($66F7831EF5FBFA6E53CDD4AD58562303)accessibility;
- (BOOL)isEqual:(id)a3;
- (NSArray)accessControlList;
- (NSString)accessGroup;
- (_SFAccessPolicy)init;
- (_SFAccessPolicy)initWithAccessibility:(id *)a3 sharingPolicy:(int64_t)a4;
- (_SFAccessPolicy)initWithCoder:(id)a3;
- (__CFDictionary)secAccessibilityAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sharingPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessControlList:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setAccessibility:(id *)a3;
- (void)setSharingPolicy:(int64_t)a3;
@end

@implementation _SFAccessPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)accessPolicyWithSecAccessibility:(__CFString *)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x18960B860]))
  {
    uint64_t v7 = 2LL;
LABEL_3:
    uint64_t v8 = 1LL;
LABEL_6:
    __int128 v15 = 0uLL;
    uint64_t v13 = v8;
    __int128 v14 = 0uLL;
    return (id)[objc_alloc((Class)a1) initWithAccessibility:&v13 sharingPolicy:v7];
  }

  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x18960B830]))
  {
    uint64_t v8 = 0LL;
    uint64_t v7 = 2LL;
    goto LABEL_6;
  }

  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x18960B868]))
  {
    uint64_t v7 = 0LL;
    goto LABEL_3;
  }

  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x18960B838]))
  {
    uint64_t v8 = 0LL;
    uint64_t v7 = 0LL;
    goto LABEL_6;
  }

  if (a4)
  {
    v10 = (void *)MEMORY[0x189607870];
    uint64_t v16 = *MEMORY[0x1896075E0];
    [NSString stringWithFormat:@"invalid secAccessibility for SFAccessPolicy: %@", a3];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorWithDomain:@"SFKeychainErrorDomain" code:10 userInfo:v12];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (_SFAccessPolicy)init
{
  v3[0] = 1LL;
  return -[_SFAccessPolicy initWithAccessibility:sharingPolicy:](self, "initWithAccessibility:sharingPolicy:", v3, 2LL);
}

- (_SFAccessPolicy)initWithAccessibility:(id *)a3 sharingPolicy:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____SFAccessPolicy;
  result = -[_SFAccessPolicy init](&v8, sel_init);
  if (result)
  {
    int64_t var1 = a3->var1.var1;
    *(_OWORD *)&result->_accessibility.mode = *(_OWORD *)&a3->var0;
    result->_accessibility.authenticationPolicy.subsetCount = var1;
    result->_sharingPolicy = a4;
  }

  return result;
}

- (_SFAccessPolicy)initWithCoder:(id)a3
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____SFAccessPolicy;
  v5 = -[_SFAccessPolicy init](&v15, sel_init);
  if (v5)
  {
    else {
      uint64_t v6 = -1LL;
    }
    if (![v4 containsValueForKey:@"SFAccessPolicySharingMode"]
      || (uint64_t v7 = [v4 decodeIntegerForKey:@"SFAccessPolicySharingMode"], v6 < 0)
      || v7 < 0)
    {
      v11 = (void *)MEMORY[0x189607870];
      uint64_t v16 = *MEMORY[0x1896075E0];
      v17[0] = @"failed to deserialize SFAccessPolicy instance";
      [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 errorWithDomain:@"SFKeychainErrorDomain" code:4 userInfo:v12];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 failWithError:v13];

      v10 = 0LL;
      goto LABEL_11;
    }

    v5->_accessibility.mode = v6;
    v5->_accessibility.authenticationPolicy.authenticationRequirements = 0LL;
    v5->_accessibility.authenticationPolicy.subsetCount = 0LL;
    v5->_sharingPolicy = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFAccessPolicyAccessGroup"];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v8;
  }

  v10 = v5;
LABEL_11:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_accessibility.mode forKey:@"SFAccessPolicyAccessibilityMode"];
  [v5 encodeInteger:self->_sharingPolicy forKey:@"SFAccessPolicySharingMode"];
  accessGroup = self->_accessGroup;
  if (accessGroup) {
    [v5 encodeObject:accessGroup forKey:@"SFAccessPolicyAccessGroup"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  __int128 v8 = *(_OWORD *)&self->_accessibility.mode;
  int64_t sharingPolicy = self->_sharingPolicy;
  int64_t subsetCount = self->_accessibility.authenticationPolicy.subsetCount;
  uint64_t v6 = (void *)[v4 initWithAccessibility:&v8 sharingPolicy:sharingPolicy];
  [v6 setAccessGroup:self->_accessGroup];
  [v6 setAccessControlList:self->_accessControlList];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFAccessPolicy *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }

  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v6 = v5;
        int64_t mode = self->_accessibility.mode;
        -[_SFAccessPolicy accessibility](v6, "accessibility");
        if (mode == v14
          && (int64_t sharingPolicy = (void *)self->_sharingPolicy,
              sharingPolicy == (void *)-[_SFAccessPolicy sharingPolicy](v6, "sharingPolicy")))
        {
          accessGroup = self->_accessGroup;
          v10 = accessGroup;
          if (!accessGroup)
          {
            -[_SFAccessPolicy accessGroup](v6, "accessGroup");
            int64_t sharingPolicy = (void *)objc_claimAutoreleasedReturnValue();
            if (!sharingPolicy)
            {
              char v12 = 1;
LABEL_17:

              goto LABEL_14;
            }

            v10 = self->_accessGroup;
          }
          v11 = -[_SFAccessPolicy accessGroup](v6, "accessGroup");
          char v12 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

          if (!accessGroup) {
            goto LABEL_17;
          }
        }

        else
        {
          char v12 = 0;
        }

- (__CFDictionary)secAccessibilityAttributes
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  id v4 = Mutable;
  int64_t sharingPolicy = self->_sharingPolicy;
  if (sharingPolicy)
  {
    if (sharingPolicy != 1)
    {
      if (sharingPolicy != 2) {
        goto LABEL_16;
      }
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960BAA8], (const void *)*MEMORY[0x189604DE8]);
    }

    int64_t mode = self->_accessibility.mode;
    if (!mode)
    {
LABEL_12:
      uint64_t v7 = (const void **)MEMORY[0x18960B830];
      goto LABEL_15;
    }

    if (mode == 1)
    {
      uint64_t v7 = (const void **)MEMORY[0x18960B860];
LABEL_15:
      CFDictionaryAddValue(v4, (const void *)*MEMORY[0x18960B828], *v7);
      goto LABEL_16;
    }
  }

  else
  {
    int64_t mode = self->_accessibility.mode;
    if (!mode)
    {
      uint64_t v7 = (const void **)MEMORY[0x18960B838];
      goto LABEL_15;
    }

    if (mode == 1)
    {
      uint64_t v7 = (const void **)MEMORY[0x18960B868];
      goto LABEL_15;
    }
  }

  if (mode == 2)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"SFAccessPolicy does not support SFAccessibleWithAuthentication at present - please file a radar if you need it" userInfo:0];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
    goto LABEL_12;
  }

- ($66F7831EF5FBFA6E53CDD4AD58562303)accessibility
{
  *($5E8E154872C39B54FC12355910C3F131 *)retstr = *($5E8E154872C39B54FC12355910C3F131 *)&self->var1.var0;
  return self;
}

- (void)setAccessibility:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_accessibility.authenticationPolicy.int64_t subsetCount = a3->var1.var1;
  *(_OWORD *)&self->_accessibility.int64_t mode = v3;
}

- (int64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (void)setSharingPolicy:(int64_t)a3
{
  self->_int64_t sharingPolicy = a3;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
}

- (NSArray)accessControlList
{
  return self->_accessControlList;
}

- (void)setAccessControlList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end