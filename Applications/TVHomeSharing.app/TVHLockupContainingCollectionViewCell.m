@interface TVHLockupContainingCollectionViewCell
- (TVHLockup)lockup;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setLockup:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation TVHLockupContainingCollectionViewCell

- (void)setLockup:(id)a3
{
  v5 = (TVHLockup *)a3;
  lockup = self->_lockup;
  v8 = v5;
  if (lockup != v5)
  {
    -[TVHLockup removeFromSuperview](lockup, "removeFromSuperview");
    objc_storeStrong((id *)&self->_lockup, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockupContainingCollectionViewCell contentView](self, "contentView"));
    [v7 addSubview:v8];

    -[TVHLockupContainingCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHLockupContainingCollectionViewCell;
  -[TVHLockupContainingCollectionViewCell layoutSubviews](&v9, "layoutSubviews");
  -[TVHLockupContainingCollectionViewCell bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockupContainingCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockupContainingCollectionViewCell lockup](self, "lockup"));
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v6);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHLockupContainingCollectionViewCell;
  -[TVHLockupContainingCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockupContainingCollectionViewCell lockup](self, "lockup"));
  [v3 prepareForReuse];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHLockupContainingCollectionViewCell;
  -[TVHLockupContainingCollectionViewCell setSelected:](&v6, "setSelected:");
  if (v3)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockupContainingCollectionViewCell lockup](self, "lockup"));
    [v5 sendActionsForControlEvents:0x2000];
  }

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHLockupContainingCollectionViewCell;
  -[TVHLockupContainingCollectionViewCell setHighlighted:](&v7, "setHighlighted:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000390C8;
  v5[3] = &unk_1000FD260;
  v5[4] = self;
  BOOL v6 = a3;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  36LL,  v5,  0LL,  0.12,  0.0);
}

- (TVHLockup)lockup
{
  return self->_lockup;
}

- (void).cxx_destruct
{
}

@end