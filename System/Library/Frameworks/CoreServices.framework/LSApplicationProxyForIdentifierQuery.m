@interface LSApplicationProxyForIdentifierQuery
@end

@implementation LSApplicationProxyForIdentifierQuery

void __71___LSApplicationProxyForIdentifierQuery_alwaysAllowedBundleIdentifiers__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v1 = [v0 initWithArray:MEMORY[0x189604A58]];
  v2 = (void *)+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result;
  +[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result = v1;
}

@end