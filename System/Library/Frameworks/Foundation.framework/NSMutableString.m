@interface NSMutableString
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (NSMutableString)allocWithZone:(_NSZone *)a3;
+ (NSMutableString)stringWithCapacity:(NSUInteger)capacity;
- (BOOL)applyTransform:(NSStringTransform)transform reverse:(BOOL)reverse range:(NSRange)range updatedRange:(NSRangePointer)resultingRange;
- (Class)classForCoder;
- (NSMutableString)initWithCapacity:(NSUInteger)capacity;
- (NSUInteger)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;
- (unint64_t)_replaceOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (void)_cfAppendCString:(const char *)a3 length:(int64_t)a4;
- (void)_cfCapitalize:(const void *)a3;
- (void)_cfLowercase:(const void *)a3;
- (void)_cfNormalize:(int64_t)a3;
- (void)_cfPad:(__CFString *)a3 length:(unsigned int)a4 padIndex:(unsigned int)a5;
- (void)_cfTrim:(__CFString *)a3;
- (void)_cfTrimWS;
- (void)_cfUppercase:(const void *)a3;
- (void)_trimWithCharacterSet:(id)a3;
- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)appendFormat:(NSString *)format;
- (void)appendString:(NSString *)aString;
- (void)deleteCharactersInRange:(NSRange)range;
- (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc;
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString;
- (void)replaceCharactersInRange:(_NSRange)a3 withCString:(const char *)a4 length:(unint64_t)a5;
- (void)replaceCharactersInRange:(_NSRange)a3 withCharacters:(const unsigned __int16 *)a4 length:(unint64_t)a5;
- (void)setString:(NSString *)aString;
@end

@implementation NSMutableString

+ (NSMutableString)allocWithZone:(_NSZone *)a3
{
  if ((id)__NSMutableStringClass == a1) {
    return (NSMutableString *)&__mutablePlaceholder;
  }
  else {
    return (NSMutableString *)NSAllocateObject((Class)a1, 0LL, a3);
  }
}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
}

- (void)_cfAppendCString:(const char *)a3 length:(int64_t)a4
{
}

- (void)_cfLowercase:(const void *)a3
{
}

- (void)_cfUppercase:(const void *)a3
{
}

- (void)_cfCapitalize:(const void *)a3
{
}

- (void)_cfPad:(__CFString *)a3 length:(unsigned int)a4 padIndex:(unsigned int)a5
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  unint64_t v9 = -[NSString length](self, "length");
  uint64_t v10 = a4;
  if (v9 > a4)
  {
    -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", a4, v9 - a4);
    return;
  }

  if (v9 < a4)
  {
    uint64_t v11 = a4 - v9;
    if ((uint64_t)(v10 - v9) >= 512)
    {
      v13 = malloc(2 * v11);
      CFIndex Length = CFStringGetLength(a3);
    }

    else
    {
      CFIndex Length = CFStringGetLength(a3);
      v13 = v19;
      if (v11 < 1)
      {
LABEL_15:
        -[NSMutableString replaceCharactersInRange:withCharacters:length:]( self,  "replaceCharactersInRange:withCharacters:length:",  -[NSString length](self, "length"),  0LL,  v13,  v11);
        if (v13 != v19) {
          free(v13);
        }
        return;
      }
    }

    CFIndex v14 = a5;
    if (v11 >= Length - a5) {
      CFIndex v15 = Length - a5;
    }
    else {
      CFIndex v15 = v11;
    }
    uint64_t v16 = v11;
    do
    {
      NSUInteger v17 = -[NSString length](self, "length");
      v21.location = v14;
      v21.length = v15;
      CFStringGetCharacters(a3, v21, (UniChar *)&v13[2 * (v10 - v16) + -2 * v17]);
      v16 -= v15;
      BOOL v18 = v16 < v15;
      CFIndex v15 = v16;
      if (!v18) {
        CFIndex v15 = CFStringGetLength(a3);
      }
      CFIndex v14 = 0LL;
    }

    while (v16 > 0);
    goto LABEL_15;
  }

