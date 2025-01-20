@interface SmallStoryCardCollectionViewCell
- (CATransform3D)transform3D;
- (_TtC6Arcade32SmallStoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setTransform3D:(CATransform3D *)a3;
@end

@implementation SmallStoryCardCollectionViewCell

- (_TtC6Arcade32SmallStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade32SmallStoryCardCollectionViewCell *)sub_100150144( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (CATransform3D)transform3D
{
  v20.receiver = self;
  v20.super_class = (Class)swift_getObjectType(self);
  result = (CATransform3D *)-[CATransform3D transform3D](&v20, "transform3D");
  __int128 v5 = v13;
  __int128 v6 = v14;
  __int128 v7 = v15;
  __int128 v8 = v16;
  __int128 v9 = v17;
  __int128 v10 = v18;
  __int128 v11 = v19;
  *(_OWORD *)&retstr->m11 = v12;
  *(_OWORD *)&retstr->m13 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m23 = v7;
  *(_OWORD *)&retstr->m31 = v8;
  *(_OWORD *)&retstr->m33 = v9;
  *(_OWORD *)&retstr->m41 = v10;
  *(_OWORD *)&retstr->m43 = v11;
  return result;
}

- (void)setTransform3D:(CATransform3D *)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v15.receiver = self;
  v15.super_class = ObjectType;
  __int128 v6 = self;
  __int128 v7 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&v14.m11 = *(_OWORD *)&a3->m11;
  *(_OWORD *)&v14.m13 = v7;
  __int128 v8 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&v14.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&v14.m23 = v8;
  __int128 v9 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&v14.m31 = *(_OWORD *)&a3->m31;
  *(_OWORD *)&v14.m33 = v9;
  __int128 v10 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&v14.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&v14.m43 = v10;
  -[SmallStoryCardCollectionViewCell setTransform3D:](&v15, "setTransform3D:", &v14);
  __int128 v11 = *(Class *)((char *)&v6->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC6Arcade32SmallStoryCardCollectionViewCell_detailsView);
  v13.receiver = v6;
  v13.super_class = ObjectType;
  -[SmallStoryCardCollectionViewCell transform3D](&v13, "transform3D");
  CATransform3DInvert(&v12, &v14);
  CATransform3D v14 = v12;
  [v11 setTransform3D:&v14];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001507B4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10014FFE8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32SmallStoryCardCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32SmallStoryCardCollectionViewCell_detailsView));
}

@end