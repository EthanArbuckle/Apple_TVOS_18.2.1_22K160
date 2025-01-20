@interface AppDownloadDoneTask
- (_TtC9appstored19AppDownloadDoneTask)init;
- (_TtC9appstored19AppDownloadDoneTask)initWithoutKeepAlive;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation AppDownloadDoneTask

- (_TtC9appstored19AppDownloadDoneTask)init
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___URLBag);
  id v5 = sub_100255630(v4);
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___AppInstallsDatabaseStore);
  id v7 = sub_1002EEBC0(v6);
  v8 = (char *)objc_allocWithZone(ObjectType);
  *(void *)&v8[OBJC_IVAR____TtC9appstored19AppDownloadDoneTask_bag] = v5;
  *(void *)&v8[OBJC_IVAR____TtC9appstored19AppDownloadDoneTask_store] = v7;
  v13.receiver = v8;
  v13.super_class = ObjectType;
  v9 = -[Task init](&v13, "init");
  uint64_t v11 = swift_getObjectType(self, v10);
  swift_deallocPartialClassInstance(self, v11, 24LL, 7LL);
  return v9;
}

- (void)mainWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v5);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1003DEF18, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1003DEF40, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100459AC8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1003DEF68, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1004584A0;
  v12[5] = v11;
  objc_super v13 = self;
  uint64_t v14 = sub_100083C10((uint64_t)v7, (uint64_t)&unk_100459580, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC9appstored19AppDownloadDoneTask)initWithoutKeepAlive
{
  result = (_TtC9appstored19AppDownloadDoneTask *)_swift_stdlib_reportUnimplementedInitializer( "appstored.AppDownloadDoneTask",  29LL,  "init(withoutKeepAlive:)",  23LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9appstored19AppDownloadDoneTask_bag));
}

@end