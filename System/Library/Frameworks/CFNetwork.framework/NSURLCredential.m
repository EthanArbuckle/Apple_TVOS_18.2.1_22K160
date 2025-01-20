@interface NSURLCredential
+ (BOOL)supportsSecureCoding;
+ (NSURLCredential)credentialForTrust:(SecTrustRef)trust;
+ (NSURLCredential)credentialWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence;
+ (NSURLCredential)credentialWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence;
- (BOOL)_hasSWCACreatorAttribute;
- (BOOL)hasPassword;
- (BOOL)isEqual:(id)a3;
- (NSArray)certificates;
- (NSString)password;
- (NSString)user;
- (NSURLCredential)initWithCoder:(id)a3;
- (NSURLCredential)initWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence;
- (NSURLCredential)initWithTrust:(SecTrustRef)trust;
- (NSURLCredential)initWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence;
- (NSURLCredentialPersistence)persistence;
- (SecIdentityRef)identity;
- (_CFURLCredential)_CFURLCredential;
- (_CFURLCredential)_cfurlcredential;
- (id)_initWithCFURLCredential:(_CFURLCredential *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_removeSWCACreatorAttribute;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLCredential

- (NSURLCredential)initWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence
{
  int v5 = persistence;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSURLCredential;
  v9 = -[NSURLCredential init](&v13, sel_init);
  if (v9)
  {
    v10 = (const void *)CFURLCredentialCreate( *MEMORY[0x189604DB0],  (const __CFString *)user,  (const __CFString *)password,  v8,  v5 + 1);
    v11 = (NSURLCredentialInternal *)CFMakeCollectable(v10);
    v9->_internal = v11;
    if (!v11)
    {

      return 0LL;
    }
  }

  return v9;
}

- (id)_initWithCFURLCredential:(_CFURLCredential *)a3
{
  v3 = self;
  self->_internal = (NSURLCredentialInternal *)a3;
  if (a3)
  {
    CFRetain(a3);
    CFMakeCollectable(a3);
  }

  else
  {

    return 0LL;
  }

  return v3;
}

- (NSURLCredential)initWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence
{
  int v5 = persistence;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSURLCredential;
  uint64_t v8 = -[NSURLCredential init](&v12, sel_init);
  if (v8)
  {
    v9 = (const void *)CFURLCredentialCreateWithIdentityAndCertificateArray( *MEMORY[0x189604DB0],  identity,  (const __CFArray *)certArray,  v5 + 1);
    v10 = (NSURLCredentialInternal *)CFMakeCollectable(v9);
    v8->_internal = v10;
    if (!v10)
    {

      return 0LL;
    }
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLCredential;
  -[NSURLCredential dealloc](&v3, sel_dealloc);
}

- (_CFURLCredential)_cfurlcredential
{
  return (_CFURLCredential *)self->_internal;
}

- (_CFURLCredential)_CFURLCredential
{
  return (_CFURLCredential *)self->_internal;
}

- (NSString)user
{
  return (NSString *)(id)CFURLCredentialGetUsername((uint64_t)self->_internal);
}

- (NSString)password
{
  v2 = (void *)URLCredential_PasswordBased::safelyCast((uint64_t)self->_internal, (const _CFURLCredential *)a2);
  if (v2) {
    v2 = (void *)(*(uint64_t (**)(void *))(*(void *)v2 + 128LL))(v2);
  }
  return (NSString *)v2;
}

- (BOOL)hasPassword
{
  uint64_t v2 = URLCredential_PasswordBased::safelyCast((uint64_t)self->_internal, (const _CFURLCredential *)a2);
  if (v2) {
    LOBYTE(v2) = (*(unsigned int (**)(uint64_t))(*(void *)v2 + 136LL))(v2) != 0;
  }
  return v2;
}

- (NSURLCredentialPersistence)persistence
{
  internal = self->_internal;
  objc_super v3 = (char *)internal + 16;
  return *((int *)v3 + 9) - 1LL;
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSURLCredential;
  id v4 = -[NSURLCredential description](&v6, sel_description);
  return (id)[v3 stringWithFormat:@"%@: %@", v4, CFURLCredentialGetUsername((uint64_t)self->_internal)];
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
    objc_super v6 = (const void *)*((void *)a3 + 1);
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

- (SecIdentityRef)identity
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (NSArray)certificates
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (NSURLCredential)initWithTrust:(SecTrustRef)trust
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSURLCredential;
  id v4 = -[NSURLCredential init](&v8, sel_init);
  if (v4)
  {
    int v5 = (const void *)CFURLCredentialCreateWithTrust(*MEMORY[0x189604DB0], trust);
    objc_super v6 = (NSURLCredentialInternal *)CFMakeCollectable(v5);
    v4->_internal = v6;
    if (!v6)
    {

      return 0LL;
    }
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  CFTypeRef Archive = _CFURLCredentialCreateArchive((CFAllocatorRef)*MEMORY[0x189604DB0], (uint64_t)self->_internal);
  if (Archive)
  {
    int v5 = Archive;
    else {
      [a3 encodeObject:v5];
    }
    CFRelease(v5);
  }

- (NSURLCredential)initWithCoder:(id)a3
{
  if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v21 = (void *)MEMORY[0x189604010];
    uint64_t v20 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    objc_super v13 = (const __CFDictionary *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v21,  "setWithObjects:",  v20,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  objc_opt_class(),  0),  @"__nsurlcredential_proto_plist");
  }

  else
  {
    objc_super v13 = (const __CFDictionary *)[a3 decodeObject];
  }

  if (!v13) {
    return (NSURLCredential *)-[NSURLCredential _initWithCFURLCredential:](self, "_initWithCFURLCredential:", 0LL);
  }
  v15 = URLCredential::createFromPropertyList((URLCredential *)*MEMORY[0x189604DB0], v13, v14);
  v16 = v15;
  if (v15) {
    v17 = v15 - 2;
  }
  else {
    v17 = 0LL;
  }
  v18 = -[NSURLCredential _initWithCFURLCredential:](self, "_initWithCFURLCredential:", v17);
  if (v16) {
    CFRelease(v17);
  }
  return v18;
}

- (BOOL)_hasSWCACreatorAttribute
{
  internal = self->_internal;
}

- (void)_removeSWCACreatorAttribute
{
  internal = self->_internal;
  if (internal)
  {
    if (!*((_DWORD *)internal + 12))
    {
      if (URLCredentialInternetPassword::containsSWCACreator(*((const __CFDictionary **)internal + 12)))
      {
        objc_super v3 = CFGetAllocator(internal);
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v3, 0LL, *((CFDictionaryRef *)internal + 12));
        if (MutableCopy)
        {
          uint64_t v5 = MutableCopy;
          uint64_t v6 = (const void *)*MEMORY[0x18960B910];
          AutoScalar::AutoScalar((AutoScalar *)&v9, 0LL);
          CFDictionarySetValue(v5, v6, value);
          uint64_t v9 = off_189C04A90;
          if (value) {
            CFRelease(value);
          }
          uint64_t v7 = (const void *)*((void *)internal + 12);
          if (v7) {
            CFRelease(v7);
          }
          uint64_t v8 = CFGetAllocator(internal);
          *((void *)internal + 12) = CFDictionaryCreateCopy(v8, v5);
          CFRelease(v5);
        }
      }
    }
  }

+ (NSURLCredential)credentialWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence
{
  return  -[NSURLCredential initWithUser:password:persistence:]( objc_alloc(&OBJC_CLASS___NSURLCredential),  "initWithUser:password:persistence:",  user,  password,  persistence);
}

+ (NSURLCredential)credentialWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence
{
  return  -[NSURLCredential initWithIdentity:certificates:persistence:]( objc_alloc(&OBJC_CLASS___NSURLCredential),  "initWithIdentity:certificates:persistence:",  identity,  certArray,  persistence);
}

+ (NSURLCredential)credentialForTrust:(SecTrustRef)trust
{
  return -[NSURLCredential initWithTrust:](objc_alloc(&OBJC_CLASS___NSURLCredential), "initWithTrust:", trust);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end