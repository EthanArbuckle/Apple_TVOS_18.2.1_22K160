}

void sub_100004994(id a1, NSError *a2)
{
  v2 = a2;
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = (void *)os_log_GKHosted;
  if (os_log_type_enabled(os_log_GKHosted, OS_LOG_TYPE_DEBUG)) {
    sub_100007D28(v4, v2);
  }
}

uint64_t sub_1000055E4(__int128 *a1)
{
  __int128 v2 = *a1;
  return swift_getOpaqueTypeConformance2( &v2,  &opaque type descriptor for <<opaque return type of View.focusable(_:)>>,  1LL);
}

void sub_100005618()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for ChicletMetadataShimView();
  sub_10000642C((uint64_t)v7.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v7);
  sub_100006458();
}

void sub_10000566C(void *a1)
{
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for ChicletMetadataShimView();
  sub_100006480((uint64_t)v9.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v9);

  sub_1000064A8();
}

id sub_1000056CC()
{
  return sub_1000062E8(type metadata accessor for ChicletMetadataShimView);
}

uint64_t type metadata accessor for ChicletMetadataShimView()
{
  return objc_opt_self(&OBJC_CLASS____TtC29GameCenterMatchmakerExtension23ChicletMetadataShimView);
}

void *sub_100005718()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint);
  id v2 = v1;
  return v1;
}

void sub_10000578C(uint64_t a1)
{
}

uint64_t sub_1000057B8()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_rank);
}

void sub_10000580C()
{
}

uint64_t sub_100005854()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_caption);
}

void sub_1000058A8()
{
}

uint64_t sub_1000058F0()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitle);
}

void sub_100005944()
{
}

uint64_t sub_10000598C()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badge);
}

void sub_1000059E0()
{
}

uint64_t sub_100005A28()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badgeContainer);
}

void sub_100005A7C()
{
}

uint64_t sub_100005AC4()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_stackView);
}

void sub_100005B18()
{
}

void *sub_100005B60()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView);
  id v2 = v1;
  return v1;
}

void sub_100005BD4(uint64_t a1)
{
}

void sub_100005BE0()
{
  v32.receiver = v0;
  v32.super_class = (Class)type metadata accessor for ChicletMetadata();
  sub_10000648C((uint64_t)v32.super_class, "awakeFromNib", v1, v2, v3, v4, v5, v6, v32);
  uint64_t v7 = sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_rank);
  if (!v7)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v8 = (void *)v7;
  id v9 = [(id)objc_opt_self(UIFont) preferredFontForTextStyle:UIFontTextStyleTitle1];
  [v8 setFont:v9];

  v10 = &v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_caption];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_caption]);
  if (!Strong)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  v13 = (void *)Strong;
  id v14 = sub_100006468(Strong, v12, (uint64_t)UIFontTextStyleCaption2);
  [v13 setFont:v14];

  uint64_t v15 = sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitle);
  if (!v15)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  v17 = (void *)v15;
  id v18 = sub_100006468(v15, v16, (uint64_t)UIFontTextStyleFootnote);
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
  uint64_t v23 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView;
  v24 = *(void **)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView];
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
    uint64_t v29 = *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName];
    uint64_t v30 = *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName + 8];
    id v31 = v28;
    swift_bridgeObjectRetain(v30);
    sub_100007BB0(v29, v30, v31);

    swift_bridgeObjectRelease(v30);
    return;
  }

LABEL_13:
  __break(1u);
}

