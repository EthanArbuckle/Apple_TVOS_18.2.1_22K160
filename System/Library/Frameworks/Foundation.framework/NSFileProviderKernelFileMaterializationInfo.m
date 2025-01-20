@interface NSFileProviderKernelFileMaterializationInfo
+ (BOOL)supportsSecureCoding;
- (NSFileProviderKernelFileMaterializationInfo)initWithCoder:(id)a3;
- (NSFileProviderKernelFileMaterializationInfo)initWithSize:(int64_t)a3 offset:(int64_t)a4;
- (int64_t)offset;
- (int64_t)size;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFileProviderKernelFileMaterializationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKernelFileMaterializationInfo)initWithSize:(int64_t)a3 offset:(int64_t)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSFileProviderKernelFileMaterializationInfo;
  result = -[NSFileProviderKernelFileMaterializationInfo init](&v7, sel_init);
  if (result)
  {
    result->size = a3;
    result->offset = a4;
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a3 encodeInt64:self->size forKey:@"NSSize"];
    [a3 encodeInt64:self->offset forKey:@"NSOffset"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderKernelFileMaterializationInfo instances should only ever be encoded by XPC" userInfo:0]);
    -[NSFileProviderKernelFileMaterializationInfo initWithCoder:](v5, v6, v7);
  }

- (NSFileProviderKernelFileMaterializationInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->size = [a3 decodeInt64ForKey:@"NSSize"];
    self->offset = [a3 decodeInt64ForKey:@"NSOffset"];
    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderKernelFileMaterializationInfo should only ever be decoded by XPC" userInfo:0]);
    return (NSFileProviderKernelFileMaterializationInfo *)-[NSFileProviderKernelFileMaterializationInfo size](v6, v7);
  }

- (int64_t)size
{
  return self->size;
}

- (int64_t)offset
{
  return self->offset;
}

@end