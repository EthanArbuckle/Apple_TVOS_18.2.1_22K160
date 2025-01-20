@interface NSSQLBoundedByIntermediate
- (NSSQLBoundedByIntermediate)initWithWorkingEntity:(id)a3 target:(id)a4 bounds:(id)a5 scope:(id)a6;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLBoundedByIntermediate

- (NSSQLBoundedByIntermediate)initWithWorkingEntity:(id)a3 target:(id)a4 bounds:(id)a5 scope:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSSQLBoundedByIntermediate;
  v9 = -[NSSQLIntermediate initWithScope:](&v11, sel_initWithScope_, a6);
  if (v9)
  {
    v9->_entity = (NSSQLEntity *)a3;
    v9->_target = (NSAttributeDescription *)a4;
    v9->_bounds = (NSExpression *)a5;
  }

  return v9;
}

- (void)dealloc
{
  self->_entity = 0LL;
  self->_target = 0LL;

  self->_bounds = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLBoundedByIntermediate;
  -[NSSQLBoundedByIntermediate dealloc](&v3, sel_dealloc);
}

- (id)generateSQLStringInContext:(id)a3
{
  NSExpressionType v5 = -[NSExpression expressionType](self->_bounds, "expressionType");
  if (v5 == NSConstantValueExpressionType)
  {
    id v16 = -[NSExpression constantValue](self->_bounds, "constantValue");
    if ([v16 count] == 2)
    {
      v14 = (void *)[v16 firstObject];
      uint64_t v17 = [v16 lastObject];
      goto LABEL_19;
    }

@end