void sub_100005E90()
{
  v25.receiver = v0;
  v25.super_class = (Class)type metadata accessor for ChicletMetadata();
  sub_10000648C((uint64_t)v25.super_class, "layoutSubviews", v1, v2, v3, v4, v5, v6, v25);
  uint64_t v7 = (void *)sub_100006478();
  if (!v7)
  {
    __break(1u);
    goto LABEL_6;
  }

  uint64_t v8 = v7;
  id v9 = [v7 layer];

  v10 = (void *)sub_100006478();
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

  v20 = (void *)sub_100006478();
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

uint64_t sub_10000604C()
{
  return sub_1000060B0(&OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_rank);
}

uint64_t sub_100006078()
{
  return sub_1000060B0(&OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_caption);
}

uint64_t sub_1000060A4()
{
  return sub_1000060B0(&OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitle);
}

uint64_t sub_1000060B0(uint64_t *a1)
{
  uint64_t result = sub_1000063D4(*a1);
  if (!result) {
    __break(1u);
  }
  return result;
}

void sub_1000060D0()
{
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint] = 0LL;
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_rank);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_caption);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitle);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badge);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badgeContainer);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_stackView);
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView] = 0LL;
  v7.receiver = v0;
  v7.super_class = (Class)sub_1000063E4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName);
  sub_10000642C((uint64_t)v7.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v7);
  sub_100006458();
}

void sub_10000618C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint] = 0LL;
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_rank);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_caption);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitle);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badge);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badgeContainer);
  sub_1000063C8(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_stackView);
  *(void *)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView] = 0LL;
  v9.receiver = v1;
  v9.super_class = (Class)sub_1000063E4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName);
  sub_100006480((uint64_t)v9.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v9);

  sub_1000064A8();
}

uint64_t sub_100006254()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint));
  sub_100006410(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_rank);
  sub_100006410(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_caption);
  sub_100006410(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitle);
  sub_100006410(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badge);
  sub_100006410(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badgeContainer);
  sub_100006410(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_stackView);

  return swift_bridgeObjectRelease(*(void *)(v0
                                             + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName
                                             + 8));
}

id sub_1000062DC()
{
  return sub_1000062E8(type metadata accessor for ChicletMetadata);
}

id sub_1000062E8(uint64_t (*a1)(void))
{
  v9.receiver = v1;
  v9.super_class = (Class)a1();
  return sub_10000648C((uint64_t)v9.super_class, "dealloc", v2, v3, v4, v5, v6, v7, v9);
}

uint64_t type metadata accessor for ChicletMetadata()
{
  return objc_opt_self(&OBJC_CLASS____TtC29GameCenterMatchmakerExtension15ChicletMetadata);
}

uint64_t sub_1000063C8@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakInit(v1 + a1, 0LL);
}

uint64_t sub_1000063D4@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakLoadStrong(v1 + a1);
}

void sub_1000063DC(id a1)
{
}

uint64_t sub_1000063E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (char *)(v1 + a1);
  strcpy(v2, "gameLayerGroup");
  v2[15] = -18;
  return type metadata accessor for ChicletMetadata();
}

uint64_t sub_100006410@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakDestroy(v1 + a1);
}

uint64_t sub_100006418@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakAssign(v1 + a1);
}

void sub_100006420(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void **)(v2 + a2);
  *(void *)(v2 + a2) = a1;
}

id sub_10000642C( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v12, v11, v10, v9);
}

uint64_t sub_100006444@<X0>(uint64_t a1@<X8>)
{
  return swift_unknownObjectWeakDestroy(v1 + a1);
}

  ;
}

  ;
}

id sub_100006468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(v3, *(SEL *)(v4 + 1736), a3, 2);
}

uint64_t sub_100006478()
{
  return swift_unknownObjectWeakLoadStrong(v0);
}

id sub_100006480( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v9);
}

id sub_10000648C( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

  ;
}

  ;
}

id sub_1000064B4()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for DashboardCollectionViewCell();
  return sub_10000642C((uint64_t)v8.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v8);
}

id sub_100006514(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for DashboardCollectionViewCell();
  id v9 = sub_100006480((uint64_t)v11.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id sub_10000657C()
{
  return sub_100007AAC(type metadata accessor for DashboardCollectionViewCell);
}

uint64_t type metadata accessor for DashboardCollectionViewCell()
{
  return objc_opt_self(&OBJC_CLASS____TtC29GameCenterMatchmakerExtension27DashboardCollectionViewCell);
}

uint64_t sub_1000065C8()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_container);
}

