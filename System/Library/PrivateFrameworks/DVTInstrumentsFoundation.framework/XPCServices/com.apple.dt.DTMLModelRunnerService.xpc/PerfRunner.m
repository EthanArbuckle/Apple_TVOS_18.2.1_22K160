@interface PerfRunner
- (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner)init;
- (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner)initWithConfig:(id)a3;
- (void)runWithModelLocation:(_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation *)a3 computeUnits:(int64_t)a4 perfRunConfig:(_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig *)a5 completionHandler:(id)a6;
@end

@implementation PerfRunner

- (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner)initWithConfig:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000076EC(v4, (uint64_t)v12);
  v6 = (_OWORD *)((char *)v5 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
  __int128 v7 = v12[1];
  _OWORD *v6 = v12[0];
  v6[1] = v7;
  __int128 v8 = v12[3];
  v6[2] = v12[2];
  v6[3] = v8;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for PerfRunner();
  v9 = -[PerfRunner init](&v11, "init");

  return v9;
}

- (void)runWithModelLocation:(_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation *)a3 computeUnits:(int64_t)a4 perfRunConfig:(_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig *)a5 completionHandler:(id)a6
{
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13 = _Block_copy(a6);
  v14 = (void *)swift_allocObject(&unk_100030FC0, 56LL, 7LL);
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v12, 1LL, 1LL, v15);
  v16 = (void *)swift_allocObject(&unk_100030FE8, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_100034B08;
  v16[5] = v14;
  v17 = (void *)swift_allocObject(&unk_100031010, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_100034B18;
  v17[5] = v16;
  v18 = a3;
  v19 = a5;
  v20 = self;
  uint64_t v21 = sub_100006C34((uint64_t)v12, (uint64_t)&unk_100034B28, (uint64_t)v17);
  swift_release(v21);
}

- (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner)init
{
  result = (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_dt_DTMLModelRunnerService.PerfRunner",  46LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
  uint64_t v3 = *(void *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers];
  uint64_t v4 = *(void *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 8];
  uint64_t v5 = *(void *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24];
  uint64_t v6 = *(void *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 32];
  id v8 = *(id *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 48];
  unsigned __int8 v7 = self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 40];
  swift_bridgeObjectRelease( *(void *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 16],  v8);
  swift_release(v4);
  swift_release(v3);
  swift_release(v2);
  sub_10000615C(v5, v6, v7);
}

@end