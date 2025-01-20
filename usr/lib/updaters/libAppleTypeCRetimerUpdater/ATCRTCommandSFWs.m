@interface ATCRTCommandSFWs
+ (id)command;
@end

@implementation ATCRTCommandSFWs

+ (id)command
{
  return  -[ATCRTCommand initWithFourCharacterCode:]( objc_alloc(&OBJC_CLASS___ATCRTCommandSFWs),  "initWithFourCharacterCode:",  1397118835LL);
}

@end