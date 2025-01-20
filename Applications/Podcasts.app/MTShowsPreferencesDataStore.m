@interface MTShowsPreferencesDataStore
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (id)_stringForSortType:(int64_t)a3;
- (id)sortDescriptors;
- (int64_t)_sortTypeForString:(id)a3;
- (int64_t)sortOrder;
- (void)setSortOrder:(int64_t)a3;
@end

@implementation MTShowsPreferencesDataStore

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E95CC;
  block[3] = &unk_100240300;
  block[4] = a1;
  if (qword_1002B6B78 != -1) {
    dispatch_once(&qword_1002B6B78, block);
  }
  return (id)qword_1002B6B70;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", a3));
}

- (id)sortDescriptors
{
  return +[MTPodcast sortDescriptorsForSortType:]( &OBJC_CLASS___MTPodcast,  "sortDescriptorsForSortType:",  -[MTShowsPreferencesDataStore sortOrder](self, "sortOrder"));
}

- (int64_t)sortOrder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForKey:kMTShowsSortOrderKey]);

  int64_t v5 = -[MTShowsPreferencesDataStore _sortTypeForString:](self, "_sortTypeForString:", v4);
  return v5;
}

- (void)setSortOrder:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTShowsPreferencesDataStore _stringForSortType:](self, "_stringForSortType:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  [v3 setObject:v5 forKey:kMTShowsSortOrderKey];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  [v4 synchronize];
}

- (int64_t)_sortTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"added"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"addedAscending"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"manual"])
  {
    int64_t v4 = 0LL;
  }

  else if ([v3 isEqualToString:@"title"])
  {
    int64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:@"titleAscending"])
  {
    int64_t v4 = 4LL;
  }

  else if ([v3 isEqualToString:@"updated"])
  {
    int64_t v4 = 5LL;
  }

  else if ([v3 isEqualToString:@"updatedAscending"])
  {
    int64_t v4 = 6LL;
  }

  else if ([v3 isEqualToString:@"recentlyUnfollowed"])
  {
    int64_t v4 = 7LL;
  }

  else
  {
    int64_t v4 = 1LL;
  }

  return v4;
}

- (id)_stringForSortType:(int64_t)a3
{
  else {
    return off_100244728[a3];
  }
}

@end