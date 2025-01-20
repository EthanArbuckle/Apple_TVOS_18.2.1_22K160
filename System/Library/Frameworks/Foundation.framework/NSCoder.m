@interface NSCoder
+ (BOOL)__categorizeException:(id)a3 intoError:(id *)a4;
- (BOOL)__failWithException:(void *)a1;
- (BOOL)__failWithExceptionName:(id)a3 errorCode:(int64_t)a4 format:(id)a5;
- (BOOL)_allowsValueCoding;
- (BOOL)_enforceCollectionTyping;
- (BOOL)_shouldExemptProcessBasedOnArchivingExceptionRules:(BOOL)result;
- (BOOL)_validateAllowedClass:(Class)a3 forKey:(id)a4 allowingInvocations:(BOOL)a5;
- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4;
- (BOOL)_validateDecodeCollectionAllowedClassesRequirementsWithClasses:(uint64_t)a3 forMethodExceptionProem:;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(NSString *)key;
- (BOOL)decodeBoolForKey:(NSString *)key;
- (BOOL)requiresSecureCoding;
- (BOOL)validateAllowedClass:(Class)a3 forKey:(id)a4;
- (BOOL)validateClassSupportsSecureCoding:(Class)a3;
- (Class)_isPossibleNestedCollectionClass:(uint64_t)a1;
- (NSArray)decodeArrayOfObjectsOfClass:(Class)cls forKey:(NSString *)key;
- (NSArray)decodeArrayOfObjectsOfClasses:(NSSet *)classes forKey:(NSString *)key;
- (NSData)decodeDataObject;
- (NSDecodingFailurePolicy)decodingFailurePolicy;
- (NSDictionary)decodeDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)objectCls forKey:(NSString *)key;
- (NSDictionary)decodeDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)objectClasses forKey:(NSString *)key;
- (NSError)error;
- (NSInteger)versionForClassName:(NSString *)className;
- (NSPoint)decodePoint;
- (NSPoint)decodePointForKey:(NSString *)key;
- (NSRect)decodeRect;
- (NSRect)decodeRectForKey:(NSString *)key;
- (NSSet)allowedClasses;
- (NSSize)decodeSize;
- (NSSize)decodeSizeForKey:(NSString *)key;
- (NSString)__allowedClassesDescriptionForClass:(NSString *)result;
- (NSString)__descriptionForUnexpectedClass:(const __CFString *)a3 forKey:(void *)a4 allowedClasses:;
- (NSString)__descriptionForUnexpectedElementClass:(const __CFString *)a3 forContainerKey:(void *)a4 allowedClasses:;
- (NSString)__failWithUnexpectedClass:(const __CFString *)a3 forKey:(void *)a4 allowedClasses:;
- (NSString)__failWithUnexpectedElementClass:(const __CFString *)a3 forContainerKey:(void *)a4 allowedClasses:;
- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp;
- (double)decodeDoubleForKey:(NSString *)key;
- (float)decodeFloatForKey:(NSString *)key;
- (id)__decoderInfoForAllowedClassesWarning;
- (id)_allowedClassesDescriptionForClasses:(uint64_t)a1;
- (id)decodeObject;
- (id)decodeObjectForKey:(NSString *)key;
- (id)decodeObjectOfClass:(Class)aClass forKey:(NSString *)key;
- (id)decodeObjectOfClasses:(NSSet *)classes forKey:(NSString *)key;
- (id)decodePropertyListForKey:(NSString *)key;
- (id)decodeTopLevelObjectAndReturnError:(NSError *)error;
- (id)decodeTopLevelObjectForKey:(NSString *)key error:(NSError *)error;
- (id)decodeTopLevelObjectOfClass:(Class)aClass forKey:(NSString *)key error:(NSError *)error;
- (id)decodeTopLevelObjectOfClasses:(NSSet *)classes forKey:(NSString *)key error:(NSError *)error;
- (int)decodeIntForKey:(NSString *)key;
- (int32_t)decodeInt32ForKey:(NSString *)key;
- (int64_t)decodeInt64ForKey:(NSString *)key;
- (uint64_t)__tryDecodeObjectForKey:(void *)a3 error:(uint64_t)a4 decodeBlock:;
- (uint64_t)_walkAllowedClassListLookingForClass:(uint64_t)a3 forKey:(id)obj allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:;
- (uint64_t)_walkAllowedClassListValidatingInstance:(uint64_t)a3 forKey:(void *)a4 allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:(uint64_t *)a8 invalidElementClass:;
- (uint64_t)_warnAboutNSObjectInAllowedClassesWithException:(uint64_t)result;
- (unsigned)systemVersion;
- (void)__setError:(id)a3;
- (void)_warnAboutPlistType:(uint64_t)a3 forKey:(void *)a4 missingInAllowedClasses:;
- (void)decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)count at:(void *)array;
- (void)decodeBytesWithReturnedLength:(NSUInteger *)lengthp;
- (void)decodeValueOfObjCType:(const char *)type at:(void *)data;
- (void)decodeValueOfObjCType:(const char *)type at:(void *)data size:(NSUInteger)size;
- (void)decodeValuesOfObjCTypes:(const char *)types;
- (void)encodeArrayOfObjCType:(const char *)type count:(NSUInteger)count at:(const void *)array;
- (void)encodeBool:(BOOL)value forKey:(NSString *)key;
- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key;
- (void)encodeBytes:(const void *)byteaddr length:(NSUInteger)length;
- (void)encodeConditionalObject:(id)object forKey:(NSString *)key;
- (void)encodeDataObject:(NSData *)data;
- (void)encodeDouble:(double)value forKey:(NSString *)key;
- (void)encodeFloat:(float)value forKey:(NSString *)key;
- (void)encodeInt32:(int32_t)value forKey:(NSString *)key;
- (void)encodeInt64:(int64_t)value forKey:(NSString *)key;
- (void)encodeInt:(int)value forKey:(NSString *)key;
- (void)encodeObject:(id)object;
- (void)encodeObject:(id)object forKey:(NSString *)key;
- (void)encodePoint:(NSPoint)point;
- (void)encodePoint:(NSPoint)point forKey:(NSString *)key;
- (void)encodeRect:(NSRect)rect;
- (void)encodeRect:(NSRect)rect forKey:(NSString *)key;
- (void)encodeSize:(NSSize)size;
- (void)encodeSize:(NSSize)size forKey:(NSString *)key;
- (void)encodeValueOfObjCType:(const char *)type at:(const void *)addr;
- (void)encodeValuesOfObjCTypes:(const char *)types;
- (void)failWithError:(NSError *)error;
@end

@implementation NSCoder