void sub_10000661C()
{
}

uint64_t sub_100006664()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_metadataContainer);
}

void sub_1000066B8()
{
}

uint64_t sub_100006700()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_iconContainer);
}

void sub_100006754()
{
}

uint64_t sub_10000679C()
{
  return sub_1000063D4(OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_titleLabel);
}

void sub_1000067F0()
{
}

void sub_100006818(uint64_t a1)
{
}

void sub_100006824(uint64_t a1)
{
}

void sub_100006830(uint64_t a1)
{
}

void sub_10000683C()
{
  id v5 = objc_msgSend(objc_allocWithZone(_UIFloatingContentView), "initWithFrame:", v1, v2, v3, v4);
  [v5 setFocusedSizeIncrease:32.0];
  objc_msgSend(v5, "setContentMotionRotation:translation:", 0.0, 0.0, 24.0, 24.0);
  id v6 = [(id)objc_opt_self(UIColor) clearColor];
  [v5 setBackgroundColor:v6 forState:8];

  [v0 addSubview:v5];
  sub_100007C8C(v5, "setTranslatesAutoresizingMaskIntoConstraints:");
  id v7 = [(id)objc_opt_self(NSLayoutConstraint) _gkInstallEdgeConstraintsForView:v5 containedWithinParentView:v0];
  id v8 = sub_100007C54((uint64_t)v7, "contentView");
  if (v8)
  {
    id v9 = v8;
    id v10 = sub_100007BF4((uint64_t)v8, "contentView");
    [v9 addSubview:v10];

    id v11 = v5;
    sub_100006830((uint64_t)v5);
  }

  else
  {
    __break(1u);
  }

void sub_1000069E0()
{
  v78.receiver = v0;
  v78.super_class = (Class)type metadata accessor for ChicletCell();
  objc_msgSendSuper2(&v78, "awakeFromNib");
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_titleLabel]);
  if (!Strong)
  {
    __break(1u);
    goto LABEL_15;
  }

  double v3 = (void *)Strong;
  id v4 =  [(id)objc_opt_self(UIFont) _gkPreferredFontForTextStyle:UIFontTextStyleHeadline symbolicTraits:2];
  [v3 setFont:v4];

  id v5 = [objc_allocWithZone(UIVisualEffectView) init];
  sub_100007CAC();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v5 setBackgroundEffects:isa];

  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName];
  uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName + 8];
  swift_bridgeObjectRetain(v8);
  sub_100007BB0(v7, v8, v5);
  swift_bridgeObjectRelease(v8);
  id v9 = v5;
  sub_100006818((uint64_t)v5);
  id v11 = sub_100007BF4(v10, "contentView");
  [v11 insertSubview:v9 atIndex:0];

  id v12 = sub_100007C8C(v9, "setTranslatesAutoresizingMaskIntoConstraints:");
  id v13 = sub_100007C54((uint64_t)v12, "leadingAnchor");
  id v14 = sub_100007BF4((uint64_t)v13, "contentView");
  id v15 = sub_100007C94(v14);
  sub_100007C24();
  id v16 = sub_100007C0C();
  sub_100007C5C();

  sub_100007BFC();
  id v18 = sub_100007C54(v17, "trailingAnchor");
  id v19 = sub_100007BF4((uint64_t)v18, "contentView");
  id v20 = [v19 trailingAnchor];
  sub_100007C24();
  id v21 = sub_100007C0C();
  sub_100007C5C();

  sub_100007BFC();
  id v23 = sub_100007C54(v22, "topAnchor");
  id v24 = sub_100007BF4((uint64_t)v23, "contentView");
  id v25 = [v24 topAnchor];
  sub_100007C24();
  id v26 = sub_100007C0C();
  sub_100007C5C();

  sub_100007BFC();
  id v28 = sub_100007C54(v27, "bottomAnchor");
  id v29 = sub_100007BF4((uint64_t)v28, "contentView");
  id v30 = sub_100007CA4(v29);
  sub_100007C24();
  id v31 = sub_100007C0C();
  sub_100007C5C();

  sub_100007BFC();
  id v33 = sub_100007C54(v32, "layer");
  [v33 setCornerRadius:30.0];

  id v35 = sub_100007C54(v34, "layer");
  [v35 setCornerCurve:kCACornerCurveContinuous];

  id v37 = sub_100007C54(v36, "layer");
  sub_100007C1C(v37, "setMasksToBounds:");

  objc_msgSend( objc_allocWithZone(UIVisualEffectView),  "initWithEffect:",  objc_msgSend(objc_allocWithZone(UIVisualEffect), "init"));
  sub_100007C5C();
  sub_100006824((uint64_t)v29);
  v38 = (void *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_iconContainer]);
  if (!v38)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v39 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView;
  if (!*(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView])
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

  sub_100007C8C(v41, "setTranslatesAutoresizingMaskIntoConstraints:");
  v42 = *(void **)&v0[v39];
  if (!v42)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  id v43 = sub_100007C94(v42);
  v44 = (void *)sub_100007C64();
  if (!v44)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  v45 = v44;
  id v46 = sub_100007C94(v44);
  sub_100007C9C();
  id v47 = sub_100007C70();
  sub_100007C24();

  sub_100007C1C(v45, "setActive:");
  v48 = *(void **)&v0[v39];
  if (!v48)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  id v49 = [v48 trailingAnchor];
  v50 = (void *)sub_100007C64();
  if (!v50)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  v51 = v50;
  id v52 = [v50 trailingAnchor];
  sub_100007C9C();
  id v53 = [v40 constraintEqualToAnchor:&stru_100010FF0.type constant:15.0];
  sub_100007C24();

  sub_100007C1C(v51, "setActive:");
  v54 = *(void **)&v0[v39];
  if (!v54)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  id v55 = [v54 topAnchor];
  v56 = (void *)sub_100007C64();
  if (!v56)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  v57 = v56;
  id v58 = [v56 topAnchor];
  sub_100007C9C();
  id v59 = sub_100007C70();
  sub_100007C24();

  sub_100007C1C(v57, "setActive:");
  v60 = *(void **)&v0[v39];
  if (!v60)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  id v61 = sub_100007CA4(v60);
  v62 = (void *)sub_100007C64();
  if (v62)
  {
    v63 = v62;
    id v64 = sub_100007CA4(v62);

    id v65 = [v40 constraintEqualToAnchor:v64 constant:15.0];
    sub_100007C1C(v65, "setActive:");

    id v67 = objc_msgSend(sub_100007BF4(v66, "contentView"), "layer");
    sub_100007C5C();
    sub_100007C8C(v40, "setMasksToBounds:");

    id v69 = sub_100007BF4(v68, "layer");
    id v70 =  objc_msgSend( objc_msgSend((id)objc_opt_self(UIColor), "blackColor"),  "CGColor");
    sub_100007C24();
    [v69 setShadowColor:v64];

    id v72 = sub_100007BF4(v71, "layer");
    LODWORD(v73) = 1045220557;
    [v72 setShadowOpacity:v73];

    id v75 = sub_100007BF4(v74, "layer");
    objc_msgSend(v75, "setShadowOffset:", 0.0, 6.0);

    id v77 = sub_100007BF4(v76, "layer");
    [v77 setShadowRadius:12.0];

    sub_10000683C();
    return;
  }

