@interface VMUClassInfoMap
+ (BOOL)supportsSecureCoding;
+ (void)_destroyRetainedLinearArray:(id *)a3 withCount:(unsigned int)a4;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (VMUClassInfoMap)init;
- (VMUClassInfoMap)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)_retainedLinearArrayWithReturnedCount:(unsigned int *)a3;
- (id)classInfoForAddress:(unint64_t)a3;
- (id)classInfoForIndex:(unsigned int)a3;
- (id)fieldInfoForIndex:(unsigned int)a3;
- (id)swiftFieldWithName:(const char *)a3 offset:(unsigned int)a4 kind:(unsigned int)a5 typeref:(swift_typeref_interop)a6;
- (unsigned)addClassInfo:(id)a3 forAddress:(unint64_t)a4;
- (unsigned)addFieldInfo:(id)a3;
- (unsigned)count;
- (unsigned)fieldInfoCount;
- (unsigned)indexForClassInfo:(id)a3;
- (unsigned)indexForFieldInfo:(id)a3;
- (void)_applyTypeOverlay:(id)a3;
- (void)_applyTypeOverlayRules:(void *)a3 toMutableInfo:;
- (void)addClassInfosFromMap:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateInfosWithBlock:(id)a3;
- (void)memoizeSwiftField:(id)a3 withName:(const char *)a4 offset:(unsigned int)a5 kind:(unsigned int)a6 typeref:(swift_typeref_interop)a7;
@end

@implementation VMUClassInfoMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_destroyRetainedLinearArray:(id *)a3 withCount:(unsigned int)a4
{
  if (a3)
  {
    if (a4)
    {
      uint64_t v5 = a4;
      v6 = a3;
      do
      {
        id v7 = *v6;
        *v6++ = 0LL;

        --v5;
      }

      while (v5);
    }

    free(a3);
  }

- (VMUClassInfoMap)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VMUClassInfoMap;
  v2 = -[VMUClassInfoMap init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    linearClassInfos = v2->_linearClassInfos;
    v2->_linearClassInfos = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    linearFieldInfos = v2->_linearFieldInfos;
    v2->_linearFieldInfos = (NSMutableArray *)v5;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[VMUClassInfoMap encodeWithCoder:]", "VMUClassInfoMap.mm", 133, "[coder allowsKeyedCoding]");
  }
  uint64_t v5 = (void *)objc_opt_new();
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v6 = self->_linearClassInfos;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    uint64_t v9 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        v26[0] = v9;
        v26[1] = 3221225472LL;
        v26[2] = __35__VMUClassInfoMap_encodeWithCoder___block_invoke;
        v26[3] = &unk_189E00118;
        v26[4] = self;
        [v11 enumerateTypeFieldsWithBlock:v26];
        ++v10;
      }

      while (v7 != v10);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    }

    while (v7);
  }

  [v5 serialize32:[self->_linearFieldInfos count]];
  [v5 serialize32:[self count]];
  uint64_t v12 = [(id)objc_opt_class() version];
  [v5 serialize32:v12];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v13 = self->_linearFieldInfos;
  uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v22,  v31,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        [ *(id *)(*((void *)&v22 + 1) + 8 * v16++) serializeWithClassMap:self simpleSerializer:v5 version:v12 v22];
      }

      while (v14 != v16);
      uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v22,  v31,  16LL);
    }

    while (v14);
  }

  v17 = (void *)objc_opt_new();
  for (unsigned int i = 0; -[NSMutableArray count](self->_linearClassInfos, "count", (void)v22) > (unint64_t)i; ++i)
  {
    v19 = -[NSMutableArray objectAtIndexedSubscript:](self->_linearClassInfos, "objectAtIndexedSubscript:", i);
    [v19 serializeWithClassMap:self simpleSerializer:v5 version:v12];
  }

  v20 = (void *)[v5 copyContiguousData];
  [v4 encodeObject:v20 forKey:@"simpleSerializerData"];
  [MEMORY[0x189607968] numberWithUnsignedInt:3];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v21 forKey:@"classMapVersion"];

  if ([v17 count]) {
    [v4 encodeObject:v17 forKey:@"classInfosDerivedFromStackBacktraces"];
  }
}

