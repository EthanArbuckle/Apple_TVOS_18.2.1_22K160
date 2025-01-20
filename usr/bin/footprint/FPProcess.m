@interface FPProcess
+ (FPProcess)processWithBsdInfo:(proc_bsdinfo *)a3;
+ (FPProcess)processWithPid:(int)a3;
+ (id)_nameForBsdInfo:(proc_bsdinfo *)a3;
+ (id)allProcessesExcludingPids:(id)a3;
+ (id)childPidsForPids:(id)a3;
+ (id)pidsForStringDescriptions:(id)a3 errors:(id *)a4;
+ (id)removeIdleExitCleanProcessesFrom:(id)a3;
- (BOOL)_isAlive;
- (BOOL)_populateTask;
- (BOOL)breakDownPhysFootprint;
- (BOOL)hiddenFromDisplay;
- (BOOL)is64bit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTranslated;
- (FPProcess)init;
- (FPProcess)initWithBsdInfo:(proc_bsdinfo *)a3;
- (FPSharedCache)sharedCache;
- (NSArray)memoryRegions;
- (NSDictionary)auxData;
- (NSString)displayString;
- (NSString)name;
- (id)asNumber;
- (id)description;
- (id)errors;
- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5;
- (id)globalErrors;
- (id)warnings;
- (int)idleExitStatus;
- (int)pid;
- (int)priority;
- (unint64_t)_gatherPageSize;
- (unint64_t)hash;
- (unint64_t)pageSize;
- (void)_addGlobalError:(id)a3;
- (void)gatherData;
- (void)setDisplayString:(id)a3;
- (void)setHiddenFromDisplay:(BOOL)a3;
- (void)setIs64bit:(BOOL)a3;
- (void)setIsTranslated:(BOOL)a3;
- (void)setMemoryRegions:(id)a3;
- (void)setName:(id)a3;
- (void)setPageSize:(unint64_t)a3;
- (void)setPid:(int)a3;
- (void)setSharedCache:(id)a3;
@end

@implementation FPProcess

- (FPProcess)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___FPProcess;
  v2 = -[FPProcess init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    -[FPProcess setMemoryRegions:](v2, "setMemoryRegions:", 0LL);
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    errors = v3->_errors;
    v3->_errors = v4;

    v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    warnings = v3->_warnings;
    v3->_warnings = v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    globalErrors = v3->_globalErrors;
    v3->_globalErrors = v8;

    *(void *)&v3->_idleExitStatus = 0xFFFFFFFF00000000LL;
    v10 = v3;
  }

  return v3;
}

- (FPProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  v4 = -[FPProcess init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[FPProcess setPid:](v4, "setPid:", a3->pbi_pid);
    v5->_is64bit = (a3->pbi_flags & 0x10) != 0;
    if (!-[FPProcess _populateTask](v5, "_populateTask"))
    {
      v10 = 0LL;
      goto LABEL_6;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess _nameForBsdInfo:](&OBJC_CLASS___FPProcess, "_nameForBsdInfo:", a3));
    -[FPProcess setName:](v5, "setName:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess name](v5, "name"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [%d]",  v7,  -[FPProcess pid](v5, "pid")));
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v8;

    v5->_pageSize = -[FPProcess _gatherPageSize](v5, "_gatherPageSize");
  }

  v10 = v5;
LABEL_6:

  return v10;
}

- (unint64_t)_gatherPageSize
{
  return vm_kernel_page_size;
}

+ (FPProcess)processWithBsdInfo:(proc_bsdinfo *)a3
{
  v3 = &off_1000280B0;
  if ((a3->pbi_flags & 1) != 0) {
    v3 = off_1000280A8;
  }
  return (FPProcess *)[objc_alloc(*v3) initWithBsdInfo:a3];
}

+ (FPProcess)processWithPid:(int)a3
{
  else {
    v4 = 0LL;
  }
  return (FPProcess *)v4;
}

- (void)_addGlobalError:(id)a3
{
}

