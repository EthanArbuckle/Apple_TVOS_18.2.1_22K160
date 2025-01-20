@interface NSError(SUCoreError)
+ (id)_buildCheckedErrorForDomain:()SUCoreError withCode:safeUnderlying:description:;
+ (id)buildAndLogCheckedSUCoreError:()SUCoreError underlying:description:;
+ (id)buildCheckedError:()SUCoreError;
+ (id)buildCheckedSUCoreError:()SUCoreError underlying:description:;
+ (uint64_t)_checkedIsSafeUserInfo:()SUCoreError;
+ (unint64_t)_checkedDepthCount:()SUCoreError;
- (__CFString)checkedIndicationsSummary;
- (id)_checkedStackErrorAtDepth:()SUCoreError;
- (id)_deepestWithLayer;
- (id)_errorInStackOfLayer:()SUCoreError;
- (id)checkedDescription;
- (id)checkedDomain;
- (id)checkedForDepthIndex:()SUCoreError;
- (id)checkedIndicationsDescription;
- (id)checkedNameForCode;
- (id)checkedOfLayer:()SUCoreError;
- (id)checkedSummary;
- (id)checkedUserInfo;
- (int64_t)_checkedIndicationsMatching:()SUCoreError;
- (int64_t)_errorInStackLayer;
- (int64_t)checkedIndications;
- (int64_t)checkedIndicationsMatchingMask:()SUCoreError;
- (uint64_t)_checkedIsSafe:()SUCoreError;
- (uint64_t)checkedCode;
- (uint64_t)checkedDepthCount;
- (uint64_t)checkedLayer;
- (uint64_t)checkedSystemPartitionSize;
- (unint64_t)shouldFallbackToCustomerScan;
- (void)checkedSystemPartitionSize;
@end

@implementation NSError(SUCoreError)

- (uint64_t)checkedLayer
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 _errorInStackLayer];
  }
  else {
    uint64_t v3 = 10LL;
  }

  return v3;
}

- (id)checkedOfLayer:()SUCoreError
{
  uint64_t v5 = [a1 checkedDepthCount];
  if (v5 < 1) {
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  do
  {
    [a1 checkedForDepthIndex:v6];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 _errorInStackLayer] == a3)
    {
      id v8 = v7;
    }

    else
    {
      id v8 = 0LL;
      --v6;
    }
  }

  while (!v8 && v6 > 0);
  if (!v8)
  {
LABEL_9:
    [a1 _errorInStackOfLayer:a3];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (uint64_t)checkedCode
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 code];
  }
  else {
    uint64_t v3 = -1LL;
  }

  return v3;
}

- (id)checkedDomain
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    [v1 domain];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (id)checkedUserInfo
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    [v1 userInfo];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (uint64_t)checkedSystemPartitionSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[NSError(SUCoreError) checkedSystemPartitionSize].cold.1(a1, v3);
  }

  return 0LL;
}

- (unint64_t)shouldFallbackToCustomerScan
{
  return ((unint64_t)[a1 checkedIndications] >> 5) & 1;
}

- (int64_t)checkedIndications
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int64_t v2 = +[SUCoreErrorInformation allIndicationsForError:]( &OBJC_CLASS___SUCoreErrorInformation,  "allIndicationsForError:",  a1);
  uint64_t v3 = [a1 checkedDepthCount];
  if (v3 >= 1)
  {
    int v4 = v3;
    uint64_t v5 = v3;
    while (1)
    {
      [a1 checkedForDepthIndex:v5];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6) {
        break;
      }
      v2 |= +[SUCoreErrorInformation allIndicationsForError:]( &OBJC_CLASS___SUCoreErrorInformation,  "allIndicationsForError:",  v6);
      --v5;

      if (!v5) {
        return v2;
      }
    }
    v7 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v7 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [a1 checkedDescription];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = 67109634;
      v11[1] = v4;
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_error_impl( &dword_187139000,  v8,  OS_LOG_TYPE_ERROR,  "[CORE_ERROR] {checkedIndications} error with depthCount=%d yet no stack-error at checked depth(%d) | cannot dete rmine if generic failure for error: %{public}@",  (uint8_t *)v11,  0x18u);
    }
  }

  return v2;
}

