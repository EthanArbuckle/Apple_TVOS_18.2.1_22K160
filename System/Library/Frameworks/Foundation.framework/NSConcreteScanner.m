@interface NSConcreteScanner
- (BOOL)caseSensitive;
- (BOOL)scanInt:(int *)a3;
- (BOOL)scanLongLong:(int64_t *)a3;
- (NSConcreteScanner)initWithString:(id)a3;
- (id)_invertedSkipSet;
- (id)charactersToBeSkipped;
- (id)locale;
- (id)string;
- (unint64_t)scanLocation;
- (void)dealloc;
- (void)setCaseSensitive:(BOOL)a3;
- (void)setCharactersToBeSkipped:(id)a3;
- (void)setLocale:(id)a3;
- (void)setScanLocation:(unint64_t)a3;
@end

@implementation NSConcreteScanner

- (NSConcreteScanner)initWithString:(id)a3
{
  v3 = (__CFString *)a3;
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    NSLog((NSString *)@"NSScanner: nil string argument", a2);
    v3 = &stru_189CA6A28;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSConcreteScanner;
  v5 = -[NSScanner initWithString:](&v7, sel_initWithString_, v3);
  v5->scanString = (NSString *)-[__CFString copyWithZone:](v3, "copyWithZone:", 0LL);
  v5->skipSet =  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet");
  v5->scanLocation = 0LL;
  return v5;
}

- (id)string
{
  return self->scanString;
}

- (id)_invertedSkipSet
{
  id result = self->invertedSkipSet;
  if (!result)
  {
    id result = -[NSConcreteScanner charactersToBeSkipped](self, "charactersToBeSkipped");
    if (result)
    {
      id v4 = result;
      if (result == +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"))
      {
        if (_MergedGlobals_5_0 != -1) {
          dispatch_once(&_MergedGlobals_5_0, &__block_literal_global_96_0);
        }
        return (id)qword_18C494A20;
      }

      else
      {
        id result = (id)objc_msgSend((id)objc_msgSend(v4, "invertedSet"), "copy");
        self->invertedSkipSet = (NSCharacterSet *)result;
      }
    }
  }

  return result;
}

- (void)setScanLocation:(unint64_t)a3
{
  unint64_t v6 = -[NSString length](self->scanString, "length");
  if (v6 < a3)
  {
    objc_super v7 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Index %lu out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a3,
                     v6),
                   0LL);
    objc_exception_throw(v7);
    -[NSConcreteScanner scanLocation](v8, v9);
  }

  else
  {
    self->scanLocation = a3;
  }

- (unint64_t)scanLocation
{
  return self->scanLocation;
}

- (void)setCharactersToBeSkipped:(id)a3
{
  v5 = self->skipSet;
  self->skipSet = (NSCharacterSet *)objc_msgSend(a3, "copyWithZone:", -[NSConcreteScanner zone](self, "zone"));

  self->invertedSkipSet = 0LL;
}

- (id)charactersToBeSkipped
{
  return self->skipSet;
}

- (void)setCaseSensitive:(BOOL)a3
{
  self->flags = ($2B5DD4196BC790A619058A8FED2FA401)(*(_DWORD *)&self->flags & 0xFFFFFFFE | a3);
}

- (BOOL)caseSensitive
{
  return *(_DWORD *)&self->flags & 1;
}

- (void)setLocale:(id)a3
{
  id locale = self->locale;
  if (locale != a3)
  {

    self->id locale = a3;
  }

- (id)locale
{
  return self->locale;
}

- (BOOL)scanInt:(int *)a3
{
  return _NSScanIntFromString(self->scanString, self->skipSet, a3, &self->scanLocation);
}

- (BOOL)scanLongLong:(int64_t *)a3
{
  return _NSScanLongLongFromString(self->scanString, self->skipSet, a3, &self->scanLocation);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteScanner;
  -[NSConcreteScanner dealloc](&v3, sel_dealloc);
}

@end