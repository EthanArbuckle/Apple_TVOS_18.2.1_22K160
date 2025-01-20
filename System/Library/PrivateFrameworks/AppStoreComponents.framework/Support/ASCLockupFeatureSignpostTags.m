@interface ASCLockupFeatureSignpostTags
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureSignpostTags)initWithCoder:(id)a3;
- (ASCLockupFeatureSignpostTags)initWithSignpostTags:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)signpostTags;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureSignpostTags

- (ASCLockupFeatureSignpostTags)initWithSignpostTags:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureSignpostTags;
  v5 = -[ASCLockupFeatureSignpostTags init](&v9, "init");
  if (v5)
  {
    v6 = (NSSet *)[v4 copy];
    signpostTags = v5->_signpostTags;
    v5->_signpostTags = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureSignpostTags)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet);
  v7 = -[NSSet initWithObjects:](v5, "initWithObjects:", v6, objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"signpostTags"]);

  if (v8)
  {
    self = -[ASCLockupFeatureSignpostTags initWithSignpostTags:](self, "initWithSignpostTags:", v8);
    objc_super v9 = self;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000E1174();
    }
    objc_super v9 = 0LL;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSignpostTags signpostTags](self, "signpostTags"));
  [v4 encodeObject:v5 forKey:@"signpostTags"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSignpostTags signpostTags](self, "signpostTags"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureSignpostTags);
  id v6 = v4;
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

  id v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSignpostTags signpostTags](self, "signpostTags"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 signpostTags]);
    v12 = (void *)v11;
    if (v10 && v11) {
      unsigned __int8 v13 = [v10 isEqual:v11];
    }
    else {
      unsigned __int8 v13 = v10 == (void *)v11;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureSignpostTags signpostTags](self, "signpostTags"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"signpostTags");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v5;
}

- (NSSet)signpostTags
{
  return self->_signpostTags;
}

- (void).cxx_destruct
{
}

@end