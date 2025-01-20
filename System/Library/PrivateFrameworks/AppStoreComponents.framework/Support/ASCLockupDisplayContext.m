@interface ASCLockupDisplayContext
+ (BOOL)supportsSecureCoding;
- (ASCLockupDisplayContext)initWithCoder:(id)a3;
- (ASCLockupDisplayContext)initWithHeadingKind:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)headingKind;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupDisplayContext

- (ASCLockupDisplayContext)initWithHeadingKind:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCLockupDisplayContext;
  v6 = -[ASCLockupDisplayContext init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_headingKind, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupDisplayContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v5 forKey:@"headingKind"]);

  v7 = -[ASCLockupDisplayContext initWithHeadingKind:](self, "initWithHeadingKind:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupDisplayContext headingKind](self, "headingKind"));
  [v4 encodeObject:v5 forKey:@"headingKind"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupDisplayContext headingKind](self, "headingKind"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupDisplayContext *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupDisplayContext);
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
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupDisplayContext headingKind](self, "headingKind"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupDisplayContext headingKind](v10, "headingKind"));
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

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupDisplayContext headingKind](self, "headingKind"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"headingKind");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v5;
}

- (NSString)headingKind
{
  return self->_headingKind;
}

- (void).cxx_destruct
{
}

@end