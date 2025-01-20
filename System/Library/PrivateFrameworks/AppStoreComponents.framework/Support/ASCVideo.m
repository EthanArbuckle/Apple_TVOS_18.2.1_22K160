@interface ASCVideo
+ (BOOL)supportsSecureCoding;
- (ASCArtwork)preview;
- (ASCVideo)initWithCoder:(id)a3;
- (ASCVideo)initWithVideoURL:(id)a3 preview:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)videoURL;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCVideo

- (ASCVideo)initWithVideoURL:(id)a3 preview:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCVideo;
  v8 = -[ASCVideo init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    videoURL = v8->_videoURL;
    v8->_videoURL = v9;

    v11 = (ASCArtwork *)[v7 copy];
    preview = v8->_preview;
    v8->_preview = v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCVideo)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"videoURL"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(ASCArtwork) forKey:@"preview"];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v32.receiver = self;
      v32.super_class = (Class)&OBJC_CLASS___ASCVideo;
      v9 = -[ASCVideo init](&v32, "init");
      if (v9)
      {
        v10 = (NSString *)[v6 copy];
        videoURL = v9->_videoURL;
        v9->_videoURL = v10;

        v12 = (ASCArtwork *)[v8 copy];
        preview = v9->_preview;
        v9->_preview = v12;
      }

      self = v9;
      objc_super v14 = self;
    }

    else
    {
      BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v23) {
        sub_1000E1DB8(v23, v24, v25, v26, v27, v28, v29, v30);
      }
      objc_super v14 = 0LL;
    }
  }

  else
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_1000E1D80(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    objc_super v14 = 0LL;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCVideo videoURL](self, "videoURL"));
  [v4 encodeObject:v5 forKey:@"videoURL"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASCVideo preview](self, "preview"));
  [v4 encodeObject:v6 forKey:@"preview"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCVideo videoURL](self, "videoURL"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCVideo preview](self, "preview"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCVideo *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCVideo);
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

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCVideo videoURL](self, "videoURL"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCVideo videoURL](v10, "videoURL"));
    v13 = (void *)v12;
    if (v11 && v12)
    {
    }

    else if (v11 == (void *)v12)
    {
LABEL_12:
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCVideo preview](self, "preview"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASCVideo preview](v10, "preview"));
      uint64_t v16 = (void *)v15;
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

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCVideo videoURL](self, "videoURL"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"videoURL");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCVideo preview](self, "preview"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"preview");

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v6;
}

- (NSString)videoURL
{
  return self->_videoURL;
}

- (ASCArtwork)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
}

@end