@interface ATCRTCommandGaid
+ (id)command;
- (BOOL)hasResponse;
@end

@implementation ATCRTCommandGaid

+ (id)command
{
  return  -[ATCRTCommand initWithFourCharacterCode:]( objc_alloc(&OBJC_CLASS___ATCRTCommandGaid),  "initWithFourCharacterCode:",  1197566308LL);
}

- (BOOL)hasResponse
{
  return 0;
}

@end