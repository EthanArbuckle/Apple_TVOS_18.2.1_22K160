@interface NSFileProvidingInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithReaderID:(id)a3 options:(unint64_t)a4 auditToken:(id *)a5 kernelMaterializationInfo:(id)a6;
- ($115C4C562B26FF47E01F9F4EA65B5887)readerAuditToken;
- (NSFileProviderKernelMaterializationInfo)kernelMaterializationInfo;
- (NSFileProvidingInfo)initWithCoder:(id)a3;
- (NSString)readerID;
- (unint64_t)readingOptions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setProvidedItemRecursiveGenerationCount:(unint64_t)a3;
@end

@implementation NSFileProvidingInfo

+ (id)infoWithReaderID:(id)a3 options:(unint64_t)a4 auditToken:(id *)a5 kernelMaterializationInfo:(id)a6
{
  int v8 = a4;
  v10 = objc_alloc_init(&OBJC_CLASS___NSFileProvidingInfo);
  __int128 v11 = *(_OWORD *)&a5->var0[4];
  *(_OWORD *)v10->readerAuditToken.val = *(_OWORD *)a5->var0;
  *(_OWORD *)&v10->readerAuditToken.val[4] = v11;
  v10->readerID = (NSString *)[a3 copy];
  v10->readingOptions = v8 & 0x7FFFFFFF;
  v10->kernelMaterializationInfo = (NSFileProviderKernelMaterializationInfo *)a6;
  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileProvidingInfo;
  -[NSFileProvidingInfo dealloc](&v3, sel_dealloc);
}

- (void)setProvidedItemRecursiveGenerationCount:(unint64_t)a3
{
  self->recursiveGenerationCount = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a3 encodeBytes:&self->readerAuditToken length:32 forKey:@"audittoken"];
    [a3 encodeObject:self->readerID forKey:@"readerid"];
    objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->readingOptions),  @"options");
    [a3 encodeObject:self->kernelMaterializationInfo forKey:@"kernmatinfo"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProvidingInfo instances should only ever be encoded by XPC" userInfo:0]);
    -[NSFileProvidingInfo initWithCoder:](v5, v6, v7);
  }

- (NSFileProvidingInfo)initWithCoder:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProvidingInfo should only ever be decoded by XPC" userInfo:0]);
  }

  uint64_t v8 = 0LL;
  v5 = (__int128 *)[a3 decodeBytesForKey:@"audittoken" returnedLength:&v8];
  if (v5 && v8 == 32)
  {
    __int128 v6 = *v5;
    *(_OWORD *)&self->readerAuditToken.val[4] = v5[1];
    *(_OWORD *)self->readerAuditToken.val = v6;
    self->readerID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"readerid"];
    self->readingOptions = objc_msgSend( (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"options"),  "unsignedIntegerValue");
    self->kernelMaterializationInfo = (NSFileProviderKernelMaterializationInfo *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kernmatinfo"];
  }

  else
  {

    v9 = @"NSDebugDescription";
    v10[0] = @"Audit token is missing or invalid";
    objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
    return 0LL;
  }

  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)readerAuditToken
{
  return result;
}

- (NSString)readerID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (unint64_t)readingOptions
{
  return self->readingOptions;
}

- (NSFileProviderKernelMaterializationInfo)kernelMaterializationInfo
{
  return (NSFileProviderKernelMaterializationInfo *)objc_getProperty(self, a2, 32LL, 1);
}

@end