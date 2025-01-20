@interface NSURLProtectionSpace
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProxy;
- (BOOL)receivesCredentialSecurely;
- (NSArray)distinguishedNames;
- (NSInteger)port;
- (NSString)authenticationMethod;
- (NSString)description;
- (NSString)host;
- (NSString)protocol;
- (NSString)proxyType;
- (NSString)realm;
- (NSURLProtectionSpace)init;
- (NSURLProtectionSpace)initWithCoder:(id)a3;
- (NSURLProtectionSpace)initWithHost:(NSString *)host port:(NSInteger)port protocol:(NSString *)protocol realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod;
- (NSURLProtectionSpace)initWithProxyHost:(NSString *)host port:(NSInteger)port type:(NSString *)type realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod;
- (SecTrustRef)serverTrust;
- (_CFURLProtectionSpace)_CFURLProtectionSpace;
- (_CFURLProtectionSpace)_cfurlprtotectionspace;
- (id)_initWithCFURLProtectionSpace:(_CFURLProtectionSpace *)a3;
- (id)_initWithWebKitPropertyListData:(id)a3;
- (id)_webKitPropertyListData;
- (unint64_t)hash;
- (void)_setDistinguishedNames:(id)a3;
- (void)_setServerTrust:(__SecTrust *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLProtectionSpace

- (NSURLProtectionSpace)initWithHost:(NSString *)host port:(NSInteger)port protocol:(NSString *)protocol realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod
{
  if (!self) {
    return 0LL;
  }
  int v10 = port;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSURLProtectionSpace;
  v12 = -[NSURLProtectionSpace init](&v18, sel_init);
  if (!v12) {
    return 0LL;
  }
  v13 = v12;
  v12->_internal = 0LL;
  int v14 = authMethodToAuthScheme(authenticationMethod);
  if (protocol && !-[NSString isEqualToString:](protocol, "isEqualToString:", @"http"))
  {
    if (-[NSString isEqualToString:](protocol, "isEqualToString:", @"https"))
    {
      int v15 = 2;
    }

    else if (-[NSString isEqualToString:](protocol, "isEqualToString:", @"ftp"))
    {
      int v15 = 3;
    }

    else if (-[NSString isEqualToString:](protocol, "isEqualToString:", @"ftps"))
    {
      int v15 = 4;
    }

    else
    {
      int v15 = 1;
    }
  }

  else
  {
    int v15 = 1;
  }

  v16 = (const void *)CFURLProtectionSpaceCreate( 0LL,  (const __CFString *)host,  v10,  v15,  (const __CFString *)realm,  v14);
  v13->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(v16);
  return v13;
}

- (NSURLProtectionSpace)initWithProxyHost:(NSString *)host port:(NSInteger)port type:(NSString *)type realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod
{
  if (!self) {
    return 0LL;
  }
  int v10 = port;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSURLProtectionSpace;
  v12 = -[NSURLProtectionSpace init](&v18, sel_init);
  if (!v12) {
    return 0LL;
  }
  v13 = v12;
  v12->_internal = 0LL;
  int v14 = authMethodToAuthScheme(authenticationMethod);
  if (type && !-[NSString isEqualToString:](type, "isEqualToString:", @"http"))
  {
    if (-[NSString isEqualToString:](type, "isEqualToString:", @"https"))
    {
      int v15 = 6;
    }

    else if (-[NSString isEqualToString:](type, "isEqualToString:", @"ftp"))
    {
      int v15 = 7;
    }

    else if (-[NSString isEqualToString:](type, "isEqualToString:", @"SOCKS"))
    {
      int v15 = 8;
    }

    else
    {
      int v15 = 5;
    }
  }

  else
  {
    int v15 = 5;
  }

  v16 = (const void *)CFURLProtectionSpaceCreate( 0LL,  (const __CFString *)host,  v10,  v15,  (const __CFString *)realm,  v14);
  v13->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(v16);
  return v13;
}

- (id)_initWithCFURLProtectionSpace:(_CFURLProtectionSpace *)a3
{
  if (!self) {
    return 0LL;
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSURLProtectionSpace;
  v4 = -[NSURLProtectionSpace init](&v7, sel_init);
  if (!v4) {
    return 0LL;
  }
  v5 = v4;
  v4->_internal = 0LL;
  if (!a3)
  {

    return 0LL;
  }

  CFRetain(a3);
  v5->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(a3);
  return v5;
}

- (NSURLProtectionSpace)init
{
  return 0LL;
}

- (void)dealloc
{
  internal = self->_internal;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSURLProtectionSpace;
  -[NSURLProtectionSpace dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  v3 = (void *)NSString;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSURLProtectionSpace;
  objc_super v4 = -[NSURLProtectionSpace description](&v12, sel_description);
  v5 = -[NSURLProtectionSpace host](self, "host");
  v6 = -[NSURLProtectionSpace protocol](self, "protocol");
  objc_super v7 = -[NSURLProtectionSpace authenticationMethod](self, "authenticationMethod");
  v8 = -[NSURLProtectionSpace realm](self, "realm");
  NSInteger v9 = -[NSURLProtectionSpace port](self, "port");
  if (-[NSURLProtectionSpace isProxy](self, "isProxy")) {
    int v10 = @"YES";
  }
  else {
    int v10 = @"NO";
  }
  return (NSString *)[v3 stringWithFormat:@"%@: Host:%@, Server:%@, Auth-Scheme:%@, Realm:%@, Port:%ld, Proxy:%@, Proxy-Type:%@", v4, v5, v6, v7, v8, v9, v10, -[NSURLProtectionSpace proxyType](self, "proxyType")];
}

- (NSString)realm
{
  internal = self->_internal;
  v3 = (id *)((char *)internal + 16);
  return (NSString *)v3[6];
}

- (BOOL)receivesCredentialSecurely
{
  return CFURLProtectionSpaceReceivesCredentialSecurely((uint64_t)self->_internal) != 0;
}

- (BOOL)isProxy
{
  return CFURLProtectionSpaceIsProxy((uint64_t)self->_internal);
}

- (NSString)host
{
  internal = self->_internal;
  v3 = (id *)((char *)internal + 16);
  return (NSString *)v3[4];
}

- (NSInteger)port
{
  internal = self->_internal;
  v3 = (char *)internal + 16;
  return *((int *)v3 + 10);
}

- (NSString)proxyType
{
  internal = self->_internal;
  result = 0LL;
  v5 = (char *)internal + 16;
  unsigned int v6 = *((_DWORD *)v5 + 11) - 1;
  if (v6 <= 7) {
    return &off_189C03798[v6]->isa;
  }
  return result;
}

- (unint64_t)hash
{
  return CFHash(self->_internal);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(internal) = 1;
  }

  else
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    internal = self->_internal;
    unsigned int v6 = (const void *)*((void *)a3 + 1);
    if (!v6)
    {
LABEL_6:
      LOBYTE(internal) = 0;
      return (char)internal;
    }

    LOBYTE(internal) = CFEqual(internal, v6) != 0;
  }

  return (char)internal;
}

- (NSString)authenticationMethod
{
  internal = self->_internal;
  v3 = (char *)internal + 16;
  unsigned int v4 = *((_DWORD *)v3 + 14) - 2;
  if (v4 > 0xA) {
    return (NSString *)@"NSURLAuthenticationMethodDefault";
  }
  else {
    return &off_189C03740[v4]->isa;
  }
}

- (NSArray)distinguishedNames
{
  internal = self->_internal;
  v3 = (char *)internal + 16;
  return (NSArray *)*((void *)v3 + 8);
}

- (void)_setDistinguishedNames:(id)a3
{
  internal = self->_internal;
  else {
    v5 = 0LL;
  }
  URLProtectionSpace::setDistinguishedNames(v5, a3);
}

- (SecTrustRef)serverTrust
{
  internal = self->_internal;
  v3 = (char *)internal + 16;
  return (SecTrustRef)*((void *)v3 + 9);
}

- (void)_setServerTrust:(__SecTrust *)a3
{
  internal = self->_internal;
  else {
    v5 = 0LL;
  }
  unsigned int v6 = (__SecTrust *)*((void *)v5 + 9);
  if (v6 != a3)
  {
    if (v6) {
      CFRelease(v6);
    }
    if (a3) {
      CFTypeRef v7 = CFRetain(a3);
    }
    else {
      CFTypeRef v7 = 0LL;
    }
    *((void *)v5 + 9) = v7;
  }

- (NSString)protocol
{
  internal = self->_internal;
  result = 0LL;
  unsigned int v4 = (char *)internal + 16;
  unsigned int v5 = *((_DWORD *)v4 + 11) - 1;
  if (v5 <= 7) {
    return &off_189C03798[v5]->isa;
  }
  return result;
}

- (_CFURLProtectionSpace)_cfurlprtotectionspace
{
  return (_CFURLProtectionSpace *)self->_internal;
}

- (_CFURLProtectionSpace)_CFURLProtectionSpace
{
  return (_CFURLProtectionSpace *)self->_internal;
}

- (void)encodeWithCoder:(id)a3
{
  CFTypeRef Archive = _CFURLProtectionSpaceCreateArchive( (const __CFAllocator *)*MEMORY[0x189604DB0],  (uint64_t)-[NSURLProtectionSpace _cfurlprtotectionspace](self, "_cfurlprtotectionspace"));
  if (Archive)
  {
    unsigned int v5 = Archive;
    else {
      [a3 encodeObject:v5];
    }
    CFRelease(v5);
  }

- (NSURLProtectionSpace)initWithCoder:(id)a3
{
  if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_super v18 = (void *)MEMORY[0x189604010];
    uint64_t v17 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = (const void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v18,  "setWithObjects:",  v17,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  objc_opt_class(),  0),  @"__nsurlprotectionspace_proto_plist");
  }

  else
  {
    v13 = (const void *)[a3 decodeObject];
  }

  if (!v13) {
    return (NSURLProtectionSpace *)-[NSURLProtectionSpace _initWithCFURLProtectionSpace:]( self,  "_initWithCFURLProtectionSpace:",  0LL);
  }
  int v14 = (const void *)_CFURLProtectionSpaceCreateFromArchive((const __CFAllocator *)*MEMORY[0x189604DB0], v13);
  int v15 = -[NSURLProtectionSpace _initWithCFURLProtectionSpace:](self, "_initWithCFURLProtectionSpace:", v14);
  if (v14) {
    CFRelease(v14);
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_webKitPropertyListData
{
  v3 = (void *)[MEMORY[0x189603FC8] dictionaryWithCapacity:6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace host](self, "host"), @"host");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[NSURLProtectionSpace port](self, "port")),  @"port");
  unsigned int v4 = (void *)MEMORY[0x189607968];
  internal = self->_internal;
  uint64_t v6 = (char *)internal + 16;
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(v4, "numberWithInt:", *((unsigned int *)v6 + 11)),  @"type");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace realm](self, "realm"), @"realm");
  uint64_t v7 = (void *)MEMORY[0x189607968];
  uint64_t v8 = self->_internal;
  uint64_t v9 = (char *)v8 + 16;
  if (!v8) {
    uint64_t v9 = 0LL;
  }
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(v7, "numberWithInt:", *((unsigned int *)v9 + 14)),  @"scheme");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  -[NSURLProtectionSpace distinguishedNames](self, "distinguishedNames"),  @"distnames");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  -[NSURLProtectionSpace serverTrust](self, "serverTrust"),  @"trust");
  return v3;
}