- (int64_t)checkedIndicationsMatchingMask:()SUCoreError
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  int64_t v5 = +[SUCoreErrorInformation indicationsForError:matchingMask:]( &OBJC_CLASS___SUCoreErrorInformation,  "indicationsForError:matchingMask:",  a1,  a3);
  uint64_t v6 = [a1 checkedDepthCount];
  if (v6 >= 1)
  {
    int v7 = v6;
    uint64_t v8 = v6;
    while (1)
    {
      [a1 checkedForDepthIndex:v8];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9) {
        break;
      }
      v5 |= +[SUCoreErrorInformation indicationsForError:matchingMask:]( &OBJC_CLASS___SUCoreErrorInformation,  "indicationsForError:matchingMask:",  v9,  a3);
      --v8;

      if (!v8) {
        return v5;
      }
    }
    v10 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v10 oslog];
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [a1 checkedDescription];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = 67109634;
      v14[1] = v7;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 2114;
      v18 = v13;
      _os_log_error_impl( &dword_187139000,  v11,  OS_LOG_TYPE_ERROR,  "[CORE_ERROR] {checkedIndicationsMatchingMask} error with depthCount=%d yet no stack-error at checked depth(%d) | cannot determine if generic failure for error: %{public}@",  (uint8_t *)v14,  0x18u);
    }
  }

  return v5;
}

- (__CFString)checkedIndicationsSummary
{
  int v1 = [a1 checkedIndications];
  uint64_t v2 = 0LL;
  uint64_t v3 = &stru_189FEB358;
  do
  {
    if ((v1 & (1 << v2)) != 0)
    {
      int v4 = (void *)NSString;
      +[SUCoreErrorAttributes nameForIndication:](&OBJC_CLASS___SUCoreErrorAttributes, "nameForIndication:");
      int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 stringWithFormat:@"|%@", v5];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v6);

      uint64_t v3 = (__CFString *)v7;
    }

    ++v2;
  }

  while (v2 != 5);
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", &stru_189FEB358) & 1) != 0)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    v9 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", @"|");
    uint64_t v8 = v9;
    uint64_t v3 = v8;
  }

  return v8;
}

- (id)checkedIndicationsDescription
{
  int v1 = [a1 checkedIndications];
  uint64_t v2 = 0LL;
  for (uint64_t i = 0LL; i != 5; ++i)
  {
    if ((v1 & (1 << i)) != 0)
    {
      int v4 = (void *)NSString;
      uint64_t v5 = +[SUCoreErrorAttributes descriptionForIndication:]( &OBJC_CLASS___SUCoreErrorAttributes,  "descriptionForIndication:");
      uint64_t v6 = (void *)v5;
      if (v2)
      {
        [v4 stringWithFormat:@"\n-> %@", v5];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v2 stringByAppendingString:v7];

        uint64_t v2 = (void *)v8;
      }

      else
      {
        [v4 stringWithFormat:@"-> %@", v5];
        uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v2;
}

- (uint64_t)checkedDepthCount
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *MEMORY[0x189607798];
  uint64_t v3 = [v1 safeObjectForKey:*MEMORY[0x189607798] ofClass:objc_opt_class()];
  if (v3)
  {
    int v4 = (void *)v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = v1;
    do
    {
      ++v5;
      [v4 userInfo];
      int v1 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v7 = [v1 safeObjectForKey:v2 ofClass:objc_opt_class()];

      int v4 = (void *)v7;
      uint64_t v6 = v1;
    }

    while (v7);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)checkedForDepthIndex:()SUCoreError
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *MEMORY[0x189607798];
  [v4 safeObjectForKey:*MEMORY[0x189607798] ofClass:objc_opt_class()];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = a3 > 1;
  if (v6) {
    BOOL v8 = a3 < 2;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = 2LL;
    do
    {
      v10 = v4;
      v11 = v6;
      [v6 userInfo];
      int v4 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 safeObjectForKey:v5 ofClass:objc_opt_class()];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

      BOOL v7 = v9 < a3;
      if (v6) {
        BOOL v12 = v9 < a3;
      }
      else {
        BOOL v12 = 0;
      }
      ++v9;
    }

    while (v12);
  }

  if (v7) {
    id v13 = 0LL;
  }
  else {
    id v13 = v6;
  }

  return v13;
}

