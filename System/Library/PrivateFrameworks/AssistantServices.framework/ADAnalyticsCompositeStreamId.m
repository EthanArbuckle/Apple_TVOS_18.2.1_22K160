@interface ADAnalyticsCompositeStreamId
- (NSString)speechId;
- (NSString)streamUID;
- (void)setSpeechId:(id)a3;
- (void)setStreamUID:(id)a3;
@end

@implementation ADAnalyticsCompositeStreamId

- (NSString)streamUID
{
  return self->_streamUID;
}

- (void)setStreamUID:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end