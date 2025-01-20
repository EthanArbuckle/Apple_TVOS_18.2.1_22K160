@interface NSKeyedUnarchiver
+ (BOOL)_evaluateCycleSecurityRules:(NSKeyedUnarchiverCycleEvaluationRules *)a3;
+ (Class)classForClassName:(NSString *)codedName;
+ (NSArray)unarchivedArrayOfObjectsOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error;
+ (NSArray)unarchivedArrayOfObjectsOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error;
+ (NSDictionary)unarchivedDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)valueCls fromData:(NSData *)data error:(NSError *)error;
+ (NSDictionary)unarchivedDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)valueClasses fromData:(NSData *)data error:(NSError *)error;
+ (id)_copyByArchiving:(id)a3;
+ (id)_strictlyUnarchivedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5;
+ (id)unarchiveObjectWithData:(NSData *)data;
+ (id)unarchiveObjectWithFile:(NSString *)path;
+ (id)unarchiveTopLevelObjectWithData:(NSData *)data error:(NSError *)error;
+ (id)unarchivedObjectOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error;
+ (id)unarchivedObjectOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error;
+ (int)_swift_checkClassAndWarnForKeyedArchiving:(Class)a3 operation:(int)a4;
+ (void)initialize;
+ (void)setClass:(Class)cls forClassName:(NSString *)codedName;
- (BOOL)_allowsValueCoding;
- (BOOL)_containsNextUnkeyedObject;
- (BOOL)_strictSecureDecodingEnabled;
- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4;
- (BOOL)_validateAllowedClassesContainsClassOfReference:(id)a3 forKey:(id)a4;
- (BOOL)_willEnforceExplicitPlistTypes;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(NSString *)key;
- (BOOL)decodeBoolForKey:(NSString *)key;
- (BOOL)requiresSecureCoding;
- (Class)classForClassName:(NSString *)codedName;
- (NSDecodingFailurePolicy)decodingFailurePolicy;
- (NSKeyedUnarchiver)init;
- (NSKeyedUnarchiver)initForReadingFromData:(NSData *)data error:(NSError *)error;
- (NSKeyedUnarchiver)initForReadingWithData:(NSData *)data;
- (NSKeyedUnarchiver)initWithStream:(id)a3;
- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp;
- (double)decodeDoubleForKey:(NSString *)key;
- (float)decodeFloatForKey:(NSString *)key;
- (id)_allowedClassNames;
- (id)_blobForCurrentObject;
- (id)_decodeArrayOfObjectsForKey:(id)a3;
- (id)_decodeObjectOfClass:(Class)a3;
- (id)_decodePropertyListForKey:(id)a3;
- (id)_initForReadingFromData:(id)a3 error:(id *)a4 throwLegacyExceptions:(BOOL)a5;
- (id)_initWithStream:(__CFReadStream *)a3 data:(id)a4 topDict:(__CFDictionary *)a5;
- (id)allowedClasses;
- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4;
- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5;
- (id)decodeObject;
- (id)decodeObjectForKey:(NSString *)key;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)delegate;
- (id)description;
- (id)error;
- (int)decodeIntForKey:(NSString *)key;
- (int32_t)decodeInt32ForKey:(NSString *)key;
- (int64_t)decodeInt64ForKey:(NSString *)key;
- (int64_t)versionForClassName:(id)a3;
- (uint64_t)_validatePropertyListClass:(uint64_t)a3 forKey:;
- (unsigned)_currentUniqueIdentifier;
- (unsigned)systemVersion;
- (void)__setError:(id)a3;
- (void)_allowDecodingCyclesInSecureMode;
- (void)_decodeCollectionOfClass:(void *)a3 allowedClasses:(__CFString *)a4 forKey:;
- (void)_enableStrictSecureDecodingMode;
- (void)_enforceExplicitPlistTypes;
- (void)_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded;
- (void)_replaceObject:(id)a3 withObject:(id)a4;
- (void)_setAllowedClassNames:(id)a3;
- (void)_temporaryMapReplaceObject:(id)a3 withObject:(id)a4;
- (void)dealloc;
- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5;
- (void)decodeBytesWithReturnedLength:(unint64_t *)a3;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)decodeValuesOfObjCTypes:(const char *)a3;
- (void)finishDecoding;
- (void)replaceObject:(id)a3 withObject:(id)a4;
- (void)setClass:(Class)cls forClassName:(NSString *)codedName;
- (void)setDecodingFailurePolicy:(NSDecodingFailurePolicy)decodingFailurePolicy;
- (void)setDelegate:(id)delegate;
- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding;
@end

@implementation NSKeyedUnarchiver

+ (id)unarchivedObjectOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  Class v11 = cls;
  v8 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v11 count:1];
  v9 = (void *)objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:", v8, data, error, v11, v12);

  return v9;
}

+ (id)unarchivedObjectOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error
{
  v7 = (void *)[objc_alloc((Class)a1) initForReadingFromData:data error:error];
  if (!v7) {
    return 0LL;
  }
  v8 = v7;
  [v7 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  v9 = (void *)[v8 decodeTopLevelObjectOfClasses:classes forKey:@"root" error:error];

  return v9;
}

- (NSKeyedUnarchiver)initForReadingFromData:(NSData *)data error:(NSError *)error
{
  return (NSKeyedUnarchiver *)-[NSKeyedUnarchiver _initForReadingFromData:error:throwLegacyExceptions:]( self,  "_initForReadingFromData:error:throwLegacyExceptions:",  data,  error,  0LL);
}

- (id)_initForReadingFromData:(id)a3 error:(id *)a4 throwLegacyExceptions:(BOOL)a5
{
  BOOL v39 = a5;
  v6 = self;
  v52[1] = *MEMORY[0x1895F89C0];
  id v45 = 0LL;
  unsigned int valuePtr = -1;
  self->_data = 0LL;
  p_flags = &self->_flags;
  atomic_store(0x10uLL, &self->_flags);
  self->_delegate = 0LL;
  self->_containers = 0LL;
  self->_objects = 0LL;
  self->_objRefMap = 0LL;
  self->_replacementMap = 0LL;
  self->_nameClassMap = 0LL;
  self->_tmpRefObjMap = 0LL;
  self->_refObjMap = 0LL;
  self->_genericKey = 0;
  self->_helper = objc_alloc_init(&OBJC_CLASS____NSKeyedUnarchiverHelper);
  v6->_offsetObjMap = 0LL;
  unint64_t v8 = atomic_load(p_flags);
  atomic_store(v8 | 4, p_flags);
  unint64_t v9 = atomic_load(p_flags);
  atomic_store(v9 & 0xFFFFFFFFFFFFFFEFLL, p_flags);
  if (!a3)
  {
    if (a4)
    {
      v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@: data is NULL",  _NSMethodExceptionProem((objc_class *)v6, a2));
      v51 = @"NSDebugDescription";
      v52[0] = v16;
      *a4 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  [MEMORY[0x189603F68] dictionaryWithObjects:v52 forKeys:&v51 count:1]);
    }

    goto LABEL_62;
  }

  uint64_t v10 = [a3 bytes];
  unint64_t v11 = [a3 length];
  unint64_t v12 = v11;
  if (!v11 || !v10)
  {
    if (v39) {
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0LL);
    }
    -[NSCoder __failWithExceptionName:errorCode:format:]( v6,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603A60],  4864LL,  @"%@: data is empty; did you forget to send -finishEncoding to the NSKeyedArchiver?",
      _NSMethodExceptionProem((objc_class *)v6, a2));
    if (!a4) {
      goto LABEL_62;
    }
    goto LABEL_18;
  }

  if (v11 >= 0xD)
  {
    if (*(_BYTE *)(v10 + 1) != 11) {
      goto LABEL_26;
    }
    if ((*(void *)(v10 + 2) != 0x7274736465707974LL || *(void *)(v10 + 5) != 0x6D61657274736465LL)
      && (*(void *)(v10 + 2) != 0x79746D6165727473LL || *(void *)(v10 + 5) != 0x64657079746D6165LL))
    {
      goto LABEL_26;
    }

    if (v39) {
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0LL);
    }
    -[NSCoder __failWithExceptionName:errorCode:format:]( v6,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603A60],  4864LL,  @"%@: non-keyed archive cannot be decoded by NSKeyedUnarchiver",  _NSMethodExceptionProem((objc_class *)v6, a2));
    if (!a4) {
      goto LABEL_62;
    }
