@interface CUUserNotificationCustomAction
- (UNNotificationAction)action;
- (id)handler;
- (void)setAction:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation CUUserNotificationCustomAction

- (UNNotificationAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end