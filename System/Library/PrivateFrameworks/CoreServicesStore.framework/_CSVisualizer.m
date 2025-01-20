@interface _CSVisualizer
+ (BOOL)getUnit:(unsigned int *)a3 inTable:(unsigned int *)a4 fromURL:(id)a5;
+ (BOOL)unitDescription:(id)a3 referencesUnit:(unsigned int)a4 inTable:(unsigned int)a5;
+ (_CSVisualizer)new;
+ (_NSRange)rangeOfValueForTitle:(id)a3 inDescription:(id)a4;
+ (id)URLForUnit:(unsigned int)a3 inTable:(unsigned int)a4;
+ (id)predicateForSearchingDescriptionWithString:(id)a3 error:(id *)a4;
+ (void)breakDownTable:(const Table *)a3 inStore:(const void *)a4 buffer:(char *)a5;
+ (void)enumerateReferencesToUnitsInUnitDescription:(id)a3 block:(id)a4;
+ (void)enumerateValuesForTitlesInDescription:(id)a3 block:(id)a4;
- (NSMutableDictionary)userInfo;
- (_CSVisualizer)init;
- (_CSVisualizer)initWithStore:(__CSStore *)a3;
- (_CSVisualizer)initWithStore:(__CSStore *)a3 useStandardTableFunctions:(BOOL)a4;
- (__CSStore)store;
- (id)breakDownUsage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfUnit:(unsigned int)a3 inTable:(unsigned int)a4;
- (id)functionsForTable:(unsigned int)a3;
- (id)functionsForTableNoCopy:(unsigned int)a3;
- (id)handlerForTable:(unsigned int)a3;
- (id)summaryOfUnit:(unsigned int)a3 inTable:(unsigned int)a4;
- (void)dealloc;
- (void)enumerateReferencesToUnit:(unsigned int)a3 inTable:(unsigned int)a4 block:(id)a5;
- (void)setFunctions:(id)a3 forTable:(unsigned int)a4;
- (void)setHandler:(id)a3 forTable:(unsigned int)a4;
- (void)setStandardTableFunctions;
@end

@implementation _CSVisualizer

- (_CSVisualizer)init
{
}

- (_CSVisualizer)initWithStore:(__CSStore *)a3
{
  return -[_CSVisualizer initWithStore:useStandardTableFunctions:]( self,  "initWithStore:useStandardTableFunctions:",  a3,  1LL);
}

- (_CSVisualizer)initWithStore:(__CSStore *)a3 useStandardTableFunctions:(BOOL)a4
{
  BOOL v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____CSVisualizer;
  v6 = -[_CSVisualizer init](&v14, sel_init);
  if (v6)
  {
    v6->_store = (__CSStore *)CFRetain(a3);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    functions = v6->_functions;
    v6->_functions = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    userInfo = v6->_userInfo;
    v6->_userInfo = v9;

    v11 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1896079F8]);
    lock = v6->_lock;
    v6->_lock = v11;

    if (v4) {
      -[_CSVisualizer setStandardTableFunctions](v6, "setStandardTableFunctions");
    }
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____CSVisualizer;
  -[_CSVisualizer dealloc](&v3, sel_dealloc);
}

- (id)functionsForTableNoCopy:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  functions = self->_functions;
  [MEMORY[0x189607968] numberWithUnsignedInt:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSMutableDictionary objectForKeyedSubscript:](functions, "objectForKeyedSubscript:", v6);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (id)functionsForTable:(unsigned int)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = (void *)[v3 copy];

  return v4;
}