LABEL_18:
    id v15 = -[NSKeyedUnarchiver error](v6, "error");
LABEL_61:
    *a4 = v15;
    goto LABEL_62;
  }

  if (v11 < 8) {
    goto LABEL_49;
  }
LABEL_26:
  if (!__CFBinaryPlistGetTopLevelInfo()
    || (offsetObjMap = v6->_offsetObjMap, !__CFBinaryPlistGetOffsetForValueFromDictionary3())
    || !__CFBinaryPlistCreateObject()
    || !v45
    || (CFTypeID v38 = CFGetTypeID(v45), v38 != CFNumberGetTypeID())
    || !CFNumberGetValue((CFNumberRef)v45, kCFNumberSInt32Type, &valuePtr)
    || valuePtr != 100000)
  {
    if (v12 >= 0x78)
    {
      v21 = (const __CFDictionary *)CFPropertyListCreateWithData( (CFAllocatorRef)*MEMORY[0x189604DD0],  (CFDataRef)a3,  1uLL,  0LL,  0LL);
      if (v21)
      {
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v21))
        {
          Value = (void *)CFDictionaryGetValue(v21, @"$version");
          id v45 = Value;
          if (Value)
          {
            CFTypeID v24 = CFGetTypeID(Value);
            if (v24 == CFNumberGetTypeID()
              && CFNumberGetValue((CFNumberRef)v45, kCFNumberSInt32Type, &valuePtr)
              && valuePtr == 100000)
            {
              v25 = CFDictionaryGetValue(v21, @"$top");
              v26 = CFDictionaryGetValue(v21, @"$objects");
              if (v25)
              {
                v27 = v26;
                if (v26)
                {
                  if (CFGetTypeID(v26) == 19)
                  {
                    v6->_containers = CFArrayCreateMutable(0LL, 0LL, 0LL);
                    CFRetain(v25);
                    CFArrayAppendValue(v6->_containers, v25);
                    CFTypeID v28 = CFGetTypeID(v25);
                    unint64_t v29 = atomic_load(&v6->_flags);
                    atomic_store(v29 & 0xFFFFFFFFFFFFFFFELL | (v28 == 19), &v6->_flags);
                    v6->_objects = (__CFArray *)CFRetain(v27);
                    -[NSKeyedUnarchiver _initWithStream:data:topDict:]( v6,  "_initWithStream:data:topDict:",  0LL,  0LL,  v21);
                    CFRelease(v21);
                    return v6;
                  }
                }
              }

              CFRelease(v21);
              if (v39) {
                -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0LL);
              }
              -[NSCoder __failWithExceptionName:errorCode:format:]( v6,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864LL,  @"%@: data is corrupt or archive is missing key components or object is too large to decode",  _NSMethodExceptionProem((objc_class *)v6, a2));
              if (!a4)
              {
LABEL_62:

                return 0LL;
              }

              goto LABEL_60;
            }
          }
        }

        else
        {
          id v45 = 0LL;
        }

        CFRelease(v21);
        if (v39) {
          -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0LL);
        }
        v32 = _NSMethodExceptionProem((objc_class *)v6, a2);
        -[NSCoder __failWithExceptionName:errorCode:format:]( v6,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603A60],  4864LL,  @"%@: incomprehensible archive version (%d)",  v32,  valuePtr);
        if (!a4) {
          goto LABEL_62;
        }
LABEL_60:
        id v15 = -[NSKeyedUnarchiver error](v6, "error");
        goto LABEL_61;
      }

      id v45 = 0LL;
    }

- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding
{
  char v3 = atomic_load(&self->_flags);
  if ((v3 & 8) != 0)
  {
    v7 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  @"NSInvalidUnarchiveOperationException",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: unarchiver has started; cannot change secure coding state",
                     _NSMethodExceptionProem((objc_class *)self, a2)),
                   0LL);
    objc_exception_throw(v7);
    -[NSKeyedUnarchiver setDecodingFailurePolicy:](v8, v9, v10);
  }

  else
  {
    unint64_t v4 = atomic_load(&self->_flags);
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFBLL;
    uint64_t v6 = 4LL;
    if (!requiresSecureCoding) {
      uint64_t v6 = 0LL;
    }
    atomic_store(v5 | v6, &self->_flags);
  }

- (void)setDecodingFailurePolicy:(NSDecodingFailurePolicy)decodingFailurePolicy
{
  if ((unint64_t)decodingFailurePolicy >= 2)
  {
    unint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: invalid decoding error policy %lu",  _NSMethodExceptionProem((objc_class *)self, a2),  decodingFailurePolicy);
  }

  else
  {
    char v3 = atomic_load(&self->_flags);
    if ((v3 & 8) == 0)
    {
      unint64_t v4 = atomic_load(&self->_flags);
      atomic_store( v4 & 0xFFFFFFFFFFFFFFEFLL | (16LL * (decodingFailurePolicy == NSDecodingFailurePolicyRaiseException)),  &self->_flags);
      return;
    }

    unint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unarchiver has started; cannot change decoding error policy",
           _NSMethodExceptionProem((objc_class *)self, a2),
           v11);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v5 userInfo:0]);
  -[NSCoder decodeTopLevelObjectOfClasses:forKey:error:](v6, v7, v8, v9, v10);
}

- (NSDecodingFailurePolicy)decodingFailurePolicy
{
  unsigned int v2 = atomic_load(&self->_flags);
  return ~(v2 >> 4) & 1LL;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (self->_helper->_decodeError) {
    return 0LL;
  }
  char v8 = atomic_load(&self->_flags);
  if ((v8 & 4) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___NSKeyedUnarchiver;
    return -[NSCoder decodeObjectOfClasses:forKey:](&v17, sel_decodeObjectOfClasses_forKey_, a3, a4);
  }

  if (a3)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(a3);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (!object_isClass(v14))
          {
            v16 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ object in classes '%@' is not an Objective-C class!", _NSMethodExceptionProem((objc_class *)self, a2), v14), 0 reason userInfo];
            objc_exception_throw(v16);
          }
        }

        uint64_t v11 = [a3 countByEnumeratingWithState:&v19 objects:v18 count:16];
      }

      while (v11);
    }

    -[NSMutableArray addObject:](self->_helper->_allowedClasses, "addObject:", a3);
    id v4 = -[NSKeyedUnarchiver decodeObjectForKey:](self, "decodeObjectForKey:", a4);
    -[NSMutableArray removeLastObject](self->_helper->_allowedClasses, "removeLastObject");
    return v4;
  }

  return -[NSKeyedUnarchiver decodeObjectForKey:](self, "decodeObjectForKey:", a4);
}

- (id)decodeObjectForKey:(NSString *)key
{
  v8[1] = *MEMORY[0x1895F89C0];
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    SEL v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v7);
  }

  if (self->_helper->_decodeError) {
    return 0LL;
  }
  uint64_t v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
    uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
  }
  v8[0] = 0LL;
  _decodeObject((uint64_t)self, v6, v8);
  return (id)v8[0];
}

- (Class)classForClassName:(NSString *)codedName
{
  Class result = (Class)self->_nameClassMap;
  if (result) {
    return (Class)CFDictionaryGetValue((CFDictionaryRef)result, codedName);
  }
  return result;
}

+ (Class)classForClassName:(NSString *)codedName
{
  if (qword_18C496198) {
    Value = (objc_class *)CFDictionaryGetValue((CFDictionaryRef)qword_18C496198, codedName);
  }
  else {
    Value = 0LL;
  }
  os_unfair_lock_unlock(&stru_18C49618C);
  return Value;
}

- (BOOL)requiresSecureCoding
{
  unint64_t v2 = atomic_load(&self->_flags);
  return (v2 >> 2) & 1;
}

- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4
{
  if (a3)
  {
    id v7 = -[NSKeyedUnarchiver allowedClasses](self, "allowedClasses");
    unint64_t v8 = atomic_load(&self->_flags);
    char v9 = atomic_load(&self->_flags);
    char v10 = -[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]( (uint64_t)self,  a3,  (uint64_t)a4,  v7,  (v8 >> 5) & 1,  (v9 & 0x40) != 0LL,  0);
    if ((v10 & 1) == 0 && !self->_helper->_decodeError) {
      -[NSCoder __failWithUnexpectedClass:forKey:allowedClasses:]( (NSString *)self,  (uint64_t)a3,  (const __CFString *)a4,  v7);
    }
    return v10;
  }

  else
  {
    uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to decode an object with no class for key '%@'.",  a4);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v12 userInfo:0]);
    return -[NSKeyedUnarchiver allowedClasses](v13, v14);
  }

- (id)allowedClasses
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  char v2 = atomic_load(&self->_flags);
  if ((v2 & 4) != 0) {
    return (id)-[NSMutableArray lastObject](self->_helper->_allowedClasses, "lastObject");
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSKeyedUnarchiver;
  return -[NSCoder allowedClasses](&v4, sel_allowedClasses);
}

- (BOOL)decodeBoolForKey:(NSString *)key
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    id v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v7);
  }

  if (self->_helper->_decodeError) {
    return 0;
  }
  uint64_t v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
    uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
  }
  BOOL v8 = 0;
  _decodeBool((uint64_t)self, v6, &v8);
  return v8;
}

- (BOOL)containsValueForKey:(NSString *)key
{
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v13);
    return -[NSKeyedUnarchiver decodeObjectOfClass:forKey:](v14, v15, v16, v17);
  }

  else
  {
    uint64_t v5 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v5, 0LL) == 36) {
      uint64_t v5 = (__CFString *)-[__CFString substringFromIndex:](v5, "substringFromIndex:", 1LL);
    }
    containers = self->_containers;
    if (containers)
    {
      CFIndex Count = CFArrayGetCount(containers);
      ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
      if (CFGetTypeID(ValueAtIndex) == 19)
      {
        Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0LL);
        id v10 = Value;
        CFArrayRemoveValueAtIndex(ValueAtIndex, 0LL);
      }

      else
      {
        Value = (void *)CFDictionaryGetValue(ValueAtIndex, v5);
        id v12 = Value;
      }

      return Value != 0LL;
    }

    else
    {
      return __CFBinaryPlistGetOffsetForValueFromDictionary3();
    }
  }

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (self->_helper->_decodeError) {
    return 0LL;
  }
  char v7 = atomic_load(&self->_flags);
  if ((v7 & 4) != 0)
  {
    if (a3) {
      a3 = (Class)objc_msgSend(MEMORY[0x189604010], "setWithObject:");
    }
    return -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", a3, a4);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSKeyedUnarchiver;
    return -[NSCoder decodeObjectOfClass:forKey:](&v8, sel_decodeObjectOfClass_forKey_, a3, a4);
  }

- (uint64_t)_validatePropertyListClass:(uint64_t)a3 forKey:
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (!a2)
    {
      v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to decode an object with no class for key '%@'.",  a3);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v18 userInfo:0]);
    }

    uint64_t v5 = result;
    uint64_t v6 = (void *)[(id)result allowedClasses];
    unint64_t v7 = atomic_load((unint64_t *)(v5 + 16));
    if ((-[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]( v5,  a2,  a3,  v6,  (v7 >> 5) & 1,  0,  0) & 1) != 0 || *(void *)(*(void *)(v5 + 120) + 32LL))
    {
      return 1LL;
    }

    unint64_t v8 = v7 & 0x20;
    int v9 = _os_feature_enabled_impl();
    int v10 = dyld_program_sdk_at_least();
    unsigned __int8 v11 = atomic_load((unint64_t *)(v5 + 16));
    unint64_t v12 = v11 & 0x80 | v8;
    if (v12) {
      int v13 = 1;
    }
    else {
      int v13 = v9 & v10;
    }
    if (v10 && !v12) {
      -[NSCoder _warnAboutPlistType:forKey:missingInAllowedClasses:]((objc_class *)v5, (uint64_t)a2, a3, v6);
    }
    if (!v13
      || !v12
      && _os_feature_enabled_impl()
      && -[NSCoder _shouldExemptProcessBasedOnArchivingExceptionRules:]( v5,  (uint64_t)"/System/Library/CoreServices/ArchivingExceptions.bundle/PlistTypeExceptions.plist"))
    {
      return 1LL;
    }

    else
    {
      SEL v14 = -[NSCoder __allowedClassesDescriptionForClass:]((NSString *)v5, (uint64_t)a2);
      id v15 = -[NSCoder _allowedClassesDescriptionForClasses:](v5, v6);
      if (a3) {
        Class v16 = (const __CFString *)a3;
      }
      else {
        Class v16 = @"(no key, possibly an argument to a message)";
      }
      id v17 = (os_log_s *)_NSRuntimeIssuesLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        __int128 v20 = v14;
        __int16 v21 = 2114;
        __int128 v22 = v16;
        __int16 v23 = 2112;
        id v24 = v15;
      }

      objc_msgSend( (id)v5,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864,  @"value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@",  v16,  v14,  v15);
      return 0LL;
    }
  }

  return result;
}

- (int64_t)decodeInt64ForKey:(NSString *)key
{
  v8[1] = *MEMORY[0x1895F89C0];
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    unint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v7);
  }

  if (self->_helper->_decodeError) {
    return 0LL;
  }
  uint64_t v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
    uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
  }
  v8[0] = 0LL;
  _decodeInt64((uint64_t)self, v6, v8);
  return v8[0];
}

- (void)_replaceObject:(id)a3 withObject:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    unsigned __int8 v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot replace"), 0 reason userInfo];
    objc_exception_throw(v11);
  }

  if (a3 != a4)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      -[NSKeyedUnarchiverDelegate unarchiver:willReplaceObject:withObject:]( self->_delegate,  "unarchiver:willReplaceObject:withObject:",  self,  a3,  a4);
    }
    objRefMap = self->_objRefMap;
    if (objRefMap)
    {
      Value = CFDictionaryGetValue(objRefMap, a3);
      CFDictionaryRemoveValue(self->_objRefMap, a3);
      CFDictionarySetValue(self->_objRefMap, a4, Value);
      CFDictionarySetValue(self->_refObjMap, Value, a4);
    }

    -[NSKeyedUnarchiver _temporaryMapReplaceObject:withObject:](self, "_temporaryMapReplaceObject:withObject:", a3, a4);
  }

  replacementMap = self->_replacementMap;
  if (!replacementMap)
  {
    keyCallBacks.version = 0LL;
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x189605240] + 8LL);
    memset(&keyCallBacks.copyDescription, 0, 24);
    self->_replacementMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &keyCallBacks, 0LL);
    _CFDictionarySetCapacity();
    replacementMap = self->_replacementMap;
  }

  CFDictionarySetValue(replacementMap, a3, a4);
}

