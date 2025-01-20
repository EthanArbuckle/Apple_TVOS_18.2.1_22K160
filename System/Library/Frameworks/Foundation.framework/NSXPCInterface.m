@interface NSXPCInterface
+ (NSXPCInterface)interfaceWithProtocol:(Protocol *)protocol;
+ (id)signatureForBlock:(id)a3;
- (BOOL)_hasProxiesInArgumentsOfSelector:(SEL)a3;
- (BOOL)_hasProxiesInReplyBlockArgumentsOfSelector:(SEL)a3;
- (BOOL)_selectorIsAllowed:(SEL)a3 isReply:(BOOL)a4 methodSignature:(id *)a5 allowedClasses:(id *)a6;
- (BOOL)_specialCaseObject;
- (Class)_customSubclass;
- (Class)_returnClassForSelector:(SEL)a3;
- (Class)classForSelector:(SEL)a3 argumentIndex:(unint64_t)a4 ofReply:(BOOL)a5;
- (NSSet)classesForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (NSXPCInterface)init;
- (NSXPCInterface)interfaceForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (Protocol)protocol;
- (id)_generateAndCacheMethodSignatureForRemoteSelector:(SEL)a3;
- (id)_interfaceForArgument:(unint64_t)a3 ofSelector:(SEL)a4 reply:(BOOL)a5;
- (id)_methodSignatureForRemoteSelector:(SEL)a3;
- (id)_methodSignatureForReplyBlockOfSelector:(SEL)a3;
- (id)debugDescription;
- (id)replyBlockSignatureForSelector:(SEL)a3;
- (unint64_t)_remoteVersion;
- (unint64_t)_respondsToRemoteSelector:(SEL)a3;
- (unint64_t)version;
- (unint64_t)versionForSelector:(SEL)a3;
- (void)_locked_methodInfoForSelector:(int)a3 createIfNecessary:;
- (void)dealloc;
- (void)setClass:(Class)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5 ofReply:(BOOL)a6;
- (void)setClasses:(NSSet *)classes forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (void)setInterface:(NSXPCInterface *)ifc forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (void)setProtocol:(Protocol *)protocol;
- (void)setVersion:(unint64_t)a3 forSelector:(SEL)a4;
- (void)setXPCType:(xpc_type_t)type forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
- (void)set_remoteVersion:(unint64_t)a3;
- (xpc_type_t)XPCTypeForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply;
@end

@implementation NSXPCInterface

- (BOOL)_selectorIsAllowed:(SEL)a3 isReply:(BOOL)a4 methodSignature:(id *)a5 allowedClasses:(id *)a6
{
  BOOL v8 = a4;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v12 = (void **)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  v13 = v12;
  if (v12)
  {
    if (v8)
    {
      Value = *v12;
    }

    else
    {
      knownSelectors = self->_knownSelectors;
      if (!knownSelectors)
      {
        knownSelectors = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  &kNSXPCSelKeyCallbacks,  MEMORY[0x189605250]);
        self->_knownSelectors = knownSelectors;
      }

      Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
    }

    id v16 = Value;
    uint64_t v17 = 2LL;
    if (v8) {
      uint64_t v17 = 1LL;
    }
    *a6 = (id)[v13[v17] copy];
    os_unfair_lock_unlock(p_knownSelectorsLock);
    if (!v16) {
      id v16 = -[NSXPCInterface _generateAndCacheMethodSignatureForRemoteSelector:]( self,  "_generateAndCacheMethodSignatureForRemoteSelector:",  a3);
    }
    *a5 = v16;
  }

  else
  {
    os_unfair_lock_unlock(p_knownSelectorsLock);
  }

  return v13 != 0LL;
}

