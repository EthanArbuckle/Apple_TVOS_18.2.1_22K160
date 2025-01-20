@interface TVPVibrantLabel
- (TVPVibrantLabel)initWithFrame:(CGRect)a3;
- (void)_updateTextLabelAppearance;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPVibrantLabel

- (TVPVibrantLabel)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPVibrantLabel;
  v3 = -[TVPVibrantLabel initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel layer](v3, "layer"));
    [v5 setAllowsGroupOpacity:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel layer](v4, "layer"));
    [v6 setAllowsGroupBlending:0];

    -[TVPVibrantLabel _updateTextLabelAppearance](v4, "_updateTextLabelAppearance");
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPVibrantLabel;
  id v4 = a3;
  -[TVPVibrantLabel traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel traitCollection](self, "traitCollection"));
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    -[TVPVibrantLabel _updateTextLabelAppearance](self, "_updateTextLabelAppearance");
  }
}

- (void)_updateTextLabelAppearance
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVibrantLabel traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  id v5 = &kCAFilterPlusD;
  if (v4 == (id)2) {
    id v5 = &kCAFilterPlusL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v5));
  [v7 setCompositingFilter:v6];
}

@end