- (id)error
{
  return self->_helper->_decodeError;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  data = self->_data;
  if (data) {
    CFRelease(data);
  }
  containers = self->_containers;
  if (containers)
  {
    for (CFIndex i = CFArrayGetCount(containers); i >= 1; CFIndex i = CFArrayGetCount(self->_containers))
    {
      if (!CFArrayGetValueAtIndex(self->_containers, i - 1)) {
        break;
      }
      CFIndex Count = CFArrayGetCount(self->_containers);
      ValueAtIndex = CFArrayGetValueAtIndex(self->_containers, Count - 1);
      CFArrayRemoveValueAtIndex(self->_containers, Count - 1);
      CFRelease(ValueAtIndex);
      if (Count > 1)
      {
        unint64_t v8 = CFArrayGetValueAtIndex(self->_containers, Count - 2);
        CFTypeID v9 = CFGetTypeID(v8);
        unint64_t v10 = atomic_load(&self->_flags);
        atomic_store(v10 & 0xFFFFFFFFFFFFFFFELL | (v9 == 19), &self->_flags);
      }
    }

    CFRelease(self->_containers);
  }

  objects = self->_objects;
  if (objects) {
    CFRelease(objects);
  }
  objRefMap = self->_objRefMap;
  if (objRefMap) {
    CFRelease(objRefMap);
  }
  replacementMap = self->_replacementMap;
  if (replacementMap) {
    CFRelease(replacementMap);
  }
  nameClassMap = self->_nameClassMap;
  if (nameClassMap) {
    CFRelease(nameClassMap);
  }
  tmpRefObjMap = self->_tmpRefObjMap;
  if (tmpRefObjMap) {
    CFRelease(tmpRefObjMap);
  }
  refObjMap = self->_refObjMap;
  if (refObjMap) {
    CFRelease(refObjMap);
  }
  offsetData = self->_offsetData;
  if (offsetData) {
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DD0], offsetData);
  }

  offsetObjMap = self->_offsetObjMap;
  if (offsetObjMap) {
    CFRelease(offsetObjMap);
  }
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSKeyedUnarchiver;
  -[NSKeyedUnarchiver dealloc](&v19, sel_dealloc);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (id)_decodeArrayOfObjectsForKey:(id)a3
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    unint64_t v43 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v43);
  }

  uint64_t v6 = (__CFString *)a3;
  unint64_t v7 = atomic_load(&self->_flags);
  atomic_store(v7 | 8, &self->_flags);
  if (a3 && CFStringGetLength((CFStringRef)a3) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
    uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
  }
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x2020000000LL;
  uint64_t v60 = 0LL;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x2020000000LL;
  uint64_t v56 = 0LL;
  uint64_t v47 = 0LL;
  v48[0] = MEMORY[0x1895F87A8];
  v48[1] = 3221225472LL;
  v49 = __49__NSKeyedUnarchiver__decodeArrayOfObjectsForKey___block_invoke;
  v50 = &unk_189C9E980;
  v51 = &v53;
  v52 = &v57;
  containers = self->_containers;
  if (!containers)
  {
    bytes = self->_bytes;
    unint64_t len = self->_len;
    uint64_t v46 = 0LL;
    if ((__CFBinaryPlistGetOffsetForValueFromDictionary3() & 1) == 0) {
      goto LABEL_36;
    }
    id v15 = &bytes[v46];
    if (__CFADD__(bytes, v46)) {
      goto LABEL_28;
    }
    unint64_t v16 = (unint64_t)&bytes[len - 1];
    char v17 = *v15;
    if ((*v15 & 0xF0) != 0xA0)
    {
      -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"%@: value for key (%@) is not an array",  _NSMethodExceptionProem((objc_class *)self, a2),  v6);
      goto LABEL_36;
    }

    v18 = v15 + 1;
    if (v15 == (const char *)-1LL || v16 < (unint64_t)v18)
    {
LABEL_28:
      uint64_t v20 = _NSMethodExceptionProem((objc_class *)self, a2);
      __int16 v21 = @"%@: data is corrupt";
    }

    else
    {
      unint64_t v19 = v17 & 0xF;
      if ((v17 & 0xF) != 0xF) {
        goto LABEL_38;
      }
      unint64_t v45 = 0x1FFFFFFFLL;
      if ((_readInt(self, v18, v16, &v45, 0LL) & 1) == 0)
      {
        uint64_t v20 = _NSMethodExceptionProem((objc_class *)self, a2);
        __int16 v21 = @"%@: data is corrupt";
        goto LABEL_29;
      }

      unint64_t v19 = v45;
      if (!(v45 >> 29))
      {
LABEL_38:
        uint64_t v39 = _CFCreateArrayStorage();
        v54[3] = v39;
        if (v39)
        {
          v58[3] = 0LL;
          if (!v19) {
            goto LABEL_44;
          }
          while (1)
          {
            unint64_t v45 = 0LL;
            if ((__CFBinaryPlistGetOffsetForValueFromArray2() & 1) == 0)
            {
              v49((uint64_t)v48);
              -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864LL,  @"%@: data is corrupt or object is too large to decode",  _NSMethodExceptionProem((objc_class *)self, a2));
              goto LABEL_36;
            }

            unint64_t v44 = 0LL;
            if ((_getUIDFromData(self, &bytes[v45], v16, &v44) & 1) == 0) {
              break;
            }
            _decodeObjectBinary((uint64_t)self, v44, (uint64_t)v6, (CFTypeRef *)(v54[3] + 8 * v58[3]));
            uint64_t v40 = v58[3];
            if (!*(void *)(v54[3] + 8 * v40)) {
              goto LABEL_34;
            }
            v58[3] = v40 + 1;
            if (v40 + 1 >= v19) {
              goto LABEL_44;
            }
          }

          v49((uint64_t)v48);
          -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864LL,  @"%@: data is corrupt or value is not an object",  _NSMethodExceptionProem((objc_class *)self, a2));
          goto LABEL_36;
        }
      }

      uint64_t v20 = _NSMethodExceptionProem((objc_class *)self, a2);
      __int16 v21 = @"%@: array is too large to decode";
    }

+ (int)_swift_checkClassAndWarnForKeyedArchiving:(Class)a3 operation:(int)a4
{
  unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  return specialized static NSKeyedUnarchiver.__swift_checkClassAndWarnForKeyedArchiving(_:operation:)( ObjCClassMetadata,  a4);
}

+ (void)initialize
{
  if (&OBJC_CLASS___NSKeyedUnarchiver == a1)
  {
    if (getenv("NSWarnAboutOldStyleArchiverMethods")) {
      _warnArchiverCompat = 1;
    }
    +[NSKeyedUnarchiver setClass:forClassName:]( &OBJC_CLASS___NSKeyedUnarchiver,  "setClass:forClassName:",  objc_lookUpClass("__NSLocalTimeZone"),  @"NSLocalTimeZone");
  }

- (id)_blobForCurrentObject
{
  containers = self->_containers;
  if (containers)
  {
    CFIndex Count = CFArrayGetCount(containers);
    return (id)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  }

  else
  {
    int Object = __CFBinaryPlistCreateObject();
    id result = 0LL;
    if (Object) {
      return v7;
    }
  }

  return result;
}

- (NSKeyedUnarchiver)init
{
  char v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: cannot use -init for initialization",  _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v3 userInfo:0]);
  return (NSKeyedUnarchiver *)-[NSKeyedUnarchiver _initWithStream:data:topDict:](v4, v5, v6, v7, v8);
}

- (id)_initWithStream:(__CFReadStream *)a3 data:(id)a4 topDict:(__CFDictionary *)a5
{
  self->_objRefMap = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
  _CFDictionarySetCapacity();
  self->_tmpRefObjMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, 0LL, 0LL);
  _CFDictionarySetCapacity();
  self->_refObjMap = CFDictionaryCreateMutable(0LL, 0LL, 0LL, MEMORY[0x189605250]);
  _CFDictionarySetCapacity();
  return self;
}

+ (NSArray)unarchivedArrayOfObjectsOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  Class v11 = cls;
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v11 count:1];
  CFTypeID v9 = (NSArray *)objc_msgSend(a1, "unarchivedArrayOfObjectsOfClasses:fromData:error:", v8, data, error, v11, v12);

  return v9;
}

+ (NSDictionary)unarchivedDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)valueCls fromData:(NSData *)data error:(NSError *)error
{
  v14[1] = *MEMORY[0x1895F89C0];
  Class v13 = valueCls;
  v14[0] = keyCls;
  CFTypeID v9 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:v14 count:1];
  unint64_t v10 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v13 count:1];
  Class v11 = (NSDictionary *)[a1 unarchivedDictionaryWithKeysOfClasses:v9 objectsOfClasses:v10 fromData:data error:error];

  return v11;
}

+ (NSArray)unarchivedArrayOfObjectsOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error
{
  v11[6] = *MEMORY[0x1895F89C0];
  id v7 = (void *)[objc_alloc((Class)a1) initForReadingFromData:data error:error];
  if (!v7) {
    return 0LL;
  }
  unint64_t v8 = v7;
  [v7 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __70__NSKeyedUnarchiver_unarchivedArrayOfObjectsOfClasses_fromData_error___block_invoke;
  v11[3] = &unk_189C9E910;
  v11[4] = v8;
  v11[5] = classes;
  CFTypeID v9 = (NSArray *)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](v8, (uint64_t)@"root", error, (uint64_t)v11);

  return v9;
}

uint64_t __70__NSKeyedUnarchiver_unarchivedArrayOfObjectsOfClasses_fromData_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeArrayOfObjectsOfClasses:*(void *)(a1 + 40) forKey:@"root"];
}