- (void)_locked_methodInfoForSelector:(int)a3 createIfNecessary:
{
  if (!a1) {
    return 0LL;
  }
  Mutable = *(const __CFDictionary **)(a1 + 32);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, &kNSXPCSelKeyCallbacks, 0LL);
    *(void *)(a1 + 32) = Mutable;
  }

  Value = CFDictionaryGetValue(Mutable, key);
  if (Value) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a3 == 0;
  }
  if (v8) {
    return Value;
  }
  uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
  v10 = *(Protocol **)(a1 + 8);
  v11 = (const char *)key;
  if (MethodTypeEncoding)
  {
    BOOL v12 = 1LL;
  }

  else
  {
    uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
    v10 = *(Protocol **)(a1 + 8);
    v11 = (const char *)key;
    if (!MethodTypeEncoding)
    {
      if ((unint64_t)protocol_getMethodDescription(v10, (SEL)key, 1, 1).name
        || (unint64_t)protocol_getMethodDescription((Protocol *)*(void *)(a1 + 8), (SEL)key, 0, 1).name)
      {
        Name = protocol_getName(*(Protocol **)(a1 + 8));
        v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: Unable to get extended method signature from Protocol data (%s / %s). Use of clang is required for NSXPCInterface.",  Name,  sel_getName((SEL)key));
        goto LABEL_21;
      }

      return 0LL;
    }

    BOOL v12 = 0LL;
  }

  if (isMethodFromNSObjectProtocol(v10, v11, v12)) {
    return 0LL;
  }
  uint64_t v13 = [MEMORY[0x189603FA0] signatureWithObjCTypes:MethodTypeEncoding];
  if (v13)
  {
    v14 = (void *)v13;
    Value = malloc(0x30uLL);
    void *Value = 0LL;
    Value[1] = 0LL;
    Value[2] = 0LL;
    Value[3] = 1LL;
    Value[4] = 0LL;
    *((_DWORD *)Value + 10) = -1;
    *((_WORD *)Value + 22) = 0;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), key, Value);
    v15 = protocol_getName(*(Protocol **)(a1 + 8));
    setProtocolMetadataWithSignature((const char *)key, (uint64_t)v15, v14, (uint64_t)Value, 0);
    return Value;
  }

  uint64_t v17 = protocol_getName(*(Protocol **)(a1 + 8));
  v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: Unable to get method signature from Protocol data (%s / %s)",  v17,  sel_getName((SEL)key));
LABEL_21:
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v18 userInfo:0]);
  return (void *)_getLastByteOfValueIncludingMarker(v20, v21, v22);
}

- (Class)_customSubclass
{
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  xpcDOSubclass = self->_xpcDOSubclass;
  os_unfair_lock_unlock(p_knownSelectorsLock);
  if (xpcDOSubclass) {
    return xpcDOSubclass;
  }
  else {
    return (Class)objc_opt_class();
  }
}

- (id)_methodSignatureForRemoteSelector:(SEL)a3
{
  if (self->_protocol)
  {
    if (!a3) {
      return 0LL;
    }
    os_unfair_lock_lock(&self->_knownSelectorsLock);
    knownSelectors = self->_knownSelectors;
    if (!knownSelectors)
    {
      knownSelectors = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  &kNSXPCSelKeyCallbacks,  MEMORY[0x189605250]);
      self->_knownSelectors = knownSelectors;
    }

    Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    if (!Value) {
      return -[NSXPCInterface _generateAndCacheMethodSignatureForRemoteSelector:]( self,  "_generateAndCacheMethodSignatureForRemoteSelector:",  a3);
    }
    return Value;
  }

  else
  {
    BOOL v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: No protocol has been set on interface", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
    -[_NSXPCDistantObject _forwardStackInvocation:](v9, v10, v11);
  }

  return result;
}

- (BOOL)_hasProxiesInReplyBlockArgumentsOfSelector:(SEL)a3
{
  if (self->_protocol)
  {
    p_knownSelectorsLock = &self->_knownSelectorsLock;
    os_unfair_lock_lock(&self->_knownSelectorsLock);
    v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
    if (v6) {
      BOOL v7 = *((_BYTE *)v6 + 45) != 0;
    }
    else {
      BOOL v7 = 0;
    }
    os_unfair_lock_unlock(p_knownSelectorsLock);
    return v7;
  }

  else
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: No protocol has been set on interface", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    objc_begin_catch(v10);
    os_unfair_lock_unlock((os_unfair_lock_t)&OBJC_CLASS___NSString);
    objc_exception_rethrow();
    __break(1u);
  }

  return result;
}

- (BOOL)_specialCaseObject
{
  return self->_specialCaseObject;
}

+ (NSXPCInterface)interfaceWithProtocol:(Protocol *)protocol
{
  v4 = (void *)objc_opt_new();
  [v4 setProtocol:protocol];
  return (NSXPCInterface *)v4;
}

