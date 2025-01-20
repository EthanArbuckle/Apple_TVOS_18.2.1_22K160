@interface NSCharacterSet
+ (BOOL)supportsSecureCoding;
+ (NSCharacterSet)alphanumericCharacterSet;
+ (NSCharacterSet)capitalizedLetterCharacterSet;
+ (NSCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data;
+ (NSCharacterSet)characterSetWithCharactersInString:(NSString *)aString;
+ (NSCharacterSet)characterSetWithContentsOfFile:(NSString *)fName;
+ (NSCharacterSet)characterSetWithRange:(NSRange)aRange;
+ (NSCharacterSet)controlCharacterSet;
+ (NSCharacterSet)decimalDigitCharacterSet;
+ (NSCharacterSet)decomposableCharacterSet;
+ (NSCharacterSet)illegalCharacterSet;
+ (NSCharacterSet)letterCharacterSet;
+ (NSCharacterSet)lowercaseLetterCharacterSet;
+ (NSCharacterSet)newlineCharacterSet;
+ (NSCharacterSet)nonBaseCharacterSet;
+ (NSCharacterSet)punctuationCharacterSet;
+ (NSCharacterSet)symbolCharacterSet;
+ (NSCharacterSet)uppercaseLetterCharacterSet;
+ (NSCharacterSet)whitespaceAndNewlineCharacterSet;
+ (NSCharacterSet)whitespaceCharacterSet;
+ (void)initialize;
- (BOOL)characterIsMember:(unichar)aCharacter;
- (BOOL)hasMemberInPlane:(uint8_t)thePlane;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMutable;
- (BOOL)isSupersetOfSet:(NSCharacterSet *)theOtherSet;
- (BOOL)longCharacterIsMember:(UTF32Char)theLongChar;
- (NSCharacterSet)init;
- (NSCharacterSet)initWithCoder:(NSCoder *)aDecoder;
- (NSCharacterSet)invertedSet;
- (NSData)bitmapRepresentation;
- (__CFCharacterSet)_expandedCFCharacterSet;
- (id)_retainedBitmapRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)replacementObjectForPortCoder:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCharacterSet

+ (NSCharacterSet)whitespaceCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 8);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetWhitespace) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 8);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 8);
  }

  return result;
}

+ (NSCharacterSet)letterCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetLetter);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 32);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetLetter) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 32);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 32);
  }

  return result;
}

+ (void)initialize
{
}

- (__CFCharacterSet)_expandedCFCharacterSet
{
  return 0LL;
}

+ (NSCharacterSet)controlCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetControl);
  }
  result = *(NSCharacterSet **)__NSBuiltinSetTable;
  if (!*(void *)__NSBuiltinSetTable)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetControl) options:2];
    v3 = (unint64_t *)__NSBuiltinSetTable;
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)__NSBuiltinSetTable;
  }

  return result;
}

+ (NSCharacterSet)whitespaceAndNewlineCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 16);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 16);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 16);
  }

  return result;
}

+ (NSCharacterSet)decimalDigitCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 24);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 24);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 24);
  }

  return result;
}

+ (NSCharacterSet)lowercaseLetterCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 40);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 40);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 40);
  }

  return result;
}

+ (NSCharacterSet)uppercaseLetterCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 48);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 48);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 48);
  }

  return result;
}

+ (NSCharacterSet)alphanumericCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 72);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 72);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 72);
  }

  return result;
}

+ (NSCharacterSet)nonBaseCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 56);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetNonBase) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 56);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 56);
  }

  return result;
}

+ (NSCharacterSet)decomposableCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetDecomposable);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 64);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetDecomposable) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 64);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 64);
  }

  return result;
}

+ (NSCharacterSet)punctuationCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 80);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetPunctuation) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 80);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 80);
  }

  return result;
}

+ (NSCharacterSet)capitalizedLetterCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetCapitalizedLetter);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 96);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetCapitalizedLetter) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 96);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 96);
  }

  return result;
}

+ (NSCharacterSet)illegalCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetIllegal);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 88);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetIllegal) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 88);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 88);
  }

  return result;
}

+ (NSCharacterSet)symbolCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 104);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetSymbol) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 104);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 104);
  }

  return result;
}

+ (NSCharacterSet)newlineCharacterSet
{
  if (!__NSBuiltinSetTable) {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  }
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 112);
  if (!result)
  {
    result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetNewline) options:2];
    v3 = (unint64_t *)(__NSBuiltinSetTable + 112);
    while (!__ldaxr(v3))
    {
    }

    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 112);
  }

  return result;
}

