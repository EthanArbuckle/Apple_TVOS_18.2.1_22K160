@interface NSAttributedString
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSAttributedString)allocWithZone:(_NSZone *)a3;
+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format;
+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format context:(NSDictionary *)context;
+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options;
+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options context:(NSDictionary *)context;
+ (id)_attributedStringWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7;
+ (id)_attributedStringWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6;
+ (id)_localizedAttributedStringWithFormat:(id)a3;
+ (id)_localizedAttributedStringWithFormat:(id)a3 options:(unint64_t)a4;
+ (void)_setAttributedDictionaryClass:(Class)a3;
- (BOOL)_mayRequireIntentResolution;
- (BOOL)_willRequireIntentResolutionWhenContainingAttribute:(id)a3 value:(id)a4;
- (BOOL)_willRequireIntentResolutionWhenContainingAttributes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributedString:(NSAttributedString *)other;
- (Class)classForCoder;
- (NSAttributedString)attributedStringByInflectingString;
- (NSAttributedString)attributedSubstringFromRange:(NSRange)range;
- (NSAttributedString)initWithCoder:(id)a3;
- (NSAttributedString)initWithContentsOfMarkdownFileAtURL:(NSURL *)markdownFile options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error;
- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale;
- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context;
- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context arguments:(va_list)arguments;
- (NSAttributedString)initWithMarkdown:(NSData *)markdown options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error;
- (NSAttributedString)initWithMarkdownString:(NSString *)markdownString options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error;
- (NSDictionary)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
- (NSDictionary)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (NSString)string;
- (NSUInteger)length;
- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7;
- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 context:(id)a7 arguments:(char *)a8;
- (id)_createAttributedSubstringWithRange:(_NSRange)a3;
- (id)_firstValueOfAttributeWithKey:(id)a3 inRange:(_NSRange)a4;
- (id)_identicalAttributesInRange:(_NSRange)a3;
- (id)_inflectedAttributedString;
- (id)_initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6;
- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5;
- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6;
- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (id)attributedStringByWeaklyAddingAttributes:(id)a3;
- (id)attributedSubstringFromRange:(_NSRange)a3 replacingCharactersInRanges:(const _NSRange *)a4 numberOfRanges:(int64_t)a5 withString:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_markIntentsResolved;
- (void)_markRequiringIntentResolution;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAttribute:(NSAttributedStringKey)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block;
@end

@implementation NSAttributedString

+ (void)_setAttributedDictionaryClass:(Class)a3
{
  attributeDictionaryClass = (uint64_t)a3;
}

+ (NSAttributedString)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1) {
    v4 = (objc_class *)objc_opt_self();
  }
  return (NSAttributedString *)NSAllocateObject(v4, 0LL, a3);
}

- (NSString)string
{
  v4 = NSClassFromString((NSString *)@"NSAttributedString");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
  v6 = NSClassFromString((NSString *)@"NSAttributedString");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
  return -[NSDictionary objectForKey:]( -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  location,  range),  "objectForKey:",  attrName);
}

- (NSAttributedString)attributedSubstringFromRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  NSUInteger v7 = range.location + range.length;
  v8 = -[NSAttributedString string](self, "string");
  unint64_t v9 = -[NSString length](v8, "length");
  if (v7 > v9)
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = _NSNameOfClass(v16);
    v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%s %s: Out of bounds", v17, sel_getName(a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }

  if (length == v9) {
    return (NSAttributedString *)-[NSAttributedString copyWithZone:](self, "copyWithZone:", 0LL);
  }
  v11 = (NSAttributedString *)(id)objc_msgSend( objc_allocWithZone((Class)NSConcreteMutableAttributedString),  "initWithString:",  -[NSString substringWithRange:]( v8,  "substringWithRange:",  location,  length));
  if (location < v7)
  {
    NSUInteger v12 = location;
    do
    {
      v13 = -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  v12,  &v19);
      if (v20 + v19 <= v7) {
        NSUInteger v14 = v19 - v12 + v20;
      }
      else {
        NSUInteger v14 = v7 - v12;
      }
      if (v19 != v12 || v20 + v19 > v7) {
        NSUInteger v20 = v14;
      }
      -[NSAttributedString addAttributes:range:](v11, "addAttributes:range:", v13, v12 - location, v14);
      v12 += v20;
    }

    while (v12 < v7);
  }

  return v11;
}

- (id)attributedSubstringFromRange:(_NSRange)a3 replacingCharactersInRanges:(const _NSRange *)a4 numberOfRanges:(int64_t)a5 withString:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v12 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  _CFAutoreleasePoolPush();
  NSUInteger v13 = location;
  if (a5 >= 1)
  {
    do
    {
      -[NSMutableAttributedString appendAttributedString:]( v12,  "appendAttributedString:",  -[NSAttributedString attributedSubstringFromRange:](self, "attributedSubstringFromRange:"));
      -[NSMutableAttributedString replaceCharactersInRange:withString:]( v12,  "replaceCharactersInRange:withString:",  -[NSAttributedString length](v12, "length") - 1,  1LL,  a6);
      NSUInteger v14 = a4->location;
      NSUInteger v15 = a4->length;
      ++a4;
      NSUInteger v13 = v15 + v14;
      --a5;
    }

    while (a5);
  }

  if (location + length > v13) {
    -[NSMutableAttributedString appendAttributedString:]( v12,  "appendAttributedString:",  -[NSAttributedString attributedSubstringFromRange:](self, "attributedSubstringFromRange:"));
  }
  _CFAutoreleasePoolPop();
  return v12;
}

