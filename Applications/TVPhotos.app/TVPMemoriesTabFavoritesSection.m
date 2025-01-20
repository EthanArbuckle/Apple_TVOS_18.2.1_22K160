@interface TVPMemoriesTabFavoritesSection
- (CGSize)itemSize;
- (Class)cellClass;
- (double)extraVerticalSpacing;
- (double)itemSpacing;
- (id)_makeDataSourceManager;
- (id)cellReuseIdentifier;
- (id)cellSpec;
- (id)titleKey;
- (int64_t)columnCount;
- (int64_t)scrollDirection;
@end

@implementation TVPMemoriesTabFavoritesSection

- (id)titleKey
{
  return @"MemoriesTabFavoritesSectionTitle";
}

- (id)cellReuseIdentifier
{
  return @"favoritesCellReuseIndentifier";
}

- (Class)cellClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPMemoriesTabFavoriteCollectionViewCell, a2);
}

- (CGSize)itemSize
{
  double v3 = v2 + 420.0;
  double v4 = 560.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (double)itemSpacing
{
  return 40.0;
}

- (int64_t)columnCount
{
  return 3LL;
}

- (id)cellSpec
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection specManager](self, "specManager"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 spec]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 favoriteCellSpec]);

  return v4;
}

- (int64_t)scrollDirection
{
  return 0LL;
}

- (double)extraVerticalSpacing
{
  return 69.0;
}

- (id)_makeDataSourceManager
{
  id v3 = objc_alloc(&OBJC_CLASS___PXStoryMemoryFeedDataSourceManager);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection photoLibrary](self, "photoLibrary"));
  id v5 = [v3 initWithPhotoLibrary:v4];

  [v5 performChanges:&stru_1000CB150];
  return v5;
}

@end