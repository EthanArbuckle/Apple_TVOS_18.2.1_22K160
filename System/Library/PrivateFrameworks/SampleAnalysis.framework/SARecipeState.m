@interface SARecipeState
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)stateWithThread:(uint64_t)a3 threadStateIndex:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (SAThread)thread;
- (SAThreadState)threadState;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)threadStateIndex;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)initWithThread:(uint64_t)a3 threadStateIndex:;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SARecipeState

+ (void)stateWithThread:(uint64_t)a3 threadStateIndex:
{
  id v4 = a2;
  v5 = objc_alloc((Class)objc_opt_self());
  v6 = -[SARecipeState initWithThread:threadStateIndex:](v5, v4, a3);

  return v6;
}

- (void)initWithThread:(uint64_t)a3 threadStateIndex:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___SARecipeState;
    id v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[2] = a3;
    }
  }

  return a1;
}

- (SAThreadState)threadState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectAtIndexedSubscript:self->_threadStateIndex];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAThreadState *)v4;
}

- (SAThread)thread
{
  return (SAThread *)objc_getProperty(self, a2, 8LL, 1);
}

- (unint64_t)threadStateIndex
{
  return self->_threadStateIndex;
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  int v3 = *__error();
  _sa_logt();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    ClassName = object_getClassName(a1);
    _os_log_error_impl( &dword_186C92000,  v4,  OS_LOG_TYPE_ERROR,  "SARecipeState classDictionaryKey not overridden by %s",  buf,  0xCu);
  }

  *__error() = v3;
  char v5 = object_getClassName(a1);
  _SASetCrashLogMessage(5439, "SARecipeState classDictionaryKey not overridden by %s", v6, v7, v8, v9, v10, v11, v5);
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 14LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SARecipeState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v11 = *__error();
    _sa_logt();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[SARecipeState debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v36 = [v13 UTF8String];
      __int16 v37 = 2048;
      unint64_t v38 = -[SARecipeState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v39 = 2048;
      unint64_t v40 = a4;
      _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v11;
    id v14 = -[SARecipeState debugDescription](self, "debugDescription");
    char v15 = [v14 UTF8String];
    -[SARecipeState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5447, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
LABEL_7:
    int v22 = *__error();
    _sa_logt();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = -[SARecipeState debugDescription](self, "debugDescription");
      uint64_t v25 = [v24 UTF8String];
      unint64_t threadStateIndex = self->_threadStateIndex;
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = v25;
      __int16 v37 = 2048;
      unint64_t v38 = threadStateIndex;
      _os_log_error_impl(&dword_186C92000, v23, OS_LOG_TYPE_ERROR, "%s: %lu threadStateIndex", buf, 0x16u);
    }

    *__error() = v22;
    id v27 = -[SARecipeState debugDescription](self, "debugDescription");
    char v28 = [v27 UTF8String];
    _SASetCrashLogMessage(5452, "%s: %lu threadStateIndex", v29, v30, v31, v32, v33, v34, v28);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 257;
  unint64_t v9 = self->_threadStateIndex;
  if (v9 >= 0xFFFFFFFF) {
    goto LABEL_7;
  }
  *(_DWORD *)((char *)&a3->var2 + 2) = v9;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_thread, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5) {
    -[SAThread addSelfToSerializationDictionary:](self->_thread, "addSelfToSerializationDictionary:", v6);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a4 <= 0xD)
  {
    int v7 = *__error();
    _sa_logt();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 14LL;
      _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SARecipeState struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage( 5473,  "bufferLength %lu < serialized SARecipeState struct %lu",  v9,  v10,  v11,  v12,  v13,  v14,  a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SARecipeState version",  0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  id result = objc_alloc_init((Class)objc_opt_class());
  *((void *)result + 2) = *(unsigned int *)((char *)a3 + 10);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v25 = a5;
  id v10 = a6;
  if (a4 <= 0xD)
  {
    int v16 = *__error();
    _sa_logt();
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      uint64_t v29 = 14LL;
      _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SARecipeState struct %lu",  buf,  0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage( 5487,  "bufferLength %lu < serialized SARecipeState struct %lu",  v18,  v19,  v20,  v21,  v22,  v23,  a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SARecipeState version",  0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v25, v11, v13);
  uint64_t v14 = (SAThread *)objc_claimAutoreleasedReturnValue();
  thread = self->_thread;
  self->_thread = v14;
}

@end