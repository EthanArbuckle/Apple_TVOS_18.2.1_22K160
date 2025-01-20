@interface FFDefaultBuildVersionGetter
- (id)getBuildVersion;
@end

@implementation FFDefaultBuildVersionGetter

- (id)getBuildVersion
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  memset(v4, 0, sizeof(v4));
  size_t v3 = 256LL;
  sysctlbyname("kern.osversion", v4, &v3, 0LL, 0LL);
  [NSString stringWithCString:v4 encoding:1];
  return (id)objc_claimAutoreleasedReturnValue();
}

@end