- (void)_cfTrim:(__CFString *)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  CFIndex v5 = -[NSString length](self, "length");
  v10.location = 0LL;
  v10.length = v5;
  if (CFStringFindWithOptions((CFStringRef)self, a3, v10, 8uLL, &result))
  {
    do
    {
      CFIndex v6 = result.length + result.location;
      CFIndex v7 = v5 - (result.length + result.location);
      v11.location = result.length + result.location;
      v11.length = v7;
    }

    while (CFStringFindWithOptions((CFStringRef)self, a3, v11, 8uLL, &result));
  }

  else
  {
    CFIndex v6 = 0LL;
    CFIndex v7 = v5;
  }

  if (v6 >= v5)
  {
    CFIndex v6 = v5;
  }

  else
  {
    if (CFStringGetLength(a3) < v7)
    {
      while (1)
      {
        v12.location = v6;
        v12.length = v7;
        if (!CFStringFindWithOptions((CFStringRef)self, a3, v12, 0xCuLL, &result)) {
          break;
        }
        CFIndex v7 = result.location - v6;
      }
    }

    -[NSMutableString deleteCharactersInRange:]( self,  "deleteCharactersInRange:",  v7 + v6,  -[NSString length](self, "length") - (v7 + v6));
  }

  -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", 0LL, v6);
}

- (void)_trimWithCharacterSet:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  NSUInteger v5 = -[NSString length](self, "length");
  NSUInteger v6 = v5;
  unint64_t v33 = v5;
  unint64_t v34 = 0LL;
  v32 = self;
  v28 = self;
  if (v5)
  {
    if (v5 >= 0x20) {
      uint64_t v7 = 32LL;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v30 = v7;
    objc_msgSend(self, sel_getUid("getCharacters:range:"), v35, 0, v7);
    unsigned __int16 v8 = v35[0];
  }

  else
  {
    unint64_t v30 = 0LL;
    unsigned __int16 v8 = -1;
  }

  unint64_t v31 = 1LL;
  __int16 v36 = v8;
  unint64_t v9 = 1LL;
  while (1)
  {
    unint64_t v10 = v30;
    if (v9 > v30) {
      goto LABEL_23;
    }
    int v11 = [a3 characterIsMember:v8];
    unint64_t v12 = v31;
    if (!v11) {
      break;
    }
    if (v31 >= v30)
    {
      unint64_t v13 = v34 + v30;
      if (v33 > v34 + v30)
      {
        if (v33 - (v34 + v30) >= 0x20) {
          uint64_t v14 = 32LL;
        }
        else {
          uint64_t v14 = v33 - (v34 + v30);
        }
        v34 += v30;
        unint64_t v30 = v14;
        objc_msgSend(v32, sel_getUid("getCharacters:range:"), v35, v13, v14);
        unsigned __int16 v8 = v35[0];
        __int16 v36 = v35[0];
        unint64_t v31 = 1LL;
        unint64_t v9 = 1LL;
        goto LABEL_19;
      }

      unint64_t v9 = v30 + 1;
      unint64_t v31 = v30 + 1;
      unsigned __int16 v8 = -1;
    }

    else
    {
      unint64_t v9 = ++v31;
      unsigned __int16 v8 = v35[v12];
    }

    __int16 v36 = v8;
LABEL_19:
    if (!v9) {
      goto LABEL_24;
    }
  }

  if (!v31) {
    goto LABEL_24;
  }
  unint64_t v10 = v30;
  unint64_t v9 = v31;
LABEL_23:
  if (v9 > v10)
  {
LABEL_24:
    -[NSMutableString setString:](self, "setString:", &stru_189CA6A28, self);
    return;
  }

  unint64_t v15 = v34;
  unint64_t v16 = v6 - 1;
  BOOL v17 = v34 <= v6 - 1 && v34 + v10 > v16;
  unint64_t v18 = v34;
  if (!v17)
  {
    if (v16 > 0xF)
    {
      unint64_t v20 = v33;
      if (v33 - 16 >= v16)
      {
        unint64_t v19 = v6 - 17;
      }

      else if (v33 >= 0x20)
      {
        unint64_t v19 = v33 - 32;
      }

      else
      {
        unint64_t v19 = 0LL;
      }

      unint64_t v34 = v19;
    }

    else
    {
      unint64_t v19 = 0LL;
      unint64_t v34 = 0LL;
      unint64_t v20 = v33;
    }

    unint64_t v21 = v20 - v19;
    if (v21 >= 0x20) {
      uint64_t v22 = 32LL;
    }
    else {
      uint64_t v22 = v21;
    }
    unint64_t v30 = v22;
    objc_msgSend(v32, sel_getUid("getCharacters:range:"), v35, v19, v22);
    __int16 v36 = v35[0];
    unint64_t v18 = v34;
  }

  unint64_t v23 = v9 + v15;
  unint64_t v24 = v16 - v18;
  unint64_t v31 = v24 + 1;
  __int16 v36 = v35[v24];
  if ([a3 characterIsMember:v28])
  {
    do
    {
      unint64_t v25 = v31;
      if (v31 < 2)
      {
        if (v34)
        {
          if (v34 >= 0x20) {
            uint64_t v27 = 32LL;
          }
          else {
            uint64_t v27 = v34;
          }
          unint64_t v30 = v27;
          unint64_t v31 = v27;
          v34 -= v27;
          objc_msgSend(v32, sel_getUid("getCharacters:range:"), v35, v34, v27);
          __int16 v26 = v35[v31 - 1];
        }

        else
        {
          unint64_t v31 = 0LL;
          __int16 v26 = -1;
        }
      }

      else
      {
        --v31;
        __int16 v26 = v35[v25 - 2];
      }

      __int16 v36 = v26;
    }

    while ((objc_msgSend(a3, "characterIsMember:") & 1) != 0);
  }

  if (v6 != v31 + v34) {
    objc_msgSend(v29, "replaceCharactersInRange:withString:", v31 + v34, v6 - (v31 + v34), &stru_189CA6A28);
  }
  if (v23 != 1) {
    objc_msgSend(v29, "replaceCharactersInRange:withString:", 0, v23 - 1, &stru_189CA6A28);
  }
}

