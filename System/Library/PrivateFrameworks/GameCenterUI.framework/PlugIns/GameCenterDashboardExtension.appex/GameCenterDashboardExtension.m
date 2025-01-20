id sub_100003420(uint64_t a1)
{
  return _[*(id *)(a1 + 32) donePressed:0];
}

void sub_100003634(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 layer]);
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) effectView]);
  [v6 setBackgroundEffects:v5];
}

void sub_100003728(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___CAMediaTimingFunction);
  LODWORD(v3) = 1050253722;
  LODWORD(v4) = 1045220557;
  LODWORD(v5) = 1061997773;
  LODWORD(v6) = 0.75;
  v7 = -[CAMediaTimingFunction initWithControlPoints::::](v2, "initWithControlPoints::::", v3, v4, v6, v5);
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setAnimationTimingFunction:](&OBJC_CLASS___CATransaction, "setAnimationTimingFunction:", v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100003828;
  v14[3] = &unk_10000C4B0;
  v8 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_1000038A0;
  v12 = &unk_10000C540;
  id v13 = v8;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v14,  &v9,  0.33);
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit", v9, v10, v11, v12);
}

void sub_100003828(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 layer]);
  LODWORD(v4) = 0;
  [v3 setOpacity:v4];

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) effectView]);
  [v5 setBackgroundEffects:&__NSArray0__struct];
}

uint64_t sub_1000038A0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100003D34(id a1, NSError *a2)
{
  v2 = a2;
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  double v4 = (void *)os_log_GKHosted;
  if (os_log_type_enabled(os_log_GKHosted, OS_LOG_TYPE_DEBUG)) {
    sub_1000075FC(v4, v2);
  }
}
}

uint64_t sub_100004914(__int128 *a1)
{
  __int128 v2 = *a1;
  return swift_getOpaqueTypeConformance2( &v2,  &opaque type descriptor for <<opaque return type of View.focusable(_:)>>,  1LL);
}

void sub_100004948()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for ChicletMetadataShimView();
  sub_10000575C((uint64_t)v7.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v7);
  sub_100005788();
}

void sub_10000499C(void *a1)
{
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for ChicletMetadataShimView();
  sub_1000057B0((uint64_t)v9.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v9);

  sub_1000057D8();
}

id sub_1000049FC()
{
  return sub_100005618(type metadata accessor for ChicletMetadataShimView);
}

uint64_t type metadata accessor for ChicletMetadataShimView()
{
  return objc_opt_self(&OBJC_CLASS____TtC28GameCenterDashboardExtension23ChicletMetadataShimView);
}

void *sub_100004A48()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint);
  id v2 = v1;
  return v1;
}

void sub_100004ABC(uint64_t a1)
{
}

uint64_t sub_100004AE8()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_rank);
}

void sub_100004B3C()
{
}

uint64_t sub_100004B84()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_caption);
}

void sub_100004BD8()
{
}

uint64_t sub_100004C20()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitle);
}

void sub_100004C74()
{
}

uint64_t sub_100004CBC()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badge);
}

void sub_100004D10()
{
}

uint64_t sub_100004D58()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badgeContainer);
}

void sub_100004DAC()
{
}

uint64_t sub_100004DF4()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_stackView);
}

void sub_100004E48()
{
}

void *sub_100004E90()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_vibrancyView);
  id v2 = v1;
  return v1;
}

void sub_100004F04(uint64_t a1)
{
}

