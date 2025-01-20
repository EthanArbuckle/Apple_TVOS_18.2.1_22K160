@interface MTTVPodcastDescriptionViewController
- (MTPodcast)podcast;
- (MTTVPodcastDescriptionViewController)initWithPodcast:(id)a3;
- (void)setPodcast:(id)a3;
@end

@implementation MTTVPodcastDescriptionViewController

- (MTTVPodcastDescriptionViewController)initWithPodcast:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVPodcastDescriptionViewController;
  v5 = -[IMTVScrollingTextViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTVPodcastDescriptionViewController setPodcast:](v5, "setPodcast:", v4);
  }

  return v6;
}

- (void)setPodcast:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
  -[IMTVScrollingTextViewController setTitleText:](self, "setTitleText:", v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 bestDescription]);
  -[IMTVScrollingTextViewController setDescriptionText:](self, "setDescriptionText:", v7);
}

- (MTPodcast)podcast
{
  return self->_podcast;
}

- (void).cxx_destruct
{
}

@end