@interface _NSProxyWrapperMutableOrderedSet
- (void)addObject:(id)a3;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableOrderedSet:(void *)a5 mutationMethods:;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)intersectOrderedSet:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusOrderedSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(id)a3;
- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (void)unionOrderedSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation _NSProxyWrapperMutableOrderedSet

- (void)dealloc
{
  self->_mutationMethods = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSProxyWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet dealloc](&v3, sel_dealloc);
}

- (void)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableOrderedSet:(void *)a5 mutationMethods:
{
  if (!a1) {
    return 0LL;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_CLASS____NSProxyWrapperMutableOrderedSet;
  v6 = objc_msgSendSuper2(&v8, sel_initWithContainer_key_mutableOrderedSet_, a2, a3, a4);
  if (v6) {
    v6[4] = a5;
  }
  return v6;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v11 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->super._mutableOrderedSet, "containsObject:")
    && -[NSMutableOrderedSet _shouldProcessKVOChange]( self->super._mutableOrderedSet,  "_shouldProcessKVOChange"))
  {
    int v7 = 1;
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:]( self->super._mutableOrderedSet,  "_setProcessingIdempotentKVO:",  1LL);
  }

  else
  {
    int v7 = 0;
  }

  insertObjectMethod = self->_mutationMethods->_insertObjectMethod;
  if (insertObjectMethod)
  {
    method_invoke(self->super._container, insertObjectMethod, a3, a4);
    if (!v7) {
      return;
    }
  }

  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:&v11 count:1];
    v10 = (void *)[objc_alloc(MEMORY[0x1896078D0]) initWithIndex:a4];
    method_invoke(self->super._container, self->_mutationMethods->_insertMethod, v9, v10);

    if (!v7) {
      return;
    }
  }

  -[NSMutableOrderedSet _setProcessingIdempotentKVO:]( self->super._mutableOrderedSet,  "_setProcessingIdempotentKVO:",  0LL);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  removeObjectMethod = self->_mutationMethods->_removeObjectMethod;
  if (removeObjectMethod)
  {
    method_invoke(self->super._container, removeObjectMethod, a3);
  }

  else
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1896078D0]) initWithIndex:a3];
    method_invoke(self->super._container, self->_mutationMethods->_removeMethod, v5);
  }

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v11 = a4;
  if ((objc_msgSend( a4,  "isEqual:",  -[NSMutableOrderedSet objectAtIndex:](self->super._mutableOrderedSet, "objectAtIndex:")) & 1) == 0)
  {
    mutationMethods = self->_mutationMethods;
    replaceObjectMethod = mutationMethods->_replaceObjectMethod;
    if (replaceObjectMethod)
    {
      method_invoke(self->super._container, replaceObjectMethod, a3, a4);
    }

    else if (mutationMethods->_replaceMethod)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:&v11 count:1];
      v10 = (void *)[objc_alloc(MEMORY[0x1896078D0]) initWithIndex:a3];
      method_invoke(self->super._container, self->_mutationMethods->_replaceMethod, v10, v9);
    }

    else
    {
      -[_NSProxyWrapperMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", a3);
      -[_NSProxyWrapperMutableOrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", a4, a3);
    }
  }

- (void)addObject:(id)a3
{
  id v8 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->super._mutableOrderedSet, "containsObject:") & 1) == 0)
  {
    insertObjectMethod = self->_mutationMethods->_insertObjectMethod;
    if (insertObjectMethod)
    {
      method_invoke( self->super._container,  insertObjectMethod,  a3,  -[NSMutableOrderedSet count](self->super._mutableOrderedSet, "count"));
    }

    else
    {
      v6 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:&v8 count:1];
      int v7 = (void *)objc_msgSend( objc_alloc(MEMORY[0x1896078D0]),  "initWithIndex:",  -[NSMutableOrderedSet count](self->super._mutableOrderedSet, "count"));
      method_invoke(self->super._container, self->_mutationMethods->_insertMethod, v6, v7);
    }
  }

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v20[1] = *MEMORY[0x1895F89C0];
  MEMORY[0x1895F8858](self);
  v9 = (char *)v20 - v8;
  if (v10 >= 0x201)
  {
    v9 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)v20 - v8, 8 * v7);
    if (!a4) {
      return;
    }
  }

  uint64_t v11 = 0LL;
  unint64_t v12 = a4;
  do
  {
    v13 = *a3;
    if ((-[NSMutableOrderedSet containsObject:](self->super._mutableOrderedSet, "containsObject:", *a3) & 1) == 0) {
      *(void *)&v9[8 * v11++] = v13;
    }
    ++a3;
    --v12;
  }

  while (v12);
  if (v11)
  {
    if (self->_mutationMethods->_insertMethod)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v9 count:v11];
      v15 = (void *)objc_msgSend( objc_alloc(MEMORY[0x1896078D0]),  "initWithIndexesInRange:",  -[NSMutableOrderedSet count](self->super._mutableOrderedSet, "count"),  v11);
      method_invoke(self->super._container, self->_mutationMethods->_insertMethod, v14, v15);
    }

    else
    {
      uint64_t v16 = -[NSMutableOrderedSet count](self->super._mutableOrderedSet, "count");
      v17 = v9;
      do
      {
        uint64_t v18 = *(void *)v17;
        v17 += 8;
        uint64_t v19 = v16 + 1;
        method_invoke(self->super._container, self->_mutationMethods->_insertObjectMethod, v18);
        uint64_t v16 = v19;
        --v11;
      }

      while (v11);
    }
  }

  if (a4 >= 0x201) {
    NSZoneFree(0LL, v9);
  }
}