- (uint64_t)_walkAllowedClassListLookingForClass:(uint64_t)a3 forKey:(id)obj allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  if (result)
  {
    id v10 = obj;
    uint64_t v13 = result;
    if (object_isClass(obj)) {
      id v10 = (id)[MEMORY[0x189604010] setWithObject:v10];
    }
    if (!v10) {
      return 0LL;
    }
    if (object_isClass(a2))
    {
      if (a5) {
        return [v10 containsObject:a2];
      }
      int v14 = [v10 containsObject:MEMORY[0x189616338]];
      if (v14)
      {
        char v15 = -[NSCoder _warnAboutNSObjectInAllowedClassesWithException:](v13, a7 ^ 1u);
        result = 0LL;
        if (!a2) {
          return result;
        }
        char v36 = v14;
        uint64_t v33 = a3;
        char v34 = a7;
        v35 = (objc_class *)v13;
        unint64_t v16 = 0x189616000LL;
        if ((v15 & 1) == 0) {
          return result;
        }
        goto LABEL_13;
      }

      char v36 = 0;
      uint64_t v33 = a3;
      char v34 = a7;
      v35 = (objc_class *)v13;
      unint64_t v16 = 0x189616000uLL;
      if (a2)
      {
LABEL_13:
        v17 = a2;
        while (1)
        {
          if (!object_isClass(v17))
          {
            v30 = v35;
            goto LABEL_55;
          }

          if ([v10 containsObject:v17]) {
            return 1LL;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            int v18 = -[objc_class _subclassesMustBeExplicitlyMentionedWhenDecoded]( v17,  "_subclassesMustBeExplicitlyMentionedWhenDecoded");
            if ((a6 & 1) != 0) {
              goto LABEL_20;
            }
          }

          else
          {
            int v18 = 0;
            if ((a6 & 1) != 0)
            {
LABEL_20:
              int v19 = 1;
              goto LABEL_21;
            }
          }

          int v19 = _os_feature_enabled_impl();
LABEL_21:
          if ((dyld_program_sdk_at_least() & v18) == 1)
          {
            IMP MethodImplementation = class_getMethodImplementation(*(Class *)(v16 + 824), sel_classForCoder);
            v21 = class_getMethodImplementation(v17, sel_classForCoder);
            if (object_getClass(v17) != *(Class *)(v16 + 824))
            {
              v22 = *(objc_class **)(v16 + 824);
              if (v21 == MethodImplementation
                && (InstanceMethod = class_getInstanceMethod(v17, sel_classForCoder),
                    InstanceMethod == class_getInstanceMethod(v22, sel_classForCoder))
                || (Superclass = class_getSuperclass(v17),
                    v21 == class_getMethodImplementation(Superclass, sel_classForCoder))
                && (v25 = class_getInstanceMethod(v17, sel_classForCoder),
                    v25 == class_getInstanceMethod(Superclass, sel_classForCoder)))
              {
                unint64_t v16 = 0x189616000LL;
              }

              else
              {
                if (qword_18C4965B8 != -1) {
                  dispatch_once(&qword_18C4965B8, &__block_literal_global_237);
                }
                Value = CFDictionaryGetValue((CFDictionaryRef)qword_18C4965B0, v17);
                unint64_t v16 = 0x189616000LL;
                if (!Value) {
                  goto LABEL_37;
                }
                v27 = Value;
                if ([v10 containsObject:Value]) {
                  return 1LL;
                }
                if (qword_18C4965B8 != -1) {
                  dispatch_once(&qword_18C4965B8, &__block_literal_global_237);
                }
                v28 = CFDictionaryGetValue((CFDictionaryRef)qword_18C4965B0, v27);
                if (v28)
                {
                  result = [v10 containsObject:v28];
                  if ((result & 1) != 0 || (a6 & 1) != 0) {
                    return result;
                  }
                }

                else
                {
LABEL_37:
                  if ((a6 & 1) != 0) {
                    return 0LL;
                  }
                }

                if (qword_18C496590 != -1) {
                  dispatch_once(&qword_18C496590, &__block_literal_global_5);
                }
                if (dword_18C49658C != 2)
                {
                  if ((v36 & 1) == 0)
                  {
                    uint64_t v37 = -[objc_class __decoderInfoForAllowedClassesWarning]( v35,  "__decoderInfoForAllowedClassesWarning");
                    unint64_t v16 = 0x189616000LL;
                    v32 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@' (%p) [%@]",  a2,  a2,  -[NSURL path]( -[NSBundle bundleURL]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", a2),  "bundleURL"),  "path"));
                    v29 = (os_log_s *)_NSRuntimeIssuesLog();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138544642;
                      v39 = v17;
                      __int16 v40 = 2114;
                      v41 = Superclass;
                      __int16 v42 = 2114;
                      uint64_t v43 = v33;
                      __int16 v44 = 2114;
                      v45 = v17;
                      __int16 v46 = 2114;
                      v47 = v32;
                      __int16 v48 = 2114;
                      uint64_t v49 = v37;
                      _os_log_fault_impl( &dword_182EB1000,  v29,  OS_LOG_TYPE_FAULT,  "Attempted to decode a collection type '%{public}@' (subclass of '%{public}@') for key '%{public} @'. '%{public}@' requires its subclasses to be explicitly added to the allowed classes list but it is not present. Allowing this has been a source of security issues. Please ensure you meant t his type to be in archives: %{public}@%{public}@",  buf,  0x3Eu);
                    }
                  }

                  char v36 = 1;
                  if (v19)
                  {
                    if ((v34 & 1) == 0) {
                      return -[NSCoder _shouldExemptProcessBasedOnArchivingExceptionRules:]( (BOOL)v35,  (uint64_t)"/System/Library/CoreServices/ArchivingExceptions.bundle/CollectionSubclasses.plist");
                    }
                  }
                }
              }
            }
          }

          result = (uint64_t)class_getSuperclass(v17);
          v17 = (objc_class *)result;
          if (!result) {
            return result;
          }
        }
      }

      return 0LL;
    }

    v30 = (objc_class *)v13;
LABEL_55:
    v31 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ object in class list '%@' is not an Objective-C class!", _NSMethodExceptionProem(v30, sel_validateAllowedClass_forKey_), a2), 0 reason userInfo];
    objc_exception_throw(v31);
    return +[NSArray(NSArray) _subclassesMustBeExplicitlyMentionedWhenDecoded]();
  }

  return result;
}

- (id)decodeTopLevelObjectOfClasses:(NSSet *)classes forKey:(NSString *)key error:(NSError *)error
{
  v6[7] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __54__NSCoder_decodeTopLevelObjectOfClasses_forKey_error___block_invoke;
  v6[3] = &unk_189C99AF8;
  v6[4] = self;
  v6[5] = classes;
  v6[6] = key;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, (uint64_t)key, error, (uint64_t)v6);
}