- (id)attributedStringByWeaklyAddingAttributes:(id)a3
{
  id v5 = -[NSAttributedString mutableCopyWithZone:](self, "mutableCopyWithZone:", 0LL);
  objc_msgSend(v5, "addAttributesWeakly:range:", a3, 0, -[NSAttributedString length](self, "length"));
  id v6 = (id)[v5 copyWithZone:0];

  return v6;
}

- (NSUInteger)length
{
  return -[NSString length](-[NSAttributedString string](self, "string"), "length");
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSAttributedString string](self, "string"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSAttributedString isEqualToAttributedString:](self, "isEqualToAttributedString:", a3);
}

- (BOOL)isEqualToAttributedString:(NSAttributedString *)other
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (other == self) {
    goto LABEL_15;
  }
  BOOL v5 = -[NSString isEqual:]( -[NSAttributedString string](self, "string"),  "isEqual:",  -[NSAttributedString string](other, "string"));
  if (!v5) {
    return v5;
  }
  NSUInteger v6 = -[NSAttributedString length](self, "length");
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  if (!v6)
  {
LABEL_15:
    LOBYTE(v5) = 1;
    return v5;
  }

  NSUInteger v7 = v6;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  NSUInteger v12 = 0LL;
  NSUInteger v13 = 0LL;
  for (NSUInteger i = 0LL; i < v7; NSUInteger i = v16 + v17 >= (unint64_t)(v18 + v19) ? v18 + v19 : v16 + v17)
  {
    if (i >= v11 + v10)
    {
      NSUInteger v13 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", i, &v18);
      uint64_t v8 = v16;
      uint64_t v9 = v17;
    }

    if (i >= v9 + v8) {
      NSUInteger v12 = -[NSAttributedString attributesAtIndex:effectiveRange:](other, "attributesAtIndex:effectiveRange:", i, &v16);
    }
    BOOL v5 = -[NSDictionary isEqualToDictionary:](v13, "isEqualToDictionary:", v12);
    if (!v5) {
      break;
    }
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    uint64_t v10 = v18;
    uint64_t v11 = v19;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSConcreteMutableAttributedString initWithAttributedString:]( +[NSMutableAttributedString allocWithZone:]( &OBJC_CLASS___NSConcreteMutableAttributedString,  "allocWithZone:",  a3),  "initWithAttributedString:",  self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSConcreteAttributedString initWithAttributedString:]( +[NSAttributedString allocWithZone:](&OBJC_CLASS___NSConcreteAttributedString, "allocWithZone:", a3),  "initWithAttributedString:",  self);
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSAttributedString length](self, "length");
  v4 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * v3);
  NSUInteger v10 = 0LL;
  uint64_t v11 = 0LL;
  if (v3)
  {
    for (i = 0LL; i < v3; NSUInteger v10 = i)
    {
      NSUInteger v6 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", i, &v10);
      uint64_t v7 = -[NSString length](v4, "length");
      uint64_t v8 = -[NSAttributedString string](self, "string");
      -[NSMutableString replaceCharactersInRange:withString:]( v4,  "replaceCharactersInRange:withString:",  v7,  0LL,  -[NSString substringWithRange:](v8, "substringWithRange:", v10, v11));
      -[NSMutableString replaceCharactersInRange:withString:]( v4,  "replaceCharactersInRange:withString:",  -[NSString length](v4, "length"),  0LL,  -[NSDictionary description](v6, "description"));
      NSUInteger i = v10 + v11;
    }
  }

  return v4;
}

- (NSDictionary)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length = rangeLimit.length;
  unint64_t v6 = rangeLimit.location;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v9 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", location);
  if (range)
  {
    NSRange v17 = *range;
    unint64_t v10 = v6 + length;
    do
      unint64_t v11 = v17.length + v17.location;
    while (v17.length + v17.location < v10
         && -[NSDictionary isEqualToDictionary:]( -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  v17.length + v17.location,  &v17),  "isEqualToDictionary:",  v9));
    NSRange v17 = *range;
    do
      NSUInteger v12 = v17.location;
    while (v17.location > v6
         && -[NSDictionary isEqualToDictionary:]( -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  v17.location - 1,  &v17),  "isEqualToDictionary:",  v9));
    if (v10 >= v11) {
      unint64_t v13 = v11;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v6 >= v11 || v12 > v6)
    {
      NSUInteger v14 = v13 - v12;
      BOOL v15 = v6 > v12 || v12 >= v10;
      if (v15) {
        unint64_t v6 = 0LL;
      }
      else {
        unint64_t v6 = v12;
      }
      if (v15) {
        NSUInteger v14 = 0LL;
      }
    }

    else
    {
      NSUInteger v14 = v13 - v6;
    }

    range->NSUInteger location = v6;
    range->NSUInteger length = v14;
  }

  return v9;
}

- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length = rangeLimit.length;
  unint64_t v7 = rangeLimit.location;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v11 = -[NSAttributedString attribute:atIndex:effectiveRange:]( self,  "attribute:atIndex:effectiveRange:",  attrName,  location);
  if (range)
  {
    NSRange v22 = *range;
    unint64_t v12 = v7 + length;
    do
    {
      unint64_t v13 = v22.length + v22.location;
      if (v22.length + v22.location >= v12) {
        break;
      }
      id v14 = -[NSAttributedString attribute:atIndex:effectiveRange:]( self,  "attribute:atIndex:effectiveRange:",  attrName,  v22.length + v22.location,  &v22);
    }

    while (v14 == v11 || [v14 isEqual:v11]);
    NSRange v22 = *range;
    do
    {
      NSUInteger v15 = v22.location;
      if (v22.location <= v7) {
        break;
      }
      id v16 = -[NSAttributedString attribute:atIndex:effectiveRange:]( self,  "attribute:atIndex:effectiveRange:",  attrName,  v22.location - 1,  &v22);
    }

    while (v16 == v11 || [v16 isEqual:v11]);
    if (v12 >= v13) {
      unint64_t v17 = v13;
    }
    else {
      unint64_t v17 = v12;
    }
    if (v7 >= v13 || v15 > v7)
    {
      NSUInteger v18 = v17 - v15;
      if (v15 < v12) {
        unint64_t v19 = v15;
      }
      else {
        unint64_t v19 = 0LL;
      }
      if (v15 >= v12) {
        NSUInteger v18 = 0LL;
      }
      BOOL v20 = v7 > v15;
      if (v7 <= v15) {
        unint64_t v7 = v19;
      }
      else {
        unint64_t v7 = 0LL;
      }
      if (v20) {
        NSUInteger v18 = 0LL;
      }
    }

    else
    {
      NSUInteger v18 = v17 - v7;
    }

    range->NSUInteger location = v7;
    range->NSUInteger length = v18;
  }

  return v11;
}

- (void)enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (enumerationRange.length)
  {
    int v6 = opts;
    NSUInteger length = enumerationRange.length;
    NSUInteger location = enumerationRange.location;
    NSUInteger v10 = ((enumerationRange.length - 1) & ((uint64_t)(opts << 62) >> 63)) + enumerationRange.location;
    char v25 = 0;
    NSUInteger v11 = -[NSAttributedString length](self, "length");
LABEL_3:
    NSUInteger v12 = v11;
    if ((v6 & 0x100000) == 0)
    {
LABEL_4:
      unint64_t v13 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:]( self,  "attributesAtIndex:longestEffectiveRange:inRange:",  v10,  &v23,  location,  length);
      goto LABEL_23;
    }

    while (1)
    {
      unint64_t v13 = -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  v10,  &v23);
      NSUInteger v14 = v23;
      if (v24 + v23 >= length + location) {
        NSUInteger v15 = length + location;
      }
      else {
        NSUInteger v15 = v24 + v23;
      }
      NSUInteger v16 = v15 - location;
      BOOL v17 = v23 > location || location >= v24 + v23;
      if (v17) {
        NSUInteger v18 = 0LL;
      }
      else {
        NSUInteger v18 = location;
      }
      if (v17) {
        NSUInteger v16 = 0LL;
      }
      NSUInteger v19 = v15 - v23;
      if (location > v23 || v23 >= length + location)
      {
        NSUInteger v14 = v18;
        NSUInteger v21 = v16;
      }

      else
      {
        NSUInteger v21 = v19;
      }

      NSUInteger v23 = v14;
      uint64_t v24 = v21;
LABEL_23:
      NSRange v22 = v13;
      (*((void (**)(void *, NSDictionary *, NSUInteger, uint64_t, char *))block + 2))( block,  v22,  v23,  v24,  &v25);

      if (v25) {
        break;
      }
      if ((v6 & 2) == 0)
      {
        NSUInteger v11 = -[NSAttributedString length](self, "length");
        if (v11 == v12) {
          NSUInteger v10 = v24 + v23;
        }
        else {
          NSUInteger v10 = v24 + v23 - v12 + v11;
        }
        if (v11 != v12) {
          NSUInteger length = length - v12 + v11;
        }
        if (v10 < length + location) {
          goto LABEL_3;
        }
        return;
      }

      if (v23 <= location) {
        return;
      }
      NSUInteger v10 = v23 - 1;
      if ((v6 & 0x100000) == 0) {
        goto LABEL_4;
      }
    }
  }

