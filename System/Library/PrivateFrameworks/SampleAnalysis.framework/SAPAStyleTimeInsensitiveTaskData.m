@interface SAPAStyleTimeInsensitiveTaskData
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleTimeInsensitiveTaskData

+ (id)classDictionaryKey
{
  return @"PASampleTimeInsensitiveTaskData";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleTimeInsensitiveTaskData",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleTimeInsensitiveTaskData addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleTimeInsensitiveTaskData",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleTimeInsensitiveTaskData sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleTimeInsensitiveTaskData newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (a3)
  {
    if ((unint64_t)(*(void *)a3 - 4080925381LL) < 3)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___SAPAStyleTimeInsensitiveTaskData);
      uint64_t v6 = +[SATask taskWithoutReferencesFromPAStyleSerializedTask:]((uint64_t)&OBJC_CLASS___SATask, (uint64_t)a3);
      task = v5->_task;
      v5->_task = (SATask *)v6;

      return v5;
    }

    id v9 = @"Bad SAPAStyleTimeInsensitiveTaskData magic";
  }

  else
  {
    id v9 = @"Trying to init with nil serializedTimeInsensitiveTask_v5";
  }

  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v9,  0LL);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
  -[SAPAStyleTimeInsensitiveTaskData populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v11,  v12,  v13,  v14,  v15,  v16);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v14 = a5;
  id v9 = a6;
  if (v14 && v9)
  {
    if (a3)
    {
      if ((unint64_t)(*(void *)a3 - 4080925381LL) < 3)
      {
        -[SATask populateReferencesUsingPAStyleSerializedTask:andDeserializationDictionary:andDataBufferDictionary:]( &self->_task->super.isa,  a3,  v14,  v9);

        return;
      }

      id v10 = @"Bad SAPAStyleTimeInsensitiveTaskData magic";
    }

    else
    {
      id v10 = @"Passed NULL serializedTimeInsensitiveTask_v5";
    }
  }

  else
  {
    id v10 = @"Invalid args";
  }

  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v10,  0LL);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v11);
  -[SAPAStyleTimeInsensitiveTaskData .cxx_destruct](v12, v13);
}

- (void).cxx_destruct
{
}

@end