@interface ASCTextOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCTextOfferMetadata)initWithCoder:(id)a3;
- (ASCTextOfferMetadata)initWithTitle:(id)a3 subtitle:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isText;
- (NSString)subtitle;
- (NSString)title;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCTextOfferMetadata

- (ASCTextOfferMetadata)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCTextOfferMetadata;
  v8 = -[ASCOfferMetadata _init](&v14, "_init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    v11 = (NSString *)[v7 copy];
    subtitle = v8->_subtitle;
    v8->_subtitle = v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCTextOfferMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"title"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___ASCTextOfferMetadata;
    id v7 = -[ASCOfferMetadata initWithCoder:](&v22, "initWithCoder:", v4);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_title, v6);
      id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"subtitle"];
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
      subtitle = v8->_subtitle;
      v8->_subtitle = (NSString *)v10;
    }

    self = v8;
    v12 = self;
  }

  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_1000E14FC(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    v12 = 0LL;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ASCTextOfferMetadata;
  id v4 = a3;
  -[ASCOfferMetadata encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCTextOfferMetadata title](self, "title", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"title"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCTextOfferMetadata subtitle](self, "subtitle"));
  [v4 encodeObject:v6 forKey:@"subtitle"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCTextOfferMetadata title](self, "title"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCTextOfferMetadata subtitle](self, "subtitle"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCTextOfferMetadata);
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
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCTextOfferMetadata title](self, "title"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 title]);
    v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 == (void *)v11)
    {
LABEL_10:
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCTextOfferMetadata subtitle](self, "subtitle"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 subtitle]);
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCTextOfferMetadata title](self, "title"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"title");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCTextOfferMetadata subtitle](self, "subtitle"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"subtitle");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v6;
}

- (BOOL)isText
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
}

@end