@interface ATCRTCommandSFWi
+ (id)command;
@end

@implementation ATCRTCommandSFWi

+ (id)command
{
  return  -[ATCRTCommand initWithFourCharacterCode:]( objc_alloc(&OBJC_CLASS___ATCRTCommandSFWi),  "initWithFourCharacterCode:",  1397118825LL);
}

@end