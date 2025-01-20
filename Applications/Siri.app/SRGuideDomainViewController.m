@interface SRGuideDomainViewController
- (BOOL)_showsCategoriesForSection:(unint64_t)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)usePlatterStyle;
- (BOOL)wantsToManageBackgroundColor;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)headerViewClass;
- (SRGuideDomainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIEdgeInsets)_headerViewEdgeInsets;
- (double)desiredHeightForHeaderView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_phraseForIndexPath:(id)a3;
- (id)_titleForSection:(unint64_t)a3;
- (id)_utterancesForSection:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)_cellTypeForIndexPath:(id)a3;
- (int64_t)_numberOfSections;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)configureReusableHeaderView:(id)a3;
- (void)loadView;
- (void)setSnippet:(id)a3;
@end

@implementation SRGuideDomainViewController

- (SRGuideDomainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SRGuideDomainViewController;
  v4 = -[SRGuideDomainViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4) {
    -[SRGuideDomainViewController setDefaultViewInsets:]( v4,  "setDefaultViewInsets:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
  }
  return v5;
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SRGuideDomainViewController;
  -[SRGuideDomainViewController loadView](&v24, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController collectionView](self, "collectionView"));
  *(void *)&double v5 = objc_opt_class(0x1000D5000LL, v4).n128_u64[0];
  uint64_t v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SRGuideDetailSectionHeaderCollectionViewCell reuseIdentifier]( &OBJC_CLASS___SRGuideDetailSectionHeaderCollectionViewCell,  "reuseIdentifier",  v5));
  [v3 registerClass:v7 forCellWithReuseIdentifier:v8];

  *(void *)&double v10 = objc_opt_class(&OBJC_CLASS___SRGuideDetailPhraseViewCell, v9).n128_u64[0];
  uint64_t v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SRGuideDetailPhraseViewCell reuseIdentifier]( &OBJC_CLASS___SRGuideDetailPhraseViewCell,  "reuseIdentifier",  v10));
  [v3 registerClass:v12 forCellWithReuseIdentifier:v13];

  *(void *)&double v15 = objc_opt_class(&OBJC_CLASS___SiriUIContentCollectionViewCell, v14).n128_u64[0];
  uint64_t v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUIContentCollectionViewCell reuseIdentifier]( &OBJC_CLASS___SiriUIContentCollectionViewCell,  "reuseIdentifier",  v15));
  [v3 registerClass:v17 forCellWithReuseIdentifier:v18];

  *(void *)&double v20 = objc_opt_class(&OBJC_CLASS___SRGuideViewHeader, v19).n128_u64[0];
  uint64_t v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewHeader reuseIdentifier](&OBJC_CLASS___SRGuideViewHeader, "reuseIdentifier", v20));
  [v3 registerClass:v22 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v23];
}

- (Class)headerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___SRGuideViewHeader, a2);
}

- (void)configureReusableHeaderView:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domainDisplayName]);
  [v6 setTitle:v5];

  -[SRGuideDomainViewController _headerViewEdgeInsets](self, "_headerViewEdgeInsets");
  objc_msgSend(v6, "setEdgeInsets:");
}

- (double)desiredHeightForHeaderView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController delegate](self, "delegate"));
  [v3 siriViewControllerExpectedWidth:self];
  double v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domainDisplayName]);
  -[SRGuideDomainViewController _headerViewEdgeInsets](self, "_headerViewEdgeInsets");
  +[SRGuideViewHeader sizeThatFits:text:edgeInsets:]( &OBJC_CLASS___SRGuideViewHeader,  "sizeThatFits:text:edgeInsets:",  v7,  v5,  1.79769313e308,  v8,  v9,  v10,  v11);
  double v13 = v12;

  return v13;
}

- (int64_t)_cellTypeForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 item]) {
    goto LABEL_2;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 guideSections]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sectionName]);
  id v10 = [v9 length];

  if (!v10) {
LABEL_2:
  }
    int64_t v5 = 1LL;
  else {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (UIEdgeInsets)_headerViewEdgeInsets
{
  double v2 = SiriUIPlatterStyle[32];
  double v3 = SiriUIPlatterStyle[34];
  double v4 = 3.5;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (int64_t)_numberOfSections
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 guideSections]);
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (id)_utterancesForSection:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 guideSections]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 guideUtterances]);
  return v7;
}

