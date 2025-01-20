@interface MCMotionTriggerExpression
+ (id)motionTriggerForTargetPlugObjectID:(id)a3 withKey:(id)a4 duration:(double)a5 andExpression:(id)a6;
- (MCMotionTriggerExpression)initWithImprint:(id)a3;
- (NSDictionary)attributes;
- (NSString)expression;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAttributes:(id)a3;
- (void)setExpression:(id)a3;
@end

@implementation MCMotionTriggerExpression

+ (id)motionTriggerForTargetPlugObjectID:(id)a3 withKey:(id)a4 duration:(double)a5 andExpression:(id)a6
{
  id v7 = +[MCMotionTrigger motionTriggerForTargetPlugObjectID:withKey:andDuration:]( &OBJC_CLASS___MCMotionTriggerExpression,  "motionTriggerForTargetPlugObjectID:withKey:andDuration:",  a3,  a4,  a5);
  [v7 setExpression:a6];
  return v7;
}

- (MCMotionTriggerExpression)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMotionTriggerExpression;
  v4 = -[MCMotionTrigger initWithImprint:](&v6, "initWithImprint:");
  if (v4)
  {
    v4->_expression = (NSString *)[a3 objectForKey:@"expression"];
    v4->_attributes = (NSDictionary *)[a3 objectForKey:@"attributes"];
  }

  return v4;
}

- (void)demolish
{
  self->_expression = 0LL;
  self->_attributes = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMotionTriggerExpression;
  -[MCMotionTrigger demolish](&v3, "demolish");
}

- (id)imprint
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCMotionTriggerExpression;
  id v3 = -[MCMotionTrigger imprint](&v8, "imprint");
  v4 = v3;
  expression = self->_expression;
  if (expression) {
    [v3 setObject:expression forKey:@"expression"];
  }
  attributes = self->_attributes;
  if (attributes) {
    [v4 setObject:attributes forKey:@"attributes"];
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCMotionTriggerExpression;
  -[MCMotionTrigger _copySelfToSnapshot:](&v7, "_copySelfToSnapshot:");
  expression = self->_expression;
  if (expression) {
    *((void *)a3 + 7) = -[NSString copy](expression, "copy");
  }
  attributes = self->_attributes;
  if (attributes) {
    *((void *)a3 + 8) = -[NSDictionary copy](attributes, "copy");
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMotionTriggerExpression;
  return objc_msgSend( -[MCMotionTrigger description](&v3, "description"),  "stringByAppendingFormat:",  @", expression='%@', attributes=%@",  self->_expression,  self->_attributes);
}

- (NSString)expression
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setExpression:(id)a3
{
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAttributes:(id)a3
{
}

@end