uint64_t __35__VMUClassInfoMap_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result = [*(id *)(a1 + 32) addFieldInfo:a2];
  *a4 = 0;
  return result;
}

- (VMUClassInfoMap)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[VMUClassInfoMap init](self, "init");
  if (v5)
  {
    if ([v4 allowsKeyedCoding]
      && (unint64_t v6 = 0x189607000uLL,
          [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classMapVersion"],
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 unsignedIntValue],
          v7,
          v8 >= 2))
    {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simpleSerializerData"];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = -[VMUSimpleDeserializer initWithData:](objc_alloc(&OBJC_CLASS___VMUSimpleDeserializer), "initWithData:", v9);
      v11 = v10;
      if (v8 < 3)
      {
        unsigned int v12 = 0;
      }

      else
      {
        v49[0] = 0LL;
        unsigned int v12 = -[VMUSimpleDeserializer deserialize32WithError:](v10, "deserialize32WithError:", v49);
        id v13 = v49[0];
        if (v13)
        {
LABEL_16:

          uint64_t v16 = 0LL;
          goto LABEL_11;
        }
      }

      v35 = v9;
      v36 = (void *)objc_opt_new();
      id v48 = 0LL;
      unsigned int v34 = -[VMUSimpleDeserializer deserialize32WithError:](v11, "deserialize32WithError:", &v48);
      id v13 = v48;
      if (v13
        || (id v47 = 0LL,
            unsigned int v37 = -[VMUSimpleDeserializer deserialize32WithError:](v11, "deserialize32WithError:", &v47),
            (id v13 = v47) != 0LL))
      {
LABEL_15:

        uint64_t v9 = v35;
        goto LABEL_16;
      }

      if (v12)
      {
        uint64_t v18 = 0LL;
        uint64_t v33 = v11;
        do
        {
          v19 = (void *)MEMORY[0x186E32E40]();
          unsigned int v46 = 0;
          v20 = objc_alloc(&OBJC_CLASS___VMUFieldInfo);
          id v45 = 0LL;
          v21 = -[VMUFieldInfo initWithSerializer:classMap:version:returnedDestinationLayoutClassInfoIndex:error:]( v20,  "initWithSerializer:classMap:version:returnedDestinationLayoutClassInfoIndex:error:",  v11,  v5,  v37,  &v46,  &v45);
          id v13 = v45;
          if (!v13)
          {
            -[NSMutableArray addObject:](v5->_linearFieldInfos, "addObject:", v21);
            v43 = v21;
            LODWORD(v44) = v18 + 1;
            std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::pair<VMUFieldInfo * {__strong},unsigned int>>( (uint64_t)&v5->_fieldInfoToIndexMap,  (id *)&v43,  (uint64_t *)&v43);

            if (v46)
            {
              [*(id *)(v6 + 2408) numberWithUnsignedInt:];
              __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
              unint64_t v23 = v6;
              [*(id *)(v6 + 2408) numberWithUnsignedInt:v18];
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v36 setObject:v22 forKeyedSubscript:v24];

              unint64_t v6 = v23;
              v11 = v33;
            }
          }

          objc_autoreleasePoolPop(v19);
          if (v13) {
            goto LABEL_15;
          }
          uint64_t v18 = (v18 + 1);
        }

        while (v12 != (_DWORD)v18);
      }

      if (v34)
      {
        uint64_t v25 = 1LL;
        do
        {
          v26 = (void *)MEMORY[0x186E32E40]();
          __int128 v27 = objc_alloc(&OBJC_CLASS___VMUClassInfo);
          id v42 = 0LL;
          __int128 v28 = -[VMUClassInfo initWithSerializer:classMap:version:error:]( v27,  "initWithSerializer:classMap:version:error:",  v11,  v5,  v37,  &v42);
          id v13 = v42;
          if (!v13)
          {
            -[NSMutableArray addObject:](v5->_linearClassInfos, "addObject:", v28);
            __int128 v29 = v28;
            v43 = (VMUFieldInfo *)v29;
            LODWORD(v44) = v25;
            std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},std::pair<VMUClassInfo * {__strong},unsigned int>>( (uint64_t)&v5->_classInfoToIndexMap,  (unint64_t *)&v43,  (uint64_t *)&v43);

            if (-[VMUClassInfo remoteIsa](v29, "remoteIsa"))
            {
              v43 = -[VMUClassInfo remoteIsa](v29, "remoteIsa");
              uint64_t v44 = v25;
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,unsigned int>>( (uint64_t)&v5->_isaAddressToIndexMap,  (unint64_t *)&v43,  (uint64_t)&v43);
            }
          }

          objc_autoreleasePoolPop(v26);
          if (v13) {
            goto LABEL_15;
          }
        }

        while (++v25 - v34 != 1);
      }

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classInfosDerivedFromStackBacktraces"];
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v30 count];
      uint64_t v32 = MEMORY[0x1895F87A8];
      if (v31)
      {
        v40[0] = MEMORY[0x1895F87A8];
        v40[1] = 3221225472LL;
        v40[2] = __33__VMUClassInfoMap_initWithCoder___block_invoke;
        v40[3] = &unk_189E00140;
        v41 = v5;
        [v30 enumerateIndexesUsingBlock:v40];
      }

      v38[0] = v32;
      v38[1] = 3221225472LL;
      v38[2] = __33__VMUClassInfoMap_initWithCoder___block_invoke_2;
      v38[3] = &unk_189E00168;
      v39 = v5;
      [v36 enumerateKeysAndObjectsUsingBlock:v38];
    }

    else
    {
      [v4 decodeValueOfObjCType:"I" at:&v46 size:4];
      if (v46)
      {
        for (unsigned int i = 0; i < v46; ++i)
        {
          [v4 decodeValueOfObjCType:"Q" at:&v43 size:8];
          [v4 decodeObject];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[VMUClassInfoMap addClassInfo:forAddress:](v5, "addClassInfo:forAddress:", v15, v43);
        }
      }
    }
  }

  uint64_t v16 = v5;
