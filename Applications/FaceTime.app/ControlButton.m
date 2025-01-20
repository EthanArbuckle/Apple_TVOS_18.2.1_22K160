@interface ControlButton
+ (void)overrideAppearance;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC8FaceTime13ControlButton)initWithCoder:(id)a3;
- (_TtC8FaceTime13ControlButton)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateConfiguration;
@end

@implementation ControlButton

+ (void)overrideAppearance
{
}

- (BOOL)isSelected
{
  return sub_1000972DC(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return sub_1000972DC(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (_TtC8FaceTime13ControlButton)initWithCoder:(id)a3
{
  result = (_TtC8FaceTime13ControlButton *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/ControlButton.swift",  28LL,  2LL,  96LL,  0);
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_100097D00();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ControlButton((uint64_t)self, (uint64_t)a2);
  id v6 = a3;
  id v7 = a4;
  id v8 = v9.receiver;
  -[ControlButton didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  sub_100097B1C();
}

- (_TtC8FaceTime13ControlButton)initWithFrame:(CGRect)a3
{
  result = (_TtC8FaceTime13ControlButton *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.ControlButton",  22LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end