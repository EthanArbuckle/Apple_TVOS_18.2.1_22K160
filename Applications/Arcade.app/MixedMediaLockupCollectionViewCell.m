@interface MixedMediaLockupCollectionViewCell
- (CATransform3D)transform3D;
- (CGRect)jet_focusedFrame;
- (_TtC6Arcade15LockupMediaView)accessibilityMediaView;
- (_TtC6Arcade15SmallLockupView)accessibilityLockupView;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTaglineLabel;
- (_TtC6Arcade34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC6Arcade9VideoView)accessibilityVideoView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)setTransform3D:(CATransform3D *)a3;
@end

@implementation MixedMediaLockupCollectionViewCell

- (_TtC6Arcade34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade34MixedMediaLockupCollectionViewCell *)sub_1000C7AE4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (CATransform3D)transform3D
{
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for MixedMediaLockupCollectionViewCell(0LL);
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
  __int128 v12 = *(_OWORD *)&a3->m13;
  __int128 v13 = *(_OWORD *)&a3->m11;
  __int128 v10 = *(_OWORD *)&a3->m23;
  __int128 v11 = *(_OWORD *)&a3->m21;
  __int128 v8 = *(_OWORD *)&a3->m33;
  __int128 v9 = *(_OWORD *)&a3->m31;
  __int128 v7 = *(_OWORD *)&a3->m41;
  CGFloat m43 = a3->m43;
  CGFloat m44 = a3->m44;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for MixedMediaLockupCollectionViewCell(0LL);
  __int128 v5 = (char *)v16.receiver;
  *(_OWORD *)&v15.m11 = v13;
  *(_OWORD *)&v15.m13 = v12;
  *(_OWORD *)&v15.m21 = v11;
  *(_OWORD *)&v15.m23 = v10;
  *(_OWORD *)&v15.m31 = v9;
  *(_OWORD *)&v15.m33 = v8;
  *(_OWORD *)&v15.m41 = v7;
  v15.CGFloat m43 = m43;
  v15.CGFloat m44 = m44;
  -[MixedMediaLockupCollectionViewCell setTransform3D:](&v16, "setTransform3D:", &v15);
  __int128 v6 = *(void **)&v5[OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_taglineLabel];
  [v5 transform3D];
  CATransform3DInvert(&v14, &v15);
  CATransform3D v15 = v14;
  [v6 setTransform3D:&v15];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000C87B0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000C8CE0();
}

- (CGRect)jet_focusedFrame
{
  v2 = self;
  double v3 = sub_1000C8E14();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_100006028(0LL, (unint64_t *)&qword_1002DD600, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B6B4();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  double v11 = self;
  sub_1000C9154(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (_TtC6Arcade15SmallLockupView)accessibilityLockupView
{
  return (_TtC6Arcade15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                 + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_lockupView));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_taglineLabel));
}

- (_TtC6Arcade9VideoView)accessibilityVideoView
{
  return (_TtC6Arcade9VideoView *)objc_autoreleaseReturnValue((id)swift_unknownObjectWeakLoadStrong( *(char **)((char *)&(*(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_mediaView))->isa + OBJC_IVAR____TtC6Arcade15LockupMediaView_videoContainer)
                                                                  + OBJC_IVAR____TtC6Arcade18VideoViewContainer_view));
}

- (_TtC6Arcade15LockupMediaView)accessibilityMediaView
{
  return (_TtC6Arcade15LockupMediaView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                 + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_mediaView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_taglineLabel));
  sub_100006060( (uint64_t)self + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_overrideLockupPosition,  &qword_1002E3C40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade34MixedMediaLockupCollectionViewCell_pillView));
}

@end