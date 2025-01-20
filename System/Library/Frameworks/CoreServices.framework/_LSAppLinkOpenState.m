@interface _LSAppLinkOpenState
+ (BOOL)supportsSecureCoding;
- (BOOL)includeLinksForCallingApplication;
- (NSDictionary)browserState;
- (NSString)bundleIdentifier;
- (NSURL)URL;
- (NSXPCConnection)XPCConnection;
- (_LSAppLinkOpenState)initWithCoder:(id)a3;
- (_LSOpenConfiguration)openConfiguration;
- (const)auditToken;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setBrowserState:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIncludeLinksForCallingApplication:(BOOL)a3;
- (void)setOpenConfiguration:(id)a3;
- (void)setURL:(id)a3;
- (void)setXPCConnection:(id)a3;
@end

@implementation _LSAppLinkOpenState

- (const)auditToken
{
  if (self->_auditToken.__engaged_) {
    return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_auditToken;
  }
  else {
    return 0LL;
  }
}

- (void)setAuditToken:(id *)a3
{
  if (a3)
  {
    BOOL engaged = self->_auditToken.__engaged_;
    __int128 v4 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)&self->_auditToken.var0.__null_state_ = *(_OWORD *)a3->var0;
    *(_OWORD *)&self->_auditToken.var0.val[4] = v4;
    if (!engaged) {
      self->_auditToken.__engaged_ = 1;
    }
  }

  else if (self->_auditToken.__engaged_)
  {
    self->_auditToken.__engaged_ = 0;
  }

  XPCConnection = self->_XPCConnection;
  self->_XPCConnection = 0LL;
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void)setXPCConnection:(id)a3
{
  __int128 v4 = (NSXPCConnection *)a3;
  v5 = v4;
  if (v4)
  {
    -[NSXPCConnection auditToken](v4, "auditToken");
    BOOL engaged = self->_auditToken.__engaged_;
    *(_OWORD *)&self->_auditToken.var0.__null_state_ = v8;
    *(_OWORD *)&self->_auditToken.var0.val[4] = v9;
    if (!engaged) {
      self->_auditToken.__engaged_ = 1;
    }
  }

  else if (self->_auditToken.__engaged_)
  {
    self->_auditToken.__engaged_ = 0;
  }

  XPCConnection = self->_XPCConnection;
  self->_XPCConnection = v5;
}

- (id)debugDescription
{
  v3 = (void *)NSString;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____LSAppLinkOpenState;
  -[_LSAppLinkOpenState description](&v11, sel_description);
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_LSAppLinkOpenState URL](self, "URL");
  v6 = -[_LSAppLinkOpenState browserState](self, "browserState");
  uint64_t v7 = [v6 count];
  -[_LSAppLinkOpenState openConfiguration](self, "openConfiguration");
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@ { URL = %@, browserState = %lu, openconfig = %@ }", v4, v5, v7, v8];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = -[NSURL copy](self->_URL, "copy");
    v6 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v5;

    uint64_t v7 = -[NSString copy](self->_bundleIdentifier, "copy");
    __int128 v8 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v7;

    uint64_t v9 = -[_LSOpenConfiguration copy](self->_openConfiguration, "copy");
    v10 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v9;

    uint64_t v11 = -[NSDictionary copy](self->_browserState, "copy");
    v12 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v11;

    objc_storeStrong((id *)(v4 + 48), self->_XPCConnection);
    *(_BYTE *)(v4 + 56) = self->_includeLinksForCallingApplication;
  }

  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  -[_LSAppLinkOpenState URL](self, "URL");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v4 forKey:@"URL"];

  -[_LSAppLinkOpenState openConfiguration](self, "openConfiguration");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v5 forKey:@"openConfiguration"];
  v6 = -[_LSAppLinkOpenState browserState](self, "browserState");
  [v7 encodeObject:v6 forKey:@"browserState"];

  objc_msgSend( v7,  "encodeBool:forKey:",  -[_LSAppLinkOpenState includeLinksForCallingApplication](self, "includeLinksForCallingApplication"),  @"includeLinksForCallingApplication");
}

- (_LSAppLinkOpenState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[_LSAppLinkOpenState init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSAppLinkOpenState setURL:](v5, "setURL:", v6);

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"openConfiguration");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSAppLinkOpenState setOpenConfiguration:](v5, "setOpenConfiguration:", v7);

    uint64_t v8 = objc_opt_class();
    XNSGetPropertyListClasses();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v8, v9, @"browserState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSAppLinkOpenState setBrowserState:](v5, "setBrowserState:", v10);

    -[_LSAppLinkOpenState setIncludeLinksForCallingApplication:]( v5,  "setIncludeLinksForCallingApplication:",  [v4 decodeBoolForKey:@"includeLinksForCallingApplication"]);
  }

  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setURL:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (_LSOpenConfiguration)openConfiguration
{
  return (_LSOpenConfiguration *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setOpenConfiguration:(id)a3
{
}

- (NSDictionary)browserState
{
  return (NSDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setBrowserState:(id)a3
{
}

- (BOOL)includeLinksForCallingApplication
{
  return self->_includeLinksForCallingApplication;
}

- (void)setIncludeLinksForCallingApplication:(BOOL)a3
{
  self->_includeLinksForCallingApplication = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 40) = 0;
  return self;
}

@end