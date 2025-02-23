@interface SAMountStatusTracker
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (SAMountStatusTracker)init;
- (uint64_t)hasUnresponsiveMountsForThreadID:(uint64_t)result;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addMountStatus:(void *)a3 forTimestamp:;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)enumerateMountsBlockingThread:(void *)a3 betweenStartTime:(void *)a4 endTime:(void *)a5 block:;
- (void)enumerateUnresponsiveMountsBetweenStartTime:(void *)a3 endTime:(void *)a4 block:;
- (void)fillInThreadsSeen;
- (void)iterateAllTimestamps:(uint64_t)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedMountStatusTracker:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
@end

@implementation SAMountStatusTracker

- (SAMountStatusTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SAMountStatusTracker;
  v2 = -[SAMountStatusTracker init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    mountStatusDict = v2->_mountStatusDict;
    v2->_mountStatusDict = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    threadsSeen = v2->_threadsSeen;
    v2->_threadsSeen = v5;
  }

  return v2;
}

- (void)addMountStatus:(void *)a3 forTimestamp:
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v59 = a3;
  if (a1)
  {
    uint64_t v6 = *a2;
    if (*a2)
    {
      uint64_t v7 = 0LL;
      *(void *)&__int128 v5 = 134218754LL;
      __int128 v55 = v5;
      objc_super v8 = a2;
      v58 = a2;
      while (1)
      {
        unint64_t v9 = *(int *)(*(void *)v6 + 52LL) + ((unint64_t)*(unsigned int *)(*(void *)v6 + 48LL) << 32);
        v62 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:v9];
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 16), "objectForKey:");
        v11 = (void *)a2[v7];
        if (v10) {
          break;
        }
        SANSStringForCString((void *)(*v11 + 88LL));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        SANSStringForCString((void *)(*(void *)*v8 + 72LL));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16) {
          BOOL v19 = v17 == 0LL;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          uint64_t v61 = v7;
          uint64_t v21 = *(void *)(*v8 + 8LL);
          if (*(_DWORD *)(v21 + 516) || *(_DWORD *)(v21 + 520))
          {
            int v22 = *__error();
            _sa_logt();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v52 = *(void *)(*v8 + 8LL);
              uint64_t v53 = *(void *)*v8 + 88LL;
              int v54 = *(_DWORD *)(v52 + 516);
              LODWORD(v52) = *(_DWORD *)(v52 + 520);
              *(_DWORD *)v63 = v55;
              *(void *)&v63[4] = v9;
              *(_WORD *)&v63[12] = 2080;
              *(void *)&v63[14] = v53;
              __int16 v64 = 1024;
              int v65 = v54;
              __int16 v66 = 1024;
              int v67 = v52;
              _os_log_debug_impl( &dword_186C92000,  v23,  OS_LOG_TYPE_DEBUG,  "New mount 0x%llx %s unresponsive for %d seconds, blocking %d threads",  v63,  0x22u);
            }

            *__error() = v22;
          }

          v24 = objc_alloc(&OBJC_CLASS___SAMountStatus);
          id v25 = v16;
          id v26 = v18;
          if (v24)
          {
            *(void *)v63 = v24;
            *(void *)&v63[8] = &OBJC_CLASS___SAMountStatus;
            id v12 = objc_msgSendSuper2((objc_super *)v63, sel_init);
            a2 = v58;
            if (v12)
            {
              uint64_t v27 = [v25 copy];
              v28 = (void *)*((void *)v12 + 2);
              *((void *)v12 + 2) = v27;

              objc_storeStrong((id *)v12 + 3, v18);
              id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
              v30 = (void *)*((void *)v12 + 1);
              *((void *)v12 + 1) = v29;
            }
          }

          else
          {
            id v12 = 0LL;
            a2 = v58;
          }

          [*(id *)(a1 + 16) setObject:v12 forKey:v62];
          if (v12)
          {
LABEL_25:
            uint64_t v31 = *(void *)(*v8 + 8LL);
            id v60 = v12;
            v32 = (void *)*((void *)v12 + 1);
            id v33 = v59;
            v34 = objc_alloc(&OBJC_CLASS___SAMountSnapshot);
            id v35 = v33;
            if (v34 && v31)
            {
              *(void *)v63 = v34;
              *(void *)&v63[8] = &OBJC_CLASS___SAMountSnapshot;
              v36 = (id *)objc_msgSendSuper2((objc_super *)v63, sel_init);
              v37 = (double *)v36;
              if (v36)
              {
                v57 = v32;
                objc_storeStrong(v36 + 1, a3);
                [v35 machAbsTimeSeconds];
                LODWORD(v38) = *(_DWORD *)(v31 + 516);
                v37[2] = v39 - (double)v38;
                id v40 = objc_alloc_init(MEMORY[0x189603FA8]);
                if (*(_DWORD *)(v31 + 520))
                {
                  unint64_t v41 = 0LL;
                  do
                  {
                    v42 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:*(void *)(v31 + 528 + 8 * v41)];
                    if (([v40 containsObject:v42] & 1) == 0) {
                      [v40 addObject:v42];
                    }

                    ++v41;
                  }

                  while (v41 < *(unsigned int *)(v31 + 520));
                }

                v43 = (void *)*((void *)v37 + 3);
                *((void *)v37 + 3) = v40;

                v32 = v57;
                a2 = v58;
              }

              v34 = v37;
              v44 = v34;
            }

            else
            {
              v44 = 0LL;
            }

            [v32 addObject:v44];
          }

          else
          {
            id v60 = 0LL;
          }

          uint64_t v45 = *(void *)(*v8 + 8LL);
          v20 = v60;
          if (*(_DWORD *)(v45 + 520))
          {
            unint64_t v46 = 0LL;
            do
            {
              v47 = *(void **)(a1 + 8);
              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", *(void *)(v45 + 8 * v46 + 528), v55);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              [v47 addObject:v48];

              ++v46;
              uint64_t v45 = *(void *)(*v8 + 8LL);
            }

            while (v46 < *(unsigned int *)(v45 + 520));
          }

          uint64_t v7 = v61;
          goto LABEL_41;
        }

        v20 = 0LL;
        a2 = v58;