- (NSXPCInterface)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCInterface;
  BOOL result = -[NSXPCInterface init](&v3, sel_init);
  if (result)
  {
    result->_remoteVersion = 1LL;
    result->_knownSelectorsLock._os_unfair_lock_opaque = 0;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  methodInfo = self->_methodInfo;
  if (methodInfo)
  {
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_NSXPCInterfaceMethodInfoDealloc, 0LL);
    CFRelease(self->_methodInfo);
  }

  knownSelectors = self->_knownSelectors;
  if (knownSelectors) {
    CFRelease(knownSelectors);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSXPCInterface;
  -[NSXPCInterface dealloc](&v5, sel_dealloc);
}

- (id)debugDescription
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  protocol = self->_protocol;
  if (protocol) {
    Name = protocol_getName(protocol);
  }
  else {
    Name = 0LL;
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSXPCInterface;
  id v5 = -[NSXPCInterface debugDescription](&v10, sel_debugDescription);
  uint64_t v6 = "(none set)";
  if (Name) {
    uint64_t v6 = Name;
  }
  BOOL v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@\nProtocol: %s\n",  v5,  v6);
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  methodInfo = self->_methodInfo;
  if (methodInfo) {
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_NSXPCInterfaceDebugDescriptionHelper, v7);
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return v7;
}

+ (id)signatureForBlock:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", _Block_signature(a3));
  }
  else {
    return 0LL;
  }
}

- (void)setProtocol:(Protocol *)protocol
{
  cls[386] = *(Class *)MEMORY[0x1895F89C0];
  if (self->_protocol != protocol)
  {
    id v5 = (void *)MEMORY[0x186E1FF60]();
    os_unfair_lock_lock(&self->_knownSelectorsLock);
    os_unfair_lock_lock_with_options();
    Name = protocol_getName(protocol);
    if (!strncmp(Name, "EXExtensionContextHosting", 0x19uLL)) {
      self->_specialCaseObject = 1;
    }
    if (strchr(Name, 46)) {
      BOOL v7 = @"..__NSXPCInterfaceProxy_%s";
    }
    else {
      BOOL v7 = @"__NSXPCInterfaceProxy_%s";
    }
    BOOL v8 = -[NSString UTF8String]( +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, Name),  "UTF8String");
    Class v9 = objc_lookUpClass(v8);
    bzero(cls, 0xC10uLL);
    if (!v9)
    {
      objc_super v10 = (objc_class *)objc_opt_class();
      cls[0] = objc_allocateClassPair(v10, v8, 0LL);
    }

    methodInfo = self->_methodInfo;
    if (methodInfo) {
      CFRelease(methodInfo);
    }
    self->_methodInfo = 0LL;
    setProtocolMetadata(protocol, (uint64_t)cls);
    if (cls[0])
    {
      setProtocolContextFlush((uint64_t)cls);
      objc_registerClassPair(cls[0]);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&setProtocol__globalRuntimeLockForObjC);
    BOOL v12 = cls[0];
    if (v9) {
      BOOL v12 = v9;
    }
    self->_xpcDOSubclass = v12;
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    self->_protocol = protocol;
    objc_autoreleasePoolPop(v5);
  }

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setClasses:(NSSet *)classes forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  protocol = self->_protocol;
  if (!protocol)
  {
    v31 = _NSMethodExceptionProem((objc_class *)self, a2);
    v26 = @"%@: Protocol must be set before calling this method.";
LABEL_29:
    v28 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v26, v31, v32, v33);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v28 userInfo:0]);
    goto LABEL_30;
  }

  Name = (char *)sel;
  if (!sel)
  {
    v31 = _NSMethodExceptionProem((objc_class *)self, a2);
    v26 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_29;
  }

  BOOL v12 = ofReply;
  uint64_t v6 = (__objc2_class *)arg;
  if (!selectorInProtocol(sel, protocol))
  {
    uint64_t v6 = &OBJC_CLASS___NSString;
    v27 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = (char *)sel_getName(Name);
    v32 = Name;
    v33 = protocol_getName(protocol);
    v31 = v27;
    v26 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
    goto LABEL_29;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_22:
    unint64_t v21 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Classes argument must be an NSSet of Class objects.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v21);
