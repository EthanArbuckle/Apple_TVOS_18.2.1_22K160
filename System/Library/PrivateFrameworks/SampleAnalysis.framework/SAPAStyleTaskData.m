@interface SAPAStyleTaskData
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleTaskData

+ (id)classDictionaryKey
{
  return @"PASampleTaskData";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleTaskData",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleTaskData addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleTaskData",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleTaskData sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleTaskData newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (a3)
  {
    if (*(void *)a3 >> 1 == 143727010LL) {
      return objc_alloc_init(&OBJC_CLASS___SAPAStyleTaskData);
    }
    id v5 = @"Bad SAPAStyleTaskData magic";
  }

  else
  {
    id v5 = @"NULL serializedTask_v2";
  }

  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v5,  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleTaskData populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v7,  v8,  v9,  v10,  v11,  v12);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v94 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  id v10 = a6;
  if (!a3 || !v9 || (id v11 = v10) == 0LL)
  {
    v69 = @"Invalid args";
    goto LABEL_80;
  }

  unint64_t v12 = *((void *)a3 + 1);
  if (v12 > 0xFFFFFFFFFFFFFFFDLL || *((void *)a3 + 2) == -2LL)
  {
    v69 = @"Invalid index found";
LABEL_80:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v69,  0LL);
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v70);
    -[SAPAStyleTaskData .cxx_destruct](v71, v72);
    return;
  }

  v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v9, v11, v13, 0);
  selfa = (id)objc_claimAutoreleasedReturnValue();
  if (!selfa)
  {
    v69 = @"Could not get time insensitive instance";
    goto LABEL_80;
  }

  unint64_t v14 = *((void *)a3 + 2);
  v15 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, v9, v11, v15, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(void *)a3 == 287454020LL)
  {
    uint64_t v16 = 32LL;
    goto LABEL_11;
  }

  if (*(void *)a3 != 287454021LL)
  {
    v69 = @"Bad SAPAStyleTaskData magic";
    goto LABEL_80;
  }

  uint64_t v16 = 36LL;
LABEL_11:
  v17 = (char *)a3 + v16;
  uint64_t v18 = *((void *)a3 + 3);
  v19 = (void *)objc_opt_class();
  v75 = v11;
  SASerializableNewMutableArrayFromIndexList((uint64_t)v17, v18, v9, v11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v88 objects:v93 count:16];
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v89;
    do
    {
      for (uint64_t i = 0LL; i != v23; ++i)
      {
        if (*(void *)v89 != v24) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        if (-[SATaskState isPidSuspended](self->_taskState, "isPidSuspended"))
        {
          if (!v26) {
            continue;
          }
        }

        else
        {
          if (-[SATaskState suspendCount](self->_taskState, "suspendCount")) {
            BOOL v28 = v26 == 0LL;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28) {
            continue;
          }
        }

        Property = objc_getProperty(v26, v27, 16LL, 1);
        if (Property) {
          Property[11] |= 0x40u;
        }
      }

      uint64_t v23 = [v20 countByEnumeratingWithState:&v88 objects:v93 count:16];
    }

    while (v23);
  }

  v76 = v9;
  if (*(void *)a3 >= 0x11223345uLL && *((_DWORD *)a3 + 8))
  {
    uint64_t v30 = *((void *)a3 + 3);
    uint64_t v31 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:*((unsigned int *)a3 + 8)];
    if (*((_DWORD *)a3 + 8))
    {
      v32 = self;
      unint64_t v33 = 0LL;
      v34 = &v17[8 * v30];
      v35 = (void *)v31;
      do
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:*(unsigned int *)&v34[4 * v33]];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 addObject:v36];

        ++v33;
      }

      while (v33 < *((unsigned int *)a3 + 8));
      v37 = v35;
      self = v32;
    }

    else
    {
      v37 = (void *)v31;
    }
  }

  else
  {
    v37 = 0LL;
  }

  v38 = (id *)objc_getProperty(selfa, v22, 8LL, 1);
  v74 = v37;
  +[SATaskState stateWithPAStyleTaskPrivateData:donatingUniquePids:]((uint64_t)&OBJC_CLASS___SATaskState, v77, v37);
  v39 = (SATaskState *)objc_claimAutoreleasedReturnValue();
  taskState = self->_taskState;
  self->_taskState = v39;

  if (v38)
  {
    [v38[1] addObject:self->_taskState];
    [v38[1] count];
  }

  v73 = self;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v20, "count"));
  id v42 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  id obj = v20;
  uint64_t v82 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v82)
  {
    unint64_t v43 = 0x189607000uLL;
    uint64_t v81 = *(void *)v85;
    id v83 = v42;
    v79 = v41;
    do
    {
      uint64_t v44 = 0LL;
      do
      {
        if (*(void *)v85 != v81) {
          objc_enumerationMutation(obj);
        }
        v45 = *(void **)(*((void *)&v84 + 1) + 8 * v44);
        [v38 threads];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45) {
          uint64_t v47 = v45[3];
        }
        else {
          uint64_t v47 = 0LL;
        }
        [*(id *)(v43 + 2408) numberWithUnsignedLongLong:v47];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v46 objectForKeyedSubscript:v48];
        v49 = (id *)objc_claimAutoreleasedReturnValue();

        if (!v49)
        {
          if (v45) {
            uint64_t v51 = v45[3];
          }
          else {
            uint64_t v51 = 0LL;
          }
          +[SAThread threadWithId:]((uint64_t)&OBJC_CLASS___SAThread, v51);
          v49 = (id *)objc_claimAutoreleasedReturnValue();
          -[SATask addThread:]((uint64_t)v38, v49);
        }

        if (v45) {
          id v52 = objc_getProperty(v45, v50, 16LL, 1);
        }
        else {
          id v52 = 0LL;
        }
        v53 = (id *)v52;
        [v41 addObject:v53];
        [v49 threadStates];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        [v54 lastObject];
        v55 = (id *)objc_claimAutoreleasedReturnValue();

        BOOL v28 = v55 == v53;
        id v42 = v83;
        if (!v28)
        {
          if (v49)
          {
            [v49[1] addObject:v53];
            uint64_t v56 = [v49[1] count] - 1;
            if (!v45) {
              goto LABEL_60;
            }
          }

          else
          {
            uint64_t v56 = 0LL;
            if (!v45) {
              goto LABEL_60;
            }
          }

          if (v45[4])
          {
            [v38 dispatchQueues];
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            [*(id *)(v43 + 2408) numberWithUnsignedLongLong:v45[4]];
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            [v57 objectForKeyedSubscript:v58];
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v59)
            {
              v59 = +[SADispatchQueue dispatchQueueWithId:]((uint64_t)&OBJC_CLASS___SADispatchQueue, v45[4]);
              -[SATask addDispatchQueue:]((uint64_t)v38, v59);
            }
            v60 = +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)&OBJC_CLASS___SADispatchQueueState, v49, v56);
            if (v59) {
              -[SARecipe addState:hasConcurrentExecution:]((uint64_t)v59, v60, 0LL);
            }
            unint64_t v43 = 0x189607000uLL;
            if (v53) {
              objc_storeWeak(v53 + 14, v59);
            }

            v41 = v79;
            id v42 = v83;
          }
        }

- (void).cxx_destruct
{
}

@end