+ (id)_copyByArchiving:(id)a3
{
  char v3 = (unint64_t *)objc_msgSend( objc_alloc((Class)a1),  "initForReadingFromData:error:",  +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  0,  0),  0);
  if (!v3) {
    return 0LL;
  }
  char v4 = v3;
  unint64_t v5 = atomic_load(v3 + 2);
  atomic_store(v5 & 0xFFFFFFFFFFFFFFFBLL, v3 + 2);
  id v6 = (id)[v3 decodeObjectForKey:@"root"];

  return v6;
}

+ (NSDictionary)unarchivedDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)valueClasses fromData:(NSData *)data error:(NSError *)error
{
  v13[7] = *MEMORY[0x1895F89C0];
  CFTypeID v9 = (void *)[objc_alloc((Class)a1) initForReadingFromData:data error:error];
  if (!v9) {
    return 0LL;
  }
  unint64_t v10 = v9;
  [v9 setRequiresSecureCoding:1];
  [v10 setDecodingFailurePolicy:1];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __91__NSKeyedUnarchiver_unarchivedDictionaryWithKeysOfClasses_objectsOfClasses_fromData_error___block_invoke;
  v13[3] = &unk_189C9E938;
  v13[4] = v10;
  v13[5] = keyClasses;
  v13[6] = valueClasses;
  Class v11 = (NSDictionary *)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:]( v10,  (uint64_t)@"root",  error,  (uint64_t)v13);

  return v11;
}

uint64_t __91__NSKeyedUnarchiver_unarchivedDictionaryWithKeysOfClasses_objectsOfClasses_fromData_error___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeDictionaryWithKeysOfClasses:*(void *)(a1 + 40) objectsOfClasses:*(void *)(a1 + 48) forKey:@"root"];
}

+ (id)_strictlyUnarchivedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5
{
  id v7 = (unint64_t *)[objc_alloc((Class)a1) initForReadingFromData:a4 error:a5];
  if (!v7) {
    return 0LL;
  }
  unint64_t v8 = v7;
  [v7 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  CFTypeID v9 = v8 + 2;
  do
    unint64_t v10 = __ldaxr(v9);
  while (__stlxr(v10 | 0x20, v9));
  Class v11 = (void *)[v8 decodeTopLevelObjectOfClasses:a3 forKey:@"root" error:a5];

  return v11;
}

- (NSKeyedUnarchiver)initForReadingWithData:(NSData *)data
{
  char v3 = -[NSKeyedUnarchiver _initForReadingFromData:error:throwLegacyExceptions:]( self,  "_initForReadingFromData:error:throwLegacyExceptions:",  data,  0LL,  dyld_program_sdk_at_least() ^ 1);
  char v4 = v3;
  if (v3)
  {
    -[NSKeyedUnarchiver setDecodingFailurePolicy:](v3, "setDecodingFailurePolicy:", 0LL);
    unint64_t v5 = atomic_load(&v4->_flags);
    atomic_store(v5 & 0xFFFFFFFFFFFFFFFBLL, &v4->_flags);
    if (_NSCoderGetTrustRestrictions() != 2)
    {
      char v6 = _os_feature_enabled_impl();
      int v7 = _os_feature_enabled_impl();
      if ((v6 & 1) != 0)
      {
        -[NSCoder __failWithExceptionName:errorCode:format:]( v4,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"%@: NSKeyedUnarchiver was used with secure coding disabled.",  _NSMethodExceptionProem((objc_class *)v4, sel_initForReadingWithData_));

        return 0LL;
      }

      else if (v7 && initForReadingWithData__onceToken != -1)
      {
        dispatch_once(&initForReadingWithData__onceToken, &__block_literal_global_21);
      }
    }
  }

  return v4;
}

void __44__NSKeyedUnarchiver_initForReadingWithData___block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v0 = (os_log_s *)_NSRuntimeIssuesLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_fault_impl( &dword_182EB1000,  v0,  OS_LOG_TYPE_FAULT,  "NSKeyedUnarchiver was created with secure coding implicitly disabled. This simulated crash will soon turn into an actual crash. See rdar://104622435 for help.",  v1,  2u);
  }

- (NSKeyedUnarchiver)initWithStream:(id)a3
{
  unint64_t v5 = v4;
  uint64_t v23 = v6;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!v3 || (v7 = v3, CFTypeID TypeID = CFReadStreamGetTypeID(), TypeID != CFGetTypeID(v7)))
  {
    uint64_t v20 = v23;
    __int16 v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: stream argument is not a read stream",  _NSMethodExceptionProem(v23, v5));
    goto LABEL_27;
  }

  if ((unint64_t)(CFReadStreamGetStatus((CFReadStreamRef)v7) - 4) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v20 = v23;
    __int16 v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: stream is not open",  _NSMethodExceptionProem(v23, v5));
LABEL_27:
    id v22 = v21;

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v22 userInfo:0]);
  }

  int v9 = CFReadStreamRead((CFReadStreamRef)v7, buffer, 0x2000LL);
  unint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  if (v9 < 1)
  {
    CFIndex v15 = 0LL;
    uint64_t v12 = 0LL;
  }

  else
  {
    int v11 = 0;
    uint64_t v12 = 0LL;
    int v13 = 0;
    do
    {
      if ((v9 ^ 0x7FFFFFFF) < v11 || v13 >= 0x40000000)
      {
        if (v12) {
          CFAllocatorDeallocate(v10, v12);
        }
LABEL_23:
        -[objc_class __failWithExceptionName:errorCode:format:]( v23,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603A60],  4864LL,  @"stream too big");
        uint64_t v12 = 0LL;
        CFIndex v15 = 0LL;
        goto LABEL_24;
      }

      CFIndex v15 = (v9 + v11);
      if (v13 < (int)v15)
      {
        else {
          v13 *= 2;
        }
        uint64_t v24 = 0LL;
        unint64_t v25 = &v24;
        uint64_t v26 = 0x2020000000LL;
        char v27 = 0;
        uint64_t v12 = (char *)__CFSafelyReallocateWithAllocator();
        int v16 = *((unsigned __int8 *)v25 + 24);
        _Block_object_dispose(&v24, 8);
        if (v16) {
          goto LABEL_23;
        }
      }

      memmove(&v12[v11], buffer, v9);
      int v9 = CFReadStreamRead((CFReadStreamRef)v7, buffer, 0x2000LL);
      int v11 = v15;
    }

    while (v9 >= 1);
    if (v12) {
      goto LABEL_24;
    }
  }

  -[objc_class __failWithExceptionName:errorCode:format:]( v23,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603A60],  4864LL,  @"stream has no or too few bytes (%lu)",  v15);
LABEL_24:
  CFDataRef v17 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)v12, v15, v10);
  v18 = (NSKeyedUnarchiver *)-[objc_class initForReadingWithData:](v23, "initForReadingWithData:", v17);
  CFRelease(v17);
  return v18;
}

+ (id)unarchiveObjectWithFile:(NSString *)path
{
  if (!path) {
    return 0LL;
  }
  unint64_t v5 = (void *)MEMORY[0x186E1FF60](a1, a2);
  uint64_t v6 = [objc_allocWithZone(MEMORY[0x189603F48]) initWithContentsOfFile:path options:0 error:0];
  if (v6)
  {
    int v7 = (void *)v6;
    unint64_t v8 = (void *)[objc_alloc((Class)a1) initForReadingWithData:v6];
    id v9 = (id)[v8 decodeObjectForKey:@"root"];
    [v8 finishDecoding];
  }

  else
  {
    id v9 = 0LL;
  }

  objc_autoreleasePoolPop(v5);
  return v9;
}

+ (id)unarchiveObjectWithData:(NSData *)data
{
  unint64_t v5 = (void *)MEMORY[0x186E1FF60](a1, a2);
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initForReadingWithData:data];
  id v7 = (id)[v6 decodeObjectForKey:@"root"];
  [v6 finishDecoding];

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (id)unarchiveTopLevelObjectWithData:(NSData *)data error:(NSError *)error
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  v15[0] = 0LL;
  id v7 = (void *)MEMORY[0x186E1FF60](a1, a2);
  unint64_t v8 = (void *)[objc_alloc((Class)a1) initForReadingWithData:data];
  id v9 = (id)[v8 decodeTopLevelObjectForKey:@"root" error:v15];
  unint64_t v10 = v9;
  if (!error || v9)
  {
    [v8 finishDecoding];

    objc_autoreleasePoolPop(v7);
  }

  else
  {
    id v11 = v15[0];
    [v8 finishDecoding];

    objc_autoreleasePoolPop(v7);
    id v12 = v15[0];
    *error = (NSError *)v15[0];
    id v13 = v12;
  }

  return v10;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyedUnarchiver;
  return -[NSKeyedUnarchiver description](&v3, sel_description);
}