LABEL_25:
  __break(1u);
}

uint64_t sub_100007124(uint64_t a1)
{
  double v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100007150(uint64_t a1, void *a2)
{
  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for ChicletCell();
  objc_msgSendSuper2(&v14, "didUpdateFocusInContext:withAnimationCoordinator:", a1, a2);
  id v5 = *(void **)&v2[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_floatingView];
  if (v5)
  {
    id v6 = v5;
    else {
      uint64_t v7 = 0LL;
    }
    [v6 setControlState:v7 withAnimationCoordinator:a2];
  }

  uint64_t v8 = swift_allocObject(&unk_10000C4C0, 24LL, 7LL);
  *(void *)(v8 + 16) = v2;
  v12[4] = sub_100007B90;
  uint64_t v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256LL;
  v12[2] = sub_100007124;
  v12[3] = &unk_10000C4D8;
  id v9 = _Block_copy(v12);
  uint64_t v10 = v13;
  id v11 = v2;
  swift_release(v10);
  [a2 addCoordinatedAnimations:v9 completion:0];
  _Block_release(v9);
}

void sub_100007278(char *a1)
{
  if (![a1 isFocused])
  {
    uint64_t v13 = *(void **)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView];
    if (v13)
    {
      sub_100007B30();
      id v14 = v13;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      [v14 setBackgroundEffects:isa];
    }

    id v16 = [a1 layer];
    [v16 setZPosition:0.0];
    goto LABEL_12;
  }

  uint64_t v2 = *(void *)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_customBackgroundBlur];
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
    uint64_t v10 = *(void **)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView];
    if (v10)
    {
      sub_100007B30();
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

uint64_t sub_100007558()
{
  return sub_100007590(&OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_titleLabel);
}

uint64_t sub_100007584()
{
  return sub_100007590(&OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_metadataContainer);
}

uint64_t sub_100007590(void *a1)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong(v1 + *a1);
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_1000075BC()
{
  uint64_t v2 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_customBackgroundBlur;
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___UIVisualEffect);
  id v4 = v0;
  id v5 = [v3 _gkGameLayerModuleVisualEffect];
  unint64_t v6 = sub_100007CAC();
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
  sub_100007C5C();
  *(void *)&v0[v2] = v1;
  swift_unknownObjectWeakInit(&v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_coordinator], 0LL);
  *(void *)&v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView] = 0LL;
  *(void *)&v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_transitionDuration] = 0x3FC3333333333333LL;
  *(void *)&v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView] = 0LL;
  v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrantIcon] = 1;
  sub_100007C2C(&v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName]);
  *(void *)&v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_floatingView] = 0LL;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for ChicletCell();
  return sub_10000642C((uint64_t)v14.super_class, "initWithFrame:", v7, v8, v9, v10, v11, v12, v14);
}

