@interface AKPiggybackReplyWaiter
- (AKCircleRequestPayload)payload;
- (NSCondition)condition;
- (void)setCondition:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation AKPiggybackReplyWaiter

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (AKCircleRequestPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end