- (void)setFunctions:(id)a3 forTable:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v6 = (void *)[v9 copy];
  functions = self->_functions;
  [MEMORY[0x189607968] numberWithUnsignedInt:v4];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](functions, "setObject:forKeyedSubscript:", v6, v8);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setStandardTableFunctions
{
  uint64_t v3 = -[_CSVisualizer store](self, "store");
  uint64_t v4 = v3;
  if (performConstantAssertions)
  {
    uint64_t v5 = *((void *)v3 + 43);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
    }
  }

  v6 = (CSStore2 **)((char *)v4 + 8);
  Table = (char *)*((void *)v4 + 34);
  uint64_t v8 = MEMORY[0x1895F87A8];
  if (Table || (Table = CSStore2::Store::getTable((CSStore2 **)v4 + 1, @"<array>")) != 0LL)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS____CSVisualizerTableFunctions);
    v17[0] = v8;
    v17[1] = 3221225472LL;
    v17[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke;
    v17[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v17[4] = (char *)v4 + 8;
    -[_CSVisualizerTableFunctions setGetDescription:](v9, "setGetDescription:", v17);
    -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v9, (4 * *(_DWORD *)Table));
  }

  v10 = (char *)*((void *)v4 + 35);
  if (v10 || (v10 = CSStore2::Store::getTable((CSStore2 **)v4 + 1, @"<string>")) != 0LL)
  {
    v11 = objc_alloc_init(&OBJC_CLASS____CSVisualizerTableFunctions);
    v16[0] = v8;
    v16[1] = 3221225472LL;
    v16[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_2;
    v16[3] = &__block_descriptor_40_e39___NSString_24__0___CSVisualizer_8I16I20l;
    v16[4] = (char *)v4 + 8;
    -[_CSVisualizerTableFunctions setGetSummary:](v11, "setGetSummary:", v16);
    v15[0] = v8;
    v15[1] = 3221225472LL;
    v15[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_3;
    v15[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v15[4] = (char *)v4 + 8;
    -[_CSVisualizerTableFunctions setGetDescription:](v11, "setGetDescription:", v15);
    -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v11, (4 * *(_DWORD *)v10));
  }

  v12 = (char *)*((void *)v4 + 36);
  if (v12 || (v12 = CSStore2::Store::getTable(v6, @"<dictionary>")) != 0LL)
  {
    v13 = objc_alloc_init(&OBJC_CLASS____CSVisualizerTableFunctions);
    v14[0] = v8;
    v14[1] = 3221225472LL;
    v14[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_4;
    v14[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v14[4] = v6;
    -[_CSVisualizerTableFunctions setGetDescription:](v13, "setGetDescription:", v14);
    -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v13, (4 * *(_DWORD *)v12));
  }

- (id)summaryOfUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  uint64_t v4 = 0LL;
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    if (a4)
    {
      uint64_t v6 = *(void *)&a3;
      uint64_t v8 = (void *)MEMORY[0x186E27B50](self, a2);
      -[_CSVisualizer functionsForTableNoCopy:](self, "functionsForTableNoCopy:", v5);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 getSummary];
      v10 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();

      if (!v10
        || (((void (**)(void, _CSVisualizer *, uint64_t, uint64_t))v10)[2](v10, self, v5, v6),
            uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            !v4))
      {
        if (-[_CSVisualizer store](self, "store")) {
          int v11 = -37516;
        }
        else {
          int v11 = 0;
        }
        if (v11 == (_DWORD)v5) {
          uint64_t v4 = (void *)_CSStoreCopyTableName((uint64_t)-[_CSVisualizer store](self, "store"), v6);
        }
        else {
          uint64_t v4 = 0LL;
        }
      }

      objc_autoreleasePoolPop(v8);
    }
  }

  return v4;
}

- (id)descriptionOfUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  uint64_t v4 = 0LL;
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    if (a4)
    {
      uint64_t v6 = *(void *)&a3;
      uint64_t v8 = (void *)MEMORY[0x186E27B50](self, a2);
      -[_CSVisualizer functionsForTableNoCopy:](self, "functionsForTableNoCopy:", v5);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 getDescription];
      v10 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();

      if (!v10
        || (((void (**)(void, _CSVisualizer *, uint64_t, uint64_t))v10)[2](v10, self, v5, v6),
            uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            !v4))
      {
        uint64_t v4 = _CSStoreCopyDebugDescriptionOfUnit((uint64_t)-[_CSVisualizer store](self, "store"), v5, v6, 1);
      }

      objc_autoreleasePoolPop(v8);
    }
  }

  return v4;
}

