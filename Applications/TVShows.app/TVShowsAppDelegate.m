@interface TVShowsAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (id)mediaType;
@end

@implementation TVShowsAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v6 = TVCKDataTypeTVShow;
  id v7 = a4;
  id v8 = a3;
  +[TVCKStoreMediaItem setDefaultDataType:](&OBJC_CLASS___TVCKStoreMediaItem, "setDefaultDataType:", v6);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVShowsAppDelegate;
  LOBYTE(self) = -[TVShowsAppDelegate application:didFinishLaunchingWithOptions:]( &v10,  "application:didFinishLaunchingWithOptions:",  v8,  v7);

  return (char)self;
}

- (id)mediaType
{
  return TVCKStoreFrontMediaTypeTVShows;
}

@end