- (BOOL)_allowsValueCoding
{
  return 1;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (NSKeyedUnarchiverDelegate *)delegate;
}

- (id)delegate
{
  return self->_delegate;
}

+ (void)setClass:(Class)cls forClassName:(NSString *)codedName
{
  Mutable = (__CFDictionary *)qword_18C496198;
  if (!qword_18C496198)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], 0LL);
    qword_18C496198 = (uint64_t)Mutable;
  }

  if (cls) {
    CFDictionarySetValue(Mutable, codedName, cls);
  }
  else {
    CFDictionaryRemoveValue(Mutable, codedName);
  }
  os_unfair_lock_unlock(&stru_18C49618C);
}

- (void)setClass:(Class)cls forClassName:(NSString *)codedName
{
  nameClassMap = self->_nameClassMap;
  if (!nameClassMap)
  {
    nameClassMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], 0LL);
    self->_nameClassMap = nameClassMap;
  }

  if (cls) {
    CFDictionarySetValue(nameClassMap, codedName, cls);
  }
  else {
    CFDictionaryRemoveValue(nameClassMap, codedName);
  }
}

- (id)_allowedClassNames
{
  return -[_NSKeyedUnarchiverHelper allowedClassNames](self->_helper, "allowedClassNames");
}

- (void)_setAllowedClassNames:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v5 = (os_log_s *)_NSRuntimeIssuesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
  }

  -[_NSKeyedUnarchiverHelper setAllowedClassNames:](self->_helper, "setAllowedClassNames:", a3);
}

- (void)finishDecoding
{
  char v2 = atomic_load(&self->_flags);
  if ((v2 & 2) == 0)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      -[NSKeyedUnarchiverDelegate unarchiverWillFinish:](self->_delegate, "unarchiverWillFinish:", self);
    }
    unint64_t v4 = atomic_load(&self->_flags);
    atomic_store(v4 | 2, &self->_flags);
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        -[NSKeyedUnarchiverDelegate unarchiverDidFinish:](self->_delegate, "unarchiverDidFinish:", self);
      }
    }
  }

- (void)_temporaryMapReplaceObject:(id)a3 withObject:(id)a4
{
  v14[1] = *(const void **)MEMORY[0x1895F89C0];
  tmpRefObjMap = self->_tmpRefObjMap;
  if (tmpRefObjMap)
  {
    CFIndex Count = CFDictionaryGetCount(tmpRefObjMap);
    uint64_t v9 = Count;
    size_t v10 = 8 * Count;
    if ((unint64_t)(8 * Count) <= 0x200)
    {
      if (Count <= 0)
      {
        CFDictionaryGetKeysAndValues(self->_tmpRefObjMap, 0LL, 0LL);
        return;
      }

      id v11 = (const void **)((char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      id v12 = v11;
      CFDictionaryGetKeysAndValues(self->_tmpRefObjMap, v14, v11);
    }

    else
    {
      id v11 = (const void **)malloc(8 * Count);
      id v12 = (const void **)malloc(v10);
      CFDictionaryGetKeysAndValues(self->_tmpRefObjMap, v11, v12);
      if (v9 < 1)
      {
LABEL_13:
        free(v12);
        free(v11);
        return;
      }
    }

    uint64_t v13 = 0LL;
    while (v12[v13] != a3)
    {
      if (v9 == ++v13) {
        goto LABEL_12;
      }
    }

    CFDictionarySetValue(self->_tmpRefObjMap, v11[v13], a4);
LABEL_12:
    if (v10 >= 0x201) {
      goto LABEL_13;
    }
  }

- (void)replaceObject:(id)a3 withObject:(id)a4
{
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    unint64_t v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot replace"), 0 reason userInfo];
    objc_exception_throw(v5);
    -[NSKeyedUnarchiver _validateAllowedClassesContainsClassOfReference:forKey:](v6, v7, v8, v9);
  }

  else if (a3 != a4)
  {
    -[NSKeyedUnarchiver _temporaryMapReplaceObject:withObject:](self, "_temporaryMapReplaceObject:withObject:");
  }

- (BOOL)_validateAllowedClassesContainsClassOfReference:(id)a3 forKey:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  v12[0] = 0LL;
  id v7 = -[NSKeyedUnarchiver allowedClasses](self, "allowedClasses");
  unint64_t v8 = atomic_load(&self->_flags);
  char v9 = atomic_load(&self->_flags);
  char v10 = -[NSCoder _walkAllowedClassListValidatingInstance:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:invalidElementClass:]( self,  a3,  (uint64_t)a4,  v7,  (v8 >> 5) & 1,  (v9 & 0x40) != 0LL,  0,  v12);
  if ((v10 & 1) == 0 && !self->_helper->_decodeError)
  {
    if (v12[0]) {
      -[NSCoder __failWithUnexpectedElementClass:forContainerKey:allowedClasses:]( (NSString *)self,  v12[0],  (const __CFString *)a4,  v7);
    }
    else {
      -[NSCoder __failWithUnexpectedClass:forKey:allowedClasses:]( (NSString *)self,  [a3 classForCoder],  (const __CFString *)a4,  v7);
    }
  }

  return v10;
}

- (id)_decodeObjectOfClass:(Class)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  if (self->_helper->_decodeError) {
    return 0LL;
  }
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 4) == 0) {
    return -[NSKeyedUnarchiver decodeObject](self, "decodeObject", a3);
  }
  if (!a3 || !object_isClass(a3))
  {
    uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ '%@' is not an Objective-C class!",  _NSMethodExceptionProem((objc_class *)self, a2),  a3);
    SEL v14 = (void *)MEMORY[0x189603F70];
    CFIndex v15 = (const __CFString *)*MEMORY[0x189603A60];
LABEL_18:
    objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v13 userInfo:0]);
    return (id)-[NSKeyedUnarchiver _decodeCollectionOfClass:allowedClasses:forKey:]();
  }

  unint64_t v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189604010]), "initWithObjects:", a3, 0);
  -[NSMutableArray addObject:](self->_helper->_allowedClasses, "addObject:", v8);

  if (_warnArchiverCompat == 1)
  {
    char v9 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v9);
  }

  char v10 = atomic_load(&self->_flags);
  if ((v10 & 2) != 0)
  {
    uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unarchive already finished, %@",  _NSMethodExceptionProem((objc_class *)self, a2),  @"cannot decode anything more");
    SEL v14 = (void *)MEMORY[0x189603F70];
    CFIndex v15 = @"NSInvalidUnarchiveOperationException";
    goto LABEL_18;
  }

  if (self->_helper->_decodeError) {
    return 0LL;
  }
  v16[0] = 0LL;
  uint64_t genericKey = self->_genericKey;
  self->_uint64_t genericKey = genericKey + 1;
  else {
    id v12 = (NSString *)generic_keys[genericKey];
  }
  _decodeObject((uint64_t)self, v12, v16);
  -[NSMutableArray removeLastObject](self->_helper->_allowedClasses, "removeLastObject");
  return (id)v16[0];
}