- (id)checkedNameForCode
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    +[SUCoreErrorInformation codeNameForError:](&OBJC_CLASS___SUCoreErrorInformation, "codeNameForError:", v2);
  }
  else {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(a1, "code"));
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)checkedSummary
{
  uint64_t v2 = [a1 checkedDepthCount];
  uint64_t v3 = [a1 _errorInStackLayer];
  +[SUCoreErrorInformation codeNameForError:](&OBJC_CLASS___SUCoreErrorInformation, "codeNameForError:", a1);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [a1 checkedIndicationsSummary];
  id v6 = objc_alloc(NSString);
  v27 = a1;
  uint64_t v7 = [a1 domain];
  BOOL v8 = (void *)v7;
  v26 = (void *)v5;
  if (v3 > 10)
  {
    +[SUCoreErrorInformation nameForSUCoreLayer:](&OBJC_CLASS___SUCoreErrorInformation, "nameForSUCoreLayer:", v3);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)[v6 initWithFormat:@"[%@(%@):%@", v8, v9, v4];
    [&stru_189FEB358 stringByAppendingString:v11];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = (void *)[v6 initWithFormat:@"[%@:%@", v7, v4];
    [&stru_189FEB358 stringByAppendingString:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v2 < 1)
  {
    v21 = v10;
  }

  else
  {
    uint64_t v12 = -v2;
    uint64_t v13 = 1LL;
    do
    {
      __int16 v14 = v4;
      [v27 checkedForDepthIndex:v13];
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = +[SUCoreErrorInformation layerForError:](&OBJC_CLASS___SUCoreErrorInformation, "layerForError:", v15);
      +[SUCoreErrorInformation codeNameForError:](&OBJC_CLASS___SUCoreErrorInformation, "codeNameForError:", v15);
      int v4 = (void *)objc_claimAutoreleasedReturnValue();

      id v17 = objc_alloc(NSString);
      uint64_t v18 = [v15 domain];
      uint64_t v19 = (void *)v18;
      if (v16 > 10)
      {
        v20 = +[SUCoreErrorInformation nameForSUCoreLayer:](&OBJC_CLASS___SUCoreErrorInformation, "nameForSUCoreLayer:", v16);
        uint64_t v22 = [v17 initWithFormat:@"_%d_%@(%@):%@", v13, v19, v20, v4];
        [v10 stringByAppendingString:v22];
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)v22;
      }

      else
      {
        v20 = (void *)[v17 initWithFormat:@"_%d_%@:%@", v13, v18, v4];
        [v10 stringByAppendingString:v20];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

      ++v13;
      v10 = v21;
    }

    while (v12 + v13 != 1);
  }

  if (v26)
  {
    uint64_t v23 = [v21 stringByAppendingString:v26];

    v21 = (void *)v23;
  }

  if (([v21 isEqualToString:&stru_189FEB358] & 1) == 0)
  {
    uint64_t v24 = [v21 stringByAppendingString:@"]"];

    v21 = (void *)v24;
  }

  return v21;
}

- (id)checkedDescription
{
  uint64_t v2 = [a1 checkedDepthCount];
  uint64_t v3 = [a1 _errorInStackLayer];
  +[SUCoreErrorInformation codeNameForError:](&OBJC_CLASS___SUCoreErrorInformation, "codeNameForError:", a1);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 checkedIndicationsDescription];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc(NSString);
  uint64_t v7 = [a1 domain];
  BOOL v8 = (void *)v7;
  if (v3 > 10)
  {
    +[SUCoreErrorInformation nameForSUCoreLayer:](&OBJC_CLASS___SUCoreErrorInformation, "nameForSUCoreLayer:", v3);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)[v6 initWithFormat:@"%@(%@):%@", v8, v9, v4];
    [&stru_189FEB358 stringByAppendingString:v11];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = (void *)[v6 initWithFormat:@"%@:%@", v7, v4];
    [&stru_189FEB358 stringByAppendingString:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v2 <= 0)
  {
    id v20 = objc_alloc(NSString);
    [a1 localizedDescription];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = (void *)[v20 initWithFormat:@" | %@", v12];
    [v10 stringByAppendingString:v16];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v14 = v4;
  }

  else
  {
    [a1 checkedForDepthIndex:v2];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = +[SUCoreErrorInformation layerForError:](&OBJC_CLASS___SUCoreErrorInformation, "layerForError:", v12);
    +[SUCoreErrorInformation codeNameForError:](&OBJC_CLASS___SUCoreErrorInformation, "codeNameForError:", v12);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();

    id v15 = objc_alloc(NSString);
    [v12 domain];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 > 10)
    {
      uint64_t v17 = +[SUCoreErrorInformation nameForSUCoreLayer:](&OBJC_CLASS___SUCoreErrorInformation, "nameForSUCoreLayer:", v13);
      [v12 localizedDescription];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v15 initWithFormat:@"_%d_%@(%@):%@ | %@", v2, v16, v17, v14, v18];
      [v10 stringByAppendingString:v21];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)v21;
    }

    else
    {
      uint64_t v17 = [v12 localizedDescription];
      uint64_t v18 = (void *)[v15 initWithFormat:@"_%d_%@:%@ | %@", v2, v16, v14, v17];
      [v10 stringByAppendingString:v18];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v10 = (void *)v17;
  }

  if (v5)
  {
    uint64_t v22 = (void *)[objc_alloc(NSString) initWithFormat:@"\n%@", v5];
    uint64_t v23 = [v19 stringByAppendingString:v22];

    uint64_t v19 = (void *)v23;
  }

  return v19;
}

