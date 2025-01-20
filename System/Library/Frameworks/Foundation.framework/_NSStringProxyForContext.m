@interface _NSStringProxyForContext
- (NSFormatter)formatter;
- (NSString)string;
- (_NSStringProxyForContext)initWithCoder:(id)a3;
- (id)_dynamicContextEvaluation:(id)a3 patternString:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)item;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)_retainFormatter:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)setFormatter:(id)a3;
- (void)setItem:(id)a3;
- (void)setString:(id)a3;
@end

@implementation _NSStringProxyForContext

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  string = self->_string;
  if (string) {

  }
  formatter = self->_formatter;
  if (formatter) {

  }
  item = self->_item;
  if (item) {

  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSStringProxyForContext;
  -[_NSStringProxyForContext dealloc](&v6, sel_dealloc);
}

- (unint64_t)length
{
  return -[NSString length](self->_string, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_string, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (void)_retainFormatter:(id)a3
{
  formatter = self->_formatter;
  if (formatter != a3)
  {

    self->_formatter = (NSFormatter *)a3;
  }

- (id)_dynamicContextEvaluation:(id)a3 patternString:(id)a4
{
  if ([a3 isEqualToString:a4])
  {
    uint64_t v7 = 2LL;
  }

  else if ([a3 rangeOfString:a4])
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, (CFStringRef)a3);
    CFStringUppercase(MutableCopy, 0LL);
    Copy = CFStringCreateCopy(0LL, MutableCopy);
    CFRelease(MutableCopy);
    v10 = CFLocaleCopyCurrent();
    v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    v19.length = CFStringGetLength(Copy);
    v19.CFIndex location = 0LL;
    v12 = CFStringTokenizerCreate(v11, Copy, v19, 1uLL, v10);
    for (i = v12; ; v12 = i)
    {
      if (!CFStringTokenizerAdvanceToNextToken(v12))
      {
        BOOL v16 = 0;
        goto LABEL_11;
      }

      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(i);
      v14 = CFStringCreateWithSubstring(0LL, Copy, CurrentTokenRange);
      CFIndex location = CFStringFind(v14, (CFStringRef)a4, 0LL).location;
      if (location != -1) {
        break;
      }
      CFRelease(v14);
    }

    BOOL v16 = location == 0;
    CFRelease(v14);
LABEL_11:
    CFRelease(Copy);
    CFRelease(i);
    CFRelease(v10);
    if (v16) {
      uint64_t v7 = 4LL;
    }
    else {
      uint64_t v7 = 5LL;
    }
  }

  else
  {
    uint64_t v7 = 4LL;
  }

  v17 = -[_NSStringProxyForContext formatter](self, "formatter");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0LL;
  }
  -[NSFormatter setFormattingContext:](v17, "setFormattingContext:", v7);
  return -[NSFormatter stringForObjectValue:]( v17,  "stringForObjectValue:",  -[_NSStringProxyForContext item](self, "item"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setString:", -[_NSStringProxyForContext string](self, "string"));
  objc_msgSend(v4, "setFormatter:", -[_NSStringProxyForContext formatter](self, "formatter"));
  objc_msgSend(v4, "setItem:", -[_NSStringProxyForContext item](self, "item"));
  return v4;
}

- (_NSStringProxyForContext)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    v5 = (void *)[a3 decodeObjectForKey:@"NSStringProxyForContext.string"];
    objc_super v6 = (void *)[a3 decodeObjectForKey:@"NSStringProxyForContext.formatter"];
    uint64_t v7 = (void *)[a3 decodeObjectForKey:@"NSStringProxyForContext.item"];
    self->_string = (NSString *)v5;
    self->_formatter = (NSFormatter *)v6;
    self->_item = (NSCopying *)v7;
    return self;
  }

  else
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ can only be decoded by a keyed coder.",  NSStringFromClass(v9));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v10 userInfo:0]);
    -[_NSStringProxyForContext encodeWithCoder:](v11, v12, v13);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->_string forKey:@"NSStringProxyForContext.string"];
    [a3 encodeObject:self->_formatter forKey:@"NSStringProxyForContext.formatter"];
    [a3 encodeObject:self->_item forKey:@"NSStringProxyForContext.item"];
  }

  else
  {
    v5 = (objc_class *)objc_opt_class();
    objc_super v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ can only be encoded by a keyed coder.", NSStringFromClass(v5)), 0 reason userInfo];
    objc_exception_throw(v6);
    -[_NSStringProxyForContext string](v7, v8);
  }

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setString:(id)a3
{
}

- (NSFormatter)formatter
{
  return (NSFormatter *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFormatter:(id)a3
{
}

- (id)item
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setItem:(id)a3
{
}

@end