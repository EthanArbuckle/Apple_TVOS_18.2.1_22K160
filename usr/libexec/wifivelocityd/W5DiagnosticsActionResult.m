@interface W5DiagnosticsActionResult
- (NSError)error;
- (NSUUID)uuid;
- (W5DiagnosticsModePeer)peer;
- (void)setError:(id)a3;
- (void)setPeer:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5DiagnosticsActionResult

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (W5DiagnosticsModePeer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end