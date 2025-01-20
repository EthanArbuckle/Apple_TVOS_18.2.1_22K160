@interface SUCoreErrorInformation
+ (id)codeNameForDomain:(id)a3 withCode:(int64_t)a4;
+ (id)codeNameForError:(id)a3;
+ (id)nameForSUCoreCode:(int64_t)a3;
+ (id)nameForSUCoreLayer:(int64_t)a3;
+ (id)safeUserInfoValueClasses;
+ (id)setupCoreErrorInformation;
+ (id)sharedErrorInformation;
+ (id)summaryOfIndications:(int64_t)a3;
+ (int64_t)allIndicationsForError:(id)a3;
+ (int64_t)indicationsForError:(id)a3 matchingMask:(int64_t)a4;
+ (int64_t)layerForError:(id)a3;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 indicating:(int64_t)a5 ifKeyTrue:(id)a6;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 keyMatchTrueMap:(id)a5;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 keyMatchTrueMap:(id)a6;
+ (void)attributesOfSUCoreErrorCode:(int64_t)a3 indicating:(int64_t)a4;
- (NSArray)safeUserInfoValues;
- (NSMutableDictionary)errorInformation;
- (NSMutableDictionary)layerInformation;
- (OS_dispatch_queue)informationQueue;
- (SUCoreErrorInformation)init;
- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6;
- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9;
- (void)_attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8;
- (void)_defineErrorLayers;
@end

@implementation SUCoreErrorInformation

+ (id)sharedErrorInformation
{
  if (sharedErrorInformation_errorInfoOnce != -1) {
    dispatch_once(&sharedErrorInformation_errorInfoOnce, &__block_literal_global_0);
  }
  return (id)sharedErrorInformation_errorInfo;
}

void __48__SUCoreErrorInformation_sharedErrorInformation__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___SUCoreErrorInformation);
  v1 = (void *)sharedErrorInformation_errorInfo;
  sharedErrorInformation_errorInfo = (uint64_t)v0;
}

- (SUCoreErrorInformation)init
{
  v15[5] = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SUCoreErrorInformation;
  v2 = -[SUCoreErrorInformation init](&v14, sel_init);
  if (v2)
  {
    v3 = (const char *)[@"com.apple.su.core.error.info" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create(v3, v4);
    informationQueue = v2->_informationQueue;
    v2->_informationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    layerInformation = v2->_layerInformation;
    v2->_layerInformation = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    errorInformation = v2->_errorInformation;
    v2->_errorInformation = v9;

    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x189603F18] arrayWithObjects:v15 count:5];
    safeUserInfoValues = v2->_safeUserInfoValues;
    v2->_safeUserInfoValues = (NSArray *)v11;
  }

  return v2;
}

- (void)_defineErrorLayers
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  100LL,  @"SUCoreError",  8100LL,  8126LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  110LL,  @"SUCoreError",  8200LL,  8206LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  130LL,  @"SUCoreError",  8250LL,  8255LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  101LL,  @"SUCoreError",  8300LL,  8300LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  620LL,  @"SUCoreError",  8400LL,  8411LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  102LL,  @"SUCoreError",  8500LL,  8503LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  150LL,  @"SUCoreError",  8600LL,  8608LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  410LL,  @"SUCoreError",  8700LL,  8707LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  500LL,  @"SUCoreError",  8800LL,  8804LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  140LL,  @"SUCoreError",  8900LL,  8909LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  910LL,  @"SUCoreError",  9900LL,  9900LL);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:]( self,  "_associateLayer:withDomain:minCode:maxCode:",  920LL,  @"SUCoreError",  9000LL,  9012LL);
}

- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6
{
}

- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9
{
  id v13 = a4;
  id v14 = a8;
  id v15 = a9;
  -[SUCoreErrorInformation informationQueue](self, "informationQueue");
  v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  v17 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithInt:a3];
  v18 = -[SUCoreErrorInformation layerInformation](self, "layerInformation");
  [v18 safeObjectForKey:v17 ofClass:objc_opt_class()];
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v20 oslog];
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:].cold.1( a3,  v21);
    }
  }

  else
  {
    id v19 = -[SUCoreErrorLayerGroup initForLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:]( objc_alloc(&OBJC_CLASS___SUCoreErrorLayerGroup),  "initForLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:",  a3,  v13,  a5,  a6,  a7,  v14,  v15);
    v22 = -[SUCoreErrorInformation layerInformation](self, "layerInformation");
    [v22 setSafeObject:v19 forKey:v17];
  }
}