LABEL_31:
    __break(1u);
    return;
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  uint64_t v14 = -[NSSet countByEnumeratingWithState:objects:count:]( classes,  "countByEnumeratingWithState:objects:count:",  &v35,  v34,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v36;
LABEL_7:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(classes);
      }
      if (!class_getName(*(Class *)(*((void *)&v35 + 1) + 8 * v16))) {
        goto LABEL_22;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = -[NSSet countByEnumeratingWithState:objects:count:]( classes,  "countByEnumeratingWithState:objects:count:",  &v35,  v34,  16LL);
        if (v14) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v17 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, Name, 1);
  v18 = v17;
  if (!v17) {
    goto LABEL_23;
  }
  uint64_t v19 = 2LL;
  if (v12) {
    uint64_t v19 = 1LL;
  }
  id v20 = (id)[(id)v17[v19] mutableCopy];
  BOOL v8 = v20;
  if (!v20)
  {
LABEL_23:
    v22 = _NSMethodExceptionProem((objc_class *)self, a2);
    v23 = sel_getName(Name);
    v24 = @"selector";
    if (v12) {
      v24 = @"reply block of selector";
    }
    v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: No arguments were detected for %@ %s",  v22,  v24,  v23);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v25 userInfo:0]);
    goto LABEL_31;
  }

  if ([v20 count] <= (unint64_t)v6)
  {
LABEL_30:
    v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v30 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld.", v29, v6, sel_getName(Name), objc_msgSend(v8, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v30);
    goto LABEL_31;
  }

  [v8 replaceObjectAtIndex:v6 withObject:classes];
  if (v12)
  {

    v18[1] = [v8 copy];
  }

  else
  {

    v18[2] = [v8 copy];
  }

  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (NSSet)classesForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  BOOL v8 = a2;
  protocol = self->_protocol;
  if (!protocol)
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    unint64_t v21 = @"%@: Protocol must be set before calling this method.";
LABEL_21:
    v22 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v21, v25, v26, v27);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v22 userInfo:0]);
    goto LABEL_22;
  }

  Name = (char *)sel;
  if (!sel)
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    unint64_t v21 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_21;
  }

  BOOL v11 = ofReply;
  id v5 = (__objc2_class *)arg;
  if (!selectorInProtocol(sel, protocol))
  {
    id v5 = &OBJC_CLASS___NSString;
    BOOL v8 = (const char *)_NSMethodExceptionProem((objc_class *)self, v8);
    Name = (char *)sel_getName(Name);
    v26 = Name;
    v27 = protocol_getName(protocol);
    v25 = (NSString *)v8;
    unint64_t v21 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
    goto LABEL_21;
  }

  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v12 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, Name, 1);
  if (!v12) {
    goto LABEL_15;
  }
  uint64_t v13 = 2LL;
  if (v11) {
    uint64_t v13 = 1LL;
  }
  BOOL v7 = (void *)v12[v13];
  if (!v7)
  {
LABEL_15:
    uint64_t v17 = _NSMethodExceptionProem((objc_class *)self, v8);
    v18 = sel_getName(Name);
    uint64_t v19 = @"selector";
    if (v11) {
      uint64_t v19 = @"reply block of selector";
    }
    id v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: No arguments were detected for %@ %s",  v17,  v19,  v18);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v20 userInfo:0]);
    goto LABEL_23;
  }

  if ([(id)v12[v13] count] <= (unint64_t)v5)
  {
LABEL_22:
    v23 = _NSMethodExceptionProem((objc_class *)self, v8);
    v24 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld.", v23, v5, sel_getName(Name), objc_msgSend(v7, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v24);
LABEL_23:
    __break(1u);
    return result;
  }

  uint64_t v14 = (NSSet *)(id)[v7 objectAtIndex:v5];
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  if (!v14 || (objc_opt_isKindOfClass() & 1) != 0) {
    return (NSSet *)[MEMORY[0x189604010] set];
  }
  Class = object_getClass(v14);
  if (class_isMetaClass(Class)) {
    return (NSSet *)[MEMORY[0x189604010] setWithObject:v14];
  }
  else {
    return v14;
  }
}

