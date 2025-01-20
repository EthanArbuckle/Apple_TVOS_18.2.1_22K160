@interface NSFCGetFileProviderUIDFOrURL
@end

@implementation NSFCGetFileProviderUIDFOrURL

void *___NSFCGetFileProviderUIDFOrURL_block_invoke()
{
  result = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 256);
  if (result)
  {
    result = dlsym(result, "FPFetchDatalessFileResolverUIDAtURL");
    off_18C494AA8 = (uint64_t (*)(void, void, void))result;
  }

  return result;
}

@end