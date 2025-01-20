@interface TVNPRoutingRoutesCollectionViewLayout
+ (Class)layoutAttributesClass;
- (NSIndexPath)volumeSliderIndexPath;
- (double)bottomGradientHeight;
- (double)topGradientHeight;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
- (void)setBottomGradientHeight:(double)a3;
- (void)setTopGradientHeight:(double)a3;
- (void)setVolumeSliderIndexPath:(id)a3;
@end

@implementation TVNPRoutingRoutesCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayoutAttributes);
}

- (void)prepareLayout
{
  v12 = self;
  SEL v11 = a2;
  id v8 = -[TVNPRoutingRoutesCollectionViewLayout collectionView](self, "collectionView");
  id v7 = [v8 delegate];
  unsigned __int8 v9 = [v7 conformsToProtocol:&OBJC_PROTOCOL___TVNPRoutingRoutesCollectionViewLayoutDelegate];

  if ((v9 & 1) != 0)
  {
    id v6 = -[TVNPRoutingRoutesCollectionViewLayout collectionView](v12, "collectionView");
    id v5 = [v6 delegate];
    id v4 = -[TVNPRoutingRoutesCollectionViewLayout collectionView](v12, "collectionView");
    v2 = (NSIndexPath *)objc_msgSend(v5, "indexPathForVolumeSliderInCollectionView:layout:");
    volumeSliderIndexPath = v12->_volumeSliderIndexPath;
    v12->_volumeSliderIndexPath = v2;
  }

  v10.receiver = v12;
  v10.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayout;
  -[TVNPRoutingRoutesCollectionViewLayout prepareLayout](&v10, "prepareLayout");
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGRect v18 = a3;
  v17 = self;
  v16[1] = (id)a2;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayout;
  v16[0] =  -[TVNPRoutingRoutesCollectionViewLayout layoutAttributesForElementsInRect:]( &v15,  "layoutAttributesForElementsInRect:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  memset(__b, 0, sizeof(__b));
  id obj = v16[0];
  id v12 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v9);
      id v5 = [v14 indexPath];
      unsigned __int8 v6 = [v5 isEqual:v17->_volumeSliderIndexPath];

      if ((v6 & 1) != 0) {
        [v14 setCellState:2];
      }
      else {
        [v14 setCellState:v17->_volumeSliderIndexPath == 0];
      }
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v4 = v16[0];
  objc_storeStrong(v16, 0LL);
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v7.receiver = v10;
  v7.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayout;
  id v8 =  -[TVNPRoutingRoutesCollectionViewLayout layoutAttributesForItemAtIndexPath:]( &v7,  "layoutAttributesForItemAtIndexPath:",  location[0]);
  id v5 = [v8 indexPath];
  unsigned __int8 v6 = [v5 isEqual:v10->_volumeSliderIndexPath];

  if ((v6 & 1) != 0) {
    [v8 setCellState:2];
  }
  else {
    [v8 setCellState:v10->_volumeSliderIndexPath == 0];
  }
  id v4 = v8;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (double)topGradientHeight
{
  return self->_topGradientHeight;
}

- (void)setTopGradientHeight:(double)a3
{
  self->_topGradientHeight = a3;
}

- (double)bottomGradientHeight
{
  return self->_bottomGradientHeight;
}

- (void)setBottomGradientHeight:(double)a3
{
  self->_bottomGradientHeight = a3;
}

- (NSIndexPath)volumeSliderIndexPath
{
  return self->_volumeSliderIndexPath;
}

- (void)setVolumeSliderIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end