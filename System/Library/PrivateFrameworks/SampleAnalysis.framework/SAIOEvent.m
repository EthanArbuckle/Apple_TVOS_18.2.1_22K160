@interface SAIOEvent
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)typeString:(unsigned int)a3;
+ (void)parseKTrace:(void *)a3 findingIOEvents:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isRead;
- (NSString)debugDescription;
- (NSString)type;
- (SAIOEvent)initWithStartTime:(id)a3 threadID:(unint64_t)a4 blockNumber:(unint64_t)a5 size:(unint64_t)a6 type:(unint64_t)a7 tier:(unsigned int)a8;
- (SATimestamp)endTimestamp;
- (SATimestamp)startTimestamp;
- (unint64_t)size;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)threadID;
- (unsigned)tier;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setEndTimestamp:(id)a3;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAIOEvent

- (void)setEndTimestamp:(id)a3
{
}

+ (void)parseKTrace:(void *)a3 findingIOEvents:
{
  id v3 = a3;
  objc_opt_self();
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  v7 = v3;
  id v4 = v3;
  ktrace_events_range();
  id v5 = v6;
  ktrace_events_single();
}

void __41__SAIOEvent_parseKTrace_findingIOEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a2 + 8);
  +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)&OBJC_CLASS___SATimestamp, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = *(_DWORD *)(a2 + 48);
  if ((v6 & 4) != 0)
  {
    v14 = *(void **)(a1 + 32);
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v4];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:v15];
    v7 = (SAIOEvent *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SAIOEvent setEndTimestamp:](v7, "setEndTimestamp:", v5);
      v16 = *(void **)(a1 + 32);
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v4];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 removeObjectForKey:v17];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  else
  {
    v7 = -[SAIOEvent initWithStartTime:threadID:blockNumber:size:type:tier:]( objc_alloc(&OBJC_CLASS___SAIOEvent),  "initWithStartTime:threadID:blockNumber:size:type:tier:",  v5,  *(void *)(a2 + 40),  *(void *)(a2 + 24),  *(void *)(a2 + 32),  v6 & 0xFFFFFFFC,  (v6 >> 10) & 0xF);
    v8 = *(void **)(a1 + 32);
    unint64_t v9 = 0x189607000uLL;
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v4];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      int v18 = *__error();
      _sa_logt();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v20 = *(void **)(a1 + 32);
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v4];
        int v25 = v18;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 objectForKeyedSubscript:v21];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 debugDescription];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[SAIOEvent debugDescription](v7, "debugDescription");
        *(_DWORD *)buf = 138412546;
        v27 = v23;
        __int16 v28 = 2112;
        v29 = v24;
        _os_log_fault_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_FAULT,  "Existing IOEvent %@ when adding new event %@",  buf,  0x16u);

        unint64_t v9 = 0x189607000LL;
        int v18 = v25;
      }

      *__error() = v18;
    }

    v12 = *(void **)(a1 + 32);
    [*(id *)(v9 + 2408) numberWithUnsignedLongLong:v4];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v7 forKeyedSubscript:v13];
  }
}

uint64_t __41__SAIOEvent_parseKTrace_findingIOEvents___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllObjects];
}

- (SAIOEvent)initWithStartTime:(id)a3 threadID:(unint64_t)a4 blockNumber:(unint64_t)a5 size:(unint64_t)a6 type:(unint64_t)a7 tier:(unsigned int)a8
{
  unsigned int v9 = a7;
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SAIOEvent;
  v16 = -[SAIOEvent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_startTimestamp, a3);
    v17->_size = a6;
    v17->_threadID = a4;
    v17->_tier = a8;
    v17->_rawType = v9;
    v17->_blockNumber = a5;
  }

  return v17;
}

- (NSString)type
{
  return (NSString *)+[SAIOEvent typeString:](&OBJC_CLASS___SAIOEvent, "typeString:", self->_rawType);
}

+ (id)typeString:(unsigned int)a3
{
  if ((int)a3 > 167773439)
  {
    if ((int)a3 > 167773695)
    {
      if (a3 == 167773696) {
        return @"ReadMigration";
      }
      if (a3 == 167773712) {
        return @"WriteMigration";
      }
    }

    else
    {
      if (a3 == 167773440) {
        return @"ReadTransform";
      }
      if (a3 == 167773456) {
        return @"WriteTransform";
      }
    }
  }

  else if ((int)a3 > 167772927)
  {
    if (a3 == 167772928) {
      return @"ReadMeta";
    }
    if (a3 == 167772944) {
      return @"WriteMeta";
    }
  }

  else
  {
    if (a3 == 167772672) {
      return @"ReadChunk";
    }
    if (a3 == 167772688) {
      return @"WriteChunk";
    }
  }

  unsigned int v4 = (a3 & 0x3020068) - 50462720;
  if (v4 > 0x4F) {
    return @"Other";
  }
  else {
    return *(__CFString **)((char *)off_189F612D0 + v4);
  }
}

