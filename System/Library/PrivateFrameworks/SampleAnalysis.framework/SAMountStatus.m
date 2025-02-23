@interface SAMountStatus
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)enumerateSnapshotsBetweenStartTime:(void *)a3 endTime:(void *)a4 block:;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedMountStatus:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
@end

@implementation SAMountStatus

- (void)enumerateSnapshotsBetweenStartTime:(void *)a3 endTime:(void *)a4 block:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  v9 = a4;
  if (a1)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = *(id *)(a1 + 8);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v23;
LABEL_4:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
        if (!v7
          || (!v16
            ? (id Property = 0LL)
            : (id Property = objc_getProperty(*(id *)(*((void *)&v22 + 1) + 8 * v15), v12, 8LL, 1)),
              ([Property lt:v7] & 1) == 0))
        {
          if (v8)
          {
            if (v16)
            {
              double v18 = *(double *)(v16 + 16);
              [v8 machAbsTimeSeconds];
              if (v18 - v19 > 0.0) {
                break;
              }
            }
          }

          char v21 = 0;
          v9[2](v9, v16, &v21);
          if (v21) {
            break;
          }
        }

        if (v13 == ++v15)
        {
          uint64_t v20 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
          uint64_t v13 = v20;
          if (v20) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAMountStatus";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSMutableArray count](self->_snapshots, "count") + 20;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAMountStatus sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v11 = *__error();
    _sa_logt();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[SAMountStatus debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v36 = [v13 UTF8String];
      __int16 v37 = 2048;
      unint64_t v38 = -[SAMountStatus sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v39 = 2048;
      unint64_t v40 = a4;
      _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v11;
    id v14 = -[SAMountStatus debugDescription](self, "debugDescription");
    char v15 = [v14 UTF8String];
    -[SAMountStatus sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(595, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
LABEL_7:
    int v22 = *__error();
    _sa_logt();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = -[SAMountStatus debugDescription](self, "debugDescription");
      uint64_t v25 = [v24 UTF8String];
      uint64_t v26 = -[NSMutableArray count](self->_snapshots, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = v25;
      __int16 v37 = 2048;
      unint64_t v38 = v26;
      _os_log_error_impl(&dword_186C92000, v23, OS_LOG_TYPE_ERROR, "%s: %lu snapshot", buf, 0x16u);
    }

    *__error() = v22;
    id v27 = -[SAMountStatus debugDescription](self, "debugDescription");
    char v28 = [v27 UTF8String];
    -[NSMutableArray count](self->_snapshots, "count");
    _SASetCrashLogMessage(603, "%s: %lu snapshot", v29, v30, v31, v32, v33, v34, v28);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var2 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_path, v8);
  *(unint64_t *)((char *)&a3->var3 + 4) = SASerializableIndexForPointerFromSerializationDictionary( self->_type,  v8);
  unsigned __int16 v9 = -[NSMutableArray count](self->_snapshots, "count");
  a3->var2 = v9;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances( (char *)&a3->var4 + 4,  v9,  self->_snapshots,  v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = self->_snapshots;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
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
        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v9);
    }

    -[NSString addSelfToSerializationDictionary:](self->_path, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_type, "addSelfToSerializationDictionary:", v4);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x13)
  {
    int v7 = *__error();
    _sa_logt();
    v5 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 20LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatus struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(631, "bufferLength %lu < serialized SAMountStatus struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  v5 = (unsigned __int16 *)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 20 > a4)
  {
LABEL_8:
    int v14 = *__error();
    _sa_logt();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = v5[1];
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatus struct with %u snapshots",  buf,  0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage( 632,  "bufferLength %lu < serialized SAMountStatus struct with %u snapshots",  v17,  v18,  v19,  v20,  v21,  v22,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAMountStatus version",  0LL);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }

  return objc_alloc_init(&OBJC_CLASS___SAMountStatus);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v53 = a5;
  id v10 = a6;
  if (a4 <= 0x13)
  {
    int v24 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v55 = a4;
      __int16 v56 = 2048;
      uint64_t v57 = 20LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatus struct %lu",  buf,  0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage( 644,  "bufferLength %lu < serialized SAMountStatus struct %lu",  v25,  v26,  v27,  v28,  v29,  v30,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_9;
  }

  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 20 > a4)
  {
LABEL_9:
    int v31 = *__error();
    _sa_logt();
    self = (SAMountStatus *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_ERROR))
    {
      int v32 = *((unsigned __int16 *)a3 + 1);
      *(_DWORD *)buf = 134218240;
      unint64_t v55 = a4;
      __int16 v56 = 1024;
      LODWORD(v57) = v32;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)self,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatus struct with %u snapshots",  buf,  0x12u);
    }

    *__error() = v31;
    _SASetCrashLogMessage( 645,  "bufferLength %lu < serialized SAMountStatus struct with %u snapshots",  v33,  v34,  v35,  v36,  v37,  v38,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 4);
  uint64_t v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v53, v11, v13);
  int v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  self->_path = v14;

  unint64_t v16 = *(void *)((char *)a3 + 12);
  uint64_t v17 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v53, v11, v17);
  uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v18;

  uint64_t v20 = *((unsigned __int16 *)a3 + 1);
  if (v20 == 0xFFFF)
  {
LABEL_12:
    int v39 = *__error();
    _sa_logt();
    unint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = -[SAMountStatus debugDescription](self, "debugDescription");
      uint64_t v42 = [v41 UTF8String];
      int v43 = *((unsigned __int16 *)a3 + 1);
      *(_DWORD *)buf = 136315394;
      unint64_t v55 = v42;
      __int16 v56 = 1024;
      LODWORD(v57) = v43;
      _os_log_error_impl(&dword_186C92000, v40, OS_LOG_TYPE_ERROR, "%s: %u snapshots", buf, 0x12u);
    }

    *__error() = v39;
    id v44 = -[SAMountStatus debugDescription](self, "debugDescription");
    char v45 = [v44 UTF8String];
    _SASetCrashLogMessage(650, "%s: %u snapshots", v46, v47, v48, v49, v50, v51, v45);

    _os_crash();
    __break(1u);
