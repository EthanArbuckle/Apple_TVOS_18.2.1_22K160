@interface _GCAgentConnectionRegistration
- (_GCAgentConnectionRegistration)initWithUserIdentifier:(unsigned int)a3;
- (id)connectionInterruptedRegistration;
- (id)connectionInvalidationRegistration;
- (unsigned)userIdentifier;
- (void)invalidate;
- (void)setConnectionInterruptedRegistration:(id)a3;
- (void)setConnectionInvalidationRegistration:(id)a3;
@end

@implementation _GCAgentConnectionRegistration

- (_GCAgentConnectionRegistration)initWithUserIdentifier:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____GCAgentConnectionRegistration;
  result = -[_GCAgentConnectionRegistration init](&v5, "init");
  if (result) {
    result->_userIdentifier = a3;
  }
  return result;
}

- (void)invalidate
{
  id connectionInterruptedRegistration = self->_connectionInterruptedRegistration;
  self->_id connectionInterruptedRegistration = 0LL;

  id connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_id connectionInvalidationRegistration = 0LL;
}

- (unsigned)userIdentifier
{
  return self->_userIdentifier;
}

- (id)connectionInvalidationRegistration
{
  return self->_connectionInvalidationRegistration;
}

- (void)setConnectionInvalidationRegistration:(id)a3
{
}

- (id)connectionInterruptedRegistration
{
  return self->_connectionInterruptedRegistration;
}

- (void)setConnectionInterruptedRegistration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end