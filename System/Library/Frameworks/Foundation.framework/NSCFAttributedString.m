@interface NSCFAttributedString
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributedString:(id)a3;
- (Class)classForCoder;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributedSubstringFromRange:(_NSRange)a3;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)addAttributes:(id)a3 range:(_NSRange)a4;
- (void)appendAttributedString:(id)a3;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAttribute:(id)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributedString:(id)a3;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation NSCFAttributedString

- (BOOL)isEqual:(id)a3
{
  return a3 && _CFNonObjCEqual() != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain() != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return CFAttributedStringGetAttributes((CFAttributedStringRef)self, a3, (CFRange *)a4);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return (id)CFAttributedStringGetAttribute((CFAttributedStringRef)self, a4, (CFStringRef)a3, (CFRange *)a5);
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  return CFAttributedStringCreateWithSubstring(0LL, (CFAttributedStringRef)self, (CFRange)a3);
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  return CFAttributedStringGetAttributesAndLongestEffectiveRange( (CFAttributedStringRef)self,  a3,  (CFRange)a5,  (CFRange *)a4);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  return (id)CFAttributedStringGetAttributeAndLongestEffectiveRange( (CFAttributedStringRef)self,  a4,  (CFStringRef)a3,  (CFRange)a6,  (CFRange *)a5);
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  return a3 && CFEqual(self, a3) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return CFAttributedStringCreateCopy(0LL, (CFAttributedStringRef)self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFAttributedStringCreateMutableCopy(0LL, 0LL, (CFAttributedStringRef)self);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  int v6 = _CFAttributedStringCheckAndReplace();
  if (v6)
  {
    mutateError2(a2, v6, (objc_class *)self);
    mutateError2(v7, v8, v9);
  }

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  int v6 = _CFAttributedStringCheckAndSetAttributes();
  if (v6)
  {
    mutateError2(a2, v6, (objc_class *)self);
    -[NSCFAttributedString replaceCharactersInRange:withAttributedString:](v7, v8, v10, v9);
  }

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  int v6 = _CFAttributedStringCheckAndReplaceAttributed();
  if (v6)
  {
    mutateError2(a2, v6, (objc_class *)self);
    -[NSCFAttributedString insertAttributedString:atIndex:](v7, v8, v9, v10);
  }

- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  int v6 = _CFAttributedStringCheckAndReplaceAttributed();
  if (v6)
  {
    mutateError2(a2, v6, (objc_class *)self);
    -[NSCFAttributedString appendAttributedString:](v7, v8, v9);
  }

- (void)appendAttributedString:(id)a3
{
  int v5 = _CFAttributedStringCheckAndReplaceAttributed();
  if (v5)
  {
    mutateError2(a2, v5, (objc_class *)self);
    -[NSCFAttributedString deleteCharactersInRange:](v6, v7, v8);
  }

- (void)deleteCharactersInRange:(_NSRange)a3
{
  int v5 = _CFAttributedStringCheckAndReplaceAttributed();
  if (v5)
  {
    mutateError2(a2, v5, (objc_class *)self);
    -[NSCFAttributedString setAttributedString:](v6, v7, v8);
  }

- (void)setAttributedString:(id)a3
{
  int v5 = _CFAttributedStringCheckAndReplaceAttributed();
  if (v5)
  {
    mutateError2(a2, v5, (objc_class *)self);
    -[NSCFAttributedString addAttributes:range:](v6, v7, v8, v9);
  }

- (void)addAttributes:(id)a3 range:(_NSRange)a4
{
  int v6 = _CFAttributedStringCheckAndSetAttributes();
  if (v6)
  {
    mutateError2(a2, v6, (objc_class *)self);
    -[NSCFAttributedString addAttribute:value:range:](v7, v8, v9, v10, v11);
  }

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  if (!a4)
  {
    SEL v8 = a2;
    uint64_t v9 = 2LL;
LABEL_6:
    mutateError2(v8, v9, (objc_class *)self);
    -[NSCFAttributedString removeAttribute:range:](v10, v11, v12, v13);
    return;
  }

  int v7 = _CFAttributedStringCheckAndSetAttribute();
  if (v7)
  {
    uint64_t v9 = v7;
    SEL v8 = a2;
    goto LABEL_6;
  }

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  int v6 = _CFAttributedStringCheckAndSetAttribute();
  if (v6)
  {
    mutateError2(a2, v6, (objc_class *)self);
    -[NSAttributedString _cfTypeID](v7, v8);
  }

@end