LABEL_11:

  return v16;
}

void __33__VMUClassInfoMap_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setIsDerivedFromStackBacktrace:1];
}

void __33__VMUClassInfoMap_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 176),  "objectAtIndexedSubscript:",  objc_msgSend(a2, "unsignedIntValue"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) classInfoForIndex:[v7 unsignedIntValue]];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setDestinationLayout:v6];
}

- (void)addClassInfosFromMap:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __40__VMUClassInfoMap_addClassInfosFromMap___block_invoke;
  v3[3] = &unk_189E00190;
  v3[4] = self;
  [a3 enumerateInfosWithBlock:v3];
}

uint64_t __40__VMUClassInfoMap_addClassInfosFromMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addClassInfo:a3 forAddress:a2];
}

- (unsigned)addClassInfo:(id)a3 forAddress:(unint64_t)a4
{
  id v15 = a3;
  unint64_t v14 = a4;
  if (v15)
  {
    unint64_t v6 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>( &self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)&v15);
    if (!v6)
    {
      [v15 superclassInfo];
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        [v15 superclassInfo];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 superclassInfo];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VMUClassInfoMap addClassInfo:forAddress:]( self,  "addClassInfo:forAddress:",  v9,  [v10 remoteIsa]);
      }

      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __43__VMUClassInfoMap_addClassInfo_forAddress___block_invoke;
      v12[3] = &unk_189E00118;
      v12[4] = self;
      [v15 enumerateTypeFieldsWithBlock:v12];
      unsigned int v13 = -[VMUClassInfoMap count](self, "count") + 1;
      unsigned int v13 = *((_DWORD *)std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},VMUClassInfo * {__strong}&,unsigned int &>( (uint64_t)&self->_classInfoToIndexMap,  (unint64_t *)&v15,  &v15,  &v13)
            + 6);
      if (v14) {
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>( (uint64_t)&self->_isaAddressToIndexMap,  &v14,  &v14,  &v13);
      }
      -[NSMutableArray addObject:](self->_linearClassInfos, "addObject:", v15);
      goto LABEL_11;
    }

    unsigned int v7 = *((_DWORD *)v6 + 6);
    unsigned int v13 = v7;
    if (a4)
    {
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>( (uint64_t)&self->_isaAddressToIndexMap,  &v14,  &v14,  &v13);
LABEL_11:
      unsigned int v7 = v13;
    }
  }

  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

