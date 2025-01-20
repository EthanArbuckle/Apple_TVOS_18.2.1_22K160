@interface SAPAStyleSample
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSample

+ (id)classDictionaryKey
{
  return @"PASample";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSample",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleSample addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSample",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleSample sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleSample newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (a3)
  {
    if (*(void *)a3 == 2171757396LL)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___SAPAStyleSample);
      if (v5)
      {
        unint64_t v6 = v5;
        uint64_t v7 = +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  *((double *)a3 + 1),  0.0,  *((double *)a3 + 2));
        timestamp = v6->_timestamp;
        v6->_timestamp = (SATimestamp *)v7;

        return v6;
      }

      v10 = @"Could not create new sample from buffer";
    }

    else
    {
      v10 = @"Bad SASample magic";
    }
  }

  else
  {
    v10 = @"NULL buffer";
  }

  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v10,  0LL);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v11);
  -[SAPAStyleSample populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v12,  v13,  v14,  v15,  v16,  v17);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  id v10 = a6;
  if (!a3)
  {
    v31 = @"Passed NULL buffer";
    goto LABEL_24;
  }

  if (*(void *)a3 != 2171757396LL)
  {
    v31 = @"Bad SASample magic";
LABEL_24:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v31,  0LL);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }

  id v11 = v10;
  v12 = (char *)a3 + 32;
  uint64_t v13 = *((void *)a3 + 3);
  v14 = (void *)objc_opt_class();
  v33 = v9;
  SASerializableNewMutableArrayFromIndexList((uint64_t)v12, v13, v9, v11, v14);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v39;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v38 + 1) + 8 * v20);
        if (v21)
        {
          id Property = objc_getProperty(*(id *)(*((void *)&v38 + 1) + 8 * v20), v17, 8LL, 1);
          -[SATaskState applyPAStyleSampleTimestamp:]((uint64_t)Property, self->_timestamp);
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          id v24 = objc_getProperty(v21, v23, 16LL, 1);
        }

        else
        {

          id v24 = 0LL;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
        }

        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v35;
          do
          {
            for (uint64_t i = 0LL; i != v27; ++i)
            {
              if (*(void *)v35 != v28) {
                objc_enumerationMutation(v25);
              }
              -[SAThreadState applyPAStyleSampleTimestamp:]( *(void *)(*((void *)&v34 + 1) + 8 * i),  self->_timestamp);
            }

            uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }

          while (v27);
        }

        ++v20;
      }

      while (v20 != v18);
      uint64_t v30 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
      uint64_t v18 = v30;
    }

    while (v30);
  }
}

- (void).cxx_destruct
{
}

@end