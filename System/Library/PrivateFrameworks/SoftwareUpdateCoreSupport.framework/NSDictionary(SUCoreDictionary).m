@interface NSDictionary(SUCoreDictionary)
+ (__CFString)_safeValueName:()SUCoreDictionary ofMaxFieldLength:providingSubstitutionMap:;
+ (__CFString)safeSummaryForDictionary:()SUCoreDictionary;
+ (id)_safeKeyName:()SUCoreDictionary paddedToLength:;
- (id)_safeDescriptionWithName:()SUCoreDictionary atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:;
- (id)safeDataForKey:()SUCoreDictionary;
- (id)safeDateForKey:()SUCoreDictionary;
- (id)safeDictionaryForKey:()SUCoreDictionary fromBase:withKeyDescription:;
- (id)safeObjectForKey:()SUCoreDictionary ofClass:;
- (id)safeStringForKey:()SUCoreDictionary;
- (id)safeSubDescriptionAtNestedLevel:()SUCoreDictionary instanceAtLevel:withMaxValueLength:providingSubstitutionMap:;
- (id)safeSummary;
- (uint64_t)_logReturningNil:()SUCoreDictionary forKey:valueType:;
- (uint64_t)safeBooleanForKey:()SUCoreDictionary;
- (uint64_t)safeBooleanForKey:()SUCoreDictionary defaultValue:;
- (uint64_t)safeDescriptionWithName:()SUCoreDictionary;
- (uint64_t)safeDescriptionWithName:()SUCoreDictionary maxNestedLevel:withMaxValueLength:providingSubstitutionMap:;
- (uint64_t)safeDictionaryForKey:()SUCoreDictionary;
- (uint64_t)safeIntegerForKey:()SUCoreDictionary;
- (uint64_t)safeIntegerForKey:()SUCoreDictionary defaultValue:;
- (uint64_t)safeLLForKey:()SUCoreDictionary;
- (uint64_t)safeLLForKey:()SUCoreDictionary defaultValue:;
- (uint64_t)safeTriStateForKey:()SUCoreDictionary;
- (uint64_t)safeULLForKey:()SUCoreDictionary;
- (uint64_t)safeULLForKey:()SUCoreDictionary defaultValue:;
- (unint64_t)safeTriStateForKey:()SUCoreDictionary defaultValue:;
- (void)_logReturningDefault:()SUCoreDictionary forKey:valueType:defaultValueName:;
- (void)_logReturningNil:()SUCoreDictionary forKey:valueType:fromBase:withKeyDescription:;
@end

@implementation NSDictionary(SUCoreDictionary)

- (uint64_t)safeBooleanForKey:()SUCoreDictionary
{
  return [a1 safeBooleanForKey:a3 defaultValue:0];
}

- (uint64_t)safeBooleanForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [v7 BOOLValue];
  }

  else
  {
    if ((_DWORD)a4) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    [a1 _logReturningDefault:v7 forKey:v6 valueType:@"BOOLean" defaultValueName:v8];
  }

  return a4;
}

- (uint64_t)safeLLForKey:()SUCoreDictionary
{
  return [a1 safeLLForKey:a3 defaultValue:0];
}

- (uint64_t)safeLLForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [v7 longLongValue];
  }

  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%lld", a4);
    [a1 _logReturningDefault:v7 forKey:v6 valueType:@"ll" defaultValueName:v8];
  }

  return a4;
}

- (uint64_t)safeULLForKey:()SUCoreDictionary
{
  return [a1 safeULLForKey:a3 defaultValue:0];
}

- (uint64_t)safeULLForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [v7 unsignedLongLongValue];
  }

  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%llu", a4);
    [a1 _logReturningDefault:v7 forKey:v6 valueType:@"ull" defaultValueName:v8];
  }

  return a4;
}

- (uint64_t)safeIntegerForKey:()SUCoreDictionary
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "safeIntegerForKey:defaultValue:", v4, objc_msgSend(&unk_189FF8BD0, "integerValue"));

  return v5;
}

- (uint64_t)safeIntegerForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [v7 integerValue];
  }

  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%llu", a4);
    [a1 _logReturningDefault:v7 forKey:v6 valueType:@"integer" defaultValueName:v8];
  }

  return a4;
}

- (uint64_t)safeTriStateForKey:()SUCoreDictionary
{
  return [a1 safeTriStateForKey:a3 defaultValue:2];
}

