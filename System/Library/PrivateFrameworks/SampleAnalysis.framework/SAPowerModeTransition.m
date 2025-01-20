@interface SAPowerModeTransition
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)lowPowerMode;
- (BOOL)lowPowerModeChanged;
- (NSString)debugDescription;
- (SATimestamp)timestamp;
- (id)initWithLowPowerMode:(void *)a3 timestamp:;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAPowerModeTransition

- (id)initWithLowPowerMode:(void *)a3 timestamp:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___SAPowerModeTransition;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      *((_BYTE *)v7 + 9) = a2;
      *((_BYTE *)v7 + 8) = 1;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

- (NSString)debugDescription
{
  v2 = (void *)NSString;
  if (self->_lowPowerModeChanged)
  {
    if (self->_lowPowerMode) {
      v3 = "low";
    }
    else {
      v3 = "default";
    }
  }

  else
  {
    v3 = "unknown";
  }
  v4 = -[SATimestamp debugDescription](self->_timestamp, "debugDescription");
  [v2 stringWithFormat:@"%s power mode at %@", v3, v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)lowPowerModeChanged
{
  return self->_lowPowerModeChanged;
}

- (BOOL)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v6 = a3;
  if (self->_lowPowerModeChanged)
  {
    [MEMORY[0x189607968] numberWithBool:self->_lowPowerMode];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryFirstEntry(v6, (uint64_t)@"lowPowerMode", v4);

    timestamp = self->_timestamp;
    if (timestamp) {
      SAJSONWriteDictionaryEntry(v6, @"timestamp", timestamp);
    }
  }
}

+ (id)classDictionaryKey
{
  return @"SAPowerModeTransition";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 18LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAPowerModeTransition sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v10 = *__error();
    _sa_logt();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = -[SAPowerModeTransition debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = -[SAPowerModeTransition sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_186C92000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v10;
    id v13 = -[SAPowerModeTransition debugDescription](self, "debugDescription");
    char v14 = [v13 UTF8String];
    -[SAPowerModeTransition sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(75, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 257;
  *(&a3->var1 + 1) = self->_lowPowerMode;
  *(&a3->var1 + 2) = self->_lowPowerModeChanged;
  *($7AC63821ADC89BDA84ADE9684430BA2E *)((char *)&a3->var2 + 2) = ($7AC63821ADC89BDA84ADE9684430BA2E)SASerializableIndexForPointerFromSerializationDictionary(self->_timestamp, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5) {
    -[SATimestamp addSelfToSerializationDictionary:](self->_timestamp, "addSelfToSerializationDictionary:", v6);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x11)
  {
    int v7 = *__error();
    _sa_logt();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 18LL;
      _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAPowerModeTransition struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage( 100,  "bufferLength %lu < serialized SAPowerModeTransition struct %lu",  v9,  v10,  v11,  v12,  v13,  v14,  a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAPowerModeTransition version",  0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  id result = objc_alloc_init(&OBJC_CLASS___SAPowerModeTransition);
  *((_BYTE *)result + 9) = *((_BYTE *)a3 + 2);
  *((_BYTE *)result + 8) = *((_BYTE *)a3 + 3);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v25 = a5;
  id v10 = a6;
  if (a4 <= 0x11)
  {
    int v16 = *__error();
    _sa_logt();
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      uint64_t v29 = 18LL;
      _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAPowerModeTransition struct %lu",  buf,  0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage( 114,  "bufferLength %lu < serialized SAPowerModeTransition struct %lu",  v18,  v19,  v20,  v21,  v22,  v23,  a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAPowerModeTransition version",  0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 10);
  uint64_t v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v25, v11, v13, 0);
  uint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v14;
}

@end