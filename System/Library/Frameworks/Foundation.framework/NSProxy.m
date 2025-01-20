@interface NSProxy
+ (BOOL)_isDeallocating;
+ (BOOL)_tryRetain;
+ (BOOL)allowsWeakReference;
+ (BOOL)conformsToProtocol:(id)a3;
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)isAncestorOfObject:(id)a3;
+ (BOOL)isEqual:(id)a3;
+ (BOOL)isFault;
+ (BOOL)isKindOfClass:(Class)a3;
+ (BOOL)isMemberOfClass:(Class)a3;
+ (BOOL)isProxy;
+ (BOOL)isSubclassOfClass:(Class)a3;
+ (BOOL)respondsToSelector:(SEL)aSelector;
+ (BOOL)retainWeakReference;
+ (NSProxy)init;
+ (id)_copyDescription;
+ (id)alloc;
+ (id)allocWithZone:(NSZone *)zone;
+ (id)description;
+ (id)forwardingTargetForSelector:(SEL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)methodSignatureForSelector:(SEL)a3;
+ (id)performSelector:(SEL)a3;
+ (id)performSelector:(SEL)a3 withObject:(id)a4;
+ (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
+ (unint64_t)retainCount;
+ (void)dealloc;
+ (void)doesNotRecognizeSelector:(SEL)a3;
+ (void)finalize;
+ (void)forwardInvocation:(id)a3;
+ (void)instanceMethodForSelector:(SEL)a3;
+ (void)methodForSelector:(SEL)a3;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_tryRetain;
- (BOOL)allowsWeakReference;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFault;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isNSArray__;
- (BOOL)isNSCFConstantString__;
- (BOOL)isNSData__;
- (BOOL)isNSDate__;
- (BOOL)isNSDictionary__;
- (BOOL)isNSNumber__;
- (BOOL)isNSObject__;
- (BOOL)isNSOrderedSet__;
- (BOOL)isNSSet__;
- (BOOL)isNSString__;
- (BOOL)isNSTimeZone__;
- (BOOL)isNSValue__;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)superclass;
- (NSMethodSignature)methodSignatureForSelector:(SEL)sel;
- (NSProxy)autorelease;
- (NSProxy)retain;
- (NSString)description;
- (id)_copyDescription;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)performSelector:(SEL)a3;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)doesNotRecognizeSelector:(SEL)a3;
- (void)forwardInvocation:(NSInvocation *)invocation;
- (void)release;
@end

@implementation NSProxy

- (NSProxy)retain
{
  v2 = (NSProxy *)_objc_rootRetain();
  if (*MEMORY[0x1896049A0]) {
    __CFRecordAllocationEvent();
  }
  return v2;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return 0LL;
}

- (void)release
{
  if (*MEMORY[0x1896049A0]) {
    __CFRecordAllocationEvent();
  }
  _objc_rootRelease();
}

+ (id)allocWithZone:(NSZone *)zone
{
  v3 = (void *)_objc_rootAllocWithZone();
  object_getClassName(v3);
  __CFSetLastAllocationEventName();
  return v3;
}

+ (id)alloc
{
  v2 = (void *)_objc_rootAlloc();
  object_getClassName(v2);
  __CFSetLastAllocationEventName();
  return v2;
}

- (Class)superclass
{
  v2 = (objc_class *)objc_opt_class();
  return class_getSuperclass(v2);
}

+ (unint64_t)retainCount
{
  return -1LL;
}

+ (BOOL)respondsToSelector:(SEL)aSelector
{
  if (!aSelector) {
    return 0;
  }
  Class = object_getClass(a1);
  return class_respondsToSelector(Class, aSelector);
}

+ (BOOL)isAncestorOfObject:(id)a3
{
  Superclass = (objc_class *)objc_opt_class();
  for (BOOL i = Superclass != 0LL; Superclass != a1 && Superclass; BOOL i = Superclass != 0LL)
    Superclass = class_getSuperclass(Superclass);
  return i;
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return 0LL;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
}

- (NSMethodSignature)methodSignatureForSelector:(SEL)sel
{
  return result;
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** -[NSProxy doesNotRecognizeSelector:%s] called!", sel_getName(a3)), 0 reason userInfo];
  objc_exception_throw(v3);
  +[NSProxy instanceMethodSignatureForSelector:](v4, v5, v6);
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  if (a3 && __methodDescriptionForSelector((Class)a1, a3)) {
    return (id)[MEMORY[0x189603FA0] signatureWithObjCTypes:v3];
  }
  else {
    return 0LL;
  }
}

+ (id)methodSignatureForSelector:(SEL)a3
{
  if (a3 && (Class = object_getClass(a1), __methodDescriptionForSelector(Class, a3))) {
    return (id)[MEMORY[0x189603FA0] signatureWithObjCTypes:v5];
  }
  else {
    return 0LL;
  }
}

+ (void)forwardInvocation:(id)a3
{
  if (a3) {
    a3 = (id)[a3 selector];
  }
  [a1 doesNotRecognizeSelector:a3];
}

+ (void)doesNotRecognizeSelector:(SEL)a3
{
  id v4 = _NSMethodExceptionProem((objc_class *)a1, a3);
  NSLog((NSString *)@"%@: unrecognized selector sent to class %p", v4, a1);
  uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unrecognized selector sent to class %p",  v4,  a1);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v5 userInfo:0]);
  +[NSProxy init](v6, v7);
}

+ (NSProxy)init
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** +[%s<%p> init]: cannot init a class object.", class_getName((Class)a1), a1), 0 reason userInfo];
  objc_exception_throw(v2);
  +[NSProxy dealloc](v3, v4);
  return result;
}

