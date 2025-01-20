@interface RDStatusSharer
- (_TtC8countryd14RDStatusSharer)init;
- (void)shareStatusWithEstimate:(RDEstimate *)a3 completionHandler:(id)a4;
- (void)shareStatusesWithEstimates:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation RDStatusSharer

- (_TtC8countryd14RDStatusSharer)init
{
  return (_TtC8countryd14RDStatusSharer *)sub_100005ECC();
}

- (void)shareStatusWithEstimate:(RDEstimate *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100008FF8(&qword_1000192A8);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1000148F8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100014920, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100019300;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_100014948, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100019308;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_1000090E0((uint64_t)v9, (uint64_t)&unk_100019310, (uint64_t)v14);
  swift_release(v17);
}

- (void)shareStatusesWithEstimates:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100008FF8(&qword_1000192A8);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_100014858, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100014880, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1000192B8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1000148A8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1000192C8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_1000090E0((uint64_t)v9, (uint64_t)&unk_1000192D8, (uint64_t)v14);
  swift_release(v17);
}

- (void).cxx_destruct
{
}

@end