@interface CreateCallCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8FaceTime28CreateCallCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8FaceTime28CreateCallCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation CreateCallCollectionViewCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (_TtC8FaceTime28CreateCallCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8FaceTime28CreateCallCollectionViewCell *)sub_100094584( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8FaceTime28CreateCallCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100096BD4();
}

  ;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CreateCallCollectionViewCell(0LL);
  v2 = (char *)v13.receiver;
  -[CreateCallCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  id v3 = *(id *)&v2[OBJC_IVAR____TtC8FaceTime28CreateCallCollectionViewCell_contactPickerControl];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100094804();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime28CreateCallCollectionViewCell_contactPickerControl));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8FaceTime28CreateCallCollectionViewCell_imageFetchTask));
}

@end