id sub_100007728(void *a1)
{
  uint64_t v4 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_customBackgroundBlur;
  id v5 = (void *)objc_opt_self(&OBJC_CLASS___UIVisualEffect);
  unint64_t v6 = v1;
  id v7 = [v5 _gkGameLayerModuleVisualEffect];
  unint64_t v8 = sub_100007CAC();
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);
  sub_100007C24();
  *(void *)&v1[v4] = v2;
  swift_unknownObjectWeakInit(&v6[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_coordinator], 0LL);
  *(void *)&v6[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView] = 0LL;
  *(void *)&v6[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_transitionDuration] = 0x3FC3333333333333LL;
  *(void *)&v6[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView] = 0LL;
  v6[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrantIcon] = 1;
  sub_100007C2C(&v6[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName]);
  *(void *)&v6[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_floatingView] = 0LL;

  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for ChicletCell();
  id v15 = sub_100006480((uint64_t)v17.super_class, "initWithCoder:", v9, v10, v11, v12, v13, v14, v17);

  return v15;
}

void sub_100007894()
{
  swift_bridgeObjectRelease(*(void *)(v0
                                      + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_customBackgroundBlur));
  sub_100006410(OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_coordinator);

  swift_bridgeObjectRelease(*(void *)(v0
                                      + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName
                                      + 8));
}

