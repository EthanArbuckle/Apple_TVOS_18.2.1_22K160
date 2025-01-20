@interface NSString
- (BOOL)tvss_useFaceTimeIconForState;
@end

@implementation NSString

- (BOOL)tvss_useFaceTimeIconForState
{
  if ((MGGetBoolAnswer(@"s8TgWYc7BjtSNbtuycqauw") & 1) == 0) {
    return 0;
  }
  unsigned __int8 v3 = 1;
  if ((-[NSString isEqual:](self, "isEqual:", @"NoConversations") & 1) == 0)
  {
    unsigned __int8 v3 = 1;
  }

  return v3 & 1;
}

@end