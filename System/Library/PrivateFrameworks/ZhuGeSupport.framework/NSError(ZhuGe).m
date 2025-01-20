@interface NSError(ZhuGe)
+ (__CFString)descriptionFromZhuGeErrorCode:()ZhuGe;
+ (id)errorWithZhuGeErrorCode:()ZhuGe underlyingError:;
- (id)_ZhuGeDescriptionWithLayer:()ZhuGe;
- (uint64_t)ZhuGeDescription;
@end

@implementation NSError(ZhuGe)

+ (id)errorWithZhuGeErrorCode:()ZhuGe underlyingError:
{
  v37[4] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  [MEMORY[0x189607870] errorWithDomain:@"com.apple.zhuge" code:0 userInfo:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (uint64_t *)MEMORY[0x1896075F0];
  v8 = (uint64_t *)MEMORY[0x189607798];
  if (a3 != 1)
  {
    if (a3 >= 0x51)
    {
      v9 = (uint64_t *)MEMORY[0x189607798];
      id v10 = (id)qword_18C75A738;
      v15 = (void *)NSString;
      [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 stringWithFormat:@"ZhuGeErrorCode %@ exceed maximum", v16];
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      v14 = @"Please file a radar against \"ZhuGe|all\"";
      a3 = 1LL;
      goto LABEL_10;
    }

    v17 = (void *)((char *)&ZhuGeErrorTable + 32 * a3);
    if (*v17 != a3)
    {
      v9 = (uint64_t *)MEMORY[0x189607798];
      id v10 = (id)qword_18C75A738;
      v20 = (void *)NSString;
      [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithInteger:*v17];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 stringWithFormat:@"Index %@ of ZhuGeErrorCode table got a wrong code %@", v16, v21];
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }

    v18 = v5;
    if (isObjectNilOrZhuGeNull(v5))
    {
      v9 = v8;
      id v19 = v6;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
LABEL_17:
        v33 = (id *)((char *)&ZhuGeErrorTable + 32 * a3);
        id v10 = v33[1];
        v13 = (__CFString *)v33[2];
        v14 = (__CFString *)v33[3];
        id v5 = v18;
        goto LABEL_11;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = v8;
        id v10 = (id)qword_18C75A738;
        v14 = @"Please check latest code that using ZhuGe error API";
        a3 = 1LL;
        v18 = v6;
        v13 = @"UnderlyingError can only be NSError, NSString, ZHUGE_NULL or nil";
        goto LABEL_11;
      }

      v29 = (void *)MEMORY[0x189607870];
      uint64_t v30 = *v7;
      v36[0] = *MEMORY[0x1896075E0];
      v36[1] = v30;
      v37[0] = v5;
      v37[1] = off_18C75A760[0];
      v9 = v8;
      uint64_t v31 = *v8;
      v36[2] = *MEMORY[0x189607618];
      v36[3] = v31;
      v37[2] = off_18C75A768;
      v37[3] = v6;
      [MEMORY[0x189603F68] dictionaryWithObjects:v37 forKeys:v36 count:4];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 errorWithDomain:@"com.apple.zhuge" code:2 userInfo:v32];
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }

    v18 = v19;
    goto LABEL_17;
  }

  v9 = (uint64_t *)MEMORY[0x189607798];
  id v10 = (id)qword_18C75A738;
  v11 = (void *)NSString;
  [MEMORY[0x189607968] numberWithUnsignedInteger:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 stringWithFormat:@"Reserved ZhuGeErrorCode %@ shall not be the argument", v12];
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  [NSString stringWithFormat:@"Please check newly added code that calling ZhuGeError API"];
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v18 = v6;
LABEL_11:
  id v22 = v18;
  v23 = (void *)MEMORY[0x189607870];
  uint64_t v24 = *MEMORY[0x1896075F0];
  v34[0] = *MEMORY[0x1896075E0];
  v34[1] = v24;
  v35[0] = v10;
  v35[1] = v13;
  uint64_t v25 = *v9;
  v34[2] = *MEMORY[0x189607618];
  v34[3] = v25;
  v35[2] = v14;
  v35[3] = v22;
  [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:4];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 errorWithDomain:@"com.apple.zhuge" code:a3 userInfo:v26];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (__CFString)descriptionFromZhuGeErrorCode:()ZhuGe
{
  if (a3 <= 0x50)
  {
    if (ZhuGeErrorTable[4 * a3] == (id)a3) {
      v3 = (__CFString *)ZhuGeErrorTable[4 * a3 + 1];
    }
    else {
      v3 = @"Invalid ZhuGe Error Code!";
    }
  }

  else
  {
    v3 = @"Illegal ZhuGe Error Code!";
  }

  return v3;
}

- (id)_ZhuGeDescriptionWithLayer:()ZhuGe
{
  uint64_t v5 = 4 * a3;
  [&stru_18A317680 stringByPaddingToLength:4 * a3 withString:@" " startingAtIndex:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [&stru_18A317680 stringByPaddingToLength:(4 * a3) | 2 withString:@" " startingAtIndex:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [&stru_18A317680 stringByPaddingToLength:v5 + 4 withString:@" " startingAtIndex:0];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 domain];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = [v9 isEqualToString:@"com.apple.zhuge"];

  if ((v10 & 1) != 0)
  {
    [a1 userInfo];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKey:*MEMORY[0x1896075E0]];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    [a1 userInfo];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 objectForKey:*MEMORY[0x1896075F0]];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    [a1 userInfo];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKey:*MEMORY[0x189607618]];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    [a1 userInfo];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 objectForKey:*MEMORY[0x189607798]];
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v18 = [v17 _ZhuGeDescriptionWithLayer:a3 + 1];

      v17 = (void *)v18;
    }

    uint64_t v24 = (void *)NSString;
    [a1 domain];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(a1, "code"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 stringWithFormat:@"\n%@{\n%@Domain   = %@\n%@Code     = %@\n%@UserInfo = {\n%@Description        = %@\n%@FailureReason      = %@\n%@RecoverySuggestion = %@\n%@UnderlyingError    = %@\n%@}", v6, v7, v19, v7, v20, v7, v8, v12, v8, v25, v8, v15, v8, v17, v6];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v22 = (void *)NSString;
    [a1 description];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 stringWithFormat:@"{\n%@%@\n%@}", v8, v12, v7];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (uint64_t)ZhuGeDescription
{
  return [a1 _ZhuGeDescriptionWithLayer:0];
}

@end