- (void)_attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  -[SUCoreErrorInformation informationQueue](self, "informationQueue");
  v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  -[SUCoreErrorInformation errorInformation](self, "errorInformation");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 safeDictionaryForKey:v14 fromBase:@"SUCoreErrorInformation{_attributesOfErrorForDomain} errorInformation" withKeyDescription:@"error domain"];
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  v21 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithInteger:a4];
  if (!v20)
  {
    id v20 = objc_alloc_init(MEMORY[0x189603FC8]);
    v22 = -[SUCoreErrorInformation errorInformation](self, "errorInformation");
    [v22 setSafeObject:v20 forKey:v14];
  }

  [v20 safeObjectForKey:v21 ofClass:objc_opt_class()];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    id v24 = -[SUCoreErrorAttributes initForDomain:withCode:ofCodeName:indicating:ifKeyTrue:keyMatchTrueMap:]( objc_alloc(&OBJC_CLASS___SUCoreErrorAttributes),  "initForDomain:withCode:ofCodeName:indicating:ifKeyTrue:keyMatchTrueMap:",  v14,  a4,  v15,  a6,  v16,  v17);
    [v20 setSafeObject:v24 forKey:v21];
    goto LABEL_13;
  }

  id v24 = v23;
  id v33 = v16;
  int64_t v25 = a6;
  [v23 domain];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14, v26)
    && [v24 code] == a4)
  {
    [v24 codeName];
    id v27 = (id)objc_claimAutoreleasedReturnValue();

    if (v27 == v15)
    {
      [v24 setIndications:v25];
      id v16 = v33;
      [v24 setKeyMatchTrue:v33];
      [v24 setKeyMatchTrueMap:v17];
      goto LABEL_13;
    }
  }

  else
  {
  }
  v28 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v28 oslog];
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    [v24 domain];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    int v32 = [v24 code];
    [v24 codeName];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    id v35 = v14;
    __int16 v36 = 1024;
    int v37 = a4;
    __int16 v38 = 2114;
    id v39 = v15;
    __int16 v40 = 2114;
    v41 = v30;
    __int16 v42 = 1024;
    int v43 = v32;
    __int16 v44 = 2114;
    v45 = v31;
    _os_log_error_impl( &dword_187139000,  v29,  OS_LOG_TYPE_ERROR,  "[ERROR_INFORMATION] changing attributes of error [%{public}@:%d(%{public}@)] when already have attributes for erro r [%{public}@:%d(%{public}@)] | new attributes ignored",  buf,  0x36u);
  }

  id v16 = v33;
LABEL_13:
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4
{
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6
{
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 indicating:(int64_t)a5 ifKeyTrue:(id)a6
{
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 keyMatchTrueMap:(id)a5
{
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a9;
  +[SUCoreErrorInformation setupCoreErrorInformation](&OBJC_CLASS___SUCoreErrorInformation, "setupCoreErrorInformation");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 informationQueue];
  v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v18);

  [v17 informationQueue];
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __105__SUCoreErrorInformation_associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke;
  block[3] = &unk_189FE90A8;
  id v25 = v17;
  id v26 = v14;
  int64_t v29 = a3;
  int64_t v30 = a5;
  int64_t v31 = a6;
  int64_t v32 = a7;
  id v27 = v15;
  id v28 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v17;
  dispatch_sync(v19, block);
}

uint64_t __105__SUCoreErrorInformation_associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _associateLayer:*(void *)(a1 + 64) withDomain:*(void *)(a1 + 40) minCode:*(void *)(a1 + 72) maxCode:*(void *)(a1 + 80) indicating:*(void *)(a1 + 88) ifKeyTrue:*(void *)(a1 + 48) keyMatchTrueMap:*(void *)(a1 + 56)];
}

+ (void)attributesOfSUCoreErrorCode:(int64_t)a3 indicating:(int64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreErrorInformation attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:]( &OBJC_CLASS___SUCoreErrorInformation,  "attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:",  @"SUCoreError",  a3,  v6,  a4,  0LL,  0LL);
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5
{
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6
{
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7
{
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 keyMatchTrueMap:(id)a6
{
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  +[SUCoreErrorInformation setupCoreErrorInformation](&OBJC_CLASS___SUCoreErrorInformation, "setupCoreErrorInformation");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 informationQueue];
  v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v18);

  [v17 informationQueue];
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __108__SUCoreErrorInformation_attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke;
  block[3] = &unk_189FE90D0;
  id v26 = v17;
  id v27 = v13;
  int64_t v31 = a4;
  int64_t v32 = a6;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v17;
  dispatch_sync(v19, block);
}

uint64_t __108__SUCoreErrorInformation_attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _attributesOfErrorForDomain:*(void *)(a1 + 40) withCode:*(void *)(a1 + 72) codeName:*(void *)(a1 + 48) indicating:*(void *)(a1 + 80) ifKeyTrue:*(void *)(a1 + 56) keyMatchTrueMap:*(void *)(a1 + 64)];
}

