@interface SARecipe
- (NSArray)states;
- (uint64_t)addState:(_BYTE *)a3 hasConcurrentExecution:;
- (uint64_t)addStates:(_BYTE *)a3 hasConcurrentExecution:;
- (uint64_t)indexOfFirstStateOnOrAfterTime:(unint64_t)a3 sampleIndex:;
- (uint64_t)indexOfLastStateOnOrBeforeTime:(unint64_t)a3 sampleIndex:;
- (unint64_t)identifier;
- (void)enumerateStatesBetweenStartTime:(unint64_t)a3 startSampleIndex:(void *)a4 endTime:(unint64_t)a5 endSampleIndex:(char)a6 reverseOrder:(void *)a7 block:;
- (void)initWithId:(void *)a1;
- (void)insertState:(_BYTE *)a3 hasConcurrentExecution:;
@end

@implementation SARecipe

- (void)initWithId:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_CLASS___SARecipe;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = a2;
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    v6 = (void *)v4[1];
    v4[1] = v5;
  }

  return v4;
}

- (uint64_t)addState:(_BYTE *)a3 hasConcurrentExecution:
{
  id v5 = a2;
  if (a1)
  {
    if (a3)
    {
      [*(id *)(a1 + 8) lastObject];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        [v6 thread];
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 thread];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          char v13 = 0;
        }

        else
        {
          [v7 threadState];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 endTimestamp];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 threadState];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 startTimestamp];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v10 ge:v12];
        }
      }

      else
      {
        char v13 = 0;
      }

      *a3 = v13;
    }

    [*(id *)(a1 + 8) addObject:v5];
    a1 = [*(id *)(a1 + 8) count] - 1;
  }

  return a1;
}

- (void)insertState:(_BYTE *)a3 hasConcurrentExecution:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  [*(id *)(a1 + 8) addObject:v5];
  [*(id *)(a1 + 8) sortUsingComparator:&__block_literal_global_6];
  if (a3)
  {
    v19 = a3;
    id v20 = v5;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id obj = *(id *)(a1 + 8);
    uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [0 thread];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v12 = [v10 thread];
          if (v11 == (void *)v12)
          {
          }

          else
          {
            char v13 = (void *)v12;
            [0 threadState];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 endTimestamp];
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 threadState];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 startTimestamp];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            int v18 = [v15 ge:v17];

            if (v18)
            {
              _BYTE *v19 = 1;
              goto LABEL_13;
            }
          }
        }

        uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v7);
    }

uint64_t __47__SARecipe_insertState_hasConcurrentExecution___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 threadState];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 startTimestamp];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 threadState];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 startTimestamp];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (uint64_t)addStates:(_BYTE *)a3 hasConcurrentExecution:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1)
  {
LABEL_12:

    return a1;
  }

  if ([v5 count])
  {
    if (a3)
    {
      [*(id *)(a1 + 8) lastObject];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = v7;
      if (v7)
      {
        [v7 thread];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 firstObject];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 thread];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v11)
        {
          char v15 = 0;
        }

        else
        {
          [v8 threadState];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 endTimestamp];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 firstObject];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 threadState];
          v28 = v9;
          char v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 startTimestamp];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          char v15 = [v26 ge:v14];

          uint64_t v9 = v28;
        }
      }

      else
      {
        char v15 = 0;
      }

      *a3 = v15;
    }

    [*(id *)(a1 + 8) addObjectsFromArray:v6];
    a1 = [*(id *)(a1 + 8) count] - 1;
    goto LABEL_12;
  }

  int v17 = *__error();
  _sa_logt();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_186C92000, v18, OS_LOG_TYPE_ERROR, "0 recipeStates.count", buf, 2u);
  }

  *__error() = v17;
  _SASetCrashLogMessage(3534, "0 recipeStates.count", v19, v20, v21, v22, v23, v24, v25);
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

