@interface MTTVPodcastDetailsSectionControl
- (BOOL)deletePlayedEpisodes;
- (MTTVPodcastDetailsSectionControl)init;
- (id)_titleForFirstSegment;
- (void)configureSegments;
- (void)setDeletePlayedEpisodes:(BOOL)a3;
@end

@implementation MTTVPodcastDetailsSectionControl

- (MTTVPodcastDetailsSectionControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVPodcastDetailsSectionControl;
  v2 = -[MTTVPodcastDetailsSectionControl init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MTTVPodcastDetailsSectionControl configureSegments](v2, "configureSegments");
  }
  return v3;
}

- (void)configureSegments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailsSectionControl _titleForFirstSegment](self, "_titleForFirstSegment"));
  -[MTTVPodcastDetailsSectionControl insertSegmentWithTitle:atIndex:animated:]( self,  "insertSegmentWithTitle:atIndex:animated:",  v3,  0LL,  0LL);

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Feed" value:&stru_100248948 table:0]);
  -[MTTVPodcastDetailsSectionControl insertSegmentWithTitle:atIndex:animated:]( self,  "insertSegmentWithTitle:atIndex:animated:",  v4,  1LL,  0LL);
}

- (void)setDeletePlayedEpisodes:(BOOL)a3
{
  if (self->_deletePlayedEpisodes != a3)
  {
    self->_deletePlayedEpisodes = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailsSectionControl _titleForFirstSegment](self, "_titleForFirstSegment"));
    -[MTTVPodcastDetailsSectionControl setTitle:forSegmentAtIndex:](self, "setTitle:forSegmentAtIndex:", v4, 0LL);
  }

- (id)_titleForFirstSegment
{
  unsigned int v2 = -[MTTVPodcastDetailsSectionControl deletePlayedEpisodes](self, "deletePlayedEpisodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = v3;
  if (v2) {
    id v5 = @"EPISODE_UNPLAYED_TITLE";
  }
  else {
    id v5 = @"My Episodes";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:&stru_100248948 table:0]);

  return v6;
}

- (BOOL)deletePlayedEpisodes
{
  return self->_deletePlayedEpisodes;
}

@end