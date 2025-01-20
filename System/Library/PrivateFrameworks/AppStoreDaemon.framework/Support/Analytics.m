@interface Analytics
+ (void)postHashMismatchWithTaskInfo:(id)a3;
@end

@implementation Analytics

+ (void)postHashMismatchWithTaskInfo:(id)a3
{
  uint64_t v5 = swift_allocObject(&unk_1003DCC90, 24LL, 7LL);
  *(void *)(v5 + 16) = a3;
  v9[4] = sub_10001DA24;
  uint64_t v10 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  v9[2] = sub_10001CE88;
  v9[3] = &unk_1003DCCA8;
  v6 = _Block_copy(v9);
  uint64_t v7 = v10;
  id v8 = a3;
  swift_release(v7);
  sub_10030F124((uint64_t)a1, v6, 25LL);
  _Block_release(v6);
}

@end