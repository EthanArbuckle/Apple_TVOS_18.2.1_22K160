@interface Bubble.Focus
- (_TtCC8FaceTime6Bubble5Focus)initWithCoder:(id)a3;
- (_TtCC8FaceTime6Bubble5Focus)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation Bubble.Focus

- (_TtCC8FaceTime6Bubble5Focus)initWithFrame:(CGRect)a3
{
  return (_TtCC8FaceTime6Bubble5Focus *)sub_100049084(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8FaceTime6Bubble5Focus)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10004A15C();
}

  ;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10004996C((uint64_t)v6, (uint64_t)v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_plusBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_deleteImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_avatarImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_plusLabel));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_parent);
}

@end