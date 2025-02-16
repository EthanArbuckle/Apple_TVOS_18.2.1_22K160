@interface MCStateOperationExpression
+ (id)stateOperationForTargetPlugObjectID:(id)a3 withStateKey:(id)a4 andExpression:(id)a5;
- (MCStateOperationExpression)initWithImprint:(id)a3;
- (NSString)expression;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setExpression:(id)a3;
@end

@implementation MCStateOperationExpression

+ (id)stateOperationForTargetPlugObjectID:(id)a3 withStateKey:(id)a4 andExpression:(id)a5
{
  v6 = +[MCStateOperation stateOperationForTargetPlugObjectID:withStateKey:]( &OBJC_CLASS___MCStateOperationExpression,  "stateOperationForTargetPlugObjectID:withStateKey:",  a3,  a4);
  v6[4] = [a5 copy];
  return v6;
}

- (MCStateOperationExpression)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCStateOperationExpression;
  v4 = -[MCStateOperation initWithImprint:](&v6, "initWithImprint:");
  if (v4) {
    v4->_expression = (NSString *)[a3 objectForKey:@"expression"];
  }
  return v4;
}

- (void)demolish
{
  self->_expression = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCStateOperationExpression;
  -[MCStateOperation demolish](&v3, "demolish");
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCStateOperationExpression;
  id v3 = -[MCStateOperation imprint](&v7, "imprint");
  v4 = v3;
  expression = self->_expression;
  if (expression) {
    [v3 setObject:expression forKey:@"expression"];
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCStateOperationExpression;
  -[MCStateOperation _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  expression = self->_expression;
  if (expression) {
    *((void *)a3 + 4) = -[NSString copy](expression, "copy");
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCStateOperationExpression;
  return objc_msgSend( -[MCStateOperation description](&v3, "description"),  "stringByAppendingFormat:",  @" = '%@'",  self->_expression);
}

- (NSString)expression
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setExpression:(id)a3
{
}

@end