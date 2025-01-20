@interface ASCLockupFeatureDisplayContext
+ (BOOL)supportsSecureCoding;
- (ASCLockupDisplayContext)displayContext;
- (ASCLockupFeatureDisplayContext)initWithCoder:(id)a3;
- (ASCLockupFeatureDisplayContext)initWithDisplayContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureDisplayContext

- (ASCLockupFeatureDisplayContext)initWithDisplayContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureDisplayContext;
  v5 = -[ASCLockupFeatureDisplayContext init](&v9, "init");
  if (v5)
  {
    v6 = (ASCLockupDisplayContext *)[v4 copy];
    displayContext = v5->_displayContext;
    v5->_displayContext = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureDisplayContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ASCLockupDisplayContext) forKey:@"displayContext"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[ASCLockupFeatureDisplayContext initWithDisplayContext:](self, "initWithDisplayContext:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDisplayContext displayContext](self, "displayContext"));
  [v4 encodeObject:v5 forKey:@"displayContext"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDisplayContext displayContext](self, "displayContext"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureDisplayContext *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureDisplayContext);
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
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDisplayContext displayContext](self, "displayContext"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDisplayContext displayContext](v10, "displayContext"));
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureDisplayContext displayContext](self, "displayContext"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"displayContext");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v5;
}

- (ASCLockupDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void).cxx_destruct
{
}

@end