void sub_100004F10()
{
  v32.receiver = v0;
  v32.super_class = (Class)type metadata accessor for ChicletMetadata();
  sub_1000057BC((uint64_t)v32.super_class, "awakeFromNib", v1, v2, v3, v4, v5, v6, v32);
  uint64_t v7 = sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_rank);
  if (!v7)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v8 = (void *)v7;
  id v9 = [(id)objc_opt_self(UIFont) preferredFontForTextStyle:UIFontTextStyleTitle1];
  [v8 setFont:v9];

  uint64_t v10 = &v0[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_caption];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_caption]);
  if (!Strong)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  id v13 = (void *)Strong;
  id v14 = sub_100005798(Strong, v12, (uint64_t)UIFontTextStyleCaption2);
  [v13 setFont:v14];

  uint64_t v15 = sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitle);
  if (!v15)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  v17 = (void *)v15;
  id v18 = sub_100005798(v15, v16, (uint64_t)UIFontTextStyleFootnote);
  [v17 setFont:v18];

  uint64_t v19 = swift_unknownObjectWeakLoadStrong(v10);
  if (!v19)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  v20 = (void *)v19;
  id v21 = [(id)objc_opt_self(UIColor) whiteColor];
  id v22 = [v21 colorWithAlphaComponent:0.4];

  [v20 setTextColor:v22];
  uint64_t v23 = OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_vibrancyView;
  v24 = *(void **)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_vibrancyView];
  if (!v24)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  v25 = (void *)objc_opt_self(&OBJC_CLASS___UIVisualEffect);
  id v26 = v24;
  id v27 = [v25 _gkGameLayerContentVibrancyEffect];
  [v26 setEffect:v27];

  v28 = *(void **)&v0[v23];
  if (v28)
  {
    uint64_t v29 = *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_visualEffectGroupName];
    uint64_t v30 = *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_visualEffectGroupName + 8];
    id v31 = v28;
    swift_bridgeObjectRetain(v30);
    sub_100007484(v29, v30, v31);

    swift_bridgeObjectRelease(v30);
    return;
  }

LABEL_13:
  __break(1u);
}

void sub_1000051C0()
{
  v25.receiver = v0;
  v25.super_class = (Class)type metadata accessor for ChicletMetadata();
  sub_1000057BC((uint64_t)v25.super_class, "layoutSubviews", v1, v2, v3, v4, v5, v6, v25);
  uint64_t v7 = (void *)sub_1000057A8();
  if (!v7)
  {
    __break(1u);
    goto LABEL_6;
  }

  uint64_t v8 = v7;
  id v9 = [v7 layer];

  uint64_t v10 = (void *)sub_1000057A8();
  if (!v10)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  v11 = v10;
  [v10 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v26.origin.x = v13;
  v26.origin.y = v15;
  v26.size.width = v17;
  v26.size.height = v19;
  [v9 setCornerRadius:CGRectGetHeight(v26) * 0.5];

  v20 = (void *)sub_1000057A8();
  if (v20)
  {
    id v21 = v20;
    id v22 = [v20 layer];

    id v23 = [(id)objc_opt_self(UIColor) systemRedColor];
    id v24 = [v23 CGColor];

    [v22 setBackgroundColor:v24];
    return;
  }

LABEL_7:
  __break(1u);
}

uint64_t sub_10000537C()
{
  return sub_1000053E0(&OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_rank);
}

uint64_t sub_1000053A8()
{
  return sub_1000053E0(&OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_caption);
}

uint64_t sub_1000053D4()
{
  return sub_1000053E0(&OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitle);
}

uint64_t sub_1000053E0(uint64_t *a1)
{
  uint64_t result = sub_100005704(*a1);
  if (!result) {
    __break(1u);
  }
  return result;
}

void sub_100005400()
{
  *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint] = 0LL;
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_rank);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_caption);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitle);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badge);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badgeContainer);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_stackView);
  *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_vibrancyView] = 0LL;
  v7.receiver = v0;
  v7.super_class = (Class)sub_100005714(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_visualEffectGroupName);
  sub_10000575C((uint64_t)v7.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v7);
  sub_100005788();
}

void sub_1000054BC(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint] = 0LL;
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_rank);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_caption);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitle);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badge);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badgeContainer);
  sub_1000056F8(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_stackView);
  *(void *)&v1[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_vibrancyView] = 0LL;
  v9.receiver = v1;
  v9.super_class = (Class)sub_100005714(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_visualEffectGroupName);
  sub_1000057B0((uint64_t)v9.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v9);

  sub_1000057D8();
}

uint64_t sub_100005584()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint));
  sub_100005740(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_rank);
  sub_100005740(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_caption);
  sub_100005740(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitle);
  sub_100005740(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badge);
  sub_100005740(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badgeContainer);
  sub_100005740(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_stackView);

  return swift_bridgeObjectRelease(*(void *)(v0
                                             + OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_visualEffectGroupName
                                             + 8));
}

id sub_10000560C()
{
  return sub_100005618(type metadata accessor for ChicletMetadata);
}

id sub_100005618(uint64_t (*a1)(void))
{
  v9.receiver = v1;
  v9.super_class = (Class)a1();
  return sub_1000057BC((uint64_t)v9.super_class, "dealloc", v2, v3, v4, v5, v6, v7, v9);
}

uint64_t type metadata accessor for ChicletMetadata()
{
  return objc_opt_self(&OBJC_CLASS____TtC28GameCenterDashboardExtension15ChicletMetadata);
}

