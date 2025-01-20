@interface NSSet(NSKeyValueObserverRegistration)
- (uint64_t)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:;
- (uint64_t)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:;
- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:;
@end

@implementation NSSet(NSKeyValueObserverRegistration)

- (uint64_t)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:
{
  v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> addObserver:forKeyPath:options:context:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
  return -[NSSet(NSKeyValueObserverRegistration) removeObserver:forKeyPath:context:]();
}

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:
{
  v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> removeObserver:forKeyPath:context:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
  return -[NSSet(NSKeyValueObserverRegistration) removeObserver:forKeyPath:]();
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:
{
  v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> removeObserver:forKeyPath:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
  -[NSObject willChange:valuesAtIndexes:forKey:](v5, v6, v7, v8, v9);
}

@end