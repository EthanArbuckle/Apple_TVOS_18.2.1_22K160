@interface SecXPCHelper
+ (id)cleanDictionaryForXPC:(id)a3;
+ (id)cleanObjectForXPC:(id)a3;
+ (id)cleanseErrorForXPC:(id)a3;
+ (id)encodedDataFromError:(id)a3;
+ (id)errorFromEncodedData:(id)a3;
+ (id)safeCKErrorPrimitiveClasses;
+ (id)safeErrorClasses;
+ (id)safeErrorCollectionClasses;
+ (id)safeErrorPrimitiveClasses;
@end

@implementation SecXPCHelper

+ (id)safeErrorPrimitiveClasses
{
  if (safeErrorPrimitiveClasses_onceToken != -1) {
    dispatch_once(&safeErrorPrimitiveClasses_onceToken, &__block_literal_global_3935);
  }
  return (id)safeErrorPrimitiveClasses_errorClasses;
}

+ (id)safeCKErrorPrimitiveClasses
{
  if (safeCKErrorPrimitiveClasses_onceToken != -1) {
    dispatch_once(&safeCKErrorPrimitiveClasses_onceToken, &__block_literal_global_7);
  }
  return (id)safeCKErrorPrimitiveClasses_errorClasses;
}

+ (id)safeErrorCollectionClasses
{
  if (safeErrorCollectionClasses_onceToken != -1) {
    dispatch_once(&safeErrorCollectionClasses_onceToken, &__block_literal_global_15);
  }
  return (id)safeErrorCollectionClasses_errorClasses;
}

+ (id)safeErrorClasses
{
  if (safeErrorClasses_onceToken != -1) {
    dispatch_once(&safeErrorClasses_onceToken, &__block_literal_global_23);
  }
  return (id)safeErrorClasses_errorClasses;
}

+ (id)cleanDictionaryForXPC:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    [v4 allKeys];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          [v4 objectForKeyedSubscript:v10];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = +[SecXPCHelper cleanObjectForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanObjectForXPC:", v11);
          [a1 cleanObjectForXPC:v10];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13) {
            [v15 setObject:v12 forKeyedSubscript:v13];
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

+ (id)cleanObjectForXPC:(id)a3
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (!v3)
  {
    id v14 = 0LL;
    goto LABEL_53;
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  +[SecXPCHelper safeErrorPrimitiveClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorPrimitiveClasses");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v14 = v3;

          goto LABEL_53;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }

    while (v6);
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  +[SecXPCHelper safeErrorCollectionClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorCollectionClasses");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v55;
  while (2)
  {
    for (uint64_t j = 0LL; j != v10; ++j)
    {
      if (*(void *)v55 != v11) {
        objc_enumerationMutation(obj);
      }
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v15 = (void *)MEMORY[0x189607870];
          id v16 = v3;
          [v16 domain];
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v16 code];
          [v16 userInfo];
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = +[SecXPCHelper cleanDictionaryForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanDictionaryForXPC:", v19);
          [v15 errorWithDomain:v17 code:v18 userInfo:v20];
          id v14 = (id)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[SecXPCHelper cleanDictionaryForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanDictionaryForXPC:", v3);
            id v14 = (id)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              id v21 = v3;
              objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
              id v14 = (id)objc_claimAutoreleasedReturnValue();
              __int128 v50 = 0u;
              __int128 v51 = 0u;
              __int128 v52 = 0u;
              __int128 v53 = 0u;
              id v22 = v21;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v64 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v51;
                do
                {
                  for (uint64_t k = 0LL; k != v24; ++k)
                  {
                    if (*(void *)v51 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    v27 = +[SecXPCHelper cleanObjectForXPC:]( &OBJC_CLASS___SecXPCHelper,  "cleanObjectForXPC:",  *(void *)(*((void *)&v50 + 1) + 8 * k));
                    [v14 addObject:v27];
                  }

                  uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v64 count:16];
                }

                while (v24);
              }
            }

            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                id v28 = v3;
                objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v28, "count"));
                id v14 = (id)objc_claimAutoreleasedReturnValue();
                __int128 v46 = 0u;
                __int128 v47 = 0u;
                __int128 v48 = 0u;
                __int128 v49 = 0u;
                id v22 = v28;
                uint64_t v29 = [v22 countByEnumeratingWithState:&v46 objects:v63 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v47;
                  do
                  {
                    for (uint64_t m = 0LL; m != v30; ++m)
                    {
                      if (*(void *)v47 != v31) {
                        objc_enumerationMutation(v22);
                      }
                      v33 = +[SecXPCHelper cleanObjectForXPC:]( &OBJC_CLASS___SecXPCHelper,  "cleanObjectForXPC:",  *(void *)(*((void *)&v46 + 1) + 8 * m));
                      [v14 addObject:v33];
                    }

                    uint64_t v30 = [v22 countByEnumeratingWithState:&v46 objects:v63 count:16];
                  }

                  while (v30);
                }
              }

              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                id v34 = v3;
                objc_msgSend(MEMORY[0x189603FD0], "orderedSetWithCapacity:", objc_msgSend(v34, "count"));
                id v14 = (id)objc_claimAutoreleasedReturnValue();
                __int128 v42 = 0u;
                __int128 v43 = 0u;
                __int128 v44 = 0u;
                __int128 v45 = 0u;
                id v22 = v34;
                uint64_t v35 = [v22 countByEnumeratingWithState:&v42 objects:v62 count:16];
                if (v35)
                {
                  uint64_t v36 = v35;
                  uint64_t v37 = *(void *)v43;
                  do
                  {
                    for (uint64_t n = 0LL; n != v36; ++n)
                    {
                      if (*(void *)v43 != v37) {
                        objc_enumerationMutation(v22);
                      }
                      v39 = +[SecXPCHelper cleanObjectForXPC:]( &OBJC_CLASS___SecXPCHelper,  "cleanObjectForXPC:",  *(void *)(*((void *)&v42 + 1) + 8 * n));
                      [v14 addObject:v39];
                    }

                    uint64_t v36 = [v22 countByEnumeratingWithState:&v42 objects:v62 count:16];
                  }

                  while (v36);
                }
              }
            }
          }
        }

        goto LABEL_53;
      }
    }

    uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v10) {
      continue;
    }
    break;
  }

