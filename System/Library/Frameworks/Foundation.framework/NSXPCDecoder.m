@interface NSXPCDecoder
- (BOOL)_testClass:(Class)a3 isAllowedByAllowList:(id)a4;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (NSXPCDecoder)init;
- (NSXPCDecoder)initWithInterface:(id)a3;
- (const)_decodeCStringForKey:(id)a3;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)__decoderInfoForAllowedClassesWarning;
- (id)_currentClassAllowlist;
- (id)_decodeArrayOfObjectsForKey:(id)a3;
- (id)_decodeCollectionOfClass:(Class)a3 allowedClasses:(id)a4 forKey:(id)a5;
- (id)_decodeObjectOfClasses:(id)a3 atObject:(id *)a4;
- (id)_decodeReplyFromXPCObject:(id)a3 forSelector:(SEL)a4;
- (id)_xpcObjectForIndex:(int64_t)a3;
- (id)allowedClasses;
- (id)connection;
- (id)debugDescription;
- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4;
- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5;
- (id)decodeObject;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)decodeXPCObjectForKey:(id)a3;
- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4;
- (int)__decodeXPCObject:(id)a3 allowingSimpleMessageSend:(BOOL)a4 outInvocation:(id *)a5 outArguments:(id *)a6 outArgumentsMaxCount:(unint64_t)a7 outMethodSignature:(id *)a8 outSelector:(SEL *)a9 isReply:(BOOL)a10 replySelector:(SEL)a11;
- (int)_decodeMessageFromXPCObject:(id)a3 allowingSimpleMessageSend:(BOOL)a4 outInvocation:(id *)a5 outArguments:(id *)a6 outArgumentsMaxCount:(unint64_t)a7 outMethodSignature:(id *)a8 outSelector:(SEL *)a9;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (void)_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded;
- (void)_setConnection:(id)a3;
- (void)_validateAllowedClass:(Class)a3 forKey:(id)a4 allowingInvocations:(BOOL)a5;
- (void)_validateAllowedXPCType:(_xpc_type_s *)a3 forKey:(id)a4;
- (void)_validateReusedReference:(id)a3 forKey:(id)a4;
- (void)beginReadingFromXPCObject:(id)a3;
- (void)dealloc;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4 size:(unint64_t)a5;
@end

@implementation NSXPCDecoder

- (NSXPCDecoder)initWithInterface:(id)a3
{
  v4 = -[NSXPCDecoder init](self, "init");
  if (v4) {
    v4->_interface = (NSXPCInterface *)a3;
  }
  return v4;
}

