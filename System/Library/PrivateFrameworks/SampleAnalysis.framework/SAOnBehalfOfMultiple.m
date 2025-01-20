@interface SAOnBehalfOfMultiple
- (SAOnBehalfOfMultiple)init;
- (id)displayString;
- (void)addProximateName:(uint64_t)a3 proximatePid:(void *)a4 originName:(int)a5 originPid:(int)a6 count:;
@end

@implementation SAOnBehalfOfMultiple

- (SAOnBehalfOfMultiple)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SAOnBehalfOfMultiple;
  v2 = -[SAOnBehalfOfMultiple init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    proximateProcesses = v2->_proximateProcesses;
    v2->_proximateProcesses = v3;
  }

  return v2;
}

- (id)displayString
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  if (!a1[2]) {
    return 0LL;
  }
  v1 = a1;
  context = (void *)MEMORY[0x186E47ACC]();
  objc_msgSend(objc_getProperty(v1, v2, 16, 1), "keysSortedByValueUsingComparator:", &__block_literal_global_177);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc(MEMORY[0x189603FA8]);
  v50 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(objc_getProperty(v1, v5, 16, 1), "count"));
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v3;
  uint64_t v51 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v51)
  {
    v48 = v1;
    uint64_t v49 = *(void *)v56;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v56 != v49) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend( objc_getProperty(v1, v6, 16, 1),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v55 + 1) + 8 * v7));
        v8 = (unsigned int *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        if (v8)
        {
          uint64_t v52 = v7;
          objc_msgSend(objc_getProperty(v8, v9, 24, 1), "sortUsingSelector:", sel_compare_);
          objc_msgSend( objc_getProperty(v10, v11, 32, 1),  "keysSortedByValueUsingComparator:",  &__block_literal_global_11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = objc_alloc(MEMORY[0x189603FA8]);
          v54 = (void *)objc_msgSend( v13,  "initWithCapacity:",  objc_msgSend(objc_getProperty(v10, v14, 32, 1), "count"));
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          id v53 = v12;
          uint64_t v15 = [v53 countByEnumeratingWithState:&v59 objects:v64 count:16];
          if (v15)
          {
            uint64_t v17 = v15;
            uint64_t v18 = *(void *)v60;
            do
            {
              uint64_t v19 = 0LL;
              do
              {
                if (*(void *)v60 != v18) {
                  objc_enumerationMutation(v53);
                }
                objc_msgSend( objc_getProperty(v10, v16, 32, 1),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v59 + 1) + 8 * v19));
                v20 = (unsigned int *)objc_claimAutoreleasedReturnValue();
                v22 = v20;
                if (v20)
                {
                  objc_msgSend(objc_getProperty(v20, v21, 24, 1), "sortUsingSelector:", sel_compare_);
                  id v24 = objc_alloc(NSString);
                  v25 = v10;
                  uint64_t v26 = v22[2];
                  if ((_DWORD)v26 == 1) {
                    v27 = "";
                  }
                  else {
                    v27 = "s";
                  }
                  id v28 = objc_getProperty(v22, v23, 16LL, 1);
                  objc_msgSend(objc_getProperty(v22, v29, 24, 1), "componentsJoinedByString:", @", ");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v45 = v26;
                  v10 = v25;
                  v31 = (void *)[v24 initWithFormat:@"%u sample%s originated by %@ [%@]", v45, v27, v28, v30];
                }

                else
                {
                  v31 = 0LL;
                }

                [v54 addObject:v31];

                ++v19;
              }

              while (v17 != v19);
              uint64_t v32 = [v53 countByEnumeratingWithState:&v59 objects:v64 count:16];
              uint64_t v17 = v32;
            }

            while (v32);
          }

          id v34 = objc_alloc(NSString);
          uint64_t v35 = v10[2];
          if ((_DWORD)v35 == 1) {
            v36 = "";
          }
          else {
            v36 = "s";
          }
          id v37 = objc_getProperty(v10, v33, 16LL, 1);
          objc_msgSend(objc_getProperty(v10, v38, 24, 1), "componentsJoinedByString:", @", ");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "componentsJoinedByString:", @", ");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)[v34 initWithFormat:@"%u sample%s %@ [%@] (%@)", v35, v36, v37, v39, v40];

          v1 = v48;
          uint64_t v7 = v52;
        }

        else
        {
          v41 = 0LL;
        }

        [v50 addObject:v41];

        ++v7;
      }

      while (v7 != v51);
      uint64_t v42 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      uint64_t v51 = v42;
    }

    while (v42);
  }

  objc_msgSend(v50, "componentsJoinedByString:", @", ");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v43;
}

uint64_t __37__SAOnBehalfOfMultiple_displayString__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  SEL v5 = a3;
  uint64_t v7 = v5;
  if (v4)
  {
    unsigned int v8 = v4[2];
    if (v5)
    {
LABEL_3:
      unsigned int v9 = v5[2];
      goto LABEL_4;
    }
  }

  else
  {
    unsigned int v8 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }

  unsigned int v9 = 0;
