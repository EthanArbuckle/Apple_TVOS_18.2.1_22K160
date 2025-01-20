@interface NSUserActivity
- (BOOL)hasLocationData;
- (BOOL)hasPhoneNumber;
@end

@implementation NSUserActivity

- (BOOL)hasLocationData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  unsigned __int8 v3 = [v2 hasLocationData];

  return v3;
}

- (BOOL)hasPhoneNumber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 phoneNumbers]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

@end