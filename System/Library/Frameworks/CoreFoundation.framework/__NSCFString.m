@interface __NSCFString
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isCString;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unint64_t)a5;
- (BOOL)hasPrefix:(id)a3;
- (BOOL)hasSuffix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isNSString__;
- (Class)classForCoder;
- (const)UTF8String;
- (const)_fastCStringContents:(BOOL)a3;
- (const)cString;
- (const)cStringUsingEncoding:(unint64_t)a3;
- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)substringWithRange:(_NSRange)a3;
- (unint64_t)cStringLength;
- (unint64_t)fastestEncoding;
- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (unint64_t)smallestEncoding;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)getLineStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setString:(id)a3;
@end

@implementation __NSCFString

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (BOOL)isNSString__
{
  return 1;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  return v6;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (_CFStringCheckAndGetCharacters((uint64_t)self, a4.location, a4.length, a3))
  {
    unsigned __int16 v6 = (__NSCFString *)-[__NSCFString getCharacters:range:].cold.1((objc_class *)self, a2);
    -[__NSCFString _fastCharacterContents](v6, v7);
  }

- (const)_fastCStringContents:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringEncoding SystemEncoding = enc;
  if (enc == -1)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }

  return (const char *)_CFNonObjCStringGetCStringPtr((unint64_t *)self, SystemEncoding, v3);
}

- (const)cString
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  CFStringEncoding SystemEncoding = enc;
  if (enc == -1)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }

  result = (const char *)_CFNonObjCStringGetCStringPtr((unint64_t *)self, SystemEncoding, 1);
  if (!result)
  {
LABEL_2:
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS_____NSCFString;
    return -[__NSCFString cString](&v5, sel_cString);
  }

  return result;
}

- (const)UTF8String
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (__CFStringMtbl((uint64_t)self)
    || (result = (const char *)_CFNonObjCStringGetCStringPtr((unint64_t *)self, 0x8000100u, 1)) == 0LL)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS_____NSCFString;
    return -[__NSCFString UTF8String](&v4, sel_UTF8String);
  }

  return result;
}

- (unint64_t)cStringLength
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  CFStringEncoding SystemEncoding = enc;
  if (enc == -1)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFString;
  return -[__NSCFString cStringLength](&v5, sel_cStringLength);
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  CFStringEncoding v6 = CFStringConvertNSStringEncodingToEncoding(a3);
  if (v6 == -1)
  {
    if (a3 != 134217984 && a3) {
      return 0LL;
    }
    if (_CFExecutableLinkedOnOrAfter(6uLL)) {
      CFLog( 4LL,  (uint64_t)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSStringEncodingASCII. Will stop this compatibility mapping behavior in the near future.",  v7,  v8,  v9,  v10,  v11,  v12,  a3);
    }
    CFStringEncoding v6 = 1536;
  }

  result = (const char *)_CFNonObjCStringGetCStringPtr((unint64_t *)self, v6, 1);
  if (!result)
  {
LABEL_2:
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS_____NSCFString;
    return -[__NSCFString cStringUsingEncoding:](&v13, sel_cStringUsingEncoding_, a3);
  }

  return result;
}