+ (int64_t)layerForError:(id)a3
{
  id v3 = a3;
  v4 = +[SUCoreErrorInformation setupCoreErrorInformation](&OBJC_CLASS___SUCoreErrorInformation, "setupCoreErrorInformation");
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 10LL;
  [v4 informationQueue];
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  [v4 informationQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__SUCoreErrorInformation_layerForError___block_invoke;
  block[3] = &unk_189FE9120;
  id v12 = v4;
  id v13 = v3;
  id v14 = &v15;
  id v7 = v3;
  id v8 = v4;
  dispatch_sync(v6, block);

  int64_t v9 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v9;
}

void __40__SUCoreErrorInformation_layerForError___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __40__SUCoreErrorInformation_layerForError___block_invoke_2;
  v5[3] = &unk_189FE90F8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __40__SUCoreErrorInformation_layerForError___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  id v11 = a3;
  [*(id *)(a1 + 32) domain];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 domain];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v6, v7)) {
    goto LABEL_4;
  }
  if ([v11 minCode] == -1)
  {

    goto LABEL_7;
  }

  uint64_t v8 = [*(id *)(a1 + 32) code];
  if (v8 >= [v11 minCode])
  {
    uint64_t v9 = [*(id *)(a1 + 32) code];
    uint64_t v10 = [v11 maxCode];

    if (v9 > v10) {
      goto LABEL_8;
    }
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 errorLayer];
    *a4 = 1;
    goto LABEL_8;
  }

+ (id)codeNameForError:(id)a3
{
  id v3 = a3;
  +[SUCoreErrorInformation setupCoreErrorInformation](&OBJC_CLASS___SUCoreErrorInformation, "setupCoreErrorInformation");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0LL;
  [v4 informationQueue];
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  [v4 informationQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__SUCoreErrorInformation_codeNameForError___block_invoke;
  block[3] = &unk_189FE9120;
  id v12 = v4;
  id v13 = v3;
  id v14 = &v15;
  id v7 = v3;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __43__SUCoreErrorInformation_codeNameForError___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) domain];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 safeDictionaryForKey:v3 fromBase:@"SUCoreErrorInformation{codeNameForError} errorInformation" withKeyDescription:@"errorInStack domain"];
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    uint64_t v4 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607968]),  "initWithInteger:",  objc_msgSend(*(id *)(a1 + 40), "code"));
    [v25 safeObjectForKey:v4 ofClass:objc_opt_class()];
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)NSString;
      uint64_t v8 = [v5 codeName];
    }

    else
    {
      [*(id *)(a1 + 40) domain];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v16 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v15, @"SUCoreError");

      id v7 = (void *)NSString;
      if (!v16)
      {
        uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(*(id *)(a1 + 40), "code"));
        uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v17 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;
        goto LABEL_11;
      }

      uint64_t v8 = +[SUCoreErrorInformation nameForSUCoreCode:]( SUCoreErrorInformation,  "nameForSUCoreCode:",  [*(id *)(a1 + 40) code]);
    }

    uint64_t v17 = (void *)v8;
    uint64_t v18 = [v7 stringWithFormat:@"%@(%d)", v8, objc_msgSend(*(id *)(a1 + 40), "code")];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

LABEL_11:
    goto LABEL_12;
  }

  [*(id *)(a1 + 40) domain];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v9, @"SUCoreError");

  id v11 = (void *)NSString;
  if (v10)
  {
    +[SUCoreErrorInformation nameForSUCoreCode:]( SUCoreErrorInformation,  "nameForSUCoreCode:",  [*(id *)(a1 + 40) code]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 stringWithFormat:@"%@(%d)", v4, objc_msgSend(*(id *)(a1 + 40), "code")];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }

  else
  {
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(*(id *)(a1 + 40), "code"));
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v4 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }

+ (id)nameForSUCoreLayer:(int64_t)a3
{
  if (a3 <= 399)
  {
    if (a3 <= 139)
    {
      if (a3 > 101)
      {
        if (a3 > 119)
        {
          if (a3 == 120) {
            return @"Scheduler";
          }
          if (a3 == 130) {
            return @"PersistedState";
          }
        }

        else
        {
          if (a3 == 102) {
            return @"FSM";
          }
          if (a3 == 110) {
            return @"EventReporter";
          }
        }
      }

      else
      {
        if (a3 > 99)
        {
          if (a3 == 100) {
            return @"SUCore";
          }
          else {
            return @"Diag";
          }
        }

        if (!a3) {
          return &stru_189FEB358;
        }
        if (a3 == 10) {
          return @"?";
        }
      }
    }

    else if (a3 <= 160)
    {
      if (a3 > 150)
      {
        if (a3 == 151) {
          return @"CacheDelete";
        }
        if (a3 == 160) {
          return @"Power";
        }
      }

      else
      {
        if (a3 == 140) {
          return @"Connect";
        }
        if (a3 == 150) {
          return @"Space";
        }
      }
    }

    else if (a3 <= 209)
    {
      if (a3 == 161) {
        return @"PowerManagement";
      }
      if (a3 == 200) {
        return @"OperatingSystem";
      }
    }

    else
    {
      switch(a3)
      {
        case 210LL:
          return @"OSFilesystem";
        case 300LL:
          return @"Network";
        case 310LL:
          return @"NetworkServer";
      }
    }

    return @"!";
  }

  if (a3 > 599)
  {
    if (a3 > 709)
    {
      if (a3 <= 899)
      {
        if (a3 == 710) {
          return @"BridgeOS";
        }
        if (a3 == 711) {
          return @"BridgeOSAMAuthInstall";
        }
      }

      else
      {
        switch(a3)
        {
          case 900LL:
            return @"Test";
          case 910LL:
            return @"Simulate";
          case 920LL:
            return @"DocManager";
        }
      }
    }

    else if (a3 <= 619)
    {
      if (a3 == 600) {
        return @"Facility";
      }
      if (a3 == 610) {
        return @"Policy";
      }
    }

    else
    {
      switch(a3)
      {
        case 620LL:
          return @"Scan";
        case 630LL:
          return @"Update";
        case 700LL:
          return @"Extended";
      }
    }

    return @"!";
  }

  if (a3 > 499)
  {
    if (a3 > 510)
    {
      if (a3 == 511) {
        return @"Personalization";
      }
      if (a3 == 512) {
        return @"Preflight";
      }
    }

    else
    {
      if (a3 == 500) {
        return @"SoftwareUpdate";
      }
      if (a3 == 510) {
        return @"MSU";
      }
    }

    return @"!";
  }

  switch(a3)
  {
    case 400LL:
      id result = @"Asset";
      break;
    case 410LL:
      id result = @"MobileAsset";
      break;
    case 411LL:
      id result = @"MobileAssetDownload";
      break;
    case 412LL:
      id result = @"MobileAssetQuery";
      break;
    case 413LL:
      id result = @"MobileAssetPurge";
      break;
    case 414LL:
      id result = @"MobileAssetXPC";
      break;
    default:
      return @"!";
  }

  return result;
}

+ (id)codeNameForDomain:(id)a3 withCode:(int64_t)a4
{
  id v5 = a3;
  +[SUCoreErrorInformation setupCoreErrorInformation](&OBJC_CLASS___SUCoreErrorInformation, "setupCoreErrorInformation");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0LL;
  [v6 informationQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  [v6 informationQueue];
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__SUCoreErrorInformation_codeNameForDomain_withCode___block_invoke;
  block[3] = &unk_189FE9148;
  id v9 = v5;
  id v17 = v9;
  uint64_t v19 = &v21;
  int64_t v20 = a4;
  id v10 = v6;
  id v18 = v10;
  dispatch_sync(v8, block);

  id v11 = (void *)v22[5];
  if (!v11)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a4);
    uint64_t v13 = (void *)v22[5];
    v22[5] = v12;

    id v11 = (void *)v22[5];
  }

  id v14 = v11;

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __53__SUCoreErrorInformation_codeNameForDomain_withCode___block_invoke(uint64_t a1)
{
  if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  *(void *)(a1 + 32),  @"SUCoreError"))
  {
    uint64_t v2 = +[SUCoreErrorInformation nameForSUCoreCode:]( &OBJC_CLASS___SUCoreErrorInformation,  "nameForSUCoreCode:",  *(void *)(a1 + 56));
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

  else
  {
    [*(id *)(a1 + 40) errorInformation];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 safeDictionaryForKey:*(void *)(a1 + 32) fromBase:@"SUCoreErrorInformation{codeNameForDomain} errorInformation" withKeyDescription:@"error domain"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v4 = v12;
    if (v12)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithInteger:*(void *)(a1 + 56)];
      [v12 safeObjectForKey:v6 ofClass:objc_opt_class()];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 codeName];
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }

      uint64_t v4 = v12;
    }
  }
}

