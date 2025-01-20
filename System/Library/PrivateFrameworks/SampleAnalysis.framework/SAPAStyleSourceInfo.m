@interface SAPAStyleSourceInfo
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSourceInfo

+ (id)classDictionaryKey
{
  return @"PASymbolSourceInfo";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSourceInfo",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleSourceInfo addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSourceInfo",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleSourceInfo sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleSourceInfo newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (*(void *)a3 == 1126258297LL)
  {
    id result = objc_alloc_init(&OBJC_CLASS___SAPAStyleSourceInfo);
    *((void *)result + 2) = *((void *)a3 + 1);
    *((void *)result + 3) = *((void *)a3 + 2);
    *((_DWORD *)result + 2) = *((_DWORD *)a3 + 8);
    *((_DWORD *)result + 3) = *((_DWORD *)a3 + 9);
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Bad PASymbolSourceInfo magic",  0LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
    -[SAPAStyleSourceInfo populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v7,  v8,  v9,  v10,  v11,  v12);
  }

  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v18 = a5;
  id v9 = a6;
  if (*(void *)a3 == 1126258297LL)
  {
    unint64_t v10 = v9;
    unint64_t v11 = *((void *)a3 + 3);
    id v12 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v11, v18, v10, v12, 0);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    filePath = self->_filePath;
    self->_filePath = v13;
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Bad PASymbolSourceInfo magic",  0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
    -[SAPAStyleSourceInfo .cxx_destruct](v16, v17);
  }

- (void).cxx_destruct
{
}

@end