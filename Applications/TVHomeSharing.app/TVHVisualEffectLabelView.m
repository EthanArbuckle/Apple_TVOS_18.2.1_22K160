@interface TVHVisualEffectLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)label;
- (void)_addIdleModeLayoutAttributes;
- (void)layoutSubviews;
- (void)setLabel:(id)a3;
@end

@implementation TVHVisualEffectLabelView

- (UILabel)label
{
  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v5 = self->_label;
    self->_label = v4;

    -[TVHVisualEffectLabelView _addIdleModeLayoutAttributes](self, "_addIdleModeLayoutAttributes");
    label = self->_label;
  }

  return label;
}

- (void)setLabel:(id)a3
{
  v5 = (UILabel *)a3;
  p_label = &self->_label;
  label = self->_label;
  if (label != v5)
  {
    v10 = v5;
    -[UILabel removeFromSuperview](label, "removeFromSuperview");
    objc_storeStrong((id *)&self->_label, a3);
    if (*p_label)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVisualEffectLabelView contentView](self, "contentView"));
      [v8 addSubview:*p_label];

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _idleModeLayoutAttributes](*p_label, "_idleModeLayoutAttributes"));
      if (!v9) {
        -[TVHVisualEffectLabelView _addIdleModeLayoutAttributes](self, "_addIdleModeLayoutAttributes");
      }
    }

    -[TVHVisualEffectLabelView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVisualEffectLabelView label](self, "label"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHVisualEffectLabelView;
  -[TVHVisualEffectLabelView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVisualEffectLabelView contentView](self, "contentView"));
  -[TVHVisualEffectLabelView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVisualEffectLabelView label](self, "label"));
  -[TVHVisualEffectLabelView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");
}

- (void)_addIdleModeLayoutAttributes
{
  id v4 = (id)objc_opt_new(&OBJC_CLASS____UIIdleModeLayoutAttributes, a2);
  [v4 setAlphaOffset:-0.75];
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVisualEffectLabelView label](self, "label"));
  [v3 _setIdleModeLayoutAttributes:v4];
}

- (void).cxx_destruct
{
}

@end