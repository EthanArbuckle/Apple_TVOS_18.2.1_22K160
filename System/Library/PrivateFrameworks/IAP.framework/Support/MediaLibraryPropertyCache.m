@interface MediaLibraryPropertyCache
- (MediaLibraryPropertyCache)init;
- (NSArray)collections;
- (NSNumber)globalCount;
- (NSNumber)itemCount;
- (NSString)itemProperty;
- (id)description;
- (id)initForProperty:(id)a3;
- (id)itemNamesForRange:(_NSRange)a3;
- (void)dealloc;
- (void)removeNonGlobalCache;
- (void)setCollections:(id)a3;
- (void)setGlobalCount:(id)a3;
- (void)setItemCount:(id)a3;
- (void)setItemNames:(id)a3 forRange:(_NSRange)a4;
@end

@implementation MediaLibraryPropertyCache

- (id)description
{
  if ((((_BYTE)self + 16) & 7) == 0
    && (((_BYTE)self + 56) & 7) == 0
    && (((_BYTE)self + 8) & 7) == 0
    && (((_BYTE)self + 24) & 7) == 0
    && (((_BYTE)self + 32) & 7) == 0
    && (((_BYTE)self + 40) & 7) == 0)
  {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MediaLibraryPropertyCache %hhx> itemProperty=%@ collections=%hhx globalCount=%@ itemCount=%@ itemNamesRange=(%lu,%lu)",  self,  *((void *)self + 2),  *((void *)self + 7),  *((void *)self + 1),  *((void *)self + 3),  *((void *)self + 4),  *((void *)self + 5));
  }

  __break(0x5516u);
  return self;
}

- (MediaLibraryPropertyCache)init
{
  return 0LL;
}

