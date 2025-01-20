@interface MLDTransactionInfo
- (ML3Client)client;
- (ML3DatabasePrivacyContext)privacyContext;
- (MLDTaskAssertion)taskAssertion;
- (id)description;
- (void)setClient:(id)a3;
- (void)setPrivacyContext:(id)a3;
- (void)setTaskAssertion:(id)a3;
@end

@implementation MLDTransactionInfo

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: client=%@>",  objc_opt_class(self, a2),  self,  self->_client);
}

- (MLDTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
}

- (ML3Client)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (ML3DatabasePrivacyContext)privacyContext
{
  return self->_privacyContext;
}

- (void)setPrivacyContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end