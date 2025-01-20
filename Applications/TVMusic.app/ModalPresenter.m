@interface ModalPresenter
+ (_TtC7TVMusic14ModalPresenter)shared;
- (_TtC7TVMusic14ModalPresenter)init;
- (void)present:(id)a3;
@end

@implementation ModalPresenter

+ (_TtC7TVMusic14ModalPresenter)shared
{
  return (_TtC7TVMusic14ModalPresenter *)sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B7220,  (id *)&qword_1002C5EE8,  (uint64_t)sub_1001913E0);
}

- (void)present:(id)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EE798);
  uint64_t v6 = swift_getKeyPath(&unk_1001EE7C0);
  id v8 = a3;
  id v7 = a3;
  static Published.subscript.setter(&v8, self, KeyPath, v6);
}

- (_TtC7TVMusic14ModalPresenter)init
{
  uint64_t v3 = sub_1000DFE10((uint64_t *)&unk_1002BD038);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = (char *)self + OBJC_IVAR____TtC7TVMusic14ModalPresenter__presentedViewController;
  uint64_t v15 = 0LL;
  v9 = self;
  uint64_t v10 = sub_1000DFE10(&qword_1002BB008);
  Published.init(initialValue:)(&v15, v10);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v8, v7, v3);

  v11 = (objc_class *)type metadata accessor for ModalPresenter(0LL);
  v14.receiver = v9;
  v14.super_class = v11;
  return -[ModalPresenter init](&v14, "init");
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7TVMusic14ModalPresenter__presentedViewController;
  uint64_t v3 = sub_1000DFE10((uint64_t *)&unk_1002BD038);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end