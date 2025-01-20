@interface SAPAStyleSymbol
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSymbol

+ (id)classDictionaryKey
{
  return @"PASymbol";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSymbol",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleSymbol addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSymbol",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleSymbol sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleSymbol newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (*(void *)a3 >> 1 == 1278945817LL)
  {
    id result = objc_alloc_init(&OBJC_CLASS___SAPAStyleSymbol);
    *((void *)result + 3) = *((void *)a3 + 3);
    *((void *)result + 2) = *((void *)a3 + 4);
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Bad PASymbol magic",  0LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
    -[SAPAStyleSymbol populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v7,  v8,  v9,  v10,  v11,  v12);
  }

  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v22 = a5;
  id v9 = a6;
  if (*(void *)a3 >> 1 == 1278945817LL)
  {
    unint64_t v10 = v9;
    unint64_t v11 = *((void *)a3 + 1);
    id v12 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v11, v22, v10, v12, 0);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v13;

    if (*(void *)a3 > 0x98765432uLL)
    {
      uint64_t v15 = *((void *)a3 + 5);
      if (v15)
      {
        v16 = (void *)objc_opt_class();
        SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 48, v15, v22, v10, v16);
        v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
        sourceInfos = self->_sourceInfos;
        self->_sourceInfos = v17;
      }
    }
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Bad PASymbol magic",  0LL);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
    -[SAPAStyleSymbol .cxx_destruct](v20, v21);
  }

- (void).cxx_destruct
{
}

@end