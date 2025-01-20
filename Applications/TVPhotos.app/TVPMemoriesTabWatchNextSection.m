@interface TVPMemoriesTabWatchNextSection
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
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation TVPMemoriesTabWatchNextSection

- (id)titleKey
{
  return @"MemoriesTabWatchNowSectionTitle";
}

- (id)cellReuseIdentifier
{
  return @"watchNextCellReuseIndentifier";
}

- (Class)cellClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPMemoriesTabWatchNextCollectionViewCell, a2);
}

- (CGSize)itemSize
{
  double v2 = 320.0;
  double v3 = 213.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 40.0;
}

- (int64_t)columnCount
{
  return 5LL;
}

- (id)cellSpec
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection specManager](self, "specManager"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 spec]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 watchNextCellSpec]);

  return v4;
}

- (int64_t)scrollDirection
{
  return 1LL;
}

- (double)extraVerticalSpacing
{
  return 0.0;
}

- (id)_makeDataSourceManager
{
  id v3 = objc_alloc(&OBJC_CLASS___PXStoryMemoryFeedDataSourceManager);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection photoLibrary](self, "photoLibrary"));
  id v5 = [v3 initWithPhotoLibrary:v4];

  [v5 performChanges:&stru_1000CB130];
  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if (off_100101F20 == a5)
  {
    if ((a4 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection delegate](self, "delegate"));
      [v9 reloadSection:self];
    }
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabWatchNextSection;
    -[TVPMemoriesTabSection observable:didChange:context:](&v10, "observable:didChange:context:", v8, a4, a5);
  }
}

@end