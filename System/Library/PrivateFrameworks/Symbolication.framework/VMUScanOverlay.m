@interface VMUScanOverlay
+ (BOOL)foundationHasNSSliceMemoryOptimization;
+ (id)defaultOverlay;
+ (id)defaultOverlayWithScanner:(id)a3;
- (NSArray)refinementRules;
- (VMUScanOverlay)initWithScanner:(id)a3;
- (void)addMetadataRefinementRule:(id)a3;
@end

@implementation VMUScanOverlay

+ (BOOL)foundationHasNSSliceMemoryOptimization
{
  if (foundationHasNSSliceMemoryOptimization_onceToken != -1) {
    dispatch_once(&foundationHasNSSliceMemoryOptimization_onceToken, &__block_literal_global_5);
  }
  return foundationHasNSSliceMemoryOptimization_foundationHasNSSliceMemoryOptimization;
}

objc_class *__56__VMUScanOverlay_foundationHasNSSliceMemoryOptimization__block_invoke()
{
  result = objc_getClass("NSConcreteHashTable");
  if (result)
  {
    result = (objc_class *)class_getInstanceVariable(result, "slice");
    if (result)
    {
      result = (objc_class *)ivar_getTypeEncoding((Ivar)result);
      if (result)
      {
        result = (objc_class *)strstr((const char *)result, "acquisitionProps");
        if (result) {
          foundationHasNSSliceMemoryOptimization_foundationHasNSSliceMemoryOptimization = 1;
        }
      }
    }
  }

  return result;
}

+ (id)defaultOverlay
{
  return (id)[a1 defaultOverlayWithScanner:0];
}

+ (id)defaultOverlayWithScanner:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__VMUScanOverlay_defaultOverlayWithScanner___block_invoke;
  block[3] = &unk_189DFDD08;
  id v9 = v3;
  uint64_t v4 = defaultOverlayWithScanner__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&defaultOverlayWithScanner__onceToken, block);
  }
  id v6 = (id)defaultOverlayWithScanner__s_defaultOverlay;

  return v6;
}

void __44__VMUScanOverlay_defaultOverlayWithScanner___block_invoke(uint64_t a1)
{
  v1 = -[VMUScanOverlay initWithScanner:]( objc_alloc(&OBJC_CLASS___VMUScanOverlay),  "initWithScanner:",  *(void *)(a1 + 32));
  v2 = (void *)defaultOverlayWithScanner__s_defaultOverlay;
  defaultOverlayWithScanner__s_defaultOverlay = (uint64_t)v1;
}

