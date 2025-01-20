@interface LibraryControlsView
- (NSArray)preferredFocusEnvironments;
- (_TtC7TVMusic19LibraryControlsView)initWithCoder:(id)a3;
- (_TtC7TVMusic19LibraryControlsView)initWithFrame:(CGRect)a3;
@end

@implementation LibraryControlsView

- (_TtC7TVMusic19LibraryControlsView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusic19LibraryControlsView_buttonHandler);
  void *v4 = 0LL;
  v4[1] = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusic19LibraryControlsView_contentView) = 0LL;
  id v5 = a3;

  result = (_TtC7TVMusic19LibraryControlsView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/LibraryControls.swift",  29LL,  2LL,  165LL,  0);
  __break(1u);
  return result;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_1000DFE10(&qword_1002B8A00);
  result = (NSArray *)swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)&result[2].super.Class isa = xmmword_1001E9180;
  id v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusic19LibraryControlsView_contentView);
  if (v5)
  {
    result[4].super.Class isa = v5;
    v8 = result;
    specialized Array._endMutation()();
    v6 = v5;
    sub_1000DFE10((uint64_t *)&unk_1002B7E50);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    return (NSArray *)isa;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (_TtC7TVMusic19LibraryControlsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end