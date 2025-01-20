@interface NSHTTPURLResponseInternal
- (NSHTTPURLResponseInternal)initWithCoder:(id)a3;
- (void)dealloc;
@end

@implementation NSHTTPURLResponseInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSHTTPURLResponseInternal;
  -[NSHTTPURLResponseInternal dealloc](&v3, sel_dealloc);
}

- (NSHTTPURLResponseInternal)initWithCoder:(id)a3
{
  v5 = (const __CFDictionary *)[a3 decodeObject];
  [a3 decodeValueOfObjCType:"i" at:&v8 size:4];
  ResponseNoParser = _CFHTTPMessageCreateResponseNoParser(0LL, v8, 0LL, @"HTTP/1.1");
  if (v5 && -[__CFDictionary count](v5, "count")) {
    _CFHTTPMessageSetMultipleHeaderFields((__CFHTTPMessage *)ResponseNoParser, v5);
  }

  return (NSHTTPURLResponseInternal *)ResponseNoParser;
}

@end