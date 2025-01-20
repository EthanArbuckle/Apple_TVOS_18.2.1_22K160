@interface SAPAStyleTaskPrivateData
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
@end

@implementation SAPAStyleTaskPrivateData

+ (id)classDictionaryKey
{
  return @"PASampleTaskDataPrivateData";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleTaskPrivateData",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleTaskPrivateData addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleTaskPrivateData",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleTaskPrivateData sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleTaskPrivateData newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    v11 = @"NULL serializedTaskPrivateData";
LABEL_12:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v11,  0LL);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
    return (id)__90__SAPAStyleTaskPrivateData_newInstanceWithoutReferencesFromSerializedBuffer_bufferLength___block_invoke();
  }

  if ((unint64_t)(*(void *)a3 - 2255827088LL) >= 3)
  {
    v11 = @"Bad SAPAStyleTaskPrivateData magic";
    goto LABEL_12;
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___SAPAStyleTaskPrivateData);
  unint64_t v6 = v5;
  if (*(void *)a3 <= 0x86753090uLL)
  {
    if (newInstanceWithoutReferencesFromSerializedBuffer_bufferLength__onceToken != -1) {
      dispatch_once( &newInstanceWithoutReferencesFromSerializedBuffer_bufferLength__onceToken,  &__block_literal_global_4);
    }
    v6->_suspend_count = *((_DWORD *)a3 + 2);
    unint64_t v7 = *MEMORY[0x1895FD590] * *((int *)a3 + 3);
    v6->_faults = *((_DWORD *)a3 + 4);
    v6->_pageins = *((_DWORD *)a3 + 5);
    v6->_cow_faults = *((_DWORD *)a3 + 6);
    unint64_t v8 = *((unsigned int *)a3 + 7);
    unsigned int v9 = *((_DWORD *)a3 + 8);
    v6->_task_size_bytes = v7;
    v6->_ss_flags = v8;
    v6->_latency_qos = v9;
  }

  else
  {
    v5->_suspend_count = *((_DWORD *)a3 + 6);
    v5->_task_size_bytes = *((void *)a3 + 1);
    v5->_faults = *((_DWORD *)a3 + 7);
    v5->_pageins = *((_DWORD *)a3 + 8);
    v5->_cow_faults = *((_DWORD *)a3 + 9);
    v5->_ss_flags = *((void *)a3 + 2);
    v5->_latency_qos = *((_DWORD *)a3 + 10);
    if (*(void *)a3 > 0x86753091uLL)
    {
      v5->_terminatedThreadsUserTimeInNs = *(void *)((char *)a3 + 44);
      v5->_terminatedThreadsSystemTimeInNs = *(void *)((char *)a3 + 52);
      v5->_terminatedThreadsInstructions = *(void *)((char *)a3 + 60);
      v5->_terminatedThreadsCycles = *(void *)((char *)a3 + 68);
    }
  }

  return v6;
}

uint64_t __90__SAPAStyleTaskPrivateData_newInstanceWithoutReferencesFromSerializedBuffer_bufferLength___block_invoke()
{
  return fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Warning: Assuming page size is %lu bytes for task size\n",  *MEMORY[0x1895FD590]);
}

@end