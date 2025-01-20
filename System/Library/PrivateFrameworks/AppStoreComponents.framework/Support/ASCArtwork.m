@interface ASCArtwork
+ (BOOL)supportsSecureCoding;
- (ASCArtwork)initWithCoder:(id)a3;
- (ASCArtwork)initWithURLTemplate:(id)a3 width:(double)a4 height:(double)a5 decoration:(id)a6 preferredCrop:(id)a7 preferredFormat:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPortrait;
- (NSString)URLTemplate;
- (NSString)decoration;
- (NSString)preferredCrop;
- (NSString)preferredFormat;
- (UIImage)embeddedImage;
- (double)height;
- (double)width;
- (id)dataSource;
- (id)description;
- (id)makeURLWithSubstitutions:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCArtwork

- (ASCArtwork)initWithURLTemplate:(id)a3 width:(double)a4 height:(double)a5 decoration:(id)a6 preferredCrop:(id)a7 preferredFormat:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ASCArtwork;
  v18 = -[ASCArtwork init](&v28, "init");
  if (v18)
  {
    id v19 = [v14 copy];
    id dataSource = v18->_dataSource;
    v18->_id dataSource = v19;

    v18->_width = a4;
    v18->_height = a5;
    v21 = (NSString *)[v15 copy];
    decoration = v18->_decoration;
    v18->_decoration = v21;

    v23 = (NSString *)[v16 copy];
    preferredCrop = v18->_preferredCrop;
    v18->_preferredCrop = v23;

    v25 = (NSString *)[v17 copy];
    preferredFormat = v18->_preferredFormat;
    v18->_preferredFormat = v25;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCArtwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v5 forKey:@"dataSource"]);
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"decoration"];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"preferredCrop"];
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (v10)
      {
        id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"preferredFormat"];
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (v12)
        {
          v51.receiver = self;
          v51.super_class = (Class)&OBJC_CLASS___ASCArtwork;
          v13 = -[ASCArtwork init](&v51, "init");
          id v14 = v13;
          if (v13)
          {
            objc_storeStrong(&v13->_dataSource, v6);
            [v4 decodeDoubleForKey:@"width"];
            v14->_width = v15;
            [v4 decodeDoubleForKey:@"height"];
            v14->_height = v16;
            v14->_isPortrait = v16 >= v14->_width;
            objc_storeStrong((id *)&v14->_decoration, v8);
            objc_storeStrong((id *)&v14->_preferredCrop, v10);
            objc_storeStrong((id *)&v14->_preferredFormat, v12);
          }

          self = v14;
          id v17 = self;
        }

        else
        {
          BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v42) {
            sub_1000E0DD8(v42, v43, v44, v45, v46, v47, v48, v49);
          }
          id v17 = 0LL;
        }
      }

      else
      {
        BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v34) {
          sub_1000E0DA4(v34, v35, v36, v37, v38, v39, v40, v41);
        }
        id v17 = 0LL;
      }
    }

    else
    {
      BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v26) {
        sub_1000E0D70(v26, v27, v28, v29, v30, v31, v32, v33);
      }
      id v17 = 0LL;
    }
  }

  else
  {
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v18) {
      sub_1000E0D3C(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    id v17 = 0LL;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork dataSource](self, "dataSource"));
  [v4 encodeObject:v5 forKey:@"dataSource"];

  -[ASCArtwork width](self, "width");
  objc_msgSend(v4, "encodeDouble:forKey:", @"width");
  -[ASCArtwork height](self, "height");
  objc_msgSend(v4, "encodeDouble:forKey:", @"height");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork decoration](self, "decoration"));
  [v4 encodeObject:v6 forKey:@"decoration"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredCrop](self, "preferredCrop"));
  [v4 encodeObject:v7 forKey:@"preferredCrop"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredFormat](self, "preferredFormat"));
  [v4 encodeObject:v8 forKey:@"preferredFormat"];
}