- (void)_decodeCollectionOfClass:(void *)a3 allowedClasses:(__CFString *)a4 forKey:
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  if (a1 && !*(void *)(*(void *)(a1 + 120) + 32LL))
  {
    char v5 = atomic_load((unint64_t *)(a1 + 16));
    if ((v5 & 4) != 0)
    {
      uint64_t v7 = *(void *)(a1 + 120);
      uint64_t Length = objc_msgSend(*(id *)(v7 + 24), "addObject:", objc_msgSend(a3, "setByAddingObject:", a2));
      *(_WORD *)(v7 + 40) = 1;
      if (a4)
      {
        uint64_t Length = CFStringGetLength(a4);
        if (Length >= 1)
        {
          uint64_t Length = CFStringGetCharacterAtIndex(a4, 0LL);
          if ((_DWORD)Length == 36)
          {
            uint64_t Length = -[__CFString substringFromIndex:](a4, "substringFromIndex:", 1LL);
            a4 = (__CFString *)Length;
          }
        }
      }

      v15[0] = 0LL;
      unint64_t v9 = atomic_load((unint64_t *)(a1 + 16));
      atomic_store(v9 | 8, (unint64_t *)(a1 + 16));
      char v10 = (void *)MEMORY[0x186E1FF60](Length);
      if (*(void *)(a1 + 80))
      {
        _decodeObjectXML(a1, a4, v15);
      }

      else if (_decodeOffsetAndRef((objc_class *)a1, (uint64_t)a4, &v14, &v13))
      {
        _decodeObjectBinary(a1, v13, (uint64_t)a4, (CFTypeRef *)v15);
      }

      objc_autoreleasePoolPop(v10);
      *(_WORD *)(v7 + 40) = 0;
      [*(id *)(v7 + 24) removeLastObject];
      id v11 = v15[0];
    }

    else
    {
      id v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: This method only supports secure coding.", _NSMethodExceptionProem((objc_class *)a1, sel__decodeCollectionOfClass_allowedClasses_forKey_)), 0 reason userInfo];
      objc_exception_throw(v12);
      objc_exception_rethrow();
      __break(1u);
    }
  }

- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v7 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:]( self,  a3,  (uint64_t)v7)) {
    return 0LL;
  }
  -[NSKeyedUnarchiver _decodeCollectionOfClass:allowedClasses:forKey:]( (uint64_t)self,  MEMORY[0x189603F18],  a3,  (__CFString *)a4);
  return result;
}

- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5
{
  unint64_t v8 = (void *)[a3 setByAddingObjectsFromSet:a4];
  unint64_t v9 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:]( self,  v8,  (uint64_t)v9)) {
    return 0LL;
  }
  -[NSKeyedUnarchiver _decodeCollectionOfClass:allowedClasses:forKey:]( (uint64_t)self,  MEMORY[0x189603F68],  v8,  (__CFString *)a5);
  return result;
}

- (void)_enableStrictSecureDecodingMode
{
  p_flags = &self->_flags;
  do
    unint64_t v4 = __ldaxr(p_flags);
  while (__stlxr(v4 | 0x20, p_flags));
}

- (BOOL)_strictSecureDecodingEnabled
{
  unint64_t v2 = atomic_load(&self->_flags);
  return (v2 >> 5) & 1;
}

- (void)_allowDecodingCyclesInSecureMode
{
  p_flags = &self->_flags;
  do
    unint64_t v3 = __ldaxr(p_flags);
  while (__stlxr(v3 | 0x100, p_flags));
}

- (void)_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded
{
  p_flags = &self->_flags;
  do
    unint64_t v3 = __ldaxr(p_flags);
  while (__stlxr(v3 | 0x40, p_flags));
}

- (void)_enforceExplicitPlistTypes
{
  p_flags = &self->_flags;
  do
    unint64_t v3 = __ldaxr(p_flags);
  while (__stlxr(v3 | 0x80, p_flags));
}

- (BOOL)_willEnforceExplicitPlistTypes
{
  char v2 = atomic_load(&self->_flags);
  if (v2 < 0) {
    return 1;
  }
  else {
    return _os_feature_enabled_impl();
  }
}

- (void)__setError:(id)a3
{
}

void __49__NSKeyedUnarchiver__decodeArrayOfObjectsForKey___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v2)
  {
    int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    uint64_t v4 = (v3 - 1);
    if (v3 - 1 >= 0)
    {
      do
      {
        char v5 = *(void **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 8 * v4);
        if (v5) {
      }
        }

      while (v4-- > 0);
      char v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    }

    free(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
  }

- (int)decodeIntForKey:(NSString *)key
{
  v11[1] = *MEMORY[0x1895F89C0];
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    char v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v10);
  }

  if (self->_helper->_decodeError) {
    return 0;
  }
  uint64_t v6 = (__CFString *)key;
  unint64_t v7 = atomic_load(&self->_flags);
  atomic_store(v7 | 8, &self->_flags);
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
    uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
  }
  v11[0] = 0LL;
  int v8 = _decodeInt64((uint64_t)self, v6, v11);
  int v5 = v11[0];
  if (v8 && v11[0] - 0x80000000 <= 0xFFFFFFFEFFFFFFFFLL) {
    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603B40],  4864LL,  @"%@: value (%lld) for key (%@) too large to fit in a native integer",  _NSMethodExceptionProem((objc_class *)self, sel_decodeIntForKey_),  v11[0],  v6);
  }
  return v5;
}

- (int32_t)decodeInt32ForKey:(NSString *)key
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    unint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v7);
  }

  if (self->_helper->_decodeError) {
    return 0;
  }
  uint64_t v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
    uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
  }
  int32_t v8 = 0;
  _decodeInt32((objc_class *)self, v6, &v8);
  return v8;
}

- (float)decodeFloatForKey:(NSString *)key
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    unint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v7);
  }

  float result = 0.0;
  if (!self->_helper->_decodeError)
  {
    uint64_t v6 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
      uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
    }
    float v8 = 0.0;
    _decodeFloat((objc_class *)self, v6, &v8);
    return v8;
  }

  return result;
}

- (double)decodeDoubleForKey:(NSString *)key
{
  v8[1] = *(double *)MEMORY[0x1895F89C0];
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    unint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v7);
  }

  double result = 0.0;
  if (!self->_helper->_decodeError)
  {
    uint64_t v6 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
      uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
    }
    v8[0] = 0.0;
    _decodeDouble((uint64_t)self, v6, v8);
    return v8[0];
  }

  return result;
}

- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    id v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v12);
    return _decodeBytes((uint64_t)v9, v10, v11);
  }

  if (!self->_helper->_decodeError)
  {
    float v8 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v8, 0LL) == 36) {
      float v8 = (__CFString *)-[__CFString substringFromIndex:](v8, "substringFromIndex:", 1LL);
    }
    uint64_t v9 = self;
    char v10 = v8;
    id v11 = lengthp;
    return _decodeBytes((uint64_t)v9, v10, v11);
  }

  if (lengthp) {
    *lengthp = 0LL;
  }
  return 0LL;
}

- (id)_decodePropertyListForKey:(id)a3
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    CFIndex v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v15);
  }

  uint64_t v6 = (__CFString *)a3;
  unint64_t v7 = atomic_load(&self->_flags);
  atomic_store(v7 | 8, &self->_flags);
  if (a3 && CFStringGetLength((CFStringRef)a3) >= 1 && CFStringGetCharacterAtIndex(v6, 0LL) == 36) {
    uint64_t v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1LL);
  }
  containers = self->_containers;
  if (containers)
  {
    CFIndex Count = CFArrayGetCount(containers);
    ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
    if (CFGetTypeID(ValueAtIndex) == 19)
    {
      Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0LL);
      id v12 = Value;
      CFArrayRemoveValueAtIndex(ValueAtIndex, 0LL);
    }

    else
    {
      Value = (void *)CFDictionaryGetValue(ValueAtIndex, v6);
      id v13 = Value;
    }
  }

  else if (__CFBinaryPlistGetOffsetForValueFromDictionary3() {
         && !__CFBinaryPlistCreateObject())
  }
  {
    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"%@: data is corrupt or object is too large to decode",  _NSMethodExceptionProem((objc_class *)self, a2));
    return 0LL;
  }

  else
  {
    return 0LL;
  }

  return Value;
}

- (unsigned)_currentUniqueIdentifier
{
  return self->_helper->_lastRef;
}

- (BOOL)_containsNextUnkeyedObject
{
  uint64_t genericKey = self->_genericKey;
  if (genericKey <= 0x27)
  {
    char v4 = (NSString *)generic_keys[genericKey];
    if (v4) {
      goto LABEL_3;
    }
    return 0;
  }

  char v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"$%ld", genericKey);
  if (!v4) {
    return 0;
  }
