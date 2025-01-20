@interface NSFileProviderPresenterInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithPresenterID:(id)a3 auditToken:(id *)a4 observedUbiquityAttributes:(id)a5;
- ($115C4C562B26FF47E01F9F4EA65B5887)presenterAuditToken;
- (NSFileProviderPresenterInfo)initWithCoder:(id)a3;
- (NSSet)observedUbiquityAttributes;
- (NSString)presenterID;
- (NSURL)changedURL;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setChangedURL:(id)a3;
@end

@implementation NSFileProviderPresenterInfo

+ (id)infoWithPresenterID:(id)a3 auditToken:(id *)a4 observedUbiquityAttributes:(id)a5
{
  v8 = objc_alloc_init(&OBJC_CLASS___NSFileProviderPresenterInfo);
  __int128 v9 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v8->presenterAuditToken.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v8->presenterAuditToken.val[4] = v9;
  v8->presenterID = (NSString *)[a3 copy];
  v8->observedUbiquityAttributes = (NSSet *)a5;
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileProviderPresenterInfo;
  -[NSFileProviderPresenterInfo dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a3 encodeBytes:&self->presenterAuditToken length:32 forKey:@"audittoken"];
    [a3 encodeObject:self->presenterID forKey:@"presenterid"];
    [a3 encodeObject:self->observedUbiquityAttributes forKey:@"ubiquityattrs"];
    [a3 encodeObject:self->changedURL forKey:@"newurl"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderPresenterInfo instances should only ever be encoded by XPC" userInfo:0]);
    -[NSFileProviderPresenterInfo initWithCoder:](v5, v6, v7);
  }

- (NSFileProviderPresenterInfo)initWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderPresenterInfo should only ever be decoded by XPC" userInfo:0]);
  }

  uint64_t v10 = 0LL;
  v5 = (_OWORD *)[a3 decodeBytesForKey:@"audittoken" returnedLength:&v10];
  if (v5 && v10 == 32)
  {
    __int128 v6 = v5[1];
    *(_OWORD *)self->presenterAuditToken.val = *v5;
    *(_OWORD *)&self->presenterAuditToken.val[4] = v6;
    self->presenterID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"presenterid"];
    id v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    self->observedUbiquityAttributes = (NSSet *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v7,  "setWithObjects:",  v8,  objc_opt_class(),  0),  @"ubiquityattrs");
    self->changedURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"newurl"];
  }

  else
  {

    v11 = @"NSDebugDescription";
    v12[0] = @"Audit token is missing or invalid";
    objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1)));
    return 0LL;
  }

  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)presenterAuditToken
{
  return result;
}

- (NSString)presenterID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSSet)observedUbiquityAttributes
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSURL)changedURL
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setChangedURL:(id)a3
{
}

@end