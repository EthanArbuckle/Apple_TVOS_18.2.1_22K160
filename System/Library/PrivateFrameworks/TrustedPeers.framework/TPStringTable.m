@interface TPStringTable
+ (id)defaultTable;
- (NSHashTable)table;
- (OS_dispatch_queue)queue;
- (TPStringTable)initWithIdentifier:(id)a3;
- (id)setWithArray:(id)a3;
- (id)stringWithString:(id)a3;
- (unint64_t)_count;
- (void)setQueue:(id)a3;
- (void)setTable:(id)a3;
@end

@implementation TPStringTable

- (TPStringTable)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TPStringTable;
  v5 = -[TPStringTable init](&v11, sel_init);
  if (v5)
  {
    v6 = (const char *)[v4 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1895F8AF8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    -[TPStringTable setQueue:](v5, "setQueue:", v8);

    v9 = (void *)[objc_alloc(MEMORY[0x1896078B8]) initWithOptions:5 capacity:0];
    -[TPStringTable setTable:](v5, "setTable:", v9);
  }

  return v5;
}

- (id)stringWithString:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__2793;
  v22 = __Block_byref_object_dispose__2794;
  id v23 = 0LL;
  -[TPStringTable queue](self, "queue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__TPStringTable_stringWithString___block_invoke;
  block[3] = &unk_18A22C0E0;
  v17 = &v18;
  block[4] = self;
  id v7 = v4;
  id v16 = v7;
  dispatch_sync(v5, block);

  dispatch_queue_t v8 = (void *)v19[5];
  if (!v8)
  {
    -[TPStringTable queue](self, "queue");
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472LL;
    v12[2] = __34__TPStringTable_stringWithString___block_invoke_2;
    v12[3] = &unk_18A22C0E0;
    v14 = &v18;
    v12[4] = self;
    id v13 = v7;
    dispatch_barrier_sync(v9, v12);

    dispatch_queue_t v8 = (void *)v19[5];
  }

  id v10 = v8;

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)setWithArray:(id)a3
{
  id v4 = a3;
  size_t v5 = [v4 count];
  uint64_t v6 = (void **)calloc(v5, 8uLL);
  if (v5)
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      [v4 objectAtIndexedSubscript:i];
      dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = -[TPStringTable stringWithString:](self, "stringWithString:", v8);
      id v10 = v6[i];
      v6[i] = (void *)v9;
    }
  }

  objc_super v11 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:v6 count:v5];
  if (v5)
  {
    v12 = v6;
    do
    {
      id v13 = *v12;
      *v12++ = 0LL;

      --v5;
    }

    while (v5);
  }

  free(v6);

  return v11;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)table
{
  return (NSHashTable *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTable:(id)a3
{
}

- (void).cxx_destruct
{
}

void __34__TPStringTable_stringWithString___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 member:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __34__TPStringTable_stringWithString___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 member:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    [*(id *)(a1 + 32) table];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addObject:*(void *)(a1 + 40)];

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), *(id *)(a1 + 40));
  }

+ (id)defaultTable
{
  if (defaultTable_once != -1) {
    dispatch_once(&defaultTable_once, &__block_literal_global_2801);
  }
  return (id)defaultTable_table;
}

void __29__TPStringTable_defaultTable__block_invoke()
{
  v0 = -[TPStringTable initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TPStringTable),  "initWithIdentifier:",  @"TPStringTable.defaultTable");
  v1 = (void *)defaultTable_table;
  defaultTable_table = (uint64_t)v0;
}

- (unint64_t)_count
{
  uint64_t v7 = 0LL;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  -[TPStringTable queue](self, "queue");
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __32__TPStringTable_Testing___count__block_invoke;
  v6[3] = &unk_18A22C148;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __32__TPStringTable_Testing___count__block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 allObjects];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

@end