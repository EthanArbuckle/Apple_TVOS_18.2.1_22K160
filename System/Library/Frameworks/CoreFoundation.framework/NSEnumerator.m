@interface NSEnumerator
- (NSArray)allObjects;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation NSEnumerator

- (NSArray)allObjects
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v3 = +[NSArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unint64_t v4 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        -[NSArray addObject:](v3, "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * v7++));
      }

      while (v5 != v7);
      unint64_t v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0 == -1LL) {
    return 0LL;
  }
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_5;
  }
  unint64_t result = -[NSEnumerator nextObject](self, "nextObject");
  if (result)
  {
    a3->var1 = a4;
    *a4 = (id)result;
    unint64_t v8 = a3->var0 + 1;
    unint64_t result = 1LL;
  }

  else
  {
    unint64_t v8 = -1LL;
  }

  a3->var0 = v8;
  return result;
}

- (id)nextObject
{
  v3 = __CFLookUpClass("NSEnumerator");
  __CFRequireConcreteImplementation(v3, (uint64_t)self);
  return 0LL;
}

@end