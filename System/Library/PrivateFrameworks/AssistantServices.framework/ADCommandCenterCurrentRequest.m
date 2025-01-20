@interface ADCommandCenterCurrentRequest
- (NSString)currentRequestId;
- (SABaseCommand)currentRequestCommand;
- (id)description;
- (void)setCurrentRequestCommand:(id)a3;
- (void)setCurrentRequestId:(id)a3;
@end

@implementation ADCommandCenterCurrentRequest

- (void)setCurrentRequestCommand:(id)a3
{
  id v7 = a3;
  v5 = (NSString *)objc_claimAutoreleasedReturnValue([v7 aceId]);
  currentRequestId = self->_currentRequestId;
  self->_currentRequestId = v5;
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"command: %@ requestId:%@",  self->_currentRequestCommand,  self->_currentRequestId);
}

- (NSString)currentRequestId
{
  return self->_currentRequestId;
}

- (void)setCurrentRequestId:(id)a3
{
}

- (SABaseCommand)currentRequestCommand
{
  return self->_currentRequestCommand;
}

- (void).cxx_destruct
{
}

@end