- (uint64_t)__tryDecodeObjectForKey:(void *)a3 error:(uint64_t)a4 decodeBlock:
{
  if (!a1) {
    return 0LL;
  }
  if (!a4) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[NSCoder(Exceptions) __tryDecodeObjectForKey:error:decodeBlock:]"),  @"NSCoder.m",  1370LL,  @"Invalid parameter not satisfying: %@",  @"decodeBlock != nil");
  }
  uint64_t v8 = [a1 decodingFailurePolicy];
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (v8 && (id v10 = (void *)[a1 error]) != 0)
  {
    if (a3) {
      *a3 = v10;
    }
    objc_msgSend(a1, "__setError:", 0);
    return 0LL;
  }

  else if (a3 && !v9)
  {
    if (a2)
    {
      v11 = (void *)MEMORY[0x189603F68];
      v12 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"requested key: '%@'", a2);
      uint64_t v13 = [v11 dictionaryWithObject:v12 forKey:*MEMORY[0x189604F30]];
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    uint64_t v9 = 0LL;
    *a3 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4865LL,  v13);
  }

  return v9;
}

uint64_t __54__NSCoder_decodeTopLevelObjectOfClasses_forKey_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (BOOL)validateAllowedClass:(Class)a3 forKey:(id)a4
{
  return -[NSCoder _validateAllowedClass:forKey:allowingInvocations:]( self,  "_validateAllowedClass:forKey:allowingInvocations:",  a3,  a4,  0LL);
}

- (BOOL)_validateAllowedClass:(Class)a3 forKey:(id)a4 allowingInvocations:(BOOL)a5
{
  BOOL v5 = a5;
  return -[NSCoder _validateAllowedClassesContainsClass:forKey:]( self,  "_validateAllowedClassesContainsClass:forKey:",  a3,  a4)
      && (!v5 || (Class)MEMORY[0x189603F88] != a3 && (Class)MEMORY[0x189603F28] != a3)
      && -[NSCoder validateClassSupportsSecureCoding:](self, "validateClassSupportsSecureCoding:", a3);
}

- (BOOL)validateClassSupportsSecureCoding:(Class)a3
{
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_18C650CC8) & 1) == 0)
  {
    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"This decoder will only decode classes that adopt NSSecureCoding. Class '%s' does not adopt it.",  class_getName(a3),  v9);
    return 0;
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"Class '%s' disallows secure coding. It must implement supportsSecureCoding and return YES.",  class_getName(a3),  v9);
    return 0;
  }

  if (!-[objc_class supportsSecureCoding](a3, "supportsSecureCoding"))
  {
    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"Class '%s' disallows secure coding. It must return YES from supportsSecureCoding.",  class_getName(a3),  v9);
    return 0;
  }

  if (!a3)
  {
LABEL_8:
    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"Class '%s' does not implement initWithCoder:.",  class_getName(a3),  v9);
    return 0;
  }

  Superclass = a3;
  while ((_classOverridesSelector(Superclass, sel_initWithCoder_) & 1) == 0)
  {
    Superclass = class_getSuperclass(Superclass);
    if (!Superclass) {
      goto LABEL_8;
    }
  }

  Class = object_getClass(Superclass);
  if ((_classOverridesSelector(Class, sel_supportsSecureCoding) & 1) == 0)
  {
    Name = class_getName(a3);
    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"Class '%s' has a superclass that supports secure coding, but '%s' overrides -initWithCoder: and does not override +supportsSecureCoding. The class must implement +supportsSecureCoding and return YES to verify that its implementation of -initWithCoder: is secure coding compliant.",  Name,  class_getName(a3));
    return 0;
  }

  return 1;
}

- (Class)_isPossibleNestedCollectionClass:(uint64_t)a1
{
  Class result = 0LL;
  if (a1)
  {
    v4 = a2;
    if (a2)
    {
      while (1)
      {
        if (v4 == (objc_class *)MEMORY[0x189616338]) {
          return 0LL;
        }
        if (qword_18C4965A8 != -1) {
          dispatch_once(&qword_18C4965A8, &__block_literal_global_236);
        }
        if ([(id)qword_18C4965A0 containsObject:v4]) {
          break;
        }
        Class result = class_getSuperclass(v4);
        v4 = result;
        if (!result) {
          return result;
        }
      }

      return (Class)1;
    }
  }

  return result;
}

- (void)encodeValueOfObjCType:(const char *)type at:(const void *)addr
{
  v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeDataObject:(NSData *)data
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)objc_opt_class();
  uint64_t v9 = [v8 instanceMethodForSelector:sel_decodeValueOfObjCType_at_size_];
  if (v9 == +[NSCoder instanceMethodForSelector:]( &OBJC_CLASS___NSCoder,  "instanceMethodForSelector:",  sel_decodeValueOfObjCType_at_size_)
    || (uint64_t v10 = [v8 instanceMethodForSelector:sel_decodeValueOfObjCType_at_],
        v10 != +[NSCoder instanceMethodForSelector:]( &OBJC_CLASS___NSCoder,  "instanceMethodForSelector:",  sel_decodeValueOfObjCType_at_)))
  {
    v12 = NSClassFromString((NSString *)@"NSCoder");
    NSRequestConcreteImplementation((uint64_t)self, a2, v12);
  }

  v11 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)uint64_t v13 = 138412290;
    *(void *)&v13[4] = v8;
    _os_log_fault_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_FAULT,  "%@ overrode the default implementation of '-decodeValueOfObjCType:at:', which is insecure and deprecated, but not '-decodeValueOfObjCType:at:size:' which is insecure as it can lead to potential buffer overflows. Use the safer '- decodeValueOfObjCType:at:size:' method",  v13,  0xCu);
  }

  *(void *)uint64_t v13 = 0LL;
  NSGetSizeAndAlignment(type, (NSUInteger *)v13, 0LL);
  -[NSCoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", type, data, *(void *)v13);
}

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data size:(NSUInteger)size
{
  sizep[1] = *MEMORY[0x1895F89C0];
  uint64_t v10 = (void *)objc_opt_class();
  sizep[0] = 0LL;
  NSGetSizeAndAlignment(type, sizep, 0LL);
  if (sizep[0] != size)
  {
    uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot get decode with size %zu. The type encoded as %s is expected to be %zu bytes",  size,  type,  sizep[0]);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
  }

  uint64_t v11 = [v10 instanceMethodForSelector:sel_decodeValueOfObjCType_at_];
  if (v11 == +[NSCoder instanceMethodForSelector:]( &OBJC_CLASS___NSCoder,  "instanceMethodForSelector:",  sel_decodeValueOfObjCType_at_)
    || (uint64_t v12 = [v10 instanceMethodForSelector:sel_decodeValueOfObjCType_at_size_],
        v12 != +[NSCoder instanceMethodForSelector:]( &OBJC_CLASS___NSCoder,  "instanceMethodForSelector:",  sel_decodeValueOfObjCType_at_size_)))
  {
    uint64_t v13 = NSClassFromString((NSString *)@"NSCoder");
    NSRequestConcreteImplementation((uint64_t)self, a2, v13);
  }

  -[NSCoder decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", type, data);
}

- (NSData)decodeDataObject
{
  v4 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSInteger)versionForClassName:(NSString *)className
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)encodeObject:(id)object
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = object;
  -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "@", v3);
}

