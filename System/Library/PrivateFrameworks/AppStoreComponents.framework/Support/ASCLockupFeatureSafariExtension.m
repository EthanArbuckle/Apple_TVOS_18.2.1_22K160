@interface ASCLockupFeatureSafariExtension
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureSafariExtension)initWithCoder:(id)a3;
- (ASCLockupFeatureSafariExtension)initWithContentProviderTeamID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)contentProviderTeamID;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureSafariExtension

- (ASCLockupFeatureSafariExtension)initWithContentProviderTeamID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureSafariExtension;
  v5 = -[ASCLockupFeatureSafariExtension init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    contentProviderTeamID = v5->_contentProviderTeamID;
    v5->_contentProviderTeamID = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureSafariExtension)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"contentProviderTeamID"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[ASCLockupFeatureSafariExtension initWithContentProviderTeamID:](self, "initWithContentProviderTeamID:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSafariExtension contentProviderTeamID](self, "contentProviderTeamID"));
  [v4 encodeObject:v5 forKey:@"contentProviderTeamID"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSafariExtension contentProviderTeamID](self, "contentProviderTeamID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureSafariExtension *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureSafariExtension);
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
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSafariExtension contentProviderTeamID](self, "contentProviderTeamID"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSafariExtension contentProviderTeamID](v10, "contentProviderTeamID"));
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSafariExtension contentProviderTeamID](self, "contentProviderTeamID"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"contentProviderTeamID");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v5;
}

- (NSString)contentProviderTeamID
{
  return self->_contentProviderTeamID;
}

- (void).cxx_destruct
{
}

@end