- (unint64_t)safeTriStateForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      unint64_t v8 = [v7 integerValue];
      if (v8 < 2) {
        goto LABEL_12;
      }
      v9 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v9 oslog];
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[NSDictionary(SUCoreDictionary) safeTriStateForKey:defaultValue:].cold.2((uint64_t)v6, (uint64_t)v7, v10);
      }
    }
  }

  if (a4 >= 3)
  {
    v11 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v11 oslog];
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(SUCoreDictionary) safeTriStateForKey:defaultValue:].cold.1((uint64_t)v6, a4, v12);
    }

    a4 = 2LL;
  }

  v13 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%llu", a4);
  [a1 _logReturningDefault:v7 forKey:v6 valueType:@"integer" defaultValueName:v13];

  unint64_t v8 = a4;
LABEL_12:

  return v8;
}

- (id)safeStringForKey:()SUCoreDictionary
{
  id v4 = a3;
  [a1 objectForKey:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
  }

  else
  {
    [a1 _logReturningNil:v5 forKey:v4 valueType:@"string"];
    id v6 = 0LL;
  }

  return v6;
}

- (uint64_t)safeDictionaryForKey:()SUCoreDictionary
{
  return [a1 safeDictionaryForKey:a3 fromBase:0 withKeyDescription:0];
}

- (id)safeDictionaryForKey:()SUCoreDictionary fromBase:withKeyDescription:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 objectForKey:v8];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = v11;
  }

  else
  {
    [a1 _logReturningNil:v11 forKey:v8 valueType:@"dictionary" fromBase:v9 withKeyDescription:v10];
    id v12 = 0LL;
  }

  return v12;
}

- (id)safeDataForKey:()SUCoreDictionary
{
  id v4 = a3;
  [a1 objectForKey:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = v5;
    goto LABEL_7;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (id v6 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v5 options:1]) == 0)
  {
LABEL_6:
    [a1 _logReturningNil:v5 forKey:v4 valueType:@"data"];
    id v6 = 0LL;
  }

- (id)safeDateForKey:()SUCoreDictionary
{
  id v4 = a3;
  [a1 objectForKey:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v7 = objc_alloc_init(MEMORY[0x189607848]);
      [v7 setDateFormat:@"yyyy-MM-dd"];
      [v7 dateFromString:v5];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          goto LABEL_10;
        }
      }
    }

- (id)safeObjectForKey:()SUCoreDictionary ofClass:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = v7;
  }

  else
  {
    if (a4)
    {
      NSStringFromClass(a4);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        NSStringFromClass(a4);
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v10 = @"nil-object-class";
      }
    }

    else
    {
      id v10 = @"nil-object-class";
    }

    [a1 _logReturningNil:v7 forKey:v6 valueType:v10];

    id v8 = 0LL;
  }

  return v8;
}

- (uint64_t)safeDescriptionWithName:()SUCoreDictionary
{
  return [a1 _safeDescriptionWithName:a3 atNestedLevel:0 maxNestedLevel:3 showingSubLevelName:0 withMaxValueLength:0 providingSubstitutionMap:0];
}

- (uint64_t)safeDescriptionWithName:()SUCoreDictionary maxNestedLevel:withMaxValueLength:providingSubstitutionMap:
{
  return [a1 _safeDescriptionWithName:a3 atNestedLevel:0 maxNestedLevel:a4 showingSubLevelName:0 withMaxValueLength:a5 providingSubstitutionMap:a6];
}

