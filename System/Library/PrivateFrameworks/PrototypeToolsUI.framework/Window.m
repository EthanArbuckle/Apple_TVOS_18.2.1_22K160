@interface Window
+ (BOOL)_isSecure;
- (_TtC10prototyped6Window)initWithCoder:(id)a3;
- (_TtC10prototyped6Window)initWithContentRect:(CGRect)a3;
- (_TtC10prototyped6Window)initWithFrame:(CGRect)a3;
- (_TtC10prototyped6Window)initWithWindowScene:(id)a3;
@end

@implementation Window

+ (BOOL)_isSecure
{
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = ((uint64_t (*)(void))static MainActor.shared.getter)();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 14LL, v4, v6);
  }
  uint64_t v8 = static MainActor.shared.getter(isCurrentExecutor);
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v11 = v10;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 14LL, v9, v11);
  }
  swift_release(v3);
  swift_release(v8);
  return 1;
}

- (_TtC10prototyped6Window)initWithWindowScene:(id)a3
{
  uint64_t v5 = type metadata accessor for MainActor(0LL);
  uint64_t v6 = static MainActor.shared.getter(v5);
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  uint64_t v9 = v8;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 13LL, v7, v9);
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for Window();
  uint64_t v10 = -[Window initWithWindowScene:](&v12, "initWithWindowScene:", a3);
  swift_release(v6);
  return v10;
}

- (_TtC10prototyped6Window)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  uint64_t v9 = static MainActor.shared.getter(v8);
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  uint64_t v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 13LL, v10, v12);
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for Window();
  v13 = -[Window initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  swift_release(v9);
  return v13;
}

- (_TtC10prototyped6Window)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for MainActor(0LL);
  uint64_t v6 = static MainActor.shared.getter(v5);
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  uint64_t v9 = v8;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 13LL, v7, v9);
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for Window();
  uint64_t v10 = -[Window initWithCoder:](&v12, "initWithCoder:", a3);
  swift_release(v6);
  return v10;
}

- (_TtC10prototyped6Window)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  uint64_t v9 = static MainActor.shared.getter(v8);
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  uint64_t v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 13LL, v10, v12);
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for Window();
  v13 = -[Window initWithContentRect:](&v15, "initWithContentRect:", x, y, width, height);
  swift_release(v9);
  return v13;
}

@end