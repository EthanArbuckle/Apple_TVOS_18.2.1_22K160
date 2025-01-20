@interface TVHShelfLayoutHelper
- (CGRect)frameForItemAtIndexPath:(id)a3;
- (TVHShelfLayoutHelper)initWithShelfViewLayout:(id)a3;
- (TVHShelfViewLayout)shelfViewLayout;
- (double)tallestItemHeight;
- (void)_cleanupBuffers;
- (void)_compute;
- (void)dealloc;
@end

@implementation TVHShelfLayoutHelper

- (TVHShelfLayoutHelper)initWithShelfViewLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHShelfLayoutHelper;
  v5 = -[TVHShelfLayoutHelper init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shelfViewLayout, v4);
    -[TVHShelfLayoutHelper _compute](v6, "_compute");
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHShelfLayoutHelper;
  -[TVHShelfLayoutHelper dealloc](&v3, "dealloc");
}

- (CGRect)frameForItemAtIndexPath:(id)a3
{
  if (self->_itemFrames)
  {
    id v4 = a3;
    unint64_t v5 = self->_sectionOffsets[(void)[v4 section]];
    id v6 = [v4 item];

    v7 = &self->_itemFrames[(void)((void)v6 + v5)];
  }

  else
  {
    v7 = &CGRectZero;
  }

  double width = v7->size.width;
  double height = v7->size.height;
  double x = v7->origin.x;
  double y = v7->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_compute
{
  v2 = self;
  id v39 = (id)objc_claimAutoreleasedReturnValue(-[TVHShelfLayoutHelper shelfViewLayout](self, "shelfViewLayout"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v39 collectionView]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSource]);
  if ((objc_opt_respondsToSelector(v4, "numberOfSectionsInCollectionView:") & 1) != 0) {
    uint64_t v5 = (uint64_t)[v4 numberOfSectionsInCollectionView:v3];
  }
  else {
    uint64_t v5 = 1LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
  else {
    v7 = 0LL;
  }

  char v8 = objc_opt_respondsToSelector(v7, "collectionView:layout:sizeForItemAtIndexPath:");
  [v39 itemSize];
  double v10 = v9;
  double v12 = v11;
  [v39 minimumInteritemSpacing];
  double v14 = v13;
  v15 = (unint64_t *)calloc(v5 + 1, 8uLL);
  if (v5)
  {
    size_t v16 = 0LL;
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      id v18 = [v4 collectionView:v3 numberOfItemsInSection:i];
      v15[i] = v16;
      v16 += (size_t)v18;
    }

    v15[v5] = v16;
    double v19 = 0.0;
    if (v16)
    {
      v36 = v2;
      v37 = (CGRect *)calloc(v16, 0x20uLL);
      uint64_t v38 = v5;
      uint64_t v20 = 0LL;
      p_double x = &v37->origin.x;
      do
      {
        v22 = v4;
        v23 = (char *)[v4 collectionView:v3 numberOfItemsInSection:v20];
        if (v23)
        {
          v24 = v23;
          for (j = 0LL; j != v24; ++j)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  j,  v20));
            double v27 = v10;
            double v28 = v12;
            if ((v8 & 1) != 0) {
              objc_msgSend(v7, "collectionView:layout:sizeForItemAtIndexPath:", v3, v39, v26, v10, v12);
            }
            p_x[2] = v27;
            p_x[3] = v28;
            double v19 = fmax(v19, v28);
            p_x += 4;
          }
        }

        ++v20;
        id v4 = v22;
      }

      while (v20 != v38);
      uint64_t v29 = 0LL;
      double v30 = 0.0;
      v2 = v36;
      do
      {
        v31 = (char *)[v22 collectionView:v3 numberOfItemsInSection:v29];
        if (v31)
        {
          p_double height = &v37[v15[v29]].size.height;
          do
          {
            double v33 = *(p_height - 1);
            double v34 = floor(v19 - *p_height) * 0.5;
            *(p_height - 3) = v30;
            *(p_height - 2) = v34;
            double v30 = v14 + v30 + v33;
            p_height += 4;
            --v31;
          }

          while (v31);
        }

        ++v29;
      }

      while (v29 != v38);
      v35 = v37;
    }

    else
    {
      v35 = 0LL;
    }
  }

  else
  {
    v35 = 0LL;
    unint64_t *v15 = 0LL;
    double v19 = 0.0;
  }

  v2->_tallestItemHeight = v19;
  v2->_itemFrames = v35;
  v2->_sectionOffsets = v15;
}

- (void)_cleanupBuffers
{
  self->_sectionOffsets = 0LL;
  free(self->_itemFrames);
  self->_itemFrames = 0LL;
}

- (TVHShelfViewLayout)shelfViewLayout
{
  return (TVHShelfViewLayout *)objc_loadWeakRetained((id *)&self->_shelfViewLayout);
}

- (double)tallestItemHeight
{
  return self->_tallestItemHeight;
}

- (void).cxx_destruct
{
}

@end