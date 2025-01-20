@interface CDServiceRequestResult
- (NSString)serviceName;
- (int)urgency;
- (void)setServiceName:(id)a3;
- (void)setUrgency:(int)a3;
@end

@implementation CDServiceRequestResult

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (int)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int)a3
{
  self->_urgency = a3;
}

- (void).cxx_destruct
{
}

@end