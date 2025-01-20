@interface NSFileProviderMovingInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithDestinationDirectoryURL:(id)a3;
- (NSFileProviderMovingInfo)initWithCoder:(id)a3;
- (NSURL)destinationDirectoryURL;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFileProviderMovingInfo

+ (id)infoWithDestinationDirectoryURL:(id)a3
{
  v4 = (void *)objc_opt_new();
  v4[1] = a3;
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileProviderMovingInfo;
  -[NSFileProviderMovingInfo dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a3 encodeObject:self->destinationDirectoryURL forKey:@"destinationDirectoryURL"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderMovingInfo instances should only ever be encoded by XPC" userInfo:0]);
    -[NSFileProviderMovingInfo initWithCoder:](v5, v6, v7);
  }

- (NSFileProviderMovingInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->destinationDirectoryURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"destinationDirectoryURL"];
    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileProviderMovingInfo should only ever be decoded by XPC" userInfo:0]);
    return (NSFileProviderMovingInfo *)-[NSFileProviderMovingInfo destinationDirectoryURL](v6, v7);
  }

- (NSURL)destinationDirectoryURL
{
  return self->destinationDirectoryURL;
}

@end