+ (void)dealloc
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** +[%s<%p> dealloc]: cannot dealloc a class object.", class_getName((Class)a1), a1), 0 reason userInfo];
  objc_exception_throw(v2);
  +[NSProxy finalize](v3, v4);
}

+ (void)finalize
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** +[%s<%p> finalize]: cannot finalize a class object", class_getName((Class)a1), a1), 0 reason userInfo];
  objc_exception_throw(v2);
  -[NSProxy retainCount](v3, v4);
}

- (NSProxy)autorelease
{
  return self;
}

+ (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)_isDeallocating
{
  return 0;
}

+ (BOOL)allowsWeakReference
{
  return 1;
}

+ (BOOL)retainWeakReference
{
  return 1;
}

- (BOOL)_tryRetain
{
  int v2 = _objc_rootTryRetain();
  if (v2 && *MEMORY[0x1896049A0]) {
    __CFRecordAllocationEvent();
  }
  return v2;
}

- (BOOL)allowsWeakReference
{
  return !-[NSProxy _isDeallocating](self, "_isDeallocating");
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%s: %p>",  class_getName(v3),  self);
}

+ (id)_copyDescription
{
  id v3 = (id)[a1 description];
  _CFAutoreleasePoolPop();
  return v3;
}

- (id)_copyDescription
{
  id v3 = -[NSProxy description](self, "description");
  _CFAutoreleasePoolPop();
  return v3;
}

+ (BOOL)isEqual:(id)a3
{
  return a3 == a1;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

+ (id)performSelector:(SEL)a3
{
  if (a3) {
    return [a1 a3];
  }
  _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return -[NSProxy performSelector:](v4, v5, v6);
}

- (id)performSelector:(SEL)a3
{
  if (a3) {
    return [self a3];
  }
  _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
  return +[NSProxy performSelector:withObject:](v4, v5, v6, v7);
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (a3) {
    return objc_msgSend(a1, a3, a4);
  }
  _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return -[NSProxy performSelector:withObject:](v5, v6, v7, v8);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (a3) {
    return objc_msgSend(self, a3, a4);
  }
  _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
  return +[NSProxy performSelector:withObject:withObject:](v5, v6, v7, v8, v9);
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (a3) {
    return objc_msgSend(a1, a3, a4, a5);
  }
  _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return -[NSProxy performSelector:withObject:withObject:](v6, v7, v8, v9, v10);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (a3) {
    return objc_msgSend(self, a3, a4, a5);
  }
  _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
  return (id)+[NSProxy isFault](v6, v7);
}

+ (BOOL)isFault
{
  return 0;
}

- (BOOL)isFault
{
  return 0;
}

+ (BOOL)isProxy
{
  return 0;
}

- (BOOL)isProxy
{
  return 1;
}

+ (BOOL)isSubclassOfClass:(Class)a3
{
  BOOL v3 = Superclass != 0LL;
  if (Superclass && Superclass != a3)
  {
    do
    {
      Superclass = class_getSuperclass((Class)Superclass);
      BOOL v3 = Superclass != 0LL;
    }

    while (Superclass != a3 && Superclass);
  }

  return v3;
}

+ (BOOL)isMemberOfClass:(Class)a3
{
  return object_getClass(a1) == a3;
}

+ (BOOL)isKindOfClass:(Class)a3
{
  Class = object_getClass(a1);
  for (BOOL i = Class != 0LL; Class != a3 && Class; BOOL i = Class != 0LL)
    Class = class_getSuperclass(Class);
  return i;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  id v4 = (void *)_NSMessageBuilder();
  objc_opt_isKindOfClass();
  object_dispose(v4);
  -[NSProxy forwardInvocation:](self, "forwardInvocation:", 0LL);
  [0 getReturnValue:v6];
  return v6[0];
}

- (BOOL)isMemberOfClass:(Class)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = 0LL;
  id v5 = (void *)_NSMessageBuilder();
  [v5 isMemberOfClass:a3];
  object_dispose(v5);
  -[NSProxy forwardInvocation:](self, "forwardInvocation:", 0LL);
  [0 getReturnValue:v7];
  return v7[0];
}

+ (BOOL)conformsToProtocol:(id)a3
{
  BOOL v3 = 0;
  if (a1 && a3)
  {
    Superclass = (objc_class *)a1;
    do
    {
      BOOL v3 = class_conformsToProtocol(Superclass, (Protocol *)a3);
      if (v3) {
        break;
      }
      Superclass = class_getSuperclass(Superclass);
    }

    while (Superclass);
  }

  return v3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = 0LL;
  id v5 = (void *)_NSMessageBuilder();
  [v5 conformsToProtocol:a3];
  object_dispose(v5);
  -[NSProxy forwardInvocation:](self, "forwardInvocation:", 0LL);
  [0 getReturnValue:v7];
  return v7[0];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  id v4 = (void *)_NSMessageBuilder();
  objc_opt_respondsToSelector();
  object_dispose(v4);
  -[NSProxy forwardInvocation:](self, "forwardInvocation:", 0LL);
  [0 getReturnValue:v6];
  return v6[0];
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)a1, a3);
}

+ (void)instanceMethodForSelector:(SEL)a3
{
  if (a3) {
    return class_getMethodImplementation((Class)a1, a3);
  }
  _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return +[NSProxy methodForSelector:](v4, v5, v6);
}

+ (void)methodForSelector:(SEL)a3
{
  if (a3)
  {
    Class = object_getClass(a1);
    return class_getMethodImplementation(Class, a3);
  }

  else
  {
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
    return (void *)-[NSProxy isNSObject__](v6, v7);
  }

- (BOOL)isNSObject__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSArray__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSCFConstantString__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSData__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSDate__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSDictionary__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSNumber__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSOrderedSet__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSSet__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSString__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSTimeZone__
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSValue__
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  class_getName((Class)a1));
}

@end