- (uint64_t)_checkedIsSafe:()SUCoreError
{
  id v4 = a1;
  if (!v4) {
    return 1LL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *MEMORY[0x189607798];
  while (1)
  {
    uint64_t v7 = [MEMORY[0x189607870] _checkedIsSafeUserInfo:v5];
    if (!(_DWORD)v7 || a3 == 0) {
      break;
    }
    [v5 userInfo];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      uint64_t v7 = 1LL;
      break;
    }

    [v5 userInfo];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 safeObjectForKey:v6 ofClass:objc_opt_class()];

    uint64_t v5 = (void *)v11;
    if (!v11)
    {
      uint64_t v5 = 0LL;
      break;
    }
  }

  return v7;
}

- (id)_checkedStackErrorAtDepth:()SUCoreError
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *MEMORY[0x189607798];
  [v4 safeObjectForKey:*MEMORY[0x189607798] ofClass:objc_opt_class()];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    BOOL v7 = a3 < 2;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    for (uint64_t i = 2LL; ; ++i)
    {
      uint64_t v9 = v6;
      [v6 userInfo];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 safeObjectForKey:v5 ofClass:objc_opt_class()];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6) {
        BOOL v11 = i < a3;
      }
      else {
        BOOL v11 = 0;
      }
      if (!v11) {
        return v6;
      }
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)_deepestWithLayer
{
  uint64_t v2 = [a1 checkedDepthCount];
  if (v2 < 1) {
    goto LABEL_9;
  }
  uint64_t v3 = v2;
  do
  {
    [a1 checkedForDepthIndex:v3];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 _errorInStackLayer] > 10)
    {
      id v5 = v4;
    }

    else
    {
      id v5 = 0LL;
      --v3;
    }
  }

  while (!v5 && v3 > 0);
  if (!v5)
  {
LABEL_9:
    if ([a1 _errorInStackLayer] >= 11) {
      id v5 = a1;
    }
    else {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (int64_t)_checkedIndicationsMatching:()SUCoreError
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  int64_t v5 = +[SUCoreErrorInformation indicationsForError:matchingMask:]( &OBJC_CLASS___SUCoreErrorInformation,  "indicationsForError:matchingMask:",  a1,  a3);
  uint64_t v6 = [a1 checkedDepthCount];
  if (v6 >= 1)
  {
    int v7 = v6;
    uint64_t v8 = v6;
    while (1)
    {
      [a1 checkedForDepthIndex:v8];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9) {
        break;
      }
      v5 |= +[SUCoreErrorInformation indicationsForError:matchingMask:]( &OBJC_CLASS___SUCoreErrorInformation,  "indicationsForError:matchingMask:",  v9,  a3);
      --v8;

      if (!v8) {
        return v5;
      }
    }
    v10 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v10 oslog];
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [a1 checkedDescription];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = 67109634;
      v14[1] = v7;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v13;
      _os_log_error_impl( &dword_187139000,  v11,  OS_LOG_TYPE_ERROR,  "[CORE_ERROR] {_checkedIndicationsMatching} error with depthCount=%d yet no stack-error at checked depth(%d) | ca nnot determine all indications for error: %{public}@",  (uint8_t *)v14,  0x18u);
    }
  }

  return v5;
}

- (int64_t)_errorInStackLayer
{
  return +[SUCoreErrorInformation layerForError:](&OBJC_CLASS___SUCoreErrorInformation, "layerForError:", a1);
}

- (id)_errorInStackOfLayer:()SUCoreError
{
  if (+[SUCoreErrorInformation layerForError:](&OBJC_CLASS___SUCoreErrorInformation, "layerForError:", a1) == a3) {
    id v4 = a1;
  }
  else {
    id v4 = 0LL;
  }
  return v4;
}