- (void)_cfTrimWS
{
}

- (void)_cfNormalize:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      NSUInteger v4 = -[NSString length](self, "length");
      NSUInteger v5 = -[NSString decomposedStringWithCanonicalMapping](self, "decomposedStringWithCanonicalMapping");
      goto LABEL_6;
    case 1LL:
      NSUInteger v4 = -[NSString length](self, "length");
      NSUInteger v5 = -[NSString decomposedStringWithCompatibilityMapping](self, "decomposedStringWithCompatibilityMapping");
      goto LABEL_6;
    case 2LL:
      NSUInteger v4 = -[NSString length](self, "length");
      NSUInteger v5 = -[NSString precomposedStringWithCanonicalMapping](self, "precomposedStringWithCanonicalMapping");
      goto LABEL_6;
    case 3LL:
      NSUInteger v4 = -[NSString length](self, "length");
      NSUInteger v5 = -[NSString precomposedStringWithCompatibilityMapping](self, "precomposedStringWithCompatibilityMapping");
LABEL_6:
      -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0LL, v4, v5);
      break;
    default:
      NSUInteger v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: invalid normalization form %ld", objc_opt_class(), a3), 0 reason userInfo];
      objc_exception_throw(v6);
      -[NSCalendar(NSCalendar) encodeWithCoder:]();
      break;
  }