- (void)enumerateStatesBetweenStartTime:(unint64_t)a3 startSampleIndex:(void *)a4 endTime:(unint64_t)a5 endSampleIndex:(char)a6 reverseOrder:(void *)a7 block:
{
  id v13 = a2;
  id v14 = a4;
  id v15 = a7;
  if (a1)
  {
    uint64_t v16 = -[SARecipe indexOfFirstStateOnOrAfterTime:sampleIndex:](a1, v13, a3);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v17 = v16;
      unint64_t v18 = -[SARecipe indexOfLastStateOnOrBeforeTime:sampleIndex:](a1, v14, a5);
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v19 = v18;
        if (v17 <= v18)
        {
          v22[0] = MEMORY[0x1895F87A8];
          v22[1] = 3221225472LL;
          v22[2] = __103__SARecipe_enumerateStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
          v22[3] = &unk_189F632C0;
          v22[4] = a1;
          id v23 = v15;
          uint64_t v20 = (uint64_t (**)(void, void))MEMORY[0x186E47C94](v22);
          if ((a6 & 1) != 0)
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
}

- (uint64_t)indexOfFirstStateOnOrAfterTime:(unint64_t)a3 sampleIndex:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if (v5)
    {
      uint64_t v7 = *(void **)(a1 + 8);
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __55__SARecipe_indexOfFirstStateOnOrAfterTime_sampleIndex___block_invoke;
      v15[3] = &unk_189F633C8;
      id v16 = v5;
      unint64_t v8 = SABinarySearchArray(v7, 1280, (uint64_t)v15);
    }

    else
    {
      unint64_t v8 = 0LL;
    }

    if (a3 != 0x7FFFFFFFFFFFFFFFLL && v8 < [*(id *)(a1 + 8) count])
    {
      do
      {
        [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 threadState];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v10 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
        }

        else
        {
          [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 threadState];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v13 = [v12 endSampleIndex];

          if (v13 >= a3) {
            break;
          }
        }

        ++v8;
      }

      while (v8 < [*(id *)(a1 + 8) count]);
    }

    if (v8 >= [*(id *)(a1 + 8) count]) {
      a1 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      a1 = v8;
    }
  }

  return a1;
}

- (uint64_t)indexOfLastStateOnOrBeforeTime:(unint64_t)a3 sampleIndex:
{
  id v5 = a2;
  if (!a1)
  {
    uint64_t v8 = 0LL;
    goto LABEL_8;
  }

  if (![*(id *)(a1 + 8) count]) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  if (v5)
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __55__SARecipe_indexOfLastStateOnOrBeforeTime_sampleIndex___block_invoke;
    v15[3] = &unk_189F633C8;
    id v16 = v5;
    uint64_t v7 = SABinarySearchArray(v6, 1536, (uint64_t)v15);

    if (!v7) {
      goto LABEL_5;
    }
  }

  else
  {
    uint64_t v7 = [*(id *)(a1 + 8) count];
  }

  uint64_t v8 = v7 - 1;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  while (1)
  {
    [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 threadState];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v11 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
    }

    else
    {
      [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 threadState];
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v14 = [v13 startSampleIndex];

      if (v14 <= a3) {
        goto LABEL_8;
      }
    }

    if (!v8) {
      break;
    }
    --v8;
  }

uint64_t __103__SARecipe_enumerateStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke( uint64_t a1,  uint64_t a2)
{
  unsigned __int8 v5 = 0;
  uint64_t v2 = *(void *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:a2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(v2 + 16))(v2, v3, &v5);

  return v5;
}

uint64_t __55__SARecipe_indexOfFirstStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [v3 threadState];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 startTimestamp];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = [v4 lt:v6];

  if ((v4 & 1) != 0)
  {
    uint64_t v7 = -1LL;
  }

  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    [v3 threadState];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 endTimestamp];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = [v8 gt:v10];

    uint64_t v7 = v7;
  }

  return v7;
}

uint64_t __55__SARecipe_indexOfLastStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [v3 threadState];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 startTimestamp];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = [v4 lt:v6];

  if ((v4 & 1) != 0)
  {
    uint64_t v7 = -1LL;
  }

  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    [v3 threadState];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 endTimestamp];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = [v8 gt:v10];

    uint64_t v7 = v7;
  }

  return v7;
}

- (NSArray)states
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end