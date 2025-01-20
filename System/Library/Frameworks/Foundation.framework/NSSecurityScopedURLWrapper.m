@interface NSSecurityScopedURLWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isBackedByFileProvider;
- (BOOL)isReadonly;
- (NSData)_scope;
- (NSSecurityScopedURLWrapper)initWithCoder:(id)a3;
- (NSSecurityScopedURLWrapper)initWithProviderIdentifier:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5;
- (NSSecurityScopedURLWrapper)initWithURL:(id)a3;
- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4;
- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 extensionClass:(id)a5;
- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 scope:(id)a5;
- (NSString)domainIdentifier;
- (NSString)itemIdentifier;
- (NSString)providerIdentifier;
- (NSURL)url;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSecurityScopedURLWrapper

- (NSSecurityScopedURLWrapper)initWithProviderIdentifier:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSecurityScopedURLWrapper;
  v8 = -[NSSecurityScopedURLWrapper init](&v10, sel_init);
  if (v8)
  {
    v8->_providerIdentifier = (NSString *)[a3 copy];
    v8->_domainIdentifier = (NSString *)[a4 copy];
    v8->_itemIdentifier = (NSString *)[a5 copy];
    v8->_readonly = 1;
  }

  return v8;
}

- (NSSecurityScopedURLWrapper)initWithURL:(id)a3
{
  return -[NSSecurityScopedURLWrapper initWithURL:readonly:](self, "initWithURL:readonly:", a3, 0LL);
}

- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4
{
  return -[NSSecurityScopedURLWrapper initWithURL:readonly:extensionClass:]( self,  "initWithURL:readonly:extensionClass:",  a3,  a4,  0LL);
}

- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 extensionClass:(id)a5
{
  BOOL v6 = a4;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSSecurityScopedURLWrapper;
  v8 = -[NSSecurityScopedURLWrapper init](&v12, sel_init);
  if (v8)
  {
    v8->_url = (NSURL *)[a3 copy];
    v8->_readonly = v6;
    uint64_t v11 = 0LL;
    if (a5)
    {
      OnlySandboxExtensionTypeForURL = (void *)[a5 UTF8String];
    }

    else if (v6)
    {
      OnlySandboxExtensionTypeForURL = _bestReadOnlySandboxExtensionTypeForURL(a3);
    }

    else
    {
      OnlySandboxExtensionTypeForURL = _bestReadWriteSandboxExtensionTypeForURL(a3);
    }

    v8->_scope = (NSData *)(id)_issueSandboxExtension(a3, (uint64_t)OnlySandboxExtensionTypeForURL, &v11);
    if (v11) {
      NSLog((NSString *)@"Could not create sandbox extension. Error: %@", v11);
    }
  }

  return v8;
}

- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 scope:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSecurityScopedURLWrapper;
  v8 = -[NSSecurityScopedURLWrapper init](&v10, sel_init);
  if (v8)
  {
    v8->_url = (NSURL *)[a3 copy];
    v8->_readonly = a4;
    v8->_scope = (NSData *)[a5 copy];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSecurityScopedURLWrapper;
  -[NSSecurityScopedURLWrapper dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSecurityScopedURLWrapper;
  id v3 = (id)objc_msgSend(-[NSSecurityScopedURLWrapper description](&v5, sel_description), "mutableCopy");
  [v3 appendFormat:@"URL: %@\n", self->_url];
  objc_msgSend(v3, "appendFormat:", @"Readonly: %d\n", self->_readonly);
  objc_msgSend(v3, "appendFormat:", @"Has security scope: %d\n", self->_scope != 0);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  if (url) {
    [a3 encodeObject:url forKey:@"url"];
  }
  scope = self->_scope;
  if (scope) {
    [a3 encodeObject:scope forKey:@"scope"];
  }
  id v7 = (id)_CFURLPromiseCopyPhysicalURL();
  if (v7)
  {
    v8 = v7;
    [a3 encodeObject:v7 forKey:@"promiseURL"];
    id v9 = (id)MEMORY[0x186E1ED6C](v8);
    if (v9
      || (objc_super v10 = _bestReadWriteSandboxExtensionTypeForURL(v8),
          (id v9 = (id)_issueSandboxExtension(v8, (uint64_t)v10, 0LL)) != 0LL))
    {
      [a3 encodeObject:v9 forKey:@"promiseScope"];
    }
  }

- (NSSecurityScopedURLWrapper)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSecurityScopedURLWrapper;
  uint64_t v4 = -[NSSecurityScopedURLWrapper init](&v8, sel_init);
  if (v4)
  {
    v4->_readonly = [a3 decodeBoolForKey:@"readonly"];
    v4->_url = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    v4->_scope = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"scope"];
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"promiseURL"];
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"promiseScope"];
    if (v4->_url)
    {
      if (v4->_scope) {
        MEMORY[0x186E1ECB8]();
      }
      if (v5 && v6) {
        MEMORY[0x186E1ECB8](v5, v6);
      }
      _CFURLPromiseSetPhysicalURL();
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)_scope
{
  return self->_scope;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (BOOL)isBackedByFileProvider
{
  return self->_backedByFileProvider;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

@end