- (id)breakDownUsage
{
  v2 = -[_CSVisualizer store](self, "store");
  uint64_t v3 = v2;
  if (performConstantAssertions)
  {
    uint64_t v4 = *((void *)v2 + 43);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  uint64_t v6 = *((void *)v3 + 1);
  uint64_t v5 = (CSStore2 **)((char *)v3 + 8);
  uint64_t v7 = *(void *)(v6 + 8);
  size_t v8 = *(unsigned int *)(v7 + 12);
  id v9 = (char *)malloc(v8 + 4);
  v10 = v9 + 4;
  bzero(v9 + 4, v8);
  *((_DWORD *)v9 + 25) = 33686018;
  *(void *)&__int128 v11 = 0x202020202020202LL;
  *((void *)&v11 + 1) = 0x202020202020202LL;
  *(_OWORD *)(v9 + 84) = v11;
  *(_OWORD *)(v9 + 68) = v11;
  *(_OWORD *)(v9 + 52) = v11;
  *(_OWORD *)(v9 + 36) = v11;
  *(_OWORD *)(v9 + 20) = v11;
  *(_OWORD *)(v9 + 4) = v11;
  v12 = (void *)objc_opt_class();
  [v12 breakDownTable:v7 + 20 inStore:v5 buffer:v9 + 4];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __31___CSVisualizer_breakDownUsage__block_invoke;
  v23[3] = &__block_descriptor_56_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16lu32l8;
  v23[4] = v12;
  v23[5] = v5;
  v23[6] = v9 + 4;
  CSStore2::Store::enumerateTables(v5, v23);
  size_t v13 = v8 >> 2;
  if ((_DWORD)v8)
  {
    for (unint64_t i = 0LL; i != v8; ++i)
      v10[i >> 2] = v10[i];
  }

  v15 = (void *)MEMORY[0x186E27B50]();
  v16 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v10 length:v8 >> 2 freeWhenDone:0];
  [v16 compressedDataUsingAlgorithm:0 error:0];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    unint64_t v19 = [v17 length];
    if (v19 < v13) {
      [v18 getBytes:v10 length:v19];
    }
  }

  else
  {
    unint64_t v19 = -1LL;
  }

  objc_autoreleasePoolPop(v15);
  if (v19 >= v13)
  {
    unint64_t v20 = v13 + 4;
  }

  else
  {
    unint64_t v20 = v19 + 4;
    v21 = (char *)realloc(v9, v19 + 4);
    if (v21) {
      id v9 = v21;
    }
  }

  *(_DWORD *)id v9 = 1;
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v9 length:v20 freeWhenDone:1];
}