- (int)_decodeMessageFromXPCObject:(id)a3 allowingSimpleMessageSend:(BOOL)a4 outInvocation:(id *)a5 outArguments:(id *)a6 outArgumentsMaxCount:(unint64_t)a7 outMethodSignature:(id *)a8 outSelector:(SEL *)a9
{
  LOBYTE(v10) = 0;
  return -[NSXPCDecoder __decodeXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:isReply:replySelector:]( self,  "__decodeXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignatur e:outSelector:isReply:replySelector:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  v10,  0LL);
}

- (int)__decodeXPCObject:(id)a3 allowingSimpleMessageSend:(BOOL)a4 outInvocation:(id *)a5 outArguments:(id *)a6 outArgumentsMaxCount:(unint64_t)a7 outMethodSignature:(id *)a8 outSelector:(SEL *)a9 isReply:(BOOL)a10 replySelector:(SEL)a11
{
  BOOL v15 = a4;
  uint64_t v81 = *MEMORY[0x1895F89C0];
  -[NSXPCDecoder _startReadingFromXPCObject:](self, "_startReadingFromXPCObject:", a3);
  unint64_t offset = self->_rootObject.offset;
  unint64_t v18 = offset + 9;
  uint64_t v19 = offset >= 0xFFFFFFFFFFFFFFF7LL;
  uint64_t v20 = v19 << 63 >> 63;
  if (v20 != v19 || v20 < 0 || (p_decoder = (uint64_t *)&self->_decoder, self->_decoder.dataLen <= v18))
  {
    v61 = (void *)MEMORY[0x189603F70];
    v62 = @"NSInvalidUnarchiveOperationException";
    v63 = @"Expected to find array of NSInvocation metadata but there were no entries";
    goto LABEL_73;
  }

  uint64_t v22 = *p_decoder;
  unint64_t v23 = *(void *)(offset + *p_decoder + 1);
  unint64_t v79 = v18;
  unint64_t v80 = v23;
  if (v23 < v18)
  {
    v61 = (void *)MEMORY[0x189603F70];
    v62 = @"NSInvalidUnarchiveOperationException";
    v63 = @"Expected to find SEL for NSInvocation";
    goto LABEL_73;
  }

  unint64_t v77 = v18;
  int v24 = *(_BYTE *)(v22 + v18) & 0xF0;
  int v78 = v24;
  v72 = a5;
  if (a10)
  {
    if (v24 != 224)
    {
      v65 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ received a reply that has should have been a reply, but does not have a null selector.",  self,  v67,  v68,  v70);
      goto LABEL_84;
    }

    v25 = a11;
    SEL v76 = a11;
  }

  else
  {
    if (v24 != 112)
    {
      v65 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ received a message that should have had a selector, but it does not (non-string).",  self,  v67,  v68,  v70);
      goto LABEL_84;
    }

    v26 = (const char *)_NSXPCSerializationASCIIStringForObject(p_decoder, &v77);
    if (!v26)
    {
LABEL_78:
      v65 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ received a message that should have had a selector, but it does not.",  self,  v67,  v68,  v70);
      goto LABEL_84;
    }

    v27 = sel_registerName(v26);
    v25 = v27;
    SEL v76 = v27;
    if (a9) {
      *a9 = v27;
    }
  }

  v71 = a8;
  v74 = 0LL;
  v75 = 0LL;
  if (-[NSXPCInterface _selectorIsAllowed:isReply:methodSignature:allowedClasses:]( self->_interface,  "_selectorIsAllowed:isReply:methodSignature:allowedClasses:",  v25,  a10,  &v74,  &v75))
  {
    BOOL v28 = v74 == 0LL;
  }

  else
  {
    BOOL v28 = 1;
  }

  if (v28)
  {
    v65 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ received a message or reply block that is not in the interface of the remote object (%s), dropping.",  self,  sel_getName(v25),  v68,  v70);
    goto LABEL_84;
  }

  _getLastByteOfValueIncludingMarker(p_decoder, v18, &v79);
  unint64_t v29 = v79 + 1;
  uint64_t v30 = v79 == -1LL;
  uint64_t v31 = v30 << 63 >> 63;
  ++v79;
  if (v31 != v30 || v31 < 0) {
    goto LABEL_76;
  }
  if (v80 < v29 || self->_decoder.dataLen <= v29)
  {
    v61 = (void *)MEMORY[0x189603F70];
    v62 = @"NSInvalidUnarchiveOperationException";
    v63 = @"Expected to find types for NSInvocation";
    goto LABEL_73;
  }

  unint64_t v77 = v29;
  int v78 = *(_BYTE *)(*p_decoder + v29) & 0xF0;
  if (v78 != 112)
  {
    v65 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ received a message that has no NSInvocation types (non-string) (%s), dropping.",  self,  sel_getName(v25),  v68,  v70);
    goto LABEL_84;
  }

  uint64_t v32 = _NSXPCSerializationASCIIStringForObject(p_decoder, &v77);
  if (!v32) {
    goto LABEL_78;
  }
  v33 = (void *)[MEMORY[0x189603FA0] signatureWithObjCTypes:v32];
  v34 = v33;
  v35 = v74;
  if (!v33 || !v74) {
    goto LABEL_27;
  }
  if (([v33 isEqual:v74] & 1) == 0)
  {
    v35 = v74;
LABEL_27:
    if (v34 && v35 && ([v35 _isCompatibleWithMethodSignature:v34] & 1) != 0)
    {
      char v36 = 0;
      goto LABEL_31;
    }

    Name = sel_getName(v25);
    uint64_t v69 = [v34 _cTypeString];
    v65 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ received a message (%s) with an incompatible message signature (wire: %s vs local: %s)",  self,  Name,  v69,  [v74 _cTypeString]);
LABEL_84:
    v63 = (const __CFString *)v65;
    v61 = (void *)MEMORY[0x189603F70];
    v64 = &NSInvalidUnarchiveOperationException;
    goto LABEL_85;
  }

  char v36 = 1;
LABEL_31:
  _getLastByteOfValueIncludingMarker(p_decoder, v29, &v79);
  unint64_t v37 = v79 + 1;
  uint64_t v38 = v79 == -1LL;
  uint64_t v39 = v38 << 63 >> 63;
  if (v39 != v38 || v39 < 0)
  {
LABEL_76:
    v61 = (void *)MEMORY[0x189603F70];
    v62 = @"NSInvalidUnarchiveOperationException";
    v63 = @"Overflow of array data";
    goto LABEL_73;
  }

  if (v80 < v37 || self->_decoder.dataLen <= v37)
  {
    v61 = (void *)MEMORY[0x189603F70];
    v62 = @"NSInvalidUnarchiveOperationException";
    v63 = @"Expected to find arguments for NSInvocation";
    goto LABEL_73;
  }

  unint64_t v77 = v79 + 1;
  int v78 = *(_BYTE *)(*p_decoder + v37) & 0xF0;
  if (v78 != 160)
  {
    v65 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ received a message that has no NSInvocation arguments (non-array) (%s), dropping.",  self,  sel_getName(v25),  v68,  v70);
    goto LABEL_84;
  }

  if (v15 && [v74 _isAllObjects] && objc_msgSend(v74, "numberOfArguments") <= a7 + 2)
  {
    unint64_t v53 = [v34 numberOfArguments];
    unint64_t v54 = 1LL;
    if (!a10) {
      unint64_t v54 = 2LL;
    }
    unint64_t v55 = v53 - v54;
    if (v53 > v54)
    {
      _NSXPCSerializationDecodeInvocationObjectOnlyArgumentArray((uint64_t)a6, a7, v34, self, p_decoder, &v77, v75);
      uint64_t v56 = 0LL;
      do
      {
        id v57 = a6[v56];
        if (v57 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          id v58 = -[NSXPCInterface _interfaceForArgument:ofSelector:reply:]( self->_interface,  "_interfaceForArgument:ofSelector:reply:",  v56,  v25,  a10);
          if (!v58 || (v59 = v58, (objc_opt_isKindOfClass() & 1) == 0))
          {
            while (1)
            {
LABEL_74:
              v63 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Received a proxy object but the protocol does not describe a proxy object for this argument.",  self);
              v61 = (void *)MEMORY[0x189603F70];
              v64 = (const NSExceptionName *)MEMORY[0x189603A60];
LABEL_85:
              v62 = (const __CFString *)*v64;
LABEL_73:
              objc_exception_throw((id)[v61 exceptionWithName:v62 reason:v63 userInfo:0]);
            }
          }

          objc_setProperty_atomic(v57, v60, v59, 16LL);
        }

        ++v56;
      }

      while (v55 != v56);
    }

    v51 = v71;
    id *v72 = 0LL;
    int result = 1;
    if (v71) {
      goto LABEL_58;
    }
  }

  else
  {
    v40 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v34];
    _NSXPCSerializationDecodeInvocationArgumentArray(v40, v34, self, p_decoder, &v77, v75);
    if ((v36 & 1) == 0)
    {
      id v41 = v40;
      v40 = convertInvocationToMethodSignature(v41, v74, 0);
    }

    if (a10)
    {
      uint64_t v42 = 1LL;
    }

    else
    {
      [v40 setArgument:&v76 atIndex:1];
      uint64_t v42 = 2LL;
    }

    uint64_t v43 = [v34 numberOfArguments];
    uint64_t v44 = v43 - v42;
    if (v43 != v42)
    {
      for (uint64_t i = 0LL; v44 != i; ++i)
      {
        v46 = (_WORD *)[v34 _argInfo:v42 + i];
        __int16 v47 = v46[17];
        if ((v47 & 0x80) != 0) {
          __int16 v47 = *(_WORD *)(*(void *)v46 + 34LL);
        }
        if ((v47 & 0x2000) != 0)
        {
          selfa = 0LL;
          [v40 getArgument:&selfa atIndex:v42 + i];
          if (selfa)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              id v48 = -[NSXPCInterface _interfaceForArgument:ofSelector:reply:]( self->_interface,  "_interfaceForArgument:ofSelector:reply:",  i,  v76,  a10);
              if (!v48) {
                goto LABEL_74;
              }
              v49 = v48;
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_74;
              }
              if (selfa) {
                objc_setProperty_atomic(selfa, v50, v49, 16LL);
              }
            }
          }
        }
      }
    }

    v51 = v71;
    id *v72 = v40;
    if (v71)
    {
      v34 = (void *)[v40 methodSignature];
      int result = 0;
LABEL_58:
      id *v51 = v34;
      return result;
    }

    return 0;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  oolObjects = self->_oolObjects;
  if (oolObjects) {
    xpc_release(oolObjects);
  }
  objectReferences = self->_decoder.objectReferences;
  if (objectReferences)
  {
    CFRelease(objectReferences);
    self->_decoder.objectReferences = 0LL;
  }

  int64_t allowedClassesIndex = self->_allowedClassesIndex;
  if ((allowedClassesIndex & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = 0LL;
    unsigned int v7 = 1;
    do
    {
      id v8 = self->_allowedClassesList[v6];
      if (v8)
      {

        int64_t allowedClassesIndex = self->_allowedClassesIndex;
      }

      uint64_t v6 = v7;
    }

    while (allowedClassesIndex >= v7++);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSXPCDecoder;
  -[NSXPCCoder dealloc](&v10, sel_dealloc);
}

- (id)_decodeReplyFromXPCObject:(id)a3 forSelector:(SEL)a4
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  LOBYTE(v5) = 1;
  -[NSXPCDecoder __decodeXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:isReply:replySelector:]( self,  "__decodeXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSe lector:isReply:replySelector:",  a3,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  v5,  a4);
  return (id)v6[0];
}

