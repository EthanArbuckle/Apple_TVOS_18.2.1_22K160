@interface TVSettingsSignalStrengthCell
- (TVSettingsSignalStrengthCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)signalStrengthAccessoryView;
- (float)signalStrength;
- (void)prepareForReuse;
- (void)setSignalStrength:(float)a3;
- (void)setSignalStrengthAccessoryView:(id)a3;
@end

@implementation TVSettingsSignalStrengthCell

- (TVSettingsSignalStrengthCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsSignalStrengthCell;
  v4 = -[TVSettingsSignalStrengthCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    signalStrengthAccessoryView = v4->_signalStrengthAccessoryView;
    v4->_signalStrengthAccessoryView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v4->_signalStrengthAccessoryView, "layer"));
    objc_msgSend(v7, "setContentsRect:", 0.0, 0.2, 0.93, 1.0);

    v8 = v4->_signalStrengthAccessoryView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.4, 1.0));
    -[UIImageView setTintColor:](v8, "setTintColor:", v9);

    -[TVSettingsSignalStrengthCell setAccessoryView:](v4, "setAccessoryView:", v4->_signalStrengthAccessoryView);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIBackgroundConfiguration clearConfiguration]( &OBJC_CLASS___UIBackgroundConfiguration,  "clearConfiguration"));
    -[TVSettingsSignalStrengthCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v10);
  }

  return v4;
}

- (void)setSignalStrength:(float)a3
{
  self->_signalStrength = a3;
  signalStrengthAccessoryView = self->_signalStrengthAccessoryView;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUtilities imageForSignalStrength:]( &OBJC_CLASS___TVSettingsUtilities,  "imageForSignalStrength:"));
  -[UIImageView setImage:](signalStrengthAccessoryView, "setImage:", v5);

  -[UIImageView frame](self->_signalStrengthAccessoryView, "frame");
  double v7 = v6;
  double v9 = v8;
  -[UIImageView sizeThatFits:](self->_signalStrengthAccessoryView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  -[UIImageView setFrame:](self->_signalStrengthAccessoryView, "setFrame:", v7, v9, v10, v11);
  uint64_t v12 = TSKLocString(@"SignalStrengthAccessibilityValueFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v13,  (uint64_t)self->_signalStrength,  5LL));

  -[TVSettingsSignalStrengthCell setAccessibilityValue:](self, "setAccessibilityValue:", v14);
  -[TVSettingsSignalStrengthCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsSignalStrengthCell;
  -[TVSettingsSignalStrengthCell prepareForReuse](&v3, "prepareForReuse");
  -[TVSettingsSignalStrengthCell setAccessoryView:](self, "setAccessoryView:", self->_signalStrengthAccessoryView);
}

- (float)signalStrength
{
  return self->_signalStrength;
}

- (UIImageView)signalStrengthAccessoryView
{
  return self->_signalStrengthAccessoryView;
}

- (void)setSignalStrengthAccessoryView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end