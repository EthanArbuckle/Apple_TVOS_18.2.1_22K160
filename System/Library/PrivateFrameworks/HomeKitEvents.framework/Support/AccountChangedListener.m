@interface AccountChangedListener
- (_TtC11homeeventsd22AccountChangedListener)init;
- (void)accountChangedWithNotification:(id)a3;
@end

@implementation AccountChangedListener

- (void)accountChangedWithNotification:(id)a3
{
  uint64_t v5 = sub_10000D228(&qword_10007EE68);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t Strong = swift_weakLoadStrong((char *)self + OBJC_IVAR____TtC11homeeventsd22AccountChangedListener_mainDriver);
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
    v11 = (void *)swift_allocObject(&unk_100077FC0, 40LL, 7LL);
    v11[2] = 0LL;
    v11[3] = 0LL;
    v11[4] = v9;
    id v12 = a3;
    v13 = self;
    uint64_t v14 = sub_10005DBB4((uint64_t)v7, (uint64_t)&unk_100080748, (uint64_t)v11);

    swift_release(v14);
  }

- (_TtC11homeeventsd22AccountChangedListener)init
{
  result = (_TtC11homeeventsd22AccountChangedListener *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.AccountChangedListener",  34LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end