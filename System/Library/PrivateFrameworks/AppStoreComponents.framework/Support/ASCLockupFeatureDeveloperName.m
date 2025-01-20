@interface ASCLockupFeatureDeveloperName
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureDeveloperName)initWithCoder:(id)a3;
- (ASCLockupFeatureDeveloperName)initWithDeveloperName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)developerName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureDeveloperName

- (ASCLockupFeatureDeveloperName)initWithDeveloperName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureDeveloperName;
  v5 = -[ASCLockupFeatureDeveloperName init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    developerName = v5->_developerName;
    v5->_developerName = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureDeveloperName)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"developerName"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[ASCLockupFeatureDeveloperName initWithDeveloperName:](self, "initWithDeveloperName:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDeveloperName developerName](self, "developerName"));
  [v4 encodeObject:v5 forKey:@"developerName"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDeveloperName developerName](self, "developerName"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureDeveloperName *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureDeveloperName);
    v6 = v4;
    v7 = v6;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        v8 = v7;
      }
      else {
        v8 = 0LL;
      }
    }

    else
    {
      v8 = 0LL;
    }

    v10 = v8;

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDeveloperName developerName](self, "developerName"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDeveloperName developerName](v10, "developerName"));
      v13 = (void *)v12;
      if (v11 && v12) {
        unsigned __int8 v9 = [v11 isEqual:v12];
      }
      else {
        unsigned __int8 v9 = v11 == (void *)v12;
      }
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDeveloperName developerName](self, "developerName"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"developerName");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v5;
}

- (NSString)developerName
{
  return self->_developerName;
}

- (void).cxx_destruct
{
}

@end