- (void)setInterface:(NSXPCInterface *)ifc forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  objc_super v10 = self;
  protocol = self->_protocol;
  if (!protocol)
  {
    v42 = _NSMethodExceptionProem((objc_class *)self, a2);
    v29 = @"%@: Protocol must be set before calling this method.";
LABEL_35:
    v30 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v29, v42, v43, v44);
    goto LABEL_36;
  }

  Name = (char *)sel;
  if (!sel)
  {
    v42 = _NSMethodExceptionProem((objc_class *)self, a2);
    v29 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_35;
  }

  BOOL v12 = ofReply;
  uint64_t v6 = (__objc2_class *)arg;
  if (!selectorInProtocol(sel, protocol))
  {
    uint64_t v6 = &OBJC_CLASS___NSString;
    objc_super v10 = _NSMethodExceptionProem((objc_class *)v10, a2);
    Name = (char *)sel_getName(Name);
    v30 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.",  v10,  Name,  protocol_getName(protocol));
LABEL_36:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v30 userInfo:0]);
LABEL_37:
    v31 = _NSMethodExceptionProem((objc_class *)v10, a2);
    v32 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Argument index %ld is out of range for selector (%s). The maximum index is %ld.", v31, v6, sel_getName(Name), objc_msgSend(v8, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v32);
LABEL_43:
    __break(1u);
    return;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = _NSMethodExceptionProem((objc_class *)v10, a2);
    v29 = @"%@: Invalid value for interface argument.";
    goto LABEL_35;
  }

  os_unfair_lock_lock((os_unfair_lock_t)v10 + 12);
  uint64_t v14 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)v10, Name, 1);
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_28;
  }
  uint64_t v16 = 2LL;
  if (v12) {
    uint64_t v16 = 1LL;
  }
  id v17 = (id)[(id)v14[v16] mutableCopy];
  BOOL v8 = v17;
  if (!v17)
  {
LABEL_28:
    v25 = _NSMethodExceptionProem((objc_class *)v10, a2);
    v26 = sel_getName(Name);
    v27 = @"selector";
    if (v12) {
      v27 = @"reply block of selector";
    }
    v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: No arguments were detected for %@ %s",  v25,  v27,  v26);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v28 userInfo:0]);
    goto LABEL_43;
  }

  if (!v12)
  {
    unint64_t v21 = (void *)methodSignatureForSelectorInProtocol(Name, *((Protocol **)v10 + 1));
    v22 = v21;
    if (!v21)
    {
      __int128 v37 = _NSMethodExceptionProem((objc_class *)v10, a2);
      __int128 v38 = sel_getName(Name);
      uint64_t v39 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Selector '%s' not found in protocol '%s'.", v37, v38, protocol_getName(*((Protocol **)v10 + 1))), 0 reason userInfo];
      objc_exception_throw(v39);
      goto LABEL_43;
    }

    if ((unint64_t)[v21 numberOfArguments] >= 3
      && (unint64_t)&v6->isa + 2 < [v22 numberOfArguments])
    {
      v23 = (_WORD *)objc_msgSend(v22, "_argInfo:");
      __int16 v24 = v23[17];
      if ((v24 & 0x80) != 0) {
        __int16 v24 = *(_WORD *)(*(void *)v23 + 34LL);
      }
      if ((v24 & 0x2000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_24;
    }

- (NSXPCInterface)interfaceForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  BOOL v7 = a2;
  protocol = self->_protocol;
  if (!protocol)
  {
    __int16 v24 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v16 = @"%@: Protocol must be set before calling this method.";
LABEL_16:
    id v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, v24, v25, v26);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v17 userInfo:0]);
LABEL_17:
    id v18 = _NSMethodExceptionProem((objc_class *)self, v7);
    Name = sel_getName(v5);
    __int16 v20 = @"selector";
    if (v6) {
      __int16 v20 = @"reply block of selector";
    }
    unint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: No arguments were detected for %@ %s",  v18,  v20,  Name);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v21 userInfo:0]);
    goto LABEL_21;
  }

  id v5 = (char *)sel;
  if (!sel)
  {
    __int16 v24 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v16 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_16;
  }

  BOOL v6 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    BOOL v7 = (const char *)_NSMethodExceptionProem((objc_class *)self, v7);
    id v5 = (char *)sel_getName(v5);
    v25 = v5;
    v26 = protocol_getName(protocol);
    __int16 v24 = (NSString *)v7;
    uint64_t v16 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
    goto LABEL_16;
  }

  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v11 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, v5, 0);
  if (!v11)
  {
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    return 0LL;
  }

  uint64_t v12 = 2LL;
  if (v6) {
    uint64_t v12 = 1LL;
  }
  uint64_t v13 = (void *)v11[v12];
  if (!v13) {
    goto LABEL_17;
  }
  if ([(id)v11[v12] count] <= arg)
  {
    v22 = _NSMethodExceptionProem((objc_class *)self, v7);
    v23 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Argument index %ld is out of range for selector (%s)", v22, arg, sel_getName(v5)), 0 reason userInfo];
    objc_exception_throw(v23);
LABEL_21:
    __break(1u);
    return result;
  }

  uint64_t v14 = (NSXPCInterface *)(id)[v13 objectAtIndex:arg];
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return v14;
  }
  else {
    return 0LL;
  }
}