uint64_t sub_1000056F8@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakInit(v1 + a1, 0LL);
}

uint64_t sub_100005704@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakLoadStrong(v1 + a1);
}

void sub_10000570C(id a1)
{
}

uint64_t sub_100005714@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (char *)(v1 + a1);
  strcpy(v2, "gameLayerGroup");
  v2[15] = -18;
  return type metadata accessor for ChicletMetadata();
}

uint64_t sub_100005740@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakDestroy(v1 + a1);
}

uint64_t sub_100005748@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakAssign(v1 + a1);
}

void sub_100005750(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void **)(v2 + a2);
  *(void *)(v2 + a2) = a1;
}

id sub_10000575C( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v12, v11, v10, v9);
}

uint64_t sub_100005774@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakDestroy(v1 + a1);
}

  ;
}

  ;
}

id sub_100005798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(v3, *(SEL *)(v4 + 2192), a3, 2);
}

uint64_t sub_1000057A8()
{
  return swift_unknownObjectWeakLoadStrong(v0);
}

id sub_1000057B0( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v9);
}

id sub_1000057BC( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

  ;
}

  ;
}

void sub_1000057E4()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtC28GameCenterDashboardExtension22DashboardLaunchManager_dismissHandler);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC28GameCenterDashboardExtension22DashboardLaunchManager_dismissHandler + 8);
    uint64_t v3 = swift_retain(v2);
    v1(v3);
    sub_100005D0C((uint64_t)v1, v2);
  }

id sub_1000058A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_100005C50(&qword_100012548);
  ((void (*)(void))__chkstk_darwin)();
  double v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DashboardLaunchContext(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = ((uint64_t (*)(void))__chkstk_darwin)();
  CGFloat v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  CGFloat v17 = (char *)&v26 - v16;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v5);
  id v19 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  if (a1)
  {
    uint64_t v20 = sub_100005CAC(a1);
    if (!v21)
    {
      uint64_t v20 = 0LL;
      unint64_t v21 = 0xE000000000000000LL;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
    unint64_t v21 = 0xE000000000000000LL;
  }

  DashboardLaunchContext.init(rawValue:)(v20, v21);
  if (sub_100005C90((uint64_t)v10, 1LL, v11) == 1)
  {
    (*(void (**)(char *, void, uint64_t))(v12 + 104))( v17,  enum case for DashboardLaunchContext.inGame(_:),  v11);
    sub_100005D1C((uint64_t)v10, &qword_100012548);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
  }

  type metadata accessor for JetDashboardViewController(0LL);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  id v22 = a1;
  id v23 = v19;
  id v24 = (id)JetDashboardViewController.__allocating_init(nibName:bundle:launchContext:request:)( 0LL,  0LL,  v19,  v15,  a1);
  sub_100005C9C(a3, a4);
  dispatch thunk of BaseJetCollectionViewController.dismissHandler.setter(a3, a4);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  return v24;
}

id sub_100005B84()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC28GameCenterDashboardExtension22DashboardLaunchManager_dismissHandler];
  uint64_t v2 = (objc_class *)type metadata accessor for DashboardLaunchManager();
  *(void *)uint64_t v1 = 0LL;
  *((void *)v1 + 1) = 0LL;
  v4.receiver = v0;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, "init");
}

id sub_100005BEC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DashboardLaunchManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DashboardLaunchManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC28GameCenterDashboardExtension22DashboardLaunchManager);
}

uint64_t sub_100005C50(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100005C9C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_100005CAC(void *a1)
{
  id v1 = [a1 launchContext];
  if (!v1) {
    return 0LL;
  }
  objc_super v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_100005D0C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100005D1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005C50(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100005D58()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100005D7C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

id sub_100005D88()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for DashboardCollectionViewCell();
  return sub_10000575C((uint64_t)v8.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v8);
}

id sub_100005DE8(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for DashboardCollectionViewCell();
  id v9 = sub_1000057B0((uint64_t)v11.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id sub_100005E50()
{
  return sub_100007380(type metadata accessor for DashboardCollectionViewCell);
}

uint64_t type metadata accessor for DashboardCollectionViewCell()
{
  return objc_opt_self(&OBJC_CLASS____TtC28GameCenterDashboardExtension27DashboardCollectionViewCell);
}

uint64_t sub_100005E9C()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_container);
}

void sub_100005EF0()
{
}

uint64_t sub_100005F38()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_metadataContainer);
}

