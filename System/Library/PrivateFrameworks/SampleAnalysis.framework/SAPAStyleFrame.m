@interface SAPAStyleFrame
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleFrame

+ (id)classDictionaryKey
{
  return @"PASampleFrame";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleFrame",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleFrame addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleFrame",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleFrame sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleFrame newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (a3)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___SAPAStyleFrame);
    uint64_t v6 = +[SAFrame frameWithPAStyleSerializedFrame:]((uint64_t)&OBJC_CLASS___SAFrame, (uint64_t)a3);
    frame = v5->_frame;
    v5->_frame = (SAFrame *)v6;

    return v5;
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Passed in NULL buffer",  0LL);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
    -[SAPAStyleFrame populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v10,  v11,  v12,  v13,  v14,  v15);
  }

  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v15 = a5;
  id v9 = a6;
  if (a3)
  {
    if (*(void *)a3 == 826366246LL)
    {
      v10 = v9;
      -[SAFrame populateReferencesUsingPAStyleSerializedFrame:andDeserializationDictionary:andDataBufferDictionary:]( (uint64_t)self->_frame,  (uint64_t)a3,  v15,  v9);

      return;
    }

    SEL v11 = @"Bad PASampleFrame magic";
  }

  else
  {
    SEL v11 = @"Passed NULL buffer";
  }

  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v11,  0LL);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
  -[SAPAStyleFrame .cxx_destruct](v13, v14);
}

- (void).cxx_destruct
{
}

@end