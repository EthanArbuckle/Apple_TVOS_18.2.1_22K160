@interface SAThread
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)threadWithId:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isGlobalForcedIdle;
- (BOOL)isMainThread;
- (BOOL)isProcessorIdleThread;
- (NSArray)threadStates;
- (NSString)debugDescription;
- (SAThread)initWithId:(unint64_t)a3;
- (SATimestamp)creationTimestamp;
- (SATimestamp)exitTimestamp;
- (id)firstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4;
- (id)firstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4;
- (id)lastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4;
- (id)lastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4;
- (id)patchedStackForTruncatedStack:(id)a3;
- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4;
- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4;
- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4;
- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4;
- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)threadId;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)cpuTimeForThreadStateIndex:(void *)a3@<X2> inTimestampRangeStart:(void *)a4@<X3> end:(void *)a5@<X8>;
- (void)enumerateThreadStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7;
- (void)enumerateThreadStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8;
- (void)forwardFillMonotonicallyIncreasingData;
- (void)insertState:(uint64_t)a3 atIndex:;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAThread

- (SAThread)initWithId:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SAThread;
  v4 = -[SAThread init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_threadId = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    threadStates = v5->_threadStates;
    v5->_threadStates = v6;
  }

  return v5;
}

+ (id)threadWithId:(uint64_t)a1
{
  return (id)[objc_alloc((Class)objc_opt_self()) initWithId:a2];
}

- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6 = a3;
  if (-[NSMutableArray count](self->_threadStates, "count"))
  {
    if (v6)
    {
      threadStates = self->_threadStates;
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __61__SAThread_indexOfFirstThreadStateOnOrAfterTime_sampleIndex___block_invoke;
      v14[3] = &unk_189F63298;
      id v15 = v6;
      unint64_t v8 = SABinarySearchArray(threadStates, 1280, (uint64_t)v14);
    }

    else
    {
      unint64_t v8 = 0LL;
    }

    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v8 < -[NSMutableArray count](self->_threadStates, "count"))
    {
      do
      {
        v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v8);
        if ([v10 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
        }

        else
        {
          v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v8);
          unint64_t v12 = [v11 endSampleIndex];

          if (v12 >= a4) {
            break;
          }
        }

        ++v8;
      }

      while (v8 < -[NSMutableArray count](self->_threadStates, "count"));
    }

    if (v8 >= -[NSMutableArray count](self->_threadStates, "count")) {
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
  }

  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

uint64_t __61__SAThread_indexOfFirstThreadStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  [v3 startTimestamp];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = [v4 lt:v5];

  if ((v4 & 1) != 0)
  {
    uint64_t v6 = -1LL;
  }

  else
  {
    v7 = *(void **)(a1 + 32);
    [v3 endTimestamp];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = [v7 gt:v8];

    uint64_t v6 = v6;
  }

  return v6;
}

- (id)firstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5 = -[SAThread indexOfFirstThreadStateOnOrAfterTime:sampleIndex:]( self,  "indexOfFirstThreadStateOnOrAfterTime:sampleIndex:",  a3,  a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  if (!-[NSMutableArray count](self->_threadStates, "count")) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  threadStates = self->_threadStates;
  if (a3)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __61__SAThread_indexOfLastThreadStateOnOrBeforeTime_sampleIndex___block_invoke;
    v14[3] = &unk_189F63298;
    void v14[4] = a3;
    uint64_t v8 = SABinarySearchArray(threadStates, 1536, (uint64_t)v14);
    if (!v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  else
  {
    uint64_t v8 = -[NSMutableArray count](threadStates, "count");
  }

  unint64_t v9 = v8 - 1;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    return v9;
  }
  while (1)
  {
    v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v9);
    if ([v11 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
    }

    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v9);
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v13 = [v12 startSampleIndex];

      if (v13 <= a4) {
        return v9;
      }
    }

    if (!v9) {
      break;
    }
    --v9;
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __61__SAThread_indexOfLastThreadStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  [a2 startTimestamp];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = [v4 lt:v5];

  v7 = *(void **)(a1 + 32);
  [a2 endTimestamp];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = [v7 gt:v8];

  return v7;
}