void sub_100005F8C()
{
}

uint64_t sub_100005FD4()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_iconContainer);
}

void sub_100006028()
{
}

uint64_t sub_100006070()
{
  return sub_100005704(OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_titleLabel);
}

void sub_1000060C4()
{
}

void sub_1000060EC(uint64_t a1)
{
}

void sub_1000060F8(uint64_t a1)
{
}

void sub_100006104(uint64_t a1)
{
}

void sub_100006110()
{
  id v5 = objc_msgSend(objc_allocWithZone(_UIFloatingContentView), "initWithFrame:", v1, v2, v3, v4);
  [v5 setFocusedSizeIncrease:32.0];
  objc_msgSend(v5, "setContentMotionRotation:translation:", 0.0, 0.0, 24.0, 24.0);
  id v6 = [(id)objc_opt_self(UIColor) clearColor];
  [v5 setBackgroundColor:v6 forState:8];

  [v0 addSubview:v5];
  sub_100007560(v5, "setTranslatesAutoresizingMaskIntoConstraints:");
  id v7 = [(id)objc_opt_self(NSLayoutConstraint) _gkInstallEdgeConstraintsForView:v5 containedWithinParentView:v0];
  id v8 = sub_100007528((uint64_t)v7, "contentView");
  if (v8)
  {
    id v9 = v8;
    id v10 = sub_1000074C8((uint64_t)v8, "contentView");
    [v9 addSubview:v10];

    id v11 = v5;
    sub_100006104((uint64_t)v5);
  }

  else
  {
    __break(1u);
  }

void sub_1000062B4()
{
  v78.receiver = v0;
  v78.super_class = (Class)type metadata accessor for ChicletCell();
  objc_msgSendSuper2(&v78, "awakeFromNib");
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_titleLabel]);
  if (!Strong)
  {
    __break(1u);
    goto LABEL_15;
  }

  double v3 = (void *)Strong;
  id v4 =  [(id)objc_opt_self(UIFont) _gkPreferredFontForTextStyle:UIFontTextStyleHeadline symbolicTraits:2];
  [v3 setFont:v4];

  id v5 = [objc_allocWithZone(UIVisualEffectView) init];
  sub_100007580();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v5 setBackgroundEffects:isa];

  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectGroupName];
  uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectGroupName + 8];
  swift_bridgeObjectRetain(v8);
  sub_100007484(v7, v8, v5);
  swift_bridgeObjectRelease(v8);
  id v9 = v5;
  sub_1000060EC((uint64_t)v5);
  id v11 = sub_1000074C8(v10, "contentView");
  [v11 insertSubview:v9 atIndex:0];

  id v12 = sub_100007560(v9, "setTranslatesAutoresizingMaskIntoConstraints:");
  id v13 = sub_100007528((uint64_t)v12, "leadingAnchor");
  id v14 = sub_1000074C8((uint64_t)v13, "contentView");
  id v15 = sub_100007568(v14);
  sub_1000074F8();
  id v16 = sub_1000074E0();
  sub_100007530();

  sub_1000074D0();
  id v18 = sub_100007528(v17, "trailingAnchor");
  id v19 = sub_1000074C8((uint64_t)v18, "contentView");
  id v20 = [v19 trailingAnchor];
  sub_1000074F8();
  id v21 = sub_1000074E0();
  sub_100007530();

  sub_1000074D0();
  id v23 = sub_100007528(v22, "topAnchor");
  id v24 = sub_1000074C8((uint64_t)v23, "contentView");
  id v25 = [v24 topAnchor];
  sub_1000074F8();
  id v26 = sub_1000074E0();
  sub_100007530();

  sub_1000074D0();
  id v28 = sub_100007528(v27, "bottomAnchor");
  id v29 = sub_1000074C8((uint64_t)v28, "contentView");
  id v30 = sub_100007578(v29);
  sub_1000074F8();
  id v31 = sub_1000074E0();
  sub_100007530();

  sub_1000074D0();
  id v33 = sub_100007528(v32, "layer");
  [v33 setCornerRadius:30.0];

  id v35 = sub_100007528(v34, "layer");
  [v35 setCornerCurve:kCACornerCurveContinuous];

  id v37 = sub_100007528(v36, "layer");
  sub_1000074F0(v37, "setMasksToBounds:");

  objc_msgSend( objc_allocWithZone(UIVisualEffectView),  "initWithEffect:",  objc_msgSend(objc_allocWithZone(UIVisualEffect), "init"));
  sub_100007530();
  sub_1000060F8((uint64_t)v29);
  v38 = (void *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_iconContainer]);
  if (!v38)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v39 = OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_vibrancyView;
  if (!*(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_vibrancyView])
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  v40 = v38;
  objc_msgSend(v38, "addSubview:");

  v41 = *(void **)&v0[v39];
  if (!v41)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  sub_100007560(v41, "setTranslatesAutoresizingMaskIntoConstraints:");
  v42 = *(void **)&v0[v39];
  if (!v42)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  id v43 = sub_100007568(v42);
  v44 = (void *)sub_100007538();
  if (!v44)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  v45 = v44;
  id v46 = sub_100007568(v44);
  sub_100007570();
  id v47 = sub_100007544();
  sub_1000074F8();

  sub_1000074F0(v45, "setActive:");
  v48 = *(void **)&v0[v39];
  if (!v48)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  id v49 = [v48 trailingAnchor];
  v50 = (void *)sub_100007538();
  if (!v50)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  v51 = v50;
  id v52 = [v50 trailingAnchor];
  sub_100007570();
  id v53 = [v40 constraintEqualToAnchor:&stru_100010FF0.type constant:15.0];
  sub_1000074F8();

  sub_1000074F0(v51, "setActive:");
  v54 = *(void **)&v0[v39];
  if (!v54)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  id v55 = [v54 topAnchor];
  v56 = (void *)sub_100007538();
  if (!v56)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  v57 = v56;
  id v58 = [v56 topAnchor];
  sub_100007570();
  id v59 = sub_100007544();
  sub_1000074F8();

  sub_1000074F0(v57, "setActive:");
  v60 = *(void **)&v0[v39];
  if (!v60)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  id v61 = sub_100007578(v60);
  v62 = (void *)sub_100007538();
  if (v62)
  {
    v63 = v62;
    id v64 = sub_100007578(v62);

    id v65 = [v40 constraintEqualToAnchor:v64 constant:15.0];
    sub_1000074F0(v65, "setActive:");

    id v67 = objc_msgSend(sub_1000074C8(v66, "contentView"), "layer");
    sub_100007530();
    sub_100007560(v40, "setMasksToBounds:");

    id v69 = sub_1000074C8(v68, "layer");
    id v70 =  objc_msgSend( objc_msgSend((id)objc_opt_self(UIColor), "blackColor"),  "CGColor");
    sub_1000074F8();
    [v69 setShadowColor:v64];

    id v72 = sub_1000074C8(v71, "layer");
    LODWORD(v73) = 1045220557;
    [v72 setShadowOpacity:v73];

    id v75 = sub_1000074C8(v74, "layer");
    objc_msgSend(v75, "setShadowOffset:", 0.0, 6.0);

    id v77 = sub_1000074C8(v76, "layer");
    [v77 setShadowRadius:12.0];

    sub_100006110();
    return;
  }