+ (NSCharacterSet)characterSetWithContentsOfFile:(NSString *)fName
{
  result = (NSCharacterSet *)[MEMORY[0x189603F48] dataWithContentsOfFile:fName options:1 error:0];
  if (result) {
    return (NSCharacterSet *)CFCharacterSetCreateWithBitmapRepresentation(0LL, (CFDataRef)result);
  }
  return result;
}

+ (NSCharacterSet)characterSetWithRange:(NSRange)aRange
{
  return (NSCharacterSet *)CFCharacterSetCreateWithCharactersInRange(0LL, (CFRange)aRange);
}

+ (NSCharacterSet)characterSetWithCharactersInString:(NSString *)aString
{
  return (NSCharacterSet *)CFCharacterSetCreateWithCharactersInString(0LL, (CFStringRef)aString);
}

+ (NSCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data
{
  return (NSCharacterSet *)CFCharacterSetCreateWithBitmapRepresentation(0LL, (CFDataRef)data);
}

- (NSCharacterSet)init
{
  v5.location = 0LL;
  v5.length = 0LL;
  v3 = (NSCharacterSet *)CFCharacterSetCreateWithCharactersInRange(0LL, v5);

  return v3;
}

- (unint64_t)hash
{
  return -[NSData hash](-[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation"), "hash");
}

- (NSCharacterSet)invertedSet
{
  return (NSCharacterSet *)(id)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:self options:1];
}

- (BOOL)isEmpty
{
  v2 = -[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
  if (!v2) {
    return 1;
  }
  v3 = v2;
  v4 = -[NSData bytes](v2, "bytes");
  uint64_t v5 = -[NSData length](v3, "length");
  if (v5 < 1) {
    return 1;
  }
  if (*v4) {
    return 0;
  }
  uint64_t v7 = 1LL;
  do
  {
    uint64_t v8 = v7;
    if (v5 == v7) {
      break;
    }
    ++v7;
  }

  while (!v4[v8]);
  return v8 >= v5;
}

- (unint64_t)count
{
  v2 = -[NSData bytes](-[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation"), "bytes");
  unint64_t v4 = 0LL;
  if (v2)
  {
    for (uint64_t i = 0LL; i != 0x2000; ++i)
    {
      if (v2[i])
      {
        v3.i32[0] = v2[i];
        int8x8_t v3 = vcnt_s8(v3);
        v3.i16[0] = vaddlv_u8((uint8x8_t)v3);
        uint64_t v6 = v3.u32[0];
      }

      else
      {
        uint64_t v6 = 0LL;
      }

      v4 += v6;
    }
  }

  return v4;
}

- (BOOL)isMutable
{
  return 0;
}

- (BOOL)characterIsMember:(unichar)aCharacter
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)longCharacterIsMember:(UTF32Char)theLongChar
{
  return -[NSCharacterSet characterIsMember:](self, "characterIsMember:", (unsigned __int16)theLongChar);
}

- (BOOL)isSupersetOfSet:(NSCharacterSet *)theOtherSet
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)hasMemberInPlane:(uint8_t)thePlane
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return -[NSData isEqual:]( -[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation"),  "isEqual:",  [a3 bitmapRepresentation]);
  }
  return 0;
}

- (NSData)bitmapRepresentation
{
  int8x8_t v3 = (void *)[objc_allocWithZone(MEMORY[0x189603FB8]) initWithLength:0x2000];
  uint64_t v4 = [v3 mutableBytes];
  for (unsigned __int16 i = 0; i != 0xFFFF; ++i)
  {
  }

  return (NSData *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = -[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
  if ([a3 allowsKeyedCoding])
  {
    if (object_getClass(a3) == (Class)&OBJC_CLASS___NSKeyedArchiver) {
      [a3 _encodePropertyList:v4 forKey:@"NSBitmap"];
    }
    else {
      [a3 encodeObject:v4 forKey:@"NSBitmapObject"];
    }
  }

- (NSCharacterSet)initWithCoder:(NSCoder *)aDecoder
{
  if (!-[NSCoder allowsKeyedCoding](aDecoder, "allowsKeyedCoding")) {
    goto LABEL_36;
  }
  NSInteger v5 = -[NSCoder decodeIntegerForKey:](aDecoder, "decodeIntegerForKey:", @"NSBuiltinID");
  BOOL v6 = -[NSCoder decodeBoolForKey:](aDecoder, "decodeBoolForKey:", @"NSIsInverted");
  if (!v5) {
    NSInteger v5 = -[NSCoder decodeIntegerForKey:](aDecoder, "decodeIntegerForKey:", @"NSBuiltinID2");
  }
  Class = (__objc2_class *)object_getClass(aDecoder);
  BOOL v8 = -[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NSString");
  BOOL v9 = -[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NSStringObject");
  if ((unint64_t)(v5 - 1) <= 0xE)
  {
    Predefined = CFCharacterSetGetPredefined((CFCharacterSetPredefinedSet)v5);
    if (v6 || -[NSCoder decodeBoolForKey:](aDecoder, "decodeBoolForKey:", @"NSIsInverted2"))
    {
      Predefined = CFCharacterSetCreateMutableCopy(0LL, Predefined);
      BOOL v6 = 1;
      if (!Predefined) {
        goto LABEL_20;
      }
    }

    else
    {
      CFRetain(Predefined);
      BOOL v6 = 0;
      if (!Predefined)
      {
LABEL_20:

        v15 = (void *)MEMORY[0x189603F70];
        uint64_t v16 = *MEMORY[0x189603A48];
        unsigned __int16 i = @"CFCharacterSetGetPredefined -- Predefined Character Set not found";
        goto LABEL_39;
      }
    }

    goto LABEL_33;
  }

  BOOL v11 = v9;
  if (-[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NSRange"))
  {
    uint64_t v12 = -[NSCoder decodeInt64ForKey:](aDecoder, "decodeInt64ForKey:", @"NSRange");
    CFIndex v13 = v12 >> 32;
    CFIndex v14 = v12;
    if ((_CFCharacterSetIsValidRange() & 1) != 0)
    {
      v24.location = v13;
      v24.length = v14;
      Predefined = CFCharacterSetCreateWithCharactersInRange(0LL, v24);
      if (!Predefined)
      {

        v15 = (void *)MEMORY[0x189603F70];
        uint64_t v16 = *MEMORY[0x189603A48];
        unsigned __int16 i = @"CFCharacterSetCreateWithCharactersInRange -- Character Set creation with characters in range failed";
        goto LABEL_39;
      }

      goto LABEL_33;
    }

    v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = *MEMORY[0x189603A48];
    for (unsigned __int16 i = @"CFCharacterSetCreateWithCharactersInRange -- Character Set creation with characters in range failed: Invalid range";
          ;
          unsigned __int16 i = @"CFCharacterSetCreateWithBitmapRepresentation -- Character Set creation with bitmap representation failed")
    {
LABEL_39:
      objc_exception_throw((id)[v15 exceptionWithName:v16 reason:i userInfo:0]);
LABEL_40:

      v15 = (void *)MEMORY[0x189603F70];
      uint64_t v16 = *MEMORY[0x189603A48];
    }
  }

  if (!v8 && !v11)
  {
    if (Class == &OBJC_CLASS___NSKeyedUnarchiver
      || -[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NSBitmap"))
    {
      v20 = (const __CFData *)-[NSCoder _decodePropertyListForKey:]( aDecoder,  "_decodePropertyListForKey:",  @"NSBitmap");
    }

    else
    {
      v20 = -[NSCoder decodeObjectOfClass:forKey:]( aDecoder,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSBitmapObject");
    }

    v22 = v20;
    if (v20 && _NSIsNSData())
    {
      Predefined = CFCharacterSetCreateWithBitmapRepresentation(0LL, v22);
      if (!Predefined) {
        goto LABEL_40;
      }
      goto LABEL_33;
    }

    goto LABEL_35;
  }

  int v18 = Class == &OBJC_CLASS___NSKeyedUnarchiver || v8;
  if (v18 == 1) {
    v19 = (const __CFString *)-[NSCoder _decodePropertyListForKey:]( aDecoder,  "_decodePropertyListForKey:",  @"NSString");
  }
  else {
    v19 = -[NSCoder decodeObjectOfClass:forKey:]( aDecoder,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSStringObject");
  }
  v21 = v19;
  if (!v19 || !_NSIsNSString())
  {
LABEL_35:
    -[NSCoder failWithError:]( aDecoder,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4865,  [MEMORY[0x189603F68] dictionaryWithObject:@"Decoder value not found" forKey:@"NSLocalizedDescription"]));
LABEL_36:
    Predefined = 0LL;
    goto LABEL_37;
  }

  Predefined = CFCharacterSetCreateWithCharactersInString(0LL, v21);
  if (!Predefined)
  {

    v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = *MEMORY[0x189603A48];
    unsigned __int16 i = @"CFCharacterSetCreateWithCharactersInString -- Character Set creation with characters in string failed";
    goto LABEL_39;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_retainedBitmapRepresentation
{
  return -[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ([a3 isByref] && -[NSCharacterSet isMutable](self, "isMutable"))
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSCharacterSet;
    return -[NSCharacterSet replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return self;
}

@end