@interface Application
- (_TtC10prototyped11Application)init;
@end

@implementation Application

- (_TtC10prototyped11Application)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  uint64_t v5 = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  uint64_t v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/Application.swift", 28LL, 1LL, 12LL, v6, v8);
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[Application init](&v11, "init");
  swift_release(v5);
  return v9;
}

@end