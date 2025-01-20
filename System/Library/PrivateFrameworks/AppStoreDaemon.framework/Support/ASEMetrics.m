@interface ASEMetrics
- (_TtC9appstored10ASEMetrics)init;
- (_TtC9appstored10ASEMetrics)initWithType:(int64_t)a3;
- (void)enqueueEvent:(AMSMetricsEvent *)a3 flushEvents:(BOOL)a4 completionHandler:(id)a5;
- (void)enqueueEvents:(NSArray *)a3 flushEvents:(BOOL)a4 completionHandler:(id)a5;
- (void)flushWithCompletionHandler:(id)a3;
@end

@implementation ASEMetrics

- (_TtC9appstored10ASEMetrics)initWithType:(int64_t)a3
{
  return (_TtC9appstored10ASEMetrics *)sub_10002E0DC(a3);
}

- (void)enqueueEvent:(AMSMetricsEvent *)a3 flushEvents:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject(&unk_1003DD730, 48LL, 7LL);
  *(void *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  v15 = (void *)swift_allocObject(&unk_1003DD758, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_100459128;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_1003DD780, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_100459130;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  uint64_t v19 = sub_100083C10((uint64_t)v11, (uint64_t)&unk_100459138, (uint64_t)v16);
  swift_release(v19);
}

- (void)enqueueEvents:(NSArray *)a3 flushEvents:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject(&unk_1003DD6B8, 48LL, 7LL);
  *(void *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  v15 = (void *)swift_allocObject(&unk_1003DD6E0, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_100459108;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_1003DD708, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_100459110;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  uint64_t v19 = sub_100083C10((uint64_t)v11, (uint64_t)&unk_100459118, (uint64_t)v16);
  swift_release(v19);
}

- (void)flushWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1003DD640, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1003DD668, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1004590F8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1003DD690, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1004584A0;
  v12[5] = v11;
  uint64_t v13 = self;
  uint64_t v14 = sub_100083C10((uint64_t)v7, (uint64_t)&unk_100459580, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC9appstored10ASEMetrics)init
{
  result = (_TtC9appstored10ASEMetrics *)_swift_stdlib_reportUnimplementedInitializer( "appstored.ASEMetrics",  20LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(void *)&self->enqueueTransactionID[OBJC_IVAR____TtC9appstored10ASEMetrics_shortName]);
}

@end