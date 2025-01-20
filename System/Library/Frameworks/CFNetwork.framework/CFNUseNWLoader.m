@interface CFNUseNWLoader
@end

@implementation CFNUseNWLoader

void ____CFNUseNWLoader_block_invoke()
{
  v0 = getenv("CFN_USE_NW_LOADER");
  if (v0)
  {
    v1 = v0;
    if (!strcmp(v0, "1")) {
      __CFNUseNWLoader::useNWLoader = 1;
    }
    if (!strcmp(v1, "0")) {
      __CFNUseNWLoader::useNWLoader = 2;
    }
  }

  if (__CFNIsInDevelopmentEnvironment::onceToken != -1) {
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_21_4739);
  }
  if (__CFNIsInDevelopmentEnvironment::ok)
  {
    uint64_t v2 = objc_msgSend( (id)objc_msgSend(MEMORY[0x1896077F8], "bundleWithIdentifier:", @"com.apple.CFNetwork"),  "URLForResource:withExtension:",  @"ForceNWLoader",  @"plist");
    if (v2)
    {
      v3 = (void *)[MEMORY[0x189603F68] dictionaryWithContentsOfURL:v2];
      v4 = (void *)objc_msgSend( v3,  "objectForKeyedSubscript:",  objc_msgSend(NSString, "stringWithUTF8String:", *(void *)_CFGetProgname()));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        else {
          int v5 = 2;
        }
        __CFNUseNWLoader::useNWLoader = v5;
      }
    }
  }

@end