- (void)encodeValuesOfObjCTypes:(const char *)types
{
  if (*types)
  {
    v3 = types;
    do
      -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", v3, *(void *)v6, v6 + 8);
    while (*(unsigned __int8 *)++v3);
  }

- (void)encodeArrayOfObjCType:(const char *)type count:(NSUInteger)count at:(const void *)array
{
  v12[1] = *MEMORY[0x1895F89C0];
  size_t v9 = strlen(type);
  size_t v10 = v9 + 16;
  if (v9 + 16 < 0x201)
  {
    if (v9 == -16LL) {
      uint64_t v11 = 0LL;
    }
    else {
      uint64_t v11 = (char *)v12 - ((v9 + 31) & 0xFFFFFFFFFFFFFFF0LL);
    }
  }

  else
  {
    uint64_t v11 = (char *)malloc(v9 + 16);
  }

  snprintf(v11, v10, "[%lu%s]", count, type);
  -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", v11, array);
  if (v10 >= 0x201) {
    free(v11);
  }
}

- (void)encodeBytes:(const void *)byteaddr length:(NSUInteger)length
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unsigned int v6 = length;
  -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "I", &v6);
  -[NSCoder encodeArrayOfObjCType:count:at:](self, "encodeArrayOfObjCType:count:at:", "c", v6, byteaddr);
}

- (id)decodeObject
{
  v4[1] = *(id *)MEMORY[0x1895F89C0];
  if (-[NSCoder error](self, "error")) {
    return 0LL;
  }
  v4[0] = 0LL;
  -[NSCoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "@", v4, 8LL);
  return v4[0];
}

- (id)decodeTopLevelObjectAndReturnError:(NSError *)error
{
  v4[5] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  id v4[2] = __46__NSCoder_decodeTopLevelObjectAndReturnError___block_invoke;
  v4[3] = &unk_189C99AA8;
  v4[4] = self;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, 0LL, error, (uint64_t)v4);
}

uint64_t __46__NSCoder_decodeTopLevelObjectAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeObject];
}

- (void)decodeValuesOfObjCTypes:(const char *)types
{
  if (*types)
  {
    v3 = types;
    do
      -[NSCoder decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", v3, *(void *)v6, v6 + 8);
    while (*(unsigned __int8 *)++v3);
  }

- (void)decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)count at:(void *)array
{
  v12[1] = *MEMORY[0x1895F89C0];
  size_t v9 = strlen(itemType);
  size_t v10 = v9 + 23;
  if (v9 + 23 < 0x201)
  {
    if (v9 == -23LL) {
      uint64_t v11 = 0LL;
    }
    else {
      uint64_t v11 = (char *)v12 - ((v9 + 38) & 0xFFFFFFFFFFFFFFF0LL);
    }
  }

  else
  {
    uint64_t v11 = (char *)malloc(v9 + 23);
  }

  snprintf(v11, v10, "[%lu%s]", count, itemType);
  -[NSCoder decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", v11, array);
  if (v10 >= 0x201) {
    free(v11);
  }
}

- (void)decodeBytesWithReturnedLength:(NSUInteger *)lengthp
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  unsigned int v7 = 0;
  -[NSCoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "I", &v7, 4LL);
  BOOL v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x189603FB8], "dataWithLength:", v7), "mutableBytes");
  -[NSCoder decodeArrayOfObjCType:count:at:](self, "decodeArrayOfObjCType:count:at:", "c", v7, v5);
  *lengthp = v7;
  return v5;
}

- (BOOL)allowsKeyedCoding
{
  return 0;
}

- (BOOL)_allowsValueCoding
{
  return 0;
}

- (void)encodeObject:(id)object forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)decodeObjectForKey:(NSString *)key
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)decodeTopLevelObjectForKey:(NSString *)key error:(NSError *)error
{
  v5[6] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __44__NSCoder_decodeTopLevelObjectForKey_error___block_invoke;
  v5[3] = &unk_189C99AD0;
  v5[4] = self;
  v5[5] = key;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, (uint64_t)key, error, (uint64_t)v5);
}

uint64_t __44__NSCoder_decodeTopLevelObjectForKey_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decodeObjectForKey:*(void *)(a1 + 40)];
}

- (void)encodeConditionalObject:(id)object forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeBool:(BOOL)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt:(int)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt32:(int32_t)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt64:(int64_t)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeFloat:(float)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeDouble:(double)value forKey:(NSString *)key
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key
{
  unsigned int v7 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (BOOL)containsValueForKey:(NSString *)key
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)decodeBoolForKey:(NSString *)key
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)decodeIntForKey:(NSString *)key
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int32_t)decodeInt32ForKey:(NSString *)key
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int64_t)decodeInt64ForKey:(NSString *)key
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (float)decodeFloatForKey:(NSString *)key
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (double)decodeDoubleForKey:(NSString *)key
{
  BOOL v5 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp
{
  va_list v6 = NSClassFromString((NSString *)@"NSCoder");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (unsigned)systemVersion
{
  return 1000;
}

- (BOOL)requiresSecureCoding
{
  return 0;
}

- (id)decodeObjectOfClass:(Class)aClass forKey:(NSString *)key
{
  return -[NSCoder decodeObjectOfClasses:forKey:]( self,  "decodeObjectOfClasses:forKey:",  [MEMORY[0x189604010] setWithObject:aClass],  key);
}

- (id)decodeTopLevelObjectOfClass:(Class)aClass forKey:(NSString *)key error:(NSError *)error
{
  return -[NSCoder decodeObjectOfClasses:forKey:error:]( self,  "decodeObjectOfClasses:forKey:error:",  [MEMORY[0x189604010] setWithObject:aClass],  key,  error);
}

- (NSArray)decodeArrayOfObjectsOfClass:(Class)cls forKey:(NSString *)key
{
  unsigned int v7 = (void *)[MEMORY[0x189604010] setWithObject:cls];
  uint64_t v8 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:]( self,  v7,  (uint64_t)v8))
  {
    return -[NSCoder decodeArrayOfObjectsOfClasses:forKey:](self, "decodeArrayOfObjectsOfClasses:forKey:", v7, key);
  }

  else
  {
    return 0LL;
  }

- (BOOL)_validateDecodeCollectionAllowedClassesRequirementsWithClasses:(uint64_t)a3 forMethodExceptionProem:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
LABEL_4:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v24 != v7) {
        objc_enumerationMutation(a2);
      }
      size_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
      if (!object_isClass(v9))
      {
        uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ object in class list '%@' is not an Objective-C class!",  a3,  v9);
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
        __break(1u);
      }

      if (v9 == (void *)MEMORY[0x189616338]
        && !-[NSCoder _warnAboutNSObjectInAllowedClassesWithException:]((uint64_t)a1, 1))
      {
        return 0LL;
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [a2 countByEnumeratingWithState:&v23 objects:v22 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3052000000LL;
  int v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  uint64_t v21 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __98__NSCoder__validateDecodeCollectionAllowedClassesRequirementsWithClasses_forMethodExceptionProem___block_invoke;
  v15[3] = &unk_189C99B20;
  v15[4] = a1;
  v15[5] = &v16;
  [a2 enumerateObjectsUsingBlock:v15];
  size_t v10 = (void *)v17[5];
  BOOL v11 = v10 == 0LL;
  if (v10)
  {
    [v10 appendString:@"\n\t\n"]);
    uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: This method only supports decoding non-nested collections. Please remove the following or use '-decodeObjectOfClasses: forKey:' instead: %@",  a3,  v17[5]);

    objc_msgSend( a1,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864,  @"%@",  v12);
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (NSDictionary)decodeDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)objectCls forKey:(NSString *)key
{
  v14[2] = *MEMORY[0x1895F89C0];
  v14[0] = keyCls;
  v14[1] = objectCls;
  size_t v10 = (void *)objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v14, 2));
  BOOL v11 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:]( self,  v10,  (uint64_t)v11)) {
    return 0LL;
  }
  uint64_t v12 = [MEMORY[0x189604010] setWithObject:keyCls];
  return -[NSCoder decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:]( self,  "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:",  v12,  [MEMORY[0x189604010] setWithObject:objectCls],  key);
}