- (VMUScanOverlay)initWithScanner:(id)a3
{
  id v4 = a3;
  if (getenv("DT_NO_SCAN_OVERLAY"))
  {
    id v5 = 0LL;
  }

  else
  {
    v43.receiver = self;
    v43.super_class = (Class)&OBJC_CLASS___VMUScanOverlay;
    id v6 = -[VMUScanOverlay init](&v43, sel_init);
    if (v6)
    {
      uint64_t v7 = objc_opt_new();
      rules = v6->_rules;
      v6->_rules = (NSMutableArray *)v7;

      [MEMORY[0x189604010] setWithArray:&unk_189E1D048];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189604010] setWithArray:&unk_189E1D060];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = MEMORY[0x1895F87A8];
      v39[0] = MEMORY[0x1895F87A8];
      v39[1] = 3221225472LL;
      v39[2] = __34__VMUScanOverlay_initWithScanner___block_invoke;
      v39[3] = &unk_189DFDD80;
      id v12 = v9;
      id v40 = v12;
      id v41 = v10;
      id v42 = &unk_189E1D078;
      id v13 = v10;
      v31 = (void *)MEMORY[0x186E33044](v39);
      [v12 setByAddingObject:@"libswiftCore.dylib"];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 objectIdentifier];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 swiftRuntimeInfoStableABI];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }

      else
      {
        [v4 objectIdentifier];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 swiftRuntimeInfoPreABI];
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }

      [v15 swiftRuntimeInfoStableABI];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        [v4 objectIdentifier];
        id v21 = v12;
        id v22 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 swiftRuntimeInfoPreABI];
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        id v13 = v22;
        id v12 = v21;
        uint64_t v11 = MEMORY[0x1895F87A8];
      }

      else
      {
        v24 = 0LL;
      }

      v32[0] = v11;
      v32[1] = 3221225472LL;
      v32[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_4;
      v32[3] = &unk_189DFE170;
      id v33 = &unk_189E1D120;
      id v34 = v15;
      id v35 = v18;
      id v36 = v24;
      id v37 = v14;
      id v38 = v31;
      id v25 = v31;
      id v26 = v14;
      id v27 = v24;
      id v28 = v18;
      id v29 = v15;
      -[VMUScanOverlay addMetadataRefinementRule:](v6, "addMetadataRefinementRule:", v32);
    }

    self = v6;
    id v5 = self;
  }

  return v5;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x186E32E40]();
  [v3 binaryName];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 className];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    [v3 binaryName];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = [v7 containsObject:v8];

    if ((_DWORD)v7)
    {
      if (v6 && ([*(id *)(a1 + 40) containsObject:v6] & 1) == 0)
      {
        int v9 = [v3 pointerSize];
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 3221225472LL;
        v10[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_2;
        v10[3] = &unk_189DFDD58;
        id v11 = *(id *)(a1 + 48);
        id v12 = v3;
        int v13 = v9;
        [v12 mutateTypeFieldsWithBlock:v10];
      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        [v3 ivarName];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = [v10 isEqualToString:v9];

        if ((_DWORD)v9)
        {
          id v11 = (void *)[v3 mutableCopy];
          [v11 setScanType:4];
          id v12 = *(void **)(a1 + 40);
          v18[0] = MEMORY[0x1895F87A8];
          v18[1] = 3221225472LL;
          v18[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_3;
          v18[3] = &unk_189DFDD30;
          id v19 = v3;
          int v20 = *(_DWORD *)(a1 + 48);
          [v12 addVariant:v11 forField:v19 withEvaluator:v18];
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v6);
  }

  [v3 ivarName];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v3 scanType];

  if (v14 == 1)
  {
    [*(id *)(a1 + 40) displayName];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 stringByAppendingString:@" (Bytes Storage)"];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) binaryPath];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  v13,  v16,  16LL);
    [v17 setDefaultScanType:1];
    [v3 setDestinationLayout:v17];

LABEL_13:
  }
}

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [*(id *)(a1 + 32) offset];
  LODWORD(a1) = *(_DWORD *)(a1 + 40);
  uint64_t v8 = v7;
  uint64_t v9 = (uint64_t (*)(void))v8[2];
  if ((_DWORD)a1 == 8)
  {
    v10 = (uint64_t *)v9();
    if (v10)
    {
      uint64_t v11 = *v10;
      goto LABEL_7;
    }
  }

  else
  {
    id v12 = (unsigned int *)v9();
    if (v12)
    {
      uint64_t v11 = *v12;
      goto LABEL_7;
    }
  }

  uint64_t v11 = 0LL;
