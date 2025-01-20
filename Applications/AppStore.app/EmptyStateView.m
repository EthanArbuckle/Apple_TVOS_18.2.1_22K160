@interface EmptyStateView
- (_TtC8AppStore14EmptyStateView)initWithCoder:(id)a3;
- (_TtC8AppStore14EmptyStateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EmptyStateView

- (_TtC8AppStore14EmptyStateView)initWithFrame:(CGRect)a3
{
  id v4 = objc_allocWithZone((Class)swift_getObjectType(self));
  v5 = sub_1000ECF34(0LL, 0LL, 0LL, 0LL);
  uint64_t ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance( self,  ObjectType,  *(unsigned int *)((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x30),  *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x34));
  return (_TtC8AppStore14EmptyStateView *)v5;
}

- (_TtC8AppStore14EmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000EEB6C((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000ED734();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore14EmptyStateView_descriptionTextSpace;
  uint64_t v4 = type metadata accessor for StaticDimension(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->divider[OBJC_IVAR____TtC8AppStore14EmptyStateView_title]);

  swift_bridgeObjectRelease(*(void *)&self->divider[OBJC_IVAR____TtC8AppStore14EmptyStateView_descriptionText]);
}

@end