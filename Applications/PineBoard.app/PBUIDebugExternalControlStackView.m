@interface PBUIDebugExternalControlStackView
- (CGSize)intrinsicContentSize;
- (NSString)activeSourceState;
- (NSString)muteDebugDescription;
- (NSString)powerDebugDescription;
- (NSString)volumeButtonBehaviorString;
- (NSString)volumeDebugDescription;
- (PBUIDebugExternalControlStackView)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (void)_updateLabel;
- (void)setMuteDebugDescription:(id)a3;
- (void)setPowerDebugDescription:(id)a3;
- (void)setPowerFeatureTransport:(int64_t)a3 isActiveSource:(BOOL)a4;
- (void)setVolumeButtonBehavior:(int64_t)a3;
- (void)setVolumeDebugDescription:(id)a3;
@end

@implementation PBUIDebugExternalControlStackView

- (PBUIDebugExternalControlStackView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBUIDebugExternalControlStackView;
  v3 = -[PBUIDebugExternalControlStackView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBUIDebugExternalControlStackView setAxis:](v3, "setAxis:", 1LL);
    -[PBUIDebugExternalControlStackView setAlignment:](v4, "setAlignment:", 1LL);
    -[PBUIDebugExternalControlStackView setDistribution:](v4, "setDistribution:", 1LL);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UILabel pb_debugLabel](&OBJC_CLASS___UILabel, "pb_debugLabel"));
    label = v4->_label;
    v4->_label = (UILabel *)v5;

    v7 = v4->_label;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor"));
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    -[PBUIDebugExternalControlStackView addArrangedSubview:](v4, "addArrangedSubview:", v4->_label);
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = 400.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)setPowerFeatureTransport:(int64_t)a3 isActiveSource:(BOOL)a4
{
  uint64_t v5 = @"❌";
  if (a4) {
    uint64_t v5 = @"✅";
  }
  if (a3 == 1) {
    v6 = (__CFString *)v5;
  }
  else {
    v6 = @"⌧";
  }
  objc_storeStrong((id *)&self->_activeSourceState, v6);
  -[PBUIDebugExternalControlStackView _updateLabel](self, "_updateLabel");
}

- (void)setPowerDebugDescription:(id)a3
{
  v4 = (NSString *)[a3 copy];
  powerDebugDescription = self->_powerDebugDescription;
  self->_powerDebugDescription = v4;

  -[PBUIDebugExternalControlStackView _updateLabel](self, "_updateLabel");
}

- (void)setVolumeDebugDescription:(id)a3
{
  v4 = (NSString *)[a3 copy];
  volumeDebugDescription = self->_volumeDebugDescription;
  self->_volumeDebugDescription = v4;

  -[PBUIDebugExternalControlStackView _updateLabel](self, "_updateLabel");
}

- (void)setMuteDebugDescription:(id)a3
{
  v4 = (NSString *)[a3 copy];
  muteDebugDescription = self->_muteDebugDescription;
  self->_muteDebugDescription = v4;

  -[PBUIDebugExternalControlStackView _updateLabel](self, "_updateLabel");
}

- (void)setVolumeButtonBehavior:(int64_t)a3
{
  else {
    v4 = *(&off_1003DD318 + a3);
  }
  volumeButtonBehaviorString = self->_volumeButtonBehaviorString;
  self->_volumeButtonBehaviorString = &v4->isa;

  -[PBUIDebugExternalControlStackView _updateLabel](self, "_updateLabel");
}

- (void)_updateLabel
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"🖥:%@ 🔌:%@ 🔉:%@ 🔇:%@ 🚦:%@",  self->_activeSourceState,  self->_powerDebugDescription,  self->_volumeDebugDescription,  self->_muteDebugDescription,  self->_volumeButtonBehaviorString));
  -[UILabel setText:](self->_label, "setText:", v3);
}

- (UILabel)label
{
  return self->_label;
}

- (NSString)activeSourceState
{
  return self->_activeSourceState;
}

- (NSString)powerDebugDescription
{
  return self->_powerDebugDescription;
}

- (NSString)volumeDebugDescription
{
  return self->_volumeDebugDescription;
}

- (NSString)muteDebugDescription
{
  return self->_muteDebugDescription;
}

- (NSString)volumeButtonBehaviorString
{
  return self->_volumeButtonBehaviorString;
}

- (void).cxx_destruct
{
}

@end