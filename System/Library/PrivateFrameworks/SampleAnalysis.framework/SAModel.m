@interface SAModel
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSArray)executions;
- (NSArray)loadedChanges;
- (NSString)debugDescription;
- (NSString)identifier;
- (SAModel)initWithIdentifier:(id)a3;
- (unint64_t)maxMemoryCostBytes;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addExecution:(id)a3;
- (void)addLoadedChange:(id)a3;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setMaxMemoryCostBytes:(unint64_t)a3;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAModel

- (SAModel)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SAModel;
  v5 = -[SAModel init](&v14, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    loadedChanges = v5->_loadedChanges;
    v5->_loadedChanges = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    executions = v5->_executions;
    v5->_executions = v10;

    v12 = v5;
  }

  return v5;
}

- (NSArray)loadedChanges
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_loadedChanges, "copy");
}

- (NSArray)executions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_executions, "copy");
}

- (void)addExecution:(id)a3
{
}

- (void)addLoadedChange:(id)a3
{
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  -[SAModel identifier](self, "identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v3 initWithFormat:@"Model %@ with %lu load changes, %lu executions", v4, -[NSMutableArray count](self->_loadedChanges, "count"), -[NSMutableArray count](self->_executions, "count")];

  return (NSString *)v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (unint64_t)maxMemoryCostBytes
{
  return self->_maxMemoryCostBytes;
}

- (void)setMaxMemoryCostBytes:(unint64_t)a3
{
  self->_maxMemoryCostBytes = a3;
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v7 = a3;
  SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)@"identifier", self->_identifier);
  if (self->_maxMemoryCostBytes)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, @"maxMemoryCostBytes", v4);
  }

  if (-[NSMutableArray count](self->_loadedChanges, "count"))
  {
    v5 = -[SAModel loadedChanges](self, "loadedChanges");
    SAJSONWriteDictionaryEntry(v7, @"loadedChanges", v5);
  }

  if (-[NSMutableArray count](self->_executions, "count"))
  {
    -[SAModel executions](self, "executions");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, @"executions", v6);
  }
}

+ (id)classDictionaryKey
{
  return @"SAModel";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  uint64_t v3 = -[NSMutableArray count](self->_loadedChanges, "count");
  return 8 * (-[NSMutableArray count](self->_executions, "count") + v3) + 26;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (-[SAModel sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v15 = *__error();
    _sa_logt();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = -[SAModel debugDescription](self, "debugDescription");
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)[v17 UTF8String];
      *(_DWORD *)buf = 136315650;
      v58 = a3;
      __int16 v59 = 2048;
      unint64_t v60 = -[SAModel sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v61 = 2048;
      unint64_t v62 = a4;
      _os_log_error_impl(&dword_186C92000, v16, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v15;
    id v10 = -[SAModel debugDescription](self, "debugDescription");
    id v5 = (id)[v10 UTF8String];
    -[SAModel sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(192, "%s: size %lu != buffer length %lu", v18, v19, v20, v21, v22, v23, (char)v5);

    _os_crash();
    __break(1u);
    goto LABEL_9;
  }

  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_identifier, v9);
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_maxMemoryCostBytes;
  -[SAModel loadedChanges](self, "loadedChanges");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v10 count] >= 0xFFFFFFFF)
  {
LABEL_9:
    int v24 = *__error();
    _sa_logt();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v5 = -[SAModel debugDescription](self, "debugDescription");
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)[v5 UTF8String];
      uint64_t v26 = [v10 count];
      *(_DWORD *)buf = 136315394;
      v58 = a3;
      __int16 v59 = 2048;
      unint64_t v60 = v26;
      _os_log_error_impl(&dword_186C92000, v25, OS_LOG_TYPE_ERROR, "%s has %lu loaded changes", buf, 0x16u);
    }

    *__error() = v24;
    -[SAModel debugDescription](self, "debugDescription");
    self = (SAModel *) objc_claimAutoreleasedReturnValue();
    char v27 = -[SAModel UTF8String](self, "UTF8String");
    [v10 count];
    _SASetCrashLogMessage(201, "%s has %lu loaded changes", v28, v29, v30, v31, v32, v33, v27);

    _os_crash();
    __break(1u);
    goto LABEL_12;
  }

  -[SAModel executions](self, "executions");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v5 count] >= 0xFFFFFFFF)
  {
LABEL_12:
    unint64_t v11 = *__error();
    _sa_logt();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v10 = -[SAModel debugDescription](self, "debugDescription");
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)[v10 UTF8String];
      uint64_t v35 = [v5 count];
      *(_DWORD *)buf = 136315394;
      v58 = a3;
      __int16 v59 = 2048;
      unint64_t v60 = v35;
      _os_log_error_impl(&dword_186C92000, v34, OS_LOG_TYPE_ERROR, "%s has %lu executions", buf, 0x16u);
    }

    *__error() = v11;
    -[SAModel debugDescription](self, "debugDescription");
    self = (SAModel *) objc_claimAutoreleasedReturnValue();
    a4 = -[SAModel UTF8String](self, "UTF8String");
    [v5 count];
    _SASetCrashLogMessage(204, "%s has %lu executions", v36, v37, v38, v39, v40, v41, a4);

    _os_crash();
    __break(1u);