LABEL_25:
  __break(1u);
}

uint64_t sub_1000069F8(uint64_t a1)
{
  double v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100006A24(uint64_t a1, void *a2)
{
  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for ChicletCell();
  objc_msgSendSuper2(&v14, "didUpdateFocusInContext:withAnimationCoordinator:", a1, a2);
  id v5 = *(void **)&v2[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_floatingView];
  if (v5)
  {
    id v6 = v5;
    else {
      uint64_t v7 = 0LL;
    }
    [v6 setControlState:v7 withAnimationCoordinator:a2];
  }

  uint64_t v8 = swift_allocObject(&unk_10000C710, 24LL, 7LL);
  *(void *)(v8 + 16) = v2;
  v12[4] = sub_100007464;
  uint64_t v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256LL;
  v12[2] = sub_1000069F8;
  v12[3] = &unk_10000C728;
  id v9 = _Block_copy(v12);
  uint64_t v10 = v13;
  id v11 = v2;
  swift_release(v10);
  [a2 addCoordinatedAnimations:v9 completion:0];
  _Block_release(v9);
}

void sub_100006B4C(char *a1)
{
  if (![a1 isFocused])
  {
    uint64_t v13 = *(void **)&a1[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectView];
    if (v13)
    {
      sub_100007404();
      id v14 = v13;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      [v14 setBackgroundEffects:isa];
    }

    id v16 = [a1 layer];
    [v16 setZPosition:0.0];
    goto LABEL_12;
  }

  uint64_t v2 = *(void *)&a1[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_customBackgroundBlur];
  uint64_t v17 = v2;
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  swift_bridgeObjectRetain(v2);
  id v4 = [v3 whiteColor];
  id v5 = [v4 colorWithAlphaComponent:0.22];

  id v6 = [(id)objc_opt_self(UIVisualEffect) effectCompositingColor:v5];
  if (v6)
  {
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v8 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    unint64_t v7 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
    if (v8 >= v7 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v7 > 1, v8 + 1, 1LL);
    }
    uint64_t v9 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v6);
    specialized Array._endMutation()(v9);
    uint64_t v10 = *(void **)&a1[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectView];
    if (v10)
    {
      sub_100007404();
      id v11 = v10;
      Class v12 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v17);
      [v11 setBackgroundEffects:v12];
    }

    else
    {
      swift_bridgeObjectRelease(v17);
    }

    id v16 = [a1 layer];
    [v16 setZPosition:999.0];