- (id)lastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:sampleIndex:]( self,  "indexOfLastThreadStateOnOrBeforeTime:sampleIndex:",  a3,  a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)firstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return -[SAThread firstThreadStateOnOrAfterTime:sampleIndex:]( self,  "firstThreadStateOnOrAfterTime:sampleIndex:",  a3,  v4);
}

- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return -[SAThread indexOfFirstThreadStateOnOrAfterTime:sampleIndex:]( self,  "indexOfFirstThreadStateOnOrAfterTime:sampleIndex:",  a3,  v4);
}

- (id)lastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  unint64_t v5 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:withSampleIndex:]( self,  "indexOfLastThreadStateOnOrBeforeTime:withSampleIndex:",  a3,  a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = -[NSMutableArray lastObject](self->_threadStates, "lastObject");
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4 || (v10 = 0x7FFFFFFFFFFFFFFFLL, uint64_t v9 = [v7 endSampleIndex], v9 != 0x7FFFFFFFFFFFFFFFLL)) {
      unint64_t v10 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:sampleIndex:]( self,  "indexOfLastThreadStateOnOrBeforeTime:sampleIndex:",  v6,  v9);
    }
  }

  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)enumerateThreadStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  unint64_t v16 = -[SAThread indexOfFirstThreadStateOnOrAfterTime:sampleIndex:]( self,  "indexOfFirstThreadStateOnOrAfterTime:sampleIndex:",  a3,  a4);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v17 = v16;
    unint64_t v18 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:sampleIndex:]( self,  "indexOfLastThreadStateOnOrBeforeTime:sampleIndex:",  v14,  a6);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v19 = v18;
      if (v17 <= v18)
      {
        v22[0] = MEMORY[0x1895F87A8];
        v22[1] = 3221225472LL;
        v22[2] = __109__SAThread_enumerateThreadStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
        v22[3] = &unk_189F632C0;
        v22[4] = self;
        id v23 = v15;
        v20 = (uint64_t (**)(void, void))MEMORY[0x186E47C94](v22);
        if (a7)
        {
          do
          {
            if (v19 + 1 <= v17) {
              break;
            }
            char v21 = v20[2](v20, v19--);
          }

          while ((v21 & 1) == 0);
        }

        else
        {
          do
          {
            if ((v20[2](v20, v17) & 1) != 0) {
              break;
            }
            ++v17;
          }

          while (v17 <= v19);
        }
      }
    }
  }
}

uint64_t __109__SAThread_enumerateThreadStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke( uint64_t a1,  uint64_t a2)
{
  unsigned __int8 v6 = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:a2];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, unsigned __int8 *))(v3 + 16))(v3, v4, a2, &v6);

  return v6;
}

- (void)enumerateThreadStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __93__SAThread_enumerateThreadStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke;
  v14[3] = &unk_189F632E8;
  BOOL v16 = a6;
  id v15 = v12;
  id v13 = v12;
  -[SAThread enumerateThreadStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]( self,  "enumerateThreadStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:",  a3,  0x7FFFFFFFFFFFFFFFLL,  a4,  0x7FFFFFFFFFFFFFFFLL,  v8,  v14);
}

void __93__SAThread_enumerateThreadStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!*(_BYTE *)(a1 + 40) || (v4 = [v3 startSampleIndex], unint64_t v5 = v6, v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    unint64_t v5 = v6;
  }
}

- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v6 && v7 && ([v6 le:v7] & 1) == 0)
  {
    int v15 = *__error();
    _sa_logt();
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v6 debugDescription];
      uint64_t v18 = [v17 UTF8String];
      id v19 = [v8 debugDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v30 = v18;
      __int16 v31 = 2080;
      uint64_t v32 = [v19 UTF8String];
      _os_log_error_impl(&dword_186C92000, v16, OS_LOG_TYPE_ERROR, "start time %s after end time %s", buf, 0x16u);
    }

    *__error() = v15;
    id v20 = [v6 debugDescription];
    char v21 = [v20 UTF8String];
    id v22 = [v8 debugDescription];
    [v22 UTF8String];
    _SASetCrashLogMessage(258, "start time %s after end time %s", v23, v24, v25, v26, v27, v28, v21);

    _os_crash();
    __break(1u);
  }

  if (-[NSMutableArray count](self->_threadStates, "count")
    && (unint64_t v9 = -[SAThread indexOfFirstThreadStateOnOrAfterTime:sampleIndex:]( self,  "indexOfFirstThreadStateOnOrAfterTime:sampleIndex:",  v6,  0x7FFFFFFFFFFFFFFFLL),  v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v11 = v9;
    unint64_t v12 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:sampleIndex:]( self,  "indexOfLastThreadStateOnOrBeforeTime:sampleIndex:",  v8,  0x7FFFFFFFFFFFFFFFLL);
    if (v12 >= v11) {
      uint64_t v13 = v12 - v11 + 1;
    }
    else {
      uint64_t v13 = 0LL;
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v10 = 0LL;
    }
    else {
      unint64_t v10 = v13;
    }
  }

  else
  {
    unint64_t v10 = 0LL;
  }

  return v10;
}

