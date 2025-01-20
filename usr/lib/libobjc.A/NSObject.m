@interface NSObject
+ (BOOL)_isDeallocating;
+ (BOOL)_tryRetain;
+ (BOOL)allowsWeakReference;
+ (BOOL)conformsToProtocol:(Protocol *)protocol;
+ (BOOL)instancesRespondToSelector:(SEL)aSelector;
+ (BOOL)isAncestorOfObject:(id)a3;
+ (BOOL)isEqual:(id)a3;
+ (BOOL)isFault;
+ (BOOL)isKindOfClass:(Class)a3;
+ (BOOL)isMemberOfClass:(Class)a3;
+ (BOOL)isProxy;
+ (BOOL)isSubclassOfClass:(Class)aClass;
+ (BOOL)resolveClassMethod:(SEL)sel;
+ (BOOL)resolveInstanceMethod:(SEL)sel;
+ (BOOL)respondsToSelector:(SEL)a3;
+ (BOOL)retainWeakReference;
+ (Class)superclass;
+ (IMP)instanceMethodForSelector:(SEL)aSelector;
+ (NSMethodSignature)instanceMethodSignatureForSelector:(SEL)aSelector;
+ (NSObject)new;
+ (NSString)debugDescription;
+ (NSString)description;
+ (_NSZone)zone;
+ (id)forwardingTargetForSelector:(SEL)a3;
+ (id)methodSignatureForSelector:(SEL)a3;
+ (id)performSelector:(SEL)a3;
+ (id)performSelector:(SEL)a3 withObject:(id)a4;
+ (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
+ (unint64_t)retainCount;
+ (void)doesNotRecognizeSelector:(SEL)a3;
+ (void)forwardInvocation:(id)a3;
+ (void)methodForSelector:(SEL)a3;
- (BOOL)_isDeallocating;
- (BOOL)allowsWeakReference;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFault;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)retainWeakReference;
- (Class)class;
- (Class)superclass;
- (IMP)methodForSelector:(SEL)aSelector;
- (NSMethodSignature)methodSignatureForSelector:(SEL)aSelector;
- (NSString)debugDescription;
- (NSString)description;
- (_NSZone)zone;
- (id)copy;
- (id)forwardingTargetForSelector:(SEL)aSelector;
- (id)mutableCopy;
- (id)performSelector:(SEL)a3;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)doesNotRecognizeSelector:(SEL)aSelector;
- (void)forwardInvocation:(NSInvocation *)anInvocation;
@end

@implementation NSObject

+ (Class)superclass
{
  return (Class)*((void *)a1 + 1);
}

+ (BOOL)isMemberOfClass:(Class)a3
{
  return (*(void *)a1 & 0xFFFFFFFF8LL) == (void)a3;
}

+ (BOOL)isKindOfClass:(Class)a3
{
  isa = (objc_class *)(*(void *)a1 & 0xFFFFFFFF8LL);
  for (BOOL i = isa == 0LL; ; BOOL i = isa == 0LL)
  {
    BOOL result = !i;
    if (isa == a3 || isa == 0LL) {
      break;
    }
    isa = isa[1].isa;
  }

  return result;
}

+ (BOOL)isSubclassOfClass:(Class)aClass
{
  BOOL v3 = a1 != 0LL;
  if (a1 != aClass && a1)
  {
    do
    {
      a1 = (id)*((void *)a1 + 1);
      BOOL v3 = a1 != 0LL;
    }

    while (a1 != aClass && a1 != 0LL);
  }

  return v3;
}

+ (BOOL)isAncestorOfObject:(id)a3
{
  for (BOOL i = objc_msgSend(a3, sel_class); i != a1 && i != 0; BOOL i = (void *)i[1])
    ;
  return i != 0LL;
}

+ (BOOL)instancesRespondToSelector:(SEL)aSelector
{
  return class_respondsToSelector_inst(0LL, (objc_selector *)aSelector, (objc_class *)a1);
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return class_respondsToSelector_inst( (objc_object *)a1,  (objc_selector *)a3,  (objc_class *)(*(void *)a1 & 0xFFFFFFFF8LL));
}

+ (BOOL)conformsToProtocol:(Protocol *)protocol
{
  BOOL result = 0;
  if (protocol && a1)
  {
    do
    {
      BOOL result = class_conformsToProtocol((Class)a1, protocol);
      if (result) {
        break;
      }
      a1 = (id)*((void *)a1 + 1);
    }

    while (a1);
  }

  return result;
}

+ (BOOL)isEqual:(id)a3
{
  return a3 == a1;
}

+ (BOOL)isFault
{
  return 0;
}

+ (BOOL)isProxy
{
  return 0;
}

+ (IMP)instanceMethodForSelector:(SEL)aSelector
{
  if (aSelector) {
    return class_getMethodImplementation((Class)a1, aSelector);
  }
  objc_msgSend(a1, sel_doesNotRecognizeSelector_, v3, v4);
  return 0LL;
}

+ (void)methodForSelector:(SEL)a3
{
  if (a3) {
    return (void *)object_getMethodImplementation((unint64_t)a1, (objc_selector *)a3);
  }
  objc_msgSend(a1, sel_doesNotRecognizeSelector_, v3, v4);
  return 0LL;
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
  return 0;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
  return 0;
}