- (unint64_t)hash
{
  return self->_pid;
}

- (BOOL)isEqual:(id)a3
{
  int pid = self->_pid;
  return pid == [a3 pid];
}

- (BOOL)_populateTask
{
  return 0;
}

- (void)gatherData
{
}

- (id)globalErrors
{
  return self->_globalErrors;
}

- (id)errors
{
  return +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", self->_errors);
}

- (id)warnings
{
  return self->_warnings;
}

+ (id)_nameForBsdInfo:(proc_bsdinfo *)a3
{
  *(void *)v18 = 0x800000001LL;
  size_t __size = 0LL;
  size_t v17 = 8LL;
  if (!sysctl(v18, 2u, &__size, &v17, 0LL, 0LL))
  {
    *(void *)v18 = 0x3100000001LL;
    pbi_int pid = a3->pbi_pid;
    v4 = malloc(__size);
    if (v4)
    {
      v5 = v4;
      if (!sysctl(v18, 3u, v4, &__size, 0LL, 0LL))
      {
        size_t v6 = 0LL;
        size_t v7 = __size;
        v5[__size - 1] = 0;
        do
          size_t v8 = v6++;
        while (v7 > v8 && v5[v8]);
        if (v7 > v8)
        {
          do
          {
            size_t v9 = v6 - 1;
            int v10 = v5[v6++ - 1];
          }

          while (v7 > v9 && v10 == 0);
          if (v7 > v9)
          {
            objc_super v12 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  &v5[v6 - 2]);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v12, "lastPathComponent"));

            free(v5);
            return v13;
          }
        }
      }

      free(v5);
    }
  }

  v15 = sub_100007B7C((uint64_t)&OBJC_CLASS___FPProcess, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue(v15);
}

- (id)asNumber
{
  return +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", self->_pid);
}

+ (id)allProcessesExcludingPids:(id)a3
{
  id v3 = a3;
  v4 = (unsigned int *)sub_100007EBC(&v18);
  if (v4)
  {
    v5 = v4;
    size_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
    unint64_t v6 = v18;
    if (v18)
    {
      uint64_t v7 = 0LL;
      unsigned int v8 = 1;
      do
      {
        uint64_t v9 = v5[34 * v7 + 3];
        int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9, v17));
        unsigned __int8 v11 = [v3 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess processWithBsdInfo:](&OBJC_CLASS___FPProcess, "processWithBsdInfo:", &v5[34 * v7]));
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
            [v17 setObject:v12 forKey:v13];
          }
        }

        uint64_t v7 = v8;
      }

      while (v6 > v8++);
    }

    free(v5);
    v15 = v17;
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

+ (id)pidsForStringDescriptions:(id)a3 errors:(id *)a4
{
  id v6 = a3;
  v35 = (unsigned int *)sub_100007EBC(&v53);
  if (v35)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v36 = a4;
    if (a4) {
      v33 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    }
    else {
      v33 = 0LL;
    }
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v32 = v6;
    id obj = v6;
    id v39 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (!v39) {
      goto LABEL_44;
    }
    uint64_t v8 = v53;
    uint64_t v37 = v53;
    uint64_t v38 = *(void *)v50;
    while (1)
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        unsigned __int8 v11 = -[NSScanner initWithString:](objc_alloc(&OBJC_CLASS___NSScanner), "initWithString:", v10);
        int v48 = -1;
        unsigned int v12 = -[NSScanner scanInt:](v11, "scanInt:", &v48);
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        context = objc_autoreleasePoolPush();
        v42 = v11;
        if (v8)
        {
          v40 = i;
          char v13 = 0;
          char v14 = 0;
          v15 = v35;
          while (1)
          {
            uint64_t v16 = v15[3];
            id v17 = (id)objc_claimAutoreleasedReturnValue([a1 _nameForBsdInfo:v15]);
            if ([v10 isEqualToString:v17])
            {
              unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
              [v7 setObject:v10 forKeyedSubscript:v18];
              char v13 = 1;
            }

            else
            {
              if (![v17 containsString:v10])
              {
                if ((_DWORD)v16 == v48) {
                  unsigned int v19 = v12;
                }
                else {
                  unsigned int v19 = 0;
                }
                if (v19 == 1)
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
                  [v7 setObject:v29 forKeyedSubscript:v30];

                  i = v40;
                  goto LABEL_41;
                }

                goto LABEL_23;
              }

              unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
              [v43 setObject:v10 forKeyedSubscript:v18];
            }

            char v14 = 1;
LABEL_23:
            v15 += 34;

            if (!--v8)
            {
              if (!((v36 == 0LL) | v14 & 1))
              {
                v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unable to find pid for process matching '%@'",  v10);
                -[NSMutableArray addObject:](v33, "addObject:", v20);
              }

              i = v40;
              if ((v13 & 1) != 0) {
                goto LABEL_42;
              }
              goto LABEL_30;
            }
          }
        }

        if (v36)
        {
          v21 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unable to find pid for process matching '%@'",  v10);
          -[NSMutableArray addObject:](v33, "addObject:", v21);
        }

