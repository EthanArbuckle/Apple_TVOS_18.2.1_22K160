@interface NSValue
+ (NSValue)valueWithMRHIDTouchEvent:(_MRHIDTouchEvent *)a3;
- (_MRHIDTouchEvent)MRHIDTouchEventValue;
@end

@implementation NSValue

+ (NSValue)valueWithMRHIDTouchEvent:(_MRHIDTouchEvent *)a3
{
  return +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  a3,  "{_MRHIDTouchEvent=(_MRHIDPoint={?=ff}[2f])IQI}");
}

- (_MRHIDTouchEvent)MRHIDTouchEventValue
{
  *(_OWORD *)&retstr->var0.var0.var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v4 = self;
  result = (_MRHIDTouchEvent *)strcmp( -[NSValue objCType](v4, "objCType"),  "{_MRHIDTouchEvent=(_MRHIDPoint={?=ff}[2f])IQI}");
  if (!(_DWORD)result) {
    return (_MRHIDTouchEvent *)-[NSValue getValue:](v4, "getValue:", retstr);
  }
  return result;
}

@end