+ (id)nameForSUCoreCode:(int64_t)a3
{
  if (a3 > 8499)
  {
    if (a3 > 8899)
    {
      if (a3 <= 9099)
      {
        switch(a3)
        {
          case 9000LL:
            id result = @"kSUCoreErrorDocManagerAllocationFailure";
            break;
          case 9001LL:
            id result = @"kSUCoreErrorDocManagerDirectoryDeleteFailure";
            break;
          case 9002LL:
            id result = @"kSUCoreErrorDocManagerDirectoryCopyFailure";
            break;
          case 9003LL:
            id result = @"kSUCoreErrorDocManagerDirectoryReadFailure";
            break;
          case 9004LL:
            id result = @"kSUCoreErrorDocManagerPathCreateFailure";
            break;
          case 9005LL:
            id result = @"kSUCoreErrorDocManagerInstalledBuildCreateFailure";
            break;
          case 9006LL:
            id result = @"kSUCoreErrorDocManagerDetermineOSBuildFailure";
            break;
          case 9007LL:
            return @"Unknown Error Code";
          case 9008LL:
            id result = @"kSUCoreErrorDocManagerCreateInstalledStashedDataDictFailed";
            break;
          case 9009LL:
            id result = @"kSUCoreErrorDocManagerStashedBuildVersionNotFound";
            break;
          case 9010LL:
            id result = @"kSUCoreErrorDocDataCreateFailed";
            break;
          case 9011LL:
            id result = @"kSUCoreErrorDocDataAssetRefreshFailed";
            break;
          case 9012LL:
            id result = @"kSUCoreErrorDocDataAssetNotLocal";
            break;
          default:
            switch(a3)
            {
              case 8900LL:
                id result = @"kSUCoreErrorConnectClientDoesNotRespond";
                break;
              case 8902LL:
                id result = @"kSUCoreErrorConnectClientDecodeFailure";
                break;
              case 8903LL:
                id result = @"kSUCoreErrorConnectClientDecodeException";
                break;
              case 8904LL:
                id result = @"kSUCoreErrorConnectServerDecodeFailure";
                break;
              case 8905LL:
                id result = @"kSUCoreErrorConnectServerDecodeException";
                break;
              case 8906LL:
                id result = @"kSUCoreErrorConnectClientIsObserverOnly";
                break;
              case 8907LL:
                id result = @"kSUCoreErrorConnectClientIDMismatch";
                break;
              case 8908LL:
                id result = @"kSUCoreErrorConnectMessagedIDMismatch";
                break;
              case 8909LL:
                id result = @"kSUCoreErrorConnectNoServerConnection";
                break;
              default:
                return @"Unknown Error Code";
            }

            break;
        }
      }

      else
      {
        if (a3 > 9899)
        {
          if (a3 == 9900) {
            return @"kSUCoreErrorSimulatedFailure";
          }
          if (a3 == 90007) {
            return @"kSUCoreErrorDocManagerFileEvictionFailure";
          }
        }

        else
        {
          if (a3 == 9100) {
            return @"kSUCoreErrorDDMInvalidDeclarationFailure";
          }
          if (a3 == 9101) {
            return @"kSUCoreErrorDDMNoControllerFailure";
          }
        }

        return @"Unknown Error Code";
      }
    }

    else if (a3 > 8699)
    {
      switch(a3)
      {
        case 8700LL:
          id result = @"kSUCoreErrorAssetDownloadFailed";
          break;
        case 8701LL:
          id result = @"kSUCoreErrorAssetPurgeFailed";
          break;
        case 8702LL:
          id result = @"kSUCoreErrorCancelingDownload";
          break;
        case 8703LL:
          id result = @"kSUCoreErrorConfiguringDownload";
          break;
        case 8704LL:
          id result = @"kSUCoreErrorAssetReloadFailed";
          break;
        case 8705LL:
          id result = @"kSUCoreErrorAssetReloadNotFound";
          break;
        case 8706LL:
          id result = @"kSUCoreErrorAssetRefreshFailed";
          break;
        case 8707LL:
          id result = @"kSUCoreErrorAssetNotLocal";
          break;
        default:
          switch(a3)
          {
            case 8800LL:
              id result = @"kSUCoreErrorMSUPreflightSUDownloadFailed";
              break;
            case 8801LL:
              id result = @"kSUCoreErrorMSUPurgeFailed";
              break;
            case 8802LL:
              id result = @"kSUCoreErrorMSUPreviousUpdateStateFailed";
              break;
            case 8803LL:
              id result = @"kSUCoreErrorMSUMissingDescriptor";
              break;
            case 8804LL:
              id result = @"kSUCoreErrorMSUPrepareFailed";
              break;
            default:
              return @"Unknown Error Code";
          }

          break;
      }
    }

    else
    {
      switch(a3)
      {
        case 8600LL:
          id result = @"kSUCoreErrorSpaceInsufficient";
          break;
        case 8601LL:
          id result = @"kSUCoreErrorSpaceNoPurgeResults";
          break;
        case 8602LL:
          id result = @"kSUCoreErrorSpaceCheckFailed";
          break;
        case 8603LL:
          id result = @"kSUCoreErrorSpaceNoCacheDeletePurgeableResults";
          break;
        case 8604LL:
          id result = @"kSUCoreErrorSpaceCacheDeletePurgeableFailed";
          break;
        case 8605LL:
          id result = @"kSUCoreErrorSpaceNoAppOffloadPurgeableResults";
          break;
        case 8606LL:
          id result = @"kSUCoreErrorSpaceAppOffloadPurgeableFailed";
          break;
        case 8607LL:
          id result = @"kSUCoreErrorSpaceNoAppOffloadPurgeResults";
          break;
        case 8608LL:
          id result = @"kSUCoreErrorSpaceAppOffloadFailed";
          break;
        default:
          switch(a3)
          {
            case 8500LL:
              id result = @"kSUCoreErrorFSMStateInvalidForTable";
              break;
            case 8501LL:
              id result = @"kSUCoreErrorFSMEventInvalidForState";
              break;
            case 8502LL:
              id result = @"kSUCoreErrorFSMAlreadyActive";
              break;
            case 8503LL:
              id result = @"kSUCoreErrorFSMInvalidTable";
              break;
            default:
              return @"Unknown Error Code";
          }

          break;
      }
    }
  }

  else if (a3 > 8249)
  {
    switch(a3)
    {
      case 8400LL:
        id result = @"kSUCoreErrorScanCatalogDownloadFailed";
        break;
      case 8401LL:
        id result = @"kSUCoreErrorScanQueryMetadataFailed";
        break;
      case 8402LL:
        id result = @"kSUCoreErrorScanFailed";
        break;
      case 8403LL:
        id result = @"kSUCoreErrorScanCanceled";
        break;
      case 8404LL:
        id result = @"kSUCoreErrorScanFailCanceling";
        break;
      case 8405LL:
        id result = @"kSUCoreErrorScanNotCanceling";
        break;
      case 8406LL:
        id result = @"kSUCoreErrorScanNoUpdateFound";
        break;
      case 8407LL:
        id result = @"kSUCoreErrorScanNoDocFound";
        break;
      case 8408LL:
        id result = @"kSUCoreErrorScanFoundDifferent";
        break;
      case 8409LL:
        id result = @"kSUCoreErrorScanFoundMultiple";
        break;
      case 8410LL:
        id result = @"kSUCoreErrorScanAbortedStale";
        break;
      case 8411LL:
        id result = @"kSUCoreErrorScanFailedToDeterminePSUSAssets";
        break;
      default:
        switch(a3)
        {
          case 8250LL:
            id result = @"kSUCoreErrorPersistedStateNotLoaded";
            break;
          case 8251LL:
            id result = @"kSUCoreErrorPersistedStateLoadFailed";
            break;
          case 8252LL:
            id result = @"kSUCoreErrorPersistedStateMissingContents";
            break;
          case 8253LL:
            id result = @"kSUCoreErrorPersistedStateInvalidType";
            break;
          case 8254LL:
            id result = @"kSUCoreErrorPersistedStateArchiverError";
            break;
          case 8255LL:
            id result = @"kSUCoreErrorPersistedStateClassMismatch";
            break;
          default:
            if (a3 != 8300) {
              return @"Unknown Error Code";
            }
            id result = @"kSUCoreErrorDiagDecoded";
            break;
        }

        break;
    }
  }

  else
  {
    switch(a3)
    {
      case 8100LL:
        id result = @"kSUCoreErrorCreateFailed";
        break;
      case 8101LL:
        id result = @"kSUCoreErrorMissingRequired";
        break;
      case 8102LL:
        id result = @"kSUCoreErrorInvalidParam";
        break;
      case 8103LL:
        id result = @"kSUCoreErrorUnknownFormat";
        break;
      case 8104LL:
        id result = @"kSUCoreErrorReadFailure";
        break;
      case 8105LL:
        id result = @"kSUCoreErrorCopyFailed";
        break;
      case 8106LL:
        id result = @"kSUCoreErrorSerializedFailed";
        break;
      case 8107LL:
        id result = @"kSUCoreErrorInvalidPayload";
        break;
      case 8108LL:
        id result = @"kSUCoreErrorTooManyQueued";
        break;
      case 8109LL:
        id result = @"kSUCoreErrorWriteFailure";
        break;
      case 8110LL:
        id result = @"kSUCoreErrorRemoveFailed";
        break;
      case 8111LL:
        id result = @"kSUCoreErrorAlreadyAssigned";
        break;
      case 8112LL:
        id result = @"kSUCoreErrorTypeMismatch";
        break;
      case 8113LL:
        id result = @"kSUCoreErrorNotSupported";
        break;
      case 8114LL:
        id result = @"kSUCoreErrorIgnoredParam";
        break;
      case 8115LL:
        id result = @"kSUCoreErrorInvalidState";
        break;
      case 8116LL:
        id result = @"kSUCoreErrorUnexpectedValue";
        break;
      case 8117LL:
        id result = @"kSUCoreErrorInconsistencyDetected";
        break;
      case 8118LL:
        id result = @"kSUCoreErrorInvalidPolicyAssetType";
        break;
      case 8119LL:
        id result = @"kSUCoreErrorOperationTimedOut";
        break;
      case 8120LL:
        id result = @"kSUCoreErrorExistingTransaction";
        break;
      case 8121LL:
        id result = @"kSUCoreErrorLoadfailed";
        break;
      case 8122LL:
        id result = @"kSUCoreErrorMethodNotAvailable";
        break;
      case 8123LL:
        id result = @"kSUCoreErrorDeprecated";
        break;
      case 8124LL:
        id result = @"kSUCoreErrorOperationCanceled";
        break;
      case 8125LL:
        id result = @"kSUCoreErrorFileNotFound";
        break;
      case 8126LL:
        id result = @"kSUCoreErrorMissingAuthentication";
        break;
      default:
        switch(a3)
        {
          case 8200LL:
            id result = @"kSUCoreErrorEventReporterInvalidTask";
            break;
          case 8201LL:
            id result = @"kSUCoreErrorEventReporterInvalidTaskDescriptor";
            break;
          case 8202LL:
            id result = @"kSUCoreErrorEventReporterSendFailed";
            break;
          case 8203LL:
            id result = @"kSUCoreErrorEventReporterInvalidResponse";
            break;
          case 8204LL:
            id result = @"kSUCoreErrorEventReporterInvalidFileUUID";
            break;
          case 8205LL:
            id result = @"kSUCoreErrorEventReporterNoResponse";
            break;
          case 8206LL:
            id result = @"kSUCoreErrorEventReporterResponseNotHTTP";
            break;
          default:
            if (a3) {
              return @"Unknown Error Code";
            }
            id result = @"kSUCoreErrorNone";
            break;
        }

        break;
    }
  }

  return result;
}

