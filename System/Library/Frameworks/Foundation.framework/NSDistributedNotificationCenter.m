@interface NSDistributedNotificationCenter
+ (NSDistributedNotificationCenter)defaultCenter;
+ (NSDistributedNotificationCenter)notificationCenterForType:(NSDistributedNotificationCenterType)notificationCenterType;
- (BOOL)suspended;
- (NSDistributedNotificationCenter)init;
- (id)addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6;
- (id)addObserverForName:(id)a3 object:(id)a4 suspensionBehavior:(unint64_t)a5 queue:(id)a6 usingBlock:(id)a7;
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(NSString *)anObject;
- (void)addObserver:(id)observer selector:(SEL)selector name:(NSNotificationName)name object:(NSString *)object suspensionBehavior:(NSNotificationSuspensionBehavior)suspensionBehavior;
- (void)postNotification:(id)a3;
- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject;
- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject userInfo:(NSDictionary *)aUserInfo;
- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo deliverImmediately:(BOOL)deliverImmediately;
- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo options:(NSDistributedNotificationOptions)options;
- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(NSString *)anObject;
- (void)setSuspended:(BOOL)suspended;
@end

@implementation NSDistributedNotificationCenter

+ (NSDistributedNotificationCenter)defaultCenter
{
  return (NSDistributedNotificationCenter *)[a1 notificationCenterForType:@"_NSLocalNotificationCenter"];
}

+ (NSDistributedNotificationCenter)notificationCenterForType:(NSDistributedNotificationCenterType)notificationCenterType
{
  Mutable = (const __CFDictionary *)qword_18C4964F8;
  if (!qword_18C4964F8)
  {
    Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    qword_18C4964F8 = (uint64_t)Mutable;
  }

  Value = (NSDistributedNotificationCenter *)CFDictionaryGetValue(Mutable, notificationCenterType);
  if (!Value)
  {
    v7 = NSClassFromString(notificationCenterType);
    if (!v7) {
      v7 = (objc_class *)a1;
    }
    Value = (NSDistributedNotificationCenter *)objc_alloc_init(v7);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_18C4964F8, notificationCenterType, Value);
    }
  }

  os_unfair_lock_unlock(&stru_18C4964DC);
  return Value;
}

- (NSDistributedNotificationCenter)init
{
  self->super._impl = (__CFNotificationCenter *)_CFXNotificationCenterCreate();
  return self;
}

- (void)addObserver:(id)observer selector:(SEL)selector name:(NSNotificationName)name object:(NSString *)object suspensionBehavior:(NSNotificationSuspensionBehavior)suspensionBehavior
{
  Class = object_getClass(observer);
  class_isMetaClass(Class);
  _CFXNotificationRegisterObserver();
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(NSString *)anObject
{
}

- (id)addObserverForName:(id)a3 object:(id)a4 suspensionBehavior:(unint64_t)a5 queue:(id)a6 usingBlock:(id)a7
{
  if (a7)
  {
    v7 = +[__NSObserver observerWithCenter:]((uint64_t)&OBJC_CLASS_____NSObserver, self);
    [v7 setToken:_CFXNotificationRegisterObserver()];
    return v7;
  }

  else
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Block cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[NSDistributedNotificationCenter addObserverForName:object:queue:usingBlock:](v10, v11, v12, v13, v14, v15);
  }

- (id)addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  return -[NSDistributedNotificationCenter addObserverForName:object:suspensionBehavior:queue:usingBlock:]( self,  "addObserverForName:object:suspensionBehavior:queue:usingBlock:",  a3,  a4,  2LL,  a5,  a6);
}

- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(NSString *)anObject
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSDistributedNotificationCenter;
  -[NSNotificationCenter removeObserver:name:object:](&v5, sel_removeObserver_name_object_, observer, aName, anObject);
}

- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo options:(NSDistributedNotificationOptions)options
{
  uint64_t v6 = -[NSNotification initWithName:object:userInfo:]( objc_alloc(&OBJC_CLASS___NSNotification),  "initWithName:object:userInfo:",  name,  object,  userInfo);
  _CFXNotificationPost();
}

- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo deliverImmediately:(BOOL)deliverImmediately
{
}

- (void)postNotification:(id)a3
{
  if (a3)
  {
    _CFXNotificationPost();
  }

  else
  {
    v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: notification is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v3);
    -[NSDistributedNotificationCenter postNotificationName:object:](v4, v5, v6, v7);
  }

- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject
{
}

- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject userInfo:(NSDictionary *)aUserInfo
{
}

- (void)setSuspended:(BOOL)suspended
{
}

- (BOOL)suspended
{
  return _CFXNotificationGetSuspended();
}

@end