@interface TVHKMediaLibrary
- (BOOL)tvh_shouldDisplayWideMovieCoverArt;
- (BOOL)tvh_shouldDisplayWideShowCoverArt;
- (unint64_t)tvh_coverArtShapeForMediaCategoryType:(unint64_t)a3;
- (unint64_t)tvh_coverArtShapeForMediaEntityType:(id)a3;
- (unint64_t)tvh_playlistCoverArtShapeForPlaylistItemMediaCategoryType:(unint64_t)a3;
@end

@implementation TVHKMediaLibrary

- (BOOL)tvh_shouldDisplayWideMovieCoverArt
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movie](&OBJC_CLASS___TVHKMediaEntityType, "movie"));
  LOBYTE(self) = (id)-[TVHKMediaLibrary tvh_coverArtShapeForMediaEntityType:]( self,  "tvh_coverArtShapeForMediaEntityType:",  v3) == (id)2;

  return (char)self;
}

- (BOOL)tvh_shouldDisplayWideShowCoverArt
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType show](&OBJC_CLASS___TVHKMediaEntityType, "show"));
  LOBYTE(self) = (id)-[TVHKMediaLibrary tvh_coverArtShapeForMediaEntityType:]( self,  "tvh_coverArtShapeForMediaEntityType:",  v3) == (id)2;

  return (char)self;
}

- (unint64_t)tvh_coverArtShapeForMediaEntityType:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType playlist](&OBJC_CLASS___TVHKMediaEntityType, "playlist"));

  if (v5 == v4) {
    unint64_t v6 = 0LL;
  }
  else {
    unint64_t v6 = -[TVHKMediaLibrary tvh_coverArtShapeForMediaCategoryType:]( self,  "tvh_coverArtShapeForMediaCategoryType:",  [v4 mediaCategoryType]);
  }

  return v6;
}

- (unint64_t)tvh_coverArtShapeForMediaCategoryType:(unint64_t)a3
{
  if (a3 > 9) {
    return 2LL;
  }
  if (((1LL << a3) & 0x3C2) == 0)
  {
    if (((1LL << a3) & 0x2C) != 0)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
      id v6 = [v5 movieCoverArtShape];
      if (v6) {
        BOOL v7 = v6 == (id)2;
      }
      else {
        BOOL v7 = 1;
      }
      if (v7)
      {
        else {
          unint64_t v3 = 1LL;
        }
      }

      else if (v6 == (id)1)
      {
        unint64_t v3 = 1LL;
      }

      else
      {
        unint64_t v3 = 2LL;
      }

- (unint64_t)tvh_playlistCoverArtShapeForPlaylistItemMediaCategoryType:(unint64_t)a3
{
  if (a3 == 4)
  {
    if (-[TVHKMediaLibrary tvh_shouldDisplayWideShowCoverArt](self, "tvh_shouldDisplayWideShowCoverArt")) {
      return 2LL;
    }
  }

  else if (a3 == 3 {
         && -[TVHKMediaLibrary tvh_shouldDisplayWideMovieCoverArt](self, "tvh_shouldDisplayWideMovieCoverArt"))
  }
  {
    return 2LL;
  }

  return 0LL;
}

@end