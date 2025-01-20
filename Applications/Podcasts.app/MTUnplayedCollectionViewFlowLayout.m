@interface MTUnplayedCollectionViewFlowLayout
- (CGRect)frameForPinnedHeader;
@end

@implementation MTUnplayedCollectionViewFlowLayout

- (CGRect)frameForPinnedHeader
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUnplayedCollectionViewFlowLayout collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 visibleSupplementaryViewsOfKind:UICollectionElementKindSectionHeader]);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator", 0));
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "isFloating") & 1) != 0 && [v13 isFloating])
        {
          [v13 frame];
          CGFloat x = v14;
          CGFloat y = v15;
          CGFloat width = v16;
          CGFloat height = v17;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v10);
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

@end