LABEL_4:
  if (v8 < v9)
  {
    uint64_t v10 = 1LL;
    goto LABEL_16;
  }

  if (v4)
  {
    unsigned int v11 = v4[2];
    if (v5)
    {
LABEL_8:
      unsigned int v12 = v5[2];
      goto LABEL_9;
    }
  }

  else
  {
    unsigned int v11 = 0;
    if (v5) {
      goto LABEL_8;
    }
  }

  unsigned int v12 = 0;
LABEL_9:
  if (v11 <= v12)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v15 = Property;
    if (v7) {
      id v16 = objc_getProperty(v7, v14, 16LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    uint64_t v10 = [v15 compare:v16];
  }

  else
  {
    uint64_t v10 = -1LL;
  }

- (void)addProximateName:(uint64_t)a3 proximatePid:(void *)a4 originName:(int)a5 originPid:(int)a6 count:
{
  HIDWORD(v55) = a5;
  id v58 = a2;
  id v11 = a4;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v10, 16, 1), "objectForKeyedSubscript:", v58);
    id v13 = (SAProximateProcess *)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = a6;
    if (v13) {
      goto LABEL_7;
    }
    id v13 = objc_alloc(&OBJC_CLASS___SAProximateProcess);
    id v14 = v58;
    if (v13)
    {
      v59.receiver = v13;
      v59.super_class = (Class)&OBJC_CLASS___SAProximateProcess;
      id v13 = (SAProximateProcess *)objc_msgSendSuper2(&v59, sel_init);
      if (v13)
      {
        uint64_t v15 = [v14 copy];
        name = v13->_name;
        v13->_name = (NSString *)v15;

        uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
        pids = v13->_pids;
        v13->_pids = v17;

        uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        originProcesses = v13->_originProcesses;
        v13->_originProcesses = v19;
      }
    }

    char v21 = 1;
    objc_msgSend(objc_getProperty(a1, v22, 16, 1), "setObject:forKeyedSubscript:", v13, v14);
    if (v13)
    {
LABEL_7:
      id Property = objc_getProperty(v13, v12, 24LL, 1);
      char v21 = 0;
    }

    else
    {
      id Property = 0LL;
    }

    id v24 = (void *)MEMORY[0x189607968];
    id v25 = Property;
    [v24 numberWithInt:a3];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    char v27 = [v25 containsObject:v26];

    if ((v27 & 1) == 0)
    {
      if ((v21 & 1) != 0) {
        id v29 = 0LL;
      }
      else {
        id v29 = objc_getProperty(v13, v28, 24LL, 1);
      }
      v30 = (void *)MEMORY[0x189607968];
      id v31 = v29;
      [v30 numberWithInt:a3];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 addObject:v32];
    }

    if ((v21 & 1) != 0) {
      id v33 = 0LL;
    }
    else {
      id v33 = objc_getProperty(v13, v28, 32LL, 1);
    }
    objc_msgSend(v33, "objectForKeyedSubscript:", v11, v55);
    uint64_t v35 = (SAOriginProcess *)objc_claimAutoreleasedReturnValue();
    if (v35) {
      goto LABEL_21;
    }
    uint64_t v35 = objc_alloc(&OBJC_CLASS___SAOriginProcess);
    id v36 = v11;
    if (v35)
    {
      v59.receiver = v35;
      v59.super_class = (Class)&OBJC_CLASS___SAOriginProcess;
      uint64_t v35 = (SAOriginProcess *)objc_msgSendSuper2(&v59, sel_init);
      if (v35)
      {
        uint64_t v37 = [v36 copy];
        SEL v38 = v35->_name;
        v35->_name = (NSString *)v37;

        v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
        v40 = v35->_pids;
        v35->_pids = v39;
      }
    }

    id v42 = (v21 & 1) != 0 ? 0LL : objc_getProperty(v13, v41, 32LL, 1);
    [v42 setObject:v35 forKeyedSubscript:v36];
    if (v35)
    {
LABEL_21:
      id v43 = v11;
      id v44 = objc_getProperty(v35, v34, 24LL, 1);
      char v45 = 0;
    }

    else
    {
      id v43 = v11;
      id v44 = 0LL;
      char v45 = 1;
    }

    v46 = (void *)MEMORY[0x189607968];
    id v47 = v44;
    [v46 numberWithInt:v57];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    char v49 = [v47 containsObject:v48];

    if ((v49 & 1) == 0)
    {
      if ((v45 & 1) != 0) {
        id v51 = 0LL;
      }
      else {
        id v51 = objc_getProperty(v35, v50, 24LL, 1);
      }
      uint64_t v52 = (void *)MEMORY[0x189607968];
      id v53 = v51;
      [v52 numberWithInt:v57];
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      [v53 addObject:v54];
    }

    a1[2] += v56;
    if ((v21 & 1) == 0) {
      v13->_count += v56;
    }
    if ((v45 & 1) == 0) {
      v35->_count += v56;
    }

    id v11 = v43;
  }
}

- (void).cxx_destruct
{
}

@end