LABEL_12:

    [a1 layoutIfNeeded];
    return;
  }

  __break(1u);
}

uint64_t sub_100006E2C()
{
  return sub_100006E64(&OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_titleLabel);
}

uint64_t sub_100006E58()
{
  return sub_100006E64(&OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_metadataContainer);
}

uint64_t sub_100006E64(void *a1)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong(v1 + *a1);
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_100006E90()
{
  uint64_t v2 = OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_customBackgroundBlur;
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___UIVisualEffect);
  id v4 = v0;
  id v5 = [v3 _gkGameLayerModuleVisualEffect];
  unint64_t v6 = sub_100007580();
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
  sub_100007530();
  *(void *)&v0[v2] = v1;
  swift_unknownObjectWeakInit(&v4[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_coordinator], 0LL);
  *(void *)&v4[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectView] = 0LL;
  *(void *)&v4[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_transitionDuration] = 0x3FC3333333333333LL;
  *(void *)&v4[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_vibrancyView] = 0LL;
  v4[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_vibrantIcon] = 1;
  sub_100007500(&v4[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectGroupName]);
  *(void *)&v4[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_floatingView] = 0LL;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for ChicletCell();
  return sub_10000575C((uint64_t)v14.super_class, "initWithFrame:", v7, v8, v9, v10, v11, v12, v14);
}

id sub_100006FFC(void *a1)
{
  uint64_t v4 = OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_customBackgroundBlur;
  id v5 = (void *)objc_opt_self(&OBJC_CLASS___UIVisualEffect);
  unint64_t v6 = v1;
  id v7 = [v5 _gkGameLayerModuleVisualEffect];
  unint64_t v8 = sub_100007580();
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);
  sub_1000074F8();
  *(void *)&v1[v4] = v2;
  swift_unknownObjectWeakInit(&v6[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_coordinator], 0LL);
  *(void *)&v6[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectView] = 0LL;
  *(void *)&v6[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_transitionDuration] = 0x3FC3333333333333LL;
  *(void *)&v6[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_vibrancyView] = 0LL;
  v6[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_vibrantIcon] = 1;
  sub_100007500(&v6[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectGroupName]);
  *(void *)&v6[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_floatingView] = 0LL;

  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for ChicletCell();
  id v15 = sub_1000057B0((uint64_t)v17.super_class, "initWithCoder:", v9, v10, v11, v12, v13, v14, v17);

  return v15;
}

void sub_100007168()
{
  swift_bridgeObjectRelease(*(void *)(v0
                                      + OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_customBackgroundBlur));
  sub_100005740(OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_coordinator);

  swift_bridgeObjectRelease(*(void *)(v0
                                      + OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectGroupName
                                      + 8));
}

id sub_100007204()
{
  return sub_100007380(type metadata accessor for ChicletCell);
}

uint64_t type metadata accessor for ChicletCell()
{
  return objc_opt_self(&OBJC_CLASS____TtC28GameCenterDashboardExtension11ChicletCell);
}

id sub_1000072D8()
{
  *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension23BasicChicletCoordinator_metadataViews] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension23BasicChicletCoordinator_currentMetadataIndex] = -1LL;
  v0[OBJC_IVAR____TtC28GameCenterDashboardExtension23BasicChicletCoordinator_initialAppearance] = 1;
  *(void *)&v0[OBJC_IVAR____TtC28GameCenterDashboardExtension23BasicChicletCoordinator_chiclet] = 0LL;
  v0[OBJC_IVAR____TtC28GameCenterDashboardExtension23BasicChicletCoordinator_reloadRequested] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BasicChicletCoordinator();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100007374()
{
  return sub_100007380(type metadata accessor for BasicChicletCoordinator);
}

