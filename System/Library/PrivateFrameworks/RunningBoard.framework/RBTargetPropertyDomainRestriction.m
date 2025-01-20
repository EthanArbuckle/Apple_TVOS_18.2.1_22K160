@interface RBTargetPropertyDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithProperty:(id)a3 value:(id)a4;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBTargetPropertyDomainRestriction

- (id)_initWithProperty:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___RBTargetPropertyDomainRestriction;
  v8 = -[RBDomainRestriction _init](&v19, sel__init);
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [v6 copy];
  v10 = (void *)v8[1];
  v8[1] = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v14 = [v7 copy];
      v12 = (void *)v8[3];
      v8[3] = v14;
      v13 = &OBJC_IVAR___RBTargetPropertyDomainRestriction__numberValue;
      goto LABEL_6;
    }

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v30[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 objectForKey:@"Property"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"Value"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v7)
    {
      if ([v6 isEqualToString:@"SupportsBackgroundContentFetching"]
        || [v6 isEqualToString:@"UsesSocketMonitoring"]
        || [v6 isEqualToString:@"SupportsBackgroundNetworkAuthentication"]
        || [v6 isEqualToString:@"SupportsUnboundedTaskCompletion"]
        || [v6 isEqualToString:@"SupportsBackgroundAudio"]
        || [v6 isEqualToString:@"IsExtension"]
        || [v6 isEqualToString:@"Platform"]
        || [v6 isEqualToString:@"NotPlatform"])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = (void *)NSString;
LABEL_14:
          [v8 stringWithFormat:@"Malformed domain plist - value for %@ is not of class %@", v6, objc_opt_class()];
          goto LABEL_15;
        }
      }

      else
      {
        if (![v6 isEqualToString:@"BundleID"])
        {
          [NSString stringWithFormat:@"Unrecognized target property: %@", v6, v24];
          uint64_t v9 = LABEL_15:;
          id v10 = (id)v9;
          if (v9)
          {
            if (a4)
            {
              uint64_t v11 = (void *)MEMORY[0x189607870];
              uint64_t v25 = *MEMORY[0x1896075F0];
              uint64_t v26 = v9;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              [v11 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v12];
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              id v14 = v13;
              *a4 = v14;
            }

            id v15 = 0LL;
            goto LABEL_28;
          }

          goto LABEL_27;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = (void *)NSString;
          goto LABEL_14;
        }
      }

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v23[2] = *MEMORY[0x1895F89C0];
  [a3 targetProperties];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", @"SupportsBackgroundContentFetching"))
  {
    int v7 = [v6 supportsBackgroundContentFetching];
LABEL_13:
    int v8 = v7;
    int v9 = -[NSNumber BOOLValue](self->_numberValue, "BOOLValue");
    goto LABEL_14;
  }

  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", @"UsesSocketMonitoring"))
  {
    int v7 = [v6 usesSocketMonitoring];
    goto LABEL_13;
  }

  if (-[NSString isEqualToString:]( self->_property,  "isEqualToString:",  @"SupportsBackgroundNetworkAuthentication"))
  {
    int v7 = [v6 supportsBackgroundNetworkAuthentication];
    goto LABEL_13;
  }

  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", @"SupportsUnboundedTaskCompletion"))
  {
    int v7 = [v6 supportsUnboundedTaskCompletion];
    goto LABEL_13;
  }

  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", @"SupportsBackgroundAudio"))
  {
    int v7 = [v6 supportsBackgroundAudio];
    goto LABEL_13;
  }

  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", @"IsExtension"))
  {
    int v7 = [v6 isExtension];
    goto LABEL_13;
  }

  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", @"Platform"))
  {
    int v8 = [v6 platform];
    int v9 = -[NSNumber intValue](self->_numberValue, "intValue");
LABEL_14:
    if (v8 != v9) {
      goto LABEL_15;
    }
LABEL_31:
    LOBYTE(a4) = 1;
    goto LABEL_32;
  }

  if (-[NSString isEqualToString:](self->_property, "isEqualToString:", @"NotPlatform"))
  {
    int v16 = [v6 platform];
  }

  else if (-[NSString isEqualToString:](self->_property, "isEqualToString:", @"BundleID"))
  {
    [v6 bundleIdentifier];
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    stringValue = self->_stringValue;
    if (v17 == stringValue)
    {

      goto LABEL_31;
    }

    if (v17 && stringValue)
    {
      char v20 = -[NSString isEqual:](v17, "isEqual:");

      if ((v20 & 1) != 0) {
        goto LABEL_31;
      }
    }

    else
    {
    }
  }

- (id)allEntitlements
{
  return (id)[MEMORY[0x189604010] set];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBTargetPropertyDomainRestriction *)a3;
  if (self == v4) {
    goto LABEL_22;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  property = self->_property;
  int v8 = v4->_property;
  if (property != v8)
  {
    BOOL v9 = !property || v8 == 0LL;
  }

  numberValue = self->_numberValue;
  uint64_t v11 = v4->_numberValue;
  if (numberValue != v11)
  {
    BOOL v12 = !numberValue || v11 == 0LL;
  }

  stringValue = self->_stringValue;
  id v14 = v4->_stringValue;
  if (stringValue == v14)
  {
LABEL_22:
    char v6 = 1;
    goto LABEL_23;
  }

  if (stringValue) {
    BOOL v15 = v14 == 0LL;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    char v6 = -[NSString isEqual:](stringValue, "isEqual:");
    goto LABEL_23;
  }

- (unint64_t)hash
{
  return -[NSString hash](self->_property, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)v4;
  numberValue = self->_numberValue;
  if (!numberValue) {
    numberValue = (NSNumber *)self->_stringValue;
  }
  int v7 = (void *)[v3 initWithFormat:@"<%@| %@='%@'>", v4, self->_property, numberValue];

  return v7;
}

- (void).cxx_destruct
{
}

@end