- (void)cpuTimeForThreadStateIndex:(void *)a3@<X2> inTimestampRangeStart:(void *)a4@<X3> end:(void *)a5@<X8>
{
  id v45 = a3;
  id v9 = a4;
  a5[1] = 0LL;
  a5[2] = 0LL;
  *a5 = 0LL;
  if (a1)
  {
    [a1 threadStates];
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v11 = [v10 count];

    if (v11 >= a2)
    {
      [a1 threadStates];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 objectAtIndexedSubscript:a2];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v14 = [v13 endSampleIndex];
      if (a2)
      {
        [v13 startTimestamp];
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v16 = [v15 gt:v45];

        if (v16)
        {
          [a1 threadStates];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 objectAtIndexedSubscript:a2 - 1];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 == 0x7FFFFFFFFFFFFFFFLL || [v18 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
          {
            char v21 = v18;
          }

          else
          {
            unint64_t v19 = a2 - 2;
            while (v19 != -1LL)
            {
              [a1 threadStates];
              id v20 = (void *)objc_claimAutoreleasedReturnValue();
              [v20 objectAtIndexedSubscript:v19];
              char v21 = (void *)objc_claimAutoreleasedReturnValue();

              --v19;
              uint64_t v18 = v21;
              if ([v21 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_12;
              }
            }

            char v21 = 0LL;
          }

- (void)forwardFillMonotonicallyIncreasingData
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    [a1 threadStates];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v1 countByEnumeratingWithState:&v42 objects:v76 count:16];
    if (v2)
    {
      uint64_t v4 = v2;
      uint64_t v41 = 0LL;
      unint64_t v5 = 0LL;
      uint64_t v6 = *(void *)v43;
      *(void *)&__int128 v3 = 134221570LL;
      __int128 v26 = v3;
      do
      {
        for (uint64_t i = 0LL; i != v4; ++i)
        {
          BOOL v8 = v5;
          if (*(void *)v43 != v6) {
            objc_enumerationMutation(v1);
          }
          id v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (v5)
          {
            if ([*(id *)(*((void *)&v42 + 1) + 8 * i) userTimeInNs]
              && (unint64_t v10 = [v9 userTimeInNs], v10 < objc_msgSend(v8, "userTimeInNs"))
              || objc_msgSend(v9, "systemTimeInNs", v26)
              && (unint64_t v11 = [v9 systemTimeInNs], v11 < objc_msgSend(v8, "systemTimeInNs"))
              || [v9 instructions]
              && (unint64_t v12 = [v9 instructions], v12 < objc_msgSend(v8, "instructions"))
              || [v9 cycles] && (unint64_t v13 = objc_msgSend(v9, "cycles"), v13 < objc_msgSend(v8, "cycles")))
            {
              int v14 = *__error();
              _sa_logt();
              int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v39 = [a1 threadId];
                [a1 threadStates];
                int v40 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v24 = [v40 count];
                [v8 debugDescription];
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                [v9 debugDescription];
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v36 = [v8 cpuTimeNs];
                uint64_t v35 = [v8 userTimeInNs];
                uint64_t v34 = [v8 systemTimeInNs];
                uint64_t v33 = [v9 cpuTimeNs];
                uint64_t v32 = [v9 userTimeInNs];
                uint64_t v31 = [v9 systemTimeInNs];
                uint64_t v30 = [v8 instructions];
                uint64_t v29 = [v9 instructions];
                uint64_t v28 = [v8 cycles];
                uint64_t v25 = [v9 cycles];
                *(_DWORD *)buf = v26;
                uint64_t v47 = v39;
                __int16 v48 = 2048;
                uint64_t v49 = v41 + i;
                __int16 v50 = 2048;
                uint64_t v51 = v24;
                __int16 v52 = 2112;
                v53 = v38;
                __int16 v54 = 2112;
                v55 = v37;
                __int16 v56 = 2048;
                uint64_t v57 = v36;
                __int16 v58 = 2048;
                uint64_t v59 = v35;
                __int16 v60 = 2048;
                uint64_t v61 = v34;
                __int16 v62 = 2048;
                uint64_t v63 = v33;
                __int16 v64 = 2048;
                uint64_t v65 = v32;
                __int16 v66 = 2048;
                uint64_t v67 = v31;
                __int16 v68 = 2048;
                uint64_t v69 = v30;
                __int16 v70 = 2048;
                uint64_t v71 = v29;
                __int16 v72 = 2048;
                uint64_t v73 = v28;
                __int16 v74 = 2048;
                uint64_t v75 = v25;
                _os_log_debug_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_DEBUG,  "Thread 0x%llx monotonically increasing data decreased at index %lu of %lu between %@ and %@:\n cpu time %llu (%llu + %llu) -> %llu (%llu + %llu)\n instructions %llu -> %llu\n cycles %llu -> %llu",  buf,  0x98u);
              }

              *__error() = v14;
            }

            unint64_t v16 = objc_msgSend(v9, "userTimeInNs", v26);
            if (v16 < [v8 userTimeInNs])
            {
              uint64_t v17 = [v8 userTimeInNs];
              if (v9) {
                v9[17] = v17;
              }
            }

            unint64_t v18 = [v9 systemTimeInNs];
            if (v18 < [v8 systemTimeInNs])
            {
              uint64_t v19 = [v8 systemTimeInNs];
              if (v9) {
                v9[18] = v19;
              }
            }

            unint64_t v20 = [v9 instructions];
            if (v20 < [v8 instructions])
            {
              uint64_t v21 = [v8 instructions];
              if (v9) {
                v9[19] = v21;
              }
            }

            unint64_t v22 = [v9 cycles];
            if (v22 < [v8 cycles])
            {
              uint64_t v23 = [v8 cycles];
              if (v9) {
                v9[20] = v23;
              }
            }
          }

          unint64_t v5 = v9;
        }

        uint64_t v4 = [v1 countByEnumeratingWithState:&v42 objects:v76 count:16];
        v41 += i;
      }

      while (v4);
    }
  }

- (void)insertState:(uint64_t)a3 atIndex:
{
  id v5 = a2;
  if (a1)
  {
    [a1[1] insertObject:v5 atIndex:a3];
    objc_msgSend(MEMORY[0x1896078D0], "indexSetWithIndexesInRange:", a3, objc_msgSend(a1[1], "count") - a3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v9 = a1[1];
    uint64_t v10 = MEMORY[0x1895F87A8];
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __32__SAThread_insertState_atIndex___block_invoke;
    v20[3] = &unk_189F63310;
    id v11 = v7;
    id v21 = v11;
    id v12 = v8;
    id v22 = v12;
    [v9 enumerateObjectsAtIndexes:v6 options:0 usingBlock:v20];
    v19[0] = v10;
    v19[1] = 3221225472LL;
    v19[2] = __32__SAThread_insertState_atIndex___block_invoke_2;
    v19[3] = &unk_189F63360;
    v19[4] = a1;
    v19[5] = a3;
    unint64_t v13 = (void (**)(void, void))MEMORY[0x186E47C94](v19);
    ((void (**)(void, id))v13)[2](v13, v11);
    [v5 dispatchQueue];
    int v14 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)&OBJC_CLASS___SADispatchQueueState, a1, a3);
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14[24]) {
        unint64_t v16 = 0LL;
      }
      else {
        unint64_t v16 = v14 + 24;
      }
      -[SARecipe insertState:hasConcurrentExecution:]((uint64_t)v14, v15, v16);
    }

    ((void (**)(void, id))v13)[2](v13, v12);
    [v5 swiftTask];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)&OBJC_CLASS___SASwiftTaskState, a1, a3);
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SARecipe insertState:hasConcurrentExecution:]((uint64_t)v17, v18, 0LL);
    }
  }
}

