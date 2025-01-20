@interface SDAirDropService_objc
- (SDAirDropService_objc)init;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropService_objc

- (void)start
{
  uint64_t v3 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  swift_retain_n(self, 2LL);
  uint64_t v7 = static Task<>.noThrow(priority:operation:)(v5, &unk_10064D960, self, (char *)&type metadata for () + 8);
  swift_release(v7);
  swift_release(self);
  sub_100265EFC((uint64_t)v5);
  swift_release(self);
}

- (void)stop
{
  uint64_t v3 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  swift_retain_n(self, 2LL);
  uint64_t v7 = sub_100183098(&qword_100646100);
  uint64_t v8 = static Task<>.noThrow(priority:operation:)(v5, &unk_10064D950, self, v7);
  swift_release(v8);
  swift_release(self);
  sub_100265EFC((uint64_t)v5);
  swift_release(self);
}

- (SDAirDropService_objc)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_defaultActor_initialize(self);
  *(void *)self->service = 0LL;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[SDAirDropService_objc init](&v5, "init");
}

@end