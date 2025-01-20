@interface TVMusicNowPlayingContentConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicit;
- (BOOL)isFocusable;
- (BOOL)isFocused;
- (BOOL)isHighlighted;
- (BOOL)isPlaying;
- (BOOL)showsFocusEffects;
- (BOOL)showsMetadata;
- (CGSize)contentSize;
- (MPArtworkCatalog)artworkCatalog;
- (MPCPlayerResponseParticipant)enqueuingParticipant;
- (NSString)expandedSubtitle;
- (NSString)subtitle;
- (NSString)title;
- (TVMNowPlayingMotionArtwork)motionArtwork;
- (TVMusicNowPlayingContentConfiguration)init;
- (UIImage)placeholderImage;
- (UIView)videoView;
- (id)copy;
- (id)makeContentView;
- (void)setArtworkCatalog:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setEnqueuingParticipant:(id)a3;
- (void)setExpandedSubtitle:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsFocusable:(BOOL)a3;
- (void)setIsFocused:(BOOL)a3;
- (void)setIsHighlighted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setMotionArtwork:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setShowsFocusEffects:(BOOL)a3;
- (void)setShowsMetadata:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVideoView:(id)a3;
@end

@implementation TVMusicNowPlayingContentConfiguration

- (BOOL)isPlaying
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isPlaying);
}

- (void)setIsPlaying:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isPlaying) = a3;
}

- (BOOL)showsMetadata
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_showsMetadata);
}

- (void)setShowsMetadata:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_showsMetadata) = a3;
}

- (NSString)title
{
  return (NSString *)sub_1000FA3B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TVMusicNowPlayingContentConfiguration_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_1000FA3B0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVMusicNowPlayingContentConfiguration_subtitle);
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)expandedSubtitle
{
  return (NSString *)sub_1000FA3B0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVMusicNowPlayingContentConfiguration_expandedSubtitle);
}

- (void)setExpandedSubtitle:(id)a3
{
}

- (UIView)videoView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_videoView));
}

- (void)setVideoView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_videoView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_videoView) = (Class)a3;
  id v3 = a3;
}

- (MPArtworkCatalog)artworkCatalog
{
  return (MPArtworkCatalog *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_artworkCatalog));
}

- (void)setArtworkCatalog:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_artworkCatalog);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_artworkCatalog) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isExplicit
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isExplicit);
}

- (void)setIsExplicit:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isExplicit) = a3;
}

- (UIImage)placeholderImage
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_placeholderImage));
}

- (void)setPlaceholderImage:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_placeholderImage);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_placeholderImage) = (Class)a3;
  id v3 = a3;
}

- (CGSize)contentSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_contentSize);
  double v3 = *(double *)&self->isPlaying[OBJC_IVAR___TVMusicNowPlayingContentConfiguration_contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_contentSize) = a3;
}

- (BOOL)isFocused
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isFocused);
}

- (void)setIsFocused:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isFocused) = a3;
}

- (BOOL)isHighlighted
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isHighlighted);
}

- (void)setIsHighlighted:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isHighlighted) = a3;
}

- (BOOL)isFocusable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isFocusable);
}

- (void)setIsFocusable:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isFocusable) = a3;
}

- (BOOL)showsFocusEffects
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_showsFocusEffects);
}

- (void)setShowsFocusEffects:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_showsFocusEffects) = a3;
}

- (TVMNowPlayingMotionArtwork)motionArtwork
{
  return (TVMNowPlayingMotionArtwork *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_motionArtwork));
}

- (void)setMotionArtwork:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_motionArtwork);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_motionArtwork) = (Class)a3;
  id v3 = a3;
}

- (MPCPlayerResponseParticipant)enqueuingParticipant
{
  return (MPCPlayerResponseParticipant *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_enqueuingParticipant));
}

- (void)setEnqueuingParticipant:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_enqueuingParticipant);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_enqueuingParticipant) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }

  char v7 = sub_1000FA67C((uint64_t)v9);

  sub_1000F3754((uint64_t)v9);
  return v7 & 1;
}

- (id)copy
{
  double v2 = self;
  sub_1000FAB48(v7);

  uint64_t v3 = v8;
  id v4 = sub_1000E0518(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_1000E053C(v7);
  return v5;
}

- (TVMusicNowPlayingContentConfiguration)init
{
  return (TVMusicNowPlayingContentConfiguration *)sub_1000FADD4();
}

- (void).cxx_destruct
{
}

- (id)makeContentView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for NowPlayingContentView());
  sub_1000FC2B8(self);
  return v4;
}

@end