void __32__SAThread_insertState_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 dispatchQueue];
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  [v5 swiftTask];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

void __32__SAThread_insertState_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v8) states];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v7;
        v11[1] = 3221225472LL;
        v11[2] = __32__SAThread_insertState_atIndex___block_invoke_3;
        v11[3] = &unk_189F63338;
        uint64_t v10 = *(void *)(a1 + 40);
        v11[4] = *(void *)(a1 + 32);
        v11[5] = v10;
        [v9 enumerateObjectsWithOptions:2 usingBlock:v11];

        ++v8;
      }

      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }
}

void __32__SAThread_insertState_atIndex___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v10 = a2;
  [v10 thread];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void **)(a1 + 32);

  uint64_t v8 = v10;
  if (v6 == v7)
  {
    if ((unint64_t)[v10 threadStateIndex] >= *(void *)(a1 + 40))
    {
      uint64_t v9 = [v10 threadStateIndex];
      uint64_t v8 = v10;
      if (v10) {
        v10[2] = v9 + 1;
      }
    }

    else
    {
      *a4 = 1;
      uint64_t v8 = v10;
    }
  }
}

- (id)patchedStackForTruncatedStack:(id)a3
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 objectAtIndexedSubscript:0];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 isTruncatedBacktraceFrame];

  if ((v7 & 1) == 0)
  {
    int v41 = *__error();
    _sa_logt();
    __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = [v5 objectAtIndexedSubscript:0];
      id v43 = [(id)v3 debugDescription];
      *(_DWORD *)buf = 136315138;
      uint64_t v67 = [v43 UTF8String];
      _os_log_error_impl(&dword_186C92000, v42, OS_LOG_TYPE_ERROR, "%s is not a truncated frame", buf, 0xCu);
    }

    *__error() = v41;
    [v5 objectAtIndexedSubscript:0];
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
    id v45 = [v44 debugDescription];
    char v46 = [v45 UTF8String];
    _SASetCrashLogMessage(469, "%s is not a truncated frame", v47, v48, v49, v50, v51, v52, v46);

    _os_crash();
    __break(1u);
    goto LABEL_46;
  }

  if (self->_resampledLeafUserFrame)
  {
    unint64_t v65 = [v5 count];
    id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v61 = self;
    uint64_t v9 = self->_resampledLeafUserFrame;
    if (v9)
    {
      uint64_t v10 = v9;
      do
      {
        [v8 insertObject:v10 atIndex:0];
        parentFrame = v10->_parentFrame;
        __int128 v12 = parentFrame;

        uint64_t v10 = v12;
      }

      while (parentFrame);
    }

    uint64_t v62 = [v8 count];
    if (v62)
    {
      uint64_t v3 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v63 = v14;
        unint64_t v64 = v3;
        if (v65 < 2)
        {
          unint64_t v16 = 0LL;
        }

        else
        {
          unint64_t v15 = 0LL;
          while (1)
          {
            unint64_t v16 = v15 + 1;
            id v17 = v5;
            [v5 objectAtIndexedSubscript:v15 + 1];
            unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v19 = [v18 address];
            [v8 objectAtIndexedSubscript:v13 + v15];
            unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v21 = [v20 address];

            if (v19 != v21) {
              break;
            }
            if (v16 >= v62 - v13) {
              goto LABEL_16;
            }
            unint64_t v22 = v15 + 2;
            ++v15;
            id v5 = v17;
            if (v22 >= v65) {
              goto LABEL_17;
            }
          }

          unint64_t v16 = v15;
LABEL_16:
          id v5 = v17;
        }

- (BOOL)isProcessorIdleThread
{
  uint64_t v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    int v3 = v2[40] >> 7;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Thread 0x%llx",  self->_threadId);
}

- (NSArray)threadStates
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (unint64_t)threadId
{
  return self->_threadId;
}

- (SATimestamp)creationTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 32LL, 1);
}

