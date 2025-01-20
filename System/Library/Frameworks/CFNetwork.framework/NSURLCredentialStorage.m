@interface NSURLCredentialStorage
+ (NSURLCredentialStorage)sharedCredentialStorage;
@end

@implementation NSURLCredentialStorage

+ (NSURLCredentialStorage)sharedCredentialStorage
{
  if (+[NSURLCredentialStorage sharedCredentialStorage]::sOnce != -1) {
    dispatch_once(&+[NSURLCredentialStorage sharedCredentialStorage]::sOnce, &__block_literal_global_14451);
  }
  return (NSURLCredentialStorage *)+[NSURLCredentialStorage sharedCredentialStorage]::sStorage;
}

@end