LABEL_41:

        objc_super v8 = &a2[++v7];
        uint64_t v6 = *v8;
        if (!*v8) {
          goto LABEL_45;
        }
      }

      id v12 = (id)v10;
      uint64_t v61 = v7;
      uint64_t v13 = v11[1];
      if (*(_DWORD *)(v13 + 516) || *(_DWORD *)(v13 + 520))
      {
        int v14 = *__error();
        _sa_logt();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v49 = *(void *)(*v8 + 8LL);
          uint64_t v50 = *(void *)*v8 + 88LL;
          int v51 = *(_DWORD *)(v49 + 516);
          LODWORD(v49) = *(_DWORD *)(v49 + 520);
          *(_DWORD *)v63 = v55;
          *(void *)&v63[4] = v9;
          *(_WORD *)&v63[12] = 2080;
          *(void *)&v63[14] = v50;
          __int16 v64 = 1024;
          int v65 = v51;
          __int16 v66 = 1024;
          int v67 = v49;
          _os_log_debug_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_DEBUG,  "Existing mount 0x%llx %s unresponsive for %d seconds, blocking %d threads",  v63,  0x22u);
        }

        *__error() = v14;
      }

      goto LABEL_25;
    }
  }

- (uint64_t)hasUnresponsiveMountsForThreadID:(uint64_t)result
{
  if (result)
  {
    v2 = *(void **)(result + 8);
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v2 containsObject:v3];

    return v4;
  }

  return result;
}

- (void)enumerateMountsBlockingThread:(void *)a3 betweenStartTime:(void *)a4 endTime:(void *)a5 block:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    [*(id *)(a1 + 16) allKeys];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 sortedArrayUsingComparator:&__block_literal_global_12];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000LL;
    char v33 = 0;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v27;
LABEL_4:
      uint64_t v16 = 0LL;
      while (1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(a1 + 16) objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * v16)];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1895F87A8];
        v21[1] = 3221225472LL;
        v21[2] = __85__SAMountStatusTracker_enumerateMountsBlockingThread_betweenStartTime_endTime_block___block_invoke_2;
        v21[3] = &unk_189F64558;
        uint64_t v25 = a2;
        id v23 = v11;
        id v18 = v17;
        id v22 = v18;
        v24 = &v30;
        -[SAMountStatus enumerateSnapshotsBetweenStartTime:endTime:block:]((uint64_t)v18, v9, v10, v21);
        BOOL v19 = *((_BYTE *)v31 + 24) == 0;

        if (!v19) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    _Block_object_dispose(&v30, 8);
  }
}

