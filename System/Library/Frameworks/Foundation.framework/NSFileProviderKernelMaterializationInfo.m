@interface NSFileProviderKernelMaterializationInfo
+ (BOOL)supportsSecureCoding;
+ (NSFileProviderKernelMaterializationInfo)kernelMaterializationInfoWithOperation:(unsigned int)a3;
+ (id)fileMaterializationInfoWithOperation:(unsigned int)a3 size:(int64_t)a4 offset:(int64_t)a5;
+ (id)partialFolderMaterializationInfoWithOperation:(unsigned int)a3 fileName:(const char *)a4;
- (NSFileProviderKernelFileMaterializationInfo)fileMaterializationInfo;
- (NSFileProviderKernelMaterializationInfo)initWithCoder:(id)a3;
- (NSFileProviderKernelPartialFolderMaterializationInfo)partialFolderMaterializationInfo;
- (unsigned)operation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFileProviderKernelMaterializationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSFileProviderKernelMaterializationInfo)kernelMaterializationInfoWithOperation:(unsigned int)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSFileProviderKernelMaterializationInfo);
  v4->operation = a3;
  return v4;
}

+ (id)fileMaterializationInfoWithOperation:(unsigned int)a3 size:(int64_t)a4 offset:(int64_t)a5
{
  v8 = objc_alloc_init(&OBJC_CLASS___NSFileProviderKernelMaterializationInfo);
  v8->operation = a3;
  v8->fileMaterializationInfo = -[NSFileProviderKernelFileMaterializationInfo initWithSize:offset:]( objc_alloc(&OBJC_CLASS___NSFileProviderKernelFileMaterializationInfo),  "initWithSize:offset:",  a4,  a5);
  return v8;
}

+ (id)partialFolderMaterializationInfoWithOperation:(unsigned int)a3 fileName:(const char *)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___NSFileProviderKernelMaterializationInfo);
  v6->operation = a3;
  v6->partialFolderMaterializationInfo = -[NSFileProviderKernelPartialFolderMaterializationInfo initWithFileName:]( objc_alloc(&OBJC_CLASS___NSFileProviderKernelPartialFolderMaterializationInfo),  "initWithFileName:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  a4));
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileProviderKernelMaterializationInfo;
  -[NSFileProviderKernelMaterializationInfo dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->operation),  @"fileop");
    [a3 encodeObject:self->fileMaterializationInfo forKey:@"fileinfo"];
    [a3 encodeObject:self->partialFolderMaterializationInfo forKey:@"folderinfo"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderKernelMaterializationInfo instances should only ever be encoded by XPC" userInfo:0]);
    -[NSFileProviderKernelMaterializationInfo initWithCoder:](v5, v6, v7);
  }

- (NSFileProviderKernelMaterializationInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->operation = objc_msgSend( (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"fileop"),  "unsignedIntValue");
    self->fileMaterializationInfo = (NSFileProviderKernelFileMaterializationInfo *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"fileinfo"];
    self->partialFolderMaterializationInfo = (NSFileProviderKernelPartialFolderMaterializationInfo *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"folderinfo"];
    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderKernelMaterializationInfo should only ever be decoded by XPC" userInfo:0]);
    return (NSFileProviderKernelMaterializationInfo *)-[NSFileProviderKernelMaterializationInfo operation](v6, v7);
  }

- (unsigned)operation
{
  return self->operation;
}

- (NSFileProviderKernelFileMaterializationInfo)fileMaterializationInfo
{
  return self->fileMaterializationInfo;
}

- (NSFileProviderKernelPartialFolderMaterializationInfo)partialFolderMaterializationInfo
{
  return self->partialFolderMaterializationInfo;
}

@end