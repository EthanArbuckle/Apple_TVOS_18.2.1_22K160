@interface CreateCallViewController
- (_TtC8FaceTime24CreateCallViewController)init;
- (_TtC8FaceTime24CreateCallViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation CreateCallViewController

- (void)viewDidLoad
{
  v3 = self;
  sub_100039F00((uint64_t)v3, v2);
}

- (_TtC8FaceTime24CreateCallViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CreateCallViewController((uint64_t)self, (uint64_t)a2);
  return -[ContactListWithSnowglobeViewController init](&v3, "init");
}

- (_TtC8FaceTime24CreateCallViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CreateCallViewController((uint64_t)self, (uint64_t)a2);
  return -[ContactListWithSnowglobeViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end