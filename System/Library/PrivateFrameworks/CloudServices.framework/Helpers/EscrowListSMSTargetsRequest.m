@interface EscrowListSMSTargetsRequest
- (Class)responseClass;
- (id)command;
@end

@implementation EscrowListSMSTargetsRequest

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowListSMSTargetsResponse, a2);
}

- (id)command
{
  return @"GET_SMS_TARGETS";
}

@end