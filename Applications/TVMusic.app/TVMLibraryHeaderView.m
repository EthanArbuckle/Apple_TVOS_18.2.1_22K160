@interface TVMLibraryHeaderView
- (BOOL)showPlayButtons;
- (TVMLibraryHeaderView)initWithCoder:(id)a3;
- (TVMLibraryHeaderView)initWithFrame:(CGRect)a3;
- (TVMLibraryHeaderView)initWithPageType:(int64_t)a3;
- (TVMLibraryHeaderView)initWithPageType:(int64_t)a3 artist:(id)a4 headingText:(id)a5;
- (TVMLibrarySortMenu)sortMenu;
- (UIFocusGuide)bottomEdgeFocusGuide;
- (UIView)lastFocusedView;
- (id)artistFavoriteHandler;
- (id)playHandler;
- (id)sortRequestHandler;
- (void)layoutSubviews;
- (void)setArtistFavoriteHandler:(id)a3;
- (void)setBottomEdgeFocusGuide:(id)a3;
- (void)setLastFocusedView:(id)a3;
- (void)setPlayHandler:(id)a3;
- (void)setShowPlayButtons:(BOOL)a3;
- (void)setSortRequestHandler:(id)a3;
@end

@implementation TVMLibraryHeaderView

- (TVMLibrarySortMenu)sortMenu
{
  return (TVMLibrarySortMenu *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR___TVMLibraryHeaderView_sortMenu));
}

- (UIFocusGuide)bottomEdgeFocusGuide
{
  return (UIFocusGuide *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR___TVMLibraryHeaderView_bottomEdgeFocusGuide));
}

- (void)setBottomEdgeFocusGuide:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_bottomEdgeFocusGuide);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_bottomEdgeFocusGuide) = (Class)a3;
  id v3 = a3;
}

- (UIView)lastFocusedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___TVMLibraryHeaderView_lastFocusedView));
}

- (void)setLastFocusedView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_lastFocusedView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_lastFocusedView) = (Class)a3;
  id v3 = a3;
}

- (id)sortRequestHandler
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_sortMenu);
  if (!v2) {
    return 0LL;
  }
  id v3 = (void *)(v2 + OBJC_IVAR___TVMLibrarySortMenu_selectionHandler);
  if (!*v3) {
    return 0LL;
  }
  uint64_t v4 = v3[1];
  v8[4] = *v3;
  uint64_t v9 = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_100116334;
  v8[3] = &unk_100272860;
  v5 = _Block_copy(v8);
  uint64_t v6 = v9;
  swift_retain(v4);
  swift_release(v6);
  return v5;
}

- (void)setSortRequestHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject(&unk_100272848, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    uint64_t v4 = sub_10011CD34;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_sortMenu);
  if (v7)
  {
    v8 = (void *)(v7 + OBJC_IVAR___TVMLibrarySortMenu_selectionHandler);
    v10 = *(void **)(v7 + OBJC_IVAR___TVMLibrarySortMenu_selectionHandler);
    uint64_t v9 = v8[1];
    void *v8 = v4;
    v8[1] = v6;
    uint64_t v4 = v10;
  }

  else
  {
    uint64_t v9 = v6;
  }

  sub_1000E03F0((uint64_t)v4, v9);
}

- (id)playHandler
{
  return sub_100116588( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVMLibraryHeaderView_playHandler,  (uint64_t)&unk_100272810);
}

- (void)setPlayHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v4 = (void *)swift_allocObject(&unk_1002727F8, 24LL, 7LL);
    v4[2] = v5;
    uint64_t v6 = sub_10011D500;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___TVMLibraryHeaderView_playHandler);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_playHandler);
  uint64_t v8 = *(void *)&self->pageType[OBJC_IVAR___TVMLibraryHeaderView_playHandler];
  *uint64_t v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1000E03F0(v9, v8);
}

- (id)artistFavoriteHandler
{
  return sub_100116588( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVMLibraryHeaderView_artistFavoriteHandler,  (uint64_t)&unk_1002727C0);
}

- (void)setArtistFavoriteHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v4 = (void *)swift_allocObject(&unk_1002727A8, 24LL, 7LL);
    v4[2] = v5;
    uint64_t v6 = sub_10011CD14;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = (uint64_t (**)(char))((char *)self + OBJC_IVAR___TVMLibraryHeaderView_artistFavoriteHandler);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_artistFavoriteHandler);
  uint64_t v8 = *(void *)&self->pageType[OBJC_IVAR___TVMLibraryHeaderView_artistFavoriteHandler];
  *uint64_t v7 = v6;
  v7[1] = (uint64_t (*)(char))v4;
  sub_1000E03F0(v9, v8);
}

- (BOOL)showPlayButtons
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_showPlayButtons);
}

- (void)setShowPlayButtons:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_showPlayButtons) = a3;
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_buttonConfig);
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EB028);
  uint64_t v6 = swift_getKeyPath(&unk_1001EB050);
  BOOL v7 = a3;
  swift_retain(v4);
  static Published.subscript.setter(&v7, v4, KeyPath, v6);
}

- (TVMLibraryHeaderView)initWithPageType:(int64_t)a3
{
  return -[TVMLibraryHeaderView initWithPageType:artist:headingText:]( self,  "initWithPageType:artist:headingText:",  a3,  0LL,  0LL);
}

- (TVMLibraryHeaderView)initWithPageType:(int64_t)a3 artist:(id)a4 headingText:(id)a5
{
  if (a5)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
  }

  id v10 = a4;
  return (TVMLibraryHeaderView *)sub_100116784(a3, a4, v7, v9);
}

- (TVMLibraryHeaderView)initWithCoder:(id)a3
{
  uint64_t v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_playHandler);
  *uint64_t v4 = 0LL;
  v4[1] = 0LL;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_artistFavoriteHandler);
  void *v5 = 0LL;
  v5[1] = 0LL;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_showPlayButtons) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMLibraryHeaderView_filterObserver) = 0LL;
  id v6 = a3;

  result = (TVMLibraryHeaderView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/LibraryControls.swift",  29LL,  2LL,  136LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LibraryHeaderView();
  uint64_t v2 = (char *)v4.receiver;
  -[TVMLibraryHeaderView layoutSubviews](&v4, "layoutSubviews");
  id v3 = *(void **)&v2[OBJC_IVAR___TVMLibraryHeaderView_controlsView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (TVMLibraryHeaderView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end