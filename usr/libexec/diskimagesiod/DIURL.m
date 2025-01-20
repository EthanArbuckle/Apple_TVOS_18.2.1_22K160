@interface DIURL
+ (BOOL)supportsSecureCoding;
+ (id)newDIURLWithNSURL:(id)a3;
+ (id)newDIURLWithPluginName:(id)a3 params:(id)a4;
- (BOOL)isPlugin;
- (DIURL)initWithCoder:(id)a3;
- (DIURL)initWithPluginName:(id)a3 params:(id)a4;
- (NSDictionary)pluginParams;
- (NSString)pluginName;
- (id)description;
- (id)path;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DIURL

+ (id)newDIURLWithNSURL:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___DIURL, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = (DIURL *)[v3 copy];
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___DIURL);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
    v6 = -[DIURL initWithString:](v7, "initWithString:", v8);
  }

  return v6;
}

+ (id)newDIURLWithPluginName:(id)a3 params:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = -[DIURL initWithPluginName:params:](objc_alloc(&OBJC_CLASS___DIURL), "initWithPluginName:params:", v5, v6);

  return v7;
}

- (DIURL)initWithPluginName:(id)a3 params:(id)a4
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"plugin://%@/", a3));
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIURL;
  v9 = -[DIURL initWithString:](&v11, "initWithString:", v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_pluginParams, a4);
  }

  return v9;
}

- (BOOL)isPlugin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL scheme](self, "scheme"));
  unsigned __int8 v3 = [v2 isEqualToString:@"plugin"];

  return v3;
}

- (NSString)pluginName
{
  if (-[DIURL isPlugin](self, "isPlugin")) {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL host](self, "host"));
  }
  else {
    unsigned __int8 v3 = 0LL;
  }
  return (NSString *)v3;
}

- (id)path
{
  if (-[DIURL isPlugin](self, "isPlugin"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL description](self, "description"));
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___DIURL;
    id v4 = -[DIURL path](&v6, "path");
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  return v3;
}

- (id)description
{
  if (-[DIURL isPlugin](self, "isPlugin"))
  {
    uint64_t v3 = sub_10005F748();
    id v4 = objc_claimAutoreleasedReturnValue(-[DIURL pluginName](self, "pluginName"));
    sub_100004CB0(__p, (char *)[v4 UTF8String]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL pluginParams](self, "pluginParams"));
    objc_super v6 = (__CFString *)sub_100060DAC(v3, (uint64_t)__p, (uint64_t)v5);

    if (v16 < 0) {
      operator delete(__p[0]);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scheme]);

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"plugin://%@",  v6));
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

      id v7 = (void *)v10;
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 absoluteString]);
  }

  else
  {
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  self,  1LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL password](self, "password"));

    if (v12) {
      -[__CFString setPassword:](v6, "setPassword:", 0LL);
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URL](v6, "URL"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 absoluteString]);
  }

  v13 = (void *)v11;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___DIURL;
  objc_super v6 = -[DIURL initWithCoder:](&v30, "initWithCoder:", v4);
  if (v6)
  {
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDate, v5);
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray, v7);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNull, v10);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData, v14);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSOrderedSet, v16);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v18);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSError, v20);
    v23 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v29,  v28,  v9,  v11,  v13,  v15,  v17,  v19,  v21,  objc_opt_class(&OBJC_CLASS___NSFileHandle, v22),  0LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v24 forKey:@"pluginParams"]);
    pluginParams = v6->_pluginParams;
    v6->_pluginParams = (NSDictionary *)v25;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DIURL;
  -[DIURL encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL pluginParams](self, "pluginParams"));
  [v4 encodeObject:v5 forKey:@"pluginParams"];
}

- (NSDictionary)pluginParams
{
  return self->_pluginParams;
}

- (void).cxx_destruct
{
}

@end