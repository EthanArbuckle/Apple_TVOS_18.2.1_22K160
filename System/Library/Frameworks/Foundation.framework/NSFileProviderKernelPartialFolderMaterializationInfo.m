@interface NSFileProviderKernelPartialFolderMaterializationInfo
+ (BOOL)supportsSecureCoding;
- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithCoder:(id)a3;
- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithFileName:(id)a3;
- (NSString)fileName;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFileProviderKernelPartialFolderMaterializationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithFileName:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileProviderKernelPartialFolderMaterializationInfo;
  v4 = -[NSFileProviderKernelPartialFolderMaterializationInfo init](&v6, sel_init);
  if (v4) {
    v4->fileName = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileProviderKernelPartialFolderMaterializationInfo;
  -[NSFileProviderKernelPartialFolderMaterializationInfo dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a3 encodeObject:self->fileName forKey:@"filename"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderKernelPartialFolderMaterializationInfo instances should only ever be encoded by XPC" userInfo:0]);
    -[NSFileProviderKernelPartialFolderMaterializationInfo initWithCoder:](v5, v6, v7);
  }

- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->fileName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"filename"];
    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderKernelPartialFolderMaterializationInfo should only ever be decoded by XPC" userInfo:0]);
    return (NSFileProviderKernelPartialFolderMaterializationInfo *)-[NSFileProviderKernelPartialFolderMaterializationInfo fileName]( v6,  v7);
  }

- (NSString)fileName
{
  return self->fileName;
}

@end