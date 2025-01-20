@interface ADCloudResponseHandler
- (AFWatchdogTimer)timeoutTimer;
- (NSMutableDictionary)responses;
- (NSString)identifier;
- (id)completion;
- (int64_t)outstandingResponses;
- (unsigned)responseType;
- (void)setCompletion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOutstandingResponses:(int64_t)a3;
- (void)setResponseType:(unsigned __int16)a3;
- (void)setResponses:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation ADCloudResponseHandler

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)outstandingResponses
{
  return self->_outstandingResponses;
}

- (void)setOutstandingResponses:(int64_t)a3
{
  self->_outstandingResponses = a3;
}

- (unsigned)responseType
{
  return self->_responseType;
}

- (void)setResponseType:(unsigned __int16)a3
{
  self->_responseType = a3;
}

- (NSMutableDictionary)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (AFWatchdogTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end