@interface AnnotationImagesView
- (BOOL)hasContent;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore20AnnotationImagesView)initWithCoder:(id)a3;
- (_TtC8AppStore20AnnotationImagesView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnnotationImagesView

- (_TtC8AppStore20AnnotationImagesView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = sub_1000038E8(&qword_1002E33E0);
  __chkstk_darwin(v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews) = (Class)_swiftEmptyArrayStorage;
  uint64_t v11 = type metadata accessor for AnnotationImagesView.AnnotationImageView();
  v12 = self;
  ViewRecycler.init()(v11);
  unint64_t v13 = sub_100046880();
  ReusePool.init(recycler:limit:)(v10, 10LL, v8, v13);

  v14 = (objc_class *)type metadata accessor for AnnotationImagesView(0LL);
  v17.receiver = v12;
  v17.super_class = v14;
  v15 = -[AnnotationImagesView initWithFrame:](&v17, "initWithFrame:", x, y, width, height);
  -[AnnotationImagesView setLayoutMargins:]( v15,  "setLayoutMargins:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
  return v15;
}

- (_TtC8AppStore20AnnotationImagesView)initWithCoder:(id)a3
{
  return (_TtC8AppStore20AnnotationImagesView *)sub_100045AC4(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100045EE4();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews, v26, 0LL, 0LL);
  uint64_t v9 = *v8;
  swift_unknownObjectRetain(a4);
  v10 = self;
  uint64_t v11 = swift_bridgeObjectRetain(v9);
  uint64_t v12 = sub_1000CA2C8(v11);
  swift_bridgeObjectRelease(v9);
  if (qword_1002E0420 != -1) {
    swift_once(&qword_1002E0420, sub_10004592C);
  }
  uint64_t v13 = type metadata accessor for AnnotationImagesLayout.Metrics(0LL);
  uint64_t v14 = sub_10000A634(v13, (uint64_t)qword_1002F26E0);
  double v15 = static AnnotationImagesLayout.measurements(for:fitting:metrics:in:)(v12, v14, a4, width, height);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  swift_unknownObjectRelease(a4);

  swift_bridgeObjectRelease(v12);
  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.var3 = v25;
  result.var2 = v24;
  result.var1 = v23;
  result.var0 = v22;
  return result;
}

- (BOOL)hasContent
{
  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews, v9, 0LL, 0LL);
  uint64_t v4 = *v3;
  uint64_t v5 = type metadata accessor for AnnotationImagesView.AnnotationImageView();
  v6 = self;
  uint64_t v7 = swift_bridgeObjectRetain(v4);
  LOBYTE(v5) = Array.isNotEmpty.getter(v7, v5);

  swift_bridgeObjectRelease(v4);
  return v5 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViewReusePool;
  uint64_t v4 = sub_1000038E8(&qword_1002E3418);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end