@interface TMSimpleAssertion
- (BOOL)isValid;
- (NSString)identifier;
- (NSString)reason;
- (TMSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5;
- (id)description;
- (void)dealloc;
- (void)invalidate;
@end

@implementation TMSimpleAssertion

- (TMSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TMSimpleAssertion;
  v8 = -[TMSimpleAssertion init](&v10, "init");
  if (v8)
  {
    v8->_identifier = (NSString *)[a3 copy];
    v8->_reason = (NSString *)[a4 copy];
    atomic_store(0, (unsigned __int8 *)&v8->_invalidated);
    v8->_invalidationBlock = [a5 copy];
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TMSimpleAssertion;
  -[TMSimpleAssertion dealloc](&v2, "dealloc");
}

- (BOOL)isValid
{
  return !self->_invalidated;
}

- (void)invalidate
{
  p_invalidated = &self->_invalidated;
  while (!__ldxr((unsigned __int8 *)p_invalidated))
  {
    if (!__stxr(1u, (unsigned __int8 *)p_invalidated))
    {
      (*((void (**)(void))self->_invalidationBlock + 2))();

      self->_invalidationBlock = 0LL;
      return;
    }
  }

  __clrex();
}

- (id)description
{
  return &stru_100065500;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)reason
{
  return self->_reason;
}

@end