+ (NSMutableString)stringWithCapacity:(NSUInteger)capacity
{
  return (NSMutableString *) -[NSPlaceholderMutableString initWithCapacity:]( &__mutablePlaceholder,  "initWithCapacity:",  capacity);
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
{
}

- (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc
{
}

- (void)appendString:(NSString *)aString
{
}

- (void)deleteCharactersInRange:(NSRange)range
{
}

- (void)replaceCharactersInRange:(_NSRange)a3 withCString:(const char *)a4 length:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = (id)[objc_allocWithZone((Class)NSString) initWithCString:a4 length:a5];
  -[NSMutableString replaceCharactersInRange:withString:]( self,  "replaceCharactersInRange:withString:",  location,  length,  v8);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withCharacters:(const unsigned __int16 *)a4 length:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = (id)[objc_allocWithZone((Class)NSString) initWithCharacters:a4 length:a5];
  -[NSMutableString replaceCharactersInRange:withString:]( self,  "replaceCharactersInRange:withString:",  location,  length,  v8);
}

- (void)appendFormat:(NSString *)format
{
  NSUInteger v4 = (void *)[objc_allocWithZone((Class)NSString) initWithFormat:format locale:0 arguments:va];
  -[NSMutableString replaceCharactersInRange:withString:]( self,  "replaceCharactersInRange:withString:",  -[NSString length](self, "length"),  0LL,  v4);
}

- (void)setString:(NSString *)aString
{
}

- (NSUInteger)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
  unint64_t length = searchRange.length;
  unint64_t location = searchRange.location;
  NSUInteger v13 = -[NSString length](self, "length");
  if (!target || !replacement)
  {
    unint64_t v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil argument",  _NSMethodExceptionProem((objc_class *)self, a2));
    unint64_t v24 = (void *)MEMORY[0x189603F70];
    unint64_t v25 = (void *)MEMORY[0x189603A60];
LABEL_19:
    objc_exception_throw((id)[v24 exceptionWithName:*v25 reason:v23 userInfo:0]);
    return -[NSMutableString applyTransform:reverse:range:updatedRange:](v26, v27, v28, v29, v32, v30);
  }

  if (v13 < length || location > v13 - length)
  {
    unint64_t v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
            _NSMethodExceptionProem((objc_class *)self, a2),
            location,
            length,
            v13);
    unint64_t v24 = (void *)MEMORY[0x189603F70];
    unint64_t v25 = (void *)MEMORY[0x189603B40];
    goto LABEL_19;
  }

  if ((options & 0x400) != 0) {
    return -[NSMutableString _replaceOccurrencesOfRegularExpressionPattern:withTemplate:options:range:]( self,  "_replaceOccurrencesOfRegularExpressionPattern:withTemplate:options:range:",  target,  replacement,  options,  location,  length);
  }
  v31.unint64_t location = location;
  v31.unint64_t length = length;
  Results = CFStringCreateArrayWithFindResults( 0LL,  (CFStringRef)self,  (CFStringRef)target,  v31,  ~(8 * (_BYTE)options) & 0x10 | options);
  if (!Results) {
    return 0LL;
  }
  unint64_t v15 = Results;
  CFIndex Count = CFArrayGetCount(Results);
  NSUInteger v17 = Count;
  if (Count)
  {
    CFIndex v18 = 0LL;
    CFIndex v19 = Count - 1;
    do
    {
      if ((options & 4) != 0) {
        CFIndex v20 = v18;
      }
      else {
        CFIndex v20 = v19;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(v15, v20);
      -[NSMutableString replaceCharactersInRange:withString:]( self,  "replaceCharactersInRange:withString:",  *ValueAtIndex,  ValueAtIndex[1],  replacement);
      ++v18;
      --v19;
    }

    while (v19 != -1);
  }

  CFRelease(v15);
  return v17;
}

- (BOOL)applyTransform:(NSStringTransform)transform reverse:(BOOL)reverse range:(NSRange)range updatedRange:(NSRangePointer)resultingRange
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  NSRange v9 = range;
  int v7 = CFStringTransform((CFMutableStringRef)self, (CFRange *)&v9, (CFStringRef)transform, reverse);
  if (resultingRange && v7) {
    *resultingRange = v9;
  }
  return v7 != 0;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)__NSMutableStringClass;
}

- (NSMutableString)initWithCapacity:(NSUInteger)capacity
{
}

- (unint64_t)_replaceOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unint64_t v12 = a5 & 1;
  if (_MergedGlobals_144 != -1) {
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  }
  NSUInteger v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lx:%@", v12, a3);
  id v14 = (id)[(id)qword_18C497068 objectForKey:v13];
  if (!v14)
  {
    unint64_t result = -[NSRegularExpression initWithPattern:options:error:]( objc_alloc(&OBJC_CLASS___NSRegularExpression),  "initWithPattern:options:error:",  a3,  v12,  0LL);
    if (!result) {
      return result;
    }
    id v14 = (id)result;
    [(id)qword_18C497068 setObject:result forKey:v13];
  }

  unint64_t v16 = objc_msgSend( v14,  "replaceMatchesInString:options:range:withTemplate:",  self,  (a5 >> 1) & 4,  location,  length,  a4);

  return v16;
}

@end