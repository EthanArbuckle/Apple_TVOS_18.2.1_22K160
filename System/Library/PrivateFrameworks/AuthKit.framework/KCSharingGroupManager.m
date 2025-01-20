@interface KCSharingGroupManager
- (void)fetchGroupParticipantsWithCompletionHandler:(id)a3;
- (void)fetchParticipantHandleFor:(NSString *)a3 groupID:(NSString *)a4 currentUserParticipantID:(NSString *)a5 completionHandler:(id)a6;
@end

@implementation KCSharingGroupManager

- (void)fetchParticipantHandleFor:(NSString *)a3 groupID:(NSString *)a4 currentUserParticipantID:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject(&unk_1001CC470, 56LL, 7LL);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v13, 1LL, 1LL, v16);
  v17 = (void *)swift_allocObject(&unk_1001CC498, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_10020E910;
  v17[5] = v15;
  v18 = (void *)swift_allocObject(&unk_1001CC4C0, 48LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = &unk_10020E918;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  uint64_t v23 = sub_100100A60((uint64_t)v13, (uint64_t)&unk_10020E920, (uint64_t)v18);
  swift_release(v23);
}

- (void)fetchGroupParticipantsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1001CC3E0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CC408, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10020E8E8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1001CC430, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10020D190;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_100100A60((uint64_t)v7, (uint64_t)&unk_10020D470, (uint64_t)v12);
  swift_release(v14);
}

@end