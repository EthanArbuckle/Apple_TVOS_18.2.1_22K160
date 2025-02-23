@interface SAModelLoadedChange
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)inMemory;
- (BOOL)loaded;
- (BOOL)userInitiated;
- (NSArray)loadedRequesters;
- (NSString)debugDescription;
- (SAModelLoadedChange)initWithTimestamp:(id)a3 endTime:(id)a4 userInitiated:(BOOL)a5 loadedRequesters:(id)a6 inMemory:(BOOL)a7;
- (SATimestamp)endTime;
- (SATimestamp)timestamp;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAModelLoadedChange

- (SAModelLoadedChange)initWithTimestamp:(id)a3 endTime:(id)a4 userInitiated:(BOOL)a5 loadedRequesters:(id)a6 inMemory:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SAModelLoadedChange;
  v16 = -[SAModelLoadedChange init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_timestamp, a3);
    objc_storeStrong((id *)&v17->_endTime, a4);
    v17->_userInitiated = a5;
    uint64_t v18 = [v15 copy];
    loadedRequesters = v17->_loadedRequesters;
    v17->_loadedRequesters = (NSArray *)v18;

    v17->_inMemory = a7;
    v20 = v17;
  }

  return v17;
}

- (BOOL)loaded
{
  return self->_loadedRequesters != 0LL;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  BOOL v4 = -[SAModelLoadedChange loaded](self, "loaded");
  BOOL v5 = -[SAModelLoadedChange userInitiated](self, "userInitiated");
  v6 = -[SAModelLoadedChange loadedRequesters](self, "loadedRequesters");
  objc_msgSend(v6, "componentsJoinedByString:", @", ");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SAModelLoadedChange timestamp](self, "timestamp");
  [v8 debugDescription];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)[v3 initWithFormat:@"load change (loaded:%d UI:%d) requested by %@ at %@", v4, v5, v7, v9];

  return (NSString *)v10;
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16LL, 1);
}

- (SATimestamp)endTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)inMemory
{
  return self->_inMemory;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (NSArray)loadedRequesters
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v7 = a3;
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SAModelLoadedChange loaded](self, "loaded"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)@"loaded", v4);

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SAModelLoadedChange userInitiated](self, "userInitiated"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v7, @"userInitiated", v5);

  timestamp = self->_timestamp;
  if (timestamp) {
    SAJSONWriteDictionaryEntry(v7, @"timestamp", timestamp);
  }
  if (-[NSArray count](self->_loadedRequesters, "count")) {
    SAJSONWriteDictionaryEntry(v7, @"loadedRequesters", self->_loadedRequesters);
  }
}

