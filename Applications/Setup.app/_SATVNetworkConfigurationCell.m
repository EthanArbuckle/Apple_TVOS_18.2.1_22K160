@interface _SATVNetworkConfigurationCell
- (BOOL)isEnabled;
- (_SATVNetworkConfigurationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setEnabled:(BOOL)a3;
@end

@implementation _SATVNetworkConfigurationCell

- (_SATVNetworkConfigurationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____SATVNetworkConfigurationCell;
  v4 = -[_SATVNetworkConfigurationCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", 2LL, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVNetworkConfigurationCell textLabel](v4, "textLabel"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 textColor]);
    defaultTextLabelColor = v5->_defaultTextLabelColor;
    v5->_defaultTextLabelColor = (UIColor *)v7;

    v5->_enabled = 1;
  }

  return v5;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3) {
      defaultTextLabelColor = self->_defaultTextLabelColor;
    }
    else {
      defaultTextLabelColor = (UIColor *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_opacityCDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_opacityCDynamicColor"));
    }
    uint64_t v7 = defaultTextLabelColor;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVNetworkConfigurationCell textLabel](self, "textLabel"));
    [v6 setTextColor:v7];

    if (!a3) {
  }
    }

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end