- (void)setXPCType:(xpc_type_t)type forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  protocol = self->_protocol;
  if (!protocol)
  {
    v28 = _NSMethodExceptionProem((objc_class *)self, a2);
    __int16 v24 = @"%@: Protocol must be set before calling this method.";
LABEL_21:
    v25 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v24, v28, Name, v30);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v25 userInfo:0]);
    goto LABEL_22;
  }

  BOOL v7 = (char *)sel;
  if (!sel)
  {
    v28 = _NSMethodExceptionProem((objc_class *)self, a2);
    __int16 v24 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_21;
  }

  BOOL v12 = ofReply;
  unint64_t v6 = arg;
  if (!selectorInProtocol(sel, protocol))
  {
    unint64_t v6 = (unint64_t)_NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(v7);
    v30 = protocol_getName(protocol);
    v28 = (NSString *)v6;
    __int16 v24 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
    goto LABEL_21;
  }

  os_unfair_lock_lock(&self->_knownSelectorsLock);
  uint64_t v14 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, v7, 1);
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_15;
  }
  uint64_t v16 = 2LL;
  if (v12) {
    uint64_t v16 = 1LL;
  }
  id v17 = (id)[(id)v14[v16] mutableCopy];
  BOOL v8 = v17;
  if (!v17)
  {
LABEL_15:
    __int16 v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    unint64_t v21 = sel_getName(v7);
    v22 = @"selector";
    if (v12) {
      v22 = @"reply block of selector";
    }
    v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: No arguments were detected for %@ %s",  v20,  v22,  v21);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v23 userInfo:0]);
    goto LABEL_23;
  }

  if ([v17 count] <= v6)
  {
LABEL_22:
    v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    v27 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld.", v26, v6, sel_getName(v7), objc_msgSend(v8, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v27);
LABEL_23:
    __break(1u);
    return;
  }

  uint64_t v18 = objc_opt_new();
  uint64_t v19 = (void *)v18;
  if (v18) {
    *(void *)(v18 + 8) = type;
  }
  [v8 replaceObjectAtIndex:v6 withObject:v18];

  if (v12)
  {

    v15[1] = [v8 copy];
  }

  else
  {

    v15[2] = [v8 copy];
  }

  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (xpc_type_t)XPCTypeForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  BOOL v7 = a2;
  protocol = self->_protocol;
  if (!protocol)
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    id v17 = @"%@: Protocol must be set before calling this method.";
LABEL_17:
    uint64_t v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v25, v26, v27);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v18 userInfo:0]);
LABEL_18:
    uint64_t v19 = _NSMethodExceptionProem((objc_class *)self, v7);
    Name = sel_getName(v5);
    unint64_t v21 = @"selector";
    if (v6) {
      unint64_t v21 = @"reply block of selector";
    }
    v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: No arguments were detected for %@ %s",  v19,  v21,  Name);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v22 userInfo:0]);
    goto LABEL_22;
  }

  id v5 = (char *)sel;
  if (!sel)
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    id v17 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_17;
  }

  BOOL v6 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    BOOL v7 = (const char *)_NSMethodExceptionProem((objc_class *)self, v7);
    id v5 = (char *)sel_getName(v5);
    v26 = v5;
    v27 = protocol_getName(protocol);
    v25 = (NSString *)v7;
    id v17 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
    goto LABEL_17;
  }

  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v11 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, v5, 0);
  if (!v11)
  {
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    return 0LL;
  }

  uint64_t v12 = 2LL;
  if (v6) {
    uint64_t v12 = 1LL;
  }
  uint64_t v13 = (void *)v11[v12];
  if (!v13) {
    goto LABEL_18;
  }
  if ([(id)v11[v12] count] <= arg)
  {
    v23 = _NSMethodExceptionProem((objc_class *)self, v7);
    __int16 v24 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld.", v23, arg, sel_getName(v5), objc_msgSend(v13, "count") - 1), 0 reason userInfo];
    objc_exception_throw(v24);
LABEL_22:
    __break(1u);
    return result;
  }

  id v14 = (id)[v13 objectAtIndex:arg];
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  char isKindOfClass = objc_opt_isKindOfClass();
  xpc_type_t result = 0LL;
  if ((isKindOfClass & 1) != 0)
  {
    if (v14) {
      return (xpc_type_t)*((void *)v14 + 1);
    }
  }

  return result;
}