uint64_t __85__SAMountStatusTracker_enumerateMountsBlockingThread_betweenStartTime_endTime_block___block_invoke( uint64_t a1,  void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __85__SAMountStatusTracker_enumerateMountsBlockingThread_betweenStartTime_endTime_block___block_invoke_2( void *a1,  uint64_t a2,  _BYTE *a3)
{
  if (a2)
  {
    __int128 v5 = *(void **)(a2 + 24);
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a1[7]];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = [v5 containsObject:v6];

    if ((_DWORD)v5)
    {
      id Property = (id)a1[4];
      uint64_t v9 = a1[5];
      if (Property) {
        id Property = objc_getProperty(Property, v7, 16LL, 1);
      }
      id v11 = Property;
      id v12 = (void *)a1[4];
      if (v12) {
        id v13 = objc_getProperty(v12, v10, 24LL, 1);
      }
      else {
        id v13 = 0LL;
      }
      (*(void (**)(uint64_t, id, id, uint64_t))(v9 + 16))(v9, v11, v13, *(void *)(a1[6] + 8LL) + 24LL);

      *a3 = 1;
    }
  }

- (void)enumerateUnresponsiveMountsBetweenStartTime:(void *)a3 endTime:(void *)a4 block:
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v22 = a2;
  id v21 = a3;
  uint64_t v7 = a4;
  if (a1)
  {
    [*(id *)(a1 + 16) allKeys];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 sortedArrayUsingComparator:&__block_literal_global_30];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v36;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(a1 + 16) objectForKeyedSubscript:*(void *)(*((void *)&v35 + 1) + 8 * v12)];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v29 = 0LL;
          uint64_t v30 = &v29;
          uint64_t v31 = 0x3032000000LL;
          uint64_t v32 = __Block_byref_object_copy__5;
          char v33 = __Block_byref_object_dispose__5;
          id v34 = objc_alloc_init(MEMORY[0x189603FA8]);
          uint64_t v25 = 0LL;
          __int128 v26 = &v25;
          uint64_t v27 = 0x2020000000LL;
          char v28 = 0;
          v24[0] = MEMORY[0x1895F87A8];
          v24[1] = 3221225472LL;
          v24[2] = __82__SAMountStatusTracker_enumerateUnresponsiveMountsBetweenStartTime_endTime_block___block_invoke_31;
          v24[3] = &unk_189F645A0;
          v24[4] = &v25;
          v24[5] = &v29;
          -[SAMountStatus enumerateSnapshotsBetweenStartTime:endTime:block:]((uint64_t)v13, v22, v21, v24);
          if (*((_BYTE *)v26 + 24))
          {
            char v23 = 0;
            if (v13)
            {
              id v15 = objc_getProperty(v13, v14, 16LL, 1);
              id Property = objc_getProperty(v13, v16, 24LL, 1);
            }

            else
            {
              id v15 = 0LL;
              id Property = 0LL;
            }

            id v18 = Property;
            v7[2](v7, v15, v18, v30[5], &v23);

            if (v23)
            {
              _Block_object_dispose(&v25, 8);
              _Block_object_dispose(&v29, 8);

              goto LABEL_17;
            }
          }

          _Block_object_dispose(&v25, 8);
          _Block_object_dispose(&v29, 8);

          ++v12;
        }

        while (v10 != v12);
        uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        uint64_t v10 = v19;
      }

      while (v19);
    }