id sub_100007930()
{
  return sub_100007AAC(type metadata accessor for ChicletCell);
}

uint64_t type metadata accessor for ChicletCell()
{
  return objc_opt_self(&OBJC_CLASS____TtC29GameCenterMatchmakerExtension11ChicletCell);
}

id sub_100007A04()
{
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_metadataViews] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_currentMetadataIndex] = -1LL;
  v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_initialAppearance] = 1;
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_chiclet] = 0LL;
  v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_reloadRequested] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BasicChicletCoordinator();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100007AA0()
{
  return sub_100007AAC(type metadata accessor for BasicChicletCoordinator);
}

id sub_100007AAC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for BasicChicletCoordinator()
{
  return objc_opt_self(&OBJC_CLASS____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator);
}

unint64_t sub_100007B30()
{
  unint64_t result = qword_100012400;
  if (!qword_100012400)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___UIVisualEffect);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100012400);
  }

  return result;
}

uint64_t sub_100007B6C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100007B90()
{
}

uint64_t sub_100007B98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007BA8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100007BB0(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a3 _setGroupName:v4];
}

id sub_100007BF4(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

id sub_100007BFC()
{
  return objc_msgSend(v0, *(SEL *)(v1 + 1968), 1);
}

id sub_100007C0C()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 1960), v1);
}

id sub_100007C1C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 1);
}

void sub_100007C24()
{
}

void sub_100007C2C(char *a1@<X8>)
{
  a1[15] = -18;
}

id sub_100007C54(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void sub_100007C5C()
{
}

uint64_t sub_100007C64()
{
  return swift_unknownObjectWeakLoadStrong(v0);
}

id sub_100007C70()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 2024), v1, -15.0);
}

void sub_100007C84(id a1)
{
}

id sub_100007C8C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

id sub_100007C94(void *a1)
{
  return [a1 *(SEL *)(v1 + 1952)];
}

void sub_100007C9C()
{
}

id sub_100007CA4(void *a1)
{
  return [a1 *(SEL *)(v1 + 1992)];
}

unint64_t sub_100007CAC()
{
  return sub_100007B30();
}

void sub_100007CB4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error while decoding messageFromClient archive:%@",  (uint8_t *)&v2,  0xCu);
}

void sub_100007D28(void *a1, void *a2)
{
  uint64_t v3 = a1;
  NSString v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v5 = 138412290;
  unint64_t v6 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "error calling host - %@",  (uint8_t *)&v5,  0xCu);
}

uint64_t _s7SwiftUI4ViewP29GameCenterMatchmakerExtensionE11GKFocusableyQrSbF_0()
{
  return View.focusable(_:)();
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return _[a1 _auxiliaryConnection];
}

id objc_msgSend__gkInternalsFromPlayers(void *a1, const char *a2, ...)
{
  return _[a1 _gkInternalsFromPlayers];
}

id objc_msgSend_acceptedInvite(void *a1, const char *a2, ...)
{
  return _[a1 acceptedInvite];
}

id objc_msgSend_applicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _[a1 applicationWillEnterForeground];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_canStartWithMinimumPlayers(void *a1, const char *a2, ...)
{
  return _[a1 canStartWithMinimumPlayers];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return _[a1 contentViewController];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_currentGame(void *a1, const char *a2, ...)
{
  return _[a1 currentGame];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_excludedPlayers(void *a1, const char *a2, ...)
{
  return _[a1 excludedPlayers];
}

id objc_msgSend_existingPlayers(void *a1, const char *a2, ...)
{
  return _[a1 existingPlayers];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_extensionIsCanceling(void *a1, const char *a2, ...)
{
  return _[a1 extensionIsCanceling];
}

id objc_msgSend_hostObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 hostObjectProxy];
}

id objc_msgSend_hosted(void *a1, const char *a2, ...)
{
  return _[a1 hosted];
}

id objc_msgSend_initWithAcceptedInvite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAcceptedInvite:");
}

