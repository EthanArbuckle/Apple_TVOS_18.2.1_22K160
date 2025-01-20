@interface NSError(OSAXformAugment)
- (id)augmentWithPrefix:()OSAXformAugment;
@end

@implementation NSError(OSAXformAugment)

- (id)augmentWithPrefix:()OSAXformAugment
{
  v15[1] = *MEMORY[0x1895F89C0];
  v4 = (void *)MEMORY[0x189607870];
  id v5 = a3;
  [a1 domain];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [a1 code];
  uint64_t v14 = *MEMORY[0x1896075E0];
  v8 = (void *)NSString;
  [a1 localizedDescription];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"%@: %@", v5, v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 errorWithDomain:v6 code:v7 userInfo:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end