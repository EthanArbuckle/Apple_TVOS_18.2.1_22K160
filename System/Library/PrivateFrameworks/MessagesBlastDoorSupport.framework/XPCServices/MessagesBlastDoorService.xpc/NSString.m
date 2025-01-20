@interface NSString
- (id)__stringByStrippingAttachmentAndControlCharacters;
- (id)__stringByStrippingControlCharacters;
- (id)bd_stringByRemovingURLEscapes;
- (id)stringByRemovingCharactersFromSet:(id)a3;
- (id)trimmedString;
- (unsigned)unsignedIntValue;
@end

@implementation NSString

- (unsigned)unsignedIntValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString trimmedString](self, "trimmedString"));
  unsigned int v3 = [v2 longLongValue];

  return v3;
}

- (id)trimmedString
{
  v2 = (__CFString *)-[NSString mutableCopy](self, "mutableCopy");
  CFStringTrimWhitespace(v2);
  id v3 = -[__CFString copy](v2, "copy");

  return v3;
}

- (id)__stringByStrippingControlCharacters
{
  id v3 = sub_100008B20();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString stringByRemovingCharactersFromSet:](self, "stringByRemovingCharactersFromSet:", v4));
  v6 = v5;
  if (!v5) {
    v5 = &stru_1000A8D68;
  }
  v7 = v5;

  return v7;
}

- (id)__stringByStrippingAttachmentAndControlCharacters
{
  if (qword_1000B1798 != -1) {
    dispatch_once(&qword_1000B1798, &stru_1000A2DB0);
  }
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSString stringByRemovingCharactersFromSet:]( self,  "stringByRemovingCharactersFromSet:",  qword_1000B1790));
  v4 = v3;
  if (!v3) {
    id v3 = &stru_1000A8D68;
  }
  v5 = v3;

  return v5;
}

- (id)stringByRemovingCharactersFromSet:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSString length](self, "length");
  if (v5 << 32
    && (v11.length = (int)v5,
        v11.location = 0LL,
        CFStringFindCharacterFromSet((CFStringRef)self, (CFCharacterSetRef)v4, v11, 0LL, 0LL)))
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    if (-[NSString length](self, "length"))
    {
      unint64_t v7 = 0LL;
      do
      {
        uint64_t v8 = -[NSString characterAtIndex:](self, "characterAtIndex:", v7);
        ++v7;
      }

      while (v7 < -[NSString length](self, "length"));
    }

    v9 = (NSString *)-[NSMutableString copy](v6, "copy");
  }

  else
  {
    v9 = self;
  }

  return v9;
}

- (id)bd_stringByRemovingURLEscapes
{
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes( 0LL,  (CFStringRef)self,  &stru_1000A8D68);
}

@end