LABEL_3:
  containers = self->_containers;
  if (!containers) {
    return __CFBinaryPlistGetOffsetForValueFromDictionary3();
  }
  CFIndex Count = CFArrayGetCount(containers);
  ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  if (CFGetTypeID(ValueAtIndex) == 19)
  {
    Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0LL);
    id v9 = Value;
    CFArrayRemoveValueAtIndex(ValueAtIndex, 0LL);
  }

  else
  {
    Value = (void *)CFDictionaryGetValue(ValueAtIndex, v4);
    id v11 = Value;
  }

  return Value != 0LL;
}

+ (BOOL)_evaluateCycleSecurityRules:(NSKeyedUnarchiverCycleEvaluationRules *)a3
{
  uint64_t v3 = *(unsigned int *)&a3->var0;
  if ((v3 & 0x10000) != 0) {
    return 0;
  }
  if ((v3 & 0x1000101) == 1) {
    return ((v3 | ((unint64_t)a3->var4 << 32)) & 0x100000000LL) == 0;
  }
  return 1;
}

- (id)decodeObject
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (_warnArchiverCompat == 1)
  {
    char v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v4);
  }

  char v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    id v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v9);
  }

  if (self->_helper->_decodeError) {
    return 0LL;
  }
  v10[0] = 0LL;
  uint64_t genericKey = self->_genericKey;
  self->_uint64_t genericKey = genericKey + 1;
  else {
    float v8 = (NSString *)generic_keys[genericKey];
  }
  _decodeObject((uint64_t)self, v8, v10);
  return (id)v10[0];
}

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  if (_warnArchiverCompat == 1)
  {
    uint64_t v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }

  char v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0)
  {
    CFIndex v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v15);
  }

  if (self->_helper->_decodeError)
  {
    if (a3)
    {
      double result = 0LL;
      *a3 = 0LL;
      return result;
    }
  }

  else
  {
    uint64_t genericKey = self->_genericKey;
    self->_uint64_t genericKey = genericKey + 1;
    else {
      char v10 = (NSString *)generic_keys[genericKey];
    }
    id v11 = _decodeBytes((uint64_t)self, v10, v16);
    if (a3) {
      *a3 = v16[0];
    }
    if (v11)
    {
      id v12 = (void *)[MEMORY[0x189603FB8] dataWithBytes:v11 length:v16[0]];
      if (v12) {
        return (void *)[v12 mutableBytes];
      }
      uint64_t v13 = *MEMORY[0x189603B38];
      uint64_t v14 = _NSMethodExceptionProem((objc_class *)self, sel_decodeBytesWithReturnedLength_);
      -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  v13,  4864LL,  @"%@: unable to allocate memory for length (%ld)",  v14,  v16[0]);
    }
  }

  return 0LL;
}

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  if (_warnArchiverCompat == 1)
  {
    uint64_t v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v6);
  }

  char v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0) {
    goto LABEL_12;
  }
  if (!a3)
  {
    char v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: null types pointer",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_10;
  }

  uint64_t v14 = &v15;
  if (*a3)
  {
    while (1)
    {
      float v8 = v14++;
      if (!*v8) {
        break;
      }
      -[NSKeyedUnarchiver decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", a3);
    }

    char v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: null address pointer",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_10:
    id v11 = v10;
    id v12 = (void *)MEMORY[0x189603F70];
    for (CFIndex i = (const __CFString *)*MEMORY[0x189603A60]; ; CFIndex i = @"NSInvalidUnarchiveOperationException")
    {
      objc_exception_throw((id)[v12 exceptionWithName:i reason:v11 userInfo:0]);
LABEL_12:
      id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unarchive already finished, %@",  _NSMethodExceptionProem((objc_class *)self, a2),  @"cannot decode anything more");
      id v12 = (void *)MEMORY[0x189603F70];
    }
  }

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  if (_warnArchiverCompat == 1)
  {
    float v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v8);
  }

  char v9 = atomic_load(&self->_flags);
  if ((v9 & 2) != 0)
  {
    __int16 v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unarchive already finished, %@",  _NSMethodExceptionProem((objc_class *)self, a2),  @"cannot decode anything more");
    id v22 = (void *)MEMORY[0x189603F70];
    uint64_t v23 = @"NSInvalidUnarchiveOperationException";
LABEL_24:
    objc_exception_throw((id)[v22 exceptionWithName:v23 reason:v21 userInfo:0]);
    goto LABEL_10;
  }

  if (!self->_helper->_decodeError)
  {
    unint64_t v10 = atomic_load(&self->_flags);
    atomic_store(v10 | 8, &self->_flags);
    if (!a3 || !a4)
    {
      uint64_t v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: null type or address pointer",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_23:
      __int16 v21 = v24;
      id v22 = (void *)MEMORY[0x189603F70];
      uint64_t v23 = (const __CFString *)*MEMORY[0x189603A60];
      goto LABEL_24;
    }

    int v11 = *(unsigned __int8 *)a3;
    if (v11 != 91)
    {
      if (v11 != 123)
      {
        id v12 = (NSString *)(char)v11;
        uint64_t v13 = self;
        uint64_t v14 = (BOOL *)a4;
        uint64_t v15 = a2;
LABEL_10:
        _compatDecodeValueOfObjCType((uint64_t)v13, v12, v14, v15);
        return;
      }

      uint64_t v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: this unarchiver cannot decode structs",  _NSMethodExceptionProem((objc_class *)self, a2));
      goto LABEL_23;
    }

    unsigned int v18 = *((unsigned __int8 *)a3 + 1);
    CFDataRef v17 = a3 + 1;
    unsigned int v16 = v18;
    if (v18 - 48 > 9) {
      goto LABEL_17;
    }
    uint64_t v19 = 0LL;
    do
    {
      uint64_t v19 = 10 * v19 + v16 - 48;
      unsigned int v20 = *(unsigned __int8 *)++v17;
      unsigned int v16 = v20;
    }

    while (v20 - 48 < 0xA);
    if (v19)
    {
      if (v16 == 93) {
        -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603A60],  4864LL,  @"%@: array type is missing",  _NSMethodExceptionProem((objc_class *)self, a2));
      }
      else {
        -[NSKeyedUnarchiver decodeArrayOfObjCType:count:at:](self, "decodeArrayOfObjCType:count:at:", v17);
      }
    }

    else
    {
LABEL_17:
      -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603A60],  4864LL,  @"%@: array count is missing or zero",  _NSMethodExceptionProem((objc_class *)self, a2));
    }
  }

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  uint64_t v10 = objc_opt_class();
  if (_warnArchiverCompat == 1)
  {
    int v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: warning: old archiving compatibility method called", v11);
  }

  char v12 = atomic_load(&self->_flags);
  if ((v12 & 2) != 0)
  {
    CFDataRef v17 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: unarchive already finished, %@", _NSMethodExceptionProem((objc_class *)self, a2), @"cannot decode anything more"), 0 reason userInfo];
    objc_exception_throw(v17);
    -[NSKeyedUnarchiver versionForClassName:](v18, v19, v20);
    return;
  }

  if (!self->_helper->_decodeError)
  {
    unint64_t v13 = atomic_load(&self->_flags);
    atomic_store(v13 | 8, &self->_flags);
    if (a3 && a5)
    {
      if (a4)
      {
        id v14 = -[NSKeyedUnarchiver _decodeObjectOfClass:](self, "_decodeObjectOfClass:", v10);
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          [v14 fillObjCType:*a3 count:a4 at:a5];
        }
        else {
          -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"%@: encoded entity at this point is not an array of ObjC type",  _NSMethodExceptionProem((objc_class *)self, a2));
        }
        return;
      }

      uint64_t v15 = *MEMORY[0x189603A60];
      __int16 v21 = _NSMethodExceptionProem((objc_class *)self, a2);
      unsigned int v16 = @"%@: count is zero";
    }

    else
    {
      uint64_t v15 = *MEMORY[0x189603A60];
      __int16 v21 = _NSMethodExceptionProem((objc_class *)self, a2);
      unsigned int v16 = @"%@: null type or address pointer";
    }

    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  v15,  4864LL,  v16,  v21);
  }

- (int64_t)versionForClassName:(id)a3
{
  Class v3 = NSClassFromString((NSString *)a3);
  if (v3) {
    return -[objc_class version](v3, "version");
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unsigned)systemVersion
{
  return 2000;
}

@end