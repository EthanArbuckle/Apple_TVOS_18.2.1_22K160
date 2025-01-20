@interface VMUSimpleDeserializer
- (VMUSimpleDeserializer)initWithData:(id)a3;
- (const)copyDeserializedNullTerminatedBytesWithError:(id *)a3;
- (id).cxx_construct;
- (id)copyDeserializedStringWithError:(id *)a3;
- (id)copyDeserializedStringWithID:(unsigned int)a3 error:(id *)a4;
- (unint64_t)deserialize64WithError:(id *)a3;
- (unsigned)_deserializeValues:(unsigned int)a3 error:(id *)a4;
- (unsigned)deserialize32WithError:(id *)a3;
- (void)skipFields:(unsigned int)a3;
@end

@implementation VMUSimpleDeserializer

- (VMUSimpleDeserializer)initWithData:(id)a3
{
  id v5 = a3;
  v6 = -[VMUSimpleDeserializer init](self, "init");
  if (v6)
  {
    unint64_t v7 = [v5 length];
    if (v7 > 0xF
      && (objc_storeStrong((id *)&v6->_data, a3),
          v8 = (unsigned int *)[v5 bytes],
          unint64_t v9 = v8[3],
          v7 >= v9)
      && (unsigned int v10 = v8[1], v11 = v8[2], v12 = v11 >= v10, v13 = v11 - v10, v12)
      && v11 <= v9)
    {
      v6->super._intRegCapacity = v13;
      v6->super._stringRegCapacity = v8[3] - v8[2];
      v14 = (char *)v8 + v8[2];
      v6->super._intRegion = (char *)v8 + v8[1];
      v6->super._stringRegion = v14;
    }

    else
    {

      v6 = 0LL;
    }
  }

  return v6;
}

- (unsigned)deserialize32WithError:(id *)a3
{
  return _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
}

- (unint64_t)deserialize64WithError:(id *)a3
{
  uint64_t Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3)
  {
    if (*a3) {
      return 0LL;
    }
    unsigned int v6 = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
    if (*a3) {
      return 0LL;
    }
  }

  else
  {
    unsigned int v6 = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, 0LL);
  }

  return v6 | (unint64_t)(Field << 32);
}

- (void)skipFields:(unsigned int)a3
{
  self->super._cursor += 4 * a3;
}

- (id)copyDeserializedStringWithID:(unsigned int)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1895F89C0];
  unsigned int v25 = a3;
  if (a3 == -1) {
    return 0LL;
  }
  p_stringCache = &self->_stringCache;
  unint64_t v7 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>( &self->_stringCache.__table_.__bucket_list_.__ptr_.__value_,  &v25);
  if (v25 >= self->super._stringRegCapacity)
  {
    serializerLogHandle();
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      _nextField(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    if (a4)
    {
      v17 = (void *)MEMORY[0x189607870];
      uint64_t v18 = OOBDOMAIN;
      uint64_t v26 = *MEMORY[0x1896075E0];
      v27[0] = @"Out-of-bound access.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 errorWithDomain:v18 code:1 userInfo:v19];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  if (v7) {
    return (id)v7[3];
  }
  id v21 = objc_alloc(NSString);
  v22 = (void *)[v21 initWithUTF8String:&self->super._stringRegion[v25]];
  unsigned int v23 = v25;
  id v20 = v22;
  id v24 = v20;
  std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,NSString * {__strong}>>( (uint64_t)p_stringCache,  &v23,  (uint64_t)&v23);

  return v20;
}

- (id)copyDeserializedStringWithError:(id *)a3
{
  uint64_t Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3 && *a3) {
    return 0LL;
  }
  else {
    return -[VMUSimpleDeserializer copyDeserializedStringWithID:error:]( self,  "copyDeserializedStringWithID:error:",  Field,  a3);
  }
}

- (const)copyDeserializedNullTerminatedBytesWithError:(id *)a3
{
  unsigned int Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3)
  {
    if (*a3) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = Field == -1;
    }
    if (!v6) {
      goto LABEL_9;
    }
    return 0LL;
  }

  if (Field == -1) {
    return 0LL;
  }
LABEL_9:
  unsigned int stringRegCapacity = self->super._stringRegCapacity;
  if (stringRegCapacity <= Field) {
    -[VMUSimpleDeserializer copyDeserializedNullTerminatedBytesWithError:].cold.1();
  }
  return strndup(&self->super._stringRegion[Field], stringRegCapacity - Field);
}

- (unsigned)_deserializeValues:(unsigned int)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1895F89C0];
  uint64_t cursor = self->super._cursor;
  unint64_t v5 = cursor + 4LL * a3;
  if (v5 <= self->super._intRegCapacity)
  {
    uint64_t v18 = (unsigned int *)&self->super._intRegion[cursor];
    self->super._uint64_t cursor = v5;
  }

  else
  {
    serializerLogHandle();
    unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      _nextField(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    if (a4)
    {
      uint64_t v15 = (void *)MEMORY[0x189607870];
      uint64_t v16 = OOBDOMAIN;
      uint64_t v20 = *MEMORY[0x1896075E0];
      v21[0] = @"Out-of-bound access.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 errorWithDomain:v16 code:1 userInfo:v17];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  return v18;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

- (void)copyDeserializedNullTerminatedBytesWithError:.cold.1()
{
}

@end