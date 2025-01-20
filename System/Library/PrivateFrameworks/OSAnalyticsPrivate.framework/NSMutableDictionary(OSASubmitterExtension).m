@interface NSMutableDictionary(OSASubmitterExtension)
- (void)_accumulateKey:()OSASubmitterExtension value:;
- (void)_recordRetirement:()OSASubmitterExtension reason:;
@end

@implementation NSMutableDictionary(OSASubmitterExtension)

- (void)_accumulateKey:()OSASubmitterExtension value:
{
  id v6 = a3;
  [a1 objectForKeyedSubscript:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x189607968];
  id v11 = v7;
  if (v7) {
    uint64_t v9 = (int)[v7 intValue];
  }
  else {
    uint64_t v9 = 0LL;
  }
  [v8 numberWithLong:v9 + a4];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v10 forKeyedSubscript:v6];
}

- (void)_recordRetirement:()OSASubmitterExtension reason:
{
  id v8 = a3;
  id v6 = a4;
  [a1 objectForKeyedSubscript:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    [a1 setObject:v7 forKeyedSubscript:v6];
  }

  [v7 _accumulateKey:v8 value:1];
}

@end