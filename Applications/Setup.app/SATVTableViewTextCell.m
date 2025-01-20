@interface SATVTableViewTextCell
- (void)layoutSubviews;
@end

@implementation SATVTableViewTextCell

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SATVTableViewTextCell;
  -[SATVTableViewTextCell layoutSubviews](&v14, "layoutSubviews");
  -[SATVTableViewTextCell bounds](self, "bounds");
  double v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewTextCell textLabel](self, "textLabel"));
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewTextCell textLabel](self, "textLabel"));
  objc_msgSend(v12, "setFrame:", floor((v4 - v9) * 0.5), v7, v9, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewTextCell textLabel](self, "textLabel"));
  [v13 setTextAlignment:1];
}

@end