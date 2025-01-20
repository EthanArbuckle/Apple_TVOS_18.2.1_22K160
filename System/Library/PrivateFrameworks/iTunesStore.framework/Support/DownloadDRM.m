@interface DownloadDRM
- (BOOL)isDRMFree;
- (DownloadDRM)init;
- (DownloadDRM)initWithSinfArray:(id)a3;
- (NSArray)sinfs;
- (SinfsArray)pinfsArray;
- (SinfsArray)sinfsArray;
- (id)_sinfsArrayWithDataKey:(id)a3;
- (id)firstDataForSinfDataKey:(id)a3;
- (id)sinfForIdentifier:(int64_t)a3;
- (void)dealloc;
@end

@implementation DownloadDRM

- (DownloadDRM)init
{
  return -[DownloadDRM initWithSinfArray:](self, "initWithSinfArray:", 0LL);
}

- (DownloadDRM)initWithSinfArray:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DownloadDRM;
  v4 = -[DownloadDRM init](&v17, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(a3);
          }
          v10 = -[DownloadSinf initWithDictionary:]( objc_alloc(&OBJC_CLASS___DownloadSinf),  "initWithDictionary:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9));
          if (v10)
          {
            v11 = v10;
            -[NSMutableArray addObject:](v5, "addObject:", v10);
          }

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v7);
    }

    v4->_sinfs = &v5->super;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadDRM;
  -[DownloadDRM dealloc](&v3, "dealloc");
}

- (id)firstDataForSinfDataKey:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  sinfs = self->_sinfs;
  id result = -[NSArray countByEnumeratingWithState:objects:count:]( sinfs,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(sinfs);
      }
      id result = [*(id *)(*((void *)&v9 + 1) + 8 * v8) dataForSinfDataKey:a3];
      if (result) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id result = -[NSArray countByEnumeratingWithState:objects:count:]( sinfs,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
        id v6 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }

  return result;
}

- (BOOL)isDRMFree
{
  return -[DownloadDRM firstDataForSinfDataKey:](self, "firstDataForSinfDataKey:", off_1003A2498) != 0LL;
}

- (SinfsArray)pinfsArray
{
  return (SinfsArray *)-[DownloadDRM _sinfsArrayWithDataKey:](self, "_sinfsArrayWithDataKey:", off_1003A24A0);
}

- (id)sinfForIdentifier:(int64_t)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  sinfs = self->_sinfs;
  id result = -[NSArray countByEnumeratingWithState:objects:count:]( sinfs,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(sinfs);
        }
        __int128 v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v8);
        if ([v9 identifier] == (id)a3) {
          return v9;
        }
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id result = -[NSArray countByEnumeratingWithState:objects:count:]( sinfs,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (SinfsArray)sinfsArray
{
  return (SinfsArray *)-[DownloadDRM _sinfsArrayWithDataKey:](self, "_sinfsArrayWithDataKey:", off_1003A24A8);
}

- (id)_sinfsArrayWithDataKey:(id)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = -[DownloadDRM sinfs](self, "sinfs");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) dataForSinfDataKey:a3];
        if (v11) {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }
        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }

  if (-[NSMutableArray count](v5, "count")) {
    __int128 v12 = -[SinfsArray initWithSINFs:](objc_alloc(&OBJC_CLASS___SinfsArray), "initWithSINFs:", v5);
  }
  else {
    __int128 v12 = 0LL;
  }

  return v12;
}

@end