- (void)enumerateReferencesToUnit:(unsigned int)a3 inTable:(unsigned int)a4 block:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_opt_class();
  v10 = -[_CSVisualizer store](self, "store");
  __int128 v11 = v10;
  if (performConstantAssertions)
  {
    uint64_t v12 = *((void *)v10 + 43);
    if (v12) {
      (*(void (**)(void))(**(void **)(v12 + 8) + 8LL))(*(void *)(v12 + 8));
    }
  }

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke;
  v14[3] = &unk_189D66740;
  unsigned int v18 = a4;
  unsigned int v19 = a3;
  v16 = (char *)v11 + 8;
  uint64_t v17 = v9;
  v14[4] = self;
  id v13 = v8;
  id v15 = v13;
  CSStore2::Store::enumerateTables((CSStore2 **)v11 + 1, v14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithStore:useStandardTableFunctions:",  -[_CSVisualizer store](self, "store"),  0);
  -[NSRecursiveLock lock](self->_lock, "lock");
  [v4[1] addEntriesFromDictionary:self->_functions];
  [v4[4] addEntriesFromDictionary:self->_userInfo];
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (__CSStore)store
{
  return self->_store;
}

- (NSMutableDictionary)userInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

+ (_CSVisualizer)new
{
}

+ (_NSRange)rangeOfValueForTitle:(id)a3 inDescription:(id)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x4012000000LL;
  unsigned int v18 = __Block_byref_object_copy__624;
  unsigned int v19 = __Block_byref_object_dispose__625;
  unint64_t v20 = "";
  __int128 v21 = xmmword_183E2D5D0;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __52___CSVisualizer_rangeOfValueForTitle_inDescription___block_invoke;
  v12[3] = &unk_189D66660;
  id v13 = v6;
  objc_super v14 = &v15;
  id v7 = v6;
  [a1 enumerateValuesForTitlesInDescription:a4 block:v12];
  NSUInteger v8 = v16[6];
  NSUInteger v9 = v16[7];

  _Block_object_dispose(&v15, 8);
  NSUInteger v10 = v8;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

+ (void)enumerateValuesForTitlesInDescription:(id)a3 block:(id)a4
{
  id v5 = a3;
  v41 = (void (**)(id, void *, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t *))a4;
  uint64_t v55 = 0LL;
  v56 = &v55;
  uint64_t v57 = 0x4812000000LL;
  v58 = __Block_byref_object_copy__33;
  v59 = __Block_byref_object_dispose__34;
  v60 = "";
  v61 = 0LL;
  v62 = 0LL;
  uint64_t v63 = 0LL;
  v52[0] = MEMORY[0x1895F87A8];
  v52[1] = 3221225472LL;
  v52[2] = __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke;
  v52[3] = &unk_189D66688;
  id v6 = v5;
  id v53 = v6;
  v54 = &v55;
  uint64_t v7 = MEMORY[0x186E27CB8](v52);
  NSUInteger v8 = (void *)MEMORY[0x186E27B50]();
  v43 = v6;
  objc_msgSend( v6,  "enumerateAttribute:inRange:options:usingBlock:",  @"_CSVOutputType",  0,  objc_msgSend(v6, "length"),  0,  v7);
  objc_autoreleasePoolPop(v8);
  v39 = (void *)v7;
  NSUInteger v9 = (uint64_t *)v56[6];
  NSUInteger v10 = (uint64_t *)v56[7];
  if (v9 == v10)
  {
    NSUInteger v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  else
  {
    NSUInteger v11 = 0LL;
    uint64_t v12 = 0LL;
    unint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = *v9;
      uint64_t v15 = v9[1];
      uint64_t v45 = 0LL;
      v46 = &v45;
      uint64_t v47 = 0x4012000000LL;
      v48 = __Block_byref_object_copy__624;
      v49 = __Block_byref_object_dispose__625;
      v50 = "";
      __int128 v51 = xmmword_183E2D5D0;
      v44[0] = MEMORY[0x1895F87A8];
      v44[1] = 3221225472LL;
      v44[2] = __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke_39;
      v44[3] = &unk_189D666B0;
      v44[4] = &v45;
      v16 = (void *)MEMORY[0x186E27CB8](v44);
      uint64_t v17 = (void *)MEMORY[0x186E27B50]();
      objc_msgSend( v43,  "enumerateAttributesInRange:options:usingBlock:",  v15 + v14,  objc_msgSend(v43, "length") - (v15 + v14),  0,  v16);
      unsigned int v18 = v46 + 6;
      if ((unint64_t)v12 >= v13)
      {
        uint64_t v19 = (v12 - v11) >> 4;
        unint64_t v20 = v19 + 1;
        else {
          unint64_t v21 = v20;
        }
        if (v21) {
          unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v21);
        }
        else {
          uint64_t v22 = 0LL;
        }
        v23 = (_OWORD *)(v21 + 16 * v19);
        _OWORD *v23 = *v18;
        if (v12 == v11)
        {
          v25 = (char *)(v21 + 16 * v19);
        }

        else
        {
          unint64_t v24 = v21 + 16 * v19;
          do
          {
            v25 = (char *)(v24 - 16);
            *(_OWORD *)(v24 - 16) = *((_OWORD *)v12 - 1);
            v12 -= 16;
            v24 -= 16LL;
          }

          while (v12 != v11);
        }

        unint64_t v13 = v21 + 16 * v22;
        uint64_t v12 = (char *)(v23 + 1);
        if (v11) {
          operator delete(v11);
        }
        NSUInteger v11 = v25;
      }

      else
      {
        *(_OWORD *)uint64_t v12 = *v18;
        v12 += 16;
      }

      objc_autoreleasePoolPop(v17);

      _Block_object_dispose(&v45, 8);
      v9 += 2;
    }

    while (v9 != v10);
  }

  [v43 string];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = v56[7] - v56[6];
  else {
    unint64_t v27 = (v12 - v11) >> 4;
  }
  LOBYTE(v45) = 0;
  if (v27)
  {
    uint64_t v28 = 0LL;
    unint64_t v29 = 1LL;
    do
    {
      v30 = (void *)MEMORY[0x186E27B50]();
      uint64_t v31 = v56[6];
      uint64_t v32 = *(void *)(v31 + v28);
      uint64_t v33 = *(void *)&v11[v28];
      if (v32 != 0x7FFFFFFFFFFFFFFFLL && v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
        context = v30;
        uint64_t v35 = *(void *)&v11[v28 + 8];
        uint64_t v36 = *(void *)(v31 + v28 + 8);
        objc_msgSend(v40, "substringWithRange:", v32, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "attributedSubstringFromRange:", v33, v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2](v41, v37, v32, v36, v38, v33, v35, &v45);

        v30 = context;
      }

      objc_autoreleasePoolPop(v30);
      if (v29 >= v27) {
        break;
      }
      ++v29;
      v28 += 16LL;
    }

    while (!(_BYTE)v45);
  }

  else
  {

    if (!v11) {
      goto LABEL_40;
    }
  }

  operator delete(v11);
LABEL_40:

  _Block_object_dispose(&v55, 8);
  if (v61)
  {
    v62 = v61;
    operator delete(v61);
  }
}

