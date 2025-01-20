@interface ProductMediaCollectionView
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore26ProductMediaCollectionView)init;
- (_TtC8AppStore26ProductMediaCollectionView)initWithCoder:(id)a3;
- (_TtC8AppStore26ProductMediaCollectionView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore26ProductMediaCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)didMoveToWindow;
@end

@implementation ProductMediaCollectionView

- (_TtC8AppStore26ProductMediaCollectionView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26ProductMediaCollectionView *)sub_10021451C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore26ProductMediaCollectionView)init
{
  return -[ProductMediaCollectionView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC8AppStore26ProductMediaCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  sub_100215B00(54LL);
}

  ;
}

- (_TtC8AppStore26ProductMediaCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100215B00(59LL);
}

  ;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  id v2 = v4.receiver;
  -[ProductMediaCollectionView didMoveToWindow](&v4, "didMoveToWindow");
  id v3 = objc_msgSend(v2, "window", v4.receiver, v4.super_class);

  if (v3) {
    CompoundScrollObserver.removeAllChildren()();
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore26ProductMediaCollectionView_activeDataSource);
  if (v3)
  {
    double width = a3.width;
    v5 = self;
    id v6 = v3;
    double v7 = sub_10021492C(width);
    double v9 = v8;
  }

  else
  {
    double v7 = 0.0;
    double v9 = 0.0;
  }

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26ProductMediaCollectionView_activeDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26ProductMediaCollectionView_flowLayout));
  sub_10000A450( *(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore26ProductMediaCollectionView_artworkSelectionHandler),  *(void *)&self->activeDataSource[OBJC_IVAR____TtC8AppStore26ProductMediaCollectionView_artworkSelectionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26ProductMediaCollectionView_compoundScrollObserver));
}

@end