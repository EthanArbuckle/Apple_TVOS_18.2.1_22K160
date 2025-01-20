@interface ADPeerResponse
- (ADPeerInfo)peer;
- (NSError)error;
- (PBCodable)proto;
- (void)setError:(id)a3;
- (void)setPeer:(id)a3;
- (void)setProto:(id)a3;
@end

@implementation ADPeerResponse

- (ADPeerInfo)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (PBCodable)proto
{
  return self->_proto;
}

- (void)setProto:(id)a3
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