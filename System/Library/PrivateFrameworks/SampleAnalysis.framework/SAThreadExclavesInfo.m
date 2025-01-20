@interface SAThreadExclavesInfo
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSString)debugDescription;
- (uint64_t)matchesStack:(uint64_t)a1;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)initWithCallstacks:(void *)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAThreadExclavesInfo

- (void)initWithCallstacks:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___SAThreadExclavesInfo;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[2];
      a1[2] = v4;
    }
  }

  return a1;
}

- (uint64_t)matchesStack:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v5 = [*(id *)(a1 + 16) count];
    if (v3) {
      id Property = objc_getProperty(v3, v4, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    if ([Property count] != v5)
    {
LABEL_29:
      a1 = 0LL;
      goto LABEL_30;
    }

    if (v5)
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        [*(id *)(a1 + 16) objectAtIndexedSubscript:v7];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        id v10 = v3 ? objc_getProperty(v3, v8, 16LL, 1) : 0LL;
        [v10 objectAtIndexedSubscript:v7];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = v9 ? objc_getProperty(v9, v11, 8LL, 1) : 0LL;
        id v15 = v13;
        id v16 = v12 ? objc_getProperty(v12, v14, 8LL, 1) : 0LL;

        if (v15 != v16) {
          break;
        }
        if (v9 && objc_getProperty(v9, v17, 16LL, 1))
        {
          if (!v12) {
            break;
          }
          if (!objc_getProperty(v12, v17, 16LL, 1)) {
            break;
          }
          id v19 = objc_getProperty(v9, v18, 16LL, 1);
          id v21 = objc_getProperty(v12, v20, 16LL, 1);

          if (v19 != v21) {
            break;
          }
        }

        else if (v12 && objc_getProperty(v12, v17, 16LL, 1))
        {
          break;
        }

        if (v5 == ++v7) {
          goto LABEL_27;
        }
      }

      goto LABEL_29;
    }

- (NSString)debugDescription
{
  id v4 = objc_alloc(NSString);
  if (self) {
    id Property = objc_getProperty(self, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  return (NSString *)(id)objc_msgSend( v4,  "initWithFormat:",  @"thread exclave info with %lu callstacks",  objc_msgSend(Property, "count"));
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAThreadExclavesInfo";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  if (self) {
    self = (SAThreadExclavesInfo *)objc_getProperty(self, a2, 16LL, 1);
  }
  return 8 * -[SAThreadExclavesInfo count](self, "count") + 10;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAThreadExclavesInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v13 = *__error();
    _sa_logt();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = -[SAThreadExclavesInfo debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v34 = [v15 UTF8String];
      __int16 v35 = 2048;
      unint64_t v36 = -[SAThreadExclavesInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v37 = 2048;
      unint64_t v38 = a4;
      _os_log_error_impl(&dword_186C92000, v14, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v13;
    id v16 = -[SAThreadExclavesInfo debugDescription](self, "debugDescription");
    a3 = ($54D7D07E751DBEAE55462C0B4C71138B *)[v16 UTF8String];
    -[SAThreadExclavesInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(505, "%s: size %lu != buffer length %lu", v17, v18, v19, v20, v21, v22, (char)a3);

    _os_crash();
    __break(1u);
    goto LABEL_9;
  }

  *(_WORD *)&a3->var0 = 257;
  if (!self) {
    goto LABEL_12;
  }
  *(_DWORD *)(&a3->var1 + 1) = self->_flags;
  for (id i = objc_getProperty(self, v9, 16LL, 1); ; id i = 0LL)
  {
    a4 = (unint64_t)i;
LABEL_9:
    int v23 = *__error();
    _sa_logt();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[SAThreadExclavesInfo debugDescription](self, "debugDescription");
      a3 = ($54D7D07E751DBEAE55462C0B4C71138B *) objc_claimAutoreleasedReturnValue();
      uint64_t v25 = -[$54D7D07E751DBEAE55462C0B4C71138B UTF8String](a3, "UTF8String");
      uint64_t v26 = [(id)a4 count];
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = v25;
      __int16 v35 = 2048;
      unint64_t v36 = v26;
      _os_log_error_impl(&dword_186C92000, v24, OS_LOG_TYPE_ERROR, "%s: %lu callstacks", buf, 0x16u);
    }

    *__error() = v23;
    -[SAThreadExclavesInfo debugDescription](self, "debugDescription");
    self = (SAThreadExclavesInfo *) objc_claimAutoreleasedReturnValue();
    id v8 = (id)-[SAThreadExclavesInfo UTF8String](self, "UTF8String");
    [(id)a4 count];
    _SASetCrashLogMessage(513, "%s: %lu callstacks", v27, v28, v29, v30, v31, v32, (char)v8);

    _os_crash();
    __break(1u);
LABEL_12:
    *(_DWORD *)(&a3->var1 + 1) = 0;
  }

  unsigned int v11 = [(id)a4 count];
  *(unsigned int *)((char *)&a3->var2 + 2) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var3 + 2, v11, (void *)a4, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v7, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v9 = Property;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "addSelfToSerializationDictionary:", v4, (void)v14);
        }

        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v11);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a4 <= 9)
  {
    int v7 = *__error();
    _sa_logt();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 10LL;
      _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThreadExclavesInfo struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage( 538,  "bufferLength %lu < serialized SAThreadExclavesInfo struct %lu",  v9,  v10,  v11,  v12,  v13,  v14,  a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAThreadExclavesInfo version",  0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  id result = objc_alloc_init(&OBJC_CLASS___SAThreadExclavesInfo);
  *((_DWORD *)result + 2) = *(_DWORD *)((char *)a3 + 2);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v34 = a5;
  id v10 = a6;
  if (a4 <= 9)
  {
    int v17 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v36 = a4;
      __int16 v37 = 2048;
      uint64_t v38 = 10LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThreadExclavesInfo struct %lu",  buf,  0x16u);
    }

    *__error() = v17;
    _SASetCrashLogMessage( 552,  "bufferLength %lu < serialized SAThreadExclavesInfo struct %lu",  v18,  v19,  v20,  v21,  v22,  v23,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v11 = *(unsigned int *)((char *)a3 + 6);
  if (8 * v11 + 10 > a4)
  {
LABEL_8:
    int v24 = *__error();
    _sa_logt();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = *(_DWORD *)((char *)a3 + 6);
      *(_DWORD *)buf = 134218240;
      unint64_t v36 = a4;
      __int16 v37 = 1024;
      LODWORD(v38) = v26;
      _os_log_error_impl( &dword_186C92000,  v25,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThreadExclavesInfo struct with %u callstacks",  buf,  0x12u);
    }

    *__error() = v24;
    _SASetCrashLogMessage( 554,  "bufferLength %lu < serialized SAThreadExclavesInfo struct with %u callstacks",  v27,  v28,  v29,  v30,  v31,  v32,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAThreadExclavesInfo version",  0LL);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }

  uint64_t v12 = v10;
  uint64_t v13 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 10, v11, v34, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (NSArray *)[v14 copy];
  callstacks = self->_callstacks;
  self->_callstacks = v15;
}

@end