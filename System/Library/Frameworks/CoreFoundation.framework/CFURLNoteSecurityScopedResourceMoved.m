@interface CFURLNoteSecurityScopedResourceMoved
@end

@implementation CFURLNoteSecurityScopedResourceMoved

void *___CFURLNoteSecurityScopedResourceMoved_block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/CoreServicesInternal.framework/CoreServicesInternal", 256);
  if (result)
  {
    result = dlsym(result, "_FSURLNoteSecurityScopedResourceMovedWithFileIdentifier");
    _CFURLNoteSecurityScopedResourceMoved__NS_FSURLNoteSecurityScopedResourceMovedWithFileIdentifier = (uint64_t (*)(void, void, void, void))result;
  }

  return result;
}

@end