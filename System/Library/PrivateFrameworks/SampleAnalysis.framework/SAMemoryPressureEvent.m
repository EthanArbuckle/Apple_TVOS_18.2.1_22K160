@interface SAMemoryPressureEvent
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)parseKTrace:(void *)a3 findingMemoryPressureEvents:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (SATimestamp)timestamp;
- (unint64_t)availableBytes;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unsigned)memoryStatusLevel;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAMemoryPressureEvent

+ (void)parseKTrace:(void *)a3 findingMemoryPressureEvents:
{
  id v3 = a3;
  objc_opt_self();
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x3032000000LL;
  v8[3] = __Block_byref_object_copy__7;
  v8[4] = __Block_byref_object_dispose__7;
  id v9 = 0LL;
  if (!ktrace_get_machine())
  {
    int v4 = *__error();
    _sa_logt();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_186C92000, v5, OS_LOG_TYPE_ERROR, "Unable to get machine from ktrace session", buf, 2u);
    }

    goto LABEL_9;
  }

  if (!ktrace_machine_hw_page_size())
  {
    int v4 = *__error();
    _sa_logt();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_186C92000,  v5,  OS_LOG_TYPE_ERROR,  "Unable to get hw page size from ktrace session",  buf,  2u);
    }

uint64_t __65__SAMemoryPressureEvent_parseKTrace_findingMemoryPressureEvents___block_invoke( uint64_t a1,  uint64_t a2)
{
  int v4 = objc_alloc_init(&OBJC_CLASS___SAMemoryPressureEvent);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
  v8 = +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)&OBJC_CLASS___SATimestamp, a2);
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v9) {
    objc_setProperty_atomic(v9, v7, v8, 16LL);
  }

  v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v11 = *(unsigned int *)(a1 + 48);
  uint64_t v12 = *(void *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t result = [v10 availableBytes];
  if (v10) {
    v10[3] = result + (v13 + v12) * v11;
  }
  return result;
}

void __65__SAMemoryPressureEvent_parseKTrace_findingMemoryPressureEvents___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v2)
  {
    *(_BYTE *)(v2 + 8) = *(_BYTE *)(a2 + 24);
    int v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    uint64_t v6 = *(void *)(a2 + 8);
    uint64_t v7 = *(void *)(a2 + 16);
    uint64_t v8 = [v4 availableBytes];
    if (v4) {
      v4[3] = v8 + (v7 + v6) * v5;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0LL;
  }

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16LL, 1);
}

- (unint64_t)availableBytes
{
  return self->_availableBytes;
}

- (unsigned)memoryStatusLevel
{
  return self->_memoryStatusLevel;
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAMemoryPressureEvent";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 19LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAMemoryPressureEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v10 = *__error();
    _sa_logt();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = -[SAMemoryPressureEvent debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = -[SAMemoryPressureEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_186C92000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v10;
    id v13 = -[SAMemoryPressureEvent debugDescription](self, "debugDescription");
    char v14 = [v13 UTF8String];
    -[SAMemoryPressureEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(113, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_timestamp, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_availableBytes;
  BYTE2(a3->var3) = self->_memoryStatusLevel;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5) {
    -[SATimestamp addSelfToSerializationDictionary:](self->_timestamp, "addSelfToSerializationDictionary:", v6);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x12)
  {
    int v7 = *__error();
    _sa_logt();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 19LL;
      _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAIOEvent struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(138, "bufferLength %lu < serialized SAIOEvent struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_9:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAMemoryPressureEvent version",  0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  id result = objc_alloc_init(&OBJC_CLASS___SAMemoryPressureEvent);
  if (result)
  {
    *((void *)result + 3) = *(void *)((char *)a3 + 10);
    *((_BYTE *)result + 8) = *((_BYTE *)a3 + 18);
  }

  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v25 = a5;
  id v10 = a6;
  if (a4 <= 0x12)
  {
    int v16 = *__error();
    _sa_logt();
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      uint64_t v29 = 19LL;
      _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMemoryPressureEvent struct %lu",  buf,  0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage( 152,  "bufferLength %lu < serialized SAMemoryPressureEvent struct %lu",  v18,  v19,  v20,  v21,  v22,  v23,  a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAMemoryPressureEvent version",  0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v25, v11, v13);
  uint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v14;
}

@end