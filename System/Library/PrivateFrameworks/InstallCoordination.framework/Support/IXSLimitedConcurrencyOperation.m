@interface IXSLimitedConcurrencyOperation
- (IXSLimitedConcurrencyOperation)initWithBlock:(id)a3 description:(id)a4;
- (NSString)descString;
- (id)block;
@end

@implementation IXSLimitedConcurrencyOperation

- (IXSLimitedConcurrencyOperation)initWithBlock:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IXSLimitedConcurrencyOperation;
  v8 = -[IXSLimitedConcurrencyOperation init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_descString, a4);
    id v10 = objc_retainBlock(v6);
    id block = v9->_block;
    v9->_id block = v10;
  }

  return v9;
}

- (NSString)descString
{
  return self->_descString;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end