+ (id)predicateForSearchingDescriptionWithString:(id)a3 error:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)breakDownTable:(const Table *)a3 inStore:(const void *)a4 buffer:(char *)a5
{
  if (a3)
  {
    uint64_t v8 = *(void *)a4;
    if (*(void *)a4) {
      unint64_t v9 = *(void *)(v8 + 8);
    }
    else {
      unint64_t v9 = 0LL;
    }
    int v10 = -1;
    BOOL v11 = (unint64_t)a3 >= v9;
    unint64_t v12 = (unint64_t)a3 - v9;
    if (v11 && !HIDWORD(v12))
    {
      else {
        int v10 = v12;
      }
    }
  }

  else
  {
    int v10 = -1;
  }

  uint64_t v14 = &a5[v10];
  *(void *)&__int128 v15 = 0x404040404040404LL;
  *((void *)&v15 + 1) = 0x404040404040404LL;
  *((_OWORD *)v14 + 3) = v15;
  *((_OWORD *)v14 + 4) = v15;
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v15;
  *(_OWORD *)uint64_t v14 = v15;
  v16 = a3 + 1;
  uint64_t v17 = *(void *)a4;
  if (*(void *)a4) {
    unint64_t v18 = *(void *)(v17 + 8);
  }
  else {
    unint64_t v18 = 0LL;
  }
  int v19 = -1;
  BOOL v11 = (unint64_t)v16 >= v18;
  unint64_t v20 = (unint64_t)v16 - v18;
  if (v11 && !HIDWORD(v20))
  {
    else {
      int v19 = v20;
    }
  }

  memset(&a5[v19], 68, a3->var0.var2 - 72);
  uint64_t var5 = a3->var5;
  uint64_t v24 = MEMORY[0x1895F87A8];
  if ((_DWORD)var5 != -1)
  {
    unint64_t v25 = *(void *)(*(void *)a4 + 8LL);
    unsigned int v26 = *(_DWORD *)(v25 + 12);
    if (v26 > var5)
    {
      unint64_t v27 = (_DWORD *)(v25 + var5);
      BOOL v28 = v25 + var5 < v25;
      BOOL v29 = (int)var5 + 1 > v26 || var5 == -1;
      uint64_t v30 = a3->var5;
      if (v28 || v29) {
        uint64_t v30 = 0xFFFFFFFFLL;
      }
      *(_DWORD *)&a5[v30] = 134744072;
      v95[0] = v24;
      v95[1] = 3221225472LL;
      v96 = ___ZN8CSStore27HashMapIjjNS_20_IdentifierFunctionsELy1EE14WriteBreakdownERKNS_5StoreEPKS2_hPh_block_invoke;
      v97 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
      char v99 = 4;
      v98 = a5;
      uint64_t v31 = v95;
      uint64_t v32 = v31;
      LOBYTE(v100[0]) = 0;
      uint64_t v33 = v27 + 1;
      uint64_t v34 = *(void *)a4;
      if (*(void *)a4) {
        unint64_t v35 = *(void *)(v34 + 8);
      }
      else {
        unint64_t v35 = 0LL;
      }
      uint64_t v36 = 0xFFFFFFFFLL;
      BOOL v11 = (unint64_t)v33 >= v35;
      unint64_t v37 = (unint64_t)v33 - v35;
      if (v11 && !HIDWORD(v37))
      {
        else {
          uint64_t v36 = v37;
        }
      }

      ((void (*)(void *, uint64_t, void, uint64_t, uint64_t, void *))v96)( v31,  v36,  (8 * *v27),  1LL,  1LL,  v100);
      unint64_t v39 = *v27;
      if ((_DWORD)v39 && !LOBYTE(v100[0]))
      {
        unint64_t v40 = 0LL;
        do
        {
          v41 = &v27[2 * v40];
          uint64_t v42 = v41[2];
          if ((_DWORD)v42 == -1)
          {
            unint64_t v46 = 0LL;
          }

          else
          {
            uint64_t v43 = *(void *)(*(void *)a4 + 8LL);
            BOOL v44 = *(_DWORD *)(v43 + 12) > v42;
            unint64_t v45 = v43 + v42;
            if (v44) {
              unint64_t v46 = v45;
            }
            else {
              unint64_t v46 = 0LL;
            }
          }

          uint64_t v47 = v41 + 1;
          int v48 = v41[1];
          if (v48)
          {
            v49 = (_DWORD *)(v46 + 4);
            unint64_t v50 = 1LL;
            do
            {
              if (*(v49 - 1)) {
                BOOL v51 = *v49 != -1;
              }
              else {
                BOOL v51 = 0LL;
              }
              uint64_t v52 = *(void *)a4;
              if (*(void *)a4) {
                unint64_t v53 = *(void *)(v52 + 8);
              }
              else {
                unint64_t v53 = 0LL;
              }
              uint64_t v54 = 0xFFFFFFFFLL;
              BOOL v11 = v46 >= v53;
              unint64_t v55 = v46 - v53;
              if (v11 && !HIDWORD(v55))
              {
                else {
                  uint64_t v54 = v55;
                }
              }

              ((void (*)(void *, uint64_t, uint64_t, void, BOOL, void *))v96)( v32,  v54,  8LL,  0LL,  v51,  v100);
              int v48 = LOBYTE(v100[0]);
              if (v50 >= *v47) {
                break;
              }
              ++v50;
              v49 += 2;
              v46 += 8LL;
            }

            while (!LOBYTE(v100[0]));
            unint64_t v39 = *v27;
          }

          ++v40;
        }

        while (v40 < v39 && !v48);
      }

      uint64_t v24 = MEMORY[0x1895F87A8];
    }
  }

  Table = (char *)*((void *)a4 + 34);
  if (!Table) {
    Table = CSStore2::Store::getTable((CSStore2 **)a4, @"<string>");
  }
  if (Table == (char *)a3)
  {
    StringCache = CSStore2::getStringCache((CSStore2 *)a4, v22);
    if (StringCache)
    {
      v62 = StringCache;
      uint64_t v63 = *(void *)a4;
      if (*(void *)a4) {
        unint64_t v64 = *(void *)(v63 + 8);
      }
      else {
        unint64_t v64 = 0LL;
      }
      uint64_t v65 = 0xFFFFFFFFLL;
      BOOL v11 = (unint64_t)StringCache >= v64;
      unint64_t v66 = (unint64_t)&StringCache[-v64];
      if (v11 && !HIDWORD(v66))
      {
        BOOL v67 = (v66 + 1) > *(_DWORD *)(*(void *)(v63 + 8) + 12LL) || (_DWORD)v66 == -1;
        uint64_t v65 = v66;
        if (v67) {
          uint64_t v65 = 0xFFFFFFFFLL;
        }
      }

      *(_DWORD *)&a5[v65] = 168430090;
      v100[0] = v24;
      v100[1] = 3221225472LL;
      v101 = ___ZN8CSStore27HashMapIjNS_17_StringCacheEntryENS_16_StringFunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke;
      v102 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
      char v104 = 5;
      v103 = a5;
      v68 = v100;
      v69 = v68;
      v105[0] = 0;
      v70 = v62 + 4;
      uint64_t v71 = *(void *)a4;
      if (*(void *)a4) {
        unint64_t v72 = *(void *)(v71 + 8);
      }
      else {
        unint64_t v72 = 0LL;
      }
      uint64_t v73 = 0xFFFFFFFFLL;
      BOOL v11 = (unint64_t)v70 >= v72;
      unint64_t v74 = (unint64_t)v70 - v72;
      if (v11 && !HIDWORD(v74))
      {
        else {
          uint64_t v73 = v74;
        }
      }

      ((void (*)(void *, uint64_t, void, uint64_t, uint64_t, _BYTE *))v101)( v68,  v73,  (8 * *(_DWORD *)v62),  1LL,  1LL,  v105);
      unint64_t v76 = *(unsigned int *)v62;
      if ((_DWORD)v76 && !v105[0])
      {
        unint64_t v77 = 0LL;
        do
        {
          v78 = &v62[8 * v77];
          uint64_t v79 = *((unsigned int *)v78 + 2);
          if ((_DWORD)v79 == -1)
          {
            unint64_t v82 = 0LL;
          }

          else
          {
            uint64_t v80 = *(void *)(*(void *)a4 + 8LL);
            BOOL v44 = *(_DWORD *)(v80 + 12) > v79;
            unint64_t v81 = v80 + v79;
            if (v44) {
              unint64_t v82 = v81;
            }
            else {
              unint64_t v82 = 0LL;
            }
          }

          v83 = (unsigned int *)(v78 + 4);
          int v84 = *((_DWORD *)v78 + 1);
          if (v84)
          {
            v85 = (_DWORD *)(v82 + 4);
            unint64_t v86 = 1LL;
            do
            {
              if (*(v85 - 1)) {
                BOOL v87 = *v85 != 0;
              }
              else {
                BOOL v87 = 0LL;
              }
              uint64_t v88 = *(void *)a4;
              if (*(void *)a4) {
                unint64_t v89 = *(void *)(v88 + 8);
              }
              else {
                unint64_t v89 = 0LL;
              }
              uint64_t v90 = 0xFFFFFFFFLL;
              BOOL v11 = v82 >= v89;
              unint64_t v91 = v82 - v89;
              if (v11 && !HIDWORD(v91))
              {
                else {
                  uint64_t v90 = v91;
                }
              }

              ((void (*)(void *, uint64_t, uint64_t, void, BOOL, _BYTE *))v101)( v69,  v90,  8LL,  0LL,  v87,  v105);
              int v84 = v105[0];
              if (v86 >= *v83) {
                break;
              }
              ++v86;
              v85 += 2;
              v82 += 8LL;
            }

            while (!v105[0]);
            unint64_t v76 = *(unsigned int *)v62;
          }

          ++v77;
        }

        while (v77 < v76 && !v84);
      }

      char v60 = 6;
      uint64_t v24 = MEMORY[0x1895F87A8];
    }

    else
    {
      char v60 = 6;
    }
  }

  else
  {
    v58 = (char *)*((void *)a4 + 33);
    if (!v58) {
      v58 = CSStore2::Store::getTable((CSStore2 **)a4, @"<array>");
    }
    if (v58 == (char *)a3)
    {
      char v60 = 7;
    }

    else
    {
      v59 = (char *)*((void *)a4 + 35);
      if (!v59) {
        v59 = CSStore2::Store::getTable((CSStore2 **)a4, @"<dictionary>");
      }
      else {
        char v60 = 3;
      }
    }
  }

  v93[0] = v24;
  v93[1] = 3221225472LL;
  v93[2] = __47___CSVisualizer_breakDownTable_inStore_buffer___block_invoke;
  v93[3] = &__block_descriptor_49_e30_v24__0r__Unit_b30b2I_0c__8_B16l;
  char v94 = v60;
  v93[4] = a4;
  v93[5] = a5;
  CSStore2::Store::enumerateUnits((CSStore2 **)a4, (unsigned int *)a3, v93);
}

