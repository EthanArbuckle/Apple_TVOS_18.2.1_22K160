@interface UIView
- (id)snapshotViewWithFullLayerHierarchy;
@end

@implementation UIView

- (id)snapshotViewWithFullLayerHierarchy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  v3 = (void *)CAEncodeLayerTree();

  if (v3)
  {
    id v4 = [[_UICAPackageView alloc] initWithData:v3 publishedObjectViewClassMap:0];
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subviews]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

@end