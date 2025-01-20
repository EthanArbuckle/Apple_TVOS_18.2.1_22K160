@interface RBSDomainAttribute
+ (id)attributeWithDomain:(id)a3 name:(id)a4;
+ (id)attributeWithDomain:(id)a3 name:(id)a4 sourceEnvironment:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)domain;
- (NSString)fullyQualifiedName;
- (NSString)name;
- (NSString)sourceEnvironment;
- (RBSDomainAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDomain:(void *)a3 name:(void *)a4 sourceEnvironment:;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setDomain:(id)a3;
- (void)setName:(id)a3;
- (void)setSourceEnvironment:(id)a3;
@end

@implementation RBSDomainAttribute

+ (id)attributeWithDomain:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[RBSDomainAttribute _initWithDomain:name:sourceEnvironment:](objc_alloc((Class)a1), v7, v6, 0LL);

  return v8;
}

- (void)_initWithDomain:(void *)a3 name:(void *)a4 sourceEnvironment:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_CLASS___RBSDomainAttribute;
    a1 = objc_msgSendSuper2(&v17, sel__init);
    if (a1)
    {
      uint64_t v10 = [v7 copy];
      v11 = (void *)a1[1];
      a1[1] = v10;

      uint64_t v12 = [v8 copy];
      v13 = (void *)a1[2];
      a1[2] = v12;

      uint64_t v14 = [v9 copy];
      v15 = (void *)a1[3];
      a1[3] = v14;
    }
  }

  return a1;
}

+ (id)attributeWithDomain:(id)a3 name:(id)a4 sourceEnvironment:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[RBSDomainAttribute _initWithDomain:name:sourceEnvironment:](objc_alloc((Class)a1), v10, v9, v8);

  return v11;
}

- (NSString)fullyQualifiedName
{
  return -[NSString stringByAppendingPathExtension:](self->_domain, "stringByAppendingPathExtension:", self->_name);
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBSDomainAttribute;
  BOOL v8 = 0;
  if (-[RBSAttribute isEqual:](&v10, sel_isEqual_, v4))
  {
    domain = self->_domain;
    if (domain == (NSString *)v4[1] || -[NSString isEqualToString:](domain, "isEqualToString:"))
    {
      name = self->_name;
      if (name == (NSString *)v4[2] || -[NSString isEqualToString:](name, "isEqualToString:"))
      {
        sourceEnvironment = self->_sourceEnvironment;
        if (sourceEnvironment == (NSString *)v4[3]
          || -[NSString isEqualToString:](sourceEnvironment, "isEqualToString:"))
        {
          BOOL v8 = 1;
        }
      }
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_domain, "hash");
  NSUInteger v4 = -[NSString hash](self->_name, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sourceEnvironment, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  NSUInteger v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v3 initWithFormat:@"<%@| domain:%@ name:%@ sourceEnvironment:%@>", v4, self->_domain, self->_name, self->_sourceEnvironment];

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSDomainAttribute;
  id v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v8, sel_encodeWithRBSXPCCoder_, v4);
  v5 = -[RBSDomainAttribute domain](self, "domain", v8.receiver, v8.super_class);
  [v4 encodeObject:v5 forKey:@"domain"];

  -[RBSDomainAttribute name](self, "name");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"name"];

  -[RBSDomainAttribute sourceEnvironment](self, "sourceEnvironment");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"sourceEnvironment"];
}

- (RBSDomainAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBSDomainAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v10, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSDomainAttribute setDomain:](v5, "setDomain:", v6);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSDomainAttribute setName:](v5, "setName:", v7);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceEnvironment"];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSDomainAttribute setSourceEnvironment:](v5, "setSourceEnvironment:", v8);
  }

  return v5;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)sourceEnvironment
{
  return self->_sourceEnvironment;
}

- (void)setSourceEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end