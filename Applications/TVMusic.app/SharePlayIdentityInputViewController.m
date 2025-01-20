@interface SharePlayIdentityInputViewController
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NSArray)preferredFocusEnvironments;
- (_TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController)initWithCoder:(id)a3;
- (_TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SharePlayIdentityInputViewController

- (_TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000E9134();
}

  ;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000E4FDC();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v4.receiver;
  -[SharePlayIdentityInputViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  id v3 = *(void **)&v2[OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_systemInputViewController];
  if (v3) {
    objc_msgSend(v3, "reloadInputViewsForPersistentDelegate", v4.receiver, v4.super_class);
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1000E6ED4();
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  id v6 = a3;
  v7 = self;
  id v8 = [v6 nextFocusedItem];
  if (v8
    && (id v9 = v8,
        uint64_t v10 = sub_1000E0418(0LL, (unint64_t *)&unk_1002B7E60, &OBJC_CLASS___UITextField_ptr),
        uint64_t v11 = swift_unknownObjectRetain(v9),
        char v12 = UIFocusEnvironment.contains(_:)(v11, v10),
        swift_unknownObjectRelease_n(v9, 2LL),
        (v12 & 1) != 0))
  {

    return 0;
  }

  else
  {
    v15.receiver = v7;
    v15.super_class = ObjectType;
    BOOL v13 = -[SharePlayIdentityInputViewController shouldUpdateFocusInContext:](&v15, "shouldUpdateFocusInContext:", v6);
  }

  return v13;
}

- (NSArray)preferredFocusEnvironments
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_systemInputViewController);
  if (v3)
  {
    uint64_t v4 = sub_1000DFE10(&qword_1002B8A00);
    uint64_t v5 = swift_allocObject(v4, 40LL, 7LL);
    *(_OWORD *)(v5 + 16) = xmmword_1001E9180;
    *(void *)(v5 + 32) = v3;
    uint64_t v14 = v5;
    specialized Array._endMutation()();
    uint64_t v6 = v14;
    v7 = self;
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)swift_getObjectType(self);
    id v8 = self;
    id v9 = -[SharePlayIdentityInputViewController preferredFocusEnvironments](&v15, "preferredFocusEnvironments");
    uint64_t v10 = sub_1000DFE10((uint64_t *)&unk_1002B7E50);
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

    id v3 = 0LL;
  }

  id v11 = v3;

  sub_1000DFE10((uint64_t *)&unk_1002B7E50);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)didMoveToParentViewController:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1000E7898((uint64_t)a3);
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  return 0;
}

- (_TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController *)_swift_stdlib_reportUnimplementedInitializer("TVMusic.SharePlayIdentityInputViewController", 44LL, "init(nibName:bundle:)", 21LL, 0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_acceptedIdentity);
  swift_release(*(void *)&self->acceptedIdentity[OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_acceptedIdentity]);
  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_systemInputViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_doneFocusGuide));
  id v4 = (char *)self
     + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController__headerView;
  uint64_t v5 = sub_1000DFE10(&qword_1002B7F20);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  id v6 = (char *)self
     + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController__imageView;
  uint64_t v7 = sub_1000DFE10(&qword_1002B7F28);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  sub_1000E94E4( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_imageData),  *(void *)&self->acceptedIdentity[OBJC_IVAR____TtC7TVMusicP33_688355F202F263512385C8910C7C63A836SharePlayIdentityInputViewController_imageData]);
}

@end