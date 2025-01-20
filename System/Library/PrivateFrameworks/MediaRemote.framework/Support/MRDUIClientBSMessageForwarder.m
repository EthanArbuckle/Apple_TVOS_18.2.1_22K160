@interface MRDUIClientBSMessageForwarder
- (MRUIClientProtocol)target;
- (void)setTarget:(id)a3;
@end

@implementation MRDUIClientBSMessageForwarder

- (MRUIClientProtocol)target
{
  return (MRUIClientProtocol *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end