- (id)_decodeObjectOfClasses:(id)a3 atObject:(id *)a4
{
  Class = object_getClass(a3);
  if (class_isMetaClass(Class))
  {
    _setAllowedClass((uint64_t)self, (uint64_t)a3);
    _decodeObject_0((uint64_t)self, 0LL, (uint64_t)a4);
    if (a3) {
      self->_allowedClassesList[self->_allowedClassesIndex--] = 0LL;
    }
  }

  else
  {
    _setAllowedClasses(self, a3);
    _decodeObject_0((uint64_t)self, 0LL, (uint64_t)a4);
    objc_super v10 = v9;
    _resetAllowedClasses((uint64_t)self, (uint64_t)a3);
    return v10;
  }

  return result;
}

- (void)_validateAllowedClass:(Class)a3 forKey:(id)a4 allowingInvocations:(BOOL)a5
{
  v9 = (const __CFString *)a4;
  if (!a3)
  {
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to decode an object with no class for key '%@'.",  a4,  v17);
    goto LABEL_16;
  }

  BOOL v10 = a5;
  uint64_t v5 = a3;
  uint64_t v6 = self;
  Class Superclass = -[NSXPCDecoder _currentClassAllowlist](self, "_currentClassAllowlist");
  uint64_t v8 = (uint64_t)&OBJC_IVAR___NSXPCDecoder__strictSecureDecodingEnabled;
  if ((-[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]( (uint64_t)v6,  v5,  (uint64_t)v9,  Superclass,  v6->_strictSecureDecodingEnabled,  v6->_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded,  -[NSXPCInterface _specialCaseObject](v6->_interface, "_specialCaseObject")) & 1) == 0)
  {
    v13 = -[NSCoder __descriptionForUnexpectedClass:forKey:allowedClasses:]((NSString *)v6, (uint64_t)v5, v9, Superclass);
    goto LABEL_16;
  }

  if (!v10 || (objc_class *)MEMORY[0x189603F88] != v5 && (objc_class *)MEMORY[0x189603F28] != v5)
  {
    uint64_t v8 = 48LL;
    connection = v6->_connection;
    if (!connection
      || (-[_NSXPCConnectionClassCache containsClass:]( (os_unfair_lock_s *)connection->_dCache,  (uint64_t)v5) & 1) == 0)
    {
      if ((-[objc_class conformsToProtocol:](v5, "conformsToProtocol:", &unk_18C650CC8) & 1) != 0)
      {
        v9 = (const __CFString *)sel_supportsSecureCoding;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (-[objc_class supportsSecureCoding](v5, "supportsSecureCoding"))
          {
            Class Superclass = v5;
            do
            {
              if ((_classOverridesSelector(Superclass, sel_initWithCoder_) & 1) != 0) {
                goto LABEL_17;
              }
              Class Superclass = class_getSuperclass(Superclass);
            }

            while (Superclass);
            uint64_t v6 = (NSXPCDecoder *)&OBJC_CLASS___NSString;
            Name = class_getName(v5);
            v12 = @"Class '%s' does not implement initWithCoder:.";
          }

          else
          {
            uint64_t v6 = (NSXPCDecoder *)&OBJC_CLASS___NSString;
            Name = class_getName(v5);
            v12 = @"Class '%s' disallows secure coding. It must return YES from supportsSecureCoding.";
          }
        }

        else
        {
          uint64_t v6 = (NSXPCDecoder *)&OBJC_CLASS___NSString;
          Name = class_getName(v5);
          v12 = @"Class '%s' disallows secure coding. It must implement supportsSecureCoding and return YES.";
        }
      }

      else
      {
        uint64_t v6 = (NSXPCDecoder *)&OBJC_CLASS___NSString;
        Name = class_getName(v5);
        v12 = @"This decoder will only decode classes that adopt NSSecureCoding. Class '%s' does not adopt it.";
      }

      while (1)
      {
        v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, Name, v17);
LABEL_16:
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v13 userInfo:0]);
LABEL_17:
        Class = object_getClass(Superclass);
        uint64_t v6 = (NSXPCDecoder *)&OBJC_CLASS___NSString;
        v9 = (const __CFString *)class_getName(v5);
        Name = (const char *)v9;
        v17 = class_getName(v5);
        v12 = @"Class '%s' has a superclass that supports secure coding, but '%s' overrides -initWithCoder: and does not override +supportsSecureCoding. The class must implement +supportsSecureCoding and return YES to verify that its implementation of -initWithCoder: is secure coding compliant.";
      }

      uint64_t v15 = *(uint64_t *)((char *)&v6->super.super.super.isa + v8);
      if (v15) {
        -[_NSXPCConnectionClassCache addClass:](*(void *)(v15 + 128), (uint64_t)v5);
      }
    }
  }

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  v4[2] = *MEMORY[0x1895F89C0];
  BOOL result = _NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)v4);
  if (!v4[0]) {
    return 0;
  }
  return result;
}

- (id)_decodeArrayOfObjectsForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  uint64_t v6 = 0LL;
  if (_NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)&v9)
    && v9
    && v10 == 160)
  {
    uint64_t v6 = (void *)[MEMORY[0x189603FA8] array];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __44__NSXPCDecoder__decodeArrayOfObjectsForKey___block_invoke;
    v8[3] = &unk_189CA6008;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = v6;
    _NSXPCSerializationIterateArrayObject(p_decoder, &v9, (uint64_t)v8);
  }

  return v6;
}

BOOL __44__NSXPCDecoder__decodeArrayOfObjectsForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x186E1FF60]();
  _decodeObject_0(*(void *)(a1 + 32), *(const __CFString **)(a1 + 40), a2);
  if (v5)
  {
    [*(id *)(a1 + 48) addObject:v5];
    objc_autoreleasePoolPop(v4);
    return 1LL;
  }

  else
  {
    unsigned int v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A value in array of key %@ was decoded as nil, which is not allowed.",  *(void *)(a1 + 40));
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v7 userInfo:0]);
    return _getReferenceAtMarker(v8, v9, v10, v11);
  }

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  if (a3) {
    self->_allowedClassesList[self->_allowedClassesIndex--] = 0LL;
  }
  return result;
}

- (id)connection
{
  return self->_connection;
}

