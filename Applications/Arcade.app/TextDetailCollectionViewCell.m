@interface TextDetailCollectionViewCell
- (BOOL)isSelected;
- (_TtC6Arcade28TextDetailCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TextDetailCollectionViewCell

- (_TtC6Arcade28TextDetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade28TextDetailCollectionViewCell *)sub_100154FFC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[TextDetailCollectionViewCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  unsigned int v7 = -[TextDetailCollectionViewCell isSelected](&v10, "isSelected");
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[TextDetailCollectionViewCell setSelected:](&v9, "setSelected:", v3);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != -[TextDetailCollectionViewCell isSelected](&v8, "isSelected")) {
    sub_100155CCC(*((_BYTE *)&v6->super.super.super.super.super.super.isa
  }
                  + OBJC_IVAR____TtC6Arcade22BaseCollectionViewCell_state));
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100155648();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001559F8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28TextDetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28TextDetailCollectionViewCell_subtitleLabel));
}

@end