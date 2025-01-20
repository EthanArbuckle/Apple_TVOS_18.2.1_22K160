@interface UTTypeIsDenylistedForBinding
@end

@implementation UTTypeIsDenylistedForBinding

void ___UTTypeIsDenylistedForBinding_block_invoke()
{
  v3[4] = *MEMORY[0x1895F89C0];
  v3[0] = @"com.apple.mobileconfig";
  v3[1] = @"com.apple.mobileprovision";
  v3[2] = @"public.x509-certificate";
  v3[3] = @"com.rsa.pkcs-12";
  [MEMORY[0x189603F18] arrayWithObjects:v3 count:4];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [MEMORY[0x189604010] setWithArray:v0];
  v2 = (void *)_UTTypeIsDenylistedForBinding::denyListedTypes;
  _UTTypeIsDenylistedForBinding::denyListedTypes = v1;
}

@end