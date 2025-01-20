@interface AMSAccountCachedServerData
- (void)intForKey:(unint64_t)a3 account:(ACAccount *)a4 logKey:(_TtC9appstored6LogKey *)a5 staleValueAcceptable:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation AMSAccountCachedServerData

- (void)intForKey:(unint64_t)a3 account:(ACAccount *)a4 logKey:(_TtC9appstored6LogKey *)a5 staleValueAcceptable:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject(&unk_1003DFE00, 64LL, 7LL);
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(void *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v15, 1LL, 1LL, v18);
  v19 = (void *)swift_allocObject(&unk_1003DFE28, 48LL, 7LL);
  v19[2] = 0LL;
  v19[3] = 0LL;
  v19[4] = &unk_10045A580;
  v19[5] = v17;
  v20 = (void *)swift_allocObject(&unk_1003DFE50, 48LL, 7LL);
  v20[2] = 0LL;
  v20[3] = 0LL;
  v20[4] = &unk_1004584A0;
  v20[5] = v19;
  v21 = a4;
  v22 = a5;
  v23 = self;
  uint64_t v24 = sub_100083C10((uint64_t)v15, (uint64_t)&unk_100459580, (uint64_t)v20);
  swift_release(v24);
}

@end