LABEL_15:
    int v56 = *__error();
    _sa_logt();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v55 = -[SAModel debugDescription](self, "debugDescription");
      uint64_t v43 = [v55 UTF8String];
      uint64_t v44 = [v10 count];
      uint64_t v45 = [v5 count];
      uint64_t v46 = [v5 count];
      *(_DWORD *)buf = 136316162;
      v58 = ($F2866A4E0F716C88DFE0077AFF37461B *)v43;
      __int16 v59 = 2048;
      unint64_t v60 = v44;
      __int16 v61 = 2048;
      unint64_t v62 = v45;
      __int16 v63 = 2048;
      uint64_t v64 = v11 + 8 * v46 - (void)a3;
      __int16 v65 = 2048;
      unint64_t v66 = a4;
      _os_log_error_impl( &dword_186C92000,  v42,  OS_LOG_TYPE_ERROR,  "%s: after serializing (with %lu loadedChanges, %lu executions), ended with length %ld, should be %lu",  buf,  0x34u);
    }

    *__error() = v56;
    id v47 = -[SAModel debugDescription](self, "debugDescription");
    char v48 = [v47 UTF8String];
    [v10 count];
    [v5 count];
    [v5 count];
    _SASetCrashLogMessage( 210,  "%s: after serializing (with %lu loadedChanges, %lu executions), ended with length %ld, should be %lu",  v49,  v50,  v51,  v52,  v53,  v54,  v48);

    _os_crash();
    __break(1u);
  }

  unint64_t v11 = (unint64_t)&a3->var4 + 8 * [v10 count] + 2;
  if (v11 + 8 * [v5 count] - (void)a3 != a4) {
    goto LABEL_15;
  }
  unsigned int v12 = [v10 count];
  *(_DWORD *)((char *)&a3->var3 + 2) = v12;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 2, v12, v10, v9);
  unsigned int v13 = [v5 count];
  *(_DWORD *)((char *)&a3->var3 + 6) = v13;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((void *)v11, v13, v5, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[NSString addSelfToSerializationDictionary:](self->_identifier, "addSelfToSerializationDictionary:", v4);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = self->_loadedChanges;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) addSelfToSerializationDictionary:v4];
        }

        while (v9 != v11);
        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
      }

      while (v9);
    }

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    unsigned int v12 = self->_executions;
    uint64_t v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "addSelfToSerializationDictionary:", v4, (void)v17);
        }

        while (v14 != v16);
        uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
      }

      while (v14);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  *(void *)&v28[5] = *MEMORY[0x1895F89C0];
  if (a4 <= 0x19)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      *(void *)uint64_t v28 = 26LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAModel struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(240, "bufferLength %lu < serialized SAModel struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 22) + *(_DWORD *)((char *)a3 + 18)) + 26 > a4)
  {
LABEL_8:
    int v14 = *__error();
    _sa_logt();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(v5 + 18);
      int v17 = *(_DWORD *)(v5 + 22);
      *(_DWORD *)buf = 134218496;
      unint64_t v26 = a4;
      __int16 v27 = 1024;
      *(_DWORD *)uint64_t v28 = v16;
      v28[2] = 1024;
      *(_DWORD *)&v28[3] = v17;
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions",  buf,  0x18u);
    }

    *__error() = v14;
    _SASetCrashLogMessage( 241,  "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions",  v18,  v19,  v20,  v21,  v22,  v23,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAModel version",  0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }

  id result = objc_alloc_init(&OBJC_CLASS___SAModel);
  *((void *)result + 4) = *(void *)(v5 + 10);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v47[5] = *MEMORY[0x1895F89C0];
  id v43 = a5;
  id v10 = a6;
  if (a4 <= 0x19)
  {
    int v25 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v45 = a4;
      __int16 v46 = 2048;
      *(void *)id v47 = 26LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAModel struct %lu",  buf,  0x16u);
    }

    *__error() = v25;
    _SASetCrashLogMessage(254, "bufferLength %lu < serialized SAModel struct %lu", v26, v27, v28, v29, v30, v31, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 22) + *(_DWORD *)((char *)a3 + 18)) + 26 > a4)
  {
LABEL_8:
    int v32 = *__error();
    _sa_logt();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v34 = *(_DWORD *)((char *)a3 + 18);
      int v35 = *(_DWORD *)((char *)a3 + 22);
      *(_DWORD *)buf = 134218496;
      unint64_t v45 = a4;
      __int16 v46 = 1024;
      *(_DWORD *)id v47 = v34;
      v47[2] = 1024;
      *(_DWORD *)&v47[3] = v35;
      _os_log_error_impl( &dword_186C92000,  v33,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions",  buf,  0x18u);
    }

    *__error() = v32;
    _SASetCrashLogMessage( 255,  "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions",  v36,  v37,  v38,  v39,  v40,  v41,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAModel version",  0LL);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v43, v11, v13);
  int v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v14;

  uint64_t v16 = *(unsigned int *)((char *)a3 + 18);
  int v17 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 26, v16, v43, v11, v17);
  uint64_t v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  loadedChanges = self->_loadedChanges;
  self->_loadedChanges = v18;

  uint64_t v20 = (char *)a3 + 8 * *(unsigned int *)((char *)a3 + 18) + 26;
  uint64_t v21 = *(unsigned int *)((char *)a3 + 22);
  uint64_t v22 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)v20, v21, v43, v11, v22);
  uint64_t v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  executions = self->_executions;
  self->_executions = v23;
}

@end