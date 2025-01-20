@interface AnnotationCollectionViewCell.ItemView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView)initWithCoder:(id)a3;
- (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnnotationCollectionViewCell.ItemView

- (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView)initWithFrame:(CGRect)a3
{
  return (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView *)sub_10006F258( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100070B24((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = type metadata accessor for LayoutRect(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v8 = self;
  -[AnnotationCollectionViewCell.ItemView layoutSubviews](&v15, "layoutSubviews");
  sub_10006F7B8((uint64_t)v14);
  *(void *)&double v9 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType).n128_u64[0];
  TVProductAnnotationLayout.ItemLayout.placeChildren(relativeTo:in:)(v8, (uint64_t)v7, v9, v10, v11, v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100053B30(v14);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10006F7B8((uint64_t)v20);
  double v9 = TVProductAnnotationLayout.ItemLayout.measurements(fitting:in:)(a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  sub_100053B30(v20);
  swift_unknownObjectRelease(a4);

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_headingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_headingTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_subTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_listTextLabel));
}

@end