@interface AddParticipantContainerViewController
- (BOOL)isCaptioningEnabled;
- (_TtC8FaceTime37AddParticipantContainerViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime37AddParticipantContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)conversationHUDDetailsViewControllerDidLayoutWithContentSize:(CGSize)a3;
- (void)conversationHUDRequestedAddParticipant;
- (void)dealloc;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)updateViewConstraints;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)wantsDismissal;
@end

@implementation AddParticipantContainerViewController

- (_TtC8FaceTime37AddParticipantContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000BAFF0();
}

  ;
}

- (void)dealloc
{
  v2 = self;
  sub_1000B9D5C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebarHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_infoPanelViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_conversationControlsManager));
  sub_1000BAFB0((uint64_t)self + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_activeCallContext);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_cancellables));
}

- (void)updateViewConstraints
{
  v2 = self;
  sub_1000B9F5C();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_1000BA0E0((uint64_t)a3, a4);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v20 = [v8 view];
  if (v20)
  {
    id v10 = [v7 view];
    if (v10)
    {
      v11 = v10;
      [v10 frame];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;

      v21.origin.x = v13;
      v21.origin.y = v15;
      v21.size.width = v17;
      v21.size.height = v19;
      CGRectGetHeight(v21);
      [v20 frame];
      objc_msgSend(v20, "setFrame:");

      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

- (void)wantsDismissal
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar);
  if (v2)
  {
    id v3 = self;
    v6 = v2;
    v4 = (_TtC8FaceTime37AddParticipantContainerViewController *) -[AddParticipantContainerViewController parentViewController]( v6,  "parentViewController");
    if (v4)
    {
      v5 = v4;
      -[AddParticipantContainerViewController dismissViewControllerAnimated:completion:]( v4,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);

      id v3 = v6;
      v6 = v5;
    }
  }

- (void)conversationHUDDetailsViewControllerDidLayoutWithContentSize:(CGSize)a3
{
  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_showingConversationDetails) == 1)
  {
    id v3 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebarHeightConstraint);
    if (v3)
    {
      double height = 960.0;
      if (a3.height <= 960.0) {
        double height = a3.height;
      }
      [v3 setConstant:height];
    }
  }

- (void)conversationHUDRequestedAddParticipant
{
  id v3 = self;
  sub_1000BA7AC((uint64_t)v3, v2);
}

- (BOOL)isCaptioningEnabled
{
  uint64_t v3 = sub_100018A04((uint64_t *)&unk_1001148A0);
  __chkstk_darwin(v3);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_activeCallContext;
  swift_beginAccess(v6, v11, 0LL, 0LL);
  sub_100054174((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for ActiveCallContext(0LL);
  else {
    char v8 = v5[*(int *)(v7 + 24)];
  }
  sub_1000BAFB0((uint64_t)v5);
  return v8;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_1000BB0D4(v9, a5);
}

- (_TtC8FaceTime37AddParticipantContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8FaceTime37AddParticipantContainerViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.AddParticipantContainerViewController",  46LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

@end