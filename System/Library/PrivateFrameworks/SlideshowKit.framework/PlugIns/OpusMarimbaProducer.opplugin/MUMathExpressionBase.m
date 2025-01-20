@interface MUMathExpressionBase
+ (id)parserErrorToString:(id *)a3;
- (MUMathExpressionBase)init;
- (id)lastError;
- (void)_cleanup;
- (void)dealloc;
- (void)setLastError:(id *)a3;
@end

@implementation MUMathExpressionBase

- (MUMathExpressionBase)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MUMathExpressionBase;
  v2 = -[MUMathExpressionBase init](&v4, "init");
  if (v2) {
    v2->_indicesForVariables = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  return v2;
}

- (void)_cleanup
{
  self->_indicesForVariables = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MUMathExpressionBase;
  -[MUMathExpressionBase dealloc](&v3, "dealloc");
}

- (id)lastError
{
  return self->_lastError;
}

+ (id)parserErrorToString:(id *)a3
{
  unsigned int v3 = a3->var0 - 1;
  if (v3 > 0x1B) {
    return @"Unknown Parser Error Type!";
  }
  else {
    return off_24D2C0[v3];
  }
}

- (void)setLastError:(id *)a3
{
  v5 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  +[MUMathExpressionBase parserErrorToString:](&OBJC_CLASS___MUMathExpressionBase, "parserErrorToString:", a3),  NSLocalizedDescriptionKey,  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var0),  @"kMUMathParserErrorCode",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3->var1),  @"kMUMathParserErrorStartOffset",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3->var2),  @"kMUMathParserErrorEndOffset",  0LL);
  self->_lastError =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kMUMathParserErrorDomain",  a3->var0,  v5);
  NSLog(@"MathExpression ParserError :\n %@\n", v5);
}

@end