- (double)desiredHeightForWidth:(double)a3
{
  if (-[SRGuideDomainViewController _numberOfSections](self, "_numberOfSections") < 1) {
    return 0.0;
  }
  uint64_t v5 = 0LL;
  double v6 = 0.0;
  do
  {
    if (-[SRGuideDomainViewController _showsCategoriesForSection:](self, "_showsCategoriesForSection:", v5))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 guideSections]);
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v5]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sectionName]);
      +[SRGuideDetailSectionHeaderCollectionViewCell sizeThatFits:text:]( &OBJC_CLASS___SRGuideDetailSectionHeaderCollectionViewCell,  "sizeThatFits:text:",  v10,  a3,  1.79769313e308);
      double v6 = v6 + v11;
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _utterancesForSection:](self, "_utterancesForSection:", v5));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          +[SRGuideDetailPhraseViewCell sizeThatFits:text:]( &OBJC_CLASS___SRGuideDetailPhraseViewCell,  "sizeThatFits:text:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i),  a3,  1.79769313e308);
          double v6 = v6 + v17;
        }

        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v14);
    }

    ++v5;
  }

  while (v5 < -[SRGuideDomainViewController _numberOfSections](self, "_numberOfSections"));
  return v6;
}

- (BOOL)wantsToManageBackgroundColor
{
  return 1;
}

- (BOOL)usePlatterStyle
{
  return 0;
}

- (id)_titleForSection:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 guideSections]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sectionName]);
  return v7;
}

- (BOOL)_showsCategoriesForSection:(unint64_t)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _titleForSection:](self, "_titleForSection:", a3));
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)_phraseForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (char *)[v4 item];
  double v6 = &v5[--[SRGuideDomainViewController _showsCategoriesForSection:]( self,  "_showsCategoriesForSection:",  [v4 section])];
  id v7 = [v4 section];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _utterancesForSection:](self, "_utterancesForSection:", v7));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v6]);

  return v9;
}

- (void)setSnippet:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SRGuideDomainViewController;
  -[SRGuideDomainViewController setSnippet:](&v5, "setSnippet:", a3);
  if (-[SRGuideDomainViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController collectionView](self, "collectionView"));
    [v4 reloadData];
  }

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewHeader reuseIdentifier](&OBJC_CLASS___SRGuideViewHeader, "reuseIdentifier"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v8 forIndexPath:v6]);

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _utterancesForSection:](self, "_utterancesForSection:", a4));
  id v7 = [v6 count];

  return (int64_t)v7
       + -[SRGuideDomainViewController _showsCategoriesForSection:](self, "_showsCategoriesForSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[SRGuideDomainViewController _cellTypeForIndexPath:](self, "_cellTypeForIndexPath:", v7);
  if (v8 == 1)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SRGuideDetailPhraseViewCell reuseIdentifier]( &OBJC_CLASS___SRGuideDetailPhraseViewCell,  "reuseIdentifier"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _phraseForIndexPath:](self, "_phraseForIndexPath:", v7));
    [v10 setText:v13];
  }

  else
  {
    if (v8)
    {
      id v10 = 0LL;
      goto LABEL_7;
    }

    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SRGuideDetailSectionHeaderCollectionViewCell reuseIdentifier]( &OBJC_CLASS___SRGuideDetailSectionHeaderCollectionViewCell,  "reuseIdentifier"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7]);

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 guideSections]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sectionName]);
    [v10 setText:v14];
  }

LABEL_7:
  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  int64_t v7 = -[SRGuideDomainViewController _cellTypeForIndexPath:](self, "_cellTypeForIndexPath:", v6);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController delegate](self, "delegate"));
  [v8 siriViewControllerExpectedWidth:self];
  double v10 = v9;

  if (v7 == 1)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _phraseForIndexPath:](self, "_phraseForIndexPath:", v6));
    +[SRGuideDetailPhraseViewCell sizeThatFits:text:]( &OBJC_CLASS___SRGuideDetailPhraseViewCell,  "sizeThatFits:text:",  v13,  v10,  1.79769313e308);
    CGFloat height = v17;
  }

  else
  {
    if (v7)
    {
      CGFloat height = CGSizeZero.height;
      goto LABEL_7;
    }

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 guideSections]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sectionName]);
    +[SRGuideDetailSectionHeaderCollectionViewCell sizeThatFits:text:]( &OBJC_CLASS___SRGuideDetailSectionHeaderCollectionViewCell,  "sizeThatFits:text:",  v14,  v10,  1.79769313e308);
    CGFloat height = v15;
  }

LABEL_7:
  double v18 = v10;
  double v19 = height;
  result.CGFloat height = v19;
  result.width = v18;
  return result;
}

@end