- (id)decodeObjectOfClasses:(NSSet *)classes forKey:(NSString *)key
{
  if (-[NSCoder allowsKeyedCoding](self, "allowsKeyedCoding", classes))
  {
    if (-[NSCoder requiresSecureCoding](self, "requiresSecureCoding"))
    {
      uint64_t v8 = NSClassFromString((NSString *)@"NSCoder");
      NSRequestConcreteImplementation((uint64_t)self, a2, v8);
    }

    return -[NSCoder decodeObjectForKey:](self, "decodeObjectForKey:", key);
  }

  else
  {
    size_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: This method is only implemented for coders which allowKeyedCoding.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[NSCoder decodeObjectOfClasses:forKey:error:](v10, v11, v12, v13, v14);
  }

- (NSArray)decodeArrayOfObjectsOfClasses:(NSSet *)classes forKey:(NSString *)key
{
  uint64_t v7 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:]( self,  classes,  (uint64_t)v7)) {
    return 0LL;
  }
  if (-[NSCoder allowsKeyedCoding](self, "allowsKeyedCoding"))
  {
    if (-[NSCoder requiresSecureCoding](self, "requiresSecureCoding"))
    {
      size_t v9 = NSClassFromString((NSString *)@"NSCoder");
      NSRequestConcreteImplementation((uint64_t)self, a2, v9);
    }

    size_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: This method only supports secure coding.",  _NSMethodExceptionProem((objc_class *)self, a2));
    SEL v11 = (void *)MEMORY[0x189603F70];
    id v12 = &NSInvalidUnarchiveOperationException;
  }

  else
  {
    size_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: This method is only implemented for coders which allowKeyedCoding.",  _NSMethodExceptionProem((objc_class *)self, a2));
    SEL v11 = (void *)MEMORY[0x189603F70];
    id v12 = (const NSExceptionName *)MEMORY[0x189603A60];
  }

  objc_exception_throw((id)[v11 exceptionWithName:*v12 reason:v10 userInfo:0]);
  return (NSArray *)-[NSCoder decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:](v13, v14, v15, v16, v17);
}

- (NSDictionary)decodeDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)objectClasses forKey:(NSString *)key
{
  uint64_t v7 = -[NSSet setByAddingObjectsFromSet:](keyClasses, "setByAddingObjectsFromSet:", objectClasses);
  uint64_t v8 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:]( self,  v7,  (uint64_t)v8)) {
    return 0LL;
  }
  if (-[NSCoder allowsKeyedCoding](self, "allowsKeyedCoding"))
  {
    if (-[NSCoder requiresSecureCoding](self, "requiresSecureCoding"))
    {
      size_t v10 = NSClassFromString((NSString *)@"NSCoder");
      NSRequestConcreteImplementation((uint64_t)self, a2, v10);
    }

    SEL v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: This method only supports secure coding.",  _NSMethodExceptionProem((objc_class *)self, a2));
    id v12 = (void *)MEMORY[0x189603F70];
    id v13 = &NSInvalidUnarchiveOperationException;
  }

  else
  {
    SEL v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: This method is only implemented for coders which allowKeyedCoding.",  _NSMethodExceptionProem((objc_class *)self, a2));
    id v12 = (void *)MEMORY[0x189603F70];
    id v13 = (const NSExceptionName *)MEMORY[0x189603A60];
  }

  objc_exception_throw((id)[v12 exceptionWithName:*v13 reason:v11 userInfo:0]);
  return (NSDictionary *)-[NSCoder decodePropertyListForKey:](v14, v15, v16);
}

- (id)decodePropertyListForKey:(NSString *)key
{
  if (-[NSCoder allowsKeyedCoding](self, "allowsKeyedCoding"))
  {
    uint64_t v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    return -[NSCoder decodeObjectOfClasses:forKey:]( self,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0),  key);
  }

  else
  {
    id v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: This method is only implemented for coders which allowKeyedCoding.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
    return -[NSCoder allowedClasses](v14, v15);
  }

- (NSSet)allowedClasses
{
  return 0LL;
}

- (uint64_t)_warnAboutNSObjectInAllowedClassesWithException:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  v3 = (objc_class *)result;
  uint64_t v4 = objc_msgSend((id)result, "__decoderInfoForAllowedClassesWarning");
  BOOL v5 = (os_log_s *)_NSRuntimeIssuesLog();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    if (a2) {
      goto LABEL_4;
    }
    return 1LL;
  }

  *(_DWORD *)buf = 138543874;
  uint64_t v8 = _NSMethodExceptionProem(v3, sel_validateAllowedClass_forKey_);
  __int16 v9 = 2114;
  id v10 = -[NSCoder _allowedClassesDescriptionForClasses:]( (uint64_t)v3,  (void *)-[objc_class allowedClasses](v3, "allowedClasses"));
  __int16 v11 = 2114;
  uint64_t v12 = v4;
  _os_log_fault_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_FAULT,  "%{public}@: NSSecureCoding allowed classes list contains [NSObject class], which bypasses security by allowing any O bjective-C class to be implicitly decoded. Consider reducing the scope of allowed classes during decoding by listing only the classes you expect to decode, or a more specific base class than NSObject. This will become an error in th e future. Allowed class list: %{public}@%{public}@",  buf,  0x20u);
  if (!a2) {
    return 1LL;
  }
