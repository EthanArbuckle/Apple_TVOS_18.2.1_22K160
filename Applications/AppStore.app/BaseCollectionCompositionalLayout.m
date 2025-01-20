@interface BaseCollectionCompositionalLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithCoder:(id)a3;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (void)prepareLayout;
@end

@implementation BaseCollectionCompositionalLayout

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject(&unk_100288A10, 24LL, 7LL);
  *(void *)(v6 + 16) = v5;
  return (_TtC8AppStore33BaseCollectionCompositionalLayout *)sub_100084970((uint64_t)sub_100084E80, v6, a4);
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithCoder:(id)a3
{
  v4 = &self->UICollectionViewCompositionalLayout_opaque[OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  *(void *)v4 = 0LL;
  *((void *)v4 + 1) = 0LL;
  id v5 = a3;

  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/BaseCollectionCompositionalLayout.swift",  48LL,  2LL,  50LL,  0);
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  v2 = (char *)v9.receiver;
  -[BaseCollectionCompositionalLayout prepareLayout](&v9, "prepareLayout");
  v3 = (uint64_t *)&v2[OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  v4 = *(void (**)(char *, __n128))&v2[OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  if (v4)
  {
    uint64_t v5 = v3[1];
    __n128 v6 = swift_retain(v5);
    v4(v2, v6);
    sub_10000A450((uint64_t)v4, v5);
    uint64_t v7 = *v3;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v8 = v3[1];
  uint64_t *v3 = 0LL;
  v3[1] = 0LL;
  sub_10000A450(v7, v8);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = -[BaseCollectionCompositionalLayout collectionView](v7, "collectionView");
  if (v8)
  {
    objc_super v9 = v8;
    [v8 bounds];
    double v11 = v10;
    double v13 = v12;

    if (v11 != width) {
      goto LABEL_7;
    }
  }

  else
  {
    double v13 = 0.0;
    if (width != 0.0)
    {
LABEL_7:

      return 1;
    }
  }

  if (v13 != height) {
    goto LABEL_7;
  }
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  BOOL v14 = -[BaseCollectionCompositionalLayout shouldInvalidateLayoutForBoundsChange:]( &v16,  "shouldInvalidateLayoutForBoundsChange:",  x,  y,  width,  height);

  return v14;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3
{
  id v3 = a3;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.BaseCollectionCompositionalLayout",  42LL,  "init(section:)",  14LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.BaseCollectionCompositionalLayout",  42LL,  "init(section:configuration:)",  28LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.BaseCollectionCompositionalLayout",  42LL,  "init(sectionProvider:)",  22LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.BaseCollectionCompositionalLayout",  42LL,  "init(section:sectionProvider:configuration:)",  44LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end