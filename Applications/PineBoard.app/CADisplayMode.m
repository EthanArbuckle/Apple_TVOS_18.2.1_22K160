@interface CADisplayMode
- (id)description;
- (int64_t)pb_aspectRatio;
- (void)pb_saveAsPreferred;
@end

@implementation CADisplayMode

- (int64_t)pb_aspectRatio
{
  return PBSCalculateAspectRatio(-[CADisplayMode width](self, "width"), -[CADisplayMode height](self, "height"));
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  else {
    v4 = "non-virtual";
  }
  id v5 = -[CADisplayMode width](self, "width");
  id v6 = -[CADisplayMode height](self, "height");
  -[CADisplayMode refreshRate](self, "refreshRate");
  uint64_t v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplayMode colorMode](self, "colorMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplayMode hdrMode](self, "hdrMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplayMode colorGamut](self, "colorGamut"));
  uint64_t v12 = PBSAspectRatioDescription(-[CADisplayMode pb_aspectRatio](self, "pb_aspectRatio"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"\t<CADisplayMode %p>{ %s  %zu x %zu %.02f Hz  colorMode>%@ hdrMode>%@ gamut>%@ aspect>%@ scale>%lu }",  self,  v4,  v5,  v6,  v8,  v9,  v10,  v11,  v13,  -[CADisplayMode preferredScale](self, "preferredScale"));

  return v14;
}

- (void)pb_saveAsPreferred
{
}

@end