+ (id)classDictionaryKey
{
  return @"SAModelLoadedChange";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSArray count](self->_loadedRequesters, "count") + 15;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (-[SAModelLoadedChange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v13 = *__error();
    _sa_logt();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = -[SAModelLoadedChange debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v48 = [v15 UTF8String];
      __int16 v49 = 2048;
      unint64_t v50 = -[SAModelLoadedChange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v51 = 2048;
      unint64_t v52 = a4;
      _os_log_error_impl(&dword_186C92000, v14, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v13;
    id v16 = -[SAModelLoadedChange debugDescription](self, "debugDescription");
    BOOL v5 = (char *)[v16 UTF8String];
    -[SAModelLoadedChange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(304, "%s: size %lu != buffer length %lu", v17, v18, v19, v20, v21, v22, (char)v5);

    _os_crash();
    __break(1u);
    goto LABEL_11;
  }

  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_timestamp, v9);
  BYTE2(a3->var2) = BYTE2(a3->var2) & 0xFE | -[SAModelLoadedChange loaded](self, "loaded");
  if (-[SAModelLoadedChange userInitiated](self, "userInitiated")) {
    char v10 = 2;
  }
  else {
    char v10 = 0;
  }
  BYTE2(a3->var2) = BYTE2(a3->var2) & 0xFD | v10;
  if (-[NSArray count](self->_loadedRequesters, "count") >= 0xFFFFFFFF)
  {
LABEL_11:
    int v23 = *__error();
    _sa_logt();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = -[SAModelLoadedChange debugDescription](self, "debugDescription");
      BOOL v5 = (char *)[v25 UTF8String];
      NSUInteger v26 = -[NSArray count](self->_loadedRequesters, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v48 = (uint64_t)v5;
      __int16 v49 = 2048;
      unint64_t v50 = v26;
      _os_log_error_impl(&dword_186C92000, v24, OS_LOG_TYPE_ERROR, "%s has %lu requesters", buf, 0x16u);
    }

    *__error() = v23;
    -[SAModelLoadedChange debugDescription](self, "debugDescription");
    a4 = (unint64_t) objc_claimAutoreleasedReturnValue();
    a3 = ($4503B44C62D71222CEA7AA9E1615CB61 *)[(id)a4 UTF8String];
    -[NSArray count](self->_loadedRequesters, "count");
    _SASetCrashLogMessage(313, "%s has %lu requesters", v27, v28, v29, v30, v31, v32, (char)a3);

    _os_crash();
    __break(1u);
LABEL_14:
    int v33 = *__error();
    _sa_logt();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = -[SAModelLoadedChange debugDescription](self, "debugDescription");
      uint64_t v36 = [v35 UTF8String];
      NSUInteger v37 = -[NSArray count](self->_loadedRequesters, "count");
      NSUInteger v38 = -[NSArray count](self->_loadedRequesters, "count");
      *(_DWORD *)buf = 136315906;
      uint64_t v48 = v36;
      __int16 v49 = 2048;
      unint64_t v50 = v37;
      __int16 v51 = 2048;
      unint64_t v52 = &v5[8 * v38] - (char *)a3;
      __int16 v53 = 2048;
      unint64_t v54 = a4;
      _os_log_error_impl( &dword_186C92000,  v34,  OS_LOG_TYPE_ERROR,  "%s: after serializing (with %lu loadedRequesters), ended with length %ld, should be %lu",  buf,  0x2Au);
    }

    *__error() = v33;
    id v39 = -[SAModelLoadedChange debugDescription](self, "debugDescription");
    char v40 = [v39 UTF8String];
    -[NSArray count](self->_loadedRequesters, "count");
    -[NSArray count](self->_loadedRequesters, "count");
    _SASetCrashLogMessage( 318,  "%s: after serializing (with %lu loadedRequesters), ended with length %ld, should be %lu",  v41,  v42,  v43,  v44,  v45,  v46,  v40);

    _os_crash();
    __break(1u);
  }

  BOOL v5 = (char *)&a3->var2 + 7;
  if (8 * -[NSArray count](self->_loadedRequesters, "count") + 15 != a4) {
    goto LABEL_14;
  }
  unsigned int v11 = -[NSArray count](self->_loadedRequesters, "count");
  *(_DWORD *)((char *)&a3->var2 + 3) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances( (char *)&a3->var2 + 7,  v11,  self->_loadedRequesters,  v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[SATimestamp addSelfToSerializationDictionary:](self->_timestamp, "addSelfToSerializationDictionary:", v4);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = self->_loadedRequesters;
    uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (void)v12);
        }

        while (v9 != v11);
        uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v9);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a4 <= 0xE)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 15LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAModelLoadedChange struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage( 342,  "bufferLength %lu < serialized SAModelLoadedChange struct %lu",  v8,  v9,  v10,  v11,  v12,  v13,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 11) + 15 > a4)
  {
LABEL_8:
    int v14 = *__error();
    _sa_logt();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(v5 + 11);
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAModelLoadedChange struct with %u requesters",  buf,  0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage( 343,  "bufferLength %lu < serialized SAModelLoadedChange struct with %u requesters",  v17,  v18,  v19,  v20,  v21,  v22,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAModelLoadedChange version",  0LL);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }

  id result = objc_alloc_init(&OBJC_CLASS___SAModelLoadedChange);
  *((_BYTE *)result + 9) = (*(_BYTE *)(v5 + 10) & 2) != 0;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v38 = a5;
  id v10 = a6;
  if (a4 <= 0xE)
  {
    int v21 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v40 = a4;
      __int16 v41 = 2048;
      uint64_t v42 = 15LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAModelLoadedChange struct %lu",  buf,  0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage( 356,  "bufferLength %lu < serialized SAModelLoadedChange struct %lu",  v22,  v23,  v24,  v25,  v26,  v27,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }

  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 11) + 15 > a4)
  {
LABEL_10:
    int v28 = *__error();
    _sa_logt();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v30 = *(_DWORD *)((char *)a3 + 11);
      *(_DWORD *)buf = 134218240;
      unint64_t v40 = a4;
      __int16 v41 = 1024;
      LODWORD(v42) = v30;
      _os_log_error_impl( &dword_186C92000,  v29,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAModelLoadedChange struct with %u requesters",  buf,  0x12u);
    }

    *__error() = v28;
    _SASetCrashLogMessage( 357,  "bufferLength %lu < serialized SAModelLoadedChange struct with %u requesters",  v31,  v32,  v33,  v34,  v35,  v36,  a4);
    _os_crash();
    __break(1u);
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAModelLoadedChange version",  0LL);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v38, v11, v13, 0);
  int v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v14;

  if ((*((_BYTE *)a3 + 10) & 1) != 0)
  {
    int v16 = (char *)a3 + 15;
    uint64_t v17 = *(unsigned int *)((char *)a3 + 11);
    uint64_t v18 = (void *)objc_opt_class();
    SASerializableNewMutableArrayFromIndexList((uint64_t)v16, v17, v38, v11, v18);
    uint64_t v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    loadedRequesters = self->_loadedRequesters;
    self->_loadedRequesters = v19;
  }
}

@end