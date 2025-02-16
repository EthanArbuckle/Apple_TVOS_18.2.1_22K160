@interface SAMountSnapshot
+ (SAMountSnapshot)mountSnapshotWithoutReferencesFromPAStyleMountSnapshot:(uint64_t)a1;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAMountSnapshot

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAMountSnapshot";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSArray count](self->_blockedThreadIDs, "count") + 22;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAMountSnapshot sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v16 = *__error();
    _sa_logt();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = -[SAMountSnapshot debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v46 = [v18 UTF8String];
      __int16 v47 = 2048;
      unint64_t v48 = -[SAMountSnapshot sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v49 = 2048;
      unint64_t v50 = a4;
      _os_log_error_impl(&dword_186C92000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v16;
    id v19 = -[SAMountSnapshot debugDescription](self, "debugDescription");
    char v20 = [v19 UTF8String];
    -[SAMountSnapshot sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(698, "%s: size %lu != buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
LABEL_14:
    int v27 = *__error();
    _sa_logt();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = -[SAMountSnapshot debugDescription](self, "debugDescription");
      uint64_t v30 = [v29 UTF8String];
      NSUInteger v31 = -[NSArray count](self->_blockedThreadIDs, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v46 = v30;
      __int16 v47 = 2048;
      unint64_t v48 = v31;
      _os_log_error_impl(&dword_186C92000, v28, OS_LOG_TYPE_ERROR, "%s: %lu blockedThreadIDs", buf, 0x16u);
    }

    *__error() = v27;
    id v32 = -[SAMountSnapshot debugDescription](self, "debugDescription");
    char v33 = [v32 UTF8String];
    -[NSArray count](self->_blockedThreadIDs, "count");
    _SASetCrashLogMessage(707, "%s: %lu blockedThreadIDs", v34, v35, v36, v37, v38, v39, v33);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 257;
  *(unint64_t *)((char *)&a3->var3 + 6) = *(void *)&self->_timestampOfLastResponse;
  *(void *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_timeWhenMeasured,  v8);
  if (-[NSArray count](self->_blockedThreadIDs, "count") >= 0xFFFFFFFF) {
    goto LABEL_14;
  }
  *(_DWORD *)(&a3->var1 + 1) = -[NSArray count](self->_blockedThreadIDs, "count");
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  v9 = self->_blockedThreadIDs;
  uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v40,  v44,  16LL);
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = (void *)((char *)&a3->var4 + 6);
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v9);
        }
        *v12++ = [*(id *)(*((void *)&v40 + 1) + 8 * i) unsignedLongLongValue];
      }

      uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v40,  v44,  16LL);
    }

    while (v11);
  }

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5) {
    -[SATimestamp addSelfToSerializationDictionary:](self->_timeWhenMeasured, "addSelfToSerializationDictionary:", v6);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x15)
  {
    int v13 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v31 = a4;
      __int16 v32 = 2048;
      uint64_t v33 = 22LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountSnapshot struct %lu",  buf,  0x16u);
    }

    *__error() = v13;
    _SASetCrashLogMessage( 733,  "bufferLength %lu < serialized SAMountSnapshot struct %lu",  v14,  v15,  v16,  v17,  v18,  v19,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 2) + 22 > a4)
  {
LABEL_11:
    int v20 = *__error();
    _sa_logt();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(unsigned int *)(v5 + 2);
      *(_DWORD *)buf = 134218240;
      unint64_t v31 = a4;
      __int16 v32 = 2048;
      uint64_t v33 = v22;
      _os_log_error_impl( &dword_186C92000,  v21,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatusTracker struct with %lu blockedThreads",  buf,  0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage( 734,  "bufferLength %lu < serialized SAMountStatusTracker struct with %lu blockedThreads",  v23,  v24,  v25,  v26,  v27,  v28,  a4);
    _os_crash();
    __break(1u);
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAMountSnapshot version",  0LL);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___SAMountSnapshot);
  v6->_timestampOfLastResponse = *(double *)(v5 + 14);
  v7 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:*(unsigned int *)(v5 + 2)];
  if (*(_DWORD *)(v5 + 2))
  {
    unint64_t v8 = 0LL;
    do
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v5 + 22 + 8 * v8)];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 addObject:v9];

      ++v8;
    }

    while (v8 < *(unsigned int *)(v5 + 2));
  }

  uint64_t v10 = [v7 copy];
  blockedThreadIDs = v6->_blockedThreadIDs;
  v6->_blockedThreadIDs = (NSArray *)v10;

  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v33 = a5;
  id v10 = a6;
  if (a4 <= 0x15)
  {
    int v16 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v35 = a4;
      __int16 v36 = 2048;
      uint64_t v37 = 22LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountSnapshot struct %lu",  buf,  0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage( 754,  "bufferLength %lu < serialized SAMountSnapshot struct %lu",  v17,  v18,  v19,  v20,  v21,  v22,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 2) + 22 > a4)
  {
LABEL_8:
    int v23 = *__error();
    _sa_logt();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(unsigned int *)((char *)a3 + 2);
      *(_DWORD *)buf = 134218240;
      unint64_t v35 = a4;
      __int16 v36 = 2048;
      uint64_t v37 = v25;
      _os_log_error_impl( &dword_186C92000,  v24,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatusTracker struct with %lu blockedThreads",  buf,  0x16u);
    }

    *__error() = v23;
    _SASetCrashLogMessage( 755,  "bufferLength %lu < serialized SAMountStatusTracker struct with %lu blockedThreads",  v26,  v27,  v28,  v29,  v30,  v31,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAMountSnapshot version",  0LL);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 6);
  int v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v33, v11, v13);
  uint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timeWhenMeasured = self->_timeWhenMeasured;
  self->_timeWhenMeasured = v14;
}

+ (SAMountSnapshot)mountSnapshotWithoutReferencesFromPAStyleMountSnapshot:(uint64_t)a1
{
  v3 = objc_alloc_init(&OBJC_CLASS___SAMountSnapshot);
  v3->_timestampOfLastResponse = *(double *)(a2 + 16);
  uint64_t v4 = +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  *(double *)(a2 + 8),  0.0,  0.0);
  timeWhenMeasured = v3->_timeWhenMeasured;
  v3->_timeWhenMeasured = (SATimestamp *)v4;

  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (*(_DWORD *)(a2 + 24))
  {
    unint64_t v7 = 0LL;
    do
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 28 + 8 * v7)];
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 addObject:v8];

      ++v7;
    }

    while (v7 < *(unsigned int *)(a2 + 24));
  }

  uint64_t v9 = [v6 copy];
  blockedThreadIDs = v3->_blockedThreadIDs;
  v3->_blockedThreadIDs = (NSArray *)v9;

  return v3;
}

@end