+ (id)buildCheckedSUCoreError:()SUCoreError underlying:description:
{
  int v7 = (void *)MEMORY[0x189607870];
  id v8 = a5;
  [v7 buildCheckedError:a4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 _buildCheckedErrorForDomain:@"SUCoreError" withCode:a3 safeUnderlying:v9 description:v8];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)buildAndLogCheckedSUCoreError:()SUCoreError underlying:description:
{
  int v7 = (void *)MEMORY[0x189607870];
  id v8 = a5;
  [v7 buildCheckedError:a4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 _buildCheckedErrorForDomain:@"SUCoreError" withCode:a3 safeUnderlying:v9 description:v8];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 oslog];
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[NSError(SUCoreError) buildAndLogCheckedSUCoreError:underlying:description:].cold.1((uint64_t)v10, v12, v13);
  }

  return v10;
}

+ (id)buildCheckedError:()SUCoreError
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 _checkedIsSafe:1])
    {
      id v5 = v4;
    }

    else
    {
      uint64_t v6 = [MEMORY[0x189607870] _checkedDepthCount:v4];
      if (v6 >= 1
        && (v7 = v6, [v4 _checkedStackErrorAtDepth:v6], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v9 = (void *)v8;
        v10 = 0LL;
        do
        {
          BOOL v11 = v10;
          uint64_t v12 = v9;
          uint64_t v13 = (void *)MEMORY[0x189607870];
          [v9 domain];
          __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [v12 code];
          [v12 localizedDescription];
          int v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 _buildCheckedErrorForDomain:v14 withCode:v15 safeUnderlying:v11 description:v16];
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          [v4 _checkedStackErrorAtDepth:v7 - 1];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7 < 2) {
            break;
          }
          --v7;
        }

        while (v9);
      }

      else
      {
        v10 = 0LL;
      }

      __int16 v17 = (void *)MEMORY[0x189607870];
      [v4 domain];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v4 code];
      [v4 localizedDescription];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 _buildCheckedErrorForDomain:v18 withCode:v19 safeUnderlying:v10 description:v20];
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (uint64_t)_checkedIsSafeUserInfo:()SUCoreError
{
  id v3 = a3;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  [v3 userInfo];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v3 userInfo];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke;
    v8[3] = &unk_189FE98A0;
    v8[4] = &v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }

  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (unint64_t)_checkedDepthCount:()SUCoreError
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *MEMORY[0x189607798];
  [v3 safeObjectForKey:*MEMORY[0x189607798] ofClass:objc_opt_class()];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = v5;
      [v5 userInfo];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 safeObjectForKey:v4 ofClass:objc_opt_class()];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 && v6 >= 4) {
        break;
      }
      ++v6;
      if (!v5) {
        return v6;
      }
    }
  }

  return 0LL;
}

+ (id)_buildCheckedErrorForDomain:()SUCoreError withCode:safeUnderlying:description:
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  char v12 = (void *)objc_opt_new();
  +[SUCoreErrorInformation codeNameForDomain:withCode:]( &OBJC_CLASS___SUCoreErrorInformation,  "codeNameForDomain:withCode:",  v9,  a4);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = objc_alloc(NSString);
  if (v11) {
    uint64_t v15 = [v14 initWithFormat:@"[%@] %@", v13, v11];
  }
  else {
    uint64_t v15 = [v14 initWithFormat:@"[%@]", v13, v19];
  }
  int v16 = (void *)v15;
  [v12 setSafeObject:v15 forKey:*MEMORY[0x1896075E0]];
  if (v10) {
    [v12 setSafeObject:v10 forKey:*MEMORY[0x189607798]];
  }
  [MEMORY[0x189607870] errorWithDomain:v9 code:a4 userInfo:v12];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)checkedSystemPartitionSize
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 checkedDescription];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = 138543362;
  unint64_t v6 = v3;
  OUTLINED_FUNCTION_0_2( &dword_187139000,  a2,  v4,  "[CORE_ERROR] {checkedSystemPartitionSize} system partition size error attribute not yet implemented | cannot provide system partition size for error: %{public}@",  (uint8_t *)&v5);
}

+ (void)buildAndLogCheckedSUCoreError:()SUCoreError underlying:description:.cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_187139000, a2, a3, "Error: %@", (uint8_t *)&v3);
}

@end