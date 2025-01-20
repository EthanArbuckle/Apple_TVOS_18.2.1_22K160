@interface MTTVPodcastFlowLayout
- (MTTVPodcastFlowLayout)init;
@end

@implementation MTTVPodcastFlowLayout

- (MTTVPodcastFlowLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastFlowLayout;
  v2 = -[MTTVPodcastFlowLayout init](&v4, "init");
  if (v2)
  {
    +[MTTVArtworkBaseCollectionViewCell itemSize](&OBJC_CLASS___MTTVArtworkBaseCollectionViewCell, "itemSize");
    -[MTTVPodcastFlowLayout setItemSize:](v2, "setItemSize:");
    -[MTTVPodcastFlowLayout setMinimumInteritemSpacing:](v2, "setMinimumInteritemSpacing:", 38.0);
    -[MTTVPodcastFlowLayout setMinimumLineSpacing:](v2, "setMinimumLineSpacing:", 35.0 + 20.0);
    -[MTTVPodcastFlowLayout setSectionInset:](v2, "setSectionInset:", 0.0, 0.0, 35.0 + 20.0, 64.0);
  }

  return v2;
}

@end