- (NSString)URLTemplate
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ASCArtwork dataSource](self, "dataSource"));
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;

  if (v7) {
    id v8 = (__CFString *)[v7 copy];
  }
  else {
    id v8 = @"<embedded image>";
  }

  return (NSString *)v8;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork dataSource](self, "dataSource"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCArtwork width](self, "width");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCArtwork height](self, "height");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork decoration](self, "decoration"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredCrop](self, "preferredCrop"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredFormat](self, "preferredFormat"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  unint64_t v8 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCArtwork *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCArtwork);
    v6 = v4;
    id v7 = v6;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        unint64_t v8 = v7;
      }
      else {
        unint64_t v8 = 0LL;
      }
    }

    else
    {
      unint64_t v8 = 0LL;
    }

    v10 = v8;

    if (!v10)
    {
      unsigned __int8 v9 = 0;
LABEL_28:

      goto LABEL_29;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork dataSource](self, "dataSource"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCArtwork dataSource](v10, "dataSource"));
    v13 = (void *)v12;
    if (v11 && v12)
    {
    }

    else if (v11 != (void *)v12)
    {
LABEL_26:
      unsigned __int8 v9 = 0;
LABEL_27:

      goto LABEL_28;
    }

    -[ASCArtwork width](self, "width");
    double v15 = v14;
    -[ASCArtwork width](v10, "width");
    if (v15 != v16) {
      goto LABEL_26;
    }
    -[ASCArtwork height](self, "height");
    double v18 = v17;
    -[ASCArtwork height](v10, "height");
    if (v18 != v19) {
      goto LABEL_26;
    }
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork decoration](self, "decoration"));
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[ASCArtwork decoration](v10, "decoration"));
    uint64_t v22 = (void *)v21;
    if (v20 && v21)
    {
      if ([v20 isEqual:v21])
      {
LABEL_20:
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredCrop](self, "preferredCrop"));
        uint64_t v24 = objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredCrop](v10, "preferredCrop"));
        uint64_t v25 = (void *)v24;
        if (v23 && v24)
        {
        }

        else if (v23 == (void *)v24)
        {
LABEL_23:
          BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredFormat](self, "preferredFormat"));
          uint64_t v27 = objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredFormat](v10, "preferredFormat"));
          uint64_t v28 = (void *)v27;
          uint64_t v30 = v26;
          if (v26 && v27) {
            unsigned __int8 v9 = [v26 isEqual:v27];
          }
          else {
            unsigned __int8 v9 = v26 == (void *)v27;
          }

          goto LABEL_36;
        }

        unsigned __int8 v9 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }

    else if (v20 == (void *)v21)
    {
      goto LABEL_20;
    }

    unsigned __int8 v9 = 0;
LABEL_37:

    goto LABEL_27;
  }

  unsigned __int8 v9 = 1;
LABEL_29:

  return v9;
}

- (id)description
{
  uint64_t v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork URLTemplate](self, "URLTemplate"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"URLTemplate");

  -[ASCArtwork width](self, "width");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"width");
  -[ASCArtwork height](self, "height");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"height");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork decoration](self, "decoration"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"decoration");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredCrop](self, "preferredCrop"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"preferredCrop");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork preferredFormat](self, "preferredFormat"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, @"preferredFormat");

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v8;
}

- (id)makeURLWithSubstitutions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCArtwork URLTemplate](self, "URLTemplate"));
  id v6 = [v5 mutableCopy];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000BEF4;
  v10[3] = &unk_10011EFA8;
  id v11 = v6;
  id v7 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
  return v8;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (BOOL)isPortrait
{
  return self->_isPortrait;
}

- (NSString)decoration
{
  return self->_decoration;
}

- (NSString)preferredCrop
{
  return self->_preferredCrop;
}

- (NSString)preferredFormat
{
  return self->_preferredFormat;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (UIImage)embeddedImage
{
  return self->_embeddedImage;
}

- (void).cxx_destruct
{
}

@end