- (void)enumerateAttribute:(NSAttributedStringKey)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (enumerationRange.length)
  {
    int v7 = opts;
    NSUInteger length = enumerationRange.length;
    NSUInteger location = enumerationRange.location;
    NSUInteger v12 = ((enumerationRange.length - 1) & ((uint64_t)(opts << 62) >> 63)) + enumerationRange.location;
    char v27 = 0;
    NSUInteger v13 = -[NSAttributedString length](self, "length");
LABEL_3:
    NSUInteger v14 = v13;
    if ((v7 & 0x100000) == 0)
    {
LABEL_4:
      id v15 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:]( self,  "attribute:atIndex:longestEffectiveRange:inRange:",  attrName,  v12,  &v25,  location,  length);
      goto LABEL_23;
    }

    while (1)
    {
      id v15 = -[NSAttributedString attribute:atIndex:effectiveRange:]( self,  "attribute:atIndex:effectiveRange:",  attrName,  v12,  &v25);
      NSUInteger v16 = v25;
      if (v26 + v25 >= length + location) {
        NSUInteger v17 = length + location;
      }
      else {
        NSUInteger v17 = v26 + v25;
      }
      NSUInteger v18 = v17 - location;
      BOOL v19 = v25 > location || location >= v26 + v25;
      if (v19) {
        NSUInteger v20 = 0LL;
      }
      else {
        NSUInteger v20 = location;
      }
      if (v19) {
        NSUInteger v18 = 0LL;
      }
      NSUInteger v21 = v17 - v25;
      if (location > v25 || v25 >= length + location)
      {
        NSUInteger v16 = v20;
        NSUInteger v23 = v18;
      }

      else
      {
        NSUInteger v23 = v21;
      }

      NSUInteger v25 = v16;
      uint64_t v26 = v23;
LABEL_23:
      id v24 = v15;
      (*((void (**)(void *, id, NSUInteger, uint64_t, char *))block + 2))(block, v24, v25, v26, &v27);

      if (v27) {
        break;
      }
      if ((v7 & 2) == 0)
      {
        NSUInteger v13 = -[NSAttributedString length](self, "length");
        if (v13 == v14) {
          NSUInteger v12 = v26 + v25;
        }
        else {
          NSUInteger v12 = v26 + v25 - v14 + v13;
        }
        if (v13 != v14) {
          NSUInteger length = length - v14 + v13;
        }
        if (v12 < length + location) {
          goto LABEL_3;
        }
        return;
      }

      if (v25 <= location) {
        return;
      }
      NSUInteger v12 = v25 - 1;
      if ((v7 & 0x100000) == 0) {
        goto LABEL_4;
      }
    }
  }

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  NSUInteger v5 = -[NSAttributedString length](self, "length");
  __int128 v6 = *(_OWORD *)(MEMORY[0x189605240] + 16LL);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x189605240];
  *(_OWORD *)&keyCallBacks.release = v6;
  keyCallBacks.equal = 0LL;
  keyCallBacks.hash = 0LL;
  char v7 = [a3 allowsKeyedCoding];
  v32 = self;
  uint64_t v8 = -[NSAttributedString string](self, "string");
  if ((v7 & 1) == 0)
  {
    [a3 encodeObject:v8];
    if (!v5) {
      return;
    }
    NSUInteger v13 = CFDictionaryCreateMutable(0LL, 0LL, &keyCallBacks, 0LL);
    NSUInteger v14 = 0LL;
    int v15 = 1;
    do
    {
      NSUInteger v16 = (void *)MEMORY[0x186E1FF60]();
      NSUInteger v17 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:]( v32,  "attributesAtIndex:longestEffectiveRange:inRange:",  v14,  v37,  v14,  v5 - v14);
      unsigned int v34 = CFDictionaryGetValue(v13, v17);
      LODWORD(value) = v38;
      if (v34)
      {
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iI", &v34, &value);
      }

      else
      {
        unsigned int v34 = v15;
        CFDictionaryAddValue(v13, v17, (const void *)v15);
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iI", &v34, &value);
        [a3 encodeObject:v17];
        ++v15;
      }

      v14 += v38;
      objc_autoreleasePoolPop(v16);
    }

    while (v14 < v5);
    if (!v13) {
      return;
    }
LABEL_15:
    CFRelease(v13);
    return;
  }

  [a3 encodeObject:v8 forKey:@"NSString"];
  if (v5)
  {
    uint64_t v9 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:]( self,  "attributesAtIndex:longestEffectiveRange:inRange:",  0LL,  &v34,  0LL,  v5);
    NSUInteger v10 = (void *)MEMORY[0x189604A60];
    NSUInteger v11 = v9 ? v9 : (NSDictionary *)MEMORY[0x189604A60];
    NSUInteger v12 = v11;
    if (v35 == v5)
    {
      [a3 encodeObject:v12 forKey:@"NSAttributes"];
      NSUInteger v13 = 0LL;
    }

    else
    {
      NSUInteger v18 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:20];
      BOOL v19 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:100];
      NSUInteger v13 = CFDictionaryCreateMutable(0LL, 0LL, &keyCallBacks, 0LL);
      uint64_t v20 = 0LL;
      while (1)
      {
        NSUInteger v21 = (void *)MEMORY[0x186E1FF60]();
        value = 0LL;
        if (!CFDictionaryGetValueIfPresent(v13, v12, (const void **)&value))
        {
          value = (void *)[v18 count];
          CFDictionaryAddValue(v13, v12, value);
          [v18 addObject:v12];
        }

        LOBYTE(v22) = v35;
        NSUInteger v23 = v37;
        if (v35 >= 0x80)
        {
          unint64_t v24 = v35;
          do
          {
            *v23++ = v24 | 0x80;
            unint64_t v22 = v24 >> 7;
            unint64_t v25 = v24 >> 14;
            v24 >>= 7;
          }

          while (v25);
        }

        *NSUInteger v23 = v22;
        uint64_t v26 = v23 + 1;
        unint64_t v27 = (unint64_t)value;
        if ((unint64_t)value < 0x80)
        {
          LOBYTE(v28) = (_BYTE)value;
        }

        else
        {
          do
          {
            *v26++ = v27 | 0x80;
            unint64_t v28 = v27 >> 7;
            unint64_t v29 = v27 >> 14;
            v27 >>= 7;
          }

          while (v29);
        }

        *uint64_t v26 = v28;
        [v19 appendBytes:v37 length:v26 - v37 + 1];
        v20 += v35;
        if (v5 == v20) {
          break;
        }

        uint64_t v30 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:]( v32,  "attributesAtIndex:longestEffectiveRange:inRange:",  v20,  &v34,  v20,  v5 - v20);
        if (v30) {
          v31 = (void *)v30;
        }
        else {
          v31 = v10;
        }
        NSUInteger v12 = v31;
        objc_autoreleasePoolPop(v21);
      }

      objc_autoreleasePoolPop(v21);
      [a3 encodeObject:v18 forKey:@"NSAttributes"];
      [a3 encodeObject:v19 forKey:@"NSAttributeInfo"];
    }

    if (v13) {
      goto LABEL_15;
    }
  }

