@interface ADServiceCommandType
+ (id)_serviceCommandTypeWithDomainName:(id)a3 className:(id)a4;
+ (id)domainObjectCancelTypeForDomainNamed:(id)a3;
+ (id)domainObjectCommitTypeForDomainNamed:(id)a3;
+ (id)domainObjectCreateTypeForDomainNamed:(id)a3;
+ (id)domainObjectDeleteTypeForDomainNamed:(id)a3;
+ (id)domainObjectRetrieveTypeForDomainNamed:(id)a3;
+ (id)domainObjectUpdateTypeForDomainNamed:(id)a3;
- (ADServiceCommandType)initWithDomainName:(id)a3 className:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServiceCommandType:(id)a3;
- (id)className;
- (id)description;
- (id)domainName;
- (id)qualifiedCommandName;
- (unint64_t)hash;
@end

@implementation ADServiceCommandType

- (ADServiceCommandType)initWithDomainName:(id)a3 className:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADServiceCommandType;
  v8 = -[ADServiceCommandType init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    domainName = v8->_domainName;
    v8->_domainName = v9;

    v11 = (NSString *)[v7 copy];
    className = v8->_className;
    v8->_className = v11;
  }

  return v8;
}

- (id)domainName
{
  return self->_domainName;
}

- (id)className
{
  return self->_className;
}

- (id)qualifiedCommandName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_domainName, "stringByAppendingString:", @"#"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:self->_className]);

  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceCommandType qualifiedCommandName](self, "qualifiedCommandName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v3,  self,  v4));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADServiceCommandType);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    BOOL v6 = -[ADServiceCommandType isEqualToServiceCommandType:](self, "isEqualToServiceCommandType:", v4);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToServiceCommandType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    domainName = self->_domainName;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domainName]);
    if (-[NSString isEqualToString:](domainName, "isEqualToString:", v7))
    {
      className = self->_className;
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 className]);
      unsigned __int8 v10 = -[NSString isEqualToString:](className, "isEqualToString:", v9);
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_domainName, "hash");
  return -[NSString hash](self->_className, "hash") ^ v3;
}

- (void).cxx_destruct
{
}

+ (id)_serviceCommandTypeWithDomainName:(id)a3 className:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithDomainName:v7 className:v6];

  return v8;
}

+ (id)domainObjectCreateTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectCreateClassIdentifier];
}

+ (id)domainObjectRetrieveTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectRetrieveClassIdentifier];
}

+ (id)domainObjectUpdateTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectUpdateClassIdentifier];
}

+ (id)domainObjectDeleteTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectDeleteClassIdentifier];
}

+ (id)domainObjectCancelTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectCancelClassIdentifier];
}

+ (id)domainObjectCommitTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectCommitClassIdentifier];
}

@end