LABEL_15:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAMountStatus version",  0LL);
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v52);
  }

  uint64_t v21 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 20, v20, v53, v11, v21);
  uint64_t v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  snapshots = self->_snapshots;
  self->_snapshots = v22;
}

- (void)populateReferencesUsingPAStyleSerializedMountStatus:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    unint64_t v9 = *(void *)(a2 + 8);
    id v10 = (void *)objc_opt_class();
    uint64_t v11 = SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v9, v7, v8, v10);
    unint64_t v12 = (void *)a1[2];
    a1[2] = v11;

    unint64_t v13 = *(void *)(a2 + 16);
    int v14 = (void *)objc_opt_class();
    uint64_t v15 = SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v7, v8, v14);
    unint64_t v16 = (void *)a1[3];
    a1[3] = v15;

    uint64_t v17 = *(unsigned int *)(a2 + 24);
    uint64_t v18 = (void *)objc_opt_class();
    SASerializableNewMutableArrayFromIndexList(a2 + 28, v17, v7, v8, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:*(unsigned int *)(a2 + 24)];
    uint64_t v21 = (void *)a1[1];
    a1[1] = v20;

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v22 = v19;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = *(void *)v32;
      do
      {
        uint64_t v27 = 0LL;
        do
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v22);
          }
          id Property = *(id *)(*((void *)&v31 + 1) + 8 * v27);
          uint64_t v29 = (void *)a1[1];
          if (Property) {
            id Property = objc_getProperty(Property, v24, 8LL, 1);
          }
          id v30 = Property;
          objc_msgSend(v29, "addObject:", v30, (void)v31);

          ++v27;
        }

        while (v25 != v27);
        uint64_t v25 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v25);
    }
  }
}

@end