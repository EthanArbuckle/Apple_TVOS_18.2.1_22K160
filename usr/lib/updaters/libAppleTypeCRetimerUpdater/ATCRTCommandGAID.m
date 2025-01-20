@interface ATCRTCommandGAID
+ (id)command;
- (BOOL)hasResponse;
@end

@implementation ATCRTCommandGAID

+ (id)command
{
  return  -[ATCRTCommand initWithFourCharacterCode:]( objc_alloc(&OBJC_CLASS___ATCRTCommandGAID),  "initWithFourCharacterCode:",  1195460932LL);
}

- (BOOL)hasResponse
{
  return 0;
}

@end