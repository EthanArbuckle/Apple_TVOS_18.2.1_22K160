@interface SUControllerDownload
+ (BOOL)supportsSecureCoding;
+ (id)downloadWithDescriptor:(id)a3 andProgress:(id)a4;
- (SUControllerDescriptor)descriptor;
- (SUControllerDownload)initWithCoder:(id)a3;
- (SUControllerDownload)initWithDescriptor:(id)a3;
- (SUControllerProgress)progress;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation SUControllerDownload

+ (id)downloadWithDescriptor:(id)a3 andProgress:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___SUControllerDownload);
  id v8 = [v6 copy];

  -[SUControllerDownload setDescriptor:](v7, "setDescriptor:", v8);
  id v9 = [v5 copy];

  -[SUControllerDownload setProgress:](v7, "setProgress:", v9);
  return v7;
}

- (SUControllerDownload)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUControllerDownload;
  id v6 = -[SUControllerDownload init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptor, a3);
  }

  return v7;
}

- (SUControllerDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SUControllerDownload;
  id v5 = -[SUControllerDownload init](&v15, "init");
  if (v5)
  {
    v17[0] = objc_opt_class(&OBJC_CLASS___SUControllerDescriptor);
    v17[1] = objc_opt_class(&OBJC_CLASS___SUControllerDocumentation);
    v17[2] = objc_opt_class(&OBJC_CLASS___NSError);
    v17[3] = objc_opt_class(&OBJC_CLASS___NSData);
    v17[4] = objc_opt_class(&OBJC_CLASS___NSString);
    v17[5] = objc_opt_class(&OBJC_CLASS___NSURL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 6LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"descriptor"]);
    descriptor = v5->_descriptor;
    v5->_descriptor = (SUControllerDescriptor *)v8;

    v16[0] = objc_opt_class(&OBJC_CLASS___SUControllerProgress);
    v16[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"progress"]);
    progress = v5->_progress;
    v5->_progress = (SUControllerProgress *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDownload descriptor](self, "descriptor"));
  [v4 encodeObject:v5 forKey:@"descriptor"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerDownload progress](self, "progress"));
  [v4 encodeObject:v6 forKey:@"progress"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDownload descriptor](self, "descriptor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDownload progress](self, "progress"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Descriptor: %@\nProgress: %@",  v3,  v4));

  return v5;
}

- (SUControllerDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (SUControllerProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end