+ (id)summaryOfIndications:(int64_t)a3
{
  int v3 = a3;
  uint64_t v4 = 0LL;
  id v5 = &stru_189FEB358;
  do
  {
    if (((1 << v4) & v3) != 0)
    {
      id v6 = (void *)NSString;
      +[SUCoreErrorAttributes nameForIndication:](&OBJC_CLASS___SUCoreErrorAttributes, "nameForIndication:");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 stringWithFormat:@"|%@", v7];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v8);

      id v5 = (__CFString *)v9;
    }

    ++v4;
  }

  while (v4 != 5);
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_189FEB358) & 1) != 0)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", @"|");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = v11;
    id v5 = v10;
  }

  return v10;
}

+ (id)safeUserInfoValueClasses
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  [v2 informationQueue];
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  [v2 informationQueue];
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __50__SUCoreErrorInformation_safeUserInfoValueClasses__block_invoke;
  v8[3] = &unk_189FE9010;
  id v9 = v2;
  uint64_t v10 = &v11;
  id v5 = v2;
  dispatch_sync(v4, v8);

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __50__SUCoreErrorInformation_safeUserInfoValueClasses__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) safeUserInfoValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (int64_t)allIndicationsForError:(id)a3
{
  return +[SUCoreErrorInformation indicationsForError:matchingMask:]( &OBJC_CLASS___SUCoreErrorInformation,  "indicationsForError:matchingMask:",  a3,  255LL);
}

