@interface MTTVPodcastCollectionViewCell
- (BOOL)dark;
- (void)loadImageForKey:(id)a3;
- (void)setDark:(BOOL)a3;
@end

@implementation MTTVPodcastCollectionViewCell

- (void)loadImageForKey:(id)a3
{
  id v4 = a3;
  -[MTTVArtworkBaseCollectionViewCell setImageKey:](self, "setImageKey:", v4);
  objc_initWeak(&location, self);
  [(id)objc_opt_class(self) artworkSize];
  double v6 = v5;
  double v8 = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006F080;
  v9[3] = &unk_100242548;
  objc_copyWeak(&v10, &location);
  +[MTPodcast fetchArtworkForPodcastUuid:size:completion:]( &OBJC_CLASS___MTPodcast,  "fetchArtworkForPodcastUuid:size:completion:",  v4,  v9,  v6,  v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)dark
{
  return self->_dark;
}

- (void)setDark:(BOOL)a3
{
  self->_dark = a3;
}

@end