@interface NSArray(ZhuGe)
+ (id)arrayFromShellCommandString:()ZhuGe;
+ (id)graphicInfoArrayFromArray:()ZhuGe;
@end

@implementation NSArray(ZhuGe)

+ (id)graphicInfoArrayFromArray:()ZhuGe
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v3)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v17 = [v13 objectForKeyedSubscript:@"sppci_model"];
            if (!v17)
            {
              ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m",  "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]",  33LL,  @"One graphic in graphics array does not contain \"sppci_model\"",  v18,  v19,  v20,  v25);

              v23 = 0LL;
              goto LABEL_16;
            }

            v21 = (void *)v17;
            v30[0] = @"Chipset Model";
            v30[1] = @"Device ID";
            v31[0] = v17;
            v31[1] = &stru_18A34F890;
            v30[2] = @"VRAM Size";
            v30[3] = @"ROM Revision";
            v31[2] = &stru_18A34F890;
            v31[3] = &stru_18A34F890;
            v30[4] = @"VBIOS Version";
            v30[5] = @"Option ROM Version";
            v31[4] = &stru_18A34F890;
            v31[5] = &stru_18A34F890;
            [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:6];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v7 addObject:v22];
          }

          else
          {
            ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m",  "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]",  27LL,  @"One graphic in graphics array is not a dictionary, ignore it.",  v14,  v15,  v16,  v25);
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    [MEMORY[0x189603F18] arrayWithArray:v7];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m",  "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]",  20LL,  @"graphicsArray pointer is nil!",  v4,  v5,  v6,  v25);
    v23 = 0LL;
  }

+ (id)arrayFromShellCommandString:()ZhuGe
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!v3)
  {
    id v25 = 0LL;
    goto LABEL_45;
  }

  id v27 = v3;
  uint64_t v5 = (const char *)[v3 UTF8String];
  int64_t v6 = strlen(v5);
  if (v6 < 1)
  {
LABEL_42:
    id v25 = v4;
    goto LABEL_43;
  }

  int v10 = 0;
  unint64_t v11 = (unint64_t)&v5[v6];
  __int128 v28 = &v5[v6];
  while (*v5 == 32)
  {
    v12 = v5;
LABEL_41:
    uint64_t v5 = v12 + 1;
  }

  if ((unint64_t)v5 >= v11)
  {
    char v13 = 0;
    v12 = v5;
  }

  else
  {
    char v13 = 0;
    int64_t v14 = v28 - v5;
    v12 = v5;
    do
    {
      int v15 = *(unsigned __int8 *)v12;
      if (v15 == 39 || v15 == 34)
      {
        else {
          int v17 = v10;
        }
        BOOL v18 = v10 == 0;
        if ((_BYTE)v10) {
          int v10 = v17;
        }
        else {
          int v10 = *(unsigned __int8 *)v12;
        }
        if (v18) {
          char v13 = 1;
        }
      }

      ++v12;
      --v14;
    }

    while (v14);
    v12 = v28;
  }

  if (!(_BYTE)v10)
  {
LABEL_26:
    int64_t v19 = v12 - v5;
    id v20 = [MEMORY[0x189603FB8] dataWithLength:v12 - v5 + 1];
    v21 = (void *)[v20 mutableBytes];

    bzero(v21, v12 - v5 + 1);
    if ((v13 & 1) != 0)
    {
      if (v5 < v12)
      {
        int v10 = 0;
        v22 = v21;
        while (1)
        {
          int v23 = *(unsigned __int8 *)v5;
          if (v23 != 39 && v23 != 34) {
            break;
          }
          if ((_BYTE)v10)
          {
            int v10 = 0;
          }

          else
          {
            int v10 = *(unsigned __int8 *)v5;
          }

@end