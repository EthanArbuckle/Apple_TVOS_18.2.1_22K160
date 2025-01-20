@interface TVPMemoriesTabSpec
- (PXStoryTVWatchNextCellSpec)watchNextCellSpec;
- (TVPMemoriesTabFavoritesCellSpec)favoriteCellSpec;
- (TVPMemoriesTabSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
@end

@implementation TVPMemoriesTabSpec

- (TVPMemoriesTabSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabSpec;
  v7 = -[TVPMemoriesTabSpec initWithExtendedTraitCollection:options:]( &v13,  "initWithExtendedTraitCollection:options:",  v6,  a4);
  if (v7)
  {
    v8 = -[TVPMemoriesTabFavoritesCellSpec initWithExtendedTraitCollection:]( objc_alloc(&OBJC_CLASS___TVPMemoriesTabFavoritesCellSpec),  "initWithExtendedTraitCollection:",  v6);
    favoriteCellSpec = v7->_favoriteCellSpec;
    v7->_favoriteCellSpec = v8;

    v10 = -[PXStoryTVWatchNextCellSpec initWithExtendedTraitCollection:]( objc_alloc(&OBJC_CLASS___PXStoryTVWatchNextCellSpec),  "initWithExtendedTraitCollection:",  v6);
    watchNextCellSpec = v7->_watchNextCellSpec;
    v7->_watchNextCellSpec = v10;
  }

  return v7;
}

- (TVPMemoriesTabFavoritesCellSpec)favoriteCellSpec
{
  return self->_favoriteCellSpec;
}

- (PXStoryTVWatchNextCellSpec)watchNextCellSpec
{
  return self->_watchNextCellSpec;
}

- (void).cxx_destruct
{
}

@end