- (void)setClass:(Class)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5 ofReply:(BOOL)a6
{
}

- (Class)classForSelector:(SEL)a3 argumentIndex:(unint64_t)a4 ofReply:(BOOL)a5
{
  return (Class)-[NSSet anyObject]( -[NSXPCInterface classesForSelector:argumentIndex:ofReply:]( self,  "classesForSelector:argumentIndex:ofReply:",  a3,  a4,  a5),  "anyObject");
}

- (id)replyBlockSignatureForSelector:(SEL)a3
{
  protocol = self->_protocol;
  if (!protocol)
  {
    protocol = (Protocol *)&OBJC_CLASS___NSString;
    id v17 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v13 = @"%@: Protocol must be set before calling this method.";
LABEL_12:
    uint64_t v15 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v17, Name, v19);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v15 userInfo:0]);
    objc_begin_catch(v16);
    os_unfair_lock_unlock((os_unfair_lock_t)protocol);
    objc_exception_rethrow();
    goto LABEL_13;
  }

  if (!a3)
  {
    protocol = (Protocol *)&OBJC_CLASS___NSString;
    id v17 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v13 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_12;
  }

  if (!selectorInProtocol(a3, protocol))
  {
    id v14 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(a3);
    uint64_t v19 = protocol_getName(protocol);
    id v17 = v14;
    uint64_t v13 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
    goto LABEL_12;
  }

  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v7 = (id *)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  BOOL v8 = v7;
  if (!v7)
  {
    Class v9 = 0LL;
    goto LABEL_8;
  }

  Class v9 = (void *)[*v7 _typeString];
  if (((_DWORD)v8[5] & 0x80000000) == 0)
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    return v9;
  }

  objc_super v10 = _NSMethodExceptionProem((objc_class *)self, a2);
  BOOL v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Selector %s has no reply block.", v10, sel_getName(a3)), 0 reason userInfo];
  objc_exception_throw(v11);
LABEL_13:
  __break(1u);
  return result;
}

- (void)setVersion:(unint64_t)a3 forSelector:(SEL)a4
{
  protocol = self->_protocol;
  if (!protocol)
  {
    objc_super v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Protocol must be set before calling this method.",  _NSMethodExceptionProem((objc_class *)self, a2),  v14,  v15);
LABEL_10:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v10 userInfo:0]);
    objc_begin_catch(v13);
    os_unfair_lock_unlock((os_unfair_lock_t)a2);
    objc_exception_rethrow();
    __break(1u);
    return;
  }

  if (!a4)
  {
    objc_super v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Selector argument must be non-NULL.",  _NSMethodExceptionProem((objc_class *)self, a2),  v14,  v15);
    goto LABEL_10;
  }

  if (!selectorInProtocol(a4, protocol))
  {
    BOOL v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(a4);
    objc_super v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.",  v11,  Name,  protocol_getName(protocol));
    goto LABEL_10;
  }

  os_unfair_lock_lock(&self->_knownSelectorsLock);
  Class v9 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a4, 1);
  if (v9) {
    v9[3] = a3;
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (unint64_t)versionForSelector:(SEL)a3
{
  objc_super v3 = (os_unfair_lock_s *)a2;
  protocol = self->_protocol;
  if (!protocol)
  {
    uint64_t v13 = _NSMethodExceptionProem((objc_class *)self, a2);
    objc_super v10 = @"%@: Protocol must be set before calling this method.";
LABEL_11:
    BOOL v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v13, Name, v15);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v11 userInfo:0]);
    objc_begin_catch(v12);
    os_unfair_lock_unlock(v3);
    objc_exception_rethrow();
    __break(1u);
    return result;
  }

  if (!a3)
  {
    uint64_t v13 = _NSMethodExceptionProem((objc_class *)self, a2);
    objc_super v10 = @"%@: Selector argument must be non-NULL.";
    goto LABEL_11;
  }

  if (!selectorInProtocol(a3, protocol))
  {
    objc_super v3 = (os_unfair_lock_s *)_NSMethodExceptionProem((objc_class *)self, (const char *)v3);
    Name = sel_getName(a3);
    uint64_t v15 = protocol_getName(protocol);
    uint64_t v13 = (NSString *)v3;
    objc_super v10 = @"%@: Selector '%s' is not in protocol '%s', or is not an instance method.";
    goto LABEL_11;
  }

  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v7 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 0);
  if (v7) {
    unint64_t v8 = v7[3];
  }
  else {
    unint64_t v8 = 1LL;
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return v8;
}

