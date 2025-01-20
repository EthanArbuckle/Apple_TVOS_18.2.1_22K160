@interface NSConcreteAttributedString
- (NSConcreteAttributedString)init;
- (NSConcreteAttributedString)initWithAttributedString:(id)a3;
- (NSConcreteAttributedString)initWithString:(id)a3;
- (NSConcreteAttributedString)initWithString:(id)a3 attributes:(id)a4;
- (id)_runArrayHoldingAttributes;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)string;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation NSConcreteAttributedString

- (NSConcreteAttributedString)initWithString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = _NSNameOfClass(v12);
      v14 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%s %s: nil value", v13, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v14);
      return -[NSConcreteAttributedString initWithString:attributes:](v15, v16, v17, v18);
    }

    if ((initWithString__warned & 1) == 0)
    {
      uint64_t v6 = objc_opt_class();
      v7 = NSStringFromSelector(a2);
      NSLog( (NSString *)@"-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once.",  v6,  v7);
      initWithString__warned = 1;
    }
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSConcreteAttributedString;
  v8 = -[NSConcreteAttributedString init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(a3, "copyWithZone:", -[NSConcreteAttributedString zone](v8, "zone"));
    v9->string = (NSString *)v10;
    if (!a3 || v10)
    {
      v9->attributes = 0LL;
    }

    else
    {

      return 0LL;
    }
  }

  return v9;
}

- (NSConcreteAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  v5 = -[NSConcreteAttributedString initWithString:](self, "initWithString:", a3);
  uint64_t v6 = v5;
  if (a4 && v5)
  {
    v7 = -[NSRLEArray init]( +[NSMutableRLEArray allocWithZone:]( &OBJC_CLASS___NSMutableRLEArray,  "allocWithZone:",  -[NSConcreteAttributedString zone](v5, "zone")),  "init");
    v8 = (void *)[(id)_NSAttributeDictionaryClass() newWithDictionary:a4];
    -[NSMutableRLEArray insertObject:range:]( v7,  "insertObject:range:",  v8,  0LL,  -[NSConcreteAttributedString length](v6, "length"));
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:]( v6,  "_willRequireIntentResolutionWhenContainingAttributes:",  v8))
    {
      -[NSAttributedString _markRequiringIntentResolution](v6, "_markRequiringIntentResolution");
    }

    v6->attributes = &v7->super;
  }

  return v6;
}

- (NSConcreteAttributedString)initWithAttributedString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v4 = -[NSConcreteAttributedString initWithString:](self, "initWithString:", [a3 string]);
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = (void *)[a3 _runArrayHoldingAttributes];
      if (v5) {
        v4->attributes = (NSRLEArray *)objc_msgSend(v5, "copyWithZone:", -[NSConcreteAttributedString zone](v4, "zone"));
      }
    }

    if (!v4->attributes)
    {
      unint64_t v6 = -[NSString length](v4->string, "length");
      v7 = -[NSRLEArray init]( +[NSMutableRLEArray allocWithZone:]( &OBJC_CLASS___NSMutableRLEArray,  "allocWithZone:",  -[NSConcreteAttributedString zone](v4, "zone")),  "init");
      if (v6)
      {
        for (unint64_t i = 0LL; i < v6; i += v14)
        {
          v9 = (void *)objc_msgSend( (id)_NSAttributeDictionaryClass(),  "newWithDictionary:",  objc_msgSend(a3, "attributesAtIndex:effectiveRange:", i, &v13));
          if (v14 + v13 <= v6) {
            unint64_t v10 = v13 - i + v14;
          }
          else {
            unint64_t v10 = v6 - i;
          }
          if (v13 != i || v14 + v13 > v6) {
            unint64_t v14 = v10;
          }
          -[NSMutableRLEArray insertObject:range:](v7, "insertObject:range:", v9, i, v10);
        }
      }

      v4->attributes = &v7->super;
    }
  }

  return v4;
}

- (NSConcreteAttributedString)init
{
  return -[NSConcreteAttributedString initWithString:](self, "initWithString:", &stru_189CA6A28);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteAttributedString;
  -[NSConcreteAttributedString dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSConcreteAttributedString;
  return -[NSAttributedString copyWithZone:](&v6, sel_copyWithZone_, a3);
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  if (self->attributes) {
    return -[NSRLEArray objectAtIndex:effectiveRange:](self->attributes, "objectAtIndex:effectiveRange:", a3, a4);
  }
  if (a4)
  {
    NSUInteger v6 = -[NSString length](self->string, "length", a3);
    a4->location = 0LL;
    a4->length = v6;
  }

  return (id)[(id)_NSAttributeDictionaryClass() emptyAttributeDictionary];
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  if (self->attributes) {
    return (id)objc_msgSend( -[NSRLEArray objectAtIndex:effectiveRange:](self->attributes, "objectAtIndex:effectiveRange:", a4, a5),  "objectForKey:",  a3);
  }
  if (a5)
  {
    NSUInteger v7 = -[NSString length](self->string, "length", a3, a4);
    a5->location = 0LL;
    a5->length = v7;
  }

  return 0LL;
}

- (unint64_t)length
{
  return -[NSString length](self->string, "length");
}

- (id)string
{
  return self->string;
}

- (id)_runArrayHoldingAttributes
{
  return self->attributes;
}

@end