@interface CSAttSiriCachedEndpointInfo
- (CSEndpointerMetrics)endpointerMetrics;
- (NSString)trpID;
- (double)endpointTime;
- (void)setEndpointTime:(double)a3;
- (void)setEndpointerMetrics:(id)a3;
- (void)setTrpID:(id)a3;
@end

@implementation CSAttSiriCachedEndpointInfo

- (double)endpointTime
{
  return self->_endpointTime;
}

- (void)setEndpointTime:(double)a3
{
  self->_endpointTime = a3;
}

- (CSEndpointerMetrics)endpointerMetrics
{
  return self->_endpointerMetrics;
}

- (void)setEndpointerMetrics:(id)a3
{
}

- (NSString)trpID
{
  return self->_trpID;
}

- (void)setTrpID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end