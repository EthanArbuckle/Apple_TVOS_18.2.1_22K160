@interface BTAVRCP_AudiobookItemsFolder
- (id)baseQuery;
- (id)targetApp;
@end

@implementation BTAVRCP_AudiobookItemsFolder

- (id)baseQuery
{
  return +[MPMediaQuery audiobooksQuery](&OBJC_CLASS___MPMediaQuery, "audiobooksQuery");
}

- (id)targetApp
{
  return off_10001F058;
}

@end