- (void)_setConnection:(id)a3
{
  connection = self->_connection;
  if (connection != a3)
  {

    self->_connection = (NSXPCConnection *)a3;
  }

- (NSXPCDecoder)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCDecoder;
  id result = -[NSXPCCoder init](&v3, sel_init);
  if (result)
  {
    result->_int64_t allowedClassesIndex = 0LL;
    result->_allowedClassesList[0] = 0LL;
    result->_collectionPointer = 0;
    result->expectedUnnestedCollectionType = 0LL;
    result->_strictSecureDecodingEnabled = 0;
    result->_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded = 0;
    result->_interface = 0LL;
  }

  return result;
}

- (void)beginReadingFromXPCObject:(id)a3
{
  p_rootObject = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->_rootObject;
  if (!_NSXPCSerializationStartRead(a3, &self->_decoder.data, (uint64_t)&self->_rootObject))
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: encoded data has been corrupted, there is no payload",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v9 userInfo:0]);
    -[NSXPCDecoder debugDescription](v10, v11);
    return;
  }

  self->_collections[self->_collectionPointer] = p_rootObject;
  xpc_object_t value = xpc_dictionary_get_value(a3, "ool");
  if (!value) {
    return;
  }
  uint64_t v8 = value;
  if (object_getClass(value) != (Class)MEMORY[0x1895F9220])
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: encoded data has been corrupted, out of line data is not an XPC array",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }

  self->_oolObjects = (OS_xpc_object *)xpc_retain(v8);
}

