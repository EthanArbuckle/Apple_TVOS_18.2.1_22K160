@interface NSCoreDataXPCMessage
+ (BOOL)supportsSecureCoding;
- (NSCoreDataXPCMessage)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCoreDataXPCMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  self->_messageBody = 0LL;
  self->_token = 0LL;

  self->_contextName = 0LL;
  self->_contextTransactionAuthor = 0LL;

  self->_processName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCoreDataXPCMessage;
  -[NSCoreDataXPCMessage dealloc](&v3, sel_dealloc);
}

- (NSCoreDataXPCMessage)initWithCoder:(id)a3
{
  v4 = -[NSCoreDataXPCMessage init](self, "init");
  if (v4)
  {
    v4->_messageCode = [a3 decodeIntegerForKey:@"NSCoreDataXPCMessageCode"];
    v4->_messageBody = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSCoreDataXPCMessageBody"];
    v4->_token = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSCoreDataXPCMessageToken"];
    v4->_contextName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSCoreDataXPCMessageContextName"];
    v4->_contextTransactionAuthor = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSCoreDataXPCMessageContextTransactionAuthor"];
    v4->_processName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSCoreDataXPCMessageProcessName"];
    v4->_allowAncillary = [a3 decodeBoolForKey:@"NSCoreDataXPCMessageContextAllowAncillary"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

@end