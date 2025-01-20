@interface ASCLockupFeatureBuyParams
+ (BOOL)supportsSecureCoding;
- (ASCAppOffer)appOffer;
- (ASCLockupFeatureBuyParams)initWithAppOffer:(id)a3;
- (ASCLockupFeatureBuyParams)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureBuyParams

- (ASCLockupFeatureBuyParams)initWithAppOffer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureBuyParams;
  v5 = -[ASCLockupFeatureBuyParams init](&v9, "init");
  if (v5)
  {
    v6 = (ASCAppOffer *)[v4 copy];
    appOffer = v5->_appOffer;
    v5->_appOffer = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureBuyParams)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ASCAppOffer) forKey:@"appOffer"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[ASCLockupFeatureBuyParams initWithAppOffer:](self, "initWithAppOffer:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureBuyParams appOffer](self, "appOffer"));
  [v4 encodeObject:v5 forKey:@"appOffer"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureBuyParams appOffer](self, "appOffer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureBuyParams *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureBuyParams);
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
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureBuyParams appOffer](self, "appOffer"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureBuyParams appOffer](v10, "appOffer"));
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureBuyParams appOffer](self, "appOffer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"appOffer");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v5;
}

- (ASCAppOffer)appOffer
{
  return self->_appOffer;
}

- (void).cxx_destruct
{
}

@end