+ (void)enumerateReferencesToUnitsInUnitDescription:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke;
  v10[3] = &unk_189D66790;
  id v7 = v6;
  id v11 = v7;
  uint64_t v8 = (void *)MEMORY[0x186E27CB8](v10);
  unint64_t v9 = (void *)MEMORY[0x186E27B50]();
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(v5, "length"), 0x100000, v8);
  objc_autoreleasePoolPop(v9);
}

+ (BOOL)unitDescription:(id)a3 referencesUnit:(unsigned int)a4 inTable:(unsigned int)a5
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __56___CSVisualizer_unitDescription_referencesUnit_inTable___block_invoke;
  v7[3] = &unk_189D667B8;
  unsigned int v8 = a5;
  unsigned int v9 = a4;
  v7[4] = &v10;
  [a1 enumerateReferencesToUnitsInUnitDescription:a3 block:v7];
  char v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)URLForUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  uint64_t v4 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"x-csstore-vis-unit:?t=%llu&u=%llu",  a4,  a3);
  char v5 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v4];

  return v5;
}

+ (BOOL)getUnit:(unsigned int *)a3 inTable:(unsigned int *)a4 fromURL:(id)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v7 = a5;
  unsigned int v8 = (void *)MEMORY[0x186E27B50]();
  [v7 absoluteString];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 getCString:v27 maxLength:1024 encoding:4];

  if (v10 && (v23 = 0LL, uint64_t v19 = 0LL, sscanf(v27, "x-csstore-vis-unit:?t=%llu&u=%llu", &v23, &v19) == 2))
  {
    if (a4) {
      *a4 = v23;
    }
    if (a3) {
      *a3 = v19;
    }
    BOOL v11 = 1;
  }

  else
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189607A50]) initWithURL:v7 resolvingAgainstBaseURL:1];
    [v12 scheme];
    char v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      && ([v12 scheme],
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
          BOOL v15 = [v14 caseInsensitiveCompare:@"x-csstore-vis-unit"] == 0,
          v14,
          v13,
          v15))
    {
      uint64_t v23 = 0LL;
      uint64_t v24 = &v23;
      uint64_t v25 = 0x2020000000LL;
      char v26 = 0;
      uint64_t v19 = 0LL;
      unint64_t v20 = &v19;
      uint64_t v21 = 0x2020000000LL;
      char v22 = 0;
      [v12 queryItems];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __41___CSVisualizer_getUnit_inTable_fromURL___block_invoke;
      v18[3] = &unk_189D667E0;
      v18[4] = &v23;
      v18[5] = &v19;
      v18[6] = a4;
      v18[7] = a3;
      [v16 enumerateObjectsUsingBlock:v18];

      if (*((_BYTE *)v24 + 24)) {
        BOOL v11 = *((_BYTE *)v20 + 24) != 0;
      }
      else {
        BOOL v11 = 0;
      }
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  objc_autoreleasePoolPop(v8);

  return v11;
}

