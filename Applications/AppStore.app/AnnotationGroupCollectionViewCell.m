@interface AnnotationGroupCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore33AnnotationGroupCollectionViewCell)initWithFrame:(CGRect)a3;
- (int64_t)overrideUserInterfaceStyle;
- (void)layoutSubviews;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
@end

@implementation AnnotationGroupCollectionViewCell

- (_TtC8AppStore33AnnotationGroupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33AnnotationGroupCollectionViewCell *)sub_1000B2AEC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for AnnotationGroupCollectionViewCell(0LL);
  v2 = (char *)v13.receiver;
  -[AnnotationGroupCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  id v3 = *(id *)&v2[OBJC_IVAR____TtC8AppStore33AnnotationGroupCollectionViewCell_informationColumnView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (int64_t)overrideUserInterfaceStyle
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnnotationGroupCollectionViewCell(0LL);
  return -[AnnotationGroupCollectionViewCell overrideUserInterfaceStyle](&v3, "overrideUserInterfaceStyle");
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AnnotationGroupCollectionViewCell(0LL);
  id v4 = v5.receiver;
  -[AnnotationGroupCollectionViewCell setOverrideUserInterfaceStyle:](&v5, "setOverrideUserInterfaceStyle:", a3);
  sub_1000B2E04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33AnnotationGroupCollectionViewCell_informationColumnView));
}

@end