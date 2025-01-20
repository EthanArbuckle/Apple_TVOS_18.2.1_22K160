@interface RBSAppNapEnableGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
@end

@implementation RBSAppNapEnableGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v21[2] = *MEMORY[0x1895F89C0];
  if ([a3 targetIsSystem])
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x189607870];
      uint64_t v7 = *MEMORY[0x1896123E0];
      uint64_t v8 = *MEMORY[0x1896075F0];
      v21[0] = @"Attribute is not applicable to system target";
      uint64_t v9 = *MEMORY[0x1896123D8];
      v20[0] = v8;
      v20[1] = v9;
      [a1 description];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v10;
      v11 = (void *)MEMORY[0x189603F68];
      v12 = v21;
      v13 = v20;
LABEL_6:
      [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 errorWithDomain:v7 code:2 userInfo:v16];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else if (a4)
  {
    v6 = (void *)MEMORY[0x189607870];
    uint64_t v7 = *MEMORY[0x1896123E0];
    uint64_t v14 = *MEMORY[0x1896075F0];
    v19[0] = @"AppNap attributes not supported on non-macOS platforms";
    uint64_t v15 = *MEMORY[0x1896123D8];
    v18[0] = v14;
    v18[1] = v15;
    [a1 description];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    v11 = (void *)MEMORY[0x189603F68];
    v12 = v19;
    v13 = v18;
    goto LABEL_6;
  }

  return 0LL;
}

@end