LABEL_7:

  if (v11)
  {
    [v6 classInfoForObjectAtAddress:v11];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 className];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = [v14 isEqualToString:@"NSWeakObjectValue"] ^ 1;
  }

  return v11;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_4(uint64_t a1, void *a2)
{
  v154[3] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if ([v3 infoType] == 1
    || [v3 infoType] == 8
    || [v3 infoType] == 64
    || [v3 infoType] == 128)
  {
    id v4 = (void *)MEMORY[0x186E32E40]();
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 className];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (const __CFString *)v6;
    }
    else {
      uint64_t v8 = &stru_189E010C8;
    }
    [v5 objectForKeyedSubscript:v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9) {
      [v3 setDisplayName:v9];
    }
    if ([v3 infoType] == 8
      || [v3 infoType] == 64
      || _isSwiftRootClass(v3))
    {
      [v3 className];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v10 hasPrefix:@"__"])
      {
        [v3 binaryPath];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 hasSuffix:@"libswiftCore.dylib"];

        if (v12)
        {
          [v3 className];
          int v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = [v13 substringFromIndex:2];
          goto LABEL_20;
        }
      }

      else
      {
      }

      [*(id *)(a1 + 40) vmuTask];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v13 isExclaveCore])
      {
LABEL_21:

LABEL_22:
        int v20 = *(void **)(a1 + 48);
        id v19 = *(void **)(a1 + 56);
        __int128 v21 = *(void **)(a1 + 40);
        objc_initWeak(&location, v3);
        id v22 = v20;
        id v23 = v19;
        objc_initWeak(&from, v21);
        id v24 = objc_loadWeakRetained(&location);
        if ([v24 infoType] == 64)
        {
        }

        else
        {
          id v25 = objc_loadWeakRetained(&location);
          int isSwiftRootClass = _isSwiftRootClass(v25);

          if (isSwiftRootClass)
          {
            id v27 = objc_loadWeakRetained(&location);
            uint64_t v143 = MEMORY[0x1895F87A8];
            uint64_t v144 = 3221225472LL;
            uint64_t v145 = (uint64_t)___variantForSwiftClass_block_invoke;
            v146 = &unk_189DFE198;
            objc_copyWeak(&v148, &location);
            id v147 = v22;
            [v27 mutateTypeFieldsWithBlock:&v143];

            objc_destroyWeak(&v148);
LABEL_27:
            objc_destroyWeak(&from);

            objc_destroyWeak(&location);
LABEL_28:

            objc_autoreleasePoolPop(v4);
            goto LABEL_29;
          }
        }

        id v28 = objc_loadWeakRetained(&location);
        uint64_t v143 = MEMORY[0x1895F87A8];
        uint64_t v144 = 3221225472LL;
        uint64_t v145 = (uint64_t)___variantForSwiftClass_block_invoke_2;
        v146 = &unk_189DFE260;
        id v147 = v22;
        objc_copyWeak(&v149, &location);
        id v148 = v23;
        objc_copyWeak(&v150, &from);
        [v28 mutateTypeFieldsRecursivelyWithBlock:&v143];

        objc_destroyWeak(&v150);
        objc_destroyWeak(&v149);

        goto LABEL_27;
      }

      [v3 className];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 hasPrefix:@"Swift.__"];

      if (!v16) {
        goto LABEL_22;
      }
      [v3 className];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 substringFromIndex:8];