- (id)debugDescription
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  oolObjects = self->_oolObjects;
  if (oolObjects) {
    uint64_t v4 = (char *)MEMORY[0x186E21CF4](oolObjects, a2);
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t Data = _NSXPCSerializationDebugInfoForReadData((uint64_t *)&self->_decoder);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSXPCDecoder;
  id v6 = -[NSXPCDecoder debugDescription](&v10, sel_debugDescription);
  unsigned int v7 = "(none)";
  if (v4) {
    unsigned int v7 = v4;
  }
  uint64_t v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Container data:\n%@\n OOL XPC data: %s",  v6,  Data,  v7);
  if (v4) {
    free(v4);
  }
  return v8;
}

- (id)__decoderInfoForAllowedClassesWarning
{
  connection = (NSString *)self->_connection;
  if (connection) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@",  -[NSXPCConnection _serviceInfoForDecoder](connection));
  }
  else {
    return &stru_189CA6A28;
  }
}

- (void)_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded
{
  self->_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded = 1;
}

- (id)_currentClassAllowlist
{
  v2 = (__objc2_class *)self->_allowedClassesList[self->_allowedClassesIndex];
  objc_super v3 = (__objc2_class *)objc_opt_class();
  if (v3 != v2)
  {
    if (v3 != &OBJC_CLASS___NSXPCInterface) {
      return v2;
    }
    v2 = &OBJC_CLASS____NSXPCDistantObject;
  }

  return (id)[MEMORY[0x189604010] setWithObject:v2];
}

- (void)_validateReusedReference:(id)a3 forKey:(id)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  v13[0] = 0LL;
  id v7 = -[NSXPCDecoder _currentClassAllowlist](self, "_currentClassAllowlist");
  if ((-[NSCoder _walkAllowedClassListValidatingInstance:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:invalidElementClass:]( self,  a3,  (uint64_t)a4,  v7,  self->_strictSecureDecodingEnabled,  self->_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded,  -[NSXPCInterface _specialCaseObject](self->_interface, "_specialCaseObject"),  v13) & 1) == 0)
  {
    if (v13[0]) {
      uint64_t v8 = -[NSCoder __descriptionForUnexpectedElementClass:forContainerKey:allowedClasses:]( (NSString *)self,  v13[0],  (const __CFString *)a4,  v7);
    }
    else {
      uint64_t v8 = -[NSCoder __descriptionForUnexpectedClass:forKey:allowedClasses:]( (NSString *)self,  0LL,  (const __CFString *)a4,  v7);
    }
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v8 userInfo:0]);
    -[NSXPCDecoder _validateAllowedXPCType:forKey:](v9, v10, v11, v12);
  }

