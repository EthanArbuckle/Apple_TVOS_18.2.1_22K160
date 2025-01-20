@interface CSDConversationLeaveContext
+ (id)greenTeaLeaveContext;
- (CSDConversationLeaveContext)initWithLeaveReason:(unint64_t)a3;
- (id)description;
- (unint64_t)leaveReason;
- (void)setLeaveReason:(unint64_t)a3;
@end

@implementation CSDConversationLeaveContext

- (CSDConversationLeaveContext)initWithLeaveReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSDConversationLeaveContext;
  result = -[CSDConversationLeaveContext init](&v5, "init");
  if (result) {
    result->_leaveReason = a3;
  }
  return result;
}

+ (id)greenTeaLeaveContext
{
  return  -[CSDConversationLeaveContext initWithLeaveReason:]( objc_alloc(&OBJC_CLASS___CSDConversationLeaveContext),  "initWithLeaveReason:",  2LL);
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@ %p ", objc_opt_class(self, v4), self);
  objc_super v5 = NSStringFromSelector("leaveReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%lu",  v6,  -[CSDConversationLeaveContext leaveReason](self, "leaveReason"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  id v7 = -[NSMutableString copy](v3, "copy");

  return v7;
}

- (unint64_t)leaveReason
{
  return self->_leaveReason;
}

- (void)setLeaveReason:(unint64_t)a3
{
  self->_leaveReason = a3;
}

@end