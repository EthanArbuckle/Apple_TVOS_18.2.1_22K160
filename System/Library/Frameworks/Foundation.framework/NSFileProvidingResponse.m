@interface NSFileProvidingResponse
+ (BOOL)supportsSecureCoding;
+ (id)responseWithError:(id)a3;
- (NSError)error;
- (NSFileProvidingResponse)initWithCoder:(id)a3;
- (NSString)sandboxToken;
- (unint64_t)providedItemRecursiveGenerationCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setProvidedItemRecursiveGenerationCount:(unint64_t)a3;
- (void)setSandboxToken:(id)a3;
@end

@implementation NSFileProvidingResponse

+ (id)responseWithError:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSFileProvidingResponse);
  v4->error = (NSError *)a3;
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileProvidingResponse;
  -[NSFileProvidingResponse dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  self->providedItemRecursiveGenerationCount),  @"gencount");
    [a3 encodeObject:self->error forKey:@"error"];
    [a3 encodeObject:self->sandboxToken forKey:@"sandboxtoken"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProvidingResponse instances should only ever be encoded by XPC" userInfo:0]);
    -[NSFileProvidingResponse initWithCoder:](v5, v6, v7);
  }

- (NSFileProvidingResponse)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->providedItemRecursiveGenerationCount = objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"gencount"),  "unsignedIntegerValue");
    self->error = (NSError *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    self->sandboxToken = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxtoken"];
    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProvidingResponse should only ever be decoded by XPC" userInfo:0]);
    return (NSFileProvidingResponse *)-[NSFileProvidingResponse providedItemRecursiveGenerationCount](v6, v7);
  }

- (unint64_t)providedItemRecursiveGenerationCount
{
  return self->providedItemRecursiveGenerationCount;
}

- (void)setProvidedItemRecursiveGenerationCount:(unint64_t)a3
{
  self->providedItemRecursiveGenerationCount = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)sandboxToken
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSandboxToken:(id)a3
{
}

@end