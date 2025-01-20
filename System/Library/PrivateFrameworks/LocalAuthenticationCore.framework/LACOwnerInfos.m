@interface LACOwnerInfos
- (LACOwnerInfos)initWithInfo:(id)a3 context:(id)a4;
- (NSArray)allInfos;
- (id)context;
- (id)description;
- (unint64_t)numberOfOwnersOtherThanPid:(int)a3;
- (void)addInfo:(id)a3;
@end

@implementation LACOwnerInfos

- (LACOwnerInfos)initWithInfo:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACOwnerInfos;
  v8 = -[LACOwnerInfos init](&v12, sel_init);
  if (v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v6, 0);
    allInfos = v8->_allInfos;
    v8->_allInfos = (NSMutableArray *)v9;

    objc_storeWeak(&v8->_context, v7);
  }

  return v8;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v4 = -[LACOwnerInfos allInfos](self, "allInfos");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v9 proxy];
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          [v9 proxy];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 addObject:v11];
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  objc_super v12 = (void *)NSString;
  v13 = -[LACOwnerInfos context](self, "context");
  [v12 stringWithFormat:@"<%@ : %@>", v13, v3];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)addInfo:(id)a3
{
}

- (unint64_t)numberOfOwnersOtherThanPid:(int)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __44__LACOwnerInfos_numberOfOwnersOtherThanPid___block_invoke;
  v9[3] = &__block_descriptor_36_e39_B24__0__LACOwnerInfo_8__NSDictionary_16l;
  int v10 = a3;
  [MEMORY[0x1896079C8] predicateWithBlock:v9];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 filteredArrayUsingPredicate:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 count];

  return v7;
}

BOOL __44__LACOwnerInfos_numberOfOwnersOtherThanPid___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pid] != *(_DWORD *)(a1 + 32);
}

- (NSArray)allInfos
{
  allInfos = self->_allInfos;
  v4 = -[NSMutableArray indexesOfObjectsPassingTest:](allInfos, "indexesOfObjectsPassingTest:", &__block_literal_global_2);
  -[NSMutableArray removeObjectsAtIndexes:](allInfos, "removeObjectsAtIndexes:", v4);

  return (NSArray *)self->_allInfos;
}

BOOL __25__LACOwnerInfos_allInfos__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (id)context
{
  return objc_loadWeakRetained(&self->_context);
}

- (void).cxx_destruct
{
}

@end