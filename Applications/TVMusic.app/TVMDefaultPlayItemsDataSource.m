@interface TVMDefaultPlayItemsDataSource
- (BOOL)currentUserHasAnyCatalogPlayback;
- (BOOL)currentUserHasMusicSubscription;
- (void)findMPObjectWithIdentifiers:(id)a3 itemKind:(id)a4 itemProperties:(id)a5 completion:(id)a6;
- (void)getEntriesInLibraryPlaylist:(id)a3 songProperties:(id)a4 completion:(id)a5;
@end

@implementation TVMDefaultPlayItemsDataSource

- (BOOL)currentUserHasMusicSubscription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 hasMusicSubscription];

  return v3;
}

- (BOOL)currentUserHasAnyCatalogPlayback
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 allowsAnyCatalogPlayback];

  return v3;
}

- (void)findMPObjectWithIdentifiers:(id)a3 itemKind:(id)a4 itemProperties:(id)a5 completion:(id)a6
{
}

- (void)getEntriesInLibraryPlaylist:(id)a3 songProperties:(id)a4 completion:(id)a5
{
}

@end