void __43__VMUClassInfoMap_addClassInfo_forAddress___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 destinationLayout];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v6 destinationLayout];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 indexForClassInfo:v5];
  }
}

- (unsigned)indexForClassInfo:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>( &self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)&v7);
    if (v4) {
      unsigned int v5 = *((_DWORD *)v4 + 6);
    }
    else {
      unsigned int v5 = -[VMUClassInfoMap addClassInfo:forAddress:]( self,  "addClassInfo:forAddress:",  v7,  [v7 remoteIsa]);
    }
  }

  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)classInfoForAddress:(unint64_t)a3
{
  unint64_t v6 = a3;
  id v4 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::find<unsigned long long>( &self->_isaAddressToIndexMap.__table_.__bucket_list_.__ptr_.__value_,  &v6);
  if (v4)
  {
    -[NSMutableArray objectAtIndexedSubscript:]( self->_linearClassInfos,  "objectAtIndexedSubscript:",  (v4[6] - 1));
    id v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)classInfoForIndex:(unsigned int)a3
{
  if (a3)
  {
    if (-[NSMutableArray count](self->_linearClassInfos, "count") >= (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_linearClassInfos, "objectAtIndexedSubscript:", a3 - 1);
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      unsigned int v5 = 0LL;
    }
  }

  else
  {
    unsigned int v5 = 0LL;
  }

  return v5;
}

- (unsigned)count
{
  return -[NSMutableArray count](self->_linearClassInfos, "count");
}

- (void)enumerateInfosWithBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self->_linearClassInfos;
  unint64_t v6 = (void (**)(id, void *, void, unint64_t, unsigned __int8 *))v4;
  unsigned int v7 = -[NSMutableArray count](v5, "count");
  if (v6)
  {
    unsigned int v8 = v7;
    if (v7)
    {
      unsigned int v9 = v7 + 1;
      uint64_t v10 = malloc(8LL * (v7 + 1));
      *uint64_t v10 = 0LL;
      -[NSMutableArray getObjects:range:](v5, "getObjects:range:", v10 + 1, 0LL, v8);
      v11 = calloc(1uLL, ((v8 + 8) >> 3) + 4);
      _DWORD *v11 = v9;
      unsigned __int8 v16 = 0;
      p_p1 = &self->_isaAddressToIndexMap.__table_.__p1_;
      while (1)
      {
        p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, unsigned int>, void *>>> *)p_p1->__value_.__next_;
        if (!p_p1) {
          break;
        }
        unint64_t next_low = LODWORD(p_p1[3].__value_.__next_);
        if (*v11 > next_low)
        {
          *((_BYTE *)v11 + (next_low >> 3) + 4) |= 1 << (next_low & 7);
          unint64_t next_low = LODWORD(p_p1[3].__value_.__next_);
        }

        v6[2](v6, p_p1[2].__value_.__next_, v10[next_low], next_low, &v16);
        if (v16) {
          goto LABEL_16;
        }
      }

      uint64_t v14 = 1LL;
      do
      {
        if (*v11 > v14
          && ((*((unsigned __int8 *)v11 + (v14 >> 3) + 4) >> (v14 & 7)) & 1) != 0)
        {
          int v15 = 0;
        }

        else
        {
          v6[2](v6, (void *)[(id)v10[v14] remoteIsa], v10[v14], v14, &v16);
          int v15 = v16;
        }

        uint64_t v14 = (v14 + 1);
      }

      while (v14 <= v8 && !v15);
LABEL_16:
      free(v11);
      free(v10);
    }
  }
}

- (id)_retainedLinearArrayWithReturnedCount:(unsigned int *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unsigned int v5 = -[NSMutableArray count](self->_linearClassInfos, "count") + 1;
  unint64_t v6 = (id *)calloc(v5, 8uLL);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  unsigned int v7 = self->_linearClassInfos;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    int v10 = 1;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_storeStrong(&v6[(v10 + i)], *(id *)(*((void *)&v13 + 1) + 8 * i));
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      v10 += i;
    }

    while (v8);
  }

  *a3 = v5;
  return v6;
}

