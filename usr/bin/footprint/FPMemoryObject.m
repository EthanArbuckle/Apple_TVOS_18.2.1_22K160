@interface FPMemoryObject
- (BOOL)containsFakeRegion;
- (BOOL)couldHaveProcessView;
- (BOOL)finalizeObject;
- (BOOL)verbose;
- (FPMemoryObject)init;
- (NSArray)memoryRegions;
- (NSDictionary)auxData;
- (NSDictionary)detailedAuxData;
- (NSString)auxDataName;
- (NSString)detailedAuxDataName;
- (NSString)detailedName;
- (NSString)fullName;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)viewForProcess:(id)a3;
- (int)ownerPid;
- (unint64_t)cleanSize;
- (unint64_t)dirtySize;
- (unint64_t)reclaimableSize;
- (unint64_t)swappedSize;
- (unint64_t)wiredSize;
- (unsigned)totalRegions;
- (void)setOwnerPid:(int)a3;
@end

@implementation FPMemoryObject

- (FPMemoryObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FPMemoryObject;
  v2 = -[FPMemoryObject init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    memoryRegions = v2->_memoryRegions;
    v2->_memoryRegions = v3;

    v2->_ownerPid = -1;
  }

  return v2;
}

- (BOOL)finalizeObject
{
  id v3 = -[NSMutableArray count](self->_memoryRegions, "count");
  if (v3 == (id)1)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
    v7 = (void *)v6;
    if (v6) {
      *(void *)(v6 + 64) = v6;
    }
    rangeList = self->_rangeList;
    self->_rangeList = 0LL;

    processMemoryRegions = self->_processMemoryRegions;
    self->_processMemoryRegions = 0LL;

    memoryRegions = self->_memoryRegions;
    self->_memoryRegions = 0LL;
  }

  else
  {
    objc_opt_self(&OBJC_CLASS___FPFootprint);
    if (byte_100038A50) {
      BOOL v5 = sub_100011D3C();
    }
    else {
      BOOL v5 = 0LL;
    }
    sub_100006A78((uint64_t)self, v5, v4);
  }

  return v3 != (id)1;
}

- (unsigned)totalRegions
{
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    LODWORD(v3) = 1;
  }

  else
  {
    id v3 = -[NSMutableArray count](self->_memoryRegions, "count");
    if (v3 == (id)1)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
      LODWORD(v3) = [v4 totalRegions];
    }
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ((*((_BYTE *)self + 8) & 1) == 0 || self->_rangeList)
  {
    uint64_t v8 = _os_assert_log(0LL, a2, a3);
    id result = (id)_os_crash(v8);
    __break(1u);
  }

  else
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___FPMemoryObject);
    v4->_dirtySize = self->_dirtySize;
    v4->_swappedSize = self->_swappedSize;
    v4->_cleanSize = self->_cleanSize;
    v4->_wiredSize = self->_wiredSize;
    v4->_reclaimableSize = self->_reclaimableSize;
    objc_storeStrong((id *)&v4->_memoryRegions, self->_memoryRegions);
    char v5 = *((_BYTE *)v4 + 8) & 0xFE | *((_BYTE *)self + 8) & 1;
    *((_BYTE *)v4 + 8) = v5;
    *((_BYTE *)v4 + 8) = v5 & 0xFD | *((_BYTE *)self + 8) & 2;
    v4->_ownerPid = self->_ownerPid;
    processMemoryRegions = v4->_processMemoryRegions;
    v4->_processMemoryRegions = 0LL;

    return v4;
  }

  return result;
}

- (BOOL)couldHaveProcessView
{
  return -[NSMutableDictionary count](self->_processMemoryRegions, "count") || self->_ownerPid != -1;
}

- (id)viewForProcess:(id)a3
{
  id v4 = a3;
  char v5 = self;
  if (-[NSMutableDictionary count](v5->_processMemoryRegions, "count"))
  {
    processMemoryRegions = v5->_processMemoryRegions;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 pid]));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](processMemoryRegions, "objectForKeyedSubscript:", v7));

    if (!v8) {
      goto LABEL_19;
    }
    v9 = objc_alloc_init(&OBJC_CLASS___FPMemoryObject);

    v9->_ownerPid = v5->_ownerPid;
    id v10 = [v4 pageSize];
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          sub_1000067F0((uint64_t)v9, *(void **)(*((void *)&v20 + 1) + 8LL * (void)v15), (uint64_t)v10, 0LL);
          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v13);
    }

    id v16 = [v4 breakDownPhysFootprint:(void)v20];
    sub_100006A78((uint64_t)v9, (uint64_t)v16, v17);
  }

  else
  {
    v9 = v5;
    if ((*((_BYTE *)v5 + 8) & 2) != 0)
    {
      v9 = (FPMemoryObject *)-[FPMemoryObject copy](v5, "copy");

      *((_BYTE *)v9 + 8) |= 4u;
    }
  }

  if (v5->_ownerPid != -1 && [v4 pid] != v5->_ownerPid)
  {
    if (v9 == v5)
    {
      v9 = (FPMemoryObject *)-[FPMemoryObject copy](v5, "copy");
    }

    v9->_dirtySize = 0LL;
    v9->_swappedSize = 0LL;
    v9->_cleanSize += v5->_swappedSize + v5->_dirtySize;
  }

  char v5 = v9;
LABEL_19:
  v18 = v5;

  return v18;
}

- (BOOL)containsFakeRegion
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = self->_memoryRegions;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8LL * (void)i);
        if (v6 && *(_DWORD *)(v6 + 12) == -1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }

      id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (NSString)name
{
  id v2 = sub_100006FCC((uint64_t)self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  return (NSString *)v4;
}

- (NSString)detailedName
{
  id v2 = sub_100006FCC((uint64_t)self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 detailedName]);

  return (NSString *)v4;
}

- (NSString)fullName
{
  id v2 = sub_100006FCC((uint64_t)self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fullName]);

  return (NSString *)v4;
}

- (BOOL)verbose
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  unsigned __int8 v3 = [v2 verbose];

  return v3;
}

- (NSDictionary)auxData
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 auxData]);

  return (NSDictionary *)v3;
}

- (NSDictionary)detailedAuxData
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 detailedAuxData]);

  return (NSDictionary *)v3;
}

- (NSString)auxDataName
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 auxDataName]);

  return (NSString *)v3;
}

- (NSString)detailedAuxDataName
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_memoryRegions, "firstObject"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 detailedAuxDataName]);

  return (NSString *)v3;
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (unint64_t)swappedSize
{
  return self->_swappedSize;
}

- (unint64_t)cleanSize
{
  return self->_cleanSize;
}

- (unint64_t)reclaimableSize
{
  return self->_reclaimableSize;
}

- (unint64_t)wiredSize
{
  return self->_wiredSize;
}

- (NSArray)memoryRegions
{
  return &self->_memoryRegions->super;
}

- (int)ownerPid
{
  return self->_ownerPid;
}

- (void)setOwnerPid:(int)a3
{
  self->_ownerPid = a3;
}

- (void).cxx_destruct
{
}

@end