uint64_t __82__SAMountStatusTracker_enumerateUnresponsiveMountsBetweenStartTime_endTime_block___block_invoke( uint64_t a1,  void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __82__SAMountStatusTracker_enumerateUnresponsiveMountsBetweenStartTime_endTime_block___block_invoke_31( uint64_t a1,  void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3[3] count])
    {
      double v5 = *((double *)v4 + 2);
      [v4[1] machAbsTimeSeconds];
      if (v5 < v7)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        id v8 = objc_getProperty(v4, v6, 24LL, 1);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            for (uint64_t i = 0LL; i != v10; ++i)
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
              if ((objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "containsObject:",  v13,  (void)v14) & 1) == 0) {
                [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v13];
              }
            }

            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }

          while (v10);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"PASerializedMountStatusTracker";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return (16 * -[NSMutableDictionary count](self->_mountStatusDict, "count")) | 4;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAMountStatusTracker sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v12 = *__error();
    _sa_logt();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = -[SAMountStatusTracker debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v41 = [v14 UTF8String];
      __int16 v42 = 2048;
      unint64_t v43 = -[SAMountStatusTracker sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v44 = 2048;
      unint64_t v45 = a4;
      _os_log_error_impl(&dword_186C92000, v13, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v12;
    id v15 = -[SAMountStatusTracker debugDescription](self, "debugDescription");
    char v16 = [v15 UTF8String];
    -[SAMountStatusTracker sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(471, "%s: size %lu != buffer length %lu", v17, v18, v19, v20, v21, v22, v16);

    _os_crash();
    __break(1u);
LABEL_7:
    int v23 = *__error();
    _sa_logt();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = -[SAMountStatusTracker debugDescription](self, "debugDescription");
      uint64_t v26 = [v25 UTF8String];
      uint64_t v27 = -[NSMutableDictionary count](self->_mountStatusDict, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v41 = v26;
      __int16 v42 = 2048;
      unint64_t v43 = v27;
      _os_log_error_impl(&dword_186C92000, v24, OS_LOG_TYPE_ERROR, "%s: %lu mountStatuDicts", buf, 0x16u);
    }

    *__error() = v23;
    id v28 = -[SAMountStatusTracker debugDescription](self, "debugDescription");
    char v29 = [v28 UTF8String];
    -[NSMutableDictionary count](self->_mountStatusDict, "count");
    _SASetCrashLogMessage(476, "%s: %lu mountStatuDicts", v30, v31, v32, v33, v34, v35, v29);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 257;
  a3->var2 = -[NSMutableDictionary count](self->_mountStatusDict, "count");
  mountStatusDict = self->_mountStatusDict;
  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = __105__SAMountStatusTracker_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke;
  v36[3] = &unk_189F64610;
  __int16 v39 = 0;
  id v37 = v8;
  __int128 v38 = a3 + 1;
  id v10 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mountStatusDict, "enumerateKeysAndObjectsUsingBlock:", v36);

  return 1;
}

void __105__SAMountStatusTracker_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(a1 + 40) + 16 * *(unsigned __int16 *)(a1 + 48)) = [a2 unsignedLongLongValue];
  uint64_t v6 = SASerializableIndexForPointerFromSerializationDictionary(v5, *(void **)(a1 + 32));

  *(void *)(*(void *)(a1 + 40) + 16LL * *(unsigned __int16 *)(a1 + 48) + 8) = v6;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v7 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    mountStatusDict = self->_mountStatusDict;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __72__SAMountStatusTracker_Serialization__addSelfToSerializationDictionary___block_invoke;
    v8[3] = &unk_189F64638;
    id v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mountStatusDict, "enumerateKeysAndObjectsUsingBlock:", v8);
  }
}

uint64_t __72__SAMountStatusTracker_Serialization__addSelfToSerializationDictionary___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  return [a3 addSelfToSerializationDictionary:*(void *)(a1 + 32)];
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a4 <= 3)
  {
    int v7 = *__error();
    _sa_logt();
    BOOL v5 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 4LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatusTracker struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage( 509,  "bufferLength %lu < serialized SAMountStatusTracker struct %lu",  v8,  v9,  v10,  v11,  v12,  v13,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  BOOL v5 = (unsigned __int16 *)a3;
  if (((8LL * *((unsigned __int16 *)a3 + 1)) | 4uLL) > a4)
  {
LABEL_8:
    int v14 = *__error();
    _sa_logt();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v5[1];
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatusTracker struct with %lu mounts",  buf,  0x16u);
    }

    *__error() = v14;
    _SASetCrashLogMessage( 510,  "bufferLength %lu < serialized SAMountStatusTracker struct with %lu mounts",  v17,  v18,  v19,  v20,  v21,  v22,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAMountStatusTracker version",  0LL);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }

  return objc_alloc_init(&OBJC_CLASS___SAMountStatusTracker);
}

- (void)fillInThreadsSeen
{
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  threadsSeen = self->_threadsSeen;
  self->_threadsSeen = v3;

  mountStatusDict = self->_mountStatusDict;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __56__SAMountStatusTracker_Serialization__fillInThreadsSeen__block_invoke;
  v6[3] = &unk_189F64638;
  v6[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mountStatusDict, "enumerateKeysAndObjectsUsingBlock:", v6);
}

void __56__SAMountStatusTracker_Serialization__fillInThreadsSeen__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v20 = a2;
  id Property = a3;
  int v7 = Property;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  if (Property) {
    id Property = objc_getProperty(Property, v6, 8LL, 1);
  }
  id v8 = Property;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(id *)(*((void *)&v25 + 1) + 8 * v13);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        if (v14) {
          id v14 = objc_getProperty(v14, v10, 24LL, 1);
        }
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v22;
          do
          {
            uint64_t v19 = 0LL;
            do
            {
              if (*(void *)v22 != v18) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(*((void *)&v21 + 1) + 8 * v19++)];
            }

            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }

          while (v17);
        }

        ++v13;
      }

      while (v13 != v11);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v11);
  }
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v38 = a5;
  id v10 = a6;
  if (a4 <= 3)
  {
    int v21 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v40 = a4;
      __int16 v41 = 2048;
      uint64_t v42 = 4LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatusTracker struct %lu",  buf,  0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage( 533,  "bufferLength %lu < serialized SAMountStatusTracker struct %lu",  v22,  v23,  v24,  v25,  v26,  v27,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }

  if (((8LL * *((unsigned __int16 *)a3 + 1)) | 4uLL) > a4)
  {
LABEL_11:
    int v28 = *__error();
    _sa_logt();
    char v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *((unsigned __int16 *)a3 + 1);
      *(_DWORD *)buf = 134218240;
      unint64_t v40 = a4;
      __int16 v41 = 2048;
      uint64_t v42 = v30;
      _os_log_error_impl( &dword_186C92000,  v29,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAMountStatusTracker struct with %lu mounts",  buf,  0x16u);
    }

    *__error() = v28;
    _SASetCrashLogMessage( 534,  "bufferLength %lu < serialized SAMountStatusTracker struct with %lu mounts",  v31,  v32,  v33,  v34,  v35,  v36,  a4);
    _os_crash();
    __break(1u);
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAMountStatusTracker version",  0LL);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }

  uint64_t v11 = v10;
  uint64_t v12 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:*((unsigned __int16 *)a3 + 1)];
  mountStatusDict = self->_mountStatusDict;
  self->_mountStatusDict = v12;

  if (*((_WORD *)a3 + 1))
  {
    unint64_t v14 = 0LL;
    id v15 = (unint64_t *)((char *)a3 + 12);
    do
    {
      unint64_t v16 = *v15;
      uint64_t v17 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v16,  v38,  v11,  v17,  0);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = self->_mountStatusDict;
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(v15 - 1)];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

      ++v14;
      v15 += 2;
    }

    while (v14 < *((unsigned __int16 *)a3 + 1));
  }

  -[SAMountStatusTracker fillInThreadsSeen](self, "fillInThreadsSeen");
}