+ (id)cleanseErrorForXPC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    [v3 userInfo];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SecXPCHelper cleanDictionaryForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanDictionaryForXPC:", v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = (void *)MEMORY[0x189607870];
    [v3 domain];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v3 code];

    [v6 errorWithDomain:v7 code:v8 userInfo:v5];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

+ (id)errorFromEncodedData:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x189607908];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  if (v5)
  {
    [v5 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (id)encodedDataFromError:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1896078F8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:@"error"];

  [v5 encodedData];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __32__SecXPCHelper_safeErrorClasses__block_invoke()
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v0 = [MEMORY[0x189603FE0] set];
  v1 = (void *)safeErrorClasses_errorClasses;
  safeErrorClasses_errorClasses = v0;

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v2 = +[SecXPCHelper safeErrorPrimitiveClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorPrimitiveClasses");
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        [(id)safeErrorClasses_errorClasses addObject:*(void *)(*((void *)&v25 + 1) + 8 * v6++)];
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v4);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  +[SecXPCHelper safeCKErrorPrimitiveClasses](&OBJC_CLASS___SecXPCHelper, "safeCKErrorPrimitiveClasses");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(id)safeErrorClasses_errorClasses addObject:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }

    while (v9);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v12 = +[SecXPCHelper safeErrorCollectionClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorCollectionClasses", 0LL);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(id)safeErrorClasses_errorClasses addObject:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }

      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }

    while (v14);
  }
}

Class __42__SecXPCHelper_safeErrorCollectionClasses__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603FE0] set];
  v1 = (void *)safeErrorCollectionClasses_errorClasses;
  safeErrorCollectionClasses_errorClasses = v0;

  for (uint64_t i = 0LL; i != 6; ++i)
  {
    Class result = objc_getClass(off_1896673A8[i]);
    if (result) {
      Class result = (Class)[(id)safeErrorCollectionClasses_errorClasses addObject:result];
    }
  }

  return result;
}

Class __43__SecXPCHelper_safeCKErrorPrimitiveClasses__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603FE0] set];
  v1 = (void *)safeCKErrorPrimitiveClasses_errorClasses;
  safeCKErrorPrimitiveClasses_errorClasses = v0;

  for (uint64_t i = 0LL; i != 6; ++i)
  {
    Class result = objc_getClass(off_189667358[i]);
    if (result) {
      Class result = (Class)[(id)safeCKErrorPrimitiveClasses_errorClasses addObject:result];
    }
  }

  return result;
}

Class __41__SecXPCHelper_safeErrorPrimitiveClasses__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603FE0] set];
  v1 = (void *)safeErrorPrimitiveClasses_errorClasses;
  safeErrorPrimitiveClasses_errorClasses = v0;

  for (uint64_t i = 0LL; i != 6; ++i)
  {
    Class result = objc_getClass(off_189667308[i]);
    if (result) {
      Class result = (Class)[(id)safeErrorPrimitiveClasses_errorClasses addObject:result];
    }
  }

  return result;
}

@end