- (NSAttributedString)initWithCoder:(id)a3
{
  NSUInteger v5 = (void *)[objc_allocWithZone((Class)NSMutableAttributedString) init];
  if (_NSReadMutableAttributedStringWithCoder(a3, v5))
  {
    __int128 v6 = -[NSAttributedString initWithAttributedString:](self, "initWithAttributedString:", v5);
  }

  else
  {

    __int128 v6 = 0LL;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_mayRequireIntentResolution
{
  return objc_getAssociatedObject(self, &_NSAttributedStringMayRequireIntentResolutionKey) != 0LL;
}

- (void)_markRequiringIntentResolution
{
}

- (void)_markIntentsResolved
{
}

- (BOOL)_willRequireIntentResolutionWhenContainingAttributes:(id)a3
{
  v4 = (void *)[a3 objectForKeyedSubscript:@"NSInlinePresentationIntent"];
}

- (BOOL)_willRequireIntentResolutionWhenContainingAttribute:(id)a3 value:(id)a4
{
  int v6 = [a3 isEqual:@"NSInlinePresentationIntent"];
  BOOL result = [a3 isEqual:@"NSPresentationIntent"];
  if (!a4) {
    return 0;
  }
  return result;
}

- (id)_createAttributedSubstringWithRange:(_NSRange)a3
{
  return  -[NSAttributedString attributedSubstringFromRange:]( self,  "attributedSubstringFromRange:",  a3.location,  a3.length);
}

- (id)_firstValueOfAttributeWithKey:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  NSUInteger v10 = __Block_byref_object_copy__7;
  NSUInteger v11 = __Block_byref_object_dispose__7;
  uint64_t v12 = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __74__NSAttributedString_NSInflection___firstValueOfAttributeWithKey_inRange___block_invoke;
  v6[3] = &unk_189C9DC98;
  v6[4] = &v7;
  -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:]( self,  "enumerateAttribute:inRange:options:usingBlock:",  a3,  a4.location,  a4.length,  0x100000LL,  v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__74__NSAttributedString_NSInflection___firstValueOfAttributeWithKey_inRange___block_invoke( void *result,  void *a2,  uint64_t a3,  uint64_t a4,  _BYTE *a5)
{
  if (a2)
  {
    int v6 = result;
    BOOL result = a2;
    *(void *)(*(void *)(v6[4] + 8LL) + 40LL) = result;
    *a5 = 1;
  }

  return result;
}

- (id)_inflectedAttributedString
{
  v2 = (void *)-[NSAttributedString mutableCopy](self, "mutableCopy");
  uint64_t v3 = [MEMORY[0x189603F90] currentLocale];
  [v2 _inflectWithLocale:v3 replacements:MEMORY[0x189604A58] concepts:MEMORY[0x189604A58] preflight:1];
  return v2;
}

- (id)_identicalAttributesInRange:(_NSRange)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  NSUInteger v11 = __Block_byref_object_copy__7;
  uint64_t v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__NSAttributedString_NSInflection___identicalAttributesInRange___block_invoke;
  v7[3] = &unk_189C9DCC0;
  v7[4] = &v8;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:]( self,  "enumerateAttributesInRange:options:usingBlock:",  a3.location,  a3.length,  0x100000LL,  v7);
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x189603F68]);
  }
  NSUInteger v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __64__NSAttributedString_NSInflection___identicalAttributesInRange___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  BOOL *a5)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v7)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v9 = (void *)[v7 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v16 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if ((objc_msgSend( (id)objc_msgSend(a2, "objectForKeyedSubscript:", v14),  "isEqual:",  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v14)) & 1) == 0) {
            [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeObjectForKey:v14];
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v16 count:16];
      }

      while (v11);
    }

    uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
    *a5 = result == 0;
  }

  else
  {
    uint64_t result = [a2 mutableCopy];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  }

  return result;
}

- (NSAttributedString)attributedStringByInflectingString
{
  v2 = (void *)-[NSAttributedString mutableCopy](self, "mutableCopy");
  uint64_t v3 = [MEMORY[0x189603F90] currentLocale];
  [v2 _inflectWithLocale:v3 replacements:MEMORY[0x189604A58] concepts:MEMORY[0x189604A58] preflight:1];
  return (NSAttributedString *)v2;
}

- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5
{
  return -[NSAttributedString _initWithFormat:options:locale:arguments:]( self,  "_initWithFormat:options:locale:arguments:",  a3,  a4,  0LL,  &v6,  &v6);
}

+ (id)_localizedAttributedStringWithFormat:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend( v4,  "_initWithFormat:options:locale:arguments:",  a3,  0,  objc_msgSend(MEMORY[0x189603F90], "currentLocale"),  &v6);
}

+ (id)_localizedAttributedStringWithFormat:(id)a3 options:(unint64_t)a4
{
  id v6 = objc_alloc((Class)a1);
  return (id)objc_msgSend( v6,  "_initWithFormat:options:locale:arguments:",  a3,  a4,  objc_msgSend(MEMORY[0x189603F90], "currentLocale"),  &v8);
}

- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6
{
  return -[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:arguments:]( self,  "__initWithFormat:attributeOptions:formattingOptions:locale:arguments:",  a3,  a4,  0LL,  a5,  a6);
}

- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7
{
  return -[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:]( self,  "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:",  a3,  a4,  a5,  a6,  MEMORY[0x189604A60],  a7);
}

- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 context:(id)a7 arguments:(char *)a8
{
  char obj = a4;
  uint64_t v87 = *MEMORY[0x1895F89C0];
  id v79 = 0LL;
  objc_msgSend( a3,  "attribute:atIndex:longestEffectiveRange:inRange:",  @"NSFormatSpecifierConfiguration",  0,  &v78,  0,  objc_msgSend(a3, "length"));
  [a3 length];
  [a5 pluralizationNumber];
  [a3 string];
  v54 = a8;
  uint64_t v11 = _CFStringCreateWithFormatAndArgumentsReturningMetadata();
  uint64_t v74 = 0LL;
  v75 = &v74;
  uint64_t v76 = 0x2020000000LL;
  char v77 = 0;
  if (v11)
  {
    v69 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v11,  v54);
    uint64_t v65 = [a3 length];
    v55 = self;
    v56 = (void *)v11;
    uint64_t v66 = [v79 count];
    if ((v66 & 0x8000000000000000LL) == 0)
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v64 = *MEMORY[0x189604B58];
      uint64_t v63 = *MEMORY[0x189604B50];
      uint64_t v62 = *MEMORY[0x189604B48];
      uint64_t v61 = *MEMORY[0x189604B40];
      uint64_t v60 = *MEMORY[0x189604B30];
      uint64_t v59 = *MEMORY[0x189604B20];
      do
      {
        if (v14 >= v66) {
          int v15 = 0LL;
        }
        else {
          int v15 = (void *)[v79 objectAtIndexedSubscript:v14];
        }
        NSUInteger v16 = (void *)[v15 objectForKeyedSubscript:v64];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          NSUInteger v16 = 0LL;
        }
        uint64_t v17 = [v15 objectForKeyedSubscript:v63];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          __int128 v18 = (void *)v17;
        }
        else {
          __int128 v18 = 0LL;
        }
        if (v16) {
          BOOL v19 = v18 == 0LL;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }

        else
        {
          uint64_t v20 = [v16 integerValue];
          uint64_t v21 = [v18 integerValue];
        }

        v73[8] = MEMORY[0x1895F87A8];
        uint64_t v22 = v65;
        if (v15) {
          uint64_t v22 = v20;
        }
        v73[9] = 3221225472LL;
        v73[10] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke;
        v73[11] = &unk_189C9E240;
        v73[14] = v13;
        v73[15] = v12;
        v73[16] = v22 - v12;
        v73[13] = &v74;
        v73[12] = v69;
        objc_msgSend(a3, "enumerateAttributesInRange:options:usingBlock:", v12);
        if (!v15) {
          break;
        }
        NSUInteger v23 = (void *)[v15 objectForKeyedSubscript:v62];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          NSUInteger v23 = 0LL;
        }
        uint64_t v24 = [v15 objectForKeyedSubscript:v61];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          unint64_t v25 = (void *)v24;
        }
        else {
          unint64_t v25 = 0LL;
        }
        uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
        if (v23 && v25)
        {
          uint64_t v26 = [v23 integerValue];
          uint64_t v27 = [v25 integerValue];
        }

        unint64_t v28 = (void *)[v15 objectForKeyedSubscript:v60];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v28 != 0LL)) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            unint64_t v29 = v28;
          }
          else {
            unint64_t v29 = 0LL;
          }
          unint64_t v28 = (void *)objc_msgSend(v29, "__baseAttributedString");
        }

        uint64_t v30 = [v15 objectForKeyedSubscript:v59];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          v31 = (void *)v30;
        }
        else {
          v31 = 0LL;
        }
        unsigned int v32 = [v31 BOOLValue];
        uint64_t v33 = [a3 attributesAtIndex:v20 effectiveRange:0];
        char v34 = obj & (v28 != 0LL);
        if (!v33) {
          char v34 = 1;
        }
        if ((v34 & 1) == 0) {
          -[NSMutableAttributedString addAttributes:range:](v69, "addAttributes:range:", v33, v26, v27);
        }
        if (v32)
        {
          -[NSMutableAttributedString addAttributes:range:](v69, "addAttributes:range:", v33, v26 - 1, 1LL);
          -[NSMutableAttributedString addAttributes:range:](v69, "addAttributes:range:", v33, v26 + v27, 1LL);
        }

        if (v28)
        {
          uint64_t v35 = [v28 length];
          v73[0] = MEMORY[0x1895F87A8];
          v73[1] = 3221225472LL;
          v73[2] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_2;
          v73[3] = &unk_189C9E268;
          v73[6] = v26;
          v73[7] = v27;
          v73[5] = &v74;
          v73[4] = v69;
          objc_msgSend(v28, "enumerateAttributesInRange:options:usingBlock:", 0, v35, 0x100000, v73);
        }

        uint64_t v36 = v26 + v27;
        uint64_t v12 = v20 + v21;
        ++v14;
        uint64_t v13 = v36 + v32;
      }

      while (v66 + 1 != v14);
    }

    if ((obj & 2) != 0)
    {
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      id obja = v79;
      uint64_t v37 = [v79 countByEnumeratingWithState:&v83 objects:v82 count:16];
      if (v37)
      {
        uint64_t v71 = *(void *)v84;
        uint64_t v38 = *MEMORY[0x189604B38];
        uint64_t v39 = *MEMORY[0x189604B48];
        uint64_t v40 = *MEMORY[0x189604B40];
        do
        {
          for (uint64_t i = 0LL; i != v37; ++i)
          {
            if (*(void *)v84 != v71) {
              objc_enumerationMutation(obja);
            }
            v42 = *(void **)(*((void *)&v83 + 1) + 8 * i);
            uint64_t v43 = [v42 objectForKeyedSubscript:v38];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              uint64_t v44 = v43;
            }
            else {
              uint64_t v44 = 0LL;
            }
            v45 = (void *)[v42 objectForKeyedSubscript:v39];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              v45 = 0LL;
            }
            uint64_t v46 = [v42 objectForKeyedSubscript:v40];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              v47 = (void *)v46;
            }
            else {
              v47 = 0LL;
            }
            if (v45) {
              BOOL v48 = v47 == 0LL;
            }
            else {
              BOOL v48 = 1;
            }
            if (v48)
            {
              uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
              uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
              if (!v44) {
                continue;
              }
            }

            else
            {
              uint64_t v50 = [v45 integerValue];
              uint64_t v49 = [v47 integerValue];
              if (!v44) {
                continue;
              }
            }

            if (v50 != 0x7FFFFFFFFFFFFFFFLL && v49 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v80 = @"NSReplacementIndex";
              uint64_t v81 = v44;
              -[NSMutableAttributedString addAttributes:range:]( v69,  "addAttributes:range:",  [MEMORY[0x189603F68] dictionaryWithObjects:&v81 forKeys:&v80 count:1],  v50,  v49);
            }
          }

          uint64_t v37 = [obja countByEnumeratingWithState:&v83 objects:v82 count:16];
        }

        while (v37);
      }
    }

    if (*((_BYTE *)v75 + 24)
      || (uint64_t v51 = -[NSAttributedString length](v69, "length"),
          v72[0] = MEMORY[0x1895F87A8],
          v72[1] = 3221225472LL,
          v72[2] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_3,
          v72[3] = &unk_189C9DCC0,
          v72[4] = &v74,
          -[NSAttributedString enumerateAttributesInRange:options:usingBlock:]( v69,  "enumerateAttributesInRange:options:usingBlock:",  0LL,  v51,  0x100000LL,  v72),  *((_BYTE *)v75 + 24)))
    {
      -[NSMutableAttributedString _inflectWithLocale:replacements:concepts:preflight:]( v69,  "_inflectWithLocale:replacements:concepts:preflight:",  a6,  +[_NSAttributedStringReplacement _replacementsFromMetadataArray:]( _NSAttributedStringReplacement,  "_replacementsFromMetadataArray:",  v79),  [a7 objectForKeyedSubscript:@"NSContextInflectionConcepts"],  0);
    }

    -[NSMutableAttributedString removeAttribute:range:]( v69,  "removeAttribute:range:",  @"NSFormatSpecifierConfiguration",  0LL,  -[NSAttributedString length](v69, "length"));
    v52 = -[NSAttributedString initWithAttributedString:](v55, "initWithAttributedString:", v69);
  }

  else
  {

    v52 = -[NSAttributedString initWithString:](self, "initWithString:", &stru_189CA6A28, v54);
  }

  _Block_object_dispose(&v74, 8);
  return v52;
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  if ([a2 objectForKeyedSubscript:@"NSInflect"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAlternative"]
    || [a2 objectForKeyedSubscript:@"NSInflectionReferentConcept"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAgreementConcept"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAgreementArgument"]
    || [a2 objectForKeyedSubscript:@"NSLocalizedNumberFormat"])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return objc_msgSend( *(id *)(a1 + 32),  "addAttributes:range:",  a2,  *(void *)(a1 + 48) + a3 - *(void *)(a1 + 56),  a4);
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  if ([a2 objectForKeyedSubscript:@"NSInflect"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAlternative"]
    || [a2 objectForKeyedSubscript:@"NSInflectionReferentConcept"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAgreementConcept"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAgreementArgument"]
    || [a2 objectForKeyedSubscript:@"NSLocalizedNumberFormat"])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, *(void *)(a1 + 48) + a3, a4);
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  _BYTE *a5)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"NSInflect"];
  if (result
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSInflectionAlternative"]) != 0
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSInflectionReferentConcept"]) != 0
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSInflectionAgreementConcept"]) != 0
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSInflectionAgreementArgument"]) != 0
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSLocalizedNumberFormat"]) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a5 = 1;
  }

  return result;
}