- (BOOL)isRead
{
  signed int rawType = self->_rawType;
  LOBYTE(self) = 1;
  if (rawType > 167773439)
  {
    if (rawType > 167773695)
    {
      if (rawType == 167773696) {
        return (char)self;
      }
      unsigned __int16 v3 = 1552;
    }

    else
    {
      if (rawType == 167773440) {
        return (char)self;
      }
      unsigned __int16 v3 = 1296;
    }
  }

  else if (rawType > 167772927)
  {
    if (rawType == 167772928) {
      return (char)self;
    }
    unsigned __int16 v3 = 784;
  }

  else
  {
    if (rawType == 167772672) {
      return (char)self;
    }
    unsigned __int16 v3 = 528;
  }

  if (rawType == (v3 | 0xA000000)) {
    LOBYTE(self) = 0;
  }
  else {
    LODWORD(self) = (rawType >> 3) & 1;
  }
  return (char)self;
}

- (NSString)debugDescription
{
  unsigned __int16 v3 = (void *)NSString;
  unint64_t threadID = self->_threadID;
  -[SAIOEvent type](self, "type");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t size = self->_size;
  uint64_t tier = self->_tier;
  v8 = -[SATimestamp debugDescription](self->_startTimestamp, "debugDescription");
  -[SATimestamp debugDescription](self->_endTimestamp, "debugDescription");
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"IO Event [thread:0x%llx, type:%@, size 0x%llx tier:%d]\nstart:%@\n  end:%@", threadID, v5, size, tier, v8, v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (SATimestamp)startTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16LL, 1);
}

- (SATimestamp)endTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 24LL, 1);
}

- (unint64_t)size
{
  return self->_size;
}

- (unsigned)tier
{
  return self->_tier;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v8 = a3;
  -[SAIOEvent type](self, "type");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v8, (uint64_t)@"type", v4);

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_size];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v8, @"size", v5);

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_tier];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v8, @"tier", v6);

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_threadID];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v8, @"threadID", v7);

  SAJSONWriteDictionaryEntry(v8, @"startTime", self->_startTimestamp);
  SAJSONWriteDictionaryEntry(v8, @"endTime", self->_endTimestamp);
}

+ (id)classDictionaryKey
{
  return @"SAIOEvent";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 58LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAIOEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v10 = *__error();
    _sa_logt();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = -[SAIOEvent debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = -[SAIOEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_186C92000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v10;
    id v13 = -[SAIOEvent debugDescription](self, "debugDescription");
    char v14 = [v13 UTF8String];
    -[SAIOEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(221, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 513;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTimestamp, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_endTimestamp,  v8);
  *(unint64_t *)((char *)&a3->var3 + 2) = self->_size;
  *(void *)((char *)&a3->var7 + 2) = self->_threadID;
  *(unint64_t *)((char *)&a3->var5 + 2) = self->_blockNumber;
  *(_DWORD *)((char *)&a3->var6 + 2) = self->_rawType;
  *(_DWORD *)((char *)&a3->var6 + 6) = self->_tier;
  *(unint64_t *)((char *)&a3->var4 + 2) = 0LL;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5)
  {
    -[SATimestamp addSelfToSerializationDictionary:](self->_startTimestamp, "addSelfToSerializationDictionary:", v6);
    -[SATimestamp addSelfToSerializationDictionary:](self->_endTimestamp, "addSelfToSerializationDictionary:", v6);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x31)
  {
    int v7 = *__error();
    _sa_logt();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 50LL;
      _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAIOEvent struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(253, "bufferLength %lu < serialized SAIOEvent struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_10:
    int v15 = *__error();
    _sa_logt();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 58LL;
      _os_log_error_impl( &dword_186C92000,  v16,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAIOEvent_v2 struct %lu",  buf,  0x16u);
    }

    *__error() = v15;
    _SASetCrashLogMessage( 263,  "bufferLength %lu < serialized SAIOEvent_v2 struct %lu",  v17,  v18,  v19,  v20,  v21,  v22,  a4);
    _os_crash();
    __break(1u);
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAIOEvent version",  0LL);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }

  id result = objc_alloc_init(&OBJC_CLASS___SAIOEvent);
  *((void *)result + 6) = *(void *)((char *)a3 + 34);
  *((void *)result + 4) = *(void *)((char *)a3 + 18);
  *((_DWORD *)result + 3) = *(_DWORD *)((char *)a3 + 42);
  *((_DWORD *)result + 2) = *(_DWORD *)((char *)a3 + 46);
  if (a4 <= 0x39) {
    goto LABEL_10;
  }
  *((void *)result + 5) = *(void *)((char *)a3 + 50);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v29 = a5;
  id v10 = a6;
  if (a4 <= 0x31)
  {
    int v20 = *__error();
    _sa_logt();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v31 = a4;
      __int16 v32 = 2048;
      uint64_t v33 = 50LL;
      _os_log_error_impl( &dword_186C92000,  v21,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAIOEvent struct %lu",  buf,  0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(276, "bufferLength %lu < serialized SAIOEvent struct %lu", v22, v23, v24, v25, v26, v27, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAIOEvent version",  0LL);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v29, v11, v13);
  uint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTimestamp = self->_startTimestamp;
  self->_startTimestamp = v14;

  unint64_t v16 = *(void *)((char *)a3 + 10);
  uint64_t v17 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v29, v11, v17);
  uint64_t v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTimestamp = self->_endTimestamp;
  self->_endTimestamp = v18;
}

@end