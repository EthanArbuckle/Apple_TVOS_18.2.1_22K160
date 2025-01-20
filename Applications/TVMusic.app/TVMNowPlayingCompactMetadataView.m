@interface TVMNowPlayingCompactMetadataView
- (BOOL)isExplicit;
- (NSLayoutYAxisAnchor)lastBaselineAnchor;
- (TVMNowPlayingCompactMetadataView)initWithCoder:(id)a3;
- (TVMNowPlayingCompactMetadataView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)resumeAnimatingMusicBars;
- (void)setIsExplicit:(BOOL)a3;
- (void)stopAnimatingMusicBars;
@end

@implementation TVMNowPlayingCompactMetadataView

- (UIImageView)imageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR___TVMNowPlayingCompactMetadataView_imageView));
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___TVMNowPlayingCompactMetadataView_titleLabel));
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___TVMNowPlayingCompactMetadataView_subtitleLabel));
}

- (BOOL)isExplicit
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___TVMNowPlayingCompactMetadataView_isExplicit);
}

- (void)setIsExplicit:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___TVMNowPlayingCompactMetadataView_isExplicit) = a3;
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMNowPlayingCompactMetadataView_explicitTag) setHidden:!a3];
}

- (TVMNowPlayingCompactMetadataView)initWithFrame:(CGRect)a3
{
  return (TVMNowPlayingCompactMetadataView *)sub_1000F5D48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMNowPlayingCompactMetadataView_subtitleLabel) lastBaselineAnchor];
}

- (TVMNowPlayingCompactMetadataView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000F688C();
}

  ;
}

- (void)resumeAnimatingMusicBars
{
}

- (void)stopAnimatingMusicBars
{
}

- (void).cxx_destruct
{
}

@end