LABEL_20:
      v17 = (void *)v14;
      [@"Swift." stringByAppendingString:v14];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setDisplayName:v18];

      goto LABEL_21;
    }

    if ([*(id *)(a1 + 40) taskIsDriverKit]
      && [v3 infoType] == 128)
    {
      goto LABEL_28;
    }

    if ([v3 isARR]) {
      goto LABEL_28;
    }
    id v29 = *(void **)(a1 + 64);
    [v3 binaryName];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = [v29 containsObject:v30];

    if (!(_DWORD)v29) {
      goto LABEL_28;
    }
    [v3 className];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    int v32 = [v31 isEqualToString:@"_CFXNotificationRegistrationContainer"];

    if (v32)
    {
      uint64_t v33 = [v3 pointerSize];
      [v3 firstFieldWithName:@"_children"];
      id v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        id v35 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( [VMUMutableFieldInfo alloc],  "initWithName:type:scan:offset:size:",  @"_children.elements",  @"^v",  2,  [v34 offset],  v33);
        id v36 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( [VMUMutableFieldInfo alloc],  "initWithName:type:scan:offset:size:",  @"_children.singleChildKey",  @"^v",  1,  [v34 offset] + v33,  v33);
        id v37 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( [VMUMutableFieldInfo alloc],  "initWithName:type:scan:offset:size:",  @"_children.callbacks",  @"^v",  2,  [v34 offset] + 2 * (_DWORD)v33,  v33);
        v154[0] = v35;
        v154[1] = v36;
        v154[2] = v37;
        [MEMORY[0x189603F18] arrayWithObjects:v154 count:3];
        id v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 replaceField:v34 withFields:v38];

        id v39 = -[VMUFieldInfo mutableCopy](v36, "mutableCopy");
        [v39 setScanType:4];
        unsigned int v40 = -[VMUFieldInfo offset](v37, "offset");
        v140[0] = MEMORY[0x1895F87A8];
        v140[1] = 3221225472LL;
        v140[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_5;
        v140[3] = &__block_descriptor_40_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
        unsigned int v141 = v40;
        int v142 = v33;
        [v3 addVariant:v39 forField:v36 withEvaluator:v140];
      }

      goto LABEL_42;
    }

    [v3 className];
    id v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v41 isEqualToString:@"__NSCFDictionary"])
    {

LABEL_41:
      _variantForCFBasicHash(v3);
LABEL_42:
      (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
      goto LABEL_28;
    }

    [v3 className];
    id v42 = (void *)objc_claimAutoreleasedReturnValue();
    int v43 = [v42 isEqualToString:@"__NSCFSet"];

    if (v43) {
      goto LABEL_41;
    }
    [v3 className];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    int v45 = [v44 isEqualToString:@"__NSCFString"];

    if (v45)
    {
      _destinationLayoutStorageVariant(v3, 16LL, @"content", 0LL, &stru_189E010C8);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 addVariant:v46 forField:0 withEvaluator:&__block_literal_global_236];
      [v3 setVariantScanType:0 withEvaluator:&__block_literal_global_237];

      goto LABEL_42;
    }

    [v3 className];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    int v48 = [v47 isEqualToString:@"NSConcreteHashTable"];

    if (v48
      || ([v3 className],
          v49 = (void *)objc_claimAutoreleasedReturnValue(),
          int v50 = [v49 isEqualToString:@"NSConcretePointerArray"],
          v49,
          v50))
    {
      v51 = @"slice";
      v52 = @"Object";
LABEL_48:
      _variantForNSSlice(v3, v51, v52);
      goto LABEL_42;
    }

    [v3 className];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    int v54 = [v53 isEqualToString:@"NSConcreteMapTable"];

    if (v54)
    {
      _variantForNSSlice(v3, @"keys", @"Key");
      v51 = @"values";
      v52 = @"Value";
      goto LABEL_48;
    }

    [v3 className];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    int v56 = [v55 isEqualToString:@"_CFXNotificationRegistrationBase"];

    if (v56)
    {
      v57 = &__block_literal_global_252;
      goto LABEL_61;
    }

    [v3 className];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    int v59 = [v58 isEqualToString:@"_NSThreadData"];

    if (v59)
    {
      v57 = &__block_literal_global_255;
      goto LABEL_61;
    }

    [v3 className];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    int v61 = [v60 isEqualToString:@"_CFXNotificationObserverRegistration"];

    if (v61)
    {
      v57 = &__block_literal_global_258;
      goto LABEL_61;
    }

    [v3 className];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v62 isEqualToString:@"_CFXNotificationObjectRegistration"])
    {

LABEL_60:
      v57 = &__block_literal_global_265;
      goto LABEL_61;
    }

    [v3 className];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    int v64 = [v63 isEqualToString:@"_CFXNotificationObjcObserverRegistration"];

    if (v64) {
      goto LABEL_60;
    }
    [v3 className];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    int v66 = [v65 isEqualToString:@"__NSObserver"];

    if (v66)
    {
      v57 = &__block_literal_global_270;
      goto LABEL_61;
    }

    [v3 className];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    int v68 = [v67 isEqualToString:@"_NSBindingInfo"];

    if (v68)
    {
      v57 = &__block_literal_global_275;
      goto LABEL_61;
    }

    [v3 className];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    int v70 = [v69 isEqualToString:@"_NSModelObservingTracker"];

    if (v70)
    {
      v57 = &__block_literal_global_280;
      goto LABEL_61;
    }

    [v3 className];
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    int v72 = [v71 isEqualToString:@"__NSOperationInternal"];

    if (v72)
    {
      v57 = &__block_literal_global_285;
      goto LABEL_61;
    }

    [v3 className];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    int v74 = [v73 isEqualToString:@"NSKeyValueObservance"];

    if (v74)
    {
      v57 = &__block_literal_global_292;
      goto LABEL_61;
    }

    [v3 className];
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    int v76 = [v75 isEqualToString:@"__NSSingleObjectArrayI"];

    if (v76)
    {
      v57 = &__block_literal_global_295;
      goto LABEL_61;
    }

    [v3 className];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    int v78 = [v77 isEqualToString:@"__NSSingleObjectSetI"];

    if (v78)
    {
      v57 = &__block_literal_global_296;
      goto LABEL_61;
    }

    [v3 className];
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v79 isEqualToString:@"__NSArrayM"])
    {
    }

    else
    {
      [v3 className];
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      int v81 = [v80 isEqualToString:@"__NSFrozenArrayM"];

      if (!v81)
      {
        [v3 className];
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v82 isEqualToString:@"__NSDictionaryM"])
        {
        }

        else
        {
          [v3 className];
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          int v84 = [v83 isEqualToString:@"__NSFrozenDictionaryM"];

          if (!v84)
          {
            [v3 className];
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v85 isEqualToString:@"__NSSetM"])
            {
            }

            else
            {
              [v3 className];
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              int v87 = [v86 isEqualToString:@"__NSFrozenSetM"];

              if (!v87)
              {
                [v3 className];
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                int v89 = [v88 isEqualToString:@"__NSArrayI"];

                if (v89)
                {
                  [v3 setDefaultScanType:2];
                  goto LABEL_42;
                }

                [v3 className];
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                int v91 = [v90 isEqualToString:@"NSResponder"];

                if (v91)
                {
                  v57 = &__block_literal_global_315;
                }

                else
                {
                  [v3 className];
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  int v93 = [v92 isEqualToString:@"NSMenuItem"];

                  if (v93)
                  {
                    v57 = &__block_literal_global_320;
                  }

                  else
                  {
                    [v3 className];
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    int v95 = [v94 isEqualToString:@"NSActionCell"];

                    if (v95)
                    {
                      v57 = &__block_literal_global_329;
                    }

                    else
                    {
                      [v3 className];
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      int v97 = [v96 isEqualToString:@"NSCellAuxiliary"];

                      if (v97)
                      {
                        v57 = &__block_literal_global_334;
                      }

                      else
                      {
                        [v3 className];
                        v98 = (void *)objc_claimAutoreleasedReturnValue();
                        int v99 = [v98 isEqualToString:@"NSMenu"];

                        if (v99)
                        {
                          v57 = &__block_literal_global_339;
                        }

                        else
                        {
                          [v3 className];
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          int v101 = [v100 isEqualToString:@"NSLayoutConstraint"];

                          if (v101)
                          {
                            v57 = &__block_literal_global_344;
                          }

                          else
                          {
                            [v3 className];
                            v102 = (void *)objc_claimAutoreleasedReturnValue();
                            int v103 = [v102 isEqualToString:@"NSLayoutAnchor"];

                            if (v103)
                            {
                              v57 = &__block_literal_global_353;
                            }

                            else
                            {
                              [v3 className];
                              v104 = (void *)objc_claimAutoreleasedReturnValue();
                              int v105 = [v104 isEqualToString:@"NSView"];

                              if (v105)
                              {
                                v57 = &__block_literal_global_358;
                              }

                              else
                              {
                                [v3 className];
                                v106 = (void *)objc_claimAutoreleasedReturnValue();
                                int v107 = [v106 isEqualToString:@"_NSViewAuxiliary"];

                                if (v107)
                                {
                                  v57 = &__block_literal_global_369;
                                }

                                else
                                {
                                  [v3 className];
                                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                                  int v109 = [v108 isEqualToString:@"NSTextInputContext"];

                                  if (v109)
                                  {
                                    v57 = &__block_literal_global_372;
                                  }

                                  else
                                  {
                                    [v3 className];
                                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                                    int v111 = [v110 isEqualToString:@"NSWeakObjectValue"];

                                    if (v111)
                                    {
                                      v57 = &__block_literal_global_375;
                                    }

                                    else
                                    {
                                      [v3 className];
                                      v112 = (void *)objc_claimAutoreleasedReturnValue();
                                      int v113 = [v112 isEqualToString:@"NSAccessibilityWeakReferenceContainer"];

                                      if (!v113)
                                      {
                                        [v3 className];
                                        v114 = (void *)objc_claimAutoreleasedReturnValue();
                                        if ([v114 isEqualToString:@"NSInputStream"])
                                        {
                                        }

                                        else
                                        {
                                          [v3 className];
                                          v115 = (void *)objc_claimAutoreleasedReturnValue();
                                          int v116 = [v115 isEqualToString:@"NSOutputStream"];

                                          if (!v116)
                                          {
                                            [v3 displayName];
                                            v123 = (void *)objc_claimAutoreleasedReturnValue();
                                            int v124 = [v123 isEqualToString:@"__SwiftNativeNSError"];

                                            if (v124)
                                            {
                                              [v3 setInfoType:8];
                                              goto LABEL_28;
                                            }

                                            [v3 className];
                                            v125 = (void *)objc_claimAutoreleasedReturnValue();
                                            int v126 = [v125 isEqualToString:@"_NSKVODeallocSentinel"];

                                            if (!v126) {
                                              goto LABEL_42;
                                            }
                                            v57 = &__block_literal_global_407;
                                            goto LABEL_61;
                                          }
                                        }

                                        [v3 firstFieldWithName:@"_reserved"];
                                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (v130)
                                        {
                                          uint64_t v117 = [v3 pointerSize];
                                          v129 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"error",  @"^v",  1LL,  (3 * v117),  v117);
                                          v128 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"client",  @"^{_CFStreamClient=}",  1LL,  (4 * v117),  v117);
                                          v127 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"info",  @"^v",  1LL,  (5 * v117),  v117);
                                          v118 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"callBacks",  @"^{_CFStreamCallBacks=}",  1LL,  (6 * v117),  v117);
                                          v119 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"streamLock",  @"^v",  1LL,  (7 * v117),  v117);
                                          v120 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"previousRunloopsAndModes",  @"^v",  1LL,  (8 * v117),  v117);
                                          v121 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"queue",  @"^v",  1LL,  (9 * v117),  v117);
                                          v153[0] = v129;
                                          v153[1] = v128;
                                          v153[2] = v127;
                                          v153[3] = v118;
                                          v153[4] = v119;
                                          v153[5] = v120;
                                          v153[6] = v121;
                                          [MEMORY[0x189603F18] arrayWithObjects:v153 count:7];
                                          v122 = (void *)objc_claimAutoreleasedReturnValue();
                                          [v3 replaceField:v130 withFields:v122];
                                        }

                                        goto LABEL_42;
                                      }

                                      v57 = &__block_literal_global_380;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }

BOOL __34__VMUScanOverlay_initWithScanner___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t (*)(void))v7[2];
  if (*(_DWORD *)(a1 + 36) != 8)
  {
    uint64_t v11 = (_DWORD *)v8();
    if (!v11) {
      goto LABEL_7;
    }
    uint64_t v10 = *v11;
    if (!*v11) {
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v13 = *(unsigned int *)(a1 + 36);
    uint64_t v14 = v10 + v13;
    v15 = (uint64_t (*)(void *, uint64_t, uint64_t))v7[2];
    if ((_DWORD)v13 == 8)
    {
      int v16 = (uint64_t *)v15(v7, v14, 8LL);
      if (v16)
      {
        uint64_t v17 = *v16;
LABEL_15:
        BOOL v12 = v17 == 0;
        goto LABEL_16;
      }
    }

    else
    {
      id v18 = (unsigned int *)v15(v7, v14, 4LL);
      if (v18)
      {
        uint64_t v17 = *v18;
        goto LABEL_15;
      }
    }

    uint64_t v17 = 0LL;
    goto LABEL_15;
  }

  uint64_t v9 = (uint64_t *)v8();
  if (v9)
  {
    uint64_t v10 = *v9;
    if (*v9) {
      goto LABEL_9;
    }
  }

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_6( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 16LL);
  if (result) {
    return !stringHasInlineContents(result);
  }
  return result;
}

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_7( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 16LL);
  if (result) {
    return stringHasInlineContents(result);
  }
  return result;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_8(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_parent"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_9(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_target"];

  if (v3) {
    [v4 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_10(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_observer"];

  if (v3) {
    [v4 setScanType:0];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_11(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_object"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_12(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"object"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_13(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_retainedController"];

  if (v3) {
    [v4 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_14(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_modelObserver"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_15(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"__outerOp"];

  if (v3) {
    [v6 setScanType:4];
  }
  [v6 ivarName];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:@"__completion"];

  if (v5) {
    [v6 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_16(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 scanType] == 1)
  {
    [v4 ivarName];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    char v3 = [v2 isEqualToString:@"_context"];

    if ((v3 & 1) == 0) {
      [v4 setScanType:4];
    }
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_17(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_object"];

  if (v3) {
    [v4 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_18(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"element"];

  if (v3) {
    [v4 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_19(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 ivarName];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 isEqualToString:@"_list"])
  {

LABEL_4:
    [*(id *)(a1 + 32) displayName];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringByAppendingString:@" (Storage)"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) binaryPath];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  v7,  v8,  16LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v9 setDefaultScanType:2];
    [v10 setDestinationLayout:v9];
    [v10 setScanType:2];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;

    goto LABEL_5;
  }

  [v10 ivarName];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:@"storage"];

  if (v5) {
    goto LABEL_4;
  }
LABEL_5:
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_20(uint64_t a1, void *a2)
{
  id v15 = a2;
  [v15 ivarName];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"_objs"];

  if ((v4 & 1) != 0)
  {
    int v5 = @" (Value Storage)";
    int v6 = 1;
  }

  else
  {
    [v15 ivarName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v7 isEqualToString:@"_keys"];

    if (v6) {
      int v5 = @" (Key Storage)";
    }
    else {
      int v5 = 0LL;
    }
  }

  [v15 ivarName];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 isEqualToString:@"storage"];

  if ((v9 & 1) != 0 || v6)
  {
    if (v9) {
      id v10 = @" (Storage)";
    }
    else {
      id v10 = v5;
    }
    [*(id *)(a1 + 32) displayName];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 stringByAppendingString:v10];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) binaryPath];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  v12,  v13,  16LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    [v14 setDefaultScanType:2];
    [v15 setDestinationLayout:v14];
    [v15 setScanType:2];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_21(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 ivarName];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 isEqualToString:@"_objs"])
  {

LABEL_4:
    [*(id *)(a1 + 32) displayName];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringByAppendingString:@" (Storage)"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) binaryPath];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  v7,  v8,  16LL);
    int v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v9 setDefaultScanType:2];
    [v10 setDestinationLayout:v9];
    [v10 setScanType:2];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;

    goto LABEL_5;
  }

  [v10 ivarName];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:@"storage"];

  if (v5) {
    goto LABEL_4;
  }
LABEL_5:
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_22(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_nextResponder"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_23(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_repObject"];

  if (v3) {
    [v8 setScanType:2];
  }
  [v8 ivarName];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:@"_submenu"];

  if (v5) {
    [v8 setScanType:2];
  }
  [v8 ivarName];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isEqualToString:@"_menu"];

  if (v7) {
    [v8 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_24(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_controlView"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_25(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"controlView"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_26(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_supermenu"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_27(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_container"];

  if (v3) {
    [v8 setScanType:4];
  }
  [v8 ivarName];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:@"_firstItem"];

  if (v5) {
    [v8 setScanType:4];
  }
  [v8 ivarName];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isEqualToString:@"_secondItem"];

  if (v7) {
    [v8 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_28(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_referenceItem"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_29(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_superview"];

  if (v3) {
    [v10 setScanType:4];
  }
  [v10 ivarName];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:@"_window"];

  if (v5) {
    [v10 setScanType:4];
  }
  [v10 ivarName];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isEqualToString:@"_viewController"];

  if (v7) {
    [v10 setScanType:8];
  }
  [v10 ivarName];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 isEqualToString:@"_ancestorWithLayerForLastLayerGeometryUpdate"];

  if (v9) {
    [v10 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_30(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_viewController"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_31(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_client"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_32(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_value"];

  if (v3) {
    [v6 setScanType:4];
  }
  [v6 ivarName];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:@"_object"];

  if (v5) {
    [v6 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_33(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_weakReference"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_34(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 ivarName];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqualToString:@"_observedObject"];

  if (v3) {
    [v4 setScanType:8];
  }
}

- (void)addMetadataRefinementRule:(id)a3
{
  rules = self->_rules;
  id v4 = (id)MEMORY[0x186E33044](a3, a2);
  -[NSMutableArray addObject:](rules, "addObject:", v4);
}

- (NSArray)refinementRules
{
  return &self->_rules->super;
}

- (void).cxx_destruct
{
}

@end