id sub_100007380(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for BasicChicletCoordinator()
{
  return objc_opt_self(&OBJC_CLASS____TtC28GameCenterDashboardExtension23BasicChicletCoordinator);
}

unint64_t sub_100007404()
{
  unint64_t result = qword_100012658;
  if (!qword_100012658)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___UIVisualEffect);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100012658);
  }

  return result;
}

uint64_t sub_100007440()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100007464()
{
}

uint64_t sub_10000746C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000747C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100007484(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a3 _setGroupName:v4];
}

id sub_1000074C8(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

id sub_1000074D0()
{
  return objc_msgSend(v0, *(SEL *)(v1 + 2424), 1);
}

id sub_1000074E0()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 2416), v1);
}

id sub_1000074F0(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 1);
}

void sub_1000074F8()
{
}

void sub_100007500(char *a1@<X8>)
{
  a1[15] = -18;
}

id sub_100007528(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void sub_100007530()
{
}

uint64_t sub_100007538()
{
  return swift_unknownObjectWeakLoadStrong(v0);
}

id sub_100007544()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 2480), v1, -15.0);
}

void sub_100007558(id a1)
{
}

id sub_100007560(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

id sub_100007568(void *a1)
{
  return [a1 *(SEL *)(v1 + 2408)];
}

void sub_100007570()
{
}

id sub_100007578(void *a1)
{
  return [a1 *(SEL *)(v1 + 2448)];
}

unint64_t sub_100007580()
{
  return sub_100007404();
}

void sub_100007588(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "error while decoding messageFromClient in GKDashboardExtensionViewController:%@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000075FC(void *a1, void *a2)
{
  uint64_t v3 = a1;
  NSString v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v5 = 138412290;
  unint64_t v6 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "error calling host - %@",  (uint8_t *)&v5,  0xCu);
}

uint64_t _s7SwiftUI4ViewP28GameCenterDashboardExtensionE11GKFocusableyQrSbF_0()
{
  return View.focusable(_:)();
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return _[a1 _auxiliaryConnection];
}

id objc_msgSend__gkExtensionWantsCustomRightBarButtonItemInViewService(void *a1, const char *a2, ...)
{
  return _[a1 _gkExtensionWantsCustomRightBarButtonItemInViewService];
}

id objc_msgSend__gkXmarkedCloseButtonWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gkXmarkedCloseButtonWithTarget:action:");
}

id objc_msgSend_achievementIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 achievementIdentifier];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activityIdentifier];
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_backgroundEffects(void *a1, const char *a2, ...)
{
  return _[a1 backgroundEffects];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentGame(void *a1, const char *a2, ...)
{
  return _[a1 currentGame];
}

id objc_msgSend_dashboardAssetNames(void *a1, const char *a2, ...)
{
  return _[a1 dashboardAssetNames];
}

id objc_msgSend_dashboardRequest(void *a1, const char *a2, ...)
{
  return _[a1 dashboardRequest];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_effectView(void *a1, const char *a2, ...)
{
  return _[a1 effectView];
}

id objc_msgSend_emphasizedTextColor(void *a1, const char *a2, ...)
{
  return _[a1 emphasizedTextColor];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_extensionIsFinishing(void *a1, const char *a2, ...)
{
  return _[a1 extensionIsFinishing];
}

id objc_msgSend_gameBundleID(void *a1, const char *a2, ...)
{
  return _[a1 gameBundleID];
}

id objc_msgSend_gameRecordForPlayer_game_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gameRecordForPlayer:game:");
}

id objc_msgSend_hostObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 hostObjectProxy];
}

id objc_msgSend_initWithControlPoints__::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControlPoints::::");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithInternalRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInternalRepresentation:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return _[a1 internal];
}

id objc_msgSend_isArcade(void *a1, const char *a2, ...)
{
  return _[a1 isArcade];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_launchContext(void *a1, const char *a2, ...)
{
  return _[a1 launchContext];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leaderboardAssetNames(void *a1, const char *a2, ...)
{
  return _[a1 leaderboardAssetNames];
}

id objc_msgSend_leaderboardIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 leaderboardIdentifier];
}

id objc_msgSend_leaderboardInternal(void *a1, const char *a2, ...)
{
  return _[a1 leaderboardInternal];
}