+ (int64_t)indicationsForError:(id)a3 matchingMask:(int64_t)a4
{
  id v5 = a3;
  +[SUCoreErrorInformation setupCoreErrorInformation](&OBJC_CLASS___SUCoreErrorInformation, "setupCoreErrorInformation");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  [v6 informationQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  [v6 informationQueue];
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke;
  v13[3] = &unk_189FE91C0;
  id v14 = v6;
  id v15 = v5;
  id v16 = &v18;
  int64_t v17 = a4;
  id v9 = v5;
  id v10 = v6;
  dispatch_sync(v8, v13);

  int64_t v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) domain];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 safeDictionaryForKey:v3 fromBase:@"SUCoreErrorInformation{isIndication} errorInformation" withKeyDescription:@"errorInStack domain"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    uint64_t v43 = 0LL;
    __int16 v44 = &v43;
    uint64_t v45 = 0x2020000000LL;
    uint64_t v46 = 0LL;
    uint64_t v37 = 0LL;
    __int16 v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    __int16 v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    id v42 = 0LL;
    uint64_t v31 = 0LL;
    int64_t v32 = &v31;
    uint64_t v33 = 0x3032000000LL;
    v34 = __Block_byref_object_copy__0;
    id v35 = __Block_byref_object_dispose__0;
    id v36 = 0LL;
    id v5 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607968]),  "initWithInteger:",  objc_msgSend(*(id *)(a1 + 40), "code"));
    [v4 safeObjectForKey:v5 ofClass:objc_opt_class()];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v6;
    if (v6
      && ([v6 indications]
       || ([v7 keyMatchTrueMap], uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8)))
    {
      uint64_t v9 = [v7 indications];
      v44[3] = v9;
      uint64_t v10 = [v7 keyMatchTrue];
      int64_t v11 = (void *)v38[5];
      v38[5] = v10;

      uint64_t v12 = [v7 keyMatchTrueMap];
      uint64_t v13 = (void *)v32[5];
      v32[5] = v12;
    }

    else
    {
      [*(id *)(a1 + 32) layerInformation];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_2;
      v26[3] = &unk_189FE9170;
      id v27 = *(id *)(a1 + 40);
      id v28 = &v43;
      id v29 = &v37;
      id v30 = &v31;
      [v14 enumerateKeysAndObjectsUsingBlock:v26];

      uint64_t v13 = v27;
    }

    uint64_t v15 = v44[3];
    if (!v15 && !v32[5]) {
      goto LABEL_15;
    }
    if (v38[5])
    {
      [*(id *)(a1 + 40) userInfo];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = [v16 safeBooleanForKey:v38[5]];

      if (v17)
      {
        uint64_t v15 = v44[3];
LABEL_14:
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) |= *(void *)(a1 + 56) & v15;
      }
    }

    else
    {
      uint64_t v18 = (void *)v32[5];
      if (!v18) {
        goto LABEL_14;
      }
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_3;
      v22[3] = &unk_189FE9198;
      id v19 = *(id *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(a1 + 56);
      id v23 = v19;
      uint64_t v24 = v20;
      uint64_t v25 = v21;
      [v18 enumerateKeysAndObjectsUsingBlock:v22];
    }

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  id v17 = a3;
  [*(id *)(a1 + 32) domain];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 domain];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v6, v7)) {
    goto LABEL_4;
  }
  if ([v17 minCode] == -1)
  {

    goto LABEL_7;
  }

  uint64_t v8 = [*(id *)(a1 + 32) code];
  if (v8 >= [v17 minCode])
  {
    uint64_t v9 = [*(id *)(a1 + 32) code];
    uint64_t v10 = [v17 maxCode];

    if (v9 > v10) {
      goto LABEL_8;
    }
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v17 indications];
    uint64_t v11 = [v17 keyMatchTrue];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [v17 keyMatchTrueMap];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
    goto LABEL_8;
  }

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v6 = [v5 unsignedLongLongValue];
      [*(id *)(a1 + 32) userInfo];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      int v8 = [v7 safeBooleanForKey:v9];

      if (v8) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= *(void *)(a1 + 48) & v6;
      }
    }
  }
}