LABEL_4:
  if (qword_18C496590 != -1) {
    dispatch_once(&qword_18C496590, &__block_literal_global_5);
  }
  if (dword_18C49658C == 2) {
    return 1LL;
  }
  uint64_t v6 = _NSMethodExceptionProem(v3, sel_validateAllowedClass_forKey_);
  -[objc_class __failWithExceptionName:errorCode:format:]( v3,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"%@: NSSecureCoding allowed classes list contains '[NSObject class]', which bypasses security by allowing any Objective-C class to be implicitly decoded. Consider reducing the scope of allowed classes during decoding by listing only the classes you expect to decode, or a more specific base class than NSObject. Allowed class list: %@%@",  v6,  -[NSCoder _allowedClassesDescriptionForClasses:]( (uint64_t)v3,  (void *)-[objc_class allowedClasses](v3, "allowedClasses")),  v4);
  return 0LL;
}

NSMutableString *__98__NSCoder__validateDecodeCollectionAllowedClassesRequirementsWithClasses_forMethodExceptionProem___block_invoke( uint64_t a1,  objc_class *a2)
{
  Class result = (NSMutableString *)-[NSCoder _isPossibleNestedCollectionClass:](*(void *)(a1 + 32), a2);
  if ((_DWORD)result)
  {
    BOOL v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n\t\t%@",  -[NSCoder __allowedClassesDescriptionForClass:](*(NSString **)(a1 + 32), (uint64_t)a2));
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v6)
    {
      return (NSMutableString *)[v6 appendString:v5];
    }

    else
    {
      Class result = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"\n\t(%@"),  v5;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
    }
  }

  return result;
}

- (NSString)__allowedClassesDescriptionForClass:(NSString *)result
{
  if (result) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@' (%p) [%@]",  a2,  a2,  -[NSURL path]( -[NSBundle bundleURL]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", a2),  "bundleURL"),  "path"));
  }
  return result;
}

- (BOOL)_shouldExemptProcessBasedOnArchivingExceptionRules:(BOOL)result
{
  v2[5] = *MEMORY[0x1895F89C0];
  if (result)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __62__NSCoder__shouldExemptProcessBasedOnArchivingExceptionRules___block_invoke;
    v2[3] = &__block_descriptor_40_e5_v8__0l;
    v2[4] = a2;
    if (qword_18C496598 != -1) {
      dispatch_once(&qword_18C496598, v2);
    }
    return _MergedGlobals_92 != 0;
  }

  return result;
}

- (BOOL)_enforceCollectionTyping
{
  if (qword_18C496590 != -1) {
    dispatch_once(&qword_18C496590, &__block_literal_global_5);
  }
  return dword_18C49658C == 0;
}

- (uint64_t)_walkAllowedClassListValidatingInstance:(uint64_t)a3 forKey:(void *)a4 allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:(uint64_t *)a8 invalidElementClass:
{
  v32[128] = *(void **)MEMORY[0x1895F89C0];
  if (!a1
    || !-[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]( (uint64_t)a1,  (objc_class *)[a2 classForCoder],  a3,  a4,  a5,  a6,  a7))
  {
    return 0LL;
  }

  if (![a1 _enforceCollectionTyping]
    || (_NSIsNSArray() & 1) == 0
    && (_NSIsNSSet() & 1) == 0
    && (_NSIsNSOrderedSet() & 1) == 0
    && !_NSIsNSDictionary())
  {
    return 1LL;
  }

  uint64_t v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  memset(&callBacks, 0, sizeof(callBacks));
  uint64_t v13 = CFSetCreateMutable(v12, 32LL, &callBacks);
  memset(&v26, 0, sizeof(v26));
  SEL v14 = CFArrayCreateMutable(v12, 32LL, &v26);
  CFArrayAppendValue(v14, a2);
  CFIndex Count = CFArrayGetCount(v14);
  if (!Count)
  {
LABEL_24:
    uint64_t v23 = 1LL;
    goto LABEL_25;
  }

  __int128 v25 = a8;
  while (1)
  {
    CFIndex v16 = Count - 1;
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v14, Count - 1);
    CFArrayRemoveValueAtIndex(v14, v16);
    if (!CFSetContainsValue(v13, ValueAtIndex)) {
      break;
    }
LABEL_23:
    CFIndex Count = CFArrayGetCount(v14);
    if (!Count) {
      goto LABEL_24;
    }
  }

  CFSetAddValue(v13, ValueAtIndex);
  uint64_t v18 = [ValueAtIndex classForCoder];
  if ([a1 _validateAllowedClassesContainsClass:v18 forKey:a3])
  {
    if ((_NSIsNSArray() & 1) != 0
      || (_NSIsNSSet() & 1) != 0
      || (_NSIsNSOrderedSet() & 1) != 0
      || _NSIsNSDictionary())
    {
      int v19 = _NSIsNSDictionary();
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      *(_OWORD *)newValues = 0u;
      __int128 v29 = 0u;
      uint64_t v20 = [ValueAtIndex countByEnumeratingWithState:newValues objects:v32 count:128];
      if (v20)
      {
        CFIndex v21 = v20;
        do
        {
          v33.location = v16;
          v33.length = 0LL;
          CFArrayReplaceValues(v14, v33, (const void **)newValues[1], v21);
          v16 += v21;
          if (v19)
          {
            for (uint64_t i = 0LL; i != v21; ++i)
              v32[i] = (void *)[ValueAtIndex objectForKey:newValues[1][i]];
            v34.location = v16;
            v34.length = 0LL;
            CFArrayReplaceValues(v14, v34, (const void **)v32, v21);
            v16 += v21;
          }

          CFIndex v21 = [ValueAtIndex countByEnumeratingWithState:newValues objects:v32 count:128];
        }

        while (v21);
      }
    }

    goto LABEL_23;
  }

  uint64_t v23 = 0LL;
  if (v25) {
    uint64_t *v25 = v18;
  }
LABEL_25:
  CFRelease(v13);
  CFRelease(v14);
  return v23;
}

void __62__NSCoder__shouldExemptProcessBasedOnArchivingExceptionRules___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  getpid();
  uint64_t v8 = *(void *)(a1 + 32);
  if (sandbox_check()
    || (v4 = +[NSString stringWithCString:encoding:]( NSString,  "stringWithCString:encoding:",  *(void *)(a1 + 32),  4,  v8),  (BOOL v5 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithContentsOfFile:v4]) == 0))
  {
    byte_18C496589 = 1;
    v2 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_ERROR,  "No ArchivingExceptions available / readable. Allowing all.",  buf,  2u);
    }

    v3 = 0LL;
  }

  else
  {
    v3 = v5;
    byte_18C496589 = objc_msgSend( v5,  "containsObject:",  -[NSProcessInfo processName]( +[NSProcessInfo processInfo](NSProcessInfo, "processInfo"),  "processName"));
  }

  if (byte_18C496589)
  {
    char v6 = 1;
  }

  else
  {
    if (qword_18C496590 != -1) {
      dispatch_once(&qword_18C496590, &__block_literal_global_5);
    }
    if (byte_18C496589) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = dword_18C49658C == 2;
    }
    char v6 = v7;
  }

  _MergedGlobals_92 = v6;
}