- (BOOL)getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unint64_t)a5
{
  CFStringEncoding v9 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v9 != -1) {
    return CFStringGetCString((CFStringRef)self, a3, a4, v9) != 0;
  }
  if (a5 == 134217984 || !a5)
  {
    if (_CFExecutableLinkedOnOrAfter(6uLL)) {
      CFLog( 4LL,  (uint64_t)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSStringEncodingASCII. Will stop this compatibility mapping behavior in the near future.",  v10,  v11,  v12,  v13,  v14,  v15,  a5);
    }
    CFStringEncoding v9 = 1536;
    return CFStringGetCString((CFStringRef)self, a3, a4, v9) != 0;
  }

  return 0;
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  unint64_t v9 = Length2;
  if (location + length > Length2)
  {
    uint64_t v18 = __CFExceptionProem((objc_class *)self, a2);
    v19 = "";
    if (length == 64) {
      v19 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    v20 = (__NSCFString *)_CFThrowFormattedException( (uint64_t)@"NSInvalidArgumentException",  @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
                            v18,
                            location,
                            length,
                            v9,
                            v19);
    return -[__NSCFString substringWithRange:](v20, v21, v23);
  }

  else
  {
    if ((Length2 < length || location > Length2 - length) && (_newSubstringWithRange_zone__warnonce & 1) == 0)
    {
      _newSubstringWithRange_zone__warnonce = 1;
      uint64_t v10 = __CFExceptionProem((objc_class *)self, a2);
      CFLog( 4LL,  (uint64_t)@"*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution.",
        v11,
        v12,
        v13,
        v14,
        v15,
        v16,
        v10);
    }

    v22.NSUInteger location = location;
    v22.NSUInteger length = length;
    return (id)CFStringCreateWithSubstring(0LL, (CFStringRef)self, v22);
  }

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  unint64_t v8 = Length2;
  if (location + length > Length2)
  {
    uint64_t v17 = __CFExceptionProem((objc_class *)self, a2);
    uint64_t v18 = "";
    if (length == 64) {
      uint64_t v18 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    v19 = (__NSCFString *)_CFThrowFormattedException( (uint64_t)@"NSInvalidArgumentException",  @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
                            v17,
                            location,
                            length,
                            v8,
                            v18);
    return (id)-[__NSCFString isEqual:](v19, v20, v21);
  }

  else
  {
    if ((Length2 < length || location > Length2 - length) && (substringWithRange__warnonce & 1) == 0)
    {
      substringWithRange__warnonce = 1;
      uint64_t v9 = __CFExceptionProem((objc_class *)self, a2);
      CFLog( 4LL,  (uint64_t)@"*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution.",
        v10,
        v11,
        v12,
        v13,
        v14,
        v15,
        v9);
    }

    v22.NSUInteger location = location;
    v22.NSUInteger length = length;
    return (id)(id)CFStringCreateWithSubstring(0LL, (CFStringRef)self, v22);
  }

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v9) = 1;
    return v9;
  }

  if (!a3) {
    goto LABEL_27;
  }
  if (((unint64_t)a3 & 0x8000000000000000LL) == 0)
  {
    if (*(__objc2_class **)a3 == __CFConstantStringClassReferencePtr || *(Class *)a3 == self->super.super.isa)
    {
LABEL_13:
      LOBYTE(v9) = _CFStringEqual(self, a3) != 0;
      return v9;
    }

    int v9 = [a3 isNSString];
    if (!v9) {
      return v9;
    }
    unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
    if (Length2 == [a3 length])
    {
      uint64_t v12 = (__objc2_class *)objc_opt_class();
      if (v12 != &OBJC_CLASS_____NSCFString && class_getSuperclass((Class)v12) != (Class)&OBJC_CLASS_____NSCFString)
      {
LABEL_21:
        LOBYTE(v9) = [a3 isEqualToString:self];
        return v9;
      }

      goto LABEL_13;
    }

- (BOOL)isEqualToString:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v9) = 1;
    return v9;
  }

  if (!a3) {
    goto LABEL_27;
  }
  if (((unint64_t)a3 & 0x8000000000000000LL) == 0)
  {
    if (*(__objc2_class **)a3 == __CFConstantStringClassReferencePtr || *(Class *)a3 == self->super.super.isa)
    {
LABEL_13:
      LOBYTE(v9) = _CFStringEqual(self, a3) != 0;
      return v9;
    }

    int v9 = [a3 isNSString];
    if (!v9) {
      return v9;
    }
    unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
    if (Length2 == [a3 length])
    {
      uint64_t v12 = (__objc2_class *)objc_opt_class();
      if (v12 != &OBJC_CLASS_____NSCFString && class_getSuperclass((Class)v12) != (Class)&OBJC_CLASS_____NSCFString)
      {
LABEL_21:
        LOBYTE(v9) = [a3 isEqualToString:self];
        return v9;
      }

      goto LABEL_13;
    }

- (BOOL)hasPrefix:(id)a3
{
  if (a3) {
    return CFStringHasPrefix((CFStringRef)self, (CFStringRef)a3) != 0;
  }
  objc_super v4 = (__NSCFString *)-[__NSCFString hasPrefix:].cold.1((objc_class *)self, a2);
  return -[__NSCFString hasSuffix:](v4, v5, v6);
}

- (BOOL)hasSuffix:(id)a3
{
  if (a3) {
    return CFStringHasSuffix((CFStringRef)self, (CFStringRef)a3) != 0;
  }
  objc_super v4 = (__NSCFString *)-[__NSCFString hasSuffix:].cold.1((objc_class *)self, a2);
  -[__NSCFString getLineStart:end:contentsEnd:forRange:](v4, v5, v6, v7, v8, v9);
  return result;
}

- (void)getLineStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  unint64_t v14 = Length2;
  if (location + length > Length2)
  {
    uint64_t v22 = __CFExceptionProem((objc_class *)self, a2);
    _NSRange v23 = "";
    if (length == 64) {
      _NSRange v23 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    v24 = (__NSCFString *)_CFThrowFormattedException( (uint64_t)@"NSInvalidArgumentException",  @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
                            v22,
                            location,
                            length,
                            v14,
                            v23);
    -[__NSCFString copyWithZone:](v24, v25, v26);
  }

  else
  {
    if ((Length2 < length || location > Length2 - length) && (getLineStart_end_contentsEnd_forRange__warnonce & 1) == 0)
    {
      getLineStart_end_contentsEnd_forRange__warnonce = 1;
      uint64_t v15 = __CFExceptionProem((objc_class *)self, a2);
      CFLog( 4LL,  (uint64_t)@"*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution.",
        v16,
        v17,
        v18,
        v19,
        v20,
        v21,
        v15);
    }

    v27.NSUInteger location = location;
    v27.NSUInteger length = length;
    CFStringGetLineBounds((CFStringRef)self, v27, (CFIndex *)a3, (CFIndex *)a4, (CFIndex *)a5);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  return _CFNonObjCStringCreateCopy(0LL, (uint64_t)self, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (id)copy
{
  return _CFNonObjCStringCreateCopy(0LL, (uint64_t)self, v2, v3, v4, v5, v6, v7);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFStringCreateMutableCopy(0LL, 0LL, (CFStringRef)self);
}

- (unint64_t)fastestEncoding
{
  CFStringEncoding FastestEncoding = CFStringGetFastestEncoding((CFStringRef)self);
  return CFStringConvertEncodingToNSStringEncoding(FastestEncoding);
}

- (unint64_t)smallestEncoding
{
  CFStringEncoding SmallestEncoding = CFStringGetSmallestEncoding((CFStringRef)self);
  return CFStringConvertEncodingToNSStringEncoding(SmallestEncoding);
}

- (Class)classForCoder
{
  else {
    return objc_lookUpClass("NSString");
  }
}

- (BOOL)_isCString
{
  return __CFStringIsEightBit((uint64_t)self);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  int v6 = __CFStringCheckAndReplace((__CFString *)self, a3.location, a3.length, (__CFString *)a4);
  if (v6)
  {
    mutateError(a2, v6, (objc_class *)self);
    mutateError(v7, v8, v9);
  }

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  int v6 = __CFStringCheckAndReplace((__CFString *)self, a4, 0LL, (__CFString *)a3);
  if (v6)
  {
    mutateError(a2, v6, (objc_class *)self);
    -[__NSCFString appendString:](v7, v8, v9);
  }

- (void)appendString:(id)a3
{
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  int v7 = __CFStringCheckAndReplace((__CFString *)self, Length2, 0LL, (__CFString *)a3);
  if (v7)
  {
    mutateError(a2, v7, (objc_class *)self);
    -[__NSCFString deleteCharactersInRange:](v8, v9, v10);
  }

- (void)deleteCharactersInRange:(_NSRange)a3
{
  int v5 = __CFStringCheckAndReplace((__CFString *)self, a3.location, a3.length, &stru_1899EF170);
  if (v5)
  {
    mutateError(a2, v5, (objc_class *)self);
    -[__NSCFString appendFormat:](v6, v7, v8);
  }

- (void)appendFormat:(id)a3
{
}

- (void)setString:(id)a3
{
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  int v7 = __CFStringCheckAndReplace((__CFString *)self, 0LL, Length2, (__CFString *)a3);
  if (v7)
  {
    mutateError(a2, v7, (objc_class *)self);
    -[__NSCFString appendCharacters:length:](v8, v9, v10, v11);
  }

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  if (__CFStringMtbl((uint64_t)self))
  {
    CFStringAppendCharacters((CFMutableStringRef)self, a3, a4);
  }

  else
  {
    id v8 = (__NSCFString *)-[__NSCFString appendCharacters:length:].cold.1(a2);
    -[__NSCFString replaceOccurrencesOfString:withString:options:range:](v8, v9, v10, v11, v12, v13);
  }

- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (!__CFStringMtbl((uint64_t)self))
  {
    -[__NSCFString replaceOccurrencesOfString:withString:options:range:].cold.1(a2);
LABEL_13:
    -[__NSCFString replaceOccurrencesOfString:withString:options:range:].cold.2((objc_class *)self, a2);
LABEL_14:
    uint64_t v23 = __CFExceptionProem((objc_class *)self, a2);
    v24 = "";
    if (length == 64) {
      v24 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    _CFThrowFormattedException( (uint64_t)@"NSInvalidArgumentException",  @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
      v23,
      location,
      length,
      v6,
      v24);
  }

  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  if (!a3 || !a4) {
    goto LABEL_13;
  }
  unint64_t v6 = Length2;
  if (location + length > Length2) {
    goto LABEL_14;
  }
  if ((Length2 < length || location > Length2 - length)
    && (replaceOccurrencesOfString_withString_options_range__warnonce & 1) == 0)
  {
    replaceOccurrencesOfString_withString_options_range__warnonce = 1;
    uint64_t v15 = __CFExceptionProem((objc_class *)self, a2);
    CFLog( 4LL,  (uint64_t)@"*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution.",
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v15);
  }

  if ((a5 & 0x400) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)&OBJC_CLASS_____NSCFString;
    return -[__NSCFString replaceOccurrencesOfString:withString:options:range:]( &v25,  sel_replaceOccurrencesOfString_withString_options_range_,  a3,  a4,  a5,  location,  length);
  }

  else
  {
    v27.NSUInteger location = location;
    v27.NSUInteger length = length;
    return CFStringFindAndReplace( (CFMutableStringRef)self,  (CFStringRef)a3,  (CFStringRef)a4,  v27,  ~(8 * (_BYTE)a5) & 0x10 | a5);
  }

- (uint64_t)characterAtIndex:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_8(v4, @"%@: Range or index out of bounds");
  return -[__NSCFString getCharacters:range:].cold.1(v2);
}

- (uint64_t)getCharacters:(objc_class *)a1 range:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_8(v4, @"%@: Range or index out of bounds");
  return -[__NSCFString hasPrefix:].cold.1(v2);
}

- (uint64_t)hasPrefix:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_8(v4, @"%@: nil argument");
  return -[__NSCFString hasSuffix:].cold.1(v2);
}

- (uint64_t)hasSuffix:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_8(v4, @"%@: nil argument");
  return -[__NSCFString appendFormat:].cold.1(v2);
}

- (uint64_t)appendFormat:(const char *)a1 .cold.1(const char *a1)
{
  Name = sel_getName(a1);
  uint64_t v1 = OUTLINED_FUNCTION_0_8((uint64_t)Name, @"Attempt to mutate immutable object with %s");
  return -[__NSCFString appendCharacters:length:].cold.1(v1);
}

- (uint64_t)appendCharacters:(const char *)a1 length:.cold.1(const char *a1)
{
  Name = sel_getName(a1);
  uint64_t v1 = OUTLINED_FUNCTION_0_8((uint64_t)Name, @"Attempt to mutate immutable object with %s");
  return -[__NSCFString replaceOccurrencesOfString:withString:options:range:].cold.1(v1);
}

- (uint64_t)replaceOccurrencesOfString:(const char *)a1 withString:options:range:.cold.1(const char *a1)
{
  Name = sel_getName(a1);
  uint64_t v1 = OUTLINED_FUNCTION_0_8((uint64_t)Name, @"Attempt to mutate immutable object with %s");
  return -[__NSCFString replaceOccurrencesOfString:withString:options:range:].cold.2(v1);
}

- (uint64_t)replaceOccurrencesOfString:(objc_class *)a1 withString:(const char *)a2 options:range:.cold.2( objc_class *a1,  const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_8(v4, @"%@: nil argument");
  return -[__NSCFAttributedString addAttribute:value:range:].cold.1(v2);
}

@end