- (id)_initWithWebKitPropertyListData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (const __CFString *)[a3 objectForKeyedSubscript:@"host"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }

  uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"port"];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }

  uint64_t v7 = [a3 objectForKeyedSubscript:@"type"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }

  uint64_t v8 = (const __CFString *)[a3 objectForKeyedSubscript:@"realm"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }

  uint64_t v9 = [a3 objectForKeyedSubscript:@"scheme"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }

  uint64_t v10 = (void *)[a3 objectForKeyedSubscript:@"distnames"];
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }

  v21 = (void *)v9;
  v22 = (void *)v7;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
LABEL_15:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v10);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_26;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v12) {
          goto LABEL_15;
        }
        break;
      }
    }
  }

  int v15 = (const void *)[a3 objectForKeyedSubscript:@"trust"];
  v16 = v15;
  if (v15)
  {
    CFTypeID v17 = CFGetTypeID(v15);
    if (v17 != SecTrustGetTypeID())
    {
LABEL_26:

      return 0LL;
    }
  }

  if (!self) {
    return 0LL;
  }
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NSURLProtectionSpace;
  objc_super v18 = -[NSURLProtectionSpace init](&v27, sel_init);
  if (!v18) {
    return 0LL;
  }
  v19 = v18;
  v18->_internal = 0LL;
  v18->_internal = (NSURLProtectionSpaceInternal *)CFURLProtectionSpaceCreate( *MEMORY[0x189604DB0],  v5,  [v6 intValue],  objc_msgSend(v22, "intValue"),  v8,  objc_msgSend(v21, "intValue"));
  -[NSURLProtectionSpace _setDistinguishedNames:](v19, "_setDistinguishedNames:", v10);
  -[NSURLProtectionSpace _setServerTrust:](v19, "_setServerTrust:", v16);
  return v19;
}

@end