- (id)_safeDescriptionWithName:()SUCoreDictionary atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:
{
  id v14 = a3;
  id v15 = a8;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  id v49 = 0LL;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  uint64_t v43 = 0LL;
  if (a4)
  {
    [NSString string];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringByPaddingToLength:4 * a4 withString:@" " startingAtIndex:0];
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (a6) {
      [NSString stringWithFormat:@"%@%@ <sub-dictionary>:\n%@{>>>\n", v17, v14, v17];
    }
    else {
    uint64_t v18 = [NSString stringWithFormat:@"%@{>>>\n", v17];
    }
    v20 = (void *)v45[5];
    v45[5] = v18;
  }

  else
  {
    uint64_t v19 = [NSString stringWithFormat:@"%@ <dictionary>:\n{>>>\n", v14];
    v20 = (void *)v45[5];
    v45[5] = v19;
    v17 = &stru_189FEB358;
  }

  uint64_t v21 = MEMORY[0x1895F87A8];
  v39[0] = MEMORY[0x1895F87A8];
  v39[1] = 3221225472LL;
  v39[2] = __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke;
  v39[3] = &unk_189FE98A0;
  v39[4] = &v40;
  [a1 enumerateKeysAndObjectsUsingBlock:v39];
  if (v41[3])
  {
    v22 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"[%llu]", a4);
    v30[0] = v21;
    v30[1] = 3221225472LL;
    v30[2] = __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke_2;
    v30[3] = &unk_189FE98C8;
    v34 = &v40;
    uint64_t v36 = a4;
    uint64_t v37 = a5;
    uint64_t v38 = a7;
    id v31 = v15;
    v35 = &v44;
    id v23 = v22;
    id v32 = v23;
    v33 = v17;
    [a1 enumerateKeysAndObjectsUsingBlock:v30];
  }

  v24 = (void *)v45[5];
  v25 = (void *)[objc_alloc(NSString) initWithFormat:@"%@<<<}", v17];
  uint64_t v26 = [v24 stringByAppendingString:v25];
  v27 = (void *)v45[5];
  v45[5] = v26;

  id v28 = (id)v45[5];
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v28;
}

- (id)safeSubDescriptionAtNestedLevel:()SUCoreDictionary instanceAtLevel:withMaxValueLength:providingSubstitutionMap:
{
  id v10 = a6;
  if (a3 == 1)
  {
    uint64_t v22 = 0LL;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    v25 = __Block_byref_object_copy__3;
    uint64_t v26 = __Block_byref_object_dispose__3;
    id v27 = 0LL;
    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    uint64_t v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    id v21 = 0LL;
    v15[0] = 0LL;
    v15[1] = v15;
    v15[2] = 0x2020000000LL;
    v15[3] = 0LL;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __126__NSDictionary_SUCoreDictionary__safeSubDescriptionAtNestedLevel_instanceAtLevel_withMaxValueLength_providingSubstitutionMap___block_invoke;
    v14[3] = &unk_189FE98F0;
    v14[4] = v15;
    v14[5] = &v22;
    v14[6] = &v16;
    v14[7] = a4;
    [a1 enumerateKeysAndObjectsUsingBlock:v14];
    v11 = (void *)v17[5];
    if (v11)
    {
      [v11 _safeDescriptionWithName:v23[5] atNestedLevel:1 maxNestedLevel:3 showingSubLevelName:1 withMaxValueLength:a5 providingSubstitutionMap:v10];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v12 = 0LL;
    }

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

+ (id)_safeKeyName:()SUCoreDictionary paddedToLength:
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  id v7 = v5;
  id v8 = v7;
  BOOL v9 = a4 >= v6;
  unint64_t v10 = a4 - v6;
  if (v10 != 0 && v9)
  {
    [NSString string];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 stringByPaddingToLength:v10 withString:@" " startingAtIndex:0];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)[objc_alloc(NSString) initWithFormat:@"%@%@", v12, v8];
LABEL_6:

    goto LABEL_7;
  }

  v13 = v7;
  if (!v9)
  {
    objc_msgSend(v7, "substringWithRange:", 0, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v8;
    goto LABEL_6;
  }

+ (__CFString)_safeValueName:()SUCoreDictionary ofMaxFieldLength:providingSubstitutionMap:
{
  id v7 = a3;
  id v8 = a5;
  if (!v7)
  {
    BOOL v9 = @"<nil>";
    goto LABEL_37;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!a4 || [v7 length] <= a4)
      {
        BOOL v9 = (__CFString *)v7;
        goto LABEL_37;
      }

      if (!v8)
      {
        if (a4 < 8)
        {
          BOOL v9 = @"<NSString>";
          goto LABEL_37;
        }

        unint64_t v17 = a4 - 2;
        uint64_t v18 = (void *)NSString;
        objc_msgSend(v7, "substringWithRange:", 0, v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 stringWithFormat:@"%@..", v11];
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }

      +[SUCore limitString:toMaxLength:providingSubstitutionMap:]( &OBJC_CLASS___SUCore,  "limitString:toMaxLength:providingSubstitutionMap:",  v7,  a4,  v8);
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10 || [v10 length] > a4)
      {
        BOOL v9 = @"<NSString>";
LABEL_36:

        goto LABEL_37;
      }
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v12 = [v7 unsignedLongLongValue];
        if (!v12)
        {
          BOOL v9 = @"0[NO]";
          goto LABEL_37;
        }

        if (v12 == 1)
        {
          BOOL v9 = @"1[YES]";
          goto LABEL_37;
        }

        [MEMORY[0x189603F90] currentLocale];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 descriptionWithLocale:v15];
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          BOOL v9 = @"<NSNumber>";
          goto LABEL_36;
        }
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (void *)objc_opt_new();
          [v11 setDateFormat:@"dd-MM-yyyy-hh-mm-ss"];
          [v11 stringFromDate:v7];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          id v14 = v13;
          if (v13) {
            BOOL v9 = v13;
          }
          else {
            BOOL v9 = @"<NSDate>";
          }

          goto LABEL_36;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          BOOL v9 = @"<NSDictionary>";
          goto LABEL_37;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          BOOL v9 = @"<NSData>";
          goto LABEL_37;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          BOOL v9 = @"<NSArray>";
          goto LABEL_37;
        }

        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          BOOL v9 = @"(not shown)";
          goto LABEL_36;
        }
      }
    }

    uint64_t v16 = v11;
