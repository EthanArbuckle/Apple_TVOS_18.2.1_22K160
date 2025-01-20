@interface VMUNodeToStringMap
+ (BOOL)supportsSecureCoding;
- (VMUNodeToStringMap)init;
- (VMUNodeToStringMap)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)description;
- (id)stringForNode:(unsigned int)a3;
- (unsigned)_indexForString:(id)a3;
- (unsigned)count;
- (unsigned)uniquedStringCount;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateHexAddressesInStrings:(id)a3;
- (void)resymbolicateObjectDescriptionStringsWithGraph:(id)a3;
- (void)setString:(id)a3 forNode:(unsigned int)a4;
@end

@implementation VMUNodeToStringMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUNodeToStringMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VMUNodeToStringMap;
  v2 = -[VMUNodeToStringMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    strings = v2->_strings;
    v2->_strings = v3;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"classVersion"];

  objc_super v6 = (void *)objc_opt_new();
  [v6 serialize32:[self count]];
  p_p1 = &self->_nodeToStringIndexMap.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned int, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned int, unsigned int>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    uint64_t next_high = HIDWORD(p_p1[2].__value_.__next_);
    [v6 serialize32:LODWORD(p_p1[2].__value_.__next_)];
    [v6 serialize32:next_high];
  }

  [v6 serialize32:[self uniquedStringCount]];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v9 = self->_strings;
  uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        [v6 serializeString:*(void *)(*((void *)&v14 + 1) + 8 * v12++), (void)v14];
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v10);
  }

  v13 = (void *)[v6 copyContiguousData];
  [v4 encodeObject:v13 forKey:@"simpleSerializerData"];
}

- (VMUNodeToStringMap)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[VMUNodeToStringMap init](self, "init");
  if (!v5) {
    goto LABEL_8;
  }
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classVersion"];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 unsignedIntValue];

  if (v7 == 1)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simpleSerializerData"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VMUSimpleDeserializer initWithData:](objc_alloc(&OBJC_CLASS___VMUSimpleDeserializer), "initWithData:", v8);
    id v30 = 0LL;
    unsigned int v10 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v30);
    id v11 = v30;
    if (!v11)
    {
      float v16 = (float)v10;
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v5->_nodeToStringIndexMap,  vcvtps_u32_f32((float)v10 / v5->_nodeToStringIndexMap.__table_.__p3_.__value_));
      if (v10)
      {
        while (1)
        {
          id v29 = 0LL;
          unsigned int v17 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v29);
          id v11 = v29;
          LODWORD(v25) = v17;
          if (v11) {
            break;
          }
          id v27 = 0LL;
          int v18 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v27);
          id v11 = v27;
          int v28 = v18;
          if (v11) {
            break;
          }
          std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>( (uint64_t)&v5->_nodeToStringIndexMap,  (unsigned int *)&v25,  &v25,  &v28);
          if (!--v10) {
            goto LABEL_14;
          }
        }
      }

      else
      {
LABEL_14:
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v5->_stringToIndexMap,  vcvtps_u32_f32(v16 / v5->_stringToIndexMap.__table_.__p3_.__value_));
        id v26 = 0LL;
        unsigned int v19 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v26);
        id v11 = v26;
        if (!v11)
        {
          uint64_t v20 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v19];
          strings = v5->_strings;
          v5->_strings = (NSMutableArray *)v20;

          int v28 = 0;
          if (!v19)
          {
LABEL_20:
            int v13 = 0;
            uint64_t v12 = 0LL;
LABEL_6:

            if (v13) {
              goto LABEL_7;
            }
LABEL_8:
            __int128 v14 = v5;
            goto LABEL_9;
          }

          while (1)
          {
            id v24 = 0LL;
            v22 = -[VMUSimpleDeserializer copyDeserializedStringWithError:]( v9,  "copyDeserializedStringWithError:",  &v24);
            id v23 = v24;
            v25 = v22;
            if (v23) {
              break;
            }
            if (!v22)
            {
              v25 = &stru_189E010C8;

              v22 = v25;
            }

            -[NSMutableArray addObject:](v5->_strings, "addObject:", v22);
            std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>( (uint64_t)&v5->_stringToIndexMap,  (id *)&v25,  (id *)&v25,  &v28);

            if (++v28 >= v19) {
              goto LABEL_20;
            }
          }

          uint64_t v12 = v23;

LABEL_5:
          int v13 = 1;
          goto LABEL_6;
        }
      }
    }

    uint64_t v12 = v11;
    goto LABEL_5;
  }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = (void **)self->_nodeToStringIndexMap.__table_.__p1_.__value_.__next_; i; i = (void **)*i)
  {
    uint64_t v6 = *((unsigned int *)i + 4);
    uint64_t v5 = *((unsigned int *)i + 5);
    -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", v5);
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendFormat:@"%u  stringID %u %@\n", v6, v5, v7];
  }

  return v3;
}

- (unsigned)count
{
  return self->_nodeToStringIndexMap.__table_.__p2_.__value_;
}

- (unsigned)uniquedStringCount
{
  return -[NSMutableArray count](self->_strings, "count");
}

