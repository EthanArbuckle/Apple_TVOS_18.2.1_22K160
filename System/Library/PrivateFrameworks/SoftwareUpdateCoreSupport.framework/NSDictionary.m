@interface NSDictionary
@end

@implementation NSDictionary

void __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke( uint64_t a1,  void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    unint64_t v3 = [v5 length];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (v3 > *(void *)(v4 + 24)) {
      *(void *)(v4 + 24) = v3;
    }
  }
}

void __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke_2( void *a1,  void *a2,  void *a3)
{
  id v24 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void *)(*(void *)(a1[7] + 8LL) + 24LL);
  if ((isKindOfClass & 1) == 0)
  {
    [MEMORY[0x189603F68] _safeKeyName:@"?" paddedToLength:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
    uint64_t v10 = [objc_alloc(NSString) initWithFormat:@"%@ %@%@: ?\n", a1[5], a1[6], v8, v23];
    goto LABEL_6;
  }

  [MEMORY[0x189603F68] _safeKeyName:v24 paddedToLength:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
    id v16 = objc_alloc(NSString);
    uint64_t v18 = a1[5];
    uint64_t v17 = a1[6];
    [MEMORY[0x189603F68] _safeValueName:v5 ofMaxFieldLength:a1[11] providingSubstitutionMap:a1[4]];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v16 initWithFormat:@"%@ %@%@: %@\n", v18, v17, v8, v11];
LABEL_9:
    v14 = (void *)v19;
    uint64_t v20 = [v15 stringByAppendingString:v19];
    uint64_t v21 = *(void *)(a1[8] + 8LL);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    goto LABEL_10;
  }

  if ((unint64_t)(a1[9] + 1LL) <= a1[10])
  {
    objc_msgSend( v5,  "_safeDescriptionWithName:atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:",  v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
    uint64_t v19 = [objc_alloc(NSString) initWithFormat:@"%@ %@%@: <sub-dictionary>:\n%@\n", a1[5], a1[6], v8, v11];
    goto LABEL_9;
  }

  v9 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
  uint64_t v10 = [objc_alloc(NSString) initWithFormat:@"%@ %@%@: <sub-dictionary> at depth=%llu\n", a1[5], a1[6], v8, a1[9]];
LABEL_6:
  v11 = (void *)v10;
  uint64_t v12 = [v9 stringByAppendingString:v10];
  uint64_t v13 = *(void *)(a1[8] + 8LL);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
LABEL_10:
}

void __126__NSDictionary_SUCoreDictionary__safeSubDescriptionAtNestedLevel_instanceAtLevel_withMaxValueLength_providingSubstitutionMap___block_invoke( void *a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v11 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v9 = *(void *)(a1[4] + 8LL);
      unint64_t v10 = *(void *)(v9 + 24);
      if (v10 >= a1[7])
      {
        objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a2);
        objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a3);
        *a4 = 1;
      }

      else
      {
        *(void *)(v9 + 24) = v10 + 1;
      }
    }
  }
}

void __45__NSDictionary_SUCoreDictionary__safeSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingString:@","];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v11 = *(void **)(v10 + 40);
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v12 = (void *)[objc_alloc(NSString) initWithFormat:@"%@:", v18];
    uint64_t v13 = [v11 stringByAppendingString:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = [*(id *)(v10 + 40) stringByAppendingString:@"?:"];
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v12 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
}

@end