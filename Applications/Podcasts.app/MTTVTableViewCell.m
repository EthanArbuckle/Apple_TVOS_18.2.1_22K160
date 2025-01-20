@interface MTTVTableViewCell
+ (id)reuseIdentifier;
- (MTTVTableViewCell)init;
- (MTTVTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MTTVTableViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (MTTVTableViewCell)init
{
  id v3 = [(id)objc_opt_class(self) reuseIdentifier];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[MTTVTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0LL, v4);

  return v5;
}

- (MTTVTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVTableViewCell;
  v4 = -[MTTVTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4) {
    -[MTTVTableViewCell configureSubviews](v4, "configureSubviews");
  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVTableViewCell;
  id v4 = a3;
  -[MTTVTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTableViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[MTTVTableViewCell updateColors](self, "updateColors");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVTableViewCell;
  -[MTTVTableViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v5,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  -[MTTVTableViewCell updateColors](self, "updateColors");
}

@end