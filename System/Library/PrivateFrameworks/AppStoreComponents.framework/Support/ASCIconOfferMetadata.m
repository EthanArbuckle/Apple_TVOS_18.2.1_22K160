@interface ASCIconOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCIconOfferMetadata)initWithBaseImageName:(id)a3 animationName:(id)a4;
- (ASCIconOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIcon;
- (NSString)animationName;
- (NSString)baseImageName;
- (id)description;
- (id)imageNameForSize:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCIconOfferMetadata

- (ASCIconOfferMetadata)initWithBaseImageName:(id)a3 animationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCIconOfferMetadata;
  v8 = -[ASCOfferMetadata _init](&v14, "_init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    baseImageName = v8->_baseImageName;
    v8->_baseImageName = v9;

    v11 = (NSString *)[v7 copy];
    animationName = v8->_animationName;
    v8->_animationName = v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCIconOfferMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"baseImageName"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"animationName"];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v29.receiver = self;
      v29.super_class = (Class)&OBJC_CLASS___ASCIconOfferMetadata;
      v9 = -[ASCOfferMetadata initWithCoder:](&v29, "initWithCoder:", v4);
      p_isa = (id *)&v9->super.super.isa;
      if (v9)
      {
        objc_storeStrong((id *)&v9->_baseImageName, v6);
        objc_storeStrong(p_isa + 1, v8);
      }

      self = p_isa;
      v11 = self;
    }

    else
    {
      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v20) {
        sub_1000E1564(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      v11 = 0LL;
    }
  }

  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_1000E1530(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    v11 = 0LL;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ASCIconOfferMetadata;
  id v4 = a3;
  -[ASCOfferMetadata encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata baseImageName](self, "baseImageName", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"baseImageName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata animationName](self, "animationName"));
  [v4 encodeObject:v6 forKey:@"animationName"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata baseImageName](self, "baseImageName"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata animationName](self, "animationName"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCIconOfferMetadata);
  id v6 = v4;
  objc_super v7 = v6;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata baseImageName](self, "baseImageName"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 baseImageName]);
    BOOL v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 == (void *)v11)
    {
LABEL_10:
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata animationName](self, "animationName"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 animationName]);
      uint64_t v15 = (void *)v14;
      if (v13 && v14) {
        unsigned __int8 v16 = [v13 isEqual:v14];
      }
      else {
        unsigned __int8 v16 = v13 == (void *)v14;
      }

      goto LABEL_18;
    }

    unsigned __int8 v16 = 0;
LABEL_18:

    goto LABEL_19;
  }

  unsigned __int8 v16 = 0;
LABEL_19:

  return v16;
}

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata baseImageName](self, "baseImageName"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"baseImageName");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata animationName](self, "animationName"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"animationName");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v6;
}

- (id)imageNameForSize:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCIconOfferMetadata baseImageName](self, "baseImageName", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v3,  &stru_1001276D8,  &stru_1001276D8));

  return v4;
}

- (BOOL)isIcon
{
  return 1;
}

- (NSString)animationName
{
  return self->_animationName;
}

- (NSString)baseImageName
{
  return self->_baseImageName;
}

- (void).cxx_destruct
{
}

@end