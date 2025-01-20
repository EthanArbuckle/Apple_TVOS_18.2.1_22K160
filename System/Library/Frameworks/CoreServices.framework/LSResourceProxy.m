@interface LSResourceProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)boundIconIsBadge;
- (LSIconResourceLocator)iconResourceLocator;
- (LSResourceProxy)initWithCoder:(id)a3;
- (NSDictionary)iconsDictionary;
- (NSString)localizedName;
- (NSString)primaryIconName;
- (_LSLazyPropertyList)_iconsDictionary;
- (id)_initWithLocalizedName:(id)a3;
- (id)iconDataForStyle:(id)a3 width:(int64_t)a4 height:(int64_t)a5 options:(unint64_t)a6;
- (id)iconDataForVariant:(int)a3;
- (id)iconDataForVariant:(int)a3 withOptions:(int)a4;
- (id)uniqueIdentifier;
- (unint64_t)propertyListCachingStrategy;
- (void)_setIconsDictionary:(id)a3;
- (void)_setLocalizedName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)primaryIconName;
@end

@implementation LSResourceProxy

- (id)_initWithLocalizedName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSResourceProxy;
  v5 = -[_LSQueryResult _init](&v9, sel__init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }

  return v5;
}

- (void)_setIconsDictionary:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)_setLocalizedName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)boundIconIsBadge
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSResourceProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LSResourceProxy;
  v5 = -[_LSQueryResult initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"localizedName");
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"iconsDictionary");
    iconsDictionary = v5->__iconsDictionary;
    v5->__iconsDictionary = (_LSLazyPropertyList *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localizedName = self->_localizedName;
  id v5 = a3;
  [v5 encodeObject:localizedName forKey:@"localizedName"];
  [v5 encodeObject:self->__iconsDictionary forKey:@"iconsDictionary"];
}

- (id)uniqueIdentifier
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return -[LSResourceProxy iconResourceLocator](v3, v4);
}

- (LSIconResourceLocator)iconResourceLocator
{
  return 0LL;
}

- (NSDictionary)iconsDictionary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_LSLazyPropertyList propertyList](v2);
  return (NSDictionary *)v3;
}

- (NSString)primaryIconName
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    [v2 objectForKey:@"CFBundlePrimaryIcon" ofClass:0];
    SEL v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      [v4 objectForKey:@"CFBundleIconName"];
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v5 = v4;
    }

    uint64_t v6 = v5;
    if (!v5 || (_NSIsNSString() & 1) != 0) {
      goto LABEL_13;
    }
    _LSDefaultLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LSResourceProxy primaryIconName].cold.1((uint64_t)v6, v7);
    }

LABEL_12:
    uint64_t v6 = 0LL;
LABEL_13:

    goto LABEL_14;
  }

  uint64_t v6 = 0LL;
LABEL_14:

  return (NSString *)v6;
}

- (id)iconDataForStyle:(id)a3 width:(int64_t)a4 height:(int64_t)a5 options:(unint64_t)a6
{
  return 0LL;
}

- (id)iconDataForVariant:(int)a3
{
  return 0LL;
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  return 0LL;
}

- (unint64_t)propertyListCachingStrategy
{
  return 0LL;
}

- (_LSLazyPropertyList)_iconsDictionary
{
  return self->__iconsDictionary;
}

- (void)primaryIconName
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = objc_opt_class();
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "Expected icon name to be a string, but it was a %{public}@",  (uint8_t *)&v3,  0xCu);
}

@end