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
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (DIURL *)[v3 copy];
  }

  else
  {
    v5 = objc_alloc(&OBJC_CLASS___DIURL);
    [v3 absoluteString];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[DIURL initWithString:](v5, "initWithString:", v6);
  }

  return v4;
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
  [NSString stringWithFormat:@"plugin://%@/", a3];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIURL;
  v9 = -[DIURL initWithString:](&v11, sel_initWithString_, v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_pluginParams, a4);
  }

  return v9;
}

- (BOOL)isPlugin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:@"plugin"];

  return v3;
}

- (NSString)pluginName
{
  if (-[DIURL isPlugin](self, "isPlugin"))
  {
    -[DIURL host](self, "host");
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    char v3 = 0LL;
  }

  return (NSString *)v3;
}

- (id)path
{
  if (-[DIURL isPlugin](self, "isPlugin"))
  {
    -[DIURL description](self, "description");
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___DIURL;
    -[DIURL path](&v5, sel_path);
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)description
{
  char v3 = (PluginsManager *)-[DIURL isPlugin](self, "isPlugin");
  if ((_DWORD)v3)
  {
    uint64_t v4 = PluginsManager::get(v3);
    id v5 = -[DIURL pluginName](self, "pluginName");
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
    -[DIURL pluginParams](self, "pluginParams");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = (void *)PluginsManager::copy_plugin_description(v4, (uint64_t)__p, (uint64_t)v6);

    if (v18 < 0) {
      operator delete(__p[0]);
    }

    [MEMORY[0x189604030] URLWithString:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 scheme];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)MEMORY[0x189604030];
      [NSString stringWithFormat:@"plugin://%@", v7];
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v10 URLWithString:v11];

      v8 = (void *)v12;
    }

    uint64_t v13 = [v8 absoluteString];
  }

  else
  {
    [MEMORY[0x189607A50] componentsWithURL:self resolvingAgainstBaseURL:1];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[DIURL password](self, "password");
    if (v14) {
      [v7 setPassword:0];
    }
    [v7 URL];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v8 absoluteString];
  }

  v15 = (void *)v13;

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DIURL;
  id v5 = -[DIURL initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v19 = (void *)MEMORY[0x189604010];
    uint64_t v18 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v18, v17, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"pluginParams"];
    pluginParams = v5->_pluginParams;
    v5->_pluginParams = (NSDictionary *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DIURL;
  -[DIURL encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DIURL pluginParams](self, "pluginParams");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
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