- (void)populateReferencesUsingPAStyleSerializedMountStatusTracker:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v33 = a3;
  id v7 = a4;
  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) >= 0xFFFFu)
    {
      int v20 = *__error();
      _sa_logt();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = [a1 debugDescription];
        uint64_t v23 = [v22 UTF8String];
        int v24 = *(_DWORD *)(a2 + 8);
        *(_DWORD *)buf = 136315394;
        uint64_t v35 = v23;
        __int16 v36 = 1024;
        int v37 = v24;
        _os_log_error_impl(&dword_186C92000, v21, OS_LOG_TYPE_ERROR, "%s: %u mounts", buf, 0x12u);
      }

      *__error() = v20;
      id v25 = [a1 debugDescription];
      char v26 = [v25 UTF8String];
      _SASetCrashLogMessage(547, "%s: %u mounts", v27, v28, v29, v30, v31, v32, v26);

      _os_crash();
      __break(1u);
    }

    uint64_t v8 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:*(unsigned int *)(a2 + 8)];
    uint64_t v9 = (void *)a1[2];
    a1[2] = v8;

    if (*(_DWORD *)(a2 + 8))
    {
      unsigned __int16 v10 = 0;
      do
      {
        uint64_t v11 = (void *)(a2 + 12 + 16LL * v10);
        unint64_t v12 = v11[1];
        uint64_t v13 = (void *)objc_opt_class();
        _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v12,  v33,  v7,  v13,  0);
        id Property = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v16 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v15, 8LL, 1);
        }
        id v17 = Property;
        uint64_t v18 = (void *)a1[2];
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*v11];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 setObject:v17 forKeyedSubscript:v19];

        ++v10;
      }

      while (*(_DWORD *)(a2 + 8) > v10);
    }

    [a1 fillInThreadsSeen];
  }
}

- (void)iterateAllTimestamps:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 16);
    v6[1] = 3221225472LL;
    v6[2] = __60__SAMountStatusTracker_Serialization__iterateAllTimestamps___block_invoke;
    v6[3] = &unk_189F64660;
    id v5 = v3;
    v6[0] = MEMORY[0x1895F87A8];
    id v7 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v6];

    id v3 = v5;
  }
}

void __60__SAMountStatusTracker_Serialization__iterateAllTimestamps___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id Property = a3;
  uint64_t v8 = Property;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  if (Property) {
    id Property = objc_getProperty(Property, v7, 8LL, 1);
  }
  id v9 = Property;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        uint64_t v16 = *(void *)(a1 + 32);
        if (v15) {
          id v17 = objc_getProperty(v15, v11, 8LL, 1);
        }
        else {
          id v17 = 0LL;
        }
        (*(void (**)(uint64_t, id))(v16 + 16))(v16, v17);
        ++v14;
      }

      while (v12 != v14);
      uint64_t v18 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v12 = v18;
    }

    while (v18);
  }
}

@end