- (unsigned)addFieldInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  __int128 v16 = &v15;
  id v4 = std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::piecewise_construct_t const&,std::tuple<VMUFieldInfo * const {__strong}&>,std::tuple<>>( (uint64_t)&self->_fieldInfoToIndexMap,  &v15,  (uint64_t)&std::piecewise_construct,  &v16);
  unsigned int v5 = *((_DWORD *)v4 + 6);
  if (!v5)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    [v15 subFieldArray];
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          -[VMUClassInfoMap addFieldInfo:](self, "addFieldInfo:", *(void *)(*((void *)&v11 + 1) + 8 * i));
        }

        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }

      while (v7);
    }

    -[NSMutableArray addObject:](self->_linearFieldInfos, "addObject:", v15);
    unsigned int v5 = -[NSMutableArray count](self->_linearFieldInfos, "count");
    *((_DWORD *)v4 + 6) = v5;
  }

  return v5;
}

- (unsigned)indexForFieldInfo:(id)a3
{
  id v7 = a3;
  id v4 = std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::find<VMUFieldInfo * {__strong}>( &self->_fieldInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_,  &v7);
  if (v4) {
    unsigned int v5 = *((_DWORD *)v4 + 6);
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)fieldInfoForIndex:(unsigned int)a3
{
  if (a3)
  {
    if (-[NSMutableArray count](self->_linearFieldInfos, "count") >= (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_linearFieldInfos, "objectAtIndexedSubscript:", a3 - 1);
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      unsigned int v5 = 0LL;
    }
  }

  else
  {
    unsigned int v5 = 0LL;
  }

  return v5;
}

- (id)swiftFieldWithName:(const char *)a3 offset:(unsigned int)a4 kind:(unsigned int)a5 typeref:(swift_typeref_interop)a6
{
  int var1 = a6.var1;
  unint64_t var0 = a6.var0;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a3);
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    std::string::__init_copy_ctor_external(&v15, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    unsigned int v16 = a4;
    unsigned int v17 = a5;
    unint64_t v18 = var0;
    int v19 = var1;
  }

  else
  {
    std::string v15 = __p;
    unsigned int v16 = a4;
    unsigned int v17 = a5;
    unint64_t v18 = var0;
    int v19 = var1;
  }

  __int128 v11 = std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::find<SwiftFieldKey>( &self->_swiftFieldToIndexMap.__table_.__bucket_list_.__ptr_.__value_,  (uint64_t)&v15);
  if (v11)
  {
    -[NSMutableArray objectAtIndexedSubscript:]( self->_linearFieldInfos,  "objectAtIndexedSubscript:",  (*((_DWORD *)v11 + 16) - 1));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v12 = 0LL;
  }

  return v12;
}

- (void)memoizeSwiftField:(id)a3 withName:(const char *)a4 offset:(unsigned int)a5 kind:(unsigned int)a6 typeref:(swift_typeref_interop)a7
{
  int var1 = a7.var1;
  unint64_t var0 = a7.var0;
  id v13 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a4);
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    std::string::__init_copy_ctor_external(&v16, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    unsigned int v17 = a5;
    unsigned int v18 = a6;
    unint64_t v19 = var0;
    int v20 = var1;
  }

  else
  {
    std::string v16 = __p;
    unsigned int v17 = a5;
    unsigned int v18 = a6;
    unint64_t v19 = var0;
    int v20 = var1;
  }

  unsigned int v14 = -[VMUClassInfoMap addFieldInfo:](self, "addFieldInfo:", v13);
  v21 = &v16;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__emplace_unique_key_args<SwiftFieldKey,std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>( (uint64_t)&self->_swiftFieldToIndexMap,  (uint64_t)&v16,  (uint64_t)&std::piecewise_construct,  (__int128 **)&v21)
  + 16) = v14;
}