- (NSString)__descriptionForUnexpectedClass:(const __CFString *)a3 forKey:(void *)a4 allowedClasses:
{
  if (result)
  {
    if (a3) {
      uint64_t v4 = a3;
    }
    else {
      uint64_t v4 = @"(no key, possibly an argument to a message)";
    }
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@",  v4,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@' (%p) [%@]",  a2,  a2,  -[NSURL path]( -[NSBundle bundleURL]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", a2),  "bundleURL"),  "path")),  -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)result, a4));
  }

  return result;
}

- (id)_allowedClassesDescriptionForClasses:(uint64_t)a1
{
  v6[6] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __48__NSCoder__allowedClassesDescriptionForClasses___block_invoke;
  v6[3] = &unk_189C99B68;
  v6[4] = v4;
  v6[5] = a1;
  [a2 enumerateObjectsUsingBlock:v6];
  return v4;
}

- (NSString)__descriptionForUnexpectedElementClass:(const __CFString *)a3 forContainerKey:(void *)a4 allowedClasses:
{
  if (result)
  {
    if (a3) {
      id v4 = a3;
    }
    else {
      id v4 = @"(no key, possibly an argument to a message)";
    }
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"collection for key '%@' recursively contained an element of unexpected class %@.\nAllowed classes are:\n %@",  v4,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@' (%p) [%@]",  a2,  a2,  -[NSURL path]( -[NSBundle bundleURL]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", a2),  "bundleURL"),  "path")),  -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)result, a4));
  }

  return result;
}

uint64_t __48__NSCoder__allowedClassesDescriptionForClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "addObject:",  -[NSCoder __allowedClassesDescriptionForClass:](*(NSString **)(a1 + 40), a2));
}

- (void)_warnAboutPlistType:(uint64_t)a3 forKey:(void *)a4 missingInAllowedClasses:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v8 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544386;
      uint64_t v10 = _NSMethodExceptionProem(a1, sel_validateAllowedClass_forKey_);
      __int16 v11 = 2114;
      uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@' (%p) [%@]",  a2,  a2,  -[NSURL path]( -[NSBundle bundleURL]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", a2),  "bundleURL"),  "path"));
      __int16 v13 = 2114;
      uint64_t v14 = a3;
      __int16 v15 = 2114;
      id v16 = -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)a1, a4);
      __int16 v17 = 2114;
      uint64_t v18 = -[objc_class __decoderInfoForAllowedClassesWarning](a1, "__decoderInfoForAllowedClassesWarning");
      _os_log_fault_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_FAULT,  "%{public}@ allowed unarchiving safe plist type '%{public}@' for key '%{public}@', even though it was not explici tly included in the client allowed classes set: '%{public}@'. This will be disallowed in the future.%{public}@",  buf,  0x34u);
    }
  }

- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4
{
  id v4 = (const __CFString *)a4;
  if (!a3)
  {
    __int16 v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to decode an object with no class for key '%@'.",  a4);
    uint64_t v12 = (void *)MEMORY[0x189603F70];
    __int16 v13 = &NSInvalidUnarchiveOperationException;
LABEL_15:
    objc_exception_throw((id)[v12 exceptionWithName:*v13 reason:v11 userInfo:0]);
    LOBYTE(v8) = __NSCoderInvalidState();
    return v8;
  }

  if (!object_isClass(a3))
  {
    __int16 v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ object in class list '%@' is not an Objective-C class!",  _NSMethodExceptionProem((objc_class *)self, sel_validateAllowedClass_forKey_),  a3);
    uint64_t v12 = (void *)MEMORY[0x189603F70];
    __int16 v13 = (const NSExceptionName *)MEMORY[0x189603A60];
    goto LABEL_15;
  }

  BOOL v7 = -[NSCoder allowedClasses](self, "allowedClasses");
  if (!-[NSSet containsObject:](v7, "containsObject:", MEMORY[0x189616338])
    || (int v8 = -[NSCoder _warnAboutNSObjectInAllowedClassesWithException:]((uint64_t)self, 1)) != 0)
  {
    Superclass = a3;
    do
    {
      if (-[NSSet containsObject:](v7, "containsObject:", Superclass))
      {
        LOBYTE(v8) = 1;
        return v8;
      }

      Superclass = class_getSuperclass(Superclass);
    }

    while (Superclass);
    if (!v4) {
      id v4 = @"(no key, possibly an argument to a message)";
    }
    uint64_t v10 = -[NSCoder __allowedClassesDescriptionForClass:]((NSString *)self, (uint64_t)a3);
    -[NSCoder __failWithExceptionName:errorCode:format:]( self,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@",  v4,  v10,  -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)self, v7));
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)__decoderInfoForAllowedClassesWarning
{
  return &stru_189CA6A28;
}

- (void)failWithError:(NSError *)error
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (error)
  {
    if (!self) {
      return;
    }
  }

  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[NSCoder(Exceptions) failWithError:]"),  @"NSCoder.m",  1354LL,  @"Invalid parameter not satisfying: %@",  @"error != nil");
    if (!self) {
      return;
    }
  }

  char v6 = @"__NSCoderError";
  v7[0] = error;
  uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  -[NSCoder __failWithException:]( self,  (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  @"NSInvalidUnarchiveOperationException",  -[NSError localizedDescription](error, "localizedDescription"),  v5));
}

- (NSDecodingFailurePolicy)decodingFailurePolicy
{
  return 0LL;
}

- (NSError)error
{
  return 0LL;
}

- (void)__setError:(id)a3
{
  id v8 = __NSCoderInvalidState( (uint64_t)@"Attempting to set decode error on throwing NSCoder %@",  (uint64_t)a2,  (uint64_t)a3,  v3,  v4,  v5,  v6,  v7,  (uint64_t)self);
  -[NSCoder __failWithException:](v8, v9);
}

- (BOOL)__failWithException:(void *)a1
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (![a1 decodingFailurePolicy]
      || (v5[0] = 0, !objc_msgSend((id)objc_opt_class(), "__categorizeException:intoError:", a2, v5)))
    {
      objc_exception_throw(a2);
    }

    objc_msgSend(a1, "__setError:", v5[0]);
  }

  return a1 != 0LL;
}

