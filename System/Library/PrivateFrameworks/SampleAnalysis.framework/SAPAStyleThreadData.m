@interface SAPAStyleThreadData
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleThreadData

+ (id)classDictionaryKey
{
  return @"PASampleThreadData";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleThreadData",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleThreadData addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleThreadData",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleThreadData sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleThreadData newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (a3)
  {
    if ((unint64_t)(*(void *)a3 - 287528979LL) < 7)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___SAPAStyleThreadData);
      uint64_t v6 = +[SAThreadState stateWithoutReferencesFromPAStyleSerializedThread:]( (uint64_t)&OBJC_CLASS___SAThreadState,  (uint64_t)a3);
      threadState = v5->_threadState;
      v5->_threadState = (SAThreadState *)v6;

      unint64_t v8 = *(void *)a3;
      if (*(void *)a3 <= 0x11235818uLL)
      {
        if (*(void *)a3 == 287528984LL)
        {
          v5->_dispatchQueueId = *((void *)a3 + 6);
          v5->_threadId = *((void *)a3 + 5);
          if ((*((_BYTE *)a3 + 99) & 8) == 0) {
            return v5;
          }
        }

        else
        {
          if (v8 <= 0x11235816)
          {
            switch(v8)
            {
              case 0x11235813uLL:
              case 0x11235814uLL:
                v5->_dispatchQueueId = *((void *)a3 + 2);
                v5->_threadId = *((void *)a3 + 7);
                break;
              case 0x11235815uLL:
                v5->_dispatchQueueId = *((void *)a3 + 4);
                v5->_threadId = *((void *)a3 + 3);
                if ((*((_BYTE *)a3 + 80) & 8) != 0) {
                  goto LABEL_11;
                }
                break;
              case 0x11235816uLL:
                v5->_dispatchQueueId = *((void *)a3 + 5);
                v5->_threadId = *((void *)a3 + 4);
                if ((*((_BYTE *)a3 + 88) & 8) != 0) {
                  goto LABEL_11;
                }
                break;
              default:
                return v5;
            }

            return v5;
          }

          v5->_dispatchQueueId = *((void *)a3 + 6);
          v5->_threadId = *((void *)a3 + 5);
          if ((*((_BYTE *)a3 + 96) & 8) == 0) {
            return v5;
          }
        }
      }

      else
      {
        v5->_dispatchQueueId = *((void *)a3 + 6);
        v5->_threadId = *((void *)a3 + 5);
        if ((*((_BYTE *)a3 + 115) & 8) == 0) {
          return v5;
        }
      }

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v15 = a5;
  id v9 = a6;
  if (a3)
  {
    if ((unint64_t)(*(void *)a3 - 287528979LL) < 7)
    {
      v10 = v9;
      -[SAThreadState populateReferencesUsingPAStyleSerializedThread:andDeserializationDictionary:andDataBufferDictionary:]( (uint64_t)self->_threadState,  a3,  v15,  v9);

      return;
    }

    id v11 = @"Bad magic";
  }

  else
  {
    id v11 = @"NULL buffer";
  }

  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v11,  0LL);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
  -[SAPAStyleThreadData .cxx_destruct](v13, v14);
}

- (void).cxx_destruct
{
}

@end