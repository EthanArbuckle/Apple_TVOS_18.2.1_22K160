@interface APSDNSCacheEntry
- (APSDNSCacheEntry)initWithHostname:(id)a3;
- (NSMutableArray)cachedIPAddresses;
- (NSString)hostname;
- (id)getAddressListForHostname:(id)a3 now:(id)a4 addressFamily:(unint64_t)a5;
- (void)addCacheIPAddress:(id)a3 addressFamily:(unint64_t)a4 timeToLive:(double)a5;
@end

@implementation APSDNSCacheEntry

- (APSDNSCacheEntry)initWithHostname:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___APSDNSCacheEntry;
  v6 = -[APSDNSCacheEntry init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hostname, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    cachedIPAddresses = v7->_cachedIPAddresses;
    v7->_cachedIPAddresses = v8;
  }

  return v7;
}

- (void)addCacheIPAddress:(id)a3 addressFamily:(unint64_t)a4 timeToLive:(double)a5
{
  id v8 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v9 = self->_cachedIPAddresses;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (!v10)
  {

LABEL_15:
    v18 = -[APSDNSCacheIPAddress initWithIPAddress:addressFamily:timeToLive:]( objc_alloc(&OBJC_CLASS___APSDNSCacheIPAddress),  "initWithIPAddress:addressFamily:timeToLive:",  v8,  a4,  a5);
    -[NSMutableArray addObject:](self->_cachedIPAddresses, "addObject:", v18);

    goto LABEL_16;
  }

  id v11 = v10;
  v19 = self;
  char v12 = 0;
  uint64_t v13 = *(void *)v21;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 ipAddress]);
      if ([v16 isEqualToString:v8])
      {
        id v17 = [v15 addressFamily];

        if (v17 == (id)a4)
        {
          [v15 updateExpirationTime:a5];
          char v12 = 1;
        }
      }

      else
      {
      }
    }

    id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  }

  while (v11);

  self = v19;
  if ((v12 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_16:
}

- (id)getAddressListForHostname:(id)a3 now:(id)a4 addressFamily:(unint64_t)a5
{
  id v8 = a3;
  id v23 = a4;
  if ([v8 isEqualToString:self->_hostname])
  {
    __int128 v21 = self;
    id v22 = v8;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v9 = self->_cachedIPAddresses;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    if (v10)
    {
      id v11 = v10;
      char v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          if ([v16 addressFamily] == (id)a5)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 expirationTime]);
            id v18 = [v23 compare:v17];

            if (v18 == (id)-1LL)
            {
              if (!v12) {
                char v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
              v19 = (void *)objc_claimAutoreleasedReturnValue([v16 ipAddress]);
              -[NSMutableArray addObject:](v12, "addObject:", v19);
            }

            else
            {
              if (!v13) {
                uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
              -[NSMutableArray addObject:](v13, "addObject:", v16);
            }
          }
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      }

      while (v11);
    }

    else
    {
      char v12 = 0LL;
      uint64_t v13 = 0LL;
    }

    -[NSMutableArray removeObjectsInArray:](v21->_cachedIPAddresses, "removeObjectsInArray:", v13);
    id v8 = v22;
  }

  else
  {
    char v12 = 0LL;
  }

  return v12;
}

- (NSString)hostname
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSMutableArray)cachedIPAddresses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end