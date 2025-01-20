@interface PHPhotoLibrary
- (id)tvp_buildMemoriesTabSectionsWithLibraryFilterState:(id)a3;
@end

@implementation PHPhotoLibrary

- (id)tvp_buildMemoriesTabSectionsWithLibraryFilterState:(id)a3
{
  id v4 = a3;
  v5 = -[TVPMemoriesTabSection initWithPhotoLibrary:libraryFilterState:]( objc_alloc(&OBJC_CLASS___TVPMemoriesTabWatchNextSection),  "initWithPhotoLibrary:libraryFilterState:",  self,  v4);
  v9[0] = v5;
  v6 = -[TVPMemoriesTabSection initWithPhotoLibrary:libraryFilterState:]( objc_alloc(&OBJC_CLASS___TVPMemoriesTabFavoritesSection),  "initWithPhotoLibrary:libraryFilterState:",  self,  v4);

  v9[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  return v7;
}

@end