@interface MRDUIClientXPCMessageForwarder
- (MRUIClientXPCProtocol)target;
- (void)setTarget:(id)a3;
@end

@implementation MRDUIClientXPCMessageForwarder

- (MRUIClientXPCProtocol)target
{
  return (MRUIClientXPCProtocol *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end