- (void)addObjectsFromArray:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = MEMORY[0x1895F8858](v5);
    v9 = (char *)v10 - v8;
    if (v7 > 0x200) {
      v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v7);
    }
    objc_msgSend(a3, "getObjects:range:", v9, 0, v6);
    -[_NSProxyWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201) {
      NSZoneFree(0LL, v9);
    }
  }

- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (a4)
  {
    unint64_t v6 = a4;
    unint64_t v7 = a3;
    if (self->_mutationMethods->_insertMethod)
    {
      id v11 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:a3 count:a4];
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1896078D0]), "initWithIndexesInRange:", a5, v6);
      method_invoke(self->super._container, self->_mutationMethods->_insertMethod, v11, v9);
    }

    else
    {
      do
      {
        uint64_t v10 = (uint64_t)*v7++;
        method_invoke(self->super._container, self->_mutationMethods->_insertObjectMethod, v10, a5++);
        --v6;
      }

      while (v6);
    }
  }

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    insertMethod = self->_mutationMethods->_insertMethod;
    if (insertMethod)
    {
      method_invoke(self->super._container, insertMethod, a3, a4);
    }

    else
    {
      unint64_t v8 = [a3 count];
      unint64_t v9 = v8;
      if (v8 <= 1) {
        uint64_t v10 = 1LL;
      }
      else {
        uint64_t v10 = v8;
      }
      if (v8 >= 0x201) {
        uint64_t v11 = 1LL;
      }
      else {
        uint64_t v11 = v10;
      }
      unint64_t v12 = (char *)&v18 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v19 = &v18;
      if (v8 > 0x200) {
        unint64_t v12 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v18 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v10);
      }
      objc_msgSend(a4, "getIndexes:maxCount:inIndexRange:", v12, v9, 0, v9, v19);
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      uint64_t v13 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = 0LL;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(a3);
            }
            method_invoke( self->super._container,  self->_mutationMethods->_insertObjectMethod,  *(void *)(*((void *)&v20 + 1) + 8 * i),  *(void *)&v12[8 * v15 + 8 * i]);
          }

          uint64_t v14 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
          v15 += i;
        }

        while (v14);
      }

      if (v18 >= 0x201) {
        NSZoneFree(0LL, v12);
      }
    }
  }

- (void)removeObjectsInRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger location = a3.location;
    if (self->_mutationMethods->_removeMethod)
    {
      id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1896078D0]), "initWithIndexesInRange:", a3.location, a3.length);
      method_invoke(self->super._container, self->_mutationMethods->_removeMethod, v6);
    }

    else
    {
      NSUInteger v5 = a3.location + a3.length;
      if (a3.location + a3.length > a3.location)
      {
        do
          method_invoke(self->super._container, self->_mutationMethods->_removeObjectMethod, --v5);
        while (v5 > location);
      }
    }
  }