- (unsigned)_indexForString:(id)a3
{
  id v10 = a3;
  p_stringToIndexMap = &self->_stringToIndexMap;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::find<NSString * {__strong}>( &self->_stringToIndexMap.__table_.__bucket_list_.__ptr_.__value_,  &v10);
  if (v5)
  {
    uint64_t v6 = (unsigned int *)(v5 + 3);
  }

  else
  {
    -[NSMutableArray addObject:](self->_strings, "addObject:", v10);
    int v9 = -[NSMutableArray count](self->_strings, "count") - 1;
    uint64_t v6 = (unsigned int *)&v9;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>( (uint64_t)p_stringToIndexMap,  &v10,  &v10,  &v9);
  }

  unsigned int v7 = *v6;

  return v7;
}

- (void)setString:(id)a3 forNode:(unsigned int)a4
{
  id v6 = a3;
  unsigned int v8 = a4;
  if (v6)
  {
    unsigned int v7 = -[VMUNodeToStringMap _indexForString:](self, "_indexForString:", v6);
    std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>( (uint64_t)&self->_nodeToStringIndexMap,  &v8,  &v8,  (int *)&v7);
  }
}

- (id)stringForNode:(unsigned int)a3
{
  unsigned int v8 = a3;
  p_nodeToStringIndexMap = &self->_nodeToStringIndexMap;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>( &self->_nodeToStringIndexMap.__table_.__bucket_list_.__ptr_.__value_,  &v8);
  if (v5)
  {
    id v6 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>( p_nodeToStringIndexMap,  &v8);
    if (!v6) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", *((unsigned int *)v6 + 5));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)resymbolicateObjectDescriptionStringsWithGraph:(id)a3
{
  id v4 = a3;
  int v28 = self;
  LODWORD(self) = -[NSMutableArray count](self->_strings, "count");
  uint64_t v5 = calloc(1uLL, (((_DWORD)self + 7) >> 3) + 4);
  _DWORD *v5 = (_DWORD)self;
  [v4 symbolStore];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 symbolicator];

  for (i = (void **)v28->_nodeToStringIndexMap.__table_.__p1_.__value_.__next_; i; i = (void **)*i)
  {
    uint64_t v8 = *((unsigned int *)i + 4);
    unint64_t v9 = *((unsigned int *)i + 5);
    if (*v5 > v9)
    {
      uint64_t v10 = (v9 >> 3) + 4;
      int v11 = *((unsigned __int8 *)v5 + v10);
      int v12 = 1 << (v9 & 7);
      if ((v12 & v11) != 0) {
        continue;
      }
      *((_BYTE *)v5 + v10) = v11 | v12;
    }

    if (!v4) {
      continue;
    }
    [v4 nodeDetails:v8];
    if (v30 >> 60 != 1 || v31 == 0LL) {
      continue;
    }
    [v31 className];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v14 isEqualToString:@"__NSMallocBlock__"])
    {

LABEL_13:
      -[NSMutableArray objectAtIndexedSubscript:](v28->_strings, "objectAtIndexedSubscript:", v9);
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 componentsSeparatedByString:@" "];
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = (void *)[v17 mutableCopy];

      [v18 lastObject];
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (checkStringIsValidHexAddress(v19))
      {
        strtoll((const char *)[v19 UTF8String], 0, 16);
        uint64_t v20 = [v18 indexOfObject:@"<unknown-symbol>"];
        if (v20 == 0x7FFFFFFFFFFFFFFFLL
          || (CSSymbolicatorGetSymbolWithAddressAtTime(), (CSIsNull() & 1) != 0)
          || (CSSymbolIsUnnamed() & 1) != 0)
        {
          int v27 = 0;
        }

        else
        {
          [NSString stringWithUTF8String:CSSymbolGetName()];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 setObject:v25 atIndexedSubscript:v20];

          [MEMORY[0x1896078D0] indexSetWithIndexesInRange:v20 + 1, 3];
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 removeObjectsAtIndexes:v26];

          int v27 = 1;
        }

        CSSymbolicatorGetSourceInfoWithAddressAtTime();
        if ((CSIsNull() & 1) == 0)
        {
          uint64_t Filename = CSSourceInfoGetFilename();
          uint64_t LineNumber = CSSourceInfoGetLineNumber();
          if (Filename)
          {
            [NSString stringWithFormat:@"%s:%u" Filename, LineNumber];
            id v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 addObject:v23];

            goto LABEL_22;
          }
        }

        if (v27)
        {
LABEL_22:
          [v18 componentsJoinedByString:@" "];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray setObject:atIndexedSubscript:](v28->_strings, "setObject:atIndexedSubscript:", v24, v9);
        }
      }

      continue;
    }

    [v31 className];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = [v15 isEqualToString:@"OS_os_transaction"];

    if (v16) {
      goto LABEL_13;
    }
  }

  free(v5);
}

- (void)enumerateHexAddressesInStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, uint64_t))a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = self->_strings;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 rangeOfString:@" " options:4 v13];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v9 substringFromIndex:v10 + 1];
          int v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (checkStringIsValidHexAddress(v11))
          {
            uint64_t v12 = strtoll((const char *)[v11 UTF8String], 0, 16);
            v4[2](v4, v12);
          }
        }
      }

      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end