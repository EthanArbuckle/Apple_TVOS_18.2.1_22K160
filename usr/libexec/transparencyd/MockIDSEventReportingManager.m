@interface MockIDSEventReportingManager
- (_TtC13transparencyd28MockIDSEventReportingManager)init;
- (void)reportResultWithSuccess:(NSNumber *)a3 startFrom:(double)a4 completionHandler:(id)a5;
@end

@implementation MockIDSEventReportingManager

- (_TtC13transparencyd28MockIDSEventReportingManager)init
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13transparencyd28MockIDSEventReportingManager_rec) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MockIDSEventReportingManager();
  return -[MockIDSEventReportingManager init](&v3, "init");
}

- (void)reportResultWithSuccess:(NSNumber *)a3 startFrom:(double)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject(&unk_10027D758, 48LL, 7LL);
  *(void *)(v13 + 16) = a3;
  *(double *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  v15 = (void *)swift_allocObject(&unk_10027D780, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_1002DF600;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_10027D7A8, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_1002DF608;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  uint64_t v19 = sub_10007A798((uint64_t)v11, (uint64_t)&unk_1002DF610, (uint64_t)v16);
  swift_release(v19);
}

@end