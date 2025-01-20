@interface TPMachineIDList
- (NSArray)entries;
- (TPMachineIDList)initWithEntries:(id)a3;
- (id)description;
- (id)entryFor:(id)a3;
- (id)machineIDsInStatus:(unint64_t)a3;
@end

@implementation TPMachineIDList

- (TPMachineIDList)initWithEntries:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TPMachineIDList;
  v6 = -[TPMachineIDList init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entries, a3);
  }

  return v7;
}

- (id)entryFor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  -[TPMachineIDList entries](self, "entries", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        [v9 machineID];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v4 isEqualToString:v10];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)description
{
  v2 = (void *)NSString;
  v3 = -[TPMachineIDList entries](self, "entries");
  [v2 stringWithFormat:@"<TPMachineIDList: %@>", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)machineIDsInStatus:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FE0] set];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[TPMachineIDList entries](self, "entries", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 status] == a3)
        {
          [v11 machineID];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 addObject:v12];
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  return v5;
}

- (NSArray)entries
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end