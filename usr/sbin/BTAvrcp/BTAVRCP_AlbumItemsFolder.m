@interface BTAVRCP_AlbumItemsFolder
- (id)baseQuery;
- (id)targetApp;
@end

@implementation BTAVRCP_AlbumItemsFolder

- (id)baseQuery
{
  return +[MPMediaQuery albumsQuery](&OBJC_CLASS___MPMediaQuery, "albumsQuery");
}

- (id)targetApp
{
  return off_10001F048;
}

@end