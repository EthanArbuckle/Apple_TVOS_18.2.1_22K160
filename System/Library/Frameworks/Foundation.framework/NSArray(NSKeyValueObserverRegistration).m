@interface NSArray(NSKeyValueObserverRegistration)
- (uint64_t)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:;
- (uint64_t)addObserver:()NSKeyValueObserverRegistration toObjectsAtIndexes:forKeyPath:options:context:;
- (uint64_t)removeObserver:()NSKeyValueObserverRegistration forKeyPath:;
- (uint64_t)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:;
- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:;
- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:context:;
@end

@implementation NSArray(NSKeyValueObserverRegistration)

- (uint64_t)addObserver:()NSKeyValueObserverRegistration toObjectsAtIndexes:forKeyPath:options:context:
{
  uint64_t v13 = [a4 firstIndex];
  v14 = 0LL;
  v15 = 0LL;
  while (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    Class = object_getClass((id)[a1 objectAtIndex:v13]);
    v17 = Class;
    if (Class != v15)
    {
      v14 = NSKeyValuePropertyForIsaAndKeyPath(Class, a5);
      v15 = v17;
    }

    objc_msgSend( (id)objc_msgSend(a1, "objectAtIndex:", v13),  "_addObserver:forProperty:options:context:",  a3,  v14,  a6,  a7);
    uint64_t v13 = [a4 indexGreaterThanIndex:v13];
  }

  return os_unfair_recursive_lock_unlock();
}

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:context:
{
  uint64_t v11 = _CFGetTSD();
  if (!v11)
  {
    v12 = malloc_default_zone();
    uint64_t v11 = (uint64_t)malloc_zone_calloc(v12, 1uLL, 0x58uLL);
    _CFSetTSD();
  }

  uint64_t v21 = *(void *)(v11 + 32);
  uint64_t v22 = *(void *)(v11 + 40);
  uint64_t v23 = *(void *)(v11 + 48);
  uint64_t v24 = *(void *)(v11 + 56);
  uint64_t v25 = *(void *)(v11 + 64);
  char v26 = *(_BYTE *)(v11 + 72);
  os_unfair_recursive_lock_lock_with_options();
  *(void *)(v11 + 40) = a3;
  *(void *)(v11 + 48) = a5;
  uint64_t v13 = a5;
  *(void *)(v11 + 56) = 0LL;
  *(void *)(v11 + 64) = a6;
  *(_BYTE *)(v11 + 72) = 1;
  uint64_t v14 = [a4 firstIndex];
  v15 = 0LL;
  v16 = 0LL;
  while (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)[a1 objectAtIndex:v14];
    Class = object_getClass(v17);
    v19 = Class;
    if (Class != v15)
    {
      v16 = NSKeyValuePropertyForIsaAndKeyPath(Class, v13);
      v15 = v19;
    }

    *(void *)(v11 + 32) = v17;
    objc_msgSend(v17, "_removeObserver:forProperty:", a3, v16, v21, v22, v23, v24, v25);
    uint64_t v14 = [a4 indexGreaterThanIndex:v14];
  }

  uint64_t result = os_unfair_recursive_lock_unlock();
  *(void *)(v11 + 32) = v21;
  *(void *)(v11 + 40) = v22;
  *(void *)(v11 + 48) = v23;
  *(void *)(v11 + 56) = v24;
  *(void *)(v11 + 64) = v25;
  *(_BYTE *)(v11 + 72) = v26;
  return result;
}

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:
{
  uint64_t v9 = [a4 firstIndex];
  v10 = 0LL;
  uint64_t v11 = 0LL;
  while (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)[a1 objectAtIndex:v9];
    Class = object_getClass(v12);
    uint64_t v14 = Class;
    if (Class != v11)
    {
      v10 = NSKeyValuePropertyForIsaAndKeyPath(Class, a5);
      uint64_t v11 = v14;
    }

    [v12 _removeObserver:a3 forProperty:v10];
    uint64_t v9 = [a4 indexGreaterThanIndex:v9];
  }

  return os_unfair_recursive_lock_unlock();
}

- (uint64_t)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:
{
  v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> addObserver:forKeyPath:options:context:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
  return -[NSArray(NSKeyValueObserverRegistration) removeObserver:forKeyPath:context:]();
}

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:
{
  v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> removeObserver:forKeyPath:context:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
  return -[NSArray(NSKeyValueObserverRegistration) removeObserver:forKeyPath:]();
}

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration forKeyPath:
{
  v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> removeObserver:forKeyPath:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
  return -[NSOrderedSet(NSKeyValueObserverRegistration) addObserver:forKeyPath:options:context:]();
}

@end