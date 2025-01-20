@interface MRDGroupSessionHomeObserver
+ (MRDGroupSessionHomeObserver)shared;
- (MRDGroupSessionHomeObserver)init;
- (void)currentHomeUserIdentifiersWithCompletionHandler:(id)a3;
- (void)currentUserHomeIdentifiersWithCompletionHandler:(id)a3;
@end

@implementation MRDGroupSessionHomeObserver

+ (MRDGroupSessionHomeObserver)shared
{
  if (qword_100403E70 != -1) {
    swift_once(&qword_100403E70, sub_10029583C);
  }
  return (MRDGroupSessionHomeObserver *)(id)qword_100405C90;
}

- (void)currentHomeUserIdentifiersWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100156B68(&qword_1003F86B0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1003ACAD0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1003ACAF8, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1003FCF80;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1003ACB20, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1003FCF88;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_10016F5BC((uint64_t)v7, (uint64_t)&unk_1003FCF90, (uint64_t)v12);
  swift_release(v14);
}

- (void)currentUserHomeIdentifiersWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100156B68(&qword_1003F86B0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1003ACA58, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1003ACA80, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1003FCF60;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1003ACAA8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1003FCF68;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_10016F5BC((uint64_t)v7, (uint64_t)&unk_1003FCF70, (uint64_t)v12);
  swift_release(v14);
}

- (MRDGroupSessionHomeObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  uint64_t v4 = OBJC_IVAR___MRDGroupSessionHomeObserver_managerWrapper;
  sub_100156B68(&qword_1003FCF00);
  uint64_t v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1002B2588((uint64_t)&unk_1003FCF08, 0LL);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[MRDGroupSessionHomeObserver init](&v7, "init");
}

- (void).cxx_destruct
{
}

@end