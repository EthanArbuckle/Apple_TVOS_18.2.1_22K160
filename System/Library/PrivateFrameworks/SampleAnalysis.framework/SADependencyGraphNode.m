@interface SADependencyGraphNode
+ (id)dependencyGraphForThreadsInSampleStore:(id)a3 atTimestamp:(id)a4;
- (BOOL)isBlockedByADeadlock;
- (BOOL)isPartOfADeadlock;
- (SADependencyGraphNode)dependency;
- (SATask)task;
- (SATaskState)taskState;
- (SAThread)thread;
- (SAThreadState)threadState;
@end

@implementation SADependencyGraphNode

+ (id)dependencyGraphForThreadsInSampleStore:(id)a3 atTimestamp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x186E47ACC]();
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v9 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke;
  v23[3] = &unk_189F635C0;
  id v10 = v6;
  id v24 = v10;
  id v11 = v8;
  id v25 = v11;
  [v5 enumerateTasks:v23];
  v21[0] = v9;
  v21[1] = 3221225472LL;
  v21[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_3;
  v21[3] = &unk_189F635E8;
  id v12 = v11;
  id v22 = v12;
  [v12 enumerateKeysAndObjectsUsingBlock:v21];
  uint64_t v16 = v9;
  uint64_t v17 = 3221225472LL;
  v18 = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_4;
  v19 = &unk_189F635E8;
  id v20 = v12;
  id v13 = v12;
  [v13 enumerateKeysAndObjectsUsingBlock:&v16];
  v14 = (void *)objc_msgSend(v13, "copy", v16, v17, v18, v19);

  objc_autoreleasePoolPop(v7);
  return v14;
}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke( uint64_t a1,  void *a2)
{
  id v11 = a2;
  [v11 taskStates];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v6 = 0LL;
    goto LABEL_7;
  }

  [v11 lastTaskStateOnOrBeforeTime:*(void *)(a1 + 32) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    [v5 startTimestamp];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 gt:*(void *)(a1 + 32)])
    {
LABEL_8:

      goto LABEL_9;
    }

    [v6 endTimestamp];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v8 lt:*(void *)(a1 + 32)];

    if ((v9 & 1) != 0) {
      goto LABEL_9;
    }
LABEL_7:
    [v11 threads];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_2;
    v12[3] = &unk_189F63598;
    id v13 = *(id *)(a1 + 32);
    id v14 = v11;
    id v6 = v6;
    id v15 = v6;
    id v16 = *(id *)(a1 + 40);
    [v10 enumerateKeysAndObjectsUsingBlock:v12];

    v7 = v13;
    goto LABEL_8;
  }

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_2( void *a1,  uint64_t a2,  void *a3)
{
  id v19 = a3;
  [v19 lastThreadStateOnOrBeforeTime:a1[4] sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    [v5 startTimestamp];
    v7 = (SADependencyGraphNode *)objc_claimAutoreleasedReturnValue();
    if ((-[SADependencyGraphNode gt:](v7, "gt:", a1[4]) & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }

    [v6 endTimestamp];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v8 lt:a1[4]];

    if ((v9 & 1) == 0)
    {
      v7 = objc_alloc(&OBJC_CLASS___SADependencyGraphNode);
      id v11 = (void *)a1[5];
      id v10 = (void *)a1[6];
      id v12 = v11;
      id v13 = v10;
      id v14 = v19;
      id v15 = v6;
      if (v7)
      {
        v20.receiver = v7;
        v20.super_class = (Class)&OBJC_CLASS___SADependencyGraphNode;
        id v16 = (SADependencyGraphNode *)objc_msgSendSuper2(&v20, sel_init);
        v7 = v16;
        if (v16)
        {
          objc_storeStrong((id *)&v16->_task, v11);
          objc_storeStrong((id *)&v7->_taskState, v10);
          objc_storeStrong((id *)&v7->_thread, a3);
          objc_storeStrong((id *)&v7->_threadState, v6);
        }
      }

      uint64_t v17 = (void *)a1[7];
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v14, "threadId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setObject:v7 forKeyedSubscript:v18];

      goto LABEL_8;
    }
  }

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v12 = a3;
  [v12 threadState];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 turnstileInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 blockingTid];
  if (v6)
  {
  }

  else
  {
    [v12 threadState];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 waitInfo];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v8 blockingTid];

    if (!v6) {
      goto LABEL_7;
    }
  }

  char v9 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v6];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    objc_storeWeak(v12 + 6, v11);
  }

LABEL_7:
}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_4( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = a3;
  if (!v4 || (v4[10] & 1) == 0)
  {
    id v22 = v4;
    id v5 = objc_alloc(MEMORY[0x189603FA8]);
    uint64_t v6 = (void *)MEMORY[0x189607968];
    [v22 thread];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "threadId"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = (void *)objc_msgSend(v5, "initWithObjects:", v8, 0);

    [v22 dependency];
    id v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v10)
    {
      while (1)
      {
        if ((v10[10] & 1) != 0)
        {
          if ([v10 isBlockedByADeadlock])
          {
            unint64_t v11 = [v9 count];
            goto LABEL_13;
          }

- (SATask)task
{
  return (SATask *)objc_getProperty(self, a2, 16LL, 1);
}

- (SATaskState)taskState
{
  return (SATaskState *)objc_getProperty(self, a2, 24LL, 1);
}

- (SAThread)thread
{
  return (SAThread *)objc_getProperty(self, a2, 32LL, 1);
}

- (SAThreadState)threadState
{
  return (SAThreadState *)objc_getProperty(self, a2, 40LL, 1);
}

- (SADependencyGraphNode)dependency
{
  return (SADependencyGraphNode *)objc_loadWeakRetained((id *)&self->_dependency);
}

- (BOOL)isPartOfADeadlock
{
  return self->_isPartOfADeadlock;
}

- (BOOL)isBlockedByADeadlock
{
  return self->_isBlockedByADeadlock;
}

- (void).cxx_destruct
{
}

@end