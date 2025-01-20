@interface FramedVideoCollectionViewCell
- (_TtC8AppStore29FramedVideoCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation FramedVideoCollectionViewCell

- (_TtC8AppStore29FramedVideoCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29FramedVideoCollectionViewCell *)sub_100002F50( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  id v2 = v3.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1001AE998();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  unint64_t v7 = sub_100004D04();
  uint64_t v8 = sub_100004288( (unint64_t *)&qword_1002E5F50,  (uint64_t (*)(uint64_t))sub_100004D04,  (uint64_t)&protocol conformance descriptor for NSObject);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_100003158(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29FramedVideoCollectionViewCell_videoContainer));
}

@end