- (void)_validateAllowedXPCType:(_xpc_type_s *)a3 forKey:(id)a4
{
  if (!a3)
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to decode an xpc type with no xpc for key '%@'.",  a4,  v15,  v16);
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v9 userInfo:0]);
    -[NSXPCDecoder decodeValueOfObjCType:at:](v11, v12, v13, v14);
    return;
  }

  if (!xpc_get_class4NSXPC())
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to decode an xpc type that has no class for key '%@'.",  a4,  v15,  v16);
    goto LABEL_14;
  }

  id v7 = self->_allowedClassesList[self->_allowedClassesIndex];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to decode an xpc type but allowed list does not specify an XPC type '%@'.",  a4,  v15,  v16);
    goto LABEL_14;
  }

  if (!v7)
  {
    uint64_t v8 = 0LL;
    goto LABEL_11;
  }

  uint64_t v8 = (_xpc_type_s *)*((void *)v7 + 1);
  if (v8 != a3)
  {
LABEL_11:
    SEL v10 = @"(no key, possibly an argument to a message)";
    if (a4) {
      SEL v10 = (const __CFString *)a4;
    }
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"value for key '%@' was of unexpected XPC type '%@'. Allowed type is '%@'.",  v10,  a3,  v8);
    goto LABEL_14;
  }

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  v14[2] = *MEMORY[0x1895F89C0];
  p_decoder = (uint64_t *)&self->_decoder;
  uint64_t v8 = self->_collections[self->_collectionPointer];
  unint64_t genericIndex = self->_genericIndex;
  self->_unint64_t genericIndex = genericIndex + 1;
  if (_NSXPCSerializationCreateObjectInDictionaryForGenericKey( (uint64_t *)&self->_decoder,  v8,  genericIndex,  (uint64_t)v14))
  {
    uint64_t v10 = v14[0] >= 0xFFFFFFFFFFFFFFF7LL;
    uint64_t v11 = v10 << 63 >> 63;
    if (v11 != v10 || v11 < 0 || p_decoder[1] <= (unint64_t)(v14[0] + 9LL)) {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:@"Expected to find array of Objective-C typed arguments but there was nothing there" userInfo:0]);
    }
    unint64_t v12 = *(void *)(v14[0] + *p_decoder + 1);
    v13[0] = v14[0] + 9LL;
    v13[1] = v12;
    _NSXPCSerializationDecodeTypedObjCValuesFromArray( self,  p_decoder,  a3,  (unsigned __int8 *)a4,  0xFFFFFFFFuLL,  1LL,  (uint64_t)v14,  v13,  0LL,  0LL);
  }

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4 size:(unint64_t)a5
{
  v16[2] = *MEMORY[0x1895F89C0];
  p_decoder = (uint64_t *)&self->_decoder;
  uint64_t v10 = self->_collections[self->_collectionPointer];
  unint64_t genericIndex = self->_genericIndex;
  self->_unint64_t genericIndex = genericIndex + 1;
  if (_NSXPCSerializationCreateObjectInDictionaryForGenericKey( (uint64_t *)&self->_decoder,  v10,  genericIndex,  (uint64_t)v16))
  {
    uint64_t v12 = v16[0] >= 0xFFFFFFFFFFFFFFF7LL;
    uint64_t v13 = v12 << 63 >> 63;
    if (v13 != v12 || v13 < 0 || p_decoder[1] <= (unint64_t)(v16[0] + 9LL)) {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:@"Expected to find array of Objective-C typed arguments but there was nothing there" userInfo:0]);
    }
    unint64_t v14 = *(void *)(v16[0] + *p_decoder + 1);
    v15[0] = v16[0] + 9LL;
    v15[1] = v14;
    _NSXPCSerializationDecodeTypedObjCValuesFromArray( self,  p_decoder,  a3,  (unsigned __int8 *)a4,  a5,  1LL,  (uint64_t)v16,  v15,  0LL,  0LL);
  }

- (id)decodeObject
{
  return -[NSXPCDecoder decodeObjectForKey:](self, "decodeObjectForKey:", 0LL);
}

- (id)decodeObjectForKey:(id)a3
{
  return -[NSXPCDecoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", 0LL, a3);
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v8 = v7;
  _resetAllowedClasses((uint64_t)self, (uint64_t)a3);
  return v8;
}

- (id)allowedClasses
{
  id v2 = self->_allowedClassesList[self->_allowedClassesIndex];
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return v2;
  }
  else {
    return (id)[MEMORY[0x189604010] setWithObject:v2];
  }
}

- (BOOL)decodeBoolForKey:(id)a3
{
  void v6[2] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  BOOL ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)v6);
  if (ObjectInDictionaryForKey) {
    LOBYTE(ObjectInDictionaryForKey) = v6[0]
  }
                                    && p_decoder->dataLen > v6[0]
                                    && p_decoder->data[v6[0]] == 176;
  return ObjectInDictionaryForKey;
}

- (int)decodeIntForKey:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  int result = _NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)&v5);
  if (result)
  {
    if (v5)
    {
      else {
        return 0;
      }
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (int)decodeInt32ForKey:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  int result = _NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)&v5);
  if (result)
  {
    if (v5)
    {
      else {
        return 0;
      }
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  if (!_NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)&v5)
    || !v5)
  {
    return 0LL;
  }

  return 0LL;
}

- (float)decodeFloatForKey:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  BOOL ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)&v7);
  float result = 0.0;
  if (ObjectInDictionaryForKey && v7)
  {
    int FloatAtMarker = _getFloatAtMarker(p_decoder, &v8, v7, v9);
    float result = v8;
    if (!FloatAtMarker) {
      return 0.0;
    }
  }

  return result;
}