- (void)removeObjectsAtIndexes:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    removeMethod = self->_mutationMethods->_removeMethod;
    if (removeMethod)
    {
      method_invoke(self->super._container, removeMethod, a3);
      return;
    }

    unint64_t v6 = [a3 count];
    unint64_t v7 = v6;
    unint64_t v8 = v6 - 1;
    if (v6 <= 1) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = v6;
    }
    if (v6 >= 0x201) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v11 = (char *)v12 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v6 >= 0x201)
    {
      uint64_t v11 = (char *)NSAllocateScannedUncollectable();
      [a3 getIndexes:v11 maxCount:v7 inIndexRange:0];
    }

    else
    {
      bzero((char *)v12 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v9);
      [a3 getIndexes:v11 maxCount:v7 inIndexRange:0];
      if (!v7) {
        return;
      }
    }

    do
      method_invoke(self->super._container, self->_mutationMethods->_removeObjectMethod, *(void *)&v11[8 * v8--]);
    while (v8 != -1LL);
    if (v7 >= 0x201) {
      NSZoneFree(0LL, v11);
    }
  }

- (void)removeAllObjects
{
  uint64_t v3 = -[NSMutableOrderedSet count](self->super._mutableOrderedSet, "count");
  if (v3)
  {
    if (self->_mutationMethods->_removeMethod)
    {
      id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1896078D0]), "initWithIndexesInRange:", 0, v3);
      method_invoke(self->super._container, self->_mutationMethods->_removeMethod, v5);
    }

    else
    {
      uint64_t v4 = v3 - 1;
      do
        method_invoke(self->super._container, self->_mutationMethods->_removeObjectMethod, v4--);
      while (v4 != -1);
    }
  }

- (void)removeObjectsInArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = -[NSMutableOrderedSet indexOfObject:]( self->super._mutableOrderedSet,  "indexOfObject:",  *(void *)(*((void *)&v11 + 1) + 8 * v9));
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v10];
          }
          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    if ([v5 count]) {
      -[_NSProxyWrapperMutableOrderedSet removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", v5);
    }
  }

- (void)intersectOrderedSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    mutableOrderedSet = self->super._mutableOrderedSet;
    uint64_t v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
          if ([a3 indexOfObject:*(void *)(*((void *)&v12 + 1) + 8 * i)] == 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v9 + i];
          }
        }

        uint64_t v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        v9 += i;
      }

      while (v8);
    }

    -[_NSProxyWrapperMutableOrderedSet removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", v5);
  }

- (void)minusOrderedSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = -[NSMutableOrderedSet indexOfObject:]( self->super._mutableOrderedSet,  "indexOfObject:",  *(void *)(*((void *)&v11 + 1) + 8 * v9));
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v10];
          }
          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    -[_NSProxyWrapperMutableOrderedSet removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", v5);
  }

- (void)unionOrderedSet:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    if (v5 >= 0x201) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v9 = (char *)v10 - v8;
    if (v5 > 0x200) {
      uint64_t v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v5);
    }
    [a3 getObjects:v9];
    -[_NSProxyWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201) {
      NSZoneFree(0LL, v9);
    }
  }

- (void)intersectSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    mutableOrderedSet = self->super._mutableOrderedSet;
    uint64_t v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
          if (([a3 containsObject:*(void *)(*((void *)&v12 + 1) + 8 * i)] & 1) == 0) {
            [v5 addIndex:v9 + i];
          }
        }

        uint64_t v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        v9 += i;
      }

      while (v8);
    }

    -[_NSProxyWrapperMutableOrderedSet removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", v5);
  }

- (void)minusSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    mutableOrderedSet = self->super._mutableOrderedSet;
    uint64_t v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
        }

        uint64_t v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        v9 += i;
      }

      while (v8);
    }

    -[_NSProxyWrapperMutableOrderedSet removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", v5);
  }

- (void)unionSet:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    if (v5 >= 0x201) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v9 = (char *)v10 - v8;
    if (v5 > 0x200) {
      uint64_t v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v5);
    }
    [a3 getObjects:v9];
    -[_NSProxyWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201) {
      NSZoneFree(0LL, v9);
    }
  }

- (void)sortUsingComparator:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSProxyWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet sortUsingComparator:](&v3, sel_sortUsingComparator_, a3);
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSProxyWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet sortWithOptions:usingComparator:]( &v4,  sel_sortWithOptions_usingComparator_,  a3,  a4);
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSProxyWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet sortRange:options:usingComparator:]( &v5,  sel_sortRange_options_usingComparator_,  a3.location,  a3.length,  a4,  a5);
}

@end