@interface MPStateOperation
+ (id)stateOperation;
- (MPStateOperation)init;
- (NSString)operation;
- (NSString)stateKey;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setOperation:(id)a3;
- (void)setStateKey:(id)a3;
@end

@implementation MPStateOperation

+ (id)stateOperation
{
  return objc_alloc_init(&OBJC_CLASS___MPStateOperation);
}

- (MPStateOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPStateOperation;
  result = -[MPAction init](&v3, "init");
  if (result)
  {
    result->_operation = 0LL;
    result->_stateKey = 0LL;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPStateOperation;
  -[MPAction dealloc](&v3, "dealloc");
}

- (void)setOperation:(id)a3
{
  operation = self->_operation;
  if (operation)
  {

    self->_operation = 0LL;
  }

  self->_operation = (NSString *)[a3 copy];
  action = self->super._action;
  if (action) {
    -[MCAction setExpression:](action, "setExpression:", a3);
  }
}

- (void)setStateKey:(id)a3
{
  stateKey = self->_stateKey;
  if (stateKey)
  {

    self->_stateKey = 0LL;
  }

  self->_stateKey = (NSString *)[a3 copy];
  action = self->super._action;
  if (action) {
    -[MCAction setStateKey:](action, "setStateKey:", a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPStateOperation;
  id v4 = -[MPAction copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setOperation:self->_operation];
  [v4 setStateKey:self->_stateKey];
  return v4;
}

- (void)setAction:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPStateOperation;
  -[MPAction setAction:](&v5, "setAction:", a3);
  action = self->super._action;
  if (action)
  {
    -[MCAction setExpression:](action, "setExpression:", self->_operation);
    -[MCAction setStateKey:](self->super._action, "setStateKey:", self->_stateKey);
  }

- (NSString)operation
{
  return self->_operation;
}

- (NSString)stateKey
{
  return self->_stateKey;
}

@end