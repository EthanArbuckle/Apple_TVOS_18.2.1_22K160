@interface FKASimpleCommandView
- (FKASimpleCommandView)initWithKeyChordString:(id)a3;
@end

@implementation FKASimpleCommandView

- (FKASimpleCommandView)initWithKeyChordString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FKASimpleCommandView;
  v5 = -[FKASimpleCommandView init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    v7 = objc_opt_new(&OBJC_CLASS___UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    -[UILabel setFont:](v7, "setFont:", v6);
    -[UILabel setText:](v7, "setText:", v4);
    -[UILabel setTextAlignment:](v7, "setTextAlignment:", 1LL);
    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v8);
  }

  return v5;
}

@end