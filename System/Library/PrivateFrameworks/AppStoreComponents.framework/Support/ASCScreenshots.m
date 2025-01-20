@interface ASCScreenshots
+ (BOOL)supportsSecureCoding;
- (ASCMediaPlatform)mediaPlatform;
- (ASCScreenshots)initWithArtwork:(id)a3 mediaPlatform:(id)a4;
- (ASCScreenshots)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)artwork;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCScreenshots

- (ASCScreenshots)initWithArtwork:(id)a3 mediaPlatform:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCScreenshots;
  v8 = -[ASCScreenshots init](&v14, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    artwork = v8->_artwork;
    v8->_artwork = v9;

    v11 = (ASCMediaPlatform *)[v7 copy];
    mediaPlatform = v8->_mediaPlatform;
    v8->_mediaPlatform = v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCScreenshots)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v5 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v7 = -[NSSet initWithObjects:](v5, "initWithObjects:", v6, objc_opt_class(&OBJC_CLASS___ASCArtwork), 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"artwork"]);
  if (v8)
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(ASCMediaPlatform) forKey:@"mediaPlatform"];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      v34.receiver = self;
      v34.super_class = (Class)&OBJC_CLASS___ASCScreenshots;
      v11 = -[ASCScreenshots init](&v34, "init");
      if (v11)
      {
        v12 = (NSArray *)[v8 copy];
        artwork = v11->_artwork;
        v11->_artwork = v12;

        objc_super v14 = (ASCMediaPlatform *)[v10 copy];
        mediaPlatform = v11->_mediaPlatform;
        v11->_mediaPlatform = v14;
      }

      self = v11;
      v16 = self;
    }

    else
    {
      BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v25) {
        sub_1000E1940(v25, v26, v27, v28, v29, v30, v31, v32);
      }
      v16 = 0LL;
    }
  }

  else
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_1000E1908(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    v16 = 0LL;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCScreenshots artwork](self, "artwork"));
  [v4 encodeObject:v5 forKey:@"artwork"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASCScreenshots mediaPlatform](self, "mediaPlatform"));
  [v4 encodeObject:v6 forKey:@"mediaPlatform"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCScreenshots artwork](self, "artwork"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCScreenshots mediaPlatform](self, "mediaPlatform"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCScreenshots);
  id v6 = v4;
  id v7 = v6;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCScreenshots artwork](self, "artwork"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 artwork]);
    v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 == (void *)v11)
    {
LABEL_10:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCScreenshots mediaPlatform](self, "mediaPlatform"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 mediaPlatform]);
      v15 = (void *)v14;
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCScreenshots artwork](self, "artwork"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"artwork");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCScreenshots mediaPlatform](self, "mediaPlatform"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"mediaPlatform");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v6;
}

- (NSArray)artwork
{
  return self->_artwork;
}

- (ASCMediaPlatform)mediaPlatform
{
  return self->_mediaPlatform;
}

- (void).cxx_destruct
{
}

@end