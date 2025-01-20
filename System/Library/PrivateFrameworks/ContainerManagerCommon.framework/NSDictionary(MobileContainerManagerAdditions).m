@interface NSDictionary(MobileContainerManagerAdditions)
+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fileManager:fsNode:error:;
+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fsNode:error:;
+ (uint64_t)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:error:;
- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:error:;
- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:fileManager:error:;
@end

@implementation NSDictionary(MobileContainerManagerAdditions)

- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:error:
{
  id v8 = a3;
  v9 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v10 = objc_msgSend(a1, "MCM_writeToURL:withOptions:fileManager:error:", v8, a4, v9, a5);

  return v10;
}

- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:fileManager:error:
{
  v20[1] = *(id *)MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  v20[0] = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:a1 format:200 options:0 error:v20];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v20[0];
  if (!v12) {
    goto LABEL_7;
  }
  if ([v12 length])
  {
    id v17 = v13;
    uint64_t v14 = [v11 writeData:v12 toURL:v10 options:a4 mode:438 error:&v17];
    id v15 = v17;
    goto LABEL_4;
  }

  if (v13)
  {
LABEL_7:
    uint64_t v14 = 0LL;
    if (!a6) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke;
  v18[3] = &unk_18A29E6D8;
  id v19 = v10;
  __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke((uint64_t)v18);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = 0LL;
  id v13 = v19;
LABEL_4:

  id v13 = v15;
  if (!a6) {
    goto LABEL_10;
  }
LABEL_8:
  if ((v14 & 1) == 0) {
    *a6 = v13;
  }
LABEL_10:

  return v14;
}

+ (uint64_t)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:error:
{
  return objc_msgSend(a1, "MCM_dictionaryWithContentsOfURL:options:fsNode:error:", a3, a4, 0, a5);
}

+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fsNode:error:
{
  id v10 = a3;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v10, a4, v11, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fileManager:fsNode:error:
{
  v18[1] = *(id *)MEMORY[0x1895F89C0];
  v18[0] = 0LL;
  [a5 readDataFromURL:a3 options:2 fsNode:a6 error:v18];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v18[0];
  if (v9)
  {
    id v17 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:v9 options:a4 format:0 error:&v17];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v17;

    objc_opt_class();
    id v13 = v11;
    id v14 = 0LL;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v14 = v13;
    }

    if (v14)
    {
      id v15 = v13;
      id v10 = v12;
      id v13 = v15;
      if (!a7) {
        goto LABEL_12;
      }
    }

    else
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:2048 userInfo:0];
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      id v15 = 0LL;
      if (!a7) {
        goto LABEL_12;
      }
    }
  }

  else
  {
    id v15 = 0LL;
    id v13 = 0LL;
    if (!a7) {
      goto LABEL_12;
    }
  }

  if (!v15) {
    *a7 = v10;
  }
LABEL_12:

  return v15;
}

@end