- (SATimestamp)exitTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 40LL, 1);
}

- (BOOL)isGlobalForcedIdle
{
  return self->_isGlobalForcedIdle;
}

- (BOOL)isMainThread
{
  return self->_isMainThread;
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAThread";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSMutableArray count](self->_threadStates, "count") + 48;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (-[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    uint64_t v5 = *__error();
    _sa_logt();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = -[SAThread debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v51 = [v15 UTF8String];
      __int16 v52 = 2048;
      *(void *)int v53 = -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v53[8] = 2048;
      *(void *)&v53[10] = a4;
      _os_log_error_impl(&dword_186C92000, v14, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v5;
    id v16 = -[SAThread debugDescription](self, "debugDescription");
    char v17 = [v16 UTF8String];
    -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(4044, "%s: size %lu != buffer length %lu", v18, v19, v20, v21, v22, v23, v17);

    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  *(_WORD *)&a3->var0 = 769;
  *(void *)(&a3->var1 + 1) = self->_threadId;
  char v10 = BYTE6(a3->var4) & 0xFE | self->_isGlobalForcedIdle;
  BYTE6(a3->var4) = v10;
  BYTE6(a3->var4) = v10 & 0xFD | (2 * self->_isMainThread);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_creationTimestamp,  v9);
  *(unint64_t *)((char *)&a3->var3 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_exitTimestamp,  v9);
  if ((unint64_t)-[NSMutableArray count](self->_threadStates, "count") >= 0xFFFFFFFF)
  {
LABEL_8:
    int v24 = *__error();
    _sa_logt();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = -[SAThread debugDescription](self, "debugDescription");
      uint64_t v27 = [v26 UTF8String];
      uint64_t v28 = -[NSMutableArray count](self->_threadStates, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v51 = v27;
      __int16 v52 = 2048;
      *(void *)int v53 = v28;
      _os_log_error_impl(&dword_186C92000, v25, OS_LOG_TYPE_ERROR, "%s has %lu states", buf, 0x16u);
    }

    *__error() = v24;
    -[SAThread debugDescription](self, "debugDescription");
    a3 = ($483DE8F58EAF7C0B5E45B9787B51A7EB *) objc_claimAutoreleasedReturnValue();
    char v29 = -[$483DE8F58EAF7C0B5E45B9787B51A7EB UTF8String](a3, "UTF8String");
    -[NSMutableArray count](self->_threadStates, "count");
    _SASetCrashLogMessage(4058, "%s has %lu states", v30, v31, v32, v33, v34, v35, v29);

    _os_crash();
    __break(1u);
LABEL_11:
    int v36 = *__error();
    _sa_logt();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = -[SAThread debugDescription](self, "debugDescription");
      uint64_t v39 = [v38 UTF8String];
      int v40 = *(_DWORD *)((char *)&a3->var4 + 2);
      unint64_t v41 = -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      uint64_t v51 = v39;
      __int16 v52 = 1024;
      *(_DWORD *)int v53 = v40;
      *(_WORD *)&v53[4] = 2048;
      *(void *)&v53[6] = v5;
      *(_WORD *)&v53[14] = 2048;
      *(void *)&v53[16] = v41;
      _os_log_error_impl( &dword_186C92000,  v37,  OS_LOG_TYPE_ERROR,  "%s: after serializing (with %u threadStates), ended with length %ld, should be %lu",  buf,  0x26u);
    }

    *__error() = v36;
    id v42 = -[SAThread debugDescription](self, "debugDescription");
    char v43 = [v42 UTF8String];
    -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage( 4065,  "%s: after serializing (with %u threadStates), ended with length %ld, should be %lu",  v44,  v45,  v46,  v47,  v48,  v49,  v43);

    _os_crash();
    __break(1u);
  }

  unsigned int v11 = -[NSMutableArray count](self->_threadStates, "count");
  *(_DWORD *)((char *)&a3->var4 + 2) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var5, v11, self->_threadStates, v9);
  __int128 v12 = &a3->var5 + 2 * *(unsigned int *)((char *)&a3->var4 + 2);
  uint64_t v5 = 8LL * *(unsigned int *)((char *)&a3->var4 + 2) + 48;
  if (v5 != -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion")) {
    goto LABEL_11;
  }
  *(void *)__int128 v12 = SASerializableIndexForPointerFromSerializationDictionary(self->_resampledLeafUserFrame, v9);
  *((void *)v12 + 1) = SASerializableIndexForPointerFromSerializationDictionary( self->_resampledleafOfCRootFramesReplacedBySwiftAsync,  v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[SATimestamp addSelfToSerializationDictionary:](self->_creationTimestamp, "addSelfToSerializationDictionary:", v4);
    -[SATimestamp addSelfToSerializationDictionary:](self->_exitTimestamp, "addSelfToSerializationDictionary:", v4);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    char v7 = self->_threadStates;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (void)v12);
        }

        while (v9 != v11);
        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v9);
    }

    -[SAFrame addSelfToSerializationDictionary:](self->_resampledLeafUserFrame, "addSelfToSerializationDictionary:", v4);
    -[SAFrame addSelfToSerializationDictionary:]( self->_resampledleafOfCRootFramesReplacedBySwiftAsync,  "addSelfToSerializationDictionary:",  v4);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x1F)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 32LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThread struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(4094, "bufferLength %lu < serialized SAThread struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 26) + 32 > a4)
  {
LABEL_8:
    int v14 = *__error();
    _sa_logt();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(v5 + 26);
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThread struct with %u thread states",  buf,  0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage( 4095,  "bufferLength %lu < serialized SAThread struct with %u thread states",  v17,  v18,  v19,  v20,  v21,  v22,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAThread version",  0LL);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }

  +[SAThread threadWithId:]((uint64_t)&OBJC_CLASS___SAThread, *(void *)((char *)a3 + 2));
  id result = (id)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)result + 16) = *(_BYTE *)(v5 + 30) & 1;
  *((_BYTE *)result + 17) = (*(_BYTE *)(v5 + 30) & 2) != 0;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v70 = a5;
  id v10 = a6;
  if (a4 <= 0x1F)
  {
    int v35 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v72 = a4;
      __int16 v73 = 2048;
      uint64_t v74 = 32LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThread struct %lu",  buf,  0x16u);
    }

    *__error() = v35;
    _SASetCrashLogMessage(4109, "bufferLength %lu < serialized SAThread struct %lu", v36, v37, v38, v39, v40, v41, a4);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }

  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 26) + 32 > a4)
  {
LABEL_13:
    int v42 = *__error();
    _sa_logt();
    char v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      int v44 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      unint64_t v72 = a4;
      __int16 v73 = 1024;
      LODWORD(v74) = v44;
      _os_log_error_impl( &dword_186C92000,  v43,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThread struct with %u thread states",  buf,  0x12u);
    }

    *__error() = v42;
    _SASetCrashLogMessage( 4110,  "bufferLength %lu < serialized SAThread struct with %u thread states",  v45,  v46,  v47,  v48,  v49,  v50,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 10);
  uint64_t v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v70, v11, v13, 0);
  int v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  creationTimestamp = self->_creationTimestamp;
  self->_creationTimestamp = v14;

  unint64_t v16 = *(void *)((char *)a3 + 18);
  uint64_t v17 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v70, v11, v17, 0);
  uint64_t v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  exitTimestamp = self->_exitTimestamp;
  self->_exitTimestamp = v18;

  uint64_t v20 = (char *)a3 + 32;
  uint64_t v21 = *(unsigned int *)((char *)a3 + 26);
  uint64_t v22 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 32, v21, v70, v11, v22);
  id v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  threadStates = self->_threadStates;
  self->_threadStates = v23;

  uint64_t v25 = *(unsigned int *)((char *)a3 + 26);
  if (8 * v25 + 40 > a4)
  {
LABEL_16:
    int v51 = *__error();
    _sa_logt();
    __int16 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      int v53 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      unint64_t v72 = a4;
      __int16 v73 = 1024;
      LODWORD(v74) = v53;
      _os_log_error_impl( &dword_186C92000,  v52,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThread v2 struct with %u thread states",  buf,  0x12u);
    }

    *__error() = v51;
    _SASetCrashLogMessage( 4120,  "bufferLength %lu < serialized SAThread v2 struct with %u thread states",  v54,  v55,  v56,  v57,  v58,  v59,  a4);
    _os_crash();
    __break(1u);
LABEL_19:
    int v60 = *__error();
    _sa_logt();
    uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      int v62 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      unint64_t v72 = a4;
      __int16 v73 = 1024;
      LODWORD(v74) = v62;
      _os_log_error_impl( &dword_186C92000,  v61,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThread v3 struct with %u thread states",  buf,  0x12u);
    }

    *__error() = v60;
    _SASetCrashLogMessage( 4126,  "bufferLength %lu < serialized SAThread v3 struct with %u thread states",  v63,  v64,  v65,  v66,  v67,  v68,  a4);
    _os_crash();
    __break(1u);
LABEL_22:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAThread version",  0LL);
    id v69 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v69);
  }

  unint64_t v26 = *(void *)&v20[8 * v25];
  uint64_t v27 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v26, v70, v11, v27, 0);
  uint64_t v28 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  resampledLeafUserFrame = self->_resampledLeafUserFrame;
  self->_resampledLeafUserFrame = v28;

  if (*((unsigned __int8 *)a3 + 1) >= 3u)
  {
    uint64_t v30 = *(unsigned int *)((char *)a3 + 26);
    if (8 * v30 + 48 <= a4)
    {
      unint64_t v31 = *(void *)&v20[8 * v30 + 8];
      uint64_t v32 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v31,  v70,  v11,  v32,  0);
      uint64_t v33 = (SAFrame *)objc_claimAutoreleasedReturnValue();
      resampledleafOfCRootFramesReplacedBySwiftAsync = self->_resampledleafOfCRootFramesReplacedBySwiftAsync;
      self->_resampledleafOfCRootFramesReplacedBySwiftAsync = v33;

      goto LABEL_9;
    }

    goto LABEL_19;
  }

@end