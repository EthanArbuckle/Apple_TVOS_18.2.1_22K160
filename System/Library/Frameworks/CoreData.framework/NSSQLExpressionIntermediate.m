@interface NSSQLExpressionIntermediate
- (NSSQLExpressionIntermediate)initWithExpression:(id)a3 allowToMany:(BOOL)a4 inScope:(id)a5;
@end

@implementation NSSQLExpressionIntermediate

- (NSSQLExpressionIntermediate)initWithExpression:(id)a3 allowToMany:(BOOL)a4 inScope:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSQLExpressionIntermediate;
  result = -[NSSQLIntermediate initWithScope:](&v8, sel_initWithScope_, a5);
  if (result)
  {
    result->_expression = (NSExpression *)a3;
    result->_allowToMany = a4;
  }

  return result;
}

@end