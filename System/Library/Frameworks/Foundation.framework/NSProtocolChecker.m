@interface NSProtocolChecker
+ (NSProtocolChecker)allocWithZone:(_NSZone *)a3;
+ (NSProtocolChecker)protocolCheckerWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSObject)target;
- (NSProtocolChecker)initWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol;
- (Protocol)protocol;
- (const)_localClassNameForClass;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (objc_method_description)methodDescriptionForSelector:(SEL)a3;
- (void)doesNotRecognizeSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation NSProtocolChecker

- (Protocol)protocol
{
  v4 = NSClassFromString((NSString *)@"NSProtocolChecker");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSObject)target
{
  v4 = NSClassFromString((NSString *)@"NSProtocolChecker");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** NSProtocolChecker: target protocol does not recognize selector: %s", sel_getName(a3)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[NSProtocolChecker respondsToSelector:](v4, v5, v6);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5 = 1;
  if (!(unint64_t)protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 1, 1).name)
  {
    -[NSProtocolChecker target](self, "target");
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
  }

  return v5;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return protocol_conformsToProtocol(-[NSProtocolChecker protocol](self, "protocol"), (Protocol *)a3);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ((unint64_t)protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 0, 1).name
    && (-[NSProtocolChecker target](self, "target"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return -[NSProtocolChecker target](self, "target");
  }

  else
  {
    return 0LL;
  }

- (objc_method_description)methodDescriptionForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 1, 1);
  types = MethodDescription.types;
  SEL name = MethodDescription.name;
  if (MethodDescription.name
    || (-[NSProtocolChecker target](self, "target"), (objc_opt_respondsToSelector() & 1) != 0)
    && (objc_method_description v11 = protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 0, 1),
        types = v11.types,
        (SEL name = v11.name) != 0LL))
  {
    v8 = name;
    v9 = types;
    result = (objc_method_description *)objc_msgSend( (id)objc_msgSend(MEMORY[0x189603FB8], "dataWithLength:", 16),  "mutableBytes");
    result->SEL name = v8;
    result->types = v9;
  }

  else if (sel_respondsToSelector_ == a3 || sel__conformsToProtocolNamed_ == a3 || sel_conformsToProtocol_ == a3)
  {
    return (objc_method_description *)[MEMORY[0x189616338] instanceMethodDescriptionForSelector:a3];
  }

  else
  {
    return 0LL;
  }

  return result;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result = -[NSProtocolChecker methodDescriptionForSelector:](self, "methodDescriptionForSelector:", a3);
  if (result) {
    return (id)[MEMORY[0x189603FA0] signatureWithObjCTypes:*((void *)result + 1)];
  }
  return result;
}

- (const)_localClassNameForClass
{
  return (const char *)-[NSObject _localClassNameForClass]( -[NSProtocolChecker target](self, "target"),  "_localClassNameForClass");
}

- (void)forwardInvocation:(id)a3
{
  BOOL v5 = (char *)[a3 selector];
  if (v5 != sel_respondsToSelector_ && v5 != sel__conformsToProtocolNamed_ && v5 != sel_conformsToProtocol_)
  {
    v8 = v5;
    if (!-[NSProtocolChecker methodDescriptionForSelector:](self, "methodDescriptionForSelector:", v5)) {
      -[NSProtocolChecker doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v8);
    }
    self = -[NSProtocolChecker target](self, "target");
  }

  [a3 invokeWithTarget:self];
}

+ (NSProtocolChecker)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1) {
    v4 = (objc_class *)objc_opt_self();
  }
  return (NSProtocolChecker *)NSAllocateObject(v4, 0LL, a3);
}

+ (NSProtocolChecker)protocolCheckerWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol
{
  return (NSProtocolChecker *)(id)[objc_allocWithZone((Class)a1) initWithTarget:anObject protocol:aProtocol];
}

- (NSProtocolChecker)initWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol
{
}

@end