- (id)initForProperty:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MediaLibraryPropertyCache;
  id result = -[MediaLibraryPropertyCache init](&v6, "init");
  v5 = result;
  if (!result) {
    return v5;
  }
  if ((((_BYTE)result + 16) & 7) == 0)
  {
    *((void *)result + 2) = a3;
    if ((((_BYTE)result + 32) & 7) == 0)
    {
      *((void *)result + 4) = 0LL;
      if ((((_BYTE)result + 40) & 7) == 0)
      {
        *((void *)result + 5) = 0LL;
        id result = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1024LL);
        if (((unint64_t)(v5 + 6) & 7) == 0)
        {
          v5[6] = result;
          return v5;
        }
      }
    }
  }

  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  if ((((_BYTE)self + 8) & 7) != 0
    || (self->_globalCount, (((_BYTE)self + 16) & 7) != 0)
    || (self->_itemProperty, (((_BYTE)self + 24) & 7) != 0)
    || (self->_itemCount, (((_BYTE)self + 48) & 7) != 0)
    || (self->_itemNames, (((_BYTE)self + 56) & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {

    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___MediaLibraryPropertyCache;
    -[MediaLibraryPropertyCache dealloc](&v3, "dealloc");
  }

- (void)removeNonGlobalCache
{
  if ((((_BYTE)self + 24) & 7) != 0
    || (self->_itemCount, self->_itemCount = 0LL, (((int)self + 48) & 7LL) != 0)
    || (-[NSMutableArray removeAllObjects](self->_itemNames, "removeAllObjects"), (((_BYTE)self + 32) & 7) != 0)
    || (self->_itemNamesRange.location = 0LL, (((_BYTE)self + 40) & 7) != 0)
    || (self->_itemNamesRange.length = 0LL,
        p_collections = &self->_collections,
        (p_collections & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {

    *p_collections = 0LL;
  }

- (id)itemNamesForRange:(_NSRange)a3
{
  objc_super v3 = (NSUInteger *)((char *)self + 32);
  NSUInteger location = a3.location;
  NSUInteger v5 = *v3;
  if (a3.location < *v3) {
    return 0LL;
  }
  NSUInteger length = a3.length;
  if (__CFADD__(a3.location, a3.length)) {
    goto LABEL_17;
  }
  v7 = (char *)self;
  uint64_t v8 = *((void *)self + 5);
  BOOL v9 = __CFADD__(v5, v8);
  NSUInteger v10 = v5 + v8;
  if (v9)
  {
LABEL_17:
    __break(0x5500u);
LABEL_18:
    __break(0x5515u);
    goto LABEL_19;
  }

  if (a3.location + a3.length > v10) {
    return 0LL;
  }
  self = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", a3.length);
  id v11 = self;
  if (!length) {
    return v11;
  }
  v12 = (id *)(v7 + 48);
  if ((v12 & 7) == 0)
  {
    uint64_t v13 = 0LL;
    while (1)
    {
      NSUInteger v14 = location - *v3;
      if (location < *v3) {
        goto LABEL_18;
      }
      if (__CFADD__(v14, v13)) {
        goto LABEL_17;
      }
      self = objc_msgSend(v11, "addObject:", objc_msgSend(*v12, "objectAtIndex:", v14 + v13));
      BOOL v9 = __CFADD__((_DWORD)v13, 1);
      uint64_t v13 = (v13 + 1);
      if (v9) {
        goto LABEL_17;
      }
    }
  }

- (void)setItemNames:(id)a3 forRange:(_NSRange)a4
{
  p_itemNames = &self->_itemNames;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = self;
  self = (MediaLibraryPropertyCache *)-[NSMutableArray count](*p_itemNames, "count");
  if (self)
  {
    NSUInteger v9 = v8->_itemNamesRange.location;
    p_NSUInteger length = &v8->_itemNamesRange.length;
    NSUInteger v11 = v8->_itemNamesRange.length;
    BOOL v12 = __CFADD__(v9, v11);
    NSUInteger v13 = v9 + v11;
    if (v12) {
      goto LABEL_22;
    }
    if (location == v13)
    {
      if (((((_BYTE)v8 + 32) | p_length) & 7) == 0)
      {
        BOOL v12 = __CFADD__(v11, length);
        NSUInteger v14 = v11 + length;
        if (!v12)
        {
          *p_NSUInteger length = v14;
          -[NSMutableArray addObjectsFromArray:](*p_itemNames, "addObjectsFromArray:", a3);
          return;
        }

        goto LABEL_22;
      }

      goto LABEL_21;
    }
  }

  self = (MediaLibraryPropertyCache *)-[NSMutableArray count](*p_itemNames, "count");
  if (!self)
  {
LABEL_18:
    if ((((int)v8 + 32) & 7LL) == 0)
    {
      v8->_itemNamesRange.NSUInteger location = location;
      if (((unint64_t)&v8->_itemNamesRange.length & 7) == 0)
      {
        v8->_itemNamesRange.NSUInteger length = length;
        -[NSMutableArray setArray:](*p_itemNames, "setArray:", a3);
        return;
      }
    }

    goto LABEL_21;
  }

  p_itemNamesRange = &v8->_itemNamesRange;
  if (((unint64_t)&v8->_itemNamesRange & 7) != 0)
  {
LABEL_21:
    __break(0x5516u);
    goto LABEL_22;
  }

  if (__CFADD__(location, length))
  {
LABEL_22:
    __break(0x5500u);
    goto LABEL_23;
  }

  if (p_itemNamesRange->location != location + length) {
    goto LABEL_18;
  }
  v16 = &v8->_itemNamesRange.length;
  NSUInteger v17 = length + *v16;
  if (__CFADD__(length, *v16)) {
    goto LABEL_22;
  }
  p_itemNamesRange->NSUInteger location = location;
  NSUInteger *v16 = v17;
  self = (MediaLibraryPropertyCache *)[a3 count];
  v18 = (char *)&self[-1]._collections + 7;
  if (__OFSUB__(self, 1LL))
  {
LABEL_23:
    __break(0x5515u);
    -[MediaLibraryPropertyCache setArray:](self, "setArray:", a3);
    return;
  }

  if (((unint64_t)v18 & 0x8000000000000000LL) == 0)
  {
    do
      -[NSMutableArray insertObject:atIndex:]( *p_itemNames,  "insertObject:atIndex:",  [a3 objectAtIndex:v18--],  0);
    while (v18 != (char *)-1LL);
  }

- (NSString)itemProperty
{
  return self->_itemProperty;
}

- (NSNumber)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(id)a3
{
}

- (NSArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
}

- (NSNumber)globalCount
{
  return self->_globalCount;
}

- (void)setGlobalCount:(id)a3
{
}

@end