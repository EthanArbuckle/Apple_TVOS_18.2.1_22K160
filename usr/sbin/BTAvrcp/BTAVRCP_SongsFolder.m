@interface BTAVRCP_SongsFolder
- (id)baseQuery;
- (id)targetApp;
@end

@implementation BTAVRCP_SongsFolder

- (id)baseQuery
{
  return +[MPMediaQuery songsQuery](&OBJC_CLASS___MPMediaQuery, "songsQuery");
}

- (id)targetApp
{
  return off_10001F048;
}

@end