id objc_msgSend_leaderboardPlayerScope(void *a1, const char *a2, ...)
{
  return _[a1 leaderboardPlayerScope];
}

id objc_msgSend_leaderboardSetAssetNames(void *a1, const char *a2, ...)
{
  return _[a1 leaderboardSetAssetNames];
}

id objc_msgSend_leaderboardSetIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 leaderboardSetIdentifier];
}

id objc_msgSend_leaderboardTimeScope(void *a1, const char *a2, ...)
{
  return _[a1 leaderboardTimeScope];
}

id objc_msgSend_leaderboardTitle(void *a1, const char *a2, ...)
{
  return _[a1 leaderboardTitle];
}

id objc_msgSend_localPlayer(void *a1, const char *a2, ...)
{
  return _[a1 localPlayer];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_playerAlias(void *a1, const char *a2, ...)
{
  return _[a1 playerAlias];
}

id objc_msgSend_playerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 playerIdentifier];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_requestDashboardLogoImageWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDashboardLogoImageWithHandler:");
}

id objc_msgSend_requestImagesForLeaderboardSetsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImagesForLeaderboardSetsWithHandler:");
}

id objc_msgSend_requestImagesForLeaderboardsInSet_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImagesForLeaderboardsInSet:handler:");
}

id objc_msgSend_sendMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessageToClient:");
}

id objc_msgSend_setAchievementID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAchievementID:");
}

id objc_msgSend_setAchievementIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAchievementIdentifier:");
}

id objc_msgSend_setActivityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityIdentifier:");
}

id objc_msgSend_setAdjustTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustTopConstraint:");
}

id objc_msgSend_setAnimationTimingFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationTimingFunction:");
}

id objc_msgSend_setBackgroundEffects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundEffects:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setDashboardAssetNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDashboardAssetNames:");
}

id objc_msgSend_setDashboardAssetNames_leaderboardSetAssetNames_leaderboardAssetNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDashboardAssetNames:leaderboardSetAssetNames:leaderboardAssetNames:");
}

id objc_msgSend_setDashboardRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDashboardRequest:");
}

id objc_msgSend_setGameBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGameBundleID:");
}

id objc_msgSend_setGameRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGameRecord:");
}

id objc_msgSend_setIsArcade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsArcade:");
}

id objc_msgSend_setLaunchContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchContext:");
}

id objc_msgSend_setLeaderboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboard:");
}

id objc_msgSend_setLeaderboardAssetNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardAssetNames:");
}

id objc_msgSend_setLeaderboardID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardID:");
}

id objc_msgSend_setLeaderboardIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardIdentifier:");
}

id objc_msgSend_setLeaderboardInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardInternal:");
}

id objc_msgSend_setLeaderboardPlayerScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardPlayerScope:");
}

id objc_msgSend_setLeaderboardSetAssetNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardSetAssetNames:");
}

id objc_msgSend_setLeaderboardSetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardSetID:");
}

id objc_msgSend_setLeaderboardSetIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardSetIdentifier:");
}

id objc_msgSend_setLeaderboardTimeScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardTimeScope:");
}

id objc_msgSend_setLeaderboardTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaderboardTitle:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setPlayerAlias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerAlias:");
}

id objc_msgSend_setPlayerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerID:");
}

id objc_msgSend_setPlayerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerIdentifier:");
}

id objc_msgSend_setRequiresNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresNavigationController:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setShouldShowPlayForChallenge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowPlayForChallenge:");
}

id objc_msgSend_setShouldShowPlayForTurnBasedMatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowPlayForTurnBasedMatch:");
}

id objc_msgSend_setShouldShowQuitForTurnBasedMatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowQuitForTurnBasedMatch:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setViewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewState:");
}

id objc_msgSend_sharedPalette(void *a1, const char *a2, ...)
{
  return _[a1 sharedPalette];
}

id objc_msgSend_shouldShowPlayForChallenge(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowPlayForChallenge];
}

id objc_msgSend_shouldShowPlayForTurnBasedMatch(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowPlayForTurnBasedMatch];
}

id objc_msgSend_shouldShowQuitForTurnBasedMatch(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowQuitForTurnBasedMatch];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerWithRequest_game_dismissHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerWithRequest:game:dismissHandler:");
}

id objc_msgSend_viewState(void *a1, const char *a2, ...)
{
  return _[a1 viewState];
}