+ (id)childPidsForPids:(id)a3
{
  id v3 = a3;
  v4 = (char *)sub_100007EBC(&v24);
  if (v4)
  {
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v5 = (NSMutableArray *)[v3 mutableCopy];
    unint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v5)
    {
      while (1)
      {
        id v6 = v5;
        if (!-[NSMutableArray count](v5, "count", v18)) {
          break;
        }
        if (v24)
        {
          for (unint64_t i = 0LL; i < v24; ++i)
          {
            uint64_t v8 = &v4[136 * i];
            int v9 = *((_DWORD *)v8 + 4);
            uint64_t v10 = *((int *)v8 + 3);
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            __int128 v20 = 0u;
            __int128 v21 = 0u;
            unsigned __int8 v11 = v6;
            id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v21;
              while (2)
              {
                for (j = 0LL; j != v13; j = (char *)j + 1)
                {
                  if (*(void *)v21 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  if (v9 == [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) longValue])
                  {
                    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v10));
                    if (([v3 containsObject:v16] & 1) == 0
                      && ([v19 containsObject:v16] & 1) == 0)
                    {
                      -[NSMutableArray addObject:](v18, "addObject:", v16);
                    }

                    goto LABEL_19;
                  }
                }

                id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
                if (v13) {
                  continue;
                }
                break;
              }
            }

+ (id)removeIdleExitCleanProcessesFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectEnumerator]);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v10 idleExitStatus] == 2)
        {
          unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 pid]));
          [v4 removeObjectForKey:v11];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (NSDictionary)auxData
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (BOOL)_isAlive
{
  return 0;
}

- (BOOL)breakDownPhysFootprint
{
  return sub_100011D3C();
}

- (id)description
{
  uint64_t v3 = -[FPProcess pid](self, "pid");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"FPProcess[%d] %@",  v3,  v4));

  return v5;
}

- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5
{
  return 0LL;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_int pid = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)is64bit
{
  return self->_is64bit;
}

- (void)setIs64bit:(BOOL)a3
{
  self->_is64bit = a3;
}

- (BOOL)isTranslated
{
  return self->_isTranslated;
}

- (void)setIsTranslated:(BOOL)a3
{
  self->_isTranslated = a3;
}

- (FPSharedCache)sharedCache
{
  return self->_sharedCache;
}

- (void)setSharedCache:(id)a3
{
}

- (NSArray)memoryRegions
{
  return self->_memoryRegions;
}

- (void)setMemoryRegions:(id)a3
{
}

- (int)idleExitStatus
{
  return self->_idleExitStatus;
}

- (int)priority
{
  return self->_priority;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

- (BOOL)hiddenFromDisplay
{
  return self->_hiddenFromDisplay;
}

- (void)setHiddenFromDisplay:(BOOL)a3
{
  self->_hiddenFromDisplay = a3;
}

- (void).cxx_destruct
{
}

@end