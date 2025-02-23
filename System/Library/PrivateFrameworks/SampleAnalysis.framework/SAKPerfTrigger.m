@interface SAKPerfTrigger
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)kperfSamplers;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)timerPeriodNs;
- (unint64_t)type;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAKPerfTrigger

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)timerPeriodNs
{
  return self->_timerPeriodNs;
}

- (unint64_t)kperfSamplers
{
  return self->_kperfSamplers;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v7 = a3;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_type];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)@"type", v4);

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_kperfSamplers];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v7, @"samplers", v5);

  if (self->_timerPeriodNs)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, @"timerPeriodNs", v6);
  }
}

+ (id)classDictionaryKey
{
  return @"SAKPerfTrigger";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 26LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAKPerfTrigger sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v10 = *__error();
    _sa_logt();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = -[SAKPerfTrigger debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = -[SAKPerfTrigger sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_186C92000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v10;
    id v13 = -[SAKPerfTrigger debugDescription](self, "debugDescription");
    char v14 = [v13 UTF8String];
    -[SAKPerfTrigger sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(4591, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var1 + 1) = self->_type;
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_timerPeriodNs;
  *(unint64_t *)((char *)&a3->var3 + 2) = self->_kperfSamplers;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v5 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v5, self, v4);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x19)
  {
    int v7 = *__error();
    _sa_logt();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 26LL;
      _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAKPerfTrigger struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage( 4616,  "bufferLength %lu < serialized SAKPerfTrigger struct %lu",  v9,  v10,  v11,  v12,  v13,  v14,  a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAKPerfTrigger version",  0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  id result = objc_alloc_init(&OBJC_CLASS___SAKPerfTrigger);
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)((char *)a3 + 2);
  *((void *)result + 3) = *(void *)((char *)a3 + 18);
  return result;
}

@end