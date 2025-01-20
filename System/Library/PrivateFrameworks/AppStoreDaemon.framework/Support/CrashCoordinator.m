@interface CrashCoordinator
+ (_TtC9appstored16CrashCoordinator)shared;
- (_TtC9appstored16CrashCoordinator)init;
- (void)getBiomeCrashesWithLogKey:(_TtC9appstored6LogKey *)a3 startDate:(NSDate *)a4 completionHandler:(id)a5;
@end

@implementation CrashCoordinator

+ (_TtC9appstored16CrashCoordinator)shared
{
  if (qword_100458080 != -1) {
    swift_once(&qword_100458080, sub_10004C584);
  }
  return (_TtC9appstored16CrashCoordinator *)(id)qword_100462900;
}

- (void)getBiomeCrashesWithLogKey:(_TtC9appstored6LogKey *)a3 startDate:(NSDate *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject(&unk_1003DEC98, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  v15 = (void *)swift_allocObject(&unk_1003DECC0, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_1004597E8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_1003DECE8, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_1004584A0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  uint64_t v20 = sub_100083C10((uint64_t)v11, (uint64_t)&unk_100459580, (uint64_t)v16);
  swift_release(v20);
}

- (_TtC9appstored16CrashCoordinator)init
{
  return (_TtC9appstored16CrashCoordinator *)sub_10004CD20();
}

- (void).cxx_destruct
{
}

@end