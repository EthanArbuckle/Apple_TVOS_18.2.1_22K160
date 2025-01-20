@interface NSArray
+ (id)arrayFromShellCommandString:(id)a3;
+ (id)graphicInfoArrayFromArray:(id)a3;
@end

@implementation NSArray

+ (id)graphicInfoArrayFromArray:(id)a3
{
  id v3 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v3)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v8 = v3;
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            uint64_t v18 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"sppci_model"]);
            if (!v18)
            {
              ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m",  "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]",  33LL,  @"One graphic in graphics array does not contain \"sppci_model\"",  v19,  v20,  v21,  v26);

              v24 = 0LL;
              goto LABEL_16;
            }

            v22 = (void *)v18;
            v31[0] = @"Chipset Model";
            v31[1] = @"Device ID";
            v32[0] = v18;
            v32[1] = &stru_100014878;
            v31[2] = @"VRAM Size";
            v31[3] = @"ROM Revision";
            v32[2] = &stru_100014878;
            v32[3] = &stru_100014878;
            v31[4] = @"VBIOS Version";
            v31[5] = @"Option ROM Version";
            v32[4] = &stru_100014878;
            v32[5] = &stru_100014878;
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  6LL));
            -[NSMutableArray addObject:](v7, "addObject:", v23);
          }

          else
          {
            ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m",  "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]",  27LL,  @"One graphic in graphics array is not a dictionary, ignore it.",  v15,  v16,  v17,  v26);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v7));
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m",  "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]",  20LL,  @"graphicsArray pointer is nil!",  v4,  v5,  v6,  v26);
    v24 = 0LL;
  }

+ (id)arrayFromShellCommandString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!v3)
  {
    v25 = 0LL;
    goto LABEL_45;
  }

  id v27 = v3;
  uint64_t v5 = (const char *)[v3 UTF8String];
  int64_t v6 = strlen(v5);
  if (v6 < 1)
  {
LABEL_42:
    v25 = v4;
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
    id v20 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", v12 - v5 + 1));
    id v21 = [v20 mutableBytes];

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