- (double)decodeDoubleForKey:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  BOOL ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)&v7);
  double result = 0.0;
  if (ObjectInDictionaryForKey && v7)
  {
    int DoubleAtMarker = _getDoubleAtMarker(p_decoder, &v8, v7, v9);
    double result = v8;
    if (!DoubleAtMarker) {
      return 0.0;
    }
  }

  return result;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  if (!_NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)&v5)
    || !v5)
  {
    return 0LL;
  }

  return 0LL;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  v10[2] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  if (_NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)v10)
    && (id v6 = _NSXPCSerializationDataForObject(p_decoder, v10)) != 0LL
    && (unint64_t v7 = v6, [v6 length]))
  {
    id v8 = v7;
    if (a4) {
      *a4 = [v7 length];
    }
    return (const char *)[v7 bytes];
  }

  else
  {
    double result = 0LL;
    if (a4) {
      *a4 = 0LL;
    }
  }

  return result;
}

- (const)_decodeCStringForKey:(id)a3
{
  v5[2] = *MEMORY[0x1895F89C0];
  p_decoder = (uint64_t *)&self->_decoder;
  if (_NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)v5))
  {
    return (const char *)_NSXPCSerializationASCIIStringForObject(p_decoder, v5);
  }

  else
  {
    return 0LL;
  }

- (id)decodeXPCObjectForKey:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  p_decoder = &self->_decoder;
  if (!_NSXPCSerializationCreateObjectInDictionaryForKey( (uint64_t *)&self->_decoder,  self->_collections[self->_collectionPointer],  (const __CFString *)a3,  (uint64_t)&v6)) {
    return 0LL;
  }
  if (v6) {
    _getIntAtMarker(p_decoder, &v7, v6, v8);
  }
  return -[NSXPCDecoder _xpcObjectForIndex:](self, "_xpcObjectForIndex:");
}

- (id)_xpcObjectForIndex:(int64_t)a3
{
  oolObjects = self->_oolObjects;
  if (oolObjects && xpc_array_get_count(oolObjects) - 1 >= a3) {
    return xpc_array_get_value(self->_oolObjects, a3);
  }
  else {
    return 0LL;
  }
}

- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4
{
  id v6 = -[NSXPCDecoder decodeXPCObjectForKey:](self, "decodeXPCObjectForKey:", a4);
  uint64_t v7 = v6;
  if (!v6 || object_getClass(v6) == (Class)a3) {
    return v7;
  }
  uint64_t v9 = MEMORY[0x186E21CF4](v7);
  if (v9)
  {
    uint64_t v11 = (void *)v9;
    uint64_t v10 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9);
    free(v11);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Type of resulting xpc_object_t (%@) does not match expected type for key '%@'.",  v10,  a4);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v12 userInfo:0]);
  return -[NSXPCDecoder _decodeCollectionOfClass:allowedClasses:forKey:](v13, v14, v15, v16, v17);
}

- (id)_decodeCollectionOfClass:(Class)a3 allowedClasses:(id)a4 forKey:(id)a5
{
  self->expectedUnnestedCollectionType = a3;
  id result = -[NSXPCDecoder decodeObjectOfClasses:forKey:]( self,  "decodeObjectOfClasses:forKey:",  objc_msgSend(a4, "setByAddingObject:"),  a5);
  self->expectedUnnestedCollectionType = 0LL;
  return result;
}

- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v7 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:]( self,  a3,  (uint64_t)v7))
  {
    return -[NSXPCDecoder _decodeCollectionOfClass:allowedClasses:forKey:]( self,  "_decodeCollectionOfClass:allowedClasses:forKey:",  MEMORY[0x189603F18],  a3,  a4);
  }

  else
  {
    return 0LL;
  }

- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5
{
  id v8 = (void *)[a3 setByAddingObjectsFromSet:a4];
  uint64_t v9 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:]( self,  v8,  (uint64_t)v9))
  {
    return -[NSXPCDecoder _decodeCollectionOfClass:allowedClasses:forKey:]( self,  "_decodeCollectionOfClass:allowedClasses:forKey:",  MEMORY[0x189603F68],  v8,  a5);
  }

  else
  {
    return 0LL;
  }

- (BOOL)_testClass:(Class)a3 isAllowedByAllowList:(id)a4
{
  return -[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]( (uint64_t)self,  a3,  (uint64_t)@"DummyKey",  a4,  self->_strictSecureDecodingEnabled,  1,  0);
}

@end