LABEL_35:
    BOOL v9 = v16;
    goto LABEL_36;
  }

  BOOL v9 = @"<NSNull>";
LABEL_37:

  return v9;
}

- (id)safeSummary
{
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  v13 = @"{";
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x2020000000LL;
  char v7 = 1;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __45__NSDictionary_SUCoreDictionary__safeSummary__block_invoke;
  v5[3] = &unk_189FE9918;
  v5[4] = v6;
  v5[5] = &v8;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v1 = [(id)v9[5] stringByAppendingString:@"}"];
  v2 = (void *)v9[5];
  v9[5] = v1;

  id v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return v3;
}

+ (__CFString)safeSummaryForDictionary:()SUCoreDictionary
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v3 safeSummary];
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v4 = @"NOT-DICTIONARY";
    }
  }

  else
  {
    id v4 = @"NONE";
  }

  return v4;
}

- (void)_logReturningDefault:()SUCoreDictionary forKey:valueType:defaultValueName:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (a3)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543874;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_error_impl( &dword_187139000,  v13,  OS_LOG_TYPE_ERROR,  "[SUCoreDictionary] key '%{public}@' is the incorrect class, returning %{public}@ default value: %{public}@",  (uint8_t *)&v14,  0x20u);
    }
  }
}

- (uint64_t)_logReturningNil:()SUCoreDictionary forKey:valueType:
{
  return [a1 _logReturningNil:a3 forKey:a4 valueType:a5 fromBase:0 withKeyDescription:0];
}

- (void)_logReturningNil:()SUCoreDictionary forKey:valueType:fromBase:withKeyDescription:
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v11)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 oslog];
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v15)
      {
        if (v18)
        {
          id v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          int v27 = 138544386;
          id v28 = v14;
          __int16 v29 = 2114;
          id v30 = v12;
          __int16 v31 = 2114;
          id v32 = v15;
          __int16 v33 = 2114;
          id v34 = v20;
          __int16 v35 = 2114;
          id v36 = v13;
          id v21 = "[SUCoreDictionary] [%{public}@] key '%{public}@' (%{public}@) references value of the incorrect class (%"
                "{public}@), returning %{public}@ value: nil";
          uint64_t v22 = v17;
          uint32_t v23 = 52;
LABEL_14:
          _os_log_error_impl(&dword_187139000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, v23);
        }

- (void)safeTriStateForKey:()SUCoreDictionary defaultValue:.cold.1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189607968] numberWithInteger:a2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v5;
  OUTLINED_FUNCTION_0_3( &dword_187139000,  a3,  v6,  "[SUCoreDictionary] key '%{public}@' is invalid value: %{public}@, returning SUCoreTriStateNotSet",  (uint8_t *)&v7);
}

- (void)safeTriStateForKey:()SUCoreDictionary defaultValue:.cold.2( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_0_3( &dword_187139000,  a3,  (uint64_t)a3,  "[SUCoreDictionary] key '%{public}@' is invalid value: %{public}@, returning default value",  (uint8_t *)&v3);
}

@end