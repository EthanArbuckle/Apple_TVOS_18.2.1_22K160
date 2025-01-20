@interface ASCLockupFeatureMedia
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureMedia)initWithCoder:(id)a3;
- (ASCLockupFeatureMedia)initWithScreenshots:(id)a3 trailers:(id)a4;
- (ASCScreenshots)screenshots;
- (ASCTrailers)trailers;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureMedia

- (ASCLockupFeatureMedia)initWithScreenshots:(id)a3 trailers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureMedia;
  v8 = -[ASCLockupFeatureMedia init](&v14, "init");
  if (v8)
  {
    v9 = (ASCScreenshots *)[v6 copy];
    screenshots = v8->_screenshots;
    v8->_screenshots = v9;

    v11 = (ASCTrailers *)[v7 copy];
    trailers = v8->_trailers;
    v8->_trailers = v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureMedia)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ASCScreenshots) forKey:@"screenshots"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(ASCTrailers) forKey:@"trailers"];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = -[ASCLockupFeatureMedia initWithScreenshots:trailers:](self, "initWithScreenshots:trailers:", v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia screenshots](self, "screenshots"));
  [v4 encodeObject:v5 forKey:@"screenshots"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia trailers](self, "trailers"));
  [v4 encodeObject:v6 forKey:@"trailers"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia screenshots](self, "screenshots"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia trailers](self, "trailers"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureMedia *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureMedia);
    unint64_t v6 = v4;
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

    v10 = v8;

    if (!v10)
    {
      unsigned __int8 v9 = 0;
LABEL_21:

      goto LABEL_22;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia screenshots](self, "screenshots"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia screenshots](v10, "screenshots"));
    v13 = (void *)v12;
    if (v11 && v12)
    {
    }

    else if (v11 == (void *)v12)
    {
LABEL_12:
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia trailers](self, "trailers"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia trailers](v10, "trailers"));
      v16 = (void *)v15;
      if (v14 && v15) {
        unsigned __int8 v9 = [v14 isEqual:v15];
      }
      else {
        unsigned __int8 v9 = v14 == (void *)v15;
      }

      goto LABEL_20;
    }

    unsigned __int8 v9 = 0;
LABEL_20:

    goto LABEL_21;
  }

  unsigned __int8 v9 = 1;
LABEL_22:

  return v9;
}

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia screenshots](self, "screenshots"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"screenshots");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureMedia trailers](self, "trailers"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"trailers");

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v6;
}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (ASCTrailers)trailers
{
  return self->_trailers;
}

- (void).cxx_destruct
{
}

@end