+ (id)setupCoreErrorInformation
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke;
  block[3] = &unk_189FE8FE8;
  id v3 = v2;
  id v6 = v3;
  if (setupCoreErrorInformation_coreErrorInfoOnce != -1) {
    dispatch_once(&setupCoreErrorInformation_coreErrorInfoOnce, block);
  }

  return v3;
}

void __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v2);

  [*(id *)(a1 + 32) informationQueue];
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke_2;
  block[3] = &unk_189FE8FE8;
  id v5 = *(id *)(a1 + 32);
  dispatch_sync(v3, block);
}

uint64_t __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _defineErrorLayers];
}

- (OS_dispatch_queue)informationQueue
{
  return self->_informationQueue;
}

- (NSMutableDictionary)layerInformation
{
  return self->_layerInformation;
}

- (NSMutableDictionary)errorInformation
{
  return self->_errorInformation;
}

- (NSArray)safeUserInfoValues
{
  return self->_safeUserInfoValues;
}

- (void).cxx_destruct
{
}

- (void)_associateLayer:(uint64_t)a1 withDomain:(os_log_s *)a2 minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:.cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  +[SUCoreErrorInformation nameForSUCoreLayer:](&OBJC_CLASS___SUCoreErrorInformation, "nameForSUCoreLayer:", a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl( &dword_187139000,  a2,  OS_LOG_TYPE_ERROR,  "[ERROR_INFORMATION] layer group(%{public}@) already defined",  (uint8_t *)&v4,  0xCu);
}

@end