- (unint64_t)version
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = 1LL;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  methodInfo = self->_methodInfo;
  if (methodInfo) {
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_maxVersionFinder, v6);
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v6[0];
}

- (unint64_t)_remoteVersion
{
  return self->_remoteVersion;
}

- (void)set_remoteVersion:(unint64_t)a3
{
  self->_remoteVersion = a3;
}

- (unint64_t)_respondsToRemoteSelector:(SEL)a3
{
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6)
  {
    unint64_t v7 = v6[3];
    os_unfair_lock_unlock(p_knownSelectorsLock);
    if (v7) {
      return 2LL * (-[NSXPCInterface _remoteVersion](self, "_remoteVersion") < v7);
    }
  }

  else
  {
    os_unfair_lock_unlock(p_knownSelectorsLock);
  }

  return 1LL;
}

- (id)_generateAndCacheMethodSignatureForRemoteSelector:(SEL)a3
{
  uint64_t v5 = methodSignatureForSelectorInProtocol(a3, self->_protocol);
  if (!v5) {
    return 0LL;
  }
  BOOL v6 = (const void *)v5;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  knownSelectors = self->_knownSelectors;
  if (!knownSelectors)
  {
    knownSelectors = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  &kNSXPCSelKeyCallbacks,  MEMORY[0x189605250]);
    self->_knownSelectors = knownSelectors;
  }

  Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
  if (!Value)
  {
    Mutable = self->_knownSelectors;
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  &kNSXPCSelKeyCallbacks,  MEMORY[0x189605250]);
      self->_knownSelectors = Mutable;
    }

    CFDictionarySetValue(Mutable, a3, v6);
    Value = (void *)v6;
  }

  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return Value;
}

- (id)_methodSignatureForReplyBlockOfSelector:(SEL)a3
{
  if (!self->_protocol) {
    return 0LL;
  }
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v6 = (id *)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6) {
    id v7 = *v6;
  }
  else {
    id v7 = 0LL;
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

- (BOOL)_hasProxiesInArgumentsOfSelector:(SEL)a3
{
  if (self->_protocol)
  {
    p_knownSelectorsLock = &self->_knownSelectorsLock;
    os_unfair_lock_lock(&self->_knownSelectorsLock);
    BOOL v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
    if (v6) {
      BOOL v7 = *((_BYTE *)v6 + 44) != 0;
    }
    else {
      BOOL v7 = 0;
    }
    os_unfair_lock_unlock(p_knownSelectorsLock);
    return v7;
  }

  else
  {
    Class v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: No protocol has been set on interface", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    objc_begin_catch(v10);
    os_unfair_lock_unlock((os_unfair_lock_t)&OBJC_CLASS___NSString);
    objc_exception_rethrow();
    __break(1u);
  }

  return result;
}

- (id)_interfaceForArgument:(unint64_t)a3 ofSelector:(SEL)a4 reply:(BOOL)a5
{
  BOOL v5 = a5;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  objc_super v10 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a4, 0);
  if (v10)
  {
    uint64_t v11 = 2LL;
    if (v5) {
      uint64_t v11 = 1LL;
    }
    uint64_t v12 = (void *)v10[v11];
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  if ([v12 count] <= a3)
  {
    id v13 = 0LL;
  }

  else
  {
    id v13 = (id)[v12 objectAtIndex:a3];
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v13 = 0LL;
    }
  }

  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v13;
}

- (Class)_returnClassForSelector:(SEL)a3
{
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  BOOL v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6) {
    BOOL v7 = (objc_class *)v6[4];
  }
  else {
    BOOL v7 = 0LL;
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

@end