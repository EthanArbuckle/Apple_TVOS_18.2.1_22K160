@interface StandaloneTableViewCheckbox
- (_TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)layoutSubviews;
@end

@implementation StandaloneTableViewCheckbox

- (_TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox *)sub_A34A8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_A3748();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_A37E8();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1LL;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = __chkstk_darwin(v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  id v12 = a3;
  v13 = self;
  sub_A390C(v12);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  id v12 = a3;
  v13 = self;
  sub_A3C8C(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_collectionView));
}

@end