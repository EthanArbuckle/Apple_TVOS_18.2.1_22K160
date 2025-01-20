@interface NSValue
+ (NSValue)valueWithMCVector:(id *)a3;
- ($421962E1114BB55FD51FACB03C2AC210)MCVectorValue;
@end

@implementation NSValue

+ (NSValue)valueWithMCVector:(id *)a3
{
  return  -[NSValue initWithBytes:objCType:]( objc_alloc(&OBJC_CLASS___NSValue),  "initWithBytes:objCType:",  a3,  "{?=C[4f]}");
}

- ($421962E1114BB55FD51FACB03C2AC210)MCVectorValue
{
  return ($421962E1114BB55FD51FACB03C2AC210 *)-[NSValue getValue:size:](self, "getValue:size:", retstr, 20LL);
}

@end