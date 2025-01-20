@interface RBSLaunchResponse
- (NSDictionary)managedEndpointByLaunchIdentifier;
- (NSError)error;
- (RBSAssertion)assertion;
- (RBSProcessHandle)process;
- (id)_init;
- (void)setAssertion:(id)a3;
- (void)setError:(id)a3;
- (void)setManagedEndpointByLaunchIdentifier:(id)a3;
- (void)setProcess:(id)a3;
@end

@implementation RBSLaunchResponse

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSLaunchResponse;
  return -[RBSLaunchResponse init](&v3, sel_init);
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (void)setManagedEndpointByLaunchIdentifier:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end