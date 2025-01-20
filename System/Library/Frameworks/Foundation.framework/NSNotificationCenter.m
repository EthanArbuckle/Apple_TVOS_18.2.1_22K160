@interface NSNotificationCenter
+ (NSNotificationCenter)defaultCenter;
+ (id)_defaultCenterWithoutCreating;
+ (void)load;
- (BOOL)isEmpty;
- (NSNotificationCenter)init;
- (id)_initWithCFNotificationCenter:(__CFNotificationCenter *)a3;
- (id)addObserverForName:(NSNotificationName)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void *)block;
- (id)debugDescription;
- (id)description;
- (unint64_t)_addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6 options:(unint64_t)a7;
- (void)_removeObserver:(unint64_t)a3;
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject;
- (void)dealloc;
- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject;
- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(id)anObject;
@end

@implementation NSNotificationCenter

+ (NSNotificationCenter)defaultCenter
{
  if (&OBJC_CLASS___NSNotificationCenter == a1)
  {
    if (qword_18C496508 != -1) {
      dispatch_once(&qword_18C496508, &__block_literal_global_138);
    }
    return (NSNotificationCenter *)atomic_load(&qword_18C496500);
  }

  else
  {
    os_unfair_lock_lock_with_options();
    Mutable = (const __CFDictionary *)qword_18C4964F0;
    if (!qword_18C4964F0)
    {
      Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      qword_18C4964F0 = (uint64_t)Mutable;
    }

    Value = (NSNotificationCenter *)CFDictionaryGetValue(Mutable, a1);
    if (!Value)
    {
      Value = (NSNotificationCenter *)objc_alloc_init((Class)a1);
      CFDictionarySetValue((CFMutableDictionaryRef)qword_18C4964F0, a1, Value);
    }

    os_unfair_lock_unlock(&stru_18C4964DC);
  }

  return Value;
}

- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
  if (aName)
  {
    v5 = -[NSNotification initWithName:object:userInfo:]( objc_alloc(&OBJC_CLASS___NSNotification),  "initWithName:object:userInfo:",  aName,  anObject,  aUserInfo);
    _CFXNotificationPost();
  }

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject
{
  if (observer && aSelector)
  {
    if (@"NSWillBecomeMultiThreadedNotification" == (__CFString *)aName && _NSIsMultiThreaded == 0)
    {
      _NSIsMultiThreaded = 1;
      v10 = -[NSNotification initWithName:object:userInfo:]( objc_alloc(&OBJC_CLASS___NSNotification),  "initWithName:object:userInfo:",  aName,  0LL,  0LL);
      objc_msgSend(observer, aSelector, v10);
    }

    else
    {
      if (addObserver_selector_name_object__once != -1) {
        dispatch_once(&addObserver_selector_name_object__once, &__block_literal_global_84);
      }
      Class = object_getClass(observer);
      class_isMetaClass(Class);
      _CFXNotificationRegisterObserver();
    }
  }

- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject
{
}

- (void)removeObserver:(id)observer
{
}

- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(id)anObject
{
  if (!observer) {
    return;
  }
  objc_opt_self();
  os_unfair_lock_lock(&_MergedGlobals_9);
  if (!qword_18C4964E8)
  {
    os_unfair_lock_unlock(&_MergedGlobals_9);
    goto LABEL_10;
  }

  int v6 = CFSetContainsValue((CFSetRef)qword_18C4964E8, observer);
  os_unfair_lock_unlock(&_MergedGlobals_9);
  if (!v6)
  {
LABEL_10:
    _CFXNotificationRemoveObservers();
    return;
  }

  objc_opt_self();
  os_unfair_lock_lock(&_MergedGlobals_9);
  if (qword_18C4964E8 && CFSetContainsValue((CFSetRef)qword_18C4964E8, observer))
  {
    CFSetRemoveValue((CFMutableSetRef)qword_18C4964E8, observer);
    id v8 = (id)*((void *)observer + 1);
    *((void *)observer + 1) = 0LL;
    uint64_t v7 = [observer token];
    os_unfair_lock_unlock(&_MergedGlobals_9);
    if (v8)
    {
      [v8 _removeObserver:v7];
    }
  }

  else
  {
    os_unfair_lock_unlock(&_MergedGlobals_9);
  }

- (void)_removeObserver:(unint64_t)a3
{
}

- (id)addObserverForName:(NSNotificationName)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void *)block
{
  if (block)
  {
    uint64_t v7 = +[__NSObserver observerWithCenter:]((uint64_t)&OBJC_CLASS_____NSObserver, self);
    if (_CFAppVersionCheck())
    {
      [v7 setBlock:block];
      [v7 block];
    }

    id v8 = (objc_class *)objc_opt_class();
    class_isMetaClass(v8);
    [v7 setToken:_CFXNotificationRegisterObserver()];
    return v7;
  }

  else
  {
    v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Block cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
    return +[__NSObserver observerWithCenter:](v11, v12);
  }

- (void)postNotification:(NSNotification *)notification
{
  if (notification)
  {
    _CFXNotificationPost();
  }

  else
  {
    v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: notification is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v3);
    -[NSIndexSet init](v4, v5);
  }

+ (void)load
{
}

+ (id)_defaultCenterWithoutCreating
{
  if (!atomic_load(&qword_18C496500)) {
    return 0LL;
  }
  if (qword_18C496508 != -1) {
    dispatch_once(&qword_18C496508, &__block_literal_global_138);
  }
  return (id)atomic_load(&qword_18C496500);
}

- (id)_initWithCFNotificationCenter:(__CFNotificationCenter *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSNotificationCenter;
  v4 = -[NSNotificationCenter init](&v6, sel_init);
  v4->_impl = (__CFNotificationCenter *)CFRetain(a3);
  return v4;
}

- (NSNotificationCenter)init
{
  self->_impl = (__CFNotificationCenter *)_CFXNotificationCenterCreate();
  return self;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  impl = self->_impl;
  if (impl) {
    CFRelease(impl);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSNotificationCenter;
  -[NSNotificationCenter dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)(id)CFCopyDescription(self->_impl);
}

- (unint64_t)_addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6 options:(unint64_t)a7
{
  Class = object_getClass(a3);
  class_isMetaClass(Class);
  return _CFXNotificationRegisterObserver();
}

- (BOOL)isEmpty
{
  return _CFXNotificationCenterIsEmpty() != 0;
}

- (id)debugDescription
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  pid_t v3 = getpid();
  if (proc_pidinfo(v3, 13, 0LL, buffer, 64) != 64 || (buffer[32] & 2) == 0)
  {
    uint64_t v5 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_ERROR,  "-[NSNotificationCenter debugDescription] should not be used programmatically and only be used in the debugger.",  buf,  2u);
    }

    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p>\n",  objc_opt_class(),  self);
  }

  else
  {
    objc_super v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@:%p>\n",  objc_opt_class(),  self);
    uint64_t v7 = (const void *)_CFXNotificationCenterCopyDebugInfo();
    -[NSMutableString appendString:](v6, "appendString:", v7);
    CFRelease(v7);
  }

  return v6;
}

@end