id objc_msgSend_initWithInternalRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInternalRepresentation:");
}

id objc_msgSend_initWithMatchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMatchRequest:");
}

id objc_msgSend_initWithMaxSelectable_hiddenPlayers_nearbyOnly_pickerOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMaxSelectable:hiddenPlayers:nearbyOnly:pickerOrigin:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return _[a1 internal];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_inviteMessage(void *a1, const char *a2, ...)
{
  return _[a1 inviteMessage];
}

id objc_msgSend_inviterCancelled(void *a1, const char *a2, ...)
{
  return _[a1 inviterCancelled];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_matchRequest(void *a1, const char *a2, ...)
{
  return _[a1 matchRequest];
}

id objc_msgSend_matchmakingMode(void *a1, const char *a2, ...)
{
  return _[a1 matchmakingMode];
}

id objc_msgSend_maxPlayers(void *a1, const char *a2, ...)
{
  return _[a1 maxPlayers];
}

id objc_msgSend_multiplayerViewController(void *a1, const char *a2, ...)
{
  return _[a1 multiplayerViewController];
}

id objc_msgSend_navigateToSharePlayChiclet(void *a1, const char *a2, ...)
{
  return _[a1 navigateToSharePlayChiclet];
}

id objc_msgSend_nearbyPlayerHandler(void *a1, const char *a2, ...)
{
  return _[a1 nearbyPlayerHandler];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pickerOrigin(void *a1, const char *a2, ...)
{
  return _[a1 pickerOrigin];
}

id objc_msgSend_playerPickerContext(void *a1, const char *a2, ...)
{
  return _[a1 playerPickerContext];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_sendMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessageToClient:");
}

id objc_msgSend_setAcceptedInvite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptedInvite:");
}

id objc_msgSend_setAdjustTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustTopConstraint:");
}

id objc_msgSend_setAlwaysShowDoneButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysShowDoneButton:");
}

id objc_msgSend_setAutomatchFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomatchFailedWithError:");
}

id objc_msgSend_setAutomatchPlayerCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomatchPlayerCount:");
}

id objc_msgSend_setCanStartWithMinimumPlayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanStartWithMinimumPlayers:");
}

id objc_msgSend_setConnectingStateForPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectingStateForPlayer:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setDefaultInvitationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultInvitationMessage:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExistingPlayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExistingPlayers:");
}

id objc_msgSend_setGame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGame:");
}

id objc_msgSend_setHosted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHosted:");
}

id objc_msgSend_setInviteMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInviteMessage:");
}

id objc_msgSend_setInvitesFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitesFailedWithError:");
}

id objc_msgSend_setIsEligibleForGroupSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEligibleForGroupSession:");
}

id objc_msgSend_setIsEntitledToUseGroupActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEntitledToUseGroupActivities:");
}

id objc_msgSend_setMatchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchRequest:");
}

id objc_msgSend_setMatchmakingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchmakingMode:");
}

id objc_msgSend_setMultiplayerPickerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultiplayerPickerDelegate:");
}

id objc_msgSend_setNearbyDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyDelegate:");
}

id objc_msgSend_setNearbyPlayer_reachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyPlayer:reachable:");
}

id objc_msgSend_setNearbyPlayerHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyPlayerHandler:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPlayer_connected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:connected:");
}

id objc_msgSend_setPlayer_responded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:responded:");
}

id objc_msgSend_setPlayer_sentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:sentData:");
}

id objc_msgSend_setPlayerPickerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerPickerContext:");
}

id objc_msgSend_setSupportsNearby_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsNearby:");
}

id objc_msgSend_shareMatchWithRequest_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareMatchWithRequest:handler:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_shouldAllowNearbyMultiplayer(void *a1, const char *a2, ...)
{
  return _[a1 shouldAllowNearbyMultiplayer];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_updateRecipientProperties_forPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecipientProperties:forPlayer:");
}