- (unsigned)fieldInfoCount
{
  return -[NSMutableArray count](self->_linearFieldInfos, "count");
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  uint64_t v5 = 0LL;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __58__VMUClassInfoMap_hasClassInfosDerivedFromStackBacktraces__block_invoke;
  v4[3] = &unk_189E001B8;
  v4[4] = &v5;
  -[VMUClassInfoMap enumerateInfosWithBlock:](self, "enumerateInfosWithBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__VMUClassInfoMap_hasClassInfosDerivedFromStackBacktraces__block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  uint64_t a4,  _BYTE *a5)
{
  uint64_t result = [a3 isDerivedFromStackBacktrace];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a5 = 1;
  }

  return result;
}

- (void)_applyTypeOverlayRules:(void *)a3 toMutableInfo:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10++) + 16LL))();
        }

        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v8);
    }

    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __56__VMUClassInfoMap__applyTypeOverlayRules_toMutableInfo___block_invoke;
    v11[3] = &unk_189E00118;
    v11[4] = a1;
    [v6 enumerateTypeFieldsWithBlock:v11];
  }
}

void __56__VMUClassInfoMap__applyTypeOverlayRules_toMutableInfo___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 destinationLayout];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v6 destinationLayout];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addClassInfo:v5 forAddress:0];
  }
}

- (void)_applyTypeOverlay:(id)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    id v31 = v4;
    [v4 refinementRules];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 count])
    {
      uint64_t v6 = MEMORY[0x186E32E40]();
      uint64_t v32 = v5;
      uint64_t v7 = -[NSMutableArray count](self->_linearClassInfos, "count");
      unint64_t v8 = v7 + 1;
      uint64_t v9 = (char *)calloc(v7 + 1, 8uLL);
      context = (void *)v6;
      p_linearClassInfos = &self->_linearClassInfos;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      uint64_t v10 = self->_linearClassInfos;
      uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
      if (v11)
      {
        uint64_t v12 = *(void *)v36;
        uint64_t v13 = 1LL;
        do
        {
          uint64_t v14 = 0LL;
          __int128 v15 = &v9[8 * v13];
          do
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = [*(id *)(*((void *)&v35 + 1) + 8 * v14) mutableCopy];
            uint64_t v17 = *(void **)&v15[8 * v14];
            *(void *)&v15[8 * v14] = v16;

            ++v14;
          }

          while (v11 != v14);
          uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
          v13 += v14;
        }

        while (v11);
      }

      __int128 v30 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:v9 + 8 count:v7];
      if (v8 < 2)
      {
        std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear((uint64_t)&self->_classInfoToIndexMap);
        objc_storeStrong((id *)p_linearClassInfos, v30);
      }

      else
      {
        uint64_t v18 = 0LL;
        unint64_t v19 = v9 + 8;
        do
        {
          [*(id *)&v19[8 * v18] superclassInfo];
          int v20 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v21 = v20 == 0LL;

          if (!v21)
          {
            [*(id *)&v19[8 * v18] superclassInfo];
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
            unsigned int v23 = -[VMUClassInfoMap indexForClassInfo:](self, "indexForClassInfo:", v22);

            if (v8 <= v23 || v18 + 1 == v23) {
              __assert_rtn( "-[VMUClassInfoMap _applyTypeOverlay:]",  "VMUClassInfoMap.mm",  485,  "replacementIndex < linearCount + 1 && replacementIndex != i");
            }
            [*(id *)&v19[8 * v18] setSuperclassInfo:*(void *)&v9[8 * v23]];
          }

          ++v18;
        }

        while (v7 != v18);
        std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear((uint64_t)&self->_classInfoToIndexMap);
        uint64_t v25 = 0LL;
        do
        {
          id v33 = *(id *)&v9[8 * v25 + 8];
          int v34 = v25 + 1;
          std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_impl<std::pair<VMUMutableClassInfo * {__strong},unsigned int>>( &self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_,  (uint64_t *)&v33);

          ++v25;
        }

        while (v7 != v25);
        objc_storeStrong((id *)p_linearClassInfos, v30);
        v26 = (void **)(v9 + 8);
        do
        {
          -[VMUClassInfoMap _applyTypeOverlayRules:toMutableInfo:]((uint64_t)self, v32, *v26);
          __int128 v27 = *v26;
          void *v26 = 0LL;

          ++v26;
          --v7;
        }

        while (v7);
      }

      free(v9);

      id v5 = v32;
      objc_autoreleasePoolPop(context);
    }

    id v4 = v31;
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

@end