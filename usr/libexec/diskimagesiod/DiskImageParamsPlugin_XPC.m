@interface DiskImageParamsPlugin_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isWritableFormat;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
@end

@implementation DiskImageParamsPlugin_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v3 = v2;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  id v4 = [v7 pluginHeader];
  v5 = operator new(0x110uLL);
  sub_100050554((uint64_t)v5, (uint64_t)v4);
  void *v3 = v5;

  return v6;
}

- (unint64_t)numBlocks
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  unint64_t v3 = (*(uint64_t (**)(void))(*(void *)[v2 pluginHeader] + 16))();

  return v3;
}

- (BOOL)isWritableFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end