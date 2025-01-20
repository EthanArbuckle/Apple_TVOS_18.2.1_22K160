@interface AddPeopleToCallViewController
- (_TtC8FaceTime29AddPeopleToCallViewController)init;
- (_TtC8FaceTime29AddPeopleToCallViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation AddPeopleToCallViewController

- (void)viewDidLoad
{
  v3 = self;
  sub_1000229FC((uint64_t)v3, v2);
}

- (_TtC8FaceTime29AddPeopleToCallViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AddPeopleToCallViewController((uint64_t)self, (uint64_t)a2);
  return -[ContactListWithSnowglobeViewController init](&v3, "init");
}

- (_TtC8FaceTime29AddPeopleToCallViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AddPeopleToCallViewController((uint64_t)self, (uint64_t)a2);
  return -[ContactListWithSnowglobeViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end