+ (id)_attributedStringWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6
{
  return (id)[objc_alloc((Class)a1) _initWithFormat:a3 options:a4 locale:a5 arguments:a6];
}

+ (id)_attributedStringWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7
{
  return (id)[objc_alloc((Class)a1) _initWithFormat:a3 attributeOptions:a4 formattingOptions:a5 locale:a6 arguments:a7];
}

- (id)_initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6
{
  return -[NSAttributedString _initWithFormat:attributeOptions:formattingOptions:locale:arguments:]( self,  "_initWithFormat:attributeOptions:formattingOptions:locale:arguments:",  a3,  a4,  a5,  a6,  &v7,  &v7);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale
{
  return (NSAttributedString *)-[NSAttributedString _initWithFormat:options:locale:arguments:]( self,  "_initWithFormat:options:locale:arguments:",  format,  options,  0LL,  va,  va);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context
{
  return (NSAttributedString *)-[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:]( self,  "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:",  format,  options,  0,  objc_msgSend(MEMORY[0x189603F90], "currentLocale", format, options, locale),  context,  va);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context arguments:(va_list)arguments
{
  return (NSAttributedString *)-[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:]( self,  "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:",  format,  options,  0LL,  locale,  context,  arguments);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format
{
  id v4 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend( v4,  "_initWithFormat:options:locale:arguments:",  format,  0,  objc_msgSend(MEMORY[0x189603F90], "currentLocale"),  va);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format context:(NSDictionary *)context
{
  id v6 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend( v6,  "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:",  format,  0,  0,  objc_msgSend(MEMORY[0x189603F90], "currentLocale"),  context,  va);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options
{
  id v6 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend( v6,  "_initWithFormat:options:locale:arguments:",  format,  options,  objc_msgSend(MEMORY[0x189603F90], "currentLocale"),  va);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options context:(NSDictionary *)context
{
  id v8 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend( v8,  "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:",  format,  options,  0,  objc_msgSend(MEMORY[0x189603F90], "currentLocale"),  context,  va);
}

- (NSAttributedString)initWithMarkdownString:(NSString *)markdownString options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{
  v17[1] = *MEMORY[0x1895F89C0];

  CFIndex v10 = -[NSString length](markdownString, "length");
  v17[0] = 0LL;
  v18.NSUInteger location = 0LL;
  v18.NSUInteger length = v10;
  CFIndex Bytes = CFStringGetBytes((CFStringRef)markdownString, v18, 0x8000100u, 0, 0, 0LL, 0LL, v17);
  if (Bytes < 1) {
    return 0LL;
  }
  CFIndex v12 = v17[0];
  if (v17[0] <= 0x80uLL)
  {
    if (v17[0])
    {
      MEMORY[0x1895F8858](Bytes);
      int v15 = (UInt8 *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    }

    else
    {
      int v15 = 0LL;
    }

    v20.NSUInteger location = 0LL;
    v20.NSUInteger length = v10;
    if (CFStringGetBytes((CFStringRef)markdownString, v20, 0x8000100u, 0, 0, v15, v12, 0LL) >= 1) {
      return (NSAttributedString *)newAttributedStringFromMarkdown( (uint64_t)v15,  v17[0],  options,  (uint64_t)baseURL,  error);
    }
    goto LABEL_11;
  }

  uint64_t v13 = malloc(v17[0]);
  v19.NSUInteger location = 0LL;
  v19.NSUInteger length = v10;
  if (CFStringGetBytes((CFStringRef)markdownString, v19, 0x8000100u, 0, 0, (UInt8 *)v13, v12, 0LL) < 1)
  {
    free(v13);
LABEL_11:
    if (error)
    {
      uint64_t v14 = 0LL;
      *error = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  259LL,  0LL);
      return v14;
    }

    return 0LL;
  }

  uint64_t v14 = (NSAttributedString *)newAttributedStringFromMarkdown((uint64_t)v13, v17[0], options, (uint64_t)baseURL, error);
  free(v13);
  return v14;
}

- (NSAttributedString)initWithContentsOfMarkdownFileAtURL:(NSURL *)markdownFile options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{
  uint64_t v10 = [MEMORY[0x189603F48] dataWithContentsOfURL:markdownFile options:1 error:error];
  if (v10) {
    return -[NSAttributedString initWithMarkdown:options:baseURL:error:]( self,  "initWithMarkdown:options:baseURL:error:",  v10,  options,  baseURL,  error);
  }

  return 0LL;
}

- (NSAttributedString)initWithMarkdown:(NSData *)markdown options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{
  return (NSAttributedString *)newAttributedStringFromMarkdown( (uint64_t)-[NSData bytes](markdown, "bytes"),  -[NSData length](markdown, "length"),  options,  (uint64_t)baseURL,  error);
}

@end