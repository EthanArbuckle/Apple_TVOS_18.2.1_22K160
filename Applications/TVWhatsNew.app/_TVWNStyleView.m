@interface _TVWNStyleView
- (id)traitCollection;
- (int64_t)style;
- (void)setStyle:(int64_t)a3;
@end

@implementation _TVWNStyleView

- (id)traitCollection
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____TVWNStyleView;
  id v3 = -[_TVWNStyleView traitCollection](&v9, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  -[_TVWNStyleView style](self, "style")));
  v10[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithTraitsFromCollections:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithTraitsFromCollections:",  v6));

  return v7;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end