- (id)handlerForTable:(unsigned int)a3
{
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __45___CSVisualizer_Deprecated__handlerForTable___block_invoke;
    v10[3] = &unk_189D66850;
    id v11 = v5;
    uint64_t v12 = self;
    unsigned int v13 = a3;
    id v7 = (void *)MEMORY[0x186E27CB8](v10);
  }

  else
  {
    id v7 = 0LL;
  }

  unsigned int v8 = (void *)MEMORY[0x186E27CB8](v7);
  return v8;
}

- (void)setHandler:(id)a3 forTable:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS____CSVisualizerTableFunctions);
    uint64_t v8 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke;
    v16[3] = &unk_189D66878;
    id v9 = v6;
    id v17 = v9;
    -[_CSVisualizerTableFunctions setGetSummary:](v7, "setGetSummary:", v16);
    uint64_t v11 = v8;
    uint64_t v12 = 3221225472LL;
    unsigned int v13 = __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke_2;
    uint64_t v14 = &unk_189D668A0;
    id v15 = v9;
    -[_CSVisualizerTableFunctions setGetDescription:](v7, "setGetDescription:", &v11);

    int v10 = v7;
  }

  else
  {
    int v10 = 0LL;
  }

  -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v10, v4, v11, v12, v13, v14);
}

@end