@interface NSURLSessionTaskMetrics
- (NSArray)transactionMetrics;
- (id)initWithMetrics:(id *)a1;
- (void)collectWithCompletionHandler:(void *)a3 queue:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLSessionTaskMetrics

- (id)initWithMetrics:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___NSURLSessionTaskMetrics;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (void)collectWithCompletionHandler:(void *)a3 queue:
{
  v5 = a2;
  objc_super v7 = a3;
  if (!a1) {
    goto LABEL_9;
  }
  v8 = *(void **)(a1 + 8);
  if (!v8)
  {
    v10 = 0LL;
    goto LABEL_11;
  }

  id v9 = objc_getProperty(v8, v6, 96LL, 1);
  v10 = v9;
  if (!v9)
  {
LABEL_11:
    v11 = 0LL;
    goto LABEL_5;
  }

  v11 = (void *)*((void *)v9 + 30);
LABEL_5:
  v12 = v11;

  if (v12)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __62__NSURLSessionTaskMetrics_collectWithCompletionHandler_queue___block_invoke;
    v13[3] = &unk_189C1A700;
    v13[4] = a1;
    v14 = v5;
    nw_data_transfer_report_collect(v12, v7, v13);
  }

  else
  {
    v5[2](v5);
  }

LABEL_9:
}

- (NSArray)transactionMetrics
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0LL;
  metrics = self->__metrics;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __45__NSURLSessionTaskMetrics_transactionMetrics__block_invoke;
  v5[3] = &unk_189C1A6D8;
  v5[4] = &v6;
  -[__CFN_TaskMetrics lockTransactionMetrics:]((uint64_t)metrics, v5);
  v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__NSURLSessionTaskMetrics_transactionMetrics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
        if (v11) {
          v12 = *(void **)(v11 + 72);
        }
        else {
          v12 = 0LL;
        }
        id v13 = v12;
        BOOL v14 = v13 == 0LL;

        if (!v14)
        {
          v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
          v16 = -[NSURLSessionTaskTransactionMetrics initWithMetrics:forCache:]( objc_alloc(&OBJC_CLASS___NSURLSessionTaskTransactionMetrics),  (void *)v11,  1);
          objc_msgSend(v15, "addObject:", v16, (void)v23);
        }

        if (v11)
        {
          if (*(_BYTE *)(v11 + 8)) {
            goto LABEL_12;
          }
          v19 = *(void **)(v11 + 72);
        }

        else
        {
          v19 = 0LL;
        }

        id v20 = v19;
        BOOL v21 = v20 == 0LL;

        if (v21)
        {
LABEL_12:
          v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
          v18 = -[NSURLSessionTaskTransactionMetrics initWithMetrics:forCache:]( objc_alloc(&OBJC_CLASS___NSURLSessionTaskTransactionMetrics),  (void *)v11,  0);
          [v17 addObject:v18];
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v22 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v8 = v22;
    }

    while (v22);
  }
}

- (void).cxx_destruct
{
}

void __62__NSURLSessionTaskMetrics_collectWithCompletionHandler_queue___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
  if (v5)
  {
    uint64_t v6 = (id *)objc_getProperty(v5, v4, 96LL, 1);
    id v7 = v6;
    if (v6) {
      objc_storeStrong(v6 + 30, a2);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)encodeWithCoder:(id)a3
{
}

@end