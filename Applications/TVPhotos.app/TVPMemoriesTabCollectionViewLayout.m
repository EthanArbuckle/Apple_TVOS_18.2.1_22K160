@interface TVPMemoriesTabCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
@end

@implementation TVPMemoriesTabCollectionViewLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewLayout;
  id v4 = -[TVPMemoriesTabCollectionViewLayout invalidationContextForBoundsChange:]( &v9,  "invalidationContextForBoundsChange:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewLayout collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathsForVisibleSupplementaryElementsOfKind:@"sectionHeaderKind"]);
  [v5 invalidateSupplementaryElementsOfKind:@"sectionHeaderKind" atIndexPaths:v7];

  return v5;
}

@end