- (NSString)__failWithUnexpectedClass:(const __CFString *)a3 forKey:(void *)a4 allowedClasses:
{
  if (result) {
    return (NSString *)-[NSString __failWithExceptionName:errorCode:format:]( result,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"%@",  -[NSCoder __descriptionForUnexpectedClass:forKey:allowedClasses:](result, a2, a3, a4));
  }
  return result;
}

- (NSString)__failWithUnexpectedElementClass:(const __CFString *)a3 forContainerKey:(void *)a4 allowedClasses:
{
  if (result) {
    return (NSString *)-[NSString __failWithExceptionName:errorCode:format:]( result,  "__failWithExceptionName:errorCode:format:",  @"NSInvalidUnarchiveOperationException",  4864LL,  @"%@",  -[NSCoder __descriptionForUnexpectedElementClass:forContainerKey:allowedClasses:]( result,  a2,  a3,  a4));
  }
  return result;
}

- (BOOL)__failWithExceptionName:(id)a3 errorCode:(int64_t)a4 format:(id)a5
{
  unint64_t v9 = a4;
  v19[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (!a4) {
      goto LABEL_5;
    }
  }

  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[NSCoder(Exceptions) __failWithExceptionName:errorCode:format:]"),  @"NSCoder.m",  1464LL,  @"Invalid parameter not satisfying: %@",  @"exceptionName != nil");
    if (!v9) {
      goto LABEL_5;
    }
  }

  if (v9 >> 1 != 2432)
  {
    id v14 = __NSCoderInvalidState( (uint64_t)@"invalid error code: %ld",  (uint64_t)a2,  (uint64_t)a3,  a4,  (uint64_t)a5,  v5,  v6,  v7,  v9);
    return +[NSCoder __categorizeException:intoError:](v14, v15, v16, v17);
  }

  uint64_t v18 = @"__NSCoderInternalErrorCode";
  v19[0] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9);
  unint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
LABEL_5:
  if (a5) {
    uint64_t v12 =  -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a5,  &v20);
  }
  else {
    uint64_t v12 = (NSString *)&stru_189CA6A28;
  }
  return -[NSCoder __failWithException:]( self,  (void *)[MEMORY[0x189603F70] exceptionWithName:a3 reason:v12 userInfo:v9]);
}

+ (BOOL)__categorizeException:(id)a3 intoError:(id *)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSCoder(Exceptions) __categorizeException:intoError:]"),  @"NSCoder.m",  1501LL,  @"Invalid parameter not satisfying: %@",  @"exception != nil");
    if (a4) {
      goto LABEL_3;
    }
  }

  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSCoder(Exceptions) __categorizeException:intoError:]"),  @"NSCoder.m",  1502LL,  @"Invalid parameter not satisfying: %@",  @"outError != NULL");
LABEL_3:
  uint64_t v6 = (void *)[a3 userInfo];
  if (!v6) {
    return (char)v6;
  }
  uint64_t v7 = v6;
  id v8 = (void *)[v6 objectForKey:@"__NSCoderInternalErrorCode"];
  uint64_t v9 = [v7 objectForKey:@"__NSCoderError"];
  unint64_t v17 = v9;
  if (v8 && v9)
  {
    __NSCoderInvalidState( (uint64_t)@"expected only one of: internal error code (%@) or external error (%@) not both",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v8);
    goto LABEL_25;
  }

  if (v8)
  {
    if ((_NSIsNSNumber() & 1) != 0)
    {
      unint64_t v17 = [v8 integerValue];
      if (v17 >> 1 == 2432)
      {
        if (!a4)
        {
LABEL_19:
          LOBYTE(v6) = 1;
          return (char)v6;
        }

        __int128 v25 = (void *)[a3 reason];
        if ([v25 length]) {
          uint64_t v26 = [MEMORY[0x189603F68] dictionaryWithObject:v25 forKey:*MEMORY[0x189604F30]];
        }
        else {
          uint64_t v26 = 0LL;
        }
        unint64_t v17 =  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  v17,  v26);
LABEL_18:
        *a4 = (id)v17;
        goto LABEL_19;
      }

      goto LABEL_26;
    }

- (void)encodePoint:(NSPoint)point
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  float x = point.x;
  float v6 = x;
  float y = point.y;
  float v5 = y;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ff", &v6, &v5);
}

- (NSPoint)decodePoint
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ff", &v5, &v4);
  double v2 = v5;
  double v3 = v4;
  result.float y = v3;
  result.float x = v2;
  return result;
}

- (void)encodeSize:(NSSize)size
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  float width = size.width;
  float v6 = width;
  float height = size.height;
  float v5 = height;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ff", &v6, &v5);
}

- (NSSize)decodeSize
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ff", &v5, &v4);
  double v2 = v5;
  double v3 = v4;
  result.float height = v3;
  result.float width = v2;
  return result;
}

- (void)encodeRect:(NSRect)rect
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  float x = rect.origin.x;
  float y = rect.origin.y;
  float v9 = y;
  float v10 = x;
  float width = rect.size.width;
  float height = rect.size.height;
  float v7 = height;
  float v8 = width;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ffff", &v10, &v9, &v8, &v7);
}

- (NSRect)decodeRect
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ffff", &v9, &v8, &v7, &v6);
  double v2 = v9;
  double v3 = v8;
  double v4 = v7;
  double v5 = v6;
  result.size.float height = v5;
  result.size.float width = v4;
  result.origin.float y = v3;
  result.origin.float x = v2;
  return result;
}

- (void)encodePoint:(NSPoint)point forKey:(NSString *)key
{
}

- (void)encodeSize:(NSSize)size forKey:(NSString *)key
{
}

- (void)encodeRect:(NSRect)rect forKey:(NSString *)key
{
}

- (NSPoint)decodePointForKey:(NSString *)key
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v3 = -[NSCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), key);
  if (v3)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    parseFloats(v3, 2LL, (uint64_t)&v6);
    double v4 = v6;
    double v5 = v7;
  }

  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }

  result.float y = v5;
  result.float x = v4;
  return result;
}

- (NSSize)decodeSizeForKey:(NSString *)key
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v3 = -[NSCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), key);
  if (v3)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    parseFloats(v3, 2LL, (uint64_t)&v6);
    double v4 = v6;
    double v5 = v7;
  }

  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }

  result.float height = v5;
  result.float width = v4;
  return result;
}

- (NSRect)decodeRectForKey:(NSString *)key
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = -[NSCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), key);
  if (v3)
  {
    __int128 v8 = 0u;
    *(_OWORD *)float v9 = 0u;
    parseFloats(v3, 4LL, (uint64_t)&v8);
    double v5 = *((double *)&v8 + 1);
    double v4 = *(double *)&v8;
    double v7 = v9[1];
    double v6 = v9[0];
  }

  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }

  result.size.float height = v7;
  result.size.float width = v6;
  result.origin.float y = v5;
  result.origin.float x = v4;
  return result;
}

@end