+ (void)doesNotRecognizeSelector:(SEL)a3
{
  Name = class_getName((Class)a1);
  SEL v9 = "<null selector>";
  if (a3) {
    SEL v9 = a3;
  }
  _objc_fatal("+[%s %s]: unrecognized selector sent to instance %p", v6, v7, v8, Name, v9, a1);
}

+ (id)performSelector:(SEL)a3
{
  if (!a3) {
    objc_msgSend(a1, sel_doesNotRecognizeSelector_);
  }
  return [a1 a3];
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (!a3) {
    objc_msgSend(a1, sel_doesNotRecognizeSelector_);
  }
  return objc_msgSend(a1, a3, a4);
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a3) {
    objc_msgSend(a1, sel_doesNotRecognizeSelector_);
  }
  return objc_msgSend(a1, a3, a4, a5);
}

+ (NSMethodSignature)instanceMethodSignatureForSelector:(SEL)aSelector
{
}

+ (id)methodSignatureForSelector:(SEL)a3
{
}

+ (void)forwardInvocation:(id)a3
{
  if (a3) {
    a3 = objc_msgSend(a3, sel_selector);
  }
  objc_msgSend(a1, sel_doesNotRecognizeSelector_, a3);
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return 0LL;
}

+ (NSString)description
{
  return 0LL;
}

+ (NSString)debugDescription
{
  return (NSString *)objc_msgSend(a1, sel_description);
}

+ (NSObject)new
{
  if ((*(_WORD *)((*(void *)a1 & 0xFFFFFFFF8LL) + 0x1E) & 0x4000) != 0) {
    v2 = _objc_rootAllocWithZone((uint64_t)a1);
  }
  else {
    v2 = (id (*)(id, SEL, ...))objc_msgSend(a1, sel_alloc);
  }
  return objc_msgSend(v2, sel_init);
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

+ (unint64_t)retainCount
{
  return -1LL;
}

+ (_NSZone)zone
{
  return 0LL;
}

- (Class)class
{
  if (self)
  {
    Class v2 = self;
    if (((unint64_t)self & 0x8000000000000000LL) != 0)
    {
      self = (Class)objc_debug_taggedpointer_classes[self & 7];
    }

    else
    {
      return (Class)((uint64_t)self->isa & 0xFFFFFFFF8LL);
    }
  }

  return self;
}

- (Class)superclass
{
  return (Class)*((void *)-[NSObject class](self, sel_class) + 1);
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return -[NSObject class](self, sel_class) == a3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  for (Class i = -[NSObject class](self, sel_class); i != a3 && i != 0LL; Class i = i[1].isa)
    ;
  return i != 0LL;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return class_respondsToSelector_inst((objc_object *)self, (objc_selector *)a3, -[NSObject class](self, sel_class));
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[NSObject class](self, sel_class);
    if (v4)
    {
      isa = v4;
      do
      {
        LOBYTE(v4) = class_conformsToProtocol(isa, (Protocol *)a3);
        isa = isa[1].isa;
      }

      while (isa);
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (BOOL)isFault
{
  return 0;
}

- (BOOL)isProxy
{
  return 0;
}

- (IMP)methodForSelector:(SEL)aSelector
{
  if (aSelector) {
    return (IMP)object_getMethodImplementation((unint64_t)self, (objc_selector *)aSelector);
  }
  -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_, v3, v4);
  return 0LL;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
  ClassName = object_getClassName(self);
  SEL v9 = "<null selector>";
  if (aSelector) {
    SEL v9 = aSelector;
  }
  _objc_fatal("-[%s %s]: unrecognized selector sent to instance %p", v6, v7, v8, ClassName, v9, self);
}

- (id)performSelector:(SEL)a3
{
  if (!a3) {
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  }
  return [self a3];
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (!a3) {
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  }
  return objc_msgSend(self, a3, a4);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a3) {
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  }
  return objc_msgSend(self, a3, a4, a5);
}

- (NSMethodSignature)methodSignatureForSelector:(SEL)aSelector
{
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
  if (anInvocation) {
    anInvocation = -[NSInvocation selector](anInvocation, sel_selector);
  }
  -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_, anInvocation);
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
  return 0LL;
}

- (NSString)description
{
  return 0LL;
}

- (NSString)debugDescription
{
  return -[NSObject description](self, sel_description);
}

- (BOOL)_isDeallocating
{
  return objc_object::sidetable_isDeallocating((objc_object *)self);
}

- (BOOL)allowsWeakReference
{
  return !-[NSObject _isDeallocating](self, sel__isDeallocating);
}

- (BOOL)retainWeakReference
{
  return -[NSObject _tryRetain](self, sel__tryRetain);
}

- (_NSZone)zone
{
  return 0LL;
}

- (id)copy
{
  return -[NSObject copyWithZone:](self, sel_copyWithZone_, 0LL);
}

- (id)mutableCopy
{
  return -[NSObject mutableCopyWithZone:](self, sel_mutableCopyWithZone_, 0LL);
}

@end