void sub_10009A3D0()
{
  void *v0;
  void *v1;
  char *v2;
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  objc_super v10;
  v1 = v0;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for SnowglobeView(0LL);
  objc_msgSendSuper2(&v10, "layoutSubviews");
  v2 = sub_100099150();
  v3 = [v1 bounds];
  v4 = &v2[OBJC_IVAR____TtC8FaceTime9Snowglobe_size];
  *(void *)v4 = v5;
  *((void *)v4 + 1) = v6;
  v8 = sub_10009CE3C((uint64_t)v3, v7);
  objc_msgSend(v8, "setSize:", *(double *)v4, *((double *)v4 + 1));

  v9 = sub_10009CB58();
  [*(id *)&v2[OBJC_IVAR____TtC8FaceTime9Snowglobe_maskedView] bounds];
  objc_msgSend(v9, "setFrame:");
}

void sub_10009A4C4(void *a1, uint64_t a2)
{
  v3 = v2;
  v55.receiver = v3;
  v55.super_class = (Class)type metadata accessor for SnowglobeView(0LL);
  objc_msgSendSuper2(&v55, "didUpdateFocusInContext:withAnimationCoordinator:", a1, a2);
  id v6 = [a1 nextFocusedView];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = sub_10001C5D0(0LL, (unint64_t *)&qword_1001134D8, &OBJC_CLASS___NSObject_ptr);
    v10 = sub_100098818(v8, v9);
    char v11 = static NSObject.== infix(_:_:)(v7, v10);

    if ((v11 & 1) != 0)
    {
      v12 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime13SnowglobeView_leadingFocusGuide];
      uint64_t v13 = sub_100018A04(&qword_1001142B0);
      uint64_t v14 = swift_allocObject(v13, 40LL, 7LL);
      *(_OWORD *)(v14 + 16) = xmmword_1000C3FD0;
      v15 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime13SnowglobeView_contactCollectionView];
      *(void *)(v14 + 32) = v15;
      v54[0] = v14;
      specialized Array._endMutation()(v14);
      uint64_t v16 = v54[0];
      id v17 = v15;
    }

    else
    {
      v12 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime13SnowglobeView_leadingFocusGuide];
      uint64_t v19 = sub_100018A04(&qword_1001142B0);
      uint64_t v16 = swift_allocObject(v19, 40LL, 7LL);
      *(_OWORD *)(v16 + 16) = xmmword_1000C3FD0;
      v21 = sub_100098818(v16, v20);
      *(void *)(v16 + 32) = v21;
      v54[0] = v16;
      specialized Array._endMutation()(v21);
    }

    sub_100018A04(&qword_100112990);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v12, "setPreferredFocusEnvironments:", isa, swift_bridgeObjectRelease(v16).n128_f64[0]);

LABEL_7:
    uint64_t v23 = type metadata accessor for Bubble.Focus(0LL, v18);
    uint64_t v24 = swift_dynamicCastClass(v7, v23);
    v25 = sub_100099150();
    uint64_t v26 = (uint64_t)&v25[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles];
    swift_beginAccess(&v25[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles], v54, 0LL, 0LL);
    uint64_t v27 = *(void *)v26;
    if (*(void *)v26 >> 62)
    {
      if (v27 < 0) {
        uint64_t v49 = *(void *)v26;
      }
      else {
        uint64_t v49 = v27 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(*(void *)v26);
      uint64_t v50 = _CocoaArrayWrapper.endIndex.getter(v49);
      swift_bridgeObjectRelease(v27);
      uint64_t v29 = v50 - 1;
      if (!__OFSUB__(v50, 1LL))
      {
LABEL_9:
        if (v29 > 7)
        {
          uint64_t v29 = 8LL;
        }

        else if (v29 < 0)
        {
          goto LABEL_20;
        }

        uint64_t v30 = *(void *)v26;
        if ((v30 & 0xC000000000000001LL) != 0)
        {
          swift_bridgeObjectRetain(v30);
          uint64_t v31 = specialized _ArrayBuffer._getElementSlowPath(_:)(v29, v30);
          swift_bridgeObjectRelease(v30);
        }

        else
        {
          if ((unint64_t)v29 >= *(void *)((v30 & 0xFFFFFFFFFFFFF8LL) + 0x10))
          {
            __break(1u);
            return;
          }

          uint64_t v31 = *(void *)(v30 + 8 * v29 + 32);
          swift_retain(v31);
        }

        id v32 = *(id *)(v31 + OBJC_IVAR____TtC8FaceTime6Bubble_focus);

        swift_release(v31);
        v33 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime13SnowglobeView_globeFocusGuide];
        uint64_t v34 = sub_100018A04(&qword_1001142B0);
        uint64_t v35 = swift_allocObject(v34, 40LL, 7LL);
        uint64_t v37 = v35;
        *(_OWORD *)(v35 + 16) = xmmword_1000C3FD0;
        if (v24)
        {
          v38 = sub_100098818(v35, v36);
          *(void *)(v37 + 32) = v38;
          v53[0] = v37;
          specialized Array._endMutation()(v38);
        }

        else
        {
          *(void *)(v35 + 32) = v32;
          v53[0] = v35;
          specialized Array._endMutation()(v35);
          uint64_t v37 = v53[0];
          id v39 = v32;
        }

        sub_100018A04(&qword_100112990);
        v25 = (char *)Array._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v33, "setPreferredFocusEnvironments:", v25, swift_bridgeObjectRelease(v37).n128_f64[0]);

LABEL_20:
        v25 = sub_100099150();
        v40 = (uint64_t *)&v25[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles];
        swift_beginAccess(&v25[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles], v53, 0LL, 0LL);
        uint64_t v26 = *v40;
        if (!((unint64_t)v26 >> 62))
        {
          uint64_t v41 = *(void *)((v26 & 0xFFFFFFFFFFFFF8LL) + 0x10);

          if (v41 < 2) {
            goto LABEL_30;
          }
          goto LABEL_22;
        }

void sub_10009A978(char a1)
{
  __asm { BR              X10 }

uint64_t sub_10009A9C8( uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t aBlock, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48)
{
  id v52 = sub_100098E94(a1, a2);
  [v52 setConstant:0.0];

  objc_super v55 = sub_100098818(v53, v54);
  v56 = sub_100099150();
  uint64_t v57 = v50;
  v58 = (uint64_t *)&v56[*(void *)(v50 + 2912)];
  swift_beginAccess(v58, &v99, 0LL, 0LL);
  uint64_t v59 = *v58;
  uint64_t v60 = v51;
  if ((unint64_t)v59 >> 62)
  {
    if (v59 < 0) {
      uint64_t v88 = v59;
    }
    else {
      uint64_t v88 = v59 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v59);
    uint64_t v61 = _CocoaArrayWrapper.endIndex.getter(v88);

    swift_bridgeObjectRelease(v59);
  }

  else
  {
    uint64_t v61 = *(void *)((v59 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  v62 = (uint64_t (*)(uint64_t))&selRef__setGradientMaskLengths_;
  -[objc_super setEnabled:](v55, "setEnabled:", v61 > 0);

  id v63 = sub_100098A38();
  unsigned __int8 v64 = [v63 isHidden];

  if ((v64 & 1) != 0) {
    goto LABEL_7;
  }
  id v65 = sub_100098A38();
  v66 = sub_100099150();
  v67 = (char **)&v66[*(void *)(v57 + 2912)];
  swift_beginAccess(v67, &v98, 0LL, 0LL);
  uint64_t v68 = (uint64_t)*v67;
  uint64_t v69 = *(void *)((v68 & 0xFFFFFFFFFFFFF8LL) + 0x10);

  while (1)
  {
    objc_msgSend(v65, *((SEL *)v62 + 178), v69 > 0);

LABEL_7:
    double v70 = 1.0;
    double v71 = 0.0;
    id v72 = objc_msgSend( objc_allocWithZone(UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  200.0,  25.0,  0.0,  0.0);
    id v73 = [objc_allocWithZone(UIViewPropertyAnimator) initWithDuration:v72 timingParameters:1.0];

    if (v48) {
      double v70 = 0.0;
    }
    else {
      double v71 = 0.8;
    }
    id v65 = (id)swift_allocObject(&unk_1000FBC28, 57LL, 7LL);
    *((void *)v65 + 2) = v73;
    *((double *)v65 + 3) = v71;
    *((void *)v65 + 4) = 0x3FC999999999999ALL;
    *((void *)v65 + 5) = v49;
    *((double *)v65 + 6) = v70;
    *((_BYTE *)v65 + 56) = v48;
    v96 = sub_1000A362C;
    uint64_t v97 = (uint64_t)v65;
    v92 = _NSConcreteStackBlock;
    uint64_t v74 = *(void *)(v60 + 4064);
    uint64_t v93 = v74;
    v62 = sub_100027654;
    v94 = sub_100027654;
    v95 = &unk_1000FBC40;
    v75 = _Block_copy(&v92);
    uint64_t v76 = v97;
    id v49 = v49;
    v66 = (char *)v73;
    swift_retain(v65);
    objc_msgSend(v66, "addAnimations:", v75, swift_release(v76).n128_f64[0]);
    _Block_release(v75);
    [v66 startAnimation];
    uint64_t v68 = (uint64_t)sub_100099150();
    v77 = (uint64_t *)(v68 + *(void *)(v57 + 2912));
    swift_beginAccess(v77, &v91, 0LL, 0LL);
    uint64_t v78 = *v77;
    if ((unint64_t)v78 >> 62)
    {
      if (v78 < 0) {
        uint64_t v89 = v78;
      }
      else {
        uint64_t v89 = v78 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v78);
      uint64_t v60 = _CocoaArrayWrapper.endIndex.getter(v89);

      swift_bridgeObjectRelease(v78);
    }

    else
    {
      uint64_t v60 = *(void *)((v78 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    double v80 = ceil((double)v60 / 3.0);
    if ((~*(void *)&v80 & 0x7FF0000000000000LL) == 0)
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }

    if (v80 <= -9.22337204e18) {
      goto LABEL_31;
    }
    if (v80 < 9.22337204e18) {
      break;
    }
LABEL_32:
    __break(1u);
LABEL_33:
    if (v68 < 0) {
      uint64_t v90 = v68;
    }
    else {
      uint64_t v90 = v68 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v68);
    uint64_t v69 = _CocoaArrayWrapper.endIndex.getter(v90);

    swift_bridgeObjectRelease(v68);
  }

  if ((uint64_t)v80 >= 3 && v48 == 2)
  {
    v82 = (void *)objc_opt_self(&OBJC_CLASS___UIView, v79);
    uint64_t v83 = swift_allocObject(&unk_1000FBC78, 24LL, 7LL);
    *(void *)(v83 + 16) = v49;
    v96 = sub_1000A3728;
    uint64_t v97 = v83;
    v92 = _NSConcreteStackBlock;
    uint64_t v93 = v74;
    v94 = sub_100027654;
    v95 = &unk_1000FBC90;
    v84 = _Block_copy(&v92);
    uint64_t v85 = v97;
    id v86 = v49;
    swift_release(v85);
    [v82 animateWithDuration:0 delay:v84 options:0 animations:0.2 completion:1.0];
    swift_release(v65);

    _Block_release(v84);
  }

  else
  {
    swift_release(v65);
  }

  return sub_10001C08C(0LL, 0LL);
}

id sub_10009B4B4()
{
  return sub_100095514(0LL, (uint64_t (*)(void))type metadata accessor for SnowglobeView);
}

uint64_t sub_10009B5F4()
{
  return type metadata accessor for SnowglobeView(0LL);
}

uint64_t type metadata accessor for SnowglobeView(uint64_t a1)
{
  return sub_100020F70(a1, (uint64_t *)&unk_100115B38, (uint64_t)&nominal type descriptor for SnowglobeView);
}

uint64_t sub_10009B610(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = "\b";
  v4[2] = "\b";
  v4[3] = "\b";
  v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for CallType(319LL);
  if (v3 <= 0x3F)
  {
    v4[6] = *(void *)(result - 8) + 64LL;
    v4[7] = &unk_1000C6E10;
    v4[8] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[9] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[10] = "\b";
    v4[11] = "\b";
    v4[12] = "\b";
    v4[13] = &unk_1000C6E28;
    v4[14] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[15] = &unk_1000C6E40;
    v4[16] = "\b";
    return swift_updateClassMetadata2(a1, 256LL, 17LL, v4, a1 + 80);
  }

  return result;
}

uint64_t sub_10009B6CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for IndexPath(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v9 = a2 + OBJC_IVAR____TtC8FaceTime13SnowglobeView_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a2 + OBJC_IVAR____TtC8FaceTime13SnowglobeView_delegate);
  if (Strong)
  {
    uint64_t v11 = Strong;
    uint64_t v12 = *(void *)(v9 + 8);
    uint64_t ObjectType = swift_getObjectType(Strong);
    uint64_t v14 = a3 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
    swift_beginAccess(a3 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath, v20, 0LL, 0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, v14, v5);
    (*(void (**)(uint64_t, _BYTE *, uint64_t, uint64_t))(v12 + 8))(a2, v8, ObjectType, v12);
    swift_unknownObjectRelease(v11);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }

  uint64_t v15 = *(void *)(a3 + 24);
  uint64_t v16 = *(void *)(a3 + 32);
  uint64_t v17 = a3 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
  swift_beginAccess(v17, v19, 0LL, 0LL);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
  swift_bridgeObjectRetain(v16);
  sub_10009841C(v15, v16, (uint64_t)v8);
  swift_bridgeObjectRelease(v16);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10009B844()
{
  Class isa = sub_100099150();
  v2 = (uint64_t *)&isa[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles];
  swift_beginAccess(&isa[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles], v14, 0LL, 0LL);
  uint64_t v3 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v5 = v4 - 1;
    if (!__OFSUB__(v4, 1LL)) {
      goto LABEL_3;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain(v4);
    uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v4);
    swift_bridgeObjectRelease(v4);
    goto LABEL_10;
  }

  if (v3 < 0) {
    uint64_t v12 = *v2;
  }
  else {
    uint64_t v12 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*v2);
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v12);
  swift_bridgeObjectRelease(v3);
  uint64_t v5 = v4 - 1;
  if (__OFSUB__(v4, 1LL)) {
    goto LABEL_17;
  }
LABEL_3:
  if (v5 > 7)
  {
    uint64_t v5 = 8LL;
  }

  else if (v5 < 0)
  {
    goto LABEL_11;
  }

  uint64_t v4 = *v2;
  if ((*v2 & 0xC000000000000001LL) != 0) {
    goto LABEL_18;
  }
  if ((unint64_t)v5 < *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    uint64_t v6 = *(void *)(v4 + 8 * v5 + 32);
    swift_retain(v6);
LABEL_10:
    id v7 = *(id *)(v6 + OBJC_IVAR____TtC8FaceTime6Bubble_focus);

    swift_release(v6);
    uint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC8FaceTime13SnowglobeView_globeFocusGuide);
    uint64_t v9 = sub_100018A04(&qword_1001142B0);
    uint64_t v10 = swift_allocObject(v9, 40LL, 7LL);
    *(_OWORD *)(v10 + 16) = xmmword_1000C3FD0;
    *(void *)(v10 + 32) = v7;
    uint64_t v13 = v10;
    specialized Array._endMutation()(v10);
    id v11 = v7;
    sub_100018A04(&qword_100112990);
    Class isa = (char *)Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v13);
    [v8 setPreferredFocusEnvironments:isa];

LABEL_11:
    return;
  }

  __break(1u);
}

id sub_10009BA04()
{
  uint64_t v64 = sub_100018A04(&qword_100115D30);
  uint64_t v1 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  id v63 = (char *)&v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v62 = sub_100018A04(&qword_100115D38);
  uint64_t v3 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v61 = sub_100018A04(&qword_100115D40);
  uint64_t v6 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100099150();
  uint64_t v10 = (uint64_t *)&v9[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles];
  swift_beginAccess(&v9[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles], v70, 0LL, 0LL);
  uint64_t v11 = *v10;
  if ((unint64_t)*v10 >> 62)
  {
    if (v11 < 0) {
      uint64_t v48 = *v10;
    }
    else {
      uint64_t v48 = v11 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v11);
    uint64_t v49 = _CocoaArrayWrapper.endIndex.getter(v48);

    swift_bridgeObjectRelease(v11);
    if (v49 >= 2) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v34 = *(void **)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView_userNamesLabel];
    NSString v35 = String._bridgeToObjectiveC()();
    goto LABEL_16;
  }

  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFF8LL) + 0x10);

  if (v12 < 2) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t v13 = &v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView_delegate];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView_delegate]);
  uint64_t v51 = v0;
  uint64_t v54 = v6;
  if (Strong)
  {
    uint64_t v15 = Strong;
    uint64_t v16 = *((void *)v13 + 1);
    uint64_t ObjectType = swift_getObjectType(Strong);
    uint64_t v18 = (void *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16))(v0, ObjectType, v16);
    swift_unknownObjectRelease(v15);
  }

  else
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
  }

  v67[0] = v18;
  uint64_t v19 = *(void (**)(void))(v3 + 104);
  unsigned int v60 = enum case for ListFormatStyle.ListType.and<A, B>(_:);
  uint64_t v20 = v62;
  uint64_t v59 = (void (*)(char *, void, uint64_t))v19;
  v19(v5);
  v21 = *(void (**)(char *, void, uint64_t))(v1 + 104);
  uint64_t v22 = v1;
  uint64_t v24 = v63;
  uint64_t v23 = v64;
  v58 = v21;
  v21(v63, enum case for ListFormatStyle.Width.standard<A, B>(_:), v64);
  swift_bridgeObjectRetain(v18);
  uint64_t v25 = sub_100018A04(&qword_100115D48);
  uint64_t v26 = v3;
  uint64_t v27 = sub_100022750(&qword_100115D50, &qword_100115D48, (uint64_t)&protocol conformance descriptor for [A]);
  static FormatStyle.list<A>(type:width:)(v5, v24, v25, v27);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v22 + 8);
  v57(v24, v23);
  v56 = *(void (**)(char *, uint64_t))(v26 + 8);
  v56(v5, v20);
  uint64_t v28 = sub_100022750( &qword_100115D58,  &qword_100115D40,  (uint64_t)&protocol conformance descriptor for ListFormatStyle<A, B>);
  uint64_t v29 = v61;
  uint64_t v55 = v28;
  Sequence.formatted<A>(_:)(&v68, v8, v25, v61, v27);
  uint64_t v54 = *(void *)(v54 + 8);
  ((void (*)(char *, uint64_t))v54)(v8, v29);
  swift_bridgeObjectRelease(v67[0]);
  uint64_t v30 = v68;
  uint64_t v31 = v69;
  swift_bridgeObjectRetain(v69);
  uint64_t v32 = String.count.getter(v30, v31);
  swift_bridgeObjectRelease(v31);
  if (v32 >= 65)
  {
    id v53 = (id)objc_opt_self(&OBJC_CLASS___NSBundle, v33);
    swift_bridgeObjectRelease(v31);
    unsigned int v52 = enum case for ListFormatStyle.Width.narrow<A, B>(_:);
    while (1)
    {
      uint64_t v18 = (void *)sub_10009C488(1LL, (uint64_t)v18);
      id v65 = v18;
      uint64_t v36 = v62;
      v59(v5, v60, v62);
      v38 = v63;
      uint64_t v37 = v64;
      v58(v63, v52, v64);
      swift_bridgeObjectRetain(v18);
      static FormatStyle.list<A>(type:width:)(v5, v38, v25, v27);
      v57(v38, v37);
      v56(v5, v36);
      uint64_t v39 = v61;
      Sequence.formatted<A>(_:)(v67, v8, v25, v61, v27);
      ((void (*)(char *, uint64_t))v54)(v8, v39);
      swift_bridgeObjectRelease(v65);
      uint64_t v41 = (void *)v67[0];
      uint64_t v40 = v67[1];
      v42 = (NSBundle *)[v53 mainBundle];
      v71._object = (void *)0xEB00000000656C62LL;
      v43._countAndFlagsBits = 0x4E415F53454D414ELL;
      v43._object = (void *)0xEE0045524F4D5F44LL;
      v44._countAndFlagsBits = 0LL;
      v44._object = (void *)0xE000000000000000LL;
      v71._countAndFlagsBits = 0x617A696C61636F4CLL;
      Swift::String v45 = NSLocalizedString(_:tableName:bundle:value:comment:)(v43, (Swift::String_optional)0, v42, v44, v71);

      id v65 = v41;
      uint64_t v66 = v40;
      swift_bridgeObjectRetain(v40);
      String.append(_:)(v45);
      swift_bridgeObjectRelease(v40);
      swift_bridgeObjectRelease(v45._object);
      v46 = v65;
      uint64_t v31 = v66;
      uint64_t v68 = v65;
      uint64_t v69 = v66;
      swift_bridgeObjectRetain(v66);
      uint64_t v47 = String.count.getter(v46, v31);
      swift_bridgeObjectRelease(v31);
      if (v47 < 65) {
        break;
      }
      swift_bridgeObjectRelease(v31);
    }
  }

  uint64_t v0 = v51;
  swift_bridgeObjectRelease(v18);
  uint64_t v34 = *(void **)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView_userNamesLabel];
  NSString v35 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v31);
LABEL_16:
  objc_msgSend(v34, "setText:", v35, v51);

  return [v0 setNeedsLayout];
}

void sub_10009BF94(void *a1, void *a2, char a3, double a4, double a5, double a6)
{
  uint64_t v12 = (void *)objc_opt_self(&OBJC_CLASS___UIView, a2);
  [a1 duration];
  double v14 = v13;
  uint64_t v15 = swift_allocObject(&unk_1000FBD40, 48LL, 7LL);
  *(double *)(v15 + 16) = a4;
  *(double *)(v15 + 24) = a5;
  *(void *)(v15 + 32) = a2;
  *(double *)(v15 + 40) = a6;
  aBlock[4] = sub_1000A3688;
  uint64_t v20 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100027654;
  aBlock[3] = &unk_1000FBD58;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = v20;
  id v18 = a2;
  swift_release(v17);
  [v12 animateKeyframesWithDuration:0 delay:v16 options:0 animations:v14 completion:0.0];
  _Block_release(v16);
  __asm { BR              X10 }

id sub_10009C0B8()
{
  return [v0 layoutIfNeeded];
}

void sub_10009C10C( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t aBlock, uint64_t a14, uint64_t a15, void *a16, void (*a17)(uint64_t a1, uint64_t a2), uint64_t a18)
{
  uint64_t v24 = sub_100099150();
  id v25 = *(id *)&v24[OBJC_IVAR____TtC8FaceTime9Snowglobe_globeView];

  [v25 contentOffset];
  [v25 setContentOffset:0.0];

  uint64_t v26 = sub_100099150();
  uint64_t v27 = (uint64_t *)&v26[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles];
  swift_beginAccess(&v26[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles], &a10, 0LL, 0LL);
  uint64_t v28 = *v27;
  if ((unint64_t)*v27 >> 62)
  {
    if (v28 < 0) {
      uint64_t v37 = *v27;
    }
    else {
      uint64_t v37 = v28 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v38 = v28;
    swift_bridgeObjectRetain(v28);
    uint64_t v29 = _CocoaArrayWrapper.endIndex.getter(v37);

    uint64_t v39 = v38;
    v21 = &selRef__setGradientMaskLengths_;
    swift_bridgeObjectRelease(v39);
  }

  else
  {
    uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  double v30 = ceil((double)v29 / 3.0);
  if ((~*(void *)&v30 & 0x7FF0000000000000LL) != 0)
  {
    if (v30 > -9.22337204e18)
    {
      if (v30 < 9.22337204e18)
      {
        if ((uint64_t)v30 <= 2)
        {
          [v20 *(SEL *)(v22 + 3384)];
          double v32 = v31;
          uint64_t v33 = swift_allocObject(&unk_1000FBD90, 24LL, 7LL);
          *(void *)(v33 + 16) = v19;
          a17 = sub_1000A3698;
          a18 = v33;
          a14 = v23;
          a16 = &unk_1000FBDA8;
          uint64_t v34 = _Block_copy(&aBlock);
          uint64_t v35 = a18;
          id v36 = v19;
          swift_release(v35);
          objc_msgSend(v18, v21[424], 0, v34, 0, v32, 0.0);
          _Block_release(v34);
        }

        JUMPOUT(0x10009C0D4LL);
      }

void sub_10009C2C8(void *a1, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___UIView, a2);
  uint64_t v10 = swift_allocObject(&unk_1000FBE30, 32LL, 7LL);
  *(void *)(v10 + 16) = a1;
  *(double *)(v10 + 24) = a5;
  v14[4] = sub_1000A36E4;
  uint64_t v15 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256LL;
  v14[2] = sub_100027654;
  v14[3] = &unk_1000FBE48;
  uint64_t v11 = _Block_copy(v14);
  uint64_t v12 = v15;
  id v13 = a1;
  swift_release(v12);
  [v9 addKeyframeWithRelativeStartTime:v11 relativeDuration:a3 animations:a4];
  _Block_release(v11);
}

void sub_10009C3B4(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___UIView, a2);
  uint64_t v4 = swift_allocObject(&unk_1000FBDE0, 24LL, 7LL);
  *(void *)(v4 + 16) = a1;
  v8[4] = sub_1000A36A0;
  uint64_t v9 = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_100027654;
  v8[3] = &unk_1000FBDF8;
  uint64_t v5 = _Block_copy(v8);
  uint64_t v6 = v9;
  id v7 = a1;
  swift_release(v6);
  [v3 addKeyframeWithRelativeStartTime:v5 relativeDuration:0.8 animations:0.2];
  _Block_release(v5);
}

uint64_t sub_10009C488(uint64_t result, uint64_t a2)
{
  if (result < 0) {
    goto LABEL_30;
  }
  uint64_t v2 = a2;
  if (!result) {
    return v2;
  }
  uint64_t v3 = *(void *)(a2 + 16);
  if (!v3)
  {
    id v7 = _swiftEmptyArrayStorage;
LABEL_25:
    swift_bridgeObjectRelease(v2);
    swift_release(v7);
    return (uint64_t)_swiftEmptyArrayStorage;
  }

  unint64_t v4 = 0LL;
  unint64_t v5 = 0LL;
  uint64_t v6 = (void *)(a2 + 40);
  uint64_t v23 = v3 - 1;
  id v7 = _swiftEmptyArrayStorage;
  uint64_t v22 = result;
  do
  {
    uint64_t v12 = *(v6 - 1);
    uint64_t v11 = *v6;
    uint64_t v13 = v7[2];
    if (v13 < result)
    {
      swift_bridgeObjectRetain(*v6);
      if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0) {
        sub_1000ABC20(0, v13 + 1, 1);
      }
      unint64_t v9 = v7[2];
      unint64_t v8 = v7[3];
      if (v9 >= v8 >> 1) {
        sub_1000ABC20(v8 > 1, v9 + 1, 1);
      }
      v7[2] = v9 + 1;
      uint64_t v10 = &v7[2 * v9];
      v10[4] = v12;
      v10[5] = v11;
      uint64_t result = v22;
      uint64_t v2 = a2;
LABEL_8:
      if (v23 == v4) {
        goto LABEL_25;
      }
      goto LABEL_9;
    }

    if (v5 >= v13) {
      goto LABEL_28;
    }
    uint64_t v21 = *(v6 - 1);
    double v14 = &v7[2 * v5];
    uint64_t v15 = v14[4];
    uint64_t v16 = v14[5];
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v16);
    if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
      sub_1000ABC20(0, _swiftEmptyArrayStorage[2] + 1LL, 1);
    }
    unint64_t v18 = _swiftEmptyArrayStorage[2];
    unint64_t v17 = _swiftEmptyArrayStorage[3];
    if (v18 >= v17 >> 1) {
      sub_1000ABC20(v17 > 1, v18 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v18 + 1;
    uint64_t v19 = &_swiftEmptyArrayStorage[2 * v18];
    v19[4] = v15;
    v19[5] = v16;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v7);
    if ((result & 1) == 0)
    {
      uint64_t result = sub_100091F98((uint64_t)v7);
      id v7 = (void *)result;
    }

    uint64_t v2 = a2;
    if (v5 >= v7[2]) {
      goto LABEL_29;
    }
    uint64_t v20 = &v7[2 * v5];
    swift_bridgeObjectRelease(v20[5]);
    uint64_t result = v22;
    v20[4] = v21;
    v20[5] = v11;
    if (v23 == v4) {
      goto LABEL_25;
    }
    unint64_t v5 = 0LL;
LABEL_9:
    ++v4;
    v6 += 2;
  }

  while (v4 < *(void *)(v2 + 16));
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10009C6DC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v6, v1, v2);
  swift_bridgeObjectRelease(v2);
  uint64_t v3 = type metadata accessor for IndexPath(0LL);
  uint64_t v4 = sub_10001949C( &qword_100115D00,  (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath,  (uint64_t)&protocol conformance descriptor for IndexPath);
  dispatch thunk of Hashable.hash(into:)(v6, v3, v4);
  return Hasher._finalize()();
}

uint64_t sub_10009C780(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = type metadata accessor for IndexPath(0LL);
  uint64_t v6 = sub_10001949C( &qword_100115D00,  (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath,  (uint64_t)&protocol conformance descriptor for IndexPath);
  return dispatch thunk of Hashable.hash(into:)(a1, v5, v6);
}

Swift::Int sub_10009C814(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v7, v2, v3);
  swift_bridgeObjectRelease(v3);
  uint64_t v4 = type metadata accessor for IndexPath(0LL);
  uint64_t v5 = sub_10001949C( &qword_100115D00,  (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath,  (uint64_t)&protocol conformance descriptor for IndexPath);
  dispatch thunk of Hashable.hash(into:)(v7, v4, v5);
  return Hasher._finalize()();
}

uint64_t sub_10009C8B4(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = a2[1];
  BOOL v9 = v6 == *a2 && v7 == v8;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, *a2, v8, 0LL) & 1) != 0) {
    return static IndexPath.== infix(_:_:)((char *)a1 + *(int *)(a3 + 20), (char *)a2 + *(int *)(a3 + 20));
  }
  else {
    return 0LL;
  }
}

void sub_10009C924()
{
  qword_10011A378 = (uint64_t)&off_1000F6FA8;
}

void sub_10009C938()
{
  qword_10011A380 = 0x403B000000000000LL;
}

void sub_10009C948()
{
  qword_10011A388 = 0x4042000000000000LL;
}

double sub_10009C958(uint64_t a1)
{
  return sub_10009C9A0(a1, &qword_100112250, (double *)&qword_10011A258, &qword_10011A390, (uint64_t)sub_100045EBC);
}

double sub_10009C97C(uint64_t a1)
{
  return sub_10009C9A0(a1, &qword_100112258, (double *)&qword_10011A260, &qword_10011A398, (uint64_t)sub_100045ECC);
}

double sub_10009C9A0(uint64_t a1, void *a2, double *a3, void *a4, uint64_t a5)
{
  if (*a2 != -1LL) {
    swift_once(a2, a5);
  }
  double result = *a3;
  *a4 = *(void *)a3;
  return result;
}

double sub_10009C9E4()
{
  if (qword_100112440 != -1) {
    swift_once(&qword_100112440, sub_10009C97C);
  }
  double v0 = *(double *)&qword_10011A398;
  if (qword_100112280 != -1) {
    swift_once(&qword_100112280, sub_100046060);
  }
  double result = v0 + *(double *)&qword_10011A288 + 46.0;
  *(double *)&qword_10011A3A0 = result;
  return result;
}

double sub_10009CA74()
{
  if (qword_100112438 != -1) {
    swift_once(&qword_100112438, sub_10009C958);
  }
  double v0 = *(double *)&qword_10011A390;
  if (qword_100112288 != -1) {
    swift_once(&qword_100112288, sub_100046070);
  }
  double result = v0 + *(double *)&qword_10011A290 + 46.0;
  *(double *)&qword_10011A3A8 = result;
  return result;
}

void sub_10009CB04()
{
  qword_10011A3B0 = 0x4069000000000000LL;
}

unint64_t sub_10009CB14@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1000A3208(*a1);
  *a2 = result;
  return result;
}

void sub_10009CB3C(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_10009CB48(void *a1@<X8>)
{
  *a1 = &off_1000F7108;
}

id sub_10009CB58()
{
  return sub_10009CB6C( &OBJC_IVAR____TtC8FaceTime9Snowglobe____lazy_storage___gridMaskView,  (uint64_t (*)(void))sub_10009CBC4);
}

id sub_10009CB6C(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }

  else
  {
    uint64_t v6 = (void *)a2();
    uint64_t v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0LL;
  }

  id v8 = v4;
  return v5;
}

char *sub_10009CBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = type metadata accessor for GradientView(0LL, a2);
  uint64_t v3 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2)) init];
  uint64_t v4 = (double *)&v3[OBJC_IVAR____TtC8FaceTime12GradientView_startPoint];
  swift_beginAccess(&v3[OBJC_IVAR____TtC8FaceTime12GradientView_startPoint], v26, 1LL, 0LL);
  *(_OWORD *)uint64_t v4 = xmmword_1000C6D40;
  id v5 = [v3 layer];
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___CAGradientLayer, v6);
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v5, v7, 0, 0, 0), "setStartPoint:", *v4, v4[1]);

  id v8 = (double *)&v3[OBJC_IVAR____TtC8FaceTime12GradientView_endPoint];
  swift_beginAccess(&v3[OBJC_IVAR____TtC8FaceTime12GradientView_endPoint], v25, 1LL, 0LL);
  *(_OWORD *)id v8 = xmmword_1000C6D50;
  id v9 = [v3 layer];
  uint64_t v11 = objc_opt_self(&OBJC_CLASS___CAGradientLayer, v10);
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v9, v11, 0, 0, 0), "setEndPoint:", *v8, v8[1]);

  uint64_t v12 = sub_100018A04(&qword_1001142B0);
  uint64_t v13 = swift_allocObject(v12, 64LL, 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_1000C4CE0;
  uint64_t v15 = (void *)objc_opt_self(&OBJC_CLASS___UIColor, v14);
  *(void *)(v13 + 32) = [v15 clearColor];
  *(void *)(v13 + 40) = [v15 blackColor];
  *(void *)(v13 + 48) = [v15 blackColor];
  id v16 = [v15 clearColor];
  *(void *)(v13 + 56) = v16;
  v24[0] = v13;
  specialized Array._endMutation()(v16);
  uint64_t v17 = v13;
  unint64_t v18 = (uint64_t *)&v3[OBJC_IVAR____TtC8FaceTime12GradientView_colors];
  swift_beginAccess(&v3[OBJC_IVAR____TtC8FaceTime12GradientView_colors], v24, 1LL, 0LL);
  uint64_t v19 = *v18;
  *unint64_t v18 = v17;
  swift_bridgeObjectRelease(v19);
  sub_100029810();
  uint64_t v20 = &v3[OBJC_IVAR____TtC8FaceTime12GradientView_locations];
  swift_beginAccess(&v3[OBJC_IVAR____TtC8FaceTime12GradientView_locations], &v23, 1LL, 0LL);
  uint64_t v21 = *(void *)v20;
  *(void *)uint64_t v20 = &off_1000F7010;
  swift_bridgeObjectRelease(v21);
  sub_100029D24();
  return v3;
}

id sub_10009CE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = OBJC_IVAR____TtC8FaceTime9Snowglobe____lazy_storage___scene;
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC8FaceTime9Snowglobe____lazy_storage___scene);
  if (v4)
  {
    id v5 = *(id *)(v2 + OBJC_IVAR____TtC8FaceTime9Snowglobe____lazy_storage___scene);
  }

  else
  {
    id v6 = objc_msgSend( objc_allocWithZone((Class)type metadata accessor for Snowglobe.Scene(a1, a2)),  "initWithSize:",  *(double *)(v2 + OBJC_IVAR____TtC8FaceTime9Snowglobe_size),  *(double *)(v2 + OBJC_IVAR____TtC8FaceTime9Snowglobe_size + 8));
    [*(id *)(v2 + OBJC_IVAR____TtC8FaceTime9Snowglobe_skView) presentScene:v6];
    uint64_t v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0LL;
  }

  id v8 = v4;
  return v5;
}

uint64_t sub_10009CEE8(uint64_t *a1, uint64_t a2)
{
  uint64_t v65 = type metadata accessor for IndexPath(0LL);
  uint64_t v63 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v62 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v67 = sub_100018A04((uint64_t *)&unk_100115D10);
  __chkstk_darwin(v67);
  uint64_t v64 = (uint64_t)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100018A04(&qword_100112998);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v61 = (uint64_t)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v54 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v54 - v12;
  uint64_t v14 = sub_100018A04(&qword_100115D08);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  uint64_t v19 = (uint64_t *)((char *)&v54 - v18);
  uint64_t v20 = *a1;
  uint64_t v21 = *(void *)(*a1 + 32);
  uint64_t v66 = *(void *)(*a1 + 24);
  uint64_t v22 = a2 + OBJC_IVAR____TtC8FaceTime9Snowglobe_nBubbleID;
  swift_beginAccess(a2 + OBJC_IVAR____TtC8FaceTime9Snowglobe_nBubbleID, v69, 0LL, 0LL);
  sub_10001C3B8(v22, (uint64_t)v19, &qword_100115D08);
  uint64_t v23 = type metadata accessor for BubbleIdentifier(0LL);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48LL);
  if (v24((uint64_t)v19, 1LL, v23))
  {
    id v25 = &qword_100115D08;
    uint64_t v26 = (uint64_t)v19;
  }

  else
  {
    uint64_t v58 = v23;
    uint64_t v59 = v22;
    uint64_t v55 = v24;
    v56 = v17;
    unsigned int v60 = v11;
    uint64_t v57 = v13;
    uint64_t v29 = *v19;
    uint64_t v30 = v19[1];
    swift_bridgeObjectRetain(v21);
    swift_bridgeObjectRetain(v30);
    sub_10001C608((uint64_t)v19, &qword_100115D08);
    if (v66 == v29 && v21 == v30)
    {
      swift_bridgeObjectRelease_n(v21, 2LL);
      uint64_t v33 = v67;
      uint64_t v35 = v58;
      uint64_t v34 = v59;
    }

    else
    {
      char v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v66, v21, v29, v30, 0LL);
      swift_bridgeObjectRelease(v21);
      swift_bridgeObjectRelease(v30);
      char v27 = 0;
      uint64_t v33 = v67;
      uint64_t v35 = v58;
      uint64_t v34 = v59;
      if ((v32 & 1) == 0) {
        return v27 & 1;
      }
    }

    uint64_t v36 = v20 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
    swift_beginAccess(v20 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath, v68, 0LL, 0LL);
    uint64_t v37 = v63;
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 16);
    uint64_t v39 = (uint64_t)v57;
    uint64_t v40 = v65;
    v38(v57, v36, v65);
    uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56);
    uint64_t v42 = 1LL;
    v41(v39, 0LL, 1LL, v40);
    uint64_t v43 = v34;
    uint64_t v44 = (uint64_t)v56;
    sub_10001C3B8(v43, (uint64_t)v56, &qword_100115D08);
    if (!v55(v44, 1LL, v35))
    {
      v38(v60, v44 + *(int *)(v35 + 20), v40);
      uint64_t v42 = 0LL;
    }

    sub_10001C608(v44, &qword_100115D08);
    uint64_t v45 = (uint64_t)v60;
    v41((uint64_t)v60, v42, 1LL, v40);
    uint64_t v46 = v64;
    uint64_t v47 = v64 + *(int *)(v33 + 48);
    sub_10001C3B8(v39, v64, &qword_100112998);
    sub_10001C3B8(v45, v47, &qword_100112998);
    uint64_t v48 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
    int v49 = v48(v46, 1LL, v40);
    uint64_t v50 = v62;
    if (v49 == 1)
    {
      sub_10001C608(v45, &qword_100112998);
      sub_10001C608(v39, &qword_100112998);
      if (v48(v47, 1LL, v40) == 1)
      {
        sub_10001C608(v46, &qword_100112998);
        char v27 = 1;
        return v27 & 1;
      }
    }

    else
    {
      uint64_t v51 = v61;
      sub_10001C3B8(v46, v61, &qword_100112998);
      if (v48(v47, 1LL, v40) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v50, v47, v40);
        uint64_t v52 = sub_10001949C( (unint64_t *)&unk_100115D20,  (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath,  (uint64_t)&protocol conformance descriptor for IndexPath);
        char v27 = dispatch thunk of static Equatable.== infix(_:_:)(v51, v50, v40, v52);
        id v53 = *(void (**)(char *, uint64_t))(v37 + 8);
        v53(v50, v40);
        sub_10001C608((uint64_t)v60, &qword_100112998);
        sub_10001C608(v39, &qword_100112998);
        v53((char *)v51, v40);
        sub_10001C608(v46, &qword_100112998);
        return v27 & 1;
      }

      sub_10001C608((uint64_t)v60, &qword_100112998);
      sub_10001C608(v39, &qword_100112998);
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v51, v40);
    }

    id v25 = (uint64_t *)&unk_100115D10;
    uint64_t v26 = v46;
  }

  sub_10001C608(v26, v25);
  char v27 = 0;
  return v27 & 1;
}

char *sub_10009D408(double a1, double a2)
{
  v2[OBJC_IVAR____TtC8FaceTime9Snowglobe_mode] = 0;
  *(void *)&v2[OBJC_IVAR____TtC8FaceTime9Snowglobe____lazy_storage___gridMaskView] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles] = &_swiftEmptyArrayStorage;
  uint64_t v5 = OBJC_IVAR____TtC8FaceTime9Snowglobe_skView;
  id v6 = objc_allocWithZone(&OBJC_CLASS___SKView);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = [v6 init];
  uint64_t v8 = OBJC_IVAR____TtC8FaceTime9Snowglobe_maskedView;
  *(void *)&v7[v8] = [objc_allocWithZone(UIView) init];
  uint64_t v9 = OBJC_IVAR____TtC8FaceTime9Snowglobe_globeView;
  *(void *)&v7[v9] = [objc_allocWithZone(UIScrollView) init];
  *(void *)&v7[OBJC_IVAR____TtC8FaceTime9Snowglobe____lazy_storage___scene] = 0LL;
  uint64_t v10 = OBJC_IVAR____TtC8FaceTime9Snowglobe_renderer;
  uint64_t v12 = type metadata accessor for TimeRenderer(0LL, v11);
  uint64_t v13 = swift_allocObject(v12, 40LL, 7LL);
  sub_10004AEE4(v13, v14);
  *(void *)&v7[v10] = v15;
  swift_unknownObjectWeakInit(&v7[OBJC_IVAR____TtC8FaceTime9Snowglobe_parent], 0LL);
  *(void *)&v7[OBJC_IVAR____TtC8FaceTime9Snowglobe_pageFocusGuides] = &_swiftEmptyArrayStorage;
  uint64_t v16 = &v7[OBJC_IVAR____TtC8FaceTime9Snowglobe_nBubbleID];
  uint64_t v17 = type metadata accessor for BubbleIdentifier(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v16, 1LL, 1LL, v17);
  uint64_t v18 = (double *)&v7[OBJC_IVAR____TtC8FaceTime9Snowglobe_size];
  *uint64_t v18 = a1;
  v18[1] = a2;

  v36.receiver = v7;
  v36.super_class = (Class)type metadata accessor for Snowglobe(0LL);
  uint64_t v19 = (char *)objc_msgSendSuper2(&v36, "init");
  uint64_t v21 = (char *)sub_10009CE3C((uint64_t)v19, v20);
  *(void *)&v21[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_verticalOffset] = 0x405B800000000000LL;
  sub_1000A1B88();

  uint64_t v22 = OBJC_IVAR____TtC8FaceTime9Snowglobe_skView;
  uint64_t v23 = *(void **)&v19[OBJC_IVAR____TtC8FaceTime9Snowglobe_skView];
  [v23 setClipsToBounds:0];
  id v25 = (void *)objc_opt_self(&OBJC_CLASS___UIColor, v24);
  id v26 = v23;
  id v27 = [v25 clearColor];
  [v26 setBackgroundColor:v27];

  [*(id *)&v19[v22] setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v28 = *(void **)&v19[OBJC_IVAR____TtC8FaceTime9Snowglobe_maskedView];
  [v28 setClipsToBounds:1];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v29 = *(void **)&v19[OBJC_IVAR____TtC8FaceTime9Snowglobe_globeView];
  [v28 addSubview:v29];
  [v29 setClipsToBounds:0];
  [v29 setScrollEnabled:0];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v29 setDelegate:v19];
  uint64_t v30 = *(void **)&v19[OBJC_IVAR____TtC8FaceTime9Snowglobe_renderer];
  uint64_t v31 = swift_allocObject(&unk_1000FBC00, 24LL, 7LL);
  *(void *)(v31 + 16) = v19;
  uint64_t v32 = v30[3];
  uint64_t v33 = v30[4];
  v30[3] = sub_1000A35F8;
  v30[4] = v31;
  uint64_t v34 = v19;
  sub_10001C08C(v32, v33);
  unint64_t result = (char *)v30[2];
  if (result)
  {
    [result setPaused:0];

    return v34;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10009D74C(unsigned __int8 a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = sub_100018A04(&qword_100115D08);
  __chkstk_darwin(v3);
  if (*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC8FaceTime9Snowglobe_mode) != (_DWORD)v2)
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC8FaceTime9Snowglobe_mode) = v2;
    __asm { BR              X9 }
  }

  return 0LL;
}

void sub_10009E6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = sub_100018A04(&qword_100115D08);
  __chkstk_darwin(v14);
  uint64_t v79 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for IndexPath(0LL);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v78 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v78(v18, a6, v16);
  uint64_t v20 = type metadata accessor for Bubble(0LL);
  swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
  id v21 = a5;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  uint64_t v22 = sub_100049E28(a1, a2, a3, a4, (uint64_t)a5, (uint64_t)v18);

  uint64_t v23 = (uint64_t *)(v7 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess(v7 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles, v82, 0LL, 0LL);
  uint64_t v25 = *v23;
  if ((unint64_t)*v23 >> 62)
  {
    if (v25 < 0) {
      uint64_t v44 = *v23;
    }
    else {
      uint64_t v44 = v25 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v23);
    uint64_t v26 = _CocoaArrayWrapper.endIndex.getter(v44);
    swift_bridgeObjectRelease(v25);
  }

  else
  {
    uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  sub_10009FD48(v26, v24);
  double v28 = v27;
  double v30 = v29;
  swift_beginAccess(v23, v81, 33LL, 0LL);
  swift_retain(v22);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v31);
  unint64_t v33 = *(void *)((*v23 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v32 = *(void *)((*v23 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v33 >= v32 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1LL);
  }
  uint64_t v34 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v22);
  specialized Array._endMutation()(v34);
  swift_endAccess(v81);
  uint64_t v35 = OBJC_IVAR____TtC8FaceTime6Bubble_node;
  objc_super v36 = *(void **)(v22 + OBJC_IVAR____TtC8FaceTime6Bubble_node);
  id v37 = objc_msgSend(v36, "setPosition:", v28, v30);
  id v39 = sub_10009CE3C((uint64_t)v37, v38);
  [v39 addChild:v36];

  uint64_t v40 = OBJC_IVAR____TtC8FaceTime6Bubble_focus;
  uint64_t v41 = *(void **)(v22 + OBJC_IVAR____TtC8FaceTime6Bubble_focus);
  objc_msgSend(v41, "setCenter:", v28, *(double *)(v7 + OBJC_IVAR____TtC8FaceTime9Snowglobe_size + 8) - v30);
  [*(id *)(v7 + OBJC_IVAR____TtC8FaceTime9Snowglobe_globeView) addSubview:v41];
  uint64_t v42 = *v23;
  if ((unint64_t)*v23 >> 62)
  {
    if (v42 < 0) {
      uint64_t v45 = *v23;
    }
    else {
      uint64_t v45 = v42 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v23);
    uint64_t v43 = _CocoaArrayWrapper.endIndex.getter(v45);
    swift_bridgeObjectRelease(v42);
    if (v43 == 1) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v43 = *(void *)((v42 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v43 == 1)
    {
LABEL_7:
      *(_BYTE *)(*(void *)(v22 + v35) + OBJC_IVAR____TtCC8FaceTime6Bubble4Node_enablePhysics) = 0;
      sub_100048084();
      *(_BYTE *)(v22 + 16) = 0;
      sub_100046080();
      sub_10009D74C(1u);
LABEL_33:
      sub_1000A116C();
      return;
    }
  }

  if ((unint64_t)(v43 - 10) >= 0xFFFFFFFFFFFFFFF8LL)
  {
    if (qword_100112420 == -1) {
      goto LABEL_30;
    }
    goto LABEL_48;
  }

  *(_BYTE *)(*(void *)(v22 + v35) + OBJC_IVAR____TtCC8FaceTime6Bubble4Node_enablePhysics) = 0;
  sub_100048084();
  *(_BYTE *)(v22 + 16) = 1;
  uint64_t v46 = *v23;
  BOOL v47 = (*v23 & 0xC000000000000001LL) == 0;
  uint64_t v77 = v40;
  if (v47)
  {
    if (*(void *)((v46 & 0xFFFFFFFFFFFFF8LL) + 0x10) < 9uLL)
    {
      __break(1u);
      goto LABEL_35;
    }

    uint64_t v71 = *(void *)(v46 + 96);
    swift_retain(v71);
  }

  else
  {
    swift_bridgeObjectRetain(v46);
    uint64_t v71 = specialized _ArrayBuffer._getElementSlowPath(_:)(8LL, v46);
    swift_bridgeObjectRelease(v46);
  }

  uint64_t v49 = *(void *)(v71 + 24);
  uint64_t v48 = *(void *)(v71 + 32);
  uint64_t v76 = v71;
  uint64_t v50 = v71 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
  swift_beginAccess(v50, v81, 0LL, 0LL);
  uint64_t v40 = type metadata accessor for BubbleIdentifier(0LL);
  uint64_t v51 = v79;
  v78(&v79[*(int *)(v40 + 20)], v50, v16);
  *uint64_t v51 = v49;
  v51[1] = v48;
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56LL))(v51, 0LL, 1LL, v40);
  uint64_t v52 = v7 + OBJC_IVAR____TtC8FaceTime9Snowglobe_nBubbleID;
  swift_beginAccess(v7 + OBJC_IVAR____TtC8FaceTime9Snowglobe_nBubbleID, v80, 33LL, 0LL);
  swift_bridgeObjectRetain(v48);
  sub_1000A3544((uint64_t)v51, v52);
  swift_endAccess(v80);
  uint64_t v46 = *v23;
  if (!((unint64_t)*v23 >> 62))
  {
    uint64_t v53 = *(void *)((v46 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    goto LABEL_23;
  }

id sub_10009EE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_100018A04(&qword_100115D08);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v119 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v126 = type metadata accessor for IndexPath(0LL);
  unint64_t v11 = *(void *)(v126 - 8);
  uint64_t v12 = __chkstk_darwin(v126);
  uint64_t v14 = (uint64_t)&v119 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v16 = (uint64_t)&v119 - v15;
  v128 = v3;
  uint64_t v17 = (void *)((char *)v3 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess((char *)v3 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles, v135, 0LL, 0LL);
  uint64_t v18 = *v17;
  uint64_t v130 = a1;
  uint64_t v131 = a2;
  uint64_t v132 = a3;
  swift_bridgeObjectRetain(v18);
  unint64_t v19 = sub_1000982C0(sub_1000A3500, (uint64_t)v129, v18);
  int v21 = v20;
  swift_bridgeObjectRelease(v18);
  if ((v21 & 1) != 0) {
    return (id)v19;
  }
  int v125 = v21;
  swift_beginAccess(v17, v134, 33LL, 0LL);
  uint64_t v127 = v19;
  uint64_t v22 = sub_10009FC68(v19);
  swift_endAccess(v134);
  uint64_t v23 = *v17;
  uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (v24 == 1)
  {
LABEL_57:
    sub_100047C88(0LL, 0LL);
    sub_10009D74C(1u);
LABEL_112:
    sub_1000A116C();
    swift_release(v22);
    return (id)v127;
  }

  while (1)
  {
    if (!v24)
    {
      sub_100047C88(0LL, 0LL);
      if (*((_BYTE *)v128 + OBJC_IVAR____TtC8FaceTime9Snowglobe_mode)) {
        *((_BYTE *)v128 + OBJC_IVAR____TtC8FaceTime9Snowglobe_mode) = 0;
      }
      goto LABEL_112;
    }

    BOOL v25 = v24 < 2;
    uint64_t v26 = v128;
    if (v25) {
      goto LABEL_112;
    }
    int v27 = *((unsigned __int8 *)v128 + OBJC_IVAR____TtC8FaceTime9Snowglobe_mode);
    if (v27 != 3) {
      break;
    }
    [*(id *)(v22 + OBJC_IVAR____TtC8FaceTime6Bubble_focus) setEnabled:0];
    sub_100047C88(0LL, 0LL);
    uint64_t v29 = *v17;
    unint64_t v30 = (unint64_t)*v17 >> 62;
    uint64_t v124 = v22;
    if (v30)
    {
      if (v29 < 0) {
        uint64_t v28 = v29;
      }
      else {
        uint64_t v28 = v29 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v58 = v26;
      swift_bridgeObjectRetain_n(v29, 2LL);
      double v59 = v58;
      uint64_t v26 = v128;
      uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v28);
      if (!v16)
      {
LABEL_62:
        swift_bridgeObjectRelease(v29);

        uint64_t v22 = v124;
        goto LABEL_110;
      }
    }

    else
    {
      uint64_t v16 = *(void *)((v29 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      uint64_t v28 = v26;
      swift_bridgeObjectRetain_n(v29, 2LL);
      id v31 = (id)v28;
      if (!v16) {
        goto LABEL_62;
      }
    }

    if (v16 < 1)
    {
      __break(1u);
LABEL_64:
      if (v28 < 0) {
        uint64_t v60 = v28;
      }
      else {
        uint64_t v60 = v28 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v28);
      uint64_t v61 = _CocoaArrayWrapper.endIndex.getter(v60);
      swift_bridgeObjectRelease(v28);
      if (v61 >= 9) {
        goto LABEL_68;
      }
LABEL_13:
      sub_100047C88(0LL, 0LL);
      uint64_t v10 = v123;
      goto LABEL_109;
    }

    uint64_t v14 = 0LL;
    unint64_t v11 = v29 & 0xC000000000000001LL;
    uint64_t v22 = 8LL;
    while (1)
    {
      if (v11)
      {
        uint64_t v10 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, v29);
      }

      else
      {
        uint64_t v10 = *(char **)(v29 + 8 * v14 + 32);
        swift_retain(v10);
      }

      *(_BYTE *)(*(void *)&v10[OBJC_IVAR____TtC8FaceTime6Bubble_node]
               + OBJC_IVAR____TtCC8FaceTime6Bubble4Node_enablePhysics) = 0;
      sub_100048084();
      sub_10009FF44();
      double v33 = v32;
      double v4 = v34;
      uint64_t v23 = *v17;
      uint64_t v35 = *(void *)((v23 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      uint64_t v36 = v35 - 1;
      if (__OFSUB__(v35, 1LL)) {
        goto LABEL_52;
      }
LABEL_25:
      if (v36 >= 8) {
        a3 = 8LL;
      }
      else {
        a3 = v36;
      }
      uint64_t v37 = *v17;
      if ((unint64_t)*v17 >> 62)
      {
        if (v37 < 0) {
          uint64_t v40 = *v17;
        }
        else {
          uint64_t v40 = v37 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(*v17);
        uint64_t v41 = _CocoaArrayWrapper.endIndex.getter(v40);
        swift_bridgeObjectRelease(v37);
        if (v41 == 2)
        {
LABEL_30:
          v10[16] = 0;
          sub_10004793C(v14 == a3, v33, v4);
          goto LABEL_19;
        }
      }

      else if (*(void *)((v37 & 0xFFFFFFFFFFFFF8LL) + 0x10) == 2LL)
      {
        goto LABEL_30;
      }

      v10[16] = 1;
      sub_1000475AC(v14 == a3, v33, v4);
LABEL_19:
      uint64_t v26 = v128;
      swift_release(v10);
      if (v16 == ++v14) {
        goto LABEL_62;
      }
    }

    if (v23 < 0) {
      uint64_t v38 = *v17;
    }
    else {
      uint64_t v38 = v23 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v17);
    uint64_t v39 = _CocoaArrayWrapper.endIndex.getter(v38);
    swift_bridgeObjectRelease(v23);
    uint64_t v36 = v39 - 1;
    if (!__OFSUB__(v39, 1LL)) {
      goto LABEL_25;
    }
LABEL_52:
    __break(1u);
LABEL_53:
    if (v23 < 0) {
      uint64_t v57 = v23;
    }
    else {
      uint64_t v57 = v23 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v23);
    uint64_t v24 = _CocoaArrayWrapper.endIndex.getter(v57);
    swift_bridgeObjectRelease(v23);
    if (v24 == 1) {
      goto LABEL_57;
    }
  }

  if (v27 != 2) {
    goto LABEL_111;
  }
  a3 = swift_allocObject(&unk_1000FBB60, 24LL, 7LL);
  *(void *)(a3 + 16) = _swiftEmptyArrayStorage;
  v123 = (char *)(a3 + 16);
  if (v127 >= 9)
  {
    uint64_t v10 = v123;
    if (v127 != 9) {
      goto LABEL_51;
    }
    uint64_t v42 = *v17;
    if ((unint64_t)*v17 >> 62)
    {
      uint64_t v114 = v42 < 0 ? *v17 : v42 & 0xFFFFFFFFFFFFFF8LL;
      swift_bridgeObjectRetain(*v17);
      uint64_t v43 = _CocoaArrayWrapper.endIndex.getter(v114);
      swift_bridgeObjectRelease(v42);
    }

    else
    {
      uint64_t v43 = *(void *)((v42 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    BOOL v44 = v43 == 9;
    uint64_t v26 = v128;
    if (!v44) {
      goto LABEL_51;
    }
    uint64_t v45 = *v17;
    uint64_t v46 = v22;
    BOOL v47 = v128;
    uint64_t v48 = swift_bridgeObjectRetain(v45);
    uint64_t v49 = sub_1000A2CF0(v48, (uint64_t)v47);
    uint64_t v50 = v45;
    uint64_t v26 = v128;
    swift_bridgeObjectRelease(v50);

    uint64_t v22 = v46;
    if (v49)
    {
      sub_100046554();
      uint64_t v51 = *(void *)(v49 + 24);
      uint64_t v52 = *(void *)(v49 + 32);
      swift_bridgeObjectRetain(v52);
      uint64_t v53 = sub_100019AE4(0LL, 1LL, 1, _swiftEmptyArrayStorage);
      unint64_t v55 = v53[2];
      unint64_t v54 = v53[3];
      if (v55 >= v54 >> 1) {
        uint64_t v53 = sub_100019AE4((void *)(v54 > 1), v55 + 1, 1, v53);
      }
      v53[2] = v55 + 1;
      uint64_t v56 = &v53[2 * v55];
      v56[4] = v51;
      v56[5] = v52;
      swift_release(v49);
      *(void *)uint64_t v10 = v53;
    }

    else
    {
LABEL_51:
      sub_1000A2E24(v26, (uint64_t *)a3, 0.0);
    }

    goto LABEL_109;
  }

  uint64_t v28 = *v17;
LABEL_68:
  uint64_t v62 = *v17;
  if ((*v17 & 0xC000000000000001LL) == 0)
  {
    if (*(void *)((v62 & 0xFFFFFFFFFFFFF8LL) + 0x10) >= 9uLL)
    {
      uint64_t v63 = *(void *)(v62 + 96);
      swift_retain(v63);
      goto LABEL_71;
    }

    __break(1u);
LABEL_98:
    if (v62 < 0) {
      uint64_t v115 = v62;
    }
    else {
      uint64_t v115 = v62 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_retain(v22);
    swift_bridgeObjectRetain(v62);
    uint64_t v102 = _CocoaArrayWrapper.endIndex.getter(v115);
    swift_bridgeObjectRelease(v62);
    goto LABEL_82;
  }

  swift_bridgeObjectRetain(*v17);
  uint64_t v63 = specialized _ArrayBuffer._getElementSlowPath(_:)(8LL, v62);
  swift_bridgeObjectRelease(v62);
LABEL_71:
  swift_beginAccess(v17, v134, 33LL, 0LL);
  uint64_t v64 = sub_10009FC68(8uLL);
  swift_endAccess(v134);
  swift_release(v64);
  uint64_t v66 = *(void *)(v63 + 24);
  id result = *(id *)(v63 + 32);
  uint64_t v122 = v63;
  if (v127 == 8)
  {
    uint64_t v67 = v63;
    uint64_t v68 = *(void *)(v22 + 32);
    *(void *)(v22 + 24) = v66;
    *(void *)(v22 + 32) = result;
    swift_bridgeObjectRetain(result);
    swift_bridgeObjectRelease(v68);
    uint64_t v69 = v67 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
    swift_beginAccess(v67 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath, v133, 0LL, 0LL);
    v121 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    uint64_t v70 = v69;
    uint64_t v71 = v126;
    v121(v16, v70, v126);
    uint64_t v72 = v22 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
    uint64_t v120 = v22 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
    swift_beginAccess(v22 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath, v134, 33LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40))(v72, v16, v71);
    swift_endAccess(v134);
    uint64_t v73 = OBJC_IVAR____TtC8FaceTime6Bubble_focus;
    uint64_t v74 = *(char **)(v22 + OBJC_IVAR____TtC8FaceTime6Bubble_focus);
    uint64_t v76 = *v75;
    uint64_t v77 = v75[1];
    uint64_t v78 = &v74[OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_name];
    uint64_t v79 = *(void *)&v74[OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_name + 8];
    *(void *)uint64_t v78 = v76;
    *((void *)v78 + 1) = v77;
    uint64_t v80 = v22;
    v81 = v74;
    swift_bridgeObjectRetain(v77);
    swift_bridgeObjectRelease(v79);
    sub_10004851C();

    uint64_t v22 = v80;
    v82 = *(void **)(*(void *)(v67 + v73) + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_avatarImageView);
    uint64_t v83 = (char *)*(id *)(v80 + v73);
    id v84 = [v82 image];
    [*(id *)&v83[OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_avatarImageView] setImage:v84];

    uint64_t v85 = *(void *)(v80 + 24);
    uint64_t v86 = *(void *)(v80 + 32);
    uint64_t v87 = type metadata accessor for BubbleIdentifier(0LL);
    v121((uint64_t)&v10[*(int *)(v87 + 20)], v120, v126);
    *(void *)uint64_t v10 = v85;
    *((void *)v10 + 1) = v86;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v87 - 8) + 56LL))(v10, 0LL, 1LL, v87);
    uint64_t v88 = (char *)v128 + OBJC_IVAR____TtC8FaceTime9Snowglobe_nBubbleID;
    swift_beginAccess((char *)v128 + OBJC_IVAR____TtC8FaceTime9Snowglobe_nBubbleID, v134, 33LL, 0LL);
    swift_bridgeObjectRetain(v86);
    sub_1000A3544((uint64_t)v10, (uint64_t)v88);
    swift_endAccess(v134);
    double v4 = 0.0;
    uint64_t v10 = v123;
LABEL_80:
    swift_beginAccess(v17, v134, 33LL, 0LL);
    uint64_t v62 = *v17;
    uint64_t v102 = *(void *)((v62 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_retain(v22);
LABEL_82:
    if (v102 < v127)
    {
      __break(1u);
    }

    else if ((v127 & 0x8000000000000000LL) == 0)
    {
      sub_1000A274C(v127, v127, v22);
      swift_endAccess(v134);
      sub_100047C88(0LL, 0LL);
      uint64_t v62 = *v17;
      if (!((unint64_t)*v17 >> 62))
      {
        if (*(void *)((v62 & 0xFFFFFFFFFFFFF8LL) + 0x10) == 9LL) {
          goto LABEL_86;
        }
LABEL_108:
        sub_1000A2E24(v128, (uint64_t *)a3, v4);
        swift_release(v122);
        goto LABEL_109;
      }

LABEL_104:
      if (v62 < 0) {
        uint64_t v116 = v62;
      }
      else {
        uint64_t v116 = v62 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v62);
      uint64_t v117 = _CocoaArrayWrapper.endIndex.getter(v116);
      swift_bridgeObjectRelease(v62);
      if (v117 != 9) {
        goto LABEL_108;
      }
LABEL_86:
      uint64_t v103 = *v17;
      uint64_t v104 = v22;
      v105 = v128;
      uint64_t v106 = swift_bridgeObjectRetain(v103);
      uint64_t v107 = sub_1000A2CF0(v106, (uint64_t)v105);
      swift_bridgeObjectRelease(v103);

      uint64_t v22 = v104;
      if (!v107) {
        goto LABEL_108;
      }
      sub_100046554();
      uint64_t v108 = *(void *)(v107 + 24);
      uint64_t v109 = *(void *)(v107 + 32);
      v110 = *(void **)v10;
      swift_bridgeObjectRetain(v109);
      if ((swift_isUniquelyReferenced_nonNull_native(v110) & 1) == 0) {
        v110 = sub_100019AE4(0LL, v110[2] + 1LL, 1, v110);
      }
      unint64_t v112 = v110[2];
      unint64_t v111 = v110[3];
      if (v112 >= v111 >> 1) {
        v110 = sub_100019AE4((void *)(v111 > 1), v112 + 1, 1, v110);
      }
      v110[2] = v112 + 1;
      v113 = &v110[2 * v112];
      v113[4] = v108;
      v113[5] = v109;
      swift_release(v122);
      swift_release(v107);
      *(void *)uint64_t v10 = v110;
LABEL_109:
      swift_beginAccess(v10, v134, 0LL, 0LL);
      uint64_t v29 = *(void *)(a3 + 16);
      v118 = (void *)swift_bridgeObjectRetain(v29);
      sub_1000A0C2C(v118);
      swift_release(a3);
LABEL_110:
      swift_bridgeObjectRelease(v29);
LABEL_111:
      sub_1000A0344();
      goto LABEL_112;
    }

    __break(1u);
    goto LABEL_104;
  }

  v121 = (void (*)(uint64_t, uint64_t, uint64_t))a3;
  uint64_t v124 = v22;
  uint64_t v89 = *(void *)(v63 + OBJC_IVAR____TtC8FaceTime6Bubble_focus);
  uint64_t v90 = *(void *)(v89 + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_name + 8);
  if (v90)
  {
    uint64_t v91 = (uint64_t)result;
    uint64_t v120 = *(void *)(v89 + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_name);
    uint64_t v92 = v63 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
    swift_beginAccess(v92, v133, 0LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v14, v92, v126);
    uint64_t v93 = *(void **)(v89 + OBJC_IVAR____TtCC8FaceTime6Bubble5Focus_avatarImageView);
    uint64_t v94 = v91;
    swift_bridgeObjectRetain(v91);
    swift_bridgeObjectRetain(v90);
    id result = [v93 image];
    if (result)
    {
      v95 = result;
      uint64_t v22 = v124;
      sub_100046D78(v66, v94, v120, v90, v14, result);
      swift_bridgeObjectRelease(v94);
      swift_bridgeObjectRelease(v90);

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v126);
      uint64_t v96 = *(void *)(v22 + 24);
      uint64_t v97 = *(void *)(v22 + 32);
      uint64_t v10 = v123;
      uint64_t v98 = *(void **)v123;
      swift_bridgeObjectRetain(v97);
      if ((swift_isUniquelyReferenced_nonNull_native(v98) & 1) == 0) {
        uint64_t v98 = sub_100019AE4(0LL, v98[2] + 1LL, 1, v98);
      }
      a3 = (uint64_t)v121;
      unint64_t v100 = v98[2];
      unint64_t v99 = v98[3];
      if (v100 >= v99 >> 1) {
        uint64_t v98 = sub_100019AE4((void *)(v99 > 1), v100 + 1, 1, v98);
      }
      v98[2] = v100 + 1;
      v101 = &v98[2 * v100];
      v101[4] = v96;
      v101[5] = v97;
      *(void *)uint64_t v10 = v98;
      double v4 = 0.2;
      goto LABEL_80;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_10009FAF8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for IndexPath(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __chkstk_darwin(v10);
  uint64_t v14 = &v26[-v13 - 8];
  uint64_t v15 = *a1;
  uint64_t v16 = *(void *)(v15 + 24);
  uint64_t v17 = *(void *)(v15 + 32);
  if (v16 == a2 && v17 == a3)
  {
    int v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v20(&v26[-v13 - 8], a4, v8);
    goto LABEL_8;
  }

  char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, a2, a3, 0LL);
  int v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v20(v14, a4, v8);
  if ((v19 & 1) != 0)
  {
LABEL_8:
    uint64_t v22 = v15 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath;
    swift_beginAccess(v15 + OBJC_IVAR____TtC8FaceTime6Bubble_indexPath, v26, 0LL, 0LL);
    v20(v12, v22, v8);
    char v21 = static IndexPath.== infix(_:_:)(v12, v14);
    uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
    v23(v12, v8);
    v23(v14, v8);
    return v21 & 1;
  }

  char v21 = 0;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  return v21 & 1;
}

uint64_t sub_10009FC68(unint64_t a1)
{
  uint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *uint64_t v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000LL) != 0)
  {
    uint64_t v3 = sub_10001AC1C(v3);
    *uint64_t v1 = v3;
  }

  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8LL;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }

  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 8 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      uint64_t v11 = memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(void *)(v5 + 16) = v7;
      specialized Array._endMutation()(v11);
      return v10;
    }
  }

  char v13 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v13,  1046LL,  0);
  __break(1u);
  return result;
}

void sub_10009FD48(uint64_t a1, uint64_t a2)
{
  id v3 = sub_10009CE3C(a1, a2);
  [v3 size];
  [v3 size];

  if (!a1)
  {
    if (qword_100112448 != -1) {
      swift_once(&qword_100112448, sub_10009C9E4);
    }
    if (qword_100112440 != -1) {
      swift_once(&qword_100112440, sub_10009C97C);
    }
  }

void sub_10009FF44()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles, v7, 0LL, 0LL);
  uint64_t v2 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    if (v2 < 0) {
      uint64_t v3 = *v1;
    }
    else {
      uint64_t v3 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v1);
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v3);
    swift_bridgeObjectRelease(v2);
    if (v4 == 2) {
      goto LABEL_3;
    }
  }

  else if (*(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10) == 2LL)
  {
LABEL_3:
    if (qword_100112258 != -1) {
      swift_once(&qword_100112258, sub_100045ECC);
    }
    if (qword_100112448 != -1) {
      swift_once(&qword_100112448, sub_10009C9E4);
    }
    if (qword_100112440 != -1) {
      swift_once(&qword_100112440, sub_10009C97C);
    }
    return;
  }

  uint64_t v5 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    if (v5 < 0) {
      uint64_t v6 = *v1;
    }
    else {
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v5);
    _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v5);
  }

  if (qword_100112450 != -1) {
    swift_once(&qword_100112450, sub_10009CA74);
  }
  if (qword_100112430 != -1) {
    swift_once(&qword_100112430, sub_10009C948);
  }
  if (qword_100112438 != -1) {
    swift_once(&qword_100112438, sub_10009C958);
  }
  if (qword_100112428 != -1) {
    swift_once(&qword_100112428, sub_10009C938);
  }
}

void sub_1000A0344()
{
  uint64_t v1 = (double *)(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_size);
  double v2 = *(double *)(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_size + 8);
  uint64_t v57 = v0;
  uint64_t v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles, v61, 0LL, 0LL);
  double v59 = v3;
  uint64_t v4 = *v3;
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    if (qword_100112450 != -1) {
      swift_once(&qword_100112450, sub_10009CA74);
    }
    double v6 = *(double *)&qword_10011A3A8;
    if (qword_100112430 != -1) {
      swift_once(&qword_100112430, sub_10009C948);
    }
    double v7 = *(double *)&qword_10011A388;
    uint64_t v8 = *v59;
    if ((unint64_t)*v59 >> 62)
    {
      if (v8 < 0) {
        uint64_t v54 = *v59;
      }
      else {
        uint64_t v54 = v8 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(*v59);
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v54);
      swift_bridgeObjectRelease(v8);
    }

    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    double v10 = floor((double)v9 / 9.0);
    if ((~*(void *)&v10 & 0x7FF0000000000000LL) == 0)
    {
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }

    if (v10 <= -9.22337204e18) {
      goto LABEL_81;
    }
    if (v10 >= 9.22337204e18) {
      goto LABEL_82;
    }
    uint64_t v58 = (uint64_t)v10;
    uint64_t v9 = *v59;
    if (!((unint64_t)*v59 >> 62))
    {
      uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      goto LABEL_14;
    }

LABEL_83:
    uint64_t v55 = v9 < 0 ? v9 : v9 & 0xFFFFFFFFFFFFFF8LL;
    swift_bridgeObjectRetain(v9);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v55);
    swift_bridgeObjectRelease(v9);
LABEL_14:
    uint64_t v12 = 3 * v58;
    if ((unsigned __int128)(v58 * (__int128)3LL) >> 64 != (3 * v58) >> 63)
    {
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
      return;
    }

    uint64_t v13 = v11 % 9;
    if (v11 % 9 >= 3) {
      uint64_t v13 = 3LL;
    }
    uint64_t v4 = v12 + v13;
    if (__OFADD__(v12, v13)) {
      goto LABEL_88;
    }
    if (v58 < -1) {
      goto LABEL_89;
    }
    double v14 = fmin(ceil((double)v5 / 3.0), 3.0);
    double v15 = v2 * 0.5 + (v14 * v6 + (v14 + -1.0) * v7 + 30.0 + 82.0) * 0.5;
    if (v58 == -1) {
      break;
    }
    uint64_t v16 = 0LL;
    uint64_t v17 = (void *)(v57 + OBJC_IVAR____TtC8FaceTime9Snowglobe_pageFocusGuides);
    uint64_t v56 = OBJC_IVAR____TtC8FaceTime9Snowglobe_globeView;
    while (v16 != v58 + 1)
    {
      uint64_t v19 = *v59;
      if ((unint64_t)*v59 >> 62)
      {
        if (v19 < 0) {
          uint64_t v35 = *v59;
        }
        else {
          uint64_t v35 = v19 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(*v59);
        uint64_t v20 = _CocoaArrayWrapper.endIndex.getter(v35);
        swift_bridgeObjectRelease(v19);
      }

      else
      {
        uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      }

      if (v16 == 0xE38E38E38E38E39LL) {
        goto LABEL_66;
      }
      uint64_t v21 = v20 - 9 * v16;
      if (__OFSUB__(v20, 9 * v16)) {
        goto LABEL_67;
      }
      if (v21 >= 9) {
        uint64_t v21 = 9LL;
      }
      double v22 = ceil((double)v21 / 3.0);
      if ((~*(void *)&v22 & 0x7FF0000000000000LL) == 0) {
        goto LABEL_68;
      }
      if (v22 <= -9.22337204e18) {
        goto LABEL_69;
      }
      if (v22 >= 9.22337204e18) {
        goto LABEL_70;
      }
      uint64_t v23 = v4;
      uint64_t v4 = (uint64_t)v22;
      if (v4)
      {
        uint64_t v24 = 0LL;
        BOOL v25 = *(void **)(v57 + v56);
        do
        {
          id v26 = [objc_allocWithZone(UIFocusContainerGuide) init];
          swift_beginAccess(v17, v60, 33LL, 0LL);
          id v27 = v26;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v27);
          unint64_t v29 = *(void *)((*v17 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v28 = *(void *)((*v17 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v29 >= v28 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1LL);
          }
          uint64_t v30 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v29, v27);
          specialized Array._endMutation()(v30);
          swift_endAccess(v60);
          [v25 addLayoutGuide:v27];
          double v31 = *v1;
          if (qword_100112438 != -1) {
            swift_once(&qword_100112438, sub_10009C958);
          }
          double v32 = *(double *)&qword_10011A390;
          if (qword_100112428 != -1) {
            swift_once(&qword_100112428, sub_10009C938);
          }
          double v33 = v32 * 3.0;
          double v34 = *(double *)&qword_10011A380 + *(double *)&qword_10011A380;
          double v2 = v31 * 0.5 + (v33 + *(double *)&qword_10011A380 + *(double *)&qword_10011A380) * -0.5;
          objc_msgSend(v25, "frame", v56);
          objc_msgSend( v27,  "_setManualLayoutFrame:",  v2,  CGRectGetHeight(v62) - v15 + (*(double *)&qword_10011A390 + *(double *)&qword_10011A388) * (double)v24,  v34 + *(double *)&qword_10011A390 * 3.0);

          ++v24;
        }

        while (v4 != v24);
      }

      BOOL v18 = v16++ == v58;
      uint64_t v4 = v23;
      if (v18) {
        goto LABEL_47;
      }
    }

    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    if (v4 < 0) {
      uint64_t v53 = v4;
    }
    else {
      uint64_t v53 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v53);
    swift_bridgeObjectRelease(v4);
  }

LABEL_47:
  if (v4 < 0) {
    goto LABEL_90;
  }
  if (v4)
  {
    uint64_t v36 = 0LL;
    uint64_t v37 = (void *)(v57 + OBJC_IVAR____TtC8FaceTime9Snowglobe_pageFocusGuides);
    uint64_t v38 = *(void **)(v57 + OBJC_IVAR____TtC8FaceTime9Snowglobe_globeView);
    do
    {
      id v39 = [objc_allocWithZone(UIFocusContainerGuide) init];
      swift_beginAccess(v37, v60, 33LL, 0LL);
      id v40 = v39;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v40);
      unint64_t v42 = *(void *)((*v37 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      unint64_t v41 = *(void *)((*v37 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
      if (v42 >= v41 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v41 > 1, v42 + 1, 1LL);
      }
      uint64_t v43 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v42, v40);
      specialized Array._endMutation()(v43);
      swift_endAccess(v60);
      [v38 addLayoutGuide:v40];
      double v44 = *v1;
      if (qword_100112438 != -1) {
        swift_once(&qword_100112438, sub_10009C958);
      }
      double v45 = *(double *)&qword_10011A390;
      double v46 = *(double *)&qword_10011A390;
      if (qword_100112428 != -1)
      {
        swift_once(&qword_100112428, sub_10009C938);
        double v46 = *(double *)&qword_10011A390;
      }

      double v47 = *(double *)&qword_10011A380;
      objc_msgSend(v38, "frame", v56);
      double Height = CGRectGetHeight(v63);
      uint64_t v49 = *v59;
      if ((unint64_t)*v59 >> 62)
      {
        if (v49 < 0) {
          uint64_t v52 = *v59;
        }
        else {
          uint64_t v52 = v49 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(*v59);
        uint64_t v50 = _CocoaArrayWrapper.endIndex.getter(v52);
        swift_bridgeObjectRelease(v49);
      }

      else
      {
        uint64_t v50 = *(void *)((v49 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      }

      double v51 = fmin(ceil((double)v50 / 3.0), 3.0);
      objc_msgSend( v40,  "_setManualLayoutFrame:",  (v47 + v46) * (double)v36 + v44 * 0.5 + (v45 * 3.0 + v47 + v47) * -0.5,  Height - v15,  v46,  *(double *)&qword_10011A3A8 * v51 + *(double *)&qword_10011A388 * (v51 + -1.0));

      ++v36;
    }

    while (v4 != v36);
  }

  sub_100022550(a1);
  return v57;
}

uint64_t sub_1000A0AFC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_pageFocusGuides);
  swift_beginAccess(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_pageFocusGuides, v11, 1LL, 0LL);
  uint64_t v2 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n(*v1, 2LL);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease_n(v2, 2LL);
    uint64_t v10 = *v1;
    *uint64_t v1 = (uint64_t)&_swiftEmptyArrayStorage;
    return swift_bridgeObjectRelease(v10);
  }

  if (v2 < 0) {
    uint64_t v9 = *v1;
  }
  else {
    uint64_t v9 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(*v1, 2LL);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v9);
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_13;
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0LL;
    double v6 = *(void **)(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_globeView);
    do
    {
      if ((v2 & 0xC000000000000001LL) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      ++v5;
      [v6 removeLayoutGuide:v7];
    }

    while (v3 != v5);
    goto LABEL_13;
  }

  __break(1u);
  return result;
}

void sub_1000A0C2C(void *a1)
{
  uint64_t v2 = (unint64_t *)(v1 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess(v2, v52, 0LL, 0LL);
  unint64_t v3 = *v2;
  if (*v2 >> 62) {
    goto LABEL_55;
  }
  if (*(uint64_t *)((v3 & 0xFFFFFFFFFFFFF8LL) + 0x10) >= 2)
  {
    do
    {
      uint64_t v4 = *v2;
      if (*v2 >> 62)
      {
        if (v4 < 0) {
          uint64_t v46 = *v2;
        }
        else {
          uint64_t v46 = v4 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(*v2);
        uint64_t v47 = _CocoaArrayWrapper.endIndex.getter(v46);
        swift_bridgeObjectRelease(v4);
        uint64_t v6 = v47 - 1;
        if (__OFSUB__(v47, 1LL))
        {
LABEL_65:
          __break(1u);
LABEL_66:
          __break(1u);
          return;
        }
      }

      else
      {
        uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        uint64_t v6 = v5 - 1;
        if (__OFSUB__(v5, 1LL)) {
          goto LABEL_65;
        }
      }

      if (v6 >= 8) {
        uint64_t v7 = 8LL;
      }
      else {
        uint64_t v7 = v6;
      }
      if (v7 < 0) {
        goto LABEL_66;
      }
      unint64_t v3 = 0LL;
      uint64_t v8 = &OBJC_IVAR____TtC8FaceTime6Bubble_node;
      uint64_t v9 = a1[2];
      uint64_t v48 = v2;
      while (1)
      {
        unint64_t v10 = *v2;
        if ((*v2 & 0xC000000000000001LL) != 0)
        {
          swift_bridgeObjectRetain(*v2);
          uint64_t v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v3, v10);
          swift_bridgeObjectRelease(v10);
        }

        else
        {
          if (v3 >= *(void *)((v10 & 0xFFFFFFFFFFFFF8LL) + 0x10))
          {
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
            goto LABEL_54;
          }

          uint64_t v11 = *(void *)(v10 + 8 * v3 + 32);
          swift_retain(v11);
        }

        uint64_t v13 = *(void *)(v11 + 24);
        uint64_t v12 = *(void *)(v11 + 32);
        swift_bridgeObjectRetain(v12);
        swift_release(v11);
        if (v9)
        {
          uint64_t v14 = a1[4];
          uint64_t v15 = a1[5];
          BOOL v16 = v14 == v13 && v15 == v12;
          if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, v13, v12, 0LL) & 1) != 0)
          {
LABEL_10:
            swift_bridgeObjectRelease(v12);
            goto LABEL_11;
          }

          if (v9 != 1)
          {
            uint64_t v35 = a1[6];
            uint64_t v36 = a1[7];
            BOOL v37 = v35 == v13 && v36 == v12;
            if (v37 || (_stringCompareWithSmolCheck(_:_:expecting:)(v35, v36, v13, v12, 0LL) & 1) != 0) {
              goto LABEL_10;
            }
            if (v9 != 2) {
              break;
            }
          }
        }

LABEL_54:
      __break(1u);
LABEL_55:
      if ((v3 & 0x8000000000000000LL) != 0LL) {
        uint64_t v44 = v3;
      }
      else {
        uint64_t v44 = v3 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v3);
      uint64_t v45 = _CocoaArrayWrapper.endIndex.getter(v44);
      swift_bridgeObjectRelease(v3);
    }

    while (v45 >= 2);
  }

id sub_1000A116C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess(v0 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles, v16, 0LL, 0LL);
  uint64_t v2 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    if (v2 < 0) {
      uint64_t v14 = *v1;
    }
    else {
      uint64_t v14 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  double v4 = floor((double)v3 / 9.0);
  if ((~*(void *)&v4 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_23;
  }

  if (v4 <= -9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  if (v4 >= 9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  uint64_t v3 = (uint64_t)v4;
  uint64_t v2 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    goto LABEL_8;
  }

id sub_1000A13E4()
{
  return sub_100095514(0LL, (uint64_t (*)(void))type metadata accessor for Snowglobe);
}

uint64_t sub_1000A14B8()
{
  return type metadata accessor for Snowglobe(0LL);
}

uint64_t type metadata accessor for Snowglobe(uint64_t a1)
{
  return sub_100020F70(a1, (uint64_t *)&unk_100115BC8, (uint64_t)&nominal type descriptor for Snowglobe);
}

void sub_1000A14D4(uint64_t a1)
{
  v4[0] = &unk_1000C6E68;
  v4[1] = &unk_1000C6E80;
  v4[2] = "\b";
  v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[7] = "\b";
  v4[8] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[9] = &unk_1000C6E28;
  v4[10] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_1000A159C(319LL);
  if (v3 <= 0x3F)
  {
    v4[11] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 12LL, v4, a1 + 80);
  }

void sub_1000A159C(uint64_t a1)
{
  if (!qword_100115BD8)
  {
    uint64_t v2 = type metadata accessor for BubbleIdentifier(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100115BD8);
    }
  }

uint64_t type metadata accessor for BubbleIdentifier(uint64_t a1)
{
  return sub_100020F70(a1, qword_100115CA8, (uint64_t)&nominal type descriptor for BubbleIdentifier);
}

uint64_t sub_1000A1604(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unint64_t v3 = (uint64_t *)(a2 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess(a2 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles, v20, 0LL, 0LL);
  uint64_t v4 = *v3;
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain_n(v4, 2LL);
  if (v5)
  {
    while (1)
    {
      uint64_t v6 = v2 + OBJC_IVAR____TtC8FaceTime9Snowglobe_size;
      uint64_t v7 = 4LL;
      uint64_t v8 = 0LL;
      if ((v4 & 0xC000000000000001LL) == 0) {
        break;
      }
      while (1)
      {
        uint64_t v2 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v4);
        uint64_t v9 = v8 + 1;
        if (__OFADD__(v8, 1LL)) {
          break;
        }
LABEL_8:
        [*(id *)(v2 + OBJC_IVAR____TtC8FaceTime6Bubble_node) position];
        double v11 = v10;
        double v13 = *(double *)(v6 + 8) - v12;
        uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC8FaceTime6Bubble_focus);
        [v14 center];
        if (v16 != v11 || v15 != v13) {
          objc_msgSend(v14, "setCenter:", v11, v13);
        }
        swift_release(v2);
        if (v9 == v5) {
          return swift_bridgeObjectRelease_n(v4, 2LL);
        }
        uint64_t v8 = ++v7 - 4;
        if ((v4 & 0xC000000000000001LL) == 0) {
          goto LABEL_7;
        }
      }

id sub_1000A17A4()
{
  uint64_t v1 = OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene____lazy_storage___magneticField;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene____lazy_storage___magneticField);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene____lazy_storage___magneticField);
  }

  else
  {
    swift_unknownObjectUnownedInit(v10, v0);
    id v5 = objc_msgSend((id)objc_opt_self(SKFieldNode, v4), "radialGravityField");
    uint64_t Strong = (void *)swift_unknownObjectUnownedLoadStrong(v10);
    [Strong addChild:v5];

    swift_unknownObjectUnownedDestroy(v10);
    uint64_t v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0LL;
  }

  id v8 = v2;
  return v3;
}

id sub_1000A1904(double a1, double a2)
{
  *(void *)&v2[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene____lazy_storage___magneticField] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_verticalOffset] = 0LL;
  uint64_t v5 = OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceNode;
  id v6 = objc_allocWithZone(&OBJC_CLASS___SKNode);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = [v6 init];
  uint64_t v8 = OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceRadius;
  if (qword_100112458 != -1) {
    swift_once(&qword_100112458, sub_10009CB04);
  }
  *(void *)&v7[v8] = qword_10011A3B0;

  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for Snowglobe.Scene(v9, v10);
  id v11 = objc_msgSendSuper2(&v13, "initWithSize:", a1, a2);
  sub_1000A1A40();

  return v11;
}

void sub_1000A1A40()
{
  id v2 = objc_msgSend((id)objc_opt_self(UIColor, v1), "clearColor");
  [v0 setBackgroundColor:v2];

  [v0 setScaleMode:0];
  id v3 = *(void **)&v0[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceNode];
  id v5 =  objc_msgSend( (id)objc_opt_self(SKShapeNode, v4),  "shapeNodeWithCircleOfRadius:",  *(double *)&v0[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceRadius]);
  id v6 = [v5 path];

  if (v6)
  {
    id v8 = objc_msgSend((id)objc_opt_self(SKPhysicsBody, v7), "bodyWithEdgeLoopFromPath:", v6);

    [v3 setPhysicsBody:v8];
    [v0 addChild:v3];
    sub_1000A1B88();
  }

  else
  {
    __break(1u);
  }

id sub_1000A1B88()
{
  id v1 = [v0 physicsWorld];
  objc_msgSend(v1, "setGravity:", 0.0, 0.0);

  id v2 = sub_1000A17A4();
  [v0 size];
  double v4 = v3 * 0.5;
  [v0 size];
  uint64_t v6 = OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_verticalOffset;
  objc_msgSend( v2,  "setPosition:",  v4,  v5 * 0.5 + *(double *)&v0[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_verticalOffset]);

  id v7 = sub_1000A17A4();
  id v8 = objc_allocWithZone(&OBJC_CLASS___SKRegion);
  LODWORD(v9) = 1174705440;
  id v10 = [v8 initWithRadius:v9];
  [v7 setRegion:v10];

  id v11 = sub_1000A17A4();
  LODWORD(v12) = 1174705440;
  [v11 setMinimumRadius:v12];

  id v13 = sub_1000A17A4();
  LODWORD(v14) = 1154613247;
  [v13 setStrength:v14];

  double v15 = *(void **)&v0[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceNode];
  [v0 size];
  double v17 = v16 * 0.5;
  [v0 size];
  return objc_msgSend(v15, "setPosition:", v17, *(double *)&v0[v6] + v18 * 0.5);
}

void sub_1000A1D10(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceRadius;
  uint64_t v8 = *(void *)(v4 + OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceRadius);
  double v9 = sqrt(a3 / a2);
  double v10 = sqrt(a2 * a3);
  double v11 = a4 / (v10 + v10);
  double v12 = 0.0;
  double v13 = v9;
  if (v11 < 1.0)
  {
    double v12 = v9 * sqrt(1.0 - v11 * v11);
    double v13 = v9 * v11 / v12;
  }

  double v23 = v9;
  double v24 = a4 / (v10 + v10);
  double v25 = v12;
  uint64_t v26 = 0x3FF0000000000000LL;
  double v27 = v13;
  uint64_t v28 = 0LL;
  sub_100050458(1.0e-15);
  double v15 = v14;
  double v17 = (void *)objc_opt_self(&OBJC_CLASS___SKAction, v16);
  uint64_t v18 = swift_allocObject(&unk_1000FBAC0, 80LL, 7LL);
  *(double *)(v18 + 16) = v9;
  *(double *)(v18 + 24) = v11;
  *(double *)(v18 + 32) = v12;
  *(void *)(v18 + 40) = 0x3FF0000000000000LL;
  *(double *)(v18 + 48) = v13;
  *(double *)(v18 + 56) = v15;
  *(void *)(v18 + 64) = v8;
  *(double *)(v18 + 72) = a1;
  v21[4] = sub_1000A34D0;
  uint64_t v22 = v18;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 1107296256LL;
  v21[2] = sub_1000987B8;
  v21[3] = &unk_1000FBAD8;
  id v19 = _Block_copy(v21);
  swift_release(v22);
  id v20 = [v17 customActionWithDuration:v19 actionBlock:v15];
  _Block_release(v19);
  *(double *)(v5 + v7) = a1;
  [*(id *)(v5 + OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceNode) runAction:v20];
}

void sub_1000A1EB0(void *a1, Swift::Double a2, double a3, double a4)
{
  Swift::Double_optional v13 = SpringModel.value(for:)(a2);
  double v8 = *(double *)&v13.is_nil;
  if ((v7 & 1) != 0) {
    double v8 = 1.0;
  }
  id v9 =  objc_msgSend( (id)objc_opt_self(SKShapeNode, v7),  "shapeNodeWithCircleOfRadius:",  (a4 - a3) * v8 + a3);
  id v10 = [v9 path];

  if (v10)
  {
    id v12 = objc_msgSend((id)objc_opt_self(SKPhysicsBody, v11), "bodyWithEdgeLoopFromPath:", v10);

    [a1 setPhysicsBody:v12];
  }

  else
  {
    __break(1u);
  }

id sub_1000A1FCC(uint64_t a1)
{
  return sub_100095514(a1, (uint64_t (*)(void))type metadata accessor for Snowglobe.Scene);
}

uint64_t type metadata accessor for Snowglobe.Scene(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtCC8FaceTime9Snowglobe5Scene, a2);
}

id sub_1000A210C()
{
  return sub_100095514(0LL, (uint64_t (*)(void))type metadata accessor for DebugNode);
}

uint64_t type metadata accessor for DebugNode(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTimeP33_7A2EB0980A5FAC9E4C480D70049AA0749DebugNode, a2);
}

uint64_t getEnumTagSinglePayload for Snowglobe.Mode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

uint64_t storeEnumTagSinglePayload for Snowglobe.Mode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1000A2218 + 4 * byte_1000C6DBD[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1000A224C + 4 * byte_1000C6DB8[v4]))();
}

uint64_t sub_1000A224C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000A2254(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000A225CLL);
  }
  return result;
}

uint64_t sub_1000A2268(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000A2270LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1000A2274(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000A227C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Snowglobe.Mode()
{
  return &type metadata for Snowglobe.Mode;
}

uint64_t *sub_1000A2298(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v3 = *a2;
    int v3 = (uint64_t *)(v11 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v11);
  }

  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    BOOL v7 = (char *)a1 + v6;
    int v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for IndexPath(0LL);
    id v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL);
    swift_bridgeObjectRetain(v5);
    v10(v7, v8, v9);
  }

  return v3;
}

uint64_t sub_1000A2334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for IndexPath(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

void *sub_1000A237C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  BOOL v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for IndexPath(0LL);
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16LL);
  swift_bridgeObjectRetain(v4);
  v9(v6, v7, v8);
  return a1;
}

void *sub_1000A23EC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  id v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for IndexPath(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 24LL))(v9, v10, v11);
  return a1;
}

_OWORD *sub_1000A2468(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
  return a1;
}

void *sub_1000A24C4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  id v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for IndexPath(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000A2530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000A253C);
}

uint64_t sub_1000A253C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for IndexPath(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 20),  a2,  v8);
  }

uint64_t sub_1000A25B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000A25C4);
}

uint64_t sub_1000A25C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for IndexPath(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 20),  a2,  a2,  v7);
  }

  return result;
}

uint64_t sub_1000A2638(uint64_t a1)
{
  v4[0] = &unk_1000C6EC8;
  uint64_t result = type metadata accessor for IndexPath(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_1000A26AC()
{
  return sub_10001949C(&qword_100115CE0, type metadata accessor for BubbleIdentifier, (uint64_t)&unk_1000C6EE0);
}

uint64_t sub_1000A26D8()
{
  return sub_100022750(&qword_100115CE8, &qword_100115CF0, (uint64_t)&protocol conformance descriptor for [A]);
}

unint64_t sub_1000A2708()
{
  unint64_t result = qword_100115CF8;
  if (!qword_100115CF8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000C6FF8, &type metadata for Snowglobe.Mode);
    atomic_store(result, (unint64_t *)&qword_100115CF8);
  }

  return result;
}

uint64_t sub_1000A274C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    uint64_t v7 = *v4;
    if (!((unint64_t)*v4 >> 62))
    {
      uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (v9 >= a2) {
        goto LABEL_4;
      }
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
  }

  if (v7 < 0) {
    uint64_t v24 = v7;
  }
  else {
    uint64_t v24 = v7 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v7);
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v24);
  swift_bridgeObjectRelease(v7);
  if (v9 < v5) {
    goto LABEL_34;
  }
LABEL_4:
  uint64_t v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }

  uint64_t v8 = 1 - v9;
  if (__OFSUB__(1LL, v9))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  uint64_t v7 = *v4;
  if (!((unint64_t)*v4 >> 62))
  {
    uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v11 = v10 + v8;
    if (!__OFADD__(v10, v8)) {
      goto LABEL_8;
    }
LABEL_42:
    __break(1u);
LABEL_43:
    if (v7 < 0) {
      uint64_t v26 = v7;
    }
    else {
      uint64_t v26 = v7 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v7);
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter(v26);
    swift_bridgeObjectRelease(v7);
    goto LABEL_15;
  }

LABEL_37:
  if (v7 < 0) {
    uint64_t v25 = v7;
  }
  else {
    uint64_t v25 = v7 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v7);
  uint64_t v10 = _CocoaArrayWrapper.endIndex.getter(v25);
  swift_bridgeObjectRelease(v7);
  uint64_t v11 = v10 + v8;
  if (__OFADD__(v10, v8)) {
    goto LABEL_42;
  }
LABEL_8:
  uint64_t v7 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v4);
  *unint64_t v4 = v7;
  uint64_t v10 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000LL) == 0 && (v7 & 0x4000000000000000LL) == 0)
  {
    uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8LL;
    if (v11 <= *(void *)((v7 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v10 = 1LL;
  }

  uint64_t v14 = *(void *)((v7 & 0xFFFFFFFFFFFFF8LL) + 0x10);
LABEL_15:
  if (v14 <= v11) {
    uint64_t v14 = v11;
  }
  swift_bridgeObjectRetain(v7);
  uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v10, v14, 1LL, v7);
  swift_bridgeObjectRelease(*v4);
  *unint64_t v4 = v7;
  uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8LL;
LABEL_18:
  double v15 = (void *)(v13 + 32 + 8 * v6);
  uint64_t v16 = type metadata accessor for Bubble(0LL);
  double v17 = (char *)swift_arrayDestroy(v15, v9, v16);
  if (!v8)
  {
LABEL_28:
    void *v15 = v3;
    return specialized Array._endMutation()(v17);
  }

  if (!((unint64_t)v7 >> 62))
  {
    uint64_t v18 = *(void *)(v13 + 16);
    uint64_t v19 = v18 - v5;
    if (!__OFSUB__(v18, v5)) {
      goto LABEL_21;
    }
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }

  if (v7 < 0) {
    uint64_t v27 = v7;
  }
  else {
    uint64_t v27 = v13;
  }
  swift_bridgeObjectRetain(v7);
  uint64_t v28 = _CocoaArrayWrapper.endIndex.getter(v27);
  swift_bridgeObjectRelease(v7);
  uint64_t v19 = v28 - v5;
  if (__OFSUB__(v28, v5)) {
    goto LABEL_52;
  }
LABEL_21:
  if ((v19 & 0x8000000000000000LL) == 0)
  {
    double v17 = (char *)(v15 + 1);
    id v20 = (char *)(v13 + 32 + 8 * v5);
    if (v15 + 1 != (void *)v20 || v17 >= &v20[8 * v19]) {
      double v17 = (char *)memmove(v17, v20, 8 * v19);
    }
    if (!((unint64_t)v7 >> 62))
    {
      uint64_t v21 = *(void *)(v13 + 16);
      uint64_t v22 = v21 + v8;
      if (!__OFADD__(v21, v8))
      {
LABEL_27:
        *(void *)(v13 + 16) = v22;
        goto LABEL_28;
      }

      goto LABEL_58;
    }

LABEL_53:
    if (v7 < 0) {
      uint64_t v29 = v7;
    }
    else {
      uint64_t v29 = v13;
    }
    swift_bridgeObjectRetain(v7);
    uint64_t v30 = _CocoaArrayWrapper.endIndex.getter(v29);
    double v17 = (char *)swift_bridgeObjectRelease(v7);
    uint64_t v22 = v30 + v8;
    if (!__OFADD__(v30, v8)) {
      goto LABEL_27;
    }
LABEL_58:
    __break(1u);
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_1000A2A24(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5)
{
  uint64_t v10 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_contentView;
  id v11 = objc_allocWithZone(&OBJC_CLASS___UIView);
  id v12 = v5;
  *(void *)&v5[v10] = [v11 init];
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___facetimeButton] = 0LL;
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___facetimeAudioButton] = 0LL;
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___vibrancyEffectView] = 0LL;
  uint64_t v13 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_noUserLabel;
  *(void *)&v12[v13] = sub_100098C50();
  uint64_t v14 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_userNamesLabel;
  id v15 = [objc_allocWithZone(UILabel) init];
  id v17 =  objc_msgSend( (id)objc_opt_self(UIFont, v16),  "systemFontOfSize:weight:",  23.0,  UIFontWeightMedium);
  [v15 setFont:v17];

  [v15 setTextAlignment:1];
  [v15 setNumberOfLines:2];
  *(void *)&v12[v14] = v15;
  uint64_t v18 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_leadingFocusGuide;
  *(void *)&v12[v18] = [objc_allocWithZone(UIFocusGuide) init];
  uint64_t v19 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_globeFocusGuide;
  *(void *)&v12[v19] = [objc_allocWithZone(UIFocusGuide) init];
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___verticalButtonConstraint] = 0LL;
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView_verticalCenteringConstraint] = 0LL;
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___horizontalCenteringConstraint] = 0LL;
  swift_unknownObjectWeakInit(&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView_verticalCenteringView], 0LL);
  id v20 = &v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView_delegate];
  *((void *)v20 + 1) = 0LL;
  swift_unknownObjectWeakInit(v20, 0LL);
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___snowglobe] = 0LL;
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView_contactCollectionView] = a3;
  v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView_isAddingParticipants] = a4;
  uint64_t v21 = &v12[OBJC_IVAR____TtC8FaceTime13SnowglobeView_callType];
  uint64_t v22 = type metadata accessor for CallType(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v21, a5, v22);
  id v24 = a3;

  v30.receiver = v12;
  v30.super_class = (Class)type metadata accessor for SnowglobeView(0LL);
  uint64_t v25 = (char *)objc_msgSendSuper2(&v30, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v26 = *(void **)&v25[OBJC_IVAR____TtC8FaceTime13SnowglobeView_noUserLabel];
  uint64_t v27 = v25;
  NSString v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  [v26 setText:v28];

  sub_100099224();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(a5, v22);
  return v27;
}

uint64_t sub_1000A2CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v6)
  {
    uint64_t v7 = 4LL;
    while (1)
    {
      uint64_t v8 = v7 - 4;
      if ((a1 & 0xC000000000000001LL) == 0) {
        break;
      }
      uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, a1);
      BOOL v10 = __OFADD__(v8, 1LL);
      uint64_t v11 = v7 - 3;
      if (v10) {
        goto LABEL_16;
      }
LABEL_9:
      uint64_t v15 = v9;
      char v12 = sub_10009CEE8(&v15, a2);
      if (v3)
      {
        swift_bridgeObjectRelease(a1);
        swift_release(v9);
        return v9;
      }

      if ((v12 & 1) != 0)
      {
        swift_bridgeObjectRelease(a1);
        return v9;
      }

      swift_release(v9);
      ++v7;
      if (v11 == v6) {
        goto LABEL_12;
      }
    }

    uint64_t v9 = *(void *)(a1 + 8 * v7);
    swift_retain(v9);
    BOOL v10 = __OFADD__(v8, 1LL);
    uint64_t v11 = v7 - 3;
    if (!v10) {
      goto LABEL_9;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    if (a1 < 0) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v14);
  }

void sub_1000A2E24(void *a1, uint64_t *a2, double a3)
{
  unint64_t v4 = a1;
  uint64_t v6 = (void *)((char *)a1 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess((char *)a1 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles, v20, 0LL, 0LL);
  uint64_t v7 = *v6;
  if (!((unint64_t)*v6 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v9 = v8 - 9;
    if (!__OFSUB__(v8, 9LL)) {
      goto LABEL_3;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    swift_once(&qword_100112420, sub_10009C924);
    goto LABEL_5;
  }

  if (v7 < 0) {
    uint64_t v17 = *v6;
  }
  else {
    uint64_t v17 = v7 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*v6);
  uint64_t v18 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v7);
  uint64_t v9 = v18 - 9;
  if (__OFSUB__(v18, 9LL)) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v7 = *v6;
  BOOL v10 = v4;
  uint64_t v11 = swift_bridgeObjectRetain(v7);
  uint64_t v6 = 0LL;
  unint64_t v4 = (void *)sub_1000A2CF0(v11, (uint64_t)v10);
  swift_bridgeObjectRelease(v7);

  if (!v4) {
    return;
  }
  if (qword_100112420 != -1) {
    goto LABEL_17;
  }
LABEL_5:
  uint64_t v12 = *(void *)(qword_10011A378 + 16);
  if (!v12)
  {
    __break(1u);
    goto LABEL_19;
  }

  a2 += 2;
  sub_10004685C(v9 + 1, *(double *)(qword_10011A378 + 8 * v12 + 24), 0.8, a3);
  uint64_t v9 = v4[3];
  uint64_t v6 = (uint64_t *)v4[4];
  swift_beginAccess(a2, v19, 33LL, 0LL);
  uint64_t v7 = *a2;
  swift_bridgeObjectRetain(v6);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
  *a2 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_19:
    uint64_t v7 = (uint64_t)sub_100019AE4(0LL, *(void *)(v7 + 16) + 1LL, 1, (void *)v7);
    *a2 = v7;
  }

  unint64_t v15 = *(void *)(v7 + 16);
  unint64_t v14 = *(void *)(v7 + 24);
  if (v15 >= v14 >> 1)
  {
    uint64_t v7 = (uint64_t)sub_100019AE4((void *)(v14 > 1), v15 + 1, 1, (void *)v7);
    *a2 = v7;
  }

  *(void *)(v7 + 16) = v15 + 1;
  uint64_t v16 = v7 + 16 * v15;
  *(void *)(v16 + 32) = v9;
  *(void *)(v16 + 40) = v6;
  swift_endAccess(v19);
  swift_release(v4);
}

void sub_1000A3018()
{
  uint64_t v1 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_contentView;
  *(void *)&v0[v1] = [objc_allocWithZone(UIView) init];
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___facetimeButton] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___facetimeAudioButton] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___vibrancyEffectView] = 0LL;
  uint64_t v2 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_noUserLabel;
  *(void *)&v0[v2] = sub_100098C50();
  uint64_t v3 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_userNamesLabel;
  id v4 = [objc_allocWithZone(UILabel) init];
  id v6 = objc_msgSend((id)objc_opt_self(UIFont, v5), "systemFontOfSize:weight:", 23.0, UIFontWeightMedium);
  [v4 setFont:v6];

  [v4 setTextAlignment:1];
  [v4 setNumberOfLines:2];
  *(void *)&v0[v3] = v4;
  uint64_t v7 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_leadingFocusGuide;
  *(void *)&v0[v7] = [objc_allocWithZone(UIFocusGuide) init];
  uint64_t v8 = OBJC_IVAR____TtC8FaceTime13SnowglobeView_globeFocusGuide;
  *(void *)&v0[v8] = [objc_allocWithZone(UIFocusGuide) init];
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___verticalButtonConstraint] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView_verticalCenteringConstraint] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___horizontalCenteringConstraint] = 0LL;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView_verticalCenteringView], 0LL);
  uint64_t v9 = &v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView_delegate];
  *((void *)v9 + 1) = 0LL;
  swift_unknownObjectWeakInit(v9, 0LL);
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___snowglobe] = 0LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000001CLL,  0x80000001000DA760LL,  "FaceTime/SnowglobeView.swift",  28LL,  2LL,  141LL,  0);
  __break(1u);
}

unint64_t sub_1000A3208(unint64_t result)
{
  if (result >= 4) {
    return 4LL;
  }
  return result;
}

void sub_1000A3218()
{
  *(void *)&v0[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene____lazy_storage___magneticField] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_verticalOffset] = 0LL;
  uint64_t v1 = OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceNode;
  *(void *)&v0[v1] = [objc_allocWithZone(SKNode) init];
  uint64_t v2 = OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceRadius;
  if (qword_100112458 != -1) {
    swift_once(&qword_100112458, sub_10009CB04);
  }
  *(void *)&v0[v2] = qword_10011A3B0;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/SnowglobeView.swift",  28LL,  2LL,  994LL,  0);
  __break(1u);
}

void sub_1000A32EC(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC8FaceTime9Snowglobe_bubbles);
  swift_beginAccess(v3, v15, 0LL, 0LL);
  uint64_t v4 = *v3;
  if (!((unint64_t)v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v4);
    if (v5) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease(v4);
    return;
  }

uint64_t sub_1000A34C0()
{
  return swift_deallocObject(v0, 80LL, 7LL);
}

void sub_1000A34D0(void *a1, Swift::Double a2)
{
}

uint64_t sub_1000A34DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000A34EC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

id sub_1000A34F4()
{
  return sub_100046320(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_1000A3500(uint64_t *a1)
{
  return sub_10009FAF8(a1, v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_1000A3520()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000A3544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04(&qword_100115D08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000A358C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

id sub_1000A35B0()
{
  return sub_1000462DC(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

id sub_1000A35BC()
{
  return sub_10004621C(v0);
}

id sub_1000A35C4()
{
  return sub_10004652C(v0);
}

id sub_1000A35CC()
{
  return sub_100046270(v0);
}

uint64_t sub_1000A35D4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000A35F8(uint64_t a1)
{
  return sub_1000A1604(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000A3600()
{
  return swift_deallocObject(v0, 57LL, 7LL);
}

void sub_1000A362C()
{
}

id sub_1000A3644()
{
  return [*(id *)(v0 + 16) layoutIfNeeded];
}

uint64_t sub_1000A3654()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000A3664()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_1000A3688(uint64_t a1, uint64_t a2)
{
}

void sub_1000A3698(uint64_t a1, uint64_t a2)
{
}

id sub_1000A36A0()
{
  return [*(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC8FaceTime13SnowglobeView_userNamesLabel) setAlpha:1.0];
}

uint64_t sub_1000A36C0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

id sub_1000A36E4()
{
  return [*(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC8FaceTime13SnowglobeView_noUserLabel) setAlpha:*(double *)(v0 + 24)];
}

uint64_t sub_1000A3704(uint64_t a1)
{
  return a1;
}

uint64_t *sub_1000A3790(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_100018A04(&qword_100115D78);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80LL);
  uint64_t v6 = *a2;
  *a1 = *a2;
  if ((v5 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v6 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v6);
  }

  else
  {
    uint64_t v7 = a2[1];
    a1[1] = v7;
    uint64_t v8 = *(int *)(v4 + 32);
    unsigned __int8 v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for FaceTimeURL(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
    double v13 = *(unsigned int (**)(char *, uint64_t, uint64_t, __n128))(v12 + 48);
    swift_retain(v6);
    __n128 v14 = swift_retain(v7);
    if (v13(v10, 1LL, v11, v14))
    {
      uint64_t v15 = sub_100018A04(&qword_100113258);
      memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0LL, 1LL, v11);
    }
  }

  return a1;
}

uint64_t sub_1000A38A4(void *a1)
{
  uint64_t v2 = (char *)a1 + *(int *)(sub_100018A04(&qword_100115D78) + 32);
  uint64_t v3 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1LL, v3);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  return result;
}

uint64_t *sub_1000A3930(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  swift_retain(v4);
  swift_retain(v5);
  uint64_t v6 = *(int *)(sub_100018A04(&qword_100115D78) + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1LL, v9))
  {
    uint64_t v11 = sub_100018A04(&qword_100113258);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0LL, 1LL, v9);
  }

  return a1;
}

uint64_t *sub_1000A3A08(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  uint64_t v8 = *(int *)(sub_100018A04(&qword_100115D78) + 32);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  double v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1LL, v11);
  int v15 = v13(v10, 1LL, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v9, v10, v11);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }

  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_100018A04(&qword_100113258);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0LL, 1LL, v11);
  return a1;
}

void *sub_1000A3B48(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(sub_100018A04(&qword_100115D78) + 32);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8))
  {
    uint64_t v10 = sub_100018A04(&qword_100113258);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0LL, 1LL, v8);
  }

  return a1;
}

uint64_t *sub_1000A3C14(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  uint64_t v5 = a1[1];
  a1[1] = a2[1];
  swift_release(v5);
  uint64_t v6 = *(int *)(sub_100018A04(&qword_100115D78) + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1LL, v9);
  int v13 = v11(v8, 1LL, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }

  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_100018A04(&qword_100113258);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0LL, 1LL, v9);
  return a1;
}

uint64_t sub_1000A3D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000A3D50);
}

uint64_t sub_1000A3D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04(&qword_100115D78);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t sub_1000A3D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000A3D9C);
}

uint64_t sub_1000A3D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04(&qword_100115D78);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TVFTRootView(uint64_t a1)
{
  uint64_t result = qword_100115DD8;
  if (!qword_100115DD8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TVFTRootView);
  }
  return result;
}

void sub_1000A3E1C(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
  }

void sub_1000A3E84(uint64_t a1)
{
  if (!qword_100115DE8)
  {
    uint64_t v2 = sub_10001C334(&qword_100113258);
    unint64_t v3 = type metadata accessor for Binding(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100115DE8);
    }
  }

uint64_t sub_1000A3EDC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10001C378(v0, qword_100115D60);
  sub_10001C270(v0, (uint64_t)qword_100115D60);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x80000001000D8590LL,  0x77656956746F6F52LL,  0xE800000000000000LL);
}

id sub_1000A3F50()
{
  if (qword_100112380 != -1) {
    swift_once(&qword_100112380, sub_100080AF0);
  }
  uint64_t v0 = qword_100112290;
  id v1 = (id)qword_10011A2F0;
  if (v0 != -1) {
    swift_once(&qword_100112290, sub_10004B0AC);
  }
  uint64_t v2 = qword_100112398;
  id v4 = (id)qword_10011A2B0;
  if (v2 != -1) {
    swift_once(&qword_100112398, sub_1000874A0);
  }
  uint64_t v5 = (void *)qword_10011A300;
  uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___TUCallCenter, v3);
  id v7 = v5;
  id v8 = [v6 sharedInstance];
  id v9 = [v8 neighborhoodActivityConduit];

  uint64_t v21 = type metadata accessor for ATVCallManager(0LL);
  uint64_t v22 = &off_1000FAC48;
  v20[0] = v1;
  uint64_t v10 = (char *)objc_allocWithZone((Class)type metadata accessor for RootViewController(0LL));
  uint64_t v11 = sub_100021734((uint64_t)v20, v21);
  __chkstk_darwin(v11);
  int v13 = (void *)((char *)&v20[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = *v13;
  id v16 = v1;
  id v17 = sub_1000A549C(v15, v4, v7, v9, v10);

  sub_10001BFEC(v20);
  return v17;
}

uint64_t sub_1000A413C(uint64_t a1, uint64_t a2)
{
  uint64_t v163 = a2;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v172 = *(void *)(v3 - 8);
  uint64_t v173 = v3;
  __chkstk_darwin(v3);
  v171 = (char *)&v146 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v169 = *(void *)(v5 - 8);
  uint64_t v170 = v5;
  __chkstk_darwin(v5);
  v168 = (char *)&v146 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TVFTRootView(0LL);
  uint64_t v164 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v165 = v8;
  uint64_t v166 = (uint64_t)&v146 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v154 = type metadata accessor for IncomingHandoffContext(0LL);
  uint64_t v150 = *(void *)(v154 - 8);
  uint64_t v9 = __chkstk_darwin(v154);
  v147 = (char *)&v146 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v151 = (char *)&v146 - v11;
  uint64_t v159 = type metadata accessor for JoinFailureContext(0LL);
  uint64_t v153 = *(void *)(v159 - 8);
  uint64_t v12 = __chkstk_darwin(v159);
  v152 = (char *)&v146 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  v155 = (char *)&v146 - v14;
  uint64_t v161 = type metadata accessor for RootViewController.Event(0LL);
  __chkstk_darwin(v161);
  v162 = (uint8_t *)&v146 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v158 = type metadata accessor for UUID(0LL);
  uint64_t v157 = *(void *)(v158 - 8);
  __chkstk_darwin(v158);
  v156 = (char *)&v146 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v160 = (void *)type metadata accessor for JoinContinuityConversationRequestContext(0LL);
  uint64_t v17 = *(v160 - 1);
  uint64_t v18 = __chkstk_darwin(v160);
  id v20 = (char *)&v146 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v146 - v21;
  uint64_t v23 = sub_100018A04(&qword_100113258);
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v146 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = __chkstk_darwin(v26);
  objc_super v30 = (char *)&v146 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = __chkstk_darwin(v28);
  double v33 = (char *)&v146 - v32;
  uint64_t v34 = __chkstk_darwin(v31);
  uint64_t v36 = (char *)&v146 - v35;
  __chkstk_darwin(v34);
  uint64_t v38 = (char *)&v146 - v37;
  uint64_t v39 = a1;
  uint64_t v41 = v40;
  sub_10002A9C0(v39, (uint64_t)v25);
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v38, v25, v41);
  BOOL v43 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v148 = v38;
  v43(v36, v38, v41);
  int v44 = (*(uint64_t (**)(char *, uint64_t))(v27 + 88))(v36, v41);
  uint64_t v149 = v41;
  if (v44 == enum case for FaceTimeURL.startedJoiningActiveConversation(_:))
  {
    (*(void (**)(char *, uint64_t))(v27 + 96))(v36, v41);
    uint64_t v45 = v160;
    (*(void (**)(char *, char *, void *))(v17 + 32))(v22, v36, v160);
    uint64_t v46 = v27;
    if (qword_100112460 != -1) {
      swift_once(&qword_100112460, sub_1000A3EDC);
    }
    uint64_t v47 = type metadata accessor for Logger(0LL);
    sub_10001C270(v47, (uint64_t)qword_100115D60);
    uint64_t v48 = (*(uint64_t (**)(char *, char *, void *))(v17 + 16))(v20, v22, v45);
    uint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
    os_log_type_t v50 = static os_log_type_t.default.getter();
    BOOL v51 = os_log_type_enabled(v49, v50);
    uint64_t v146 = v46;
    if (v51)
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v159 = swift_slowAlloc(32LL, -1LL);
      aBlock[0] = v159;
      *(_DWORD *)uint64_t v52 = 136315138;
      uint64_t v53 = sub_10001949C( &qword_100115E20,  (uint64_t (*)(uint64_t))&type metadata accessor for JoinContinuityConversationRequestContext,  (uint64_t)&protocol conformance descriptor for JoinContinuityConversationRequestContext);
      uint64_t v54 = dispatch thunk of CustomStringConvertible.description.getter(v45, v53);
      unint64_t v56 = v55;
      uint64_t v174 = sub_1000850E4(v54, v55, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, aBlock, v52 + 4, v52 + 12);
      __n128 v57 = swift_bridgeObjectRelease(v56);
      uint64_t v58 = *(void (**)(char *, void *, __n128))(v17 + 8);
      v58(v20, v45, v57);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "OpenURL context: %s", v52, 0xCu);
      uint64_t v59 = v159;
      swift_arrayDestroy(v159, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v59, -1LL, -1LL);
      swift_slowDealloc(v52, -1LL, -1LL);

      uint64_t v60 = v45;
      uint64_t v61 = v148;
    }

    else
    {
      uint64_t v58 = *(void (**)(char *, void *, __n128))(v17 + 8);
      ((void (*)(char *, void *))v58)(v20, v45);

      uint64_t v61 = v148;
      uint64_t v60 = v45;
    }

    uint64_t v85 = v156;
    uint64_t v86 = JoinContinuityConversationRequestContext.conversationUUID.getter();
    char v87 = JoinContinuityConversationRequestContext.isAudioEnabled.getter(v86);
    char v88 = JoinContinuityConversationRequestContext.isVideoEnabled.getter();
    char v89 = JoinContinuityConversationRequestContext.wantsStagingArea.getter();
    id v90 = objc_allocWithZone(&OBJC_CLASS___TUJoinContinuityConversationRequest);
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v92 = [v90 initWithUUID:isa isAudioEnabled:v87 & 1 isVideoEnabled:v88 & 1 wantsStagingArea:v89 & 1];

    (*(void (**)(char *, uint64_t))(v157 + 8))(v85, v158);
    uint64_t v93 = v161;
    uint64_t v94 = v162;
    *(void *)v162 = v92;
    swift_storeEnumTagMultiPayload(v94, v93, 3LL);
    id v95 = v92;
    sub_100056F4C((uint64_t)v94);
    sub_1000A5460((uint64_t)v94);

    ((void (*)(char *, void *))v58)(v22, v60);
    uint64_t v62 = v146;
  }

  else
  {
    if (v44 == enum case for FaceTimeURL.failedToJoinActiveConversation(_:))
    {
      uint64_t v62 = v27;
      (*(void (**)(char *, uint64_t))(v27 + 96))(v36, v41);
      uint64_t v63 = v153;
      uint64_t v64 = v155;
      uint64_t v65 = v36;
      uint64_t v66 = v159;
      (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v155, v65, v159);
      if (qword_100112460 != -1) {
        swift_once(&qword_100112460, sub_1000A3EDC);
      }
      uint64_t v67 = type metadata accessor for Logger(0LL);
      sub_10001C270(v67, (uint64_t)qword_100115D60);
      uint64_t v68 = *(uint64_t (**)(char *, char *, uint64_t))(v63 + 16);
      uint64_t v69 = v152;
      uint64_t v70 = v68(v152, v64, v66);
      uint64_t v71 = (os_log_s *)Logger.logObject.getter(v70);
      os_log_type_t v72 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v74 = swift_slowAlloc(32LL, -1LL);
        uint64_t v146 = v62;
        uint64_t v75 = v69;
        uint64_t v76 = v74;
        aBlock[0] = v74;
        *(_DWORD *)uint64_t v73 = 136315138;
        uint64_t v77 = sub_10001949C( (unint64_t *)&unk_100114960,  (uint64_t (*)(uint64_t))&type metadata accessor for JoinFailureContext,  (uint64_t)&protocol conformance descriptor for JoinFailureContext);
        uint64_t v78 = dispatch thunk of CustomStringConvertible.description.getter(v159, v77);
        unint64_t v80 = v79;
        uint64_t v174 = sub_1000850E4(v78, v79, aBlock);
        uint64_t v66 = v159;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, aBlock, v73 + 4, v73 + 12);
        __n128 v81 = swift_bridgeObjectRelease(v80);
        v82 = *(void (**)(char *, uint64_t, __n128))(v63 + 8);
        uint64_t v83 = v75;
        uint64_t v62 = v146;
        v82(v83, v66, v81);
        _os_log_impl((void *)&_mh_execute_header, v71, v72, "OpenURL context: %s", v73, 0xCu);
        swift_arrayDestroy(v76, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v76, -1LL, -1LL);
        id v84 = v73;
        uint64_t v64 = v155;
        swift_slowDealloc(v84, -1LL, -1LL);
      }

      else
      {
        v82 = *(void (**)(char *, uint64_t, __n128))(v63 + 8);
        ((void (*)(char *, uint64_t))v82)(v69, v66);
      }

      uint64_t v116 = v162;
      v68((char *)v162, v64, v66);
      swift_storeEnumTagMultiPayload(v116, v161, 4LL);
      sub_100056F4C((uint64_t)v116);
      sub_1000A5460((uint64_t)v116);
      ((void (*)(char *, uint64_t))v82)(v64, v66);
    }

    else
    {
      if (v44 == enum case for FaceTimeURL.incomingHandoff(_:))
      {
        uint64_t v62 = v27;
        (*(void (**)(char *, uint64_t))(v27 + 96))(v36, v41);
        uint64_t v97 = v150;
        uint64_t v98 = v151;
        unint64_t v99 = v36;
        uint64_t v100 = v154;
        (*(void (**)(char *, char *, uint64_t))(v150 + 32))(v151, v99, v154);
        if (qword_100112460 != -1) {
          swift_once(&qword_100112460, sub_1000A3EDC);
        }
        uint64_t v101 = type metadata accessor for Logger(0LL);
        sub_10001C270(v101, (uint64_t)qword_100115D60);
        uint64_t v102 = v147;
        v160 = *(void **)(v97 + 16);
        uint64_t v103 = ((uint64_t (*)(char *, char *, uint64_t))v160)(v147, v98, v100);
        uint64_t v104 = (os_log_s *)Logger.logObject.getter(v103);
        os_log_type_t v105 = static os_log_type_t.default.getter();
        BOOL v106 = os_log_type_enabled(v104, v105);
        uint64_t v61 = v148;
        if (v106)
        {
          uint64_t v107 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v108 = swift_slowAlloc(32LL, -1LL);
          aBlock[0] = v108;
          *(_DWORD *)uint64_t v107 = 136315138;
          uint64_t v109 = sub_10001949C( &qword_100114898,  (uint64_t (*)(uint64_t))&type metadata accessor for IncomingHandoffContext,  (uint64_t)&protocol conformance descriptor for IncomingHandoffContext);
          uint64_t v110 = dispatch thunk of CustomStringConvertible.description.getter(v154, v109);
          unint64_t v112 = v111;
          uint64_t v174 = sub_1000850E4(v110, v111, aBlock);
          uint64_t v100 = v154;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, aBlock, v107 + 4, v107 + 12);
          __n128 v113 = swift_bridgeObjectRelease(v112);
          uint64_t v114 = *(void (**)(char *, uint64_t, __n128))(v150 + 8);
          v114(v102, v100, v113);
          _os_log_impl((void *)&_mh_execute_header, v104, v105, "OpenURL context: %s", v107, 0xCu);
          swift_arrayDestroy(v108, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v108, -1LL, -1LL);
          uint64_t v115 = v107;
          uint64_t v98 = v151;
          swift_slowDealloc(v115, -1LL, -1LL);
        }

        else
        {
          uint64_t v114 = *(void (**)(char *, uint64_t, __n128))(v97 + 8);
          ((void (*)(char *, uint64_t))v114)(v102, v100);
        }

        uint64_t v131 = v162;
        ((void (*)(uint8_t *, char *, uint64_t))v160)(v162, v98, v100);
        swift_storeEnumTagMultiPayload(v131, v161, 2LL);
        sub_100056F4C((uint64_t)v131);
        sub_1000A5460((uint64_t)v131);
        ((void (*)(char *, uint64_t))v114)(v98, v100);
        goto LABEL_31;
      }

      if (qword_100112460 != -1) {
        swift_once(&qword_100112460, sub_1000A3EDC);
      }
      uint64_t v117 = type metadata accessor for Logger(0LL);
      sub_10001C270(v117, (uint64_t)qword_100115D60);
      uint64_t v118 = v149;
      uint64_t v119 = ((uint64_t (*)(char *, char *, uint64_t))v43)(v33, v148, v149);
      uint64_t v120 = (os_log_s *)Logger.logObject.getter(v119);
      os_log_type_t v121 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v120, v121))
      {
        uint64_t v122 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v163 = swift_slowAlloc(32LL, -1LL);
        aBlock[0] = v163;
        v162 = v122;
        *(_DWORD *)uint64_t v122 = 136315138;
        uint64_t v161 = (uint64_t)(v122 + 4);
        v43(v30, v33, v118);
        uint64_t v123 = String.init<A>(describing:)(v30, v118);
        unint64_t v125 = v124;
        uint64_t v174 = sub_1000850E4(v123, v124, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, aBlock, v161, v122 + 12);
        __n128 v126 = swift_bridgeObjectRelease(v125);
        uint64_t v62 = v27;
        uint64_t v127 = *(void (**)(char *, uint64_t, __n128))(v27 + 8);
        v127(v33, v118, v126);
        os_log_type_t v128 = v121;
        v129 = v162;
        _os_log_impl((void *)&_mh_execute_header, v120, v128, "Asked to open unrecognized url context: %s", v162, 0xCu);
        uint64_t v130 = v163;
        swift_arrayDestroy(v163, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v130, -1LL, -1LL);
        swift_slowDealloc(v129, -1LL, -1LL);
      }

      else
      {
        uint64_t v62 = v27;
        uint64_t v127 = *(void (**)(char *, uint64_t, __n128))(v27 + 8);
        ((void (*)(char *, uint64_t))v127)(v33, v118);
      }

      ((void (*)(char *, uint64_t))v127)(v36, v118);
    }

    uint64_t v61 = v148;
  }

uint64_t sub_1000A4FF8()
{
  uint64_t v0 = sub_100018A04(&qword_100113258);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v9 - v4;
  uint64_t v6 = type metadata accessor for FaceTimeURL(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  sub_10002A9C0((uint64_t)v5, (uint64_t)v3);
  uint64_t v7 = sub_100018A04(&qword_100115D78);
  Binding.wrappedValue.setter(v3, v7);
  return sub_10002AA08((uint64_t)v5);
}

id sub_1000A50C4()
{
  return sub_1000A3F50();
}

uint64_t sub_1000A50D8(uint64_t a1)
{
  uint64_t v2 = sub_100018A04(&qword_100113258);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_100018A04(&qword_100115D78);
  Binding.wrappedValue.getter(v5);
  sub_1000A413C((uint64_t)v4, a1);
  return sub_10002AA08((uint64_t)v4);
}

uint64_t sub_1000A516C(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

uint64_t sub_1000A51A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001949C(&qword_100115E28, type metadata accessor for TVFTRootView, (uint64_t)&unk_1000C7080);
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000A520C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001949C(&qword_100115E28, type metadata accessor for TVFTRootView, (uint64_t)&unk_1000C7080);
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000A5274(uint64_t a1)
{
  uint64_t v2 = sub_10001949C(&qword_100115E28, type metadata accessor for TVFTRootView, (uint64_t)&unk_1000C7080);
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

uint64_t sub_1000A52B0()
{
  return sub_10001949C(&qword_100115E18, type metadata accessor for TVFTRootView, (uint64_t)&unk_1000C7030);
}

uint64_t sub_1000A52DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVFTRootView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000A5320()
{
  uint64_t v1 = *(void *)(type metadata accessor for TVFTRootView(0LL) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release(*(void *)(v0 + v3));
  swift_release(*(void *)(v0 + v3 + 8));
  uint64_t v5 = v0 + v3 + *(int *)(sub_100018A04(&qword_100115D78) + 32);
  uint64_t v6 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000A53D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVFTRootView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000A541C()
{
  return sub_1000A4FF8();
}

uint64_t sub_1000A5448(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000A5458(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000A5460(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RootViewController.Event(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

id sub_1000A549C(uint64_t a1, void *a2, void *a3, void *a4, char *a5)
{
  v25[3] = type metadata accessor for ATVCallManager(0LL);
  v25[4] = &off_1000FAC48;
  v25[0] = a1;
  uint64_t v10 = OBJC_IVAR___TVFaceTimeRootViewController_featureFlags;
  id v11 = objc_allocWithZone(&OBJC_CLASS___TUFeatureFlags);
  uint64_t v12 = a5;
  *(void *)&a5[v10] = [v11 init];
  *(void *)&v12[OBJC_IVAR___TVFaceTimeRootViewController_observerCancellables] = _swiftEmptyArrayStorage;
  uint64_t v13 = &v12[OBJC_IVAR___TVFaceTimeRootViewController_state];
  uint64_t v14 = type metadata accessor for RootViewController.State(0LL);
  swift_storeEnumTagMultiPayload(v13, v14, 4LL);
  uint64_t v15 = &v12[OBJC_IVAR___TVFaceTimeRootViewController_incomingHandoffContext];
  uint64_t v16 = type metadata accessor for IncomingHandoffContext(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 1LL, 1LL, v16);
  sub_10001C580((uint64_t)v25, (uint64_t)&v12[OBJC_IVAR___TVFaceTimeRootViewController_callManager]);
  uint64_t v17 = &v12[OBJC_IVAR___TVFaceTimeRootViewController_continuitySessionManager];
  *(void *)uint64_t v17 = a2;
  *((void *)v17 + 1) = &off_1000F92D0;
  uint64_t v18 = &v12[OBJC_IVAR___TVFaceTimeRootViewController_captureDeviceManager];
  *(void *)uint64_t v18 = a3;
  *((void *)v18 + 1) = &off_1000FB180;
  *(void *)&v12[OBJC_IVAR___TVFaceTimeRootViewController_neighborhoodActivityConduit] = a4;
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;

  v24.receiver = v12;
  v24.super_class = (Class)type metadata accessor for RootViewController(0LL);
  id v22 = objc_msgSendSuper2(&v24, "initWithNibName:bundle:", 0, 0);
  sub_10005C228();

  sub_10001BFEC(v25);
  return v22;
}

uint64_t sub_1000A5654()
{
  v9[0] = 0LL;
  v9[1] = 0xE000000000000000LL;
  v1._countAndFlagsBits = 60LL;
  v1._object = (void *)0xE100000000000000LL;
  String.append(_:)(v1);
  uint64_t ObjectType = swift_getObjectType(v0);
  v3._countAndFlagsBits = _typeName(_:qualified:)(ObjectType, 0LL);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  v5._countAndFlagsBits = 2108704LL;
  v5._object = (void *)0xE300000000000000LL;
  String.append(_:)(v5);
  uint64_t v8 = v0;
  _print_unlocked<A, B>(_:_:)( &v8,  v9,  &type metadata for UnsafeMutableRawPointer,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v6._countAndFlagsBits = 62LL;
  v6._object = (void *)0xE100000000000000LL;
  String.append(_:)(v6);
  return v9[0];
}

uint64_t sub_1000A570C()
{
  return sub_1000A5654();
}

uint64_t sub_1000A5720()
{
  return sub_1000A5748((uint64_t)sub_1000A78D0, (uint64_t)&unk_1000FC0B0);
}

uint64_t sub_1000A5734()
{
  return sub_1000A5748((uint64_t)sub_1000A78C4, (uint64_t)&unk_1000FC088);
}

uint64_t sub_1000A5748(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v20 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void **)(v2 + 64);
  aBlock[4] = a1;
  uint64_t v23 = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100027654;
  aBlock[3] = a2;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v12;
  swift_retain(v2);
  static DispatchQoS.unspecified.getter(v15);
  id v21 = _swiftEmptyArrayStorage;
  uint64_t v16 = sub_10001949C( (unint64_t *)&qword_100112930,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v17 = sub_100018A04((uint64_t *)&unk_100112FD0);
  uint64_t v18 = sub_10004F2A8((unint64_t *)&qword_100112940, (uint64_t *)&unk_100112FD0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v17, v18, v5, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v11, v7, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release(v23);
}

uint64_t sub_1000A591C()
{
  return sub_1000A5748((uint64_t)sub_1000A76D8, (uint64_t)&unk_1000FC060);
}

uint64_t sub_1000A5930()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10001C378(v0, qword_100115E30);
  sub_10001C270(v0, (uint64_t)qword_100115E30);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x80000001000D8590LL,  0xD000000000000017LL,  0x80000001000C71A0LL);
}

void sub_1000A59AC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_1000A5A08()
{
  char v9 = 0;
  __int16 v10 = -5120;
  uint64_t ObjectType = swift_getObjectType(v1);
  Swift::String v3 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  sub_1000A744C(v1, v0);
  v4._countAndFlagsBits = v3(ObjectType, v0);
  object = v4._object;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(object);
  v6._countAndFlagsBits = 41LL;
  v6._object = (void *)0xE100000000000000LL;
  String.append(_:)(v6);
  sub_1000A746C(v1, v0);
  return *(void *)v8;
}

void sub_1000A5B4C()
{
}

void sub_1000A5B54(uint64_t *a1)
{
}

void sub_1000A5B68(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

void sub_1000A5BB8()
{
  if (v4 >> 62
    || (sub_1000A744C(v1, v4),
        sub_1000A744C(v1, v4),
        sub_1000A744C(v3, v2),
        swift_unknownObjectRelease(v3),
        swift_unknownObjectRelease(v1),
        sub_1000A746C(v1, v4),
        v3 != v1))
  {
    if (qword_100112468 != -1) {
      swift_once(&qword_100112468, sub_1000A5930);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    sub_10001C270(v5, (uint64_t)qword_100115E30);
    sub_1000A744C(v3, v2);
    swift_retain(v0);
    sub_1000A744C(v3, v2);
    swift_retain(v0);
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc(22LL, -1LL);
      uint64_t v20 = swift_slowAlloc(64LL, -1LL);
      v22[0] = v20;
      *(_DWORD *)uint64_t v9 = 136315394;
      sub_1000A744C(v3, v2);
      sub_1000A59AC(v3, v2);
      uint64_t v11 = v10;
      unint64_t v13 = v12;
      sub_1000A746C(v3, v2);
      uint64_t v21 = sub_1000850E4(v11, v13, v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease(v13);
      sub_1000A746C(v3, v2);
      sub_1000A746C(v3, v2);
      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v14 = *(void *)(v0 + 16);
      unint64_t v15 = *(void *)(v0 + 24);
      sub_1000A744C(v14, v15);
      sub_1000A59AC(v14, v15);
      uint64_t v17 = v16;
      unint64_t v19 = v18;
      sub_1000A746C(v14, v15);
      uint64_t v21 = sub_1000850E4(v17, v19, v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v9 + 14, v9 + 22);
      swift_release_n(v0, 2LL);
      swift_bridgeObjectRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MainCallPresenterState] %s -> %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy(v20, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
      sub_1000A746C(v3, v2);
      sub_1000A746C(v3, v2);

      swift_release_n(v0, 2LL);
    }
  }

void sub_1000A5EA4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

void sub_1000A5EF4()
{
  if (v4 >> 62
    || (sub_1000A744C(v1, v4),
        sub_1000A744C(v1, v4),
        sub_1000A744C(v3, v2),
        swift_unknownObjectRelease(v3),
        swift_unknownObjectRelease(v1),
        sub_1000A746C(v1, v4),
        v3 != v1))
  {
    if (qword_100112468 != -1) {
      swift_once(&qword_100112468, sub_1000A5930);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    sub_10001C270(v5, (uint64_t)qword_100115E30);
    sub_1000A744C(v3, v2);
    swift_retain(v0);
    sub_1000A744C(v3, v2);
    swift_retain(v0);
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc(22LL, -1LL);
      uint64_t v20 = swift_slowAlloc(64LL, -1LL);
      v22[0] = v20;
      *(_DWORD *)uint64_t v9 = 136315394;
      sub_1000A744C(v3, v2);
      sub_1000A59AC(v3, v2);
      uint64_t v11 = v10;
      unint64_t v13 = v12;
      sub_1000A746C(v3, v2);
      uint64_t v21 = sub_1000850E4(v11, v13, v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease(v13);
      sub_1000A746C(v3, v2);
      sub_1000A746C(v3, v2);
      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v14 = *(void *)(v0 + 32);
      unint64_t v15 = *(void *)(v0 + 40);
      sub_1000A744C(v14, v15);
      sub_1000A59AC(v14, v15);
      uint64_t v17 = v16;
      unint64_t v19 = v18;
      sub_1000A746C(v14, v15);
      uint64_t v21 = sub_1000850E4(v17, v19, v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v9 + 14, v9 + 22);
      swift_release_n(v0, 2LL);
      swift_bridgeObjectRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[SplitViewCallPresenterState] %s -> %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy(v20, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
      sub_1000A746C(v3, v2);
      sub_1000A746C(v3, v2);

      swift_release_n(v0, 2LL);
    }
  }

void sub_1000A61E0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

void sub_1000A6230()
{
  if (v4 >> 62
    || (sub_1000A744C(v1, v4),
        sub_1000A744C(v1, v4),
        sub_1000A744C(v3, v2),
        swift_unknownObjectRelease(v3),
        swift_unknownObjectRelease(v1),
        sub_1000A746C(v1, v4),
        v3 != v1))
  {
    if (qword_100112468 != -1) {
      swift_once(&qword_100112468, sub_1000A5930);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    sub_10001C270(v5, (uint64_t)qword_100115E30);
    sub_1000A744C(v3, v2);
    swift_retain(v0);
    sub_1000A744C(v3, v2);
    swift_retain(v0);
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc(22LL, -1LL);
      uint64_t v20 = swift_slowAlloc(64LL, -1LL);
      v22[0] = v20;
      *(_DWORD *)uint64_t v9 = 136315394;
      sub_1000A744C(v3, v2);
      sub_1000A59AC(v3, v2);
      uint64_t v11 = v10;
      unint64_t v13 = v12;
      sub_1000A746C(v3, v2);
      uint64_t v21 = sub_1000850E4(v11, v13, v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease(v13);
      sub_1000A746C(v3, v2);
      sub_1000A746C(v3, v2);
      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v14 = *(void *)(v0 + 48);
      unint64_t v15 = *(void *)(v0 + 56);
      sub_1000A744C(v14, v15);
      sub_1000A59AC(v14, v15);
      uint64_t v17 = v16;
      unint64_t v19 = v18;
      sub_1000A746C(v14, v15);
      uint64_t v21 = sub_1000850E4(v17, v19, v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v9 + 14, v9 + 22);
      swift_release_n(v0, 2LL);
      swift_bridgeObjectRelease(v19);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "[ScreenShareCallPresenterState] %s -> %s",  (uint8_t *)v9,  0x16u);
      swift_arrayDestroy(v20, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
      sub_1000A746C(v3, v2);
      sub_1000A746C(v3, v2);

      swift_release_n(v0, 2LL);
    }
  }

void *sub_1000A651C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v31 = a5;
  uint64_t v32 = a6;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v26 = sub_100039D4C(0LL, v18);
  static DispatchQoS.unspecified.getter(v26);
  double v33 = &_swiftEmptyArrayStorage;
  uint64_t v19 = sub_10001949C( (unint64_t *)&qword_100113130,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v20 = sub_100018A04((uint64_t *)&unk_100112DC0);
  uint64_t v21 = sub_10004F2A8((unint64_t *)&qword_100113140, (uint64_t *)&unk_100112DC0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v33, v20, v21, v12, v19);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))( v11,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v8);
  uint64_t v22 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000002ALL,  0x80000001000DCD10LL,  v17,  v14,  v11,  0LL);
  uint64_t v23 = v28;
  v7[2] = v27;
  v7[3] = v23;
  uint64_t v24 = v30;
  v7[4] = v29;
  v7[5] = v24;
  v7[6] = v31;
  v7[7] = v32;
  v7[8] = v22;
  return v7;
}

uint64_t sub_1000A670C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = v4;
  swift_unknownObjectRetain_n(a2, 3LL);
  sub_1000A744C(v5, v6);
  sub_1000A746C(v5, v6);
  sub_1000A5B68(v5, v6);
  swift_unknownObjectRelease(a2);
  sub_1000A746C(v5, v6);
  return swift_unknownObjectRelease(a2);
}

void sub_1000A6788(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_1000A67D0()
{
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v0 + 16);
  unint64_t v5 = *(void *)(v0 + 24);
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  sub_1000A789C(v2, v1);
  sub_1000A789C(v2, v1);
  sub_1000A789C(v2, v1);
  sub_1000A744C(v4, v5);
  sub_1000A746C(v4, v5);
  sub_1000A5B68(v4, v5);
  sub_1000A78B0(v2, v1);
  sub_1000A746C(v4, v5);
  return sub_1000A78B0(v2, v1);
}

uint64_t sub_1000A6FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 8) | 0x4000000000000000LL;
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = v4;
  swift_unknownObjectRetain_n(a2, 3LL);
  sub_1000A744C(v5, v6);
  sub_1000A746C(v5, v6);
  sub_1000A5B68(v5, v6);
  swift_unknownObjectRelease(a2);
  sub_1000A746C(v5, v6);
  return swift_unknownObjectRelease(a2);
}

void sub_1000A7024(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1000A7050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = *(void *)(a3 + 8) | 0x8000000000000000LL;
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = v4;
  swift_unknownObjectRetain_n(a2, 3LL);
  sub_1000A744C(v5, v6);
  sub_1000A746C(v5, v6);
  sub_1000A5B68(v5, v6);
  swift_unknownObjectRelease(a2);
  sub_1000A746C(v5, v6);
  return swift_unknownObjectRelease(a2);
}

void sub_1000A70D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1000A70FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  unint64_t v2 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = xmmword_1000C7240;
  sub_1000A744C(v1, v2);
  sub_1000A746C(v1, v2);
  sub_1000A5B68(v1, v2);
  return sub_1000A746C(v1, v2);
}

uint64_t sub_1000A715C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 8);
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = v4;
  swift_unknownObjectRetain_n(a2, 3LL);
  sub_1000A744C(v5, v6);
  sub_1000A746C(v5, v6);
  sub_1000A5EA4(v5, v6);
  swift_unknownObjectRelease(a2);
  sub_1000A746C(v5, v6);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_1000A71D8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  unint64_t v11 = a1[7];
  if (v7 >> 62 == 3)
  {
    swift_unknownObjectRetain(a2);
    sub_1000A744C(v8, v9);
    sub_1000A744C(v10, v11);
  }

  else
  {
    uint64_t ObjectType = swift_getObjectType(v6);
    uint64_t v13 = swift_conformsToProtocol2(ObjectType, &protocol descriptor for MainCallPresenting);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0LL;
    }
    if (v13) {
      uint64_t v15 = v6;
    }
    else {
      uint64_t v15 = 0LL;
    }
    if (v15)
    {
      uint64_t v16 = swift_getObjectType(v15);
      uint64_t v17 = *(void *)(v14 + 8);
      uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 16);
      uint64_t v23 = v16;
      sub_1000A744C(v6, v7);
      swift_unknownObjectRetain(a2);
      sub_1000A744C(v8, v9);
      sub_1000A744C(v10, v11);
      sub_1000A744C(v6, v7);
    }

    else
    {
      sub_1000A744C(v6, v7);
      swift_unknownObjectRetain(a2);
      sub_1000A744C(v8, v9);
      sub_1000A744C(v10, v11);
      sub_1000A744C(v6, v7);
    }

    swift_unknownObjectRelease(v6);
    uint64_t v3 = a3;
  }

  uint64_t v18 = *(void *)(v3 + 8);
  swift_unknownObjectRetain(a2);
  sub_1000A746C(v10, v11);
  sub_1000A746C(v8, v9);
  sub_1000A746C(v6, v7);
  uint64_t v19 = a1[6];
  unint64_t v20 = a1[7];
  a1[6] = a2;
  a1[7] = v18;
  swift_unknownObjectRetain(a2);
  sub_1000A744C(v19, v20);
  sub_1000A746C(v19, v20);
  sub_1000A61E0(v19, v20);
  swift_unknownObjectRelease(a2);
  sub_1000A746C(v19, v20);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_1000A73B4()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

uint64_t type metadata accessor for CallPresentationManager(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTime23CallPresentationManager, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for CallPresentationManager.PresenterState( uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1000A744C(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_1000A744C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 3) {
    return swift_unknownObjectRetain(result);
  }
  return result;
}

uint64_t destroy for CallPresentationManager.PresenterState(uint64_t a1)
{
  return sub_1000A746C(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t sub_1000A746C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 3) {
    return swift_unknownObjectRelease(result);
  }
  return result;
}

uint64_t *assignWithCopy for CallPresentationManager.PresenterState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1000A744C(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1000A746C(v5, v6);
  return a1;
}

uint64_t *assignWithTake for CallPresentationManager.PresenterState(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1000A746C(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CallPresentationManager.PresenterState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7D && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 57) >> 5) | (4
                                                          * ((*(void *)(a1 + 8) >> 57) & 0x18 | *(void *)(a1 + 8) & 7))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CallPresentationManager.PresenterState( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)uint64_t result = a2 - 125;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7D) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7D) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)uint64_t result = 0LL;
      *(void *)(result + 8) = (v3 | (v3 << 57)) & 0xF000000000000007LL;
    }
  }

  return result;
}

uint64_t sub_1000A75A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 62;
  if ((_DWORD)v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_1000A75C4(uint64_t result)
{
  *(void *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_1000A75D4(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xFFFFFFFFFFFFFF8LL | (a2 << 62);
  }

  else
  {
    *uint64_t result = (a2 - 3);
    result[1] = 0xC000000000000000LL;
  }

  return result;
}

ValueMetadata *type metadata accessor for CallPresentationManager.PresenterState()
{
  return &type metadata for CallPresentationManager.PresenterState;
}

void sub_1000A760C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

BOOL sub_1000A7644(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 62) {
    return 0LL;
  }
  sub_1000A744C(v4, a4);
  sub_1000A744C(v5, v6);
  swift_unknownObjectRelease(v5);
  swift_unknownObjectRelease(v4);
  return v5 == v4;
}

void sub_1000A76D8()
{
}

uint64_t sub_1000A76E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000A76F4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000A76FC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v8 = a2 >> 62;
  if (a2 >> 62 == 1)
  {
    uint64_t ObjectType = swift_getObjectType(a1);
    uint64_t v10 = swift_conformsToProtocol2(ObjectType, &protocol descriptor for MainCallPresenting);
    uint64_t v11 = v10 ? v10 : 0LL;
    uint64_t v12 = v10 ? a1 : 0LL;
    if (v12)
    {
      uint64_t v13 = swift_getObjectType(v12);
      uint64_t v14 = *(void *)(v11 + 8);
      uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 16);
      swift_unknownObjectRetain(a1);
      if (v15(v13, v14) != 2)
      {
        sub_100028C18();
LABEL_24:
        sub_1000A746C(a1, a2);
        return 0LL;
      }

      sub_1000A746C(a1, a2);
    }
  }

  if (!(a4 >> 62))
  {
    uint64_t v16 = swift_getObjectType(a3);
    if (swift_conformsToProtocol2(v16, &protocol descriptor for SplitViewCallPresenting) ? a3 : 0LL)
    {
      if (!(_DWORD)v8)
      {
        uint64_t v20 = swift_getObjectType(a1);
        uint64_t v21 = *(uint64_t (**)(uint64_t, unint64_t))(a2 + 16);
        sub_1000A744C(a1, a2);
        sub_1000A744C(a3, a4);
        if (v21(v20, a2) == 2)
        {
LABEL_23:
          sub_1000A746C(a3, a4);
          goto LABEL_24;
        }

uint64_t sub_1000A789C(uint64_t result, unint64_t a2)
{
  return result;
}

uint64_t sub_1000A78B0(uint64_t result, unint64_t a2)
{
  return result;
}

void sub_1000A78C4()
{
}

uint64_t sub_1000A78D0()
{
  return sub_1000A70FC(v0);
}

uint64_t sub_1000A78EC(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v2 = a1;
    }
    else {
      uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = __CocoaSet.makeIterator()(v2);
    uint64_t v4 = sub_10001C5D0(0LL, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
    uint64_t v5 = sub_10001C230(&qword_100116000, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
    uint64_t result = (uint64_t)Set.Iterator.init(_cocoa:)(v34, v3, v4, v5);
    uint64_t v1 = v34[0];
    uint64_t v32 = v34[1];
    uint64_t v8 = v34[2];
    uint64_t v7 = v34[3];
    unint64_t v9 = v34[4];
  }

  else
  {
    uint64_t v10 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v32 = a1 + 56;
    uint64_t v8 = ~v10;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1LL << v11);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v9 = v12 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain(a1);
    uint64_t v7 = 0LL;
  }

  int64_t v31 = (unint64_t)(v8 + 64) >> 6;
  uint64_t v13 = _swiftEmptyArrayStorage;
  if (v1 < 0) {
    goto LABEL_13;
  }
  while (1)
  {
    if (v9)
    {
      uint64_t v14 = (v9 - 1) & v9;
      unint64_t v15 = __clz(__rbit64(v9)) | (v7 << 6);
      uint64_t v16 = v7;
      goto LABEL_32;
    }

    int64_t v21 = v7 + 1;
    if (__OFADD__(v7, 1LL)) {
      break;
    }
    if (v21 >= v31) {
      goto LABEL_39;
    }
    unint64_t v22 = *(void *)(v32 + 8 * v21);
    uint64_t v16 = v7 + 1;
    if (!v22)
    {
      uint64_t v16 = v7 + 2;
      if (v7 + 2 >= v31) {
        goto LABEL_39;
      }
      unint64_t v22 = *(void *)(v32 + 8 * v16);
      if (!v22)
      {
        uint64_t v16 = v7 + 3;
        if (v7 + 3 >= v31) {
          goto LABEL_39;
        }
        unint64_t v22 = *(void *)(v32 + 8 * v16);
        if (!v22)
        {
          uint64_t v16 = v7 + 4;
          if (v7 + 4 >= v31) {
            goto LABEL_39;
          }
          unint64_t v22 = *(void *)(v32 + 8 * v16);
          if (!v22)
          {
            uint64_t v16 = v7 + 5;
            if (v7 + 5 >= v31) {
              goto LABEL_39;
            }
            unint64_t v22 = *(void *)(v32 + 8 * v16);
            if (!v22)
            {
              uint64_t v23 = v7 + 6;
              while (v31 != v23)
              {
                unint64_t v22 = *(void *)(v32 + 8 * v23++);
                if (v22)
                {
                  uint64_t v16 = v23 - 1;
                  goto LABEL_31;
                }
              }

uint64_t sub_1000A7C60(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_100018A04(&qword_100112D10);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = sub_10001949C( &qword_1001136D0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t result = Set.init(minimumCapacity:)(v12, v2, v13);
  int64_t v15 = 0LL;
  uint64_t v16 = a1 + 64;
  uint64_t v17 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v18 = -1LL;
  if (v17 < 64) {
    uint64_t v18 = ~(-1LL << v17);
  }
  unint64_t v19 = v18 & *(void *)(a1 + 64);
  int64_t v25 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v26 = result;
  if (!v19) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v20 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (unint64_t i = v20 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v15 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))( v11,  *(void *)(a1 + 48) + *(void *)(v3 + 72) * i,  v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v11, 0LL, 1LL, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v11, v2);
    sub_1000ACCDC((uint64_t)v8, (uint64_t)v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    if (v19) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
      __break(1u);
      goto LABEL_27;
    }

    if (v22 >= v25) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v16 + 8 * v22);
    ++v15;
    if (!v23)
    {
      int64_t v15 = v22 + 1;
      if (v22 + 1 >= v25) {
        goto LABEL_24;
      }
      unint64_t v23 = *(void *)(v16 + 8 * v15);
      if (!v23)
      {
        int64_t v15 = v22 + 2;
        if (v22 + 2 >= v25) {
          goto LABEL_24;
        }
        unint64_t v23 = *(void *)(v16 + 8 * v15);
        if (!v23)
        {
          int64_t v15 = v22 + 3;
          if (v22 + 3 >= v25) {
            goto LABEL_24;
          }
          unint64_t v23 = *(void *)(v16 + 8 * v15);
          if (!v23) {
            break;
          }
        }
      }
    }

LABEL_20:
    unint64_t v19 = (v23 - 1) & v23;
  }

  int64_t v24 = v22 + 4;
  if (v24 >= v25)
  {
LABEL_24:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v11, 1LL, 1LL, v2);
LABEL_25:
    swift_release(a1);
    return v26;
  }

  unint64_t v23 = *(void *)(v16 + 8 * v24);
  if (v23)
  {
    int64_t v15 = v24;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v15 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v15 >= v25) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v16 + 8 * v15);
    ++v24;
    if (v23) {
      goto LABEL_20;
    }
  }

uint64_t sub_1000A7F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100018A04((uint64_t *)&unk_100112E10);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = sub_1000AFA5C(a1);
  if ((v10 & 1) != 0) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v9)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }

  if (result == 1LL << *(_BYTE *)(a1 + 32)) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1LL, 1LL, v4);
  }
  uint64_t v11 = *(int *)(v4 + 48);
  id v12 = sub_1000AFAE4(v7, result, v9, 0LL, a1);
  *(void *)&v7[v11] = v12;
  uint64_t v13 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(a2, v7, v13);
  *(void *)(a2 + *(int *)(v4 + sub_10009BF94( *(void **)(v0 + 16),  *(void **)(v0 + 40),  *(_BYTE *)(v0 + 56),  *(double *)(v0 + 24),  *(double *)(v0 + 32),  *(double *)(v0 + 48)) = v12;
  id v14 = v12;
  sub_10001C608((uint64_t)v7, (uint64_t *)&unk_100112E10);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a2, 0LL, 1LL, v4);
}

uint64_t sub_1000A807C(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001LL;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v4 = __CocoaSet.startIndex.getter(v3);
    uint64_t v6 = v5;
    uint64_t v7 = __CocoaSet.endIndex.getter(v3);
    char v9 = static __CocoaSet.Index.== infix(_:_:)(v4, v6, v7, v8);
    swift_bridgeObjectRelease(v7);
    if ((v9 & 1) != 0) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }

  uint64_t result = sub_1000967DC(a1);
  if ((v13 & 1) == 0)
  {
    uint64_t v6 = v12;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v12)
    {
      uint64_t v4 = result;
      if (result == 1LL << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_100042B84(v4, v6, v2 != 0);
        return 0LL;
      }

uint64_t sub_1000A8198@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000AF6A0(a1);
  if ((v6 & 1) != 0) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }

  if (result == 1LL << *(_BYTE *)(a1 + 32))
  {
    uint64_t v7 = type metadata accessor for RecentsCallHandle(0LL);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL);
    uint64_t v9 = a2;
    uint64_t v10 = 1LL;
  }

  else
  {
    sub_1000AF9C8(result, v5, a1, a2);
    uint64_t v7 = type metadata accessor for RecentsCallHandle(0LL);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL);
    uint64_t v9 = a2;
    uint64_t v10 = 0LL;
  }

  return v8(v9, v10, 1LL, v7);
}

uint64_t sub_1000A8238(void **a1)
{
  return sub_1000A825C(*a1);
}

uint64_t sub_1000A825C(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v19 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  int v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_recentsQueue];
  uint64_t v11 = swift_allocObject(&unk_1000FC248, 32LL, 7LL);
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_1000B15CC;
  uint64_t v22 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100027654;
  aBlock[3] = &unk_1000FC260;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = a1;
  id v14 = v10;
  static DispatchQoS.unspecified.getter(v1);
  unint64_t v20 = _swiftEmptyArrayStorage;
  uint64_t v15 = sub_10001949C( (unint64_t *)&qword_100112930,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v16 = sub_100018A04((uint64_t *)&unk_100112FD0);
  uint64_t v17 = sub_100022750( (unint64_t *)&qword_100112940,  (uint64_t *)&unk_100112FD0,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v20, v16, v17, v3, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release(v22);
}

void sub_1000A8460(void *a1)
{
  uint64_t v3 = sub_100018A04((uint64_t *)&unk_100115FD0);
  __chkstk_darwin(v3);
  int v5 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for RecentsCallItem(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v75 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v74 = (char *)&v69 - v11;
  __chkstk_darwin(v10);
  os_log_type_t v72 = (char *)&v69 - v12;
  if (!a1)
  {
    uint64_t v36 = *(void *)&v1[OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_recentCallItems];
    *(void *)&v1[OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_recentCallItems] = _swiftEmptyArrayStorage;
    swift_bridgeObjectRelease(v36);
    uint64_t v37 = *(void *)&v1[OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_contacts];
    *(void *)&v1[OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_contacts] = &_swiftEmptyDictionarySingleton;
    swift_bridgeObjectRelease(v37);
    sub_1000A8B94(v1);
    return;
  }

  uint64_t v76 = v5;
  id v13 = a1;
  id v14 = [v13 recentCallsContacts];
  uint64_t v15 = sub_10001C5D0(0LL, &qword_100115640, &OBJC_CLASS___CNContact_ptr);
  uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v14,  &type metadata for String,  v15,  &protocol witness table for String);

  uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_contacts];
  id v70 = v1;
  *(void *)&v1[OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_contacts] = v16;
  *(void *)&double v18 = swift_bridgeObjectRelease(v17).n128_u64[0];
  id v71 = v13;
  id v19 = objc_msgSend(v13, "activeConversations", v18);
  uint64_t v20 = sub_10001C5D0(0LL, (unint64_t *)&unk_100115FE0, &OBJC_CLASS___TUContinuityConversation_ptr);
  uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, v20);

  unint64_t v77 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)v21 >> 62)
  {
    if (v21 < 0) {
      uint64_t v38 = v21;
    }
    else {
      uint64_t v38 = v21 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v21);
    uint64_t v22 = _CocoaArrayWrapper.endIndex.getter(v38);
    swift_bridgeObjectRelease(v21);
    uint64_t v23 = (uint64_t)v76;
    if (v22)
    {
LABEL_4:
      if (v22 < 1)
      {
        __break(1u);
        goto LABEL_56;
      }

      uint64_t v24 = 0LL;
      unint64_t v25 = v21 & 0xC000000000000001LL;
      unint64_t v73 = v21;
      do
      {
        if (v25) {
          id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v24, v21);
        }
        else {
          id v33 = *(id *)(v21 + 8 * v24 + 32);
        }
        uint64_t v34 = v33;
        if ((uint64_t)[v33 remoteMemberCount] >= 2)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          uint64_t v26 = v23;
          unint64_t v27 = v25;
          uint64_t v28 = v7;
          uint64_t v29 = v22;
          uint64_t v30 = *(void *)(v77 + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v30);
          uint64_t v31 = v30;
          uint64_t v22 = v29;
          uint64_t v7 = v28;
          unint64_t v25 = v27;
          uint64_t v23 = v26;
          uint64_t v32 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v34);
          specialized ContiguousArray._endMutation()(v32);
          uint64_t v21 = v73;
        }

        else
        {
        }

        ++v24;
      }

      while (v22 != v24);
      swift_bridgeObjectRelease(v21);
      unint64_t v35 = v77;
      if ((v77 & 0x8000000000000000LL) != 0) {
        goto LABEL_32;
      }
      goto LABEL_21;
    }
  }

  else
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v23 = (uint64_t)v76;
    if (v22) {
      goto LABEL_4;
    }
  }

  swift_bridgeObjectRelease(v21);
  unint64_t v35 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_21:
  if ((v35 & 0x4000000000000000LL) != 0)
  {
LABEL_32:
    uint64_t v46 = swift_bridgeObjectRetain(v35);
    uint64_t v39 = _CocoaArrayWrapper.endIndex.getter(v46);
    swift_release(v35);
    if (!v39) {
      goto LABEL_33;
    }
    goto LABEL_23;
  }

  uint64_t v39 = *(void *)(v35 + 16);
  if (!v39)
  {
LABEL_33:
    swift_release(v35);
    uint64_t v41 = _swiftEmptyArrayStorage;
    goto LABEL_34;
  }

LABEL_57:
  __break(1u);
}

uint64_t sub_1000A8B94(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v21 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10001C5D0(0LL, (unint64_t *)&qword_100112DB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v10 = (void *)static OS_dispatch_queue.main.getter(v9);
  uint64_t v11 = swift_allocObject(&unk_1000FC1F8, 24LL, 7LL);
  *(void *)(v11 + 16) = a1;
  aBlock[4] = sub_1000B1580;
  uint64_t v23 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100027654;
  aBlock[3] = &unk_1000FC210;
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = v23;
  id v14 = a1;
  uint64_t v15 = swift_release(v13);
  static DispatchQoS.unspecified.getter(v15);
  aBlock[0] = _swiftEmptyArrayStorage;
  uint64_t v16 = sub_10001949C( (unint64_t *)&qword_100112930,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v17 = sub_100018A04((uint64_t *)&unk_100112FD0);
  uint64_t v18 = sub_100022750( (unint64_t *)&qword_100112940,  (uint64_t *)&unk_100112FD0,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v17, v18, v2, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v8, v4, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000A8DA8@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___CHRecentCall, a1);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v57[0] = 0LL;
  id v8 = [v6 unarchivedObjectFromData:isa error:v57];

  id v9 = v57[0];
  if (!v8)
  {
    id v18 = v57[0];
    uint64_t v19 = _convertNSErrorToError(_:)(v9);

    swift_willThrow(v20);
    swift_errorRelease(v19);
    goto LABEL_6;
  }

  id v10 = v57[0];
  _bridgeAnyObjectToAny(_:)(v57, v8);
  swift_unknownObjectRelease(v8);
  uint64_t v11 = sub_10001C5D0(0LL, &qword_100115FF0, &OBJC_CLASS___CHRecentCall_ptr);
  if ((swift_dynamicCast(&v56, v57, (char *)&type metadata for Any + 8, v11, 6LL) & 1) == 0)
  {
LABEL_6:
    uint64_t v21 = type metadata accessor for RecentsCallItem(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))( a3,  1LL,  1LL,  v21);
  }

  id v51 = v56;
  id v12 = [v56 validRemoteParticipantHandles];
  uint64_t v53 = a3;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_10001C5D0(0LL, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
    uint64_t v15 = sub_10001C230(&qword_100116000, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
    uint64_t v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v13, v14, v15);

    uint64_t v17 = (void *)sub_1000A78EC(v16);
    swift_bridgeObjectRelease(v16);
  }

  else
  {
    uint64_t v17 = _swiftEmptyArrayStorage;
  }

  uint64_t v52 = a2;
  unint64_t v23 = sub_10002DC7C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v24 = v17[2];
  uint64_t v50 = v17;
  id v55 = (void *)v23;
  if (!v24)
  {
LABEL_26:
    swift_bridgeObjectRelease(v50);
    return sub_1000A9240( v51,  (uint64_t)v55,  *(id *)(v52 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_featureFlags),  v53);
  }

  unint64_t v25 = v17 + 5;
  id v54 = v4;
  while (1)
  {
    uint64_t v27 = *(v25 - 1);
    uint64_t v26 = *v25;
    swift_bridgeObjectRetain(*v25);
    id v28 = [v4 recentCallsContacts];
    uint64_t v29 = sub_10001C5D0(0LL, &qword_100115640, &OBJC_CLASS___CNContact_ptr);
    uint64_t v30 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v28,  &type metadata for String,  v29,  &protocol witness table for String);

    if (!*(void *)(v30 + 16)) {
      goto LABEL_11;
    }
    swift_bridgeObjectRetain(v26);
    unint64_t v31 = sub_10002FB98(v27, v26);
    if ((v32 & 1) == 0)
    {
      swift_bridgeObjectRelease(v26);
LABEL_11:
      swift_bridgeObjectRelease(v30);
      swift_bridgeObjectRelease(v26);
      goto LABEL_12;
    }

    id v33 = *(id *)(*(void *)(v30 + 56) + 8 * v31);
    swift_bridgeObjectRelease(v26);
    swift_bridgeObjectRelease(v30);
    id v34 = v33;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v55);
    v57[0] = v55;
    unint64_t v37 = sub_10002FB98(v27, v26);
    uint64_t v38 = v55[2];
    BOOL v39 = (v36 & 1) == 0;
    uint64_t v40 = v38 + v39;
    if (__OFADD__(v38, v39))
    {
      __break(1u);
LABEL_28:
      __break(1u);
    }

    char v41 = v36;
    if (v55[3] >= v40)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_10006A054();
      }
      goto LABEL_21;
    }

    sub_1000678C8(v40, isUniquelyReferenced_nonNull_native);
    unint64_t v42 = sub_10002FB98(v27, v26);
    if ((v41 & 1) != (v43 & 1)) {
      break;
    }
    unint64_t v37 = v42;
LABEL_21:
    unint64_t v44 = v57[0];
    id v55 = v57[0];
    if ((v41 & 1) != 0)
    {
      uint64_t v45 = *((void *)v57[0] + 7);

      *(void *)(v45 + 8 * v37) = v34;
    }

    else
    {
      *((void *)v57[0] + (v37 >> 6) + 8) |= 1LL << v37;
      uint64_t v46 = (uint64_t *)(v44[6] + 16 * v37);
      uint64_t *v46 = v27;
      v46[1] = v26;
      *(void *)(v44[7] + 8 * v37) = v34;
      uint64_t v47 = v44[2];
      BOOL v48 = __OFADD__(v47, 1LL);
      uint64_t v49 = v47 + 1;
      if (v48) {
        goto LABEL_28;
      }
      v44[2] = v49;
      swift_bridgeObjectRetain(v26);
    }

    swift_bridgeObjectRelease(v26);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    uint64_t v4 = v54;
LABEL_12:
    v25 += 2;
    if (!--v24) {
      goto LABEL_26;
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_1000A9240@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v108 = a3;
  uint64_t v106 = a4;
  uint64_t v6 = sub_100018A04(&qword_100116008);
  __chkstk_darwin(v6);
  uint64_t v104 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100018A04((uint64_t *)&unk_100115FD0);
  __chkstk_darwin(v8);
  os_log_type_t v105 = (char *)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100018A04((uint64_t *)&unk_100116010);
  __chkstk_darwin(v10);
  id v12 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_100018A04(&qword_100112D10);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  id v18 = (char *)&v97 - v17;
  uint64_t v19 = sub_100018A04(&qword_100116020);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v97 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for RecentCallRecentItemMetadata(0LL);
  uint64_t v102 = *(void *)(v22 - 8);
  uint64_t v103 = v22;
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v101 = (char *)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  uint64_t v107 = (char *)&v97 - v25;
  uint64_t v109 = _swiftEmptyArrayStorage;
  id v26 = [a1 validRemoteParticipantHandles];
  if (v26)
  {
    id v28 = v26;
    uint64_t v29 = sub_10001C5D0(0LL, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
    uint64_t v30 = sub_10001C230(&qword_100116000, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
    uint64_t v31 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v28, v29, v30);

    if ((v31 & 0xC000000000000001LL) != 0)
    {
      if (v31 < 0) {
        uint64_t v32 = v31;
      }
      else {
        uint64_t v32 = v31 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v33 = __CocoaSet.count.getter(v32);
    }

    else
    {
      uint64_t v33 = *(void *)(v31 + 16);
    }

    uint64_t v35 = sub_1000AF2C0(v33, 0);
    specialized Array._endMutation()(v35);
    swift_bridgeObjectRetain(a2);
    char v36 = sub_1000AFC84(v31, a2, &v109);
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease(a2);
    id v34 = (void *)sub_1000B0170((uint64_t)v36);
    *(void *)&double v27 = swift_bridgeObjectRelease(v36).n128_u64[0];
  }

  else
  {
    id v34 = &_swiftEmptySetSingleton;
  }

  else {
    uint64_t v98 = 2LL;
  }
  id v37 = [a1 uniqueId];
  uint64_t v38 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
  uint64_t v99 = v39;
  id v100 = v38;

  id v40 = [a1 date];
  if (v40)
  {
    char v41 = v40;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v42 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56LL))(v21, 0LL, 1LL, v42);
  }

  else
  {
    uint64_t v43 = ((uint64_t (*)(void))type metadata accessor for Date)();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56LL))(v21, 1LL, 1LL, v43);
  }

  id v44 = [a1 countOfExcludedHandles];
  id v45 = [a1 participantGroupUUID];
  if (v45)
  {
    uint64_t v46 = v45;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v45);

    uint64_t v47 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56LL))(v18, 0LL, 1LL, v47);
  }

  else
  {
    uint64_t v48 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56LL))(v18, 1LL, 1LL, v48);
  }

  uint64_t v49 = type metadata accessor for ConversationLink(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56LL))(v12, 1LL, 1LL, v49);
  id v50 = [a1 conversationID];
  if (v50)
  {
    id v51 = v50;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v50);

    uint64_t v52 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56LL))(v16, 0LL, 1LL, v52);
  }

  else
  {
    uint64_t v53 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56LL))(v16, 1LL, 1LL, v53);
  }

  id v54 = a1;
  swift_bridgeObjectRetain(v34);
  id v55 = a1;
  uint64_t v56 = v98;
  RecentCallRecentItemMetadata.init(uniqueId:date:recentCall:mediaType:remoteParticipantHandles:countOfExcludedHandles:groupUUID:conversationLink:conversationID:)( v100,  v99,  v21,  v55,  v98,  0LL,  v34,  v44,  v18,  v12,  v16);
  uint64_t v57 = sub_1000B037C((uint64_t)v34, a2);
  uint64_t v59 = v58;
  swift_bridgeObjectRelease(v34);
  *(void *)&double v60 = swift_bridgeObjectRelease(a2).n128_u64[0];
  id v100 = v54;
  id v61 = objc_msgSend(v54, "serviceProvider", v60);
  uint64_t v99 = v59;
  if (!v61)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(kCHServiceProviderFaceTime);
    uint64_t v68 = v71;
    uint64_t v69 = (uint64_t)v105;
    goto LABEL_28;
  }

  id v62 = v61;
  uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
  uint64_t v65 = v64;

  uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)(kCHServiceProviderFaceTime);
  uint64_t v68 = v67;
  uint64_t v69 = (uint64_t)v105;
  if (!v65)
  {
LABEL_28:
    __n128 v72 = swift_bridgeObjectRelease(v68);
    goto LABEL_29;
  }

  if (v63 != v66 || v65 != v67)
  {
    char v75 = _stringCompareWithSmolCheck(_:_:expecting:)(v63, v65, v66, v67, 0LL);
    swift_bridgeObjectRelease(v65);
    __n128 v72 = swift_bridgeObjectRelease(v68);
    if ((v75 & 1) != 0) {
      goto LABEL_31;
    }
LABEL_29:
    uint64_t countAndFlagsBits = 0LL;
    object = 0LL;
    goto LABEL_35;
  }

  swift_bridgeObjectRelease_n(v65, 2LL);
LABEL_31:
  uint64_t v76 = (NSBundle *)objc_msgSend((id)objc_opt_self(NSBundle, v70), "mainBundle");
  unint64_t v96 = 0xE000000000000000LL;
  if (v56 == 2) {
    unint64_t v77 = "FACETIME_VIDEO_LABEL";
  }
  else {
    unint64_t v77 = "FACETIME_AUDIO_LABEL";
  }
  v78._object = (void *)((unint64_t)(v77 - 32) | 0x8000000000000000LL);
  v78._uint64_t countAndFlagsBits = 0xD000000000000014LL;
  v79.value._uint64_t countAndFlagsBits = 0x73746E65636552LL;
  v79.value._object = (void *)0xE700000000000000LL;
  v80._uint64_t countAndFlagsBits = 0LL;
  v80._object = (void *)0xE000000000000000LL;
  uint64_t v81 = 0LL;
  Swift::String v82 = NSLocalizedString(_:tableName:bundle:value:comment:)(v78, v79, v76, v80, *(Swift::String *)(&v96 - 1));
  uint64_t countAndFlagsBits = v82._countAndFlagsBits;
  object = v82._object;

LABEL_35:
  uint64_t v83 = v101;
  uint64_t v84 = v102;
  uint64_t v85 = v107;
  uint64_t v86 = v103;
  (*(void (**)(char *, char *, uint64_t, __n128))(v102 + 16))(v101, v107, v103, v72);
  char v87 = v109;
  uint64_t v88 = type metadata accessor for RecentsCallItemType(0LL);
  char v89 = v104;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56LL))(v104, 1LL, 1LL, v88);
  swift_bridgeObjectRetain(v87);
  RecentsCallItem.init(recentsCallMetadata:contacts:title:subtitle:forcedSubtitle:senderIdentity:occurrenceCount:applicationIcon:type:)( v83,  v87,  v57,  v99,  countAndFlagsBits,  object,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v89);

  (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v86);
  uint64_t v90 = type metadata accessor for RecentsCallItem(0LL);
  uint64_t v91 = *(void *)(v90 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v69, 1LL, v90))
  {
    sub_10001C608(v69, (uint64_t *)&unk_100115FD0);
    __n128 v92 = swift_bridgeObjectRelease(v109);
    uint64_t v93 = 1LL;
    uint64_t v94 = v106;
  }

  else
  {
    uint64_t v94 = v106;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 32))(v106, v69, v90);
    __n128 v92 = swift_bridgeObjectRelease(v109);
    uint64_t v93 = 0LL;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v91 + 56))(v94, v93, 1LL, v90, v92);
}

void sub_1000A9A04(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  id v5 = [a1 remoteMembers];
  uint64_t v6 = sub_10001C5D0(0LL, &qword_100113008, &OBJC_CLASS___TUConversationMember_ptr);
  uint64_t v7 = sub_10001C230((unint64_t *)&unk_100113010, &qword_100113008, &OBJC_CLASS___TUConversationMember_ptr);
  uint64_t v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v5, v6, v7);

  id v9 = a2;
  sub_1000B0A10(v8, (uint64_t)v9);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease(v8);

  *a3 = v11;
}

uint64_t sub_1000A9ADC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  LODWORD(v92) = a3;
  uint64_t v91 = a2;
  uint64_t v6 = type metadata accessor for RecentsCallItem(0LL);
  uint64_t v97 = *(void *)(v6 - 8);
  uint64_t v7 = *(void ***)(v97 + 64);
  __chkstk_darwin(v6);
  id v95 = (char *)&v90 - (((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100018A04(&qword_100114970);
  __chkstk_darwin(v8);
  uint64_t v99 = (uint64_t)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for RecentsCallItemType(0LL);
  uint64_t v101 = *(uint64_t (***)(void **, uint64_t))(v10 - 8);
  __chkstk_darwin(v10);
  id v12 = (void **)((char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v102 = type metadata accessor for CallType(0LL);
  uint64_t v100 = *(void *)(v102 - 8);
  uint64_t v13 = *(void *)(v100 + 64);
  uint64_t v14 = __chkstk_darwin(v102);
  uint64_t v94 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v90 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v90 - v19;
  __chkstk_darwin(v18);
  uint64_t v103 = (char *)&v90 - v21;
  uint64_t v22 = v4 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate;
  swift_beginAccess( v4 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate,  v107,  0LL,  0LL);
  uint64_t v90 = v22;
  sub_1000B0E50(v22, (uint64_t)v108);
  uint64_t v98 = v6;
  unint64_t v96 = v7;
  uint64_t v93 = v13;
  if (v109)
  {
    sub_1000B0EC0((uint64_t)v108, (uint64_t)v104);
    sub_10001C608((uint64_t)v108, &qword_100115F78);
    uint64_t v23 = v4;
    uint64_t v24 = v105;
    uint64_t v25 = v106;
    sub_10001C3FC(v104, v105);
    uint64_t v26 = a1;
    uint64_t v27 = v25;
    uint64_t v4 = v23;
    dispatch thunk of RecentCallProviderDelegate.didStartOutgoingCallRequest(for:)(a1, v24, v27);
    sub_10001BFEC(v104);
  }

  else
  {
    uint64_t v26 = a1;
    sub_10001C608((uint64_t)v108, &qword_100115F78);
  }

  uint64_t v28 = v10;
  if ([*(id *)(v4 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_featureFlags) lagunaAudioCallsEnabled])
  {
    uint64_t v29 = v26;
    if ((v92 & 1) != 0)
    {
      BOOL v35 = RecentsCallItem.mediaType.getter() == 1 && (v34 & 1) == 0;
      uint64_t v36 = v100;
      id v37 = (unsigned int *)&enum case for CallType.audio(_:);
      if (!v35) {
        id v37 = (unsigned int *)&enum case for CallType.video(_:);
      }
      uint64_t v38 = v102;
      (*(void (**)(char *, void, uint64_t))(v100 + 104))(v17, *v37, v102);
      uint64_t v33 = (*(uint64_t (**)(char *, char *, uint64_t))(v36 + 32))(v103, v17, v38);
    }

    else
    {
      uint64_t v30 = (unsigned int *)&enum case for CallType.audio(_:);
      uint64_t v31 = v100;
      if (v91 != 1) {
        uint64_t v30 = (unsigned int *)&enum case for CallType.video(_:);
      }
      uint64_t v32 = v102;
      (*(void (**)(char *, void, uint64_t))(v100 + 104))(v20, *v30, v102);
      uint64_t v33 = (*(uint64_t (**)(char *, char *, uint64_t))(v31 + 32))(v103, v20, v32);
    }
  }

  else
  {
    uint64_t v33 = (*(uint64_t (**)(char *, void, uint64_t))(v100 + 104))( v103,  enum case for CallType.video(_:),  v102);
    uint64_t v29 = v26;
  }

  RecentsCallItem.type.getter(v33);
  int v39 = v101[11](v12, v28);
  if (v39 == enum case for RecentsCallItemType.recent(_:))
  {
    uint64_t v40 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56LL))(v99, 1LL, 1LL, v40);
    uint64_t v91 = swift_allocObject(&unk_1000FC108, 24LL, 7LL);
    swift_unknownObjectWeakInit(v91 + 16, v4);
    uint64_t v41 = v97;
    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 16);
    uint64_t v92 = v28;
    uint64_t v43 = v95;
    uint64_t v44 = v98;
    v42(v95, v29, v98);
    uint64_t v45 = v100;
    uint64_t v46 = v94;
    uint64_t v48 = v102;
    uint64_t v47 = v103;
    (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v94, v103, v102);
    uint64_t v49 = *(unsigned __int8 *)(v41 + 80);
    uint64_t v50 = (v49 + 40) & ~v49;
    uint64_t v51 = *(unsigned __int8 *)(v45 + 80);
    uint64_t v52 = (uint64_t)v96 + v51 + v50;
    unint64_t v96 = v12;
    uint64_t v53 = v52 & ~v51;
    id v54 = (char *)swift_allocObject(&unk_1000FC180, v53 + v93, v49 | v51 | 7);
    *((void *)v54 + 2) = 0LL;
    *((void *)v54 + 3) = 0LL;
    *((void *)v54 + 4) = v91;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(&v54[v50], v43, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(&v54[v53], v46, v48);
    uint64_t v55 = sub_1000B5C50(v99, (uint64_t)&unk_100115FB8, (uint64_t)v54);
    __n128 v56 = swift_release(v55);
    (*(void (**)(char *, uint64_t, __n128))(v45 + 8))(v47, v48, v56);
    return v101[1](v96, v92);
  }

  else if (v39 == enum case for RecentsCallItemType.continuity(_:))
  {
    v101[12](v12, v28);
    uint64_t v58 = *v12;
    uint64_t v59 = type metadata accessor for TaskPriority(0LL);
    uint64_t v60 = v99;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56LL))(v99, 1LL, 1LL, v59);
    uint64_t v61 = swift_allocObject(&unk_1000FC108, 24LL, 7LL);
    swift_unknownObjectWeakInit(v61 + 16, v4);
    uint64_t v62 = v97;
    uint64_t v63 = v95;
    uint64_t v64 = v98;
    (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v95, v29, v98);
    uint64_t v65 = *(unsigned __int8 *)(v62 + 80);
    uint64_t v66 = (v65 + 40) & ~v65;
    unint64_t v67 = ((unint64_t)v96 + v66 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v68 = (char *)swift_allocObject(&unk_1000FC158, v67 + 8, v65 | 7);
    *((void *)v68 + 2) = 0LL;
    *((void *)v68 + 3) = 0LL;
    *((void *)v68 + 4) = v61;
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v68[v66], v63, v64);
    *(void *)&v68[v67] = v58;
    id v69 = v58;
    uint64_t v70 = sub_1000B5C50(v60, (uint64_t)&unk_100115FA8, (uint64_t)v68);

    swift_release(v70);
    return (*(uint64_t (**)(char *, uint64_t))(v100 + 8))(v103, v102);
  }

  else if (v39 == enum case for RecentsCallItemType.favorite(_:))
  {
    v101[12](v12, v28);
    uint64_t v101 = (uint64_t (**)(void **, uint64_t))*v12;
    uint64_t v71 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56LL))(v99, 1LL, 1LL, v71);
    uint64_t v72 = swift_allocObject(&unk_1000FC108, 24LL, 7LL);
    swift_unknownObjectWeakInit(v72 + 16, v4);
    uint64_t v73 = v97;
    uint64_t v74 = v95;
    uint64_t v75 = v98;
    (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v95, v29, v98);
    uint64_t v76 = v100;
    unint64_t v77 = v94;
    (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v94, v103, v102);
    uint64_t v78 = *(unsigned __int8 *)(v73 + 80);
    uint64_t v79 = (v78 + 40) & ~v78;
    unint64_t v80 = ((unint64_t)v96 + v79 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v81 = *(unsigned __int8 *)(v76 + 80);
    uint64_t v82 = (v81 + v80 + 8) & ~v81;
    uint64_t v83 = (char *)swift_allocObject(&unk_1000FC130, v82 + v93, v78 | v81 | 7);
    *((void *)v83 + 2) = 0LL;
    *((void *)v83 + 3) = 0LL;
    *((void *)v83 + 4) = v72;
    (*(void (**)(char *, char *, uint64_t))(v73 + 32))(&v83[v79], v74, v75);
    uint64_t v84 = v101;
    uint64_t v85 = v102;
    *(void *)&v83[v80] = v101;
    (*(void (**)(char *, char *, uint64_t))(v76 + 32))(&v83[v82], v77, v85);
    uint64_t v86 = v84;
    uint64_t v87 = sub_1000B5C50(v99, (uint64_t)&unk_100115F98, (uint64_t)v83);

    swift_release(v87);
    return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v103, v85);
  }

  else
  {
    sub_1000B0E50(v90, (uint64_t)v108);
    if (v109)
    {
      sub_1000B0EC0((uint64_t)v108, (uint64_t)v104);
      sub_10001C608((uint64_t)v108, &qword_100115F78);
      uint64_t v88 = v105;
      uint64_t v89 = v106;
      sub_10001C3FC(v104, v105);
      dispatch thunk of RecentCallProviderDelegate.didCompleteOutgoingCallRequest(for:)(v29, v88, v89);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v103, v102);
      sub_10001BFEC(v104);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v100 + 8))(v103, v102);
      sub_10001C608((uint64_t)v108, &qword_100115F78);
    }

    return v101[1](v12, v28);
  }

uint64_t sub_1000AA344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  uint64_t v7 = type metadata accessor for CallIdentifier(0LL);
  v6[5] = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000AA3A0, 0LL, 0LL);
}

uint64_t sub_1000AA3A0()
{
  if (qword_100112380 != -1) {
    swift_once(&qword_100112380, sub_100080AF0);
  }
  uint64_t v1 = (void *)qword_10011A2F0;
  v0[6] = qword_10011A2F0;
  v1;
  uint64_t v2 = RecentsCallItem.tuHandles.getter();
  v0[7] = v2;
  id v5 = (char *)&dword_100115FC0 + dword_100115FC0;
  uint64_t v3 = (void *)swift_task_alloc(unk_100115FC4);
  v0[8] = v3;
  void *v3 = v0;
  v3[1] = sub_1000AA458;
  return ((uint64_t (*)(void, uint64_t, void))v5)(v0[5], v2, v0[4]);
}

uint64_t sub_1000AA458()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 64);
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1000AA534;
  }

  else
  {
    uint64_t v5 = *(void *)(v2 + 56);
    sub_10001C644(*(void *)(v2 + 40), type metadata accessor for CallIdentifier);
    swift_bridgeObjectRelease(v5);
    uint64_t v4 = sub_1000AA4D8;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000AA4D8()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);

  sub_10002D35C(0);
  sub_1000AACD4(v3, v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AA534()
{
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  swift_bridgeObjectRelease(*(void *)(v0 + 56));

  sub_1000AACD4(v4, v3);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AA590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  uint64_t v5 = type metadata accessor for OutgoingCallType(0LL);
  v4[7] = v5;
  v4[8] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000AA5F0, 0LL, 0LL);
}

uint64_t sub_1000AA5F0()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[4];
  uint64_t v6 = type metadata accessor for CallType(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(v2, v3, v6);
  swift_storeEnumTagMultiPayload(v2, v1, 1LL);
  v0[2] = v4;
  uint64_t v7 = (void *)swift_task_alloc(48LL);
  v0[9] = v7;
  v7[2] = v0 + 2;
  v7[3] = v5;
  v7[4] = v2;
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v0[10] = v8;
  uint64_t v9 = type metadata accessor for CallIdentifier(0LL);
  *uint64_t v8 = v0;
  v8[1] = sub_1000AA6E4;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)( v0[3],  0LL,  0LL,  0xD000000000000015LL,  0x80000001000D85D0LL,  sub_1000B13C0,  v7,  v9);
}

uint64_t sub_1000AA6E4()
{
  uint64_t v2 = *(void *)(*v1 + 80);
  uint64_t v3 = *v1;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    return swift_task_switch(sub_1000AA774, 0LL, 0LL);
  }
  uint64_t v5 = *(void *)(v3 + 64);
  swift_task_dealloc(*(void *)(v3 + 72));
  sub_10001C644(v5, type metadata accessor for OutgoingCallType);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_1000AA774()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_task_dealloc(*(void *)(v0 + 72));
  sub_10001C644(v1, type metadata accessor for OutgoingCallType);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AA7C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = type metadata accessor for UUID(0LL);
  v6[7] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[8] = v8;
  void v6[9] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000AA824, 0LL, 0LL);
}

uint64_t sub_1000AA824()
{
  if ([*(id *)(v0 + 48) avMode] == (id)1)
  {
    if (qword_100112380 != -1) {
      swift_once(&qword_100112380, sub_100080AF0);
    }
    uint64_t v2 = *(void *)(v0 + 64);
    uint64_t v1 = *(void *)(v0 + 72);
    uint64_t v4 = *(void **)(v0 + 48);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v5 = (void *)qword_10011A2F0;
    *(void *)(v0 + 80) = qword_10011A2F0;
    id v6 = v5;
    id v7 = [v4 uuid];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v7);

    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v10 =  objc_msgSend( (id)objc_opt_self(TUJoinContinuityConversationRequest, v9),  "requestForJoinWithUUID:isAudioEnabled:isVideoEnabled:",  isa,  1,  0);
    *(void *)(v0 + 88) = v10;

    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    *(void *)(v0 + 24) = v6;
    uint64_t v11 = swift_task_alloc(32LL);
    *(void *)(v0 + 96) = v11;
    *(void *)(v11 + 16) = v0 + 24;
    *(void *)(v11 + 24) = v10;
    id v12 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
    *(void *)(v0 + 104) = v12;
    void *v12 = v0;
    v12[1] = sub_1000AAAB4;
    uint64_t v13 = (char *)&type metadata for () + 8;
    uint64_t v14 = sub_1000B1844;
  }

  else
  {
    if (qword_100112380 != -1) {
      swift_once(&qword_100112380, sub_100080AF0);
    }
    uint64_t v16 = *(void *)(v0 + 64);
    uint64_t v15 = *(void *)(v0 + 72);
    uint64_t v18 = *(void **)(v0 + 48);
    uint64_t v17 = *(void *)(v0 + 56);
    uint64_t v19 = (void *)qword_10011A2F0;
    *(void *)(v0 + 120) = qword_10011A2F0;
    id v20 = v19;
    id v21 = [v18 uuid];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v21);

    Class v22 = UUID._bridgeToObjectiveC()().super.isa;
    id v24 =  objc_msgSend( (id)objc_opt_self(TUJoinContinuityConversationRequest, v23),  "requestForStagingAreaWithUUID:",  v22);
    *(void *)(v0 + 128) = v24;

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    *(void *)(v0 + 16) = v20;
    uint64_t v11 = swift_task_alloc(32LL);
    *(void *)(v0 + 136) = v11;
    *(void *)(v11 + 16) = v0 + 16;
    *(void *)(v11 + 24) = v24;
    id v12 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
    *(void *)(v0 + 144) = v12;
    void *v12 = v0;
    v12[1] = sub_1000AABC4;
    uint64_t v13 = (char *)&type metadata for () + 8;
    uint64_t v14 = sub_1000B1404;
  }

  return withCheckedThrowingContinuation<A>(isolation:function:_:)( v12,  0LL,  0LL,  0xD000000000000021LL,  0x80000001000DCE10LL,  v14,  v11,  v13);
}

uint64_t sub_1000AAAB4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 104);
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1000AAB6C;
  }

  else
  {
    swift_task_dealloc(*(void *)(v2 + 96));
    uint64_t v4 = sub_1000AAB20;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000AAB20()
{
  uint64_t v1 = *(void **)(v0 + 80);

  uint64_t v2 = *(void *)(v0 + 72);
  sub_1000AACD4(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AAB6C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void **)(v0 + 80);

  swift_task_dealloc(v1);
  uint64_t v3 = *(void *)(v0 + 72);
  sub_1000AACD4(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AABC4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 144);
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1000AAC7C;
  }

  else
  {
    swift_task_dealloc(*(void *)(v2 + 136));
    uint64_t v4 = sub_1000AAC30;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000AAC30()
{
  uint64_t v1 = *(void **)(v0 + 120);

  uint64_t v2 = *(void *)(v0 + 72);
  sub_1000AACD4(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AAC7C()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void **)(v0 + 120);

  swift_task_dealloc(v1);
  uint64_t v3 = *(void *)(v0 + 72);
  sub_1000AACD4(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AACD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v15, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = result + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate;
    swift_beginAccess( result + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate,  v12,  0LL,  0LL);
    sub_1000B0E50(v6, (uint64_t)v13);

    if (v14)
    {
      sub_1000B0EC0((uint64_t)v13, (uint64_t)v9);
      sub_10001C608((uint64_t)v13, &qword_100115F78);
      uint64_t v7 = v10;
      uint64_t v8 = v11;
      sub_10001C3FC(v9, v10);
      dispatch thunk of RecentCallProviderDelegate.didCompleteOutgoingCallRequest(for:)(a2, v7, v8);
      return sub_10001BFEC(v9);
    }

    else
    {
      return sub_10001C608((uint64_t)v13, &qword_100115F78);
    }
  }

  return result;
}

uint64_t sub_1000AADBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[10] = a6;
  v7[11] = a7;
  v7[8] = a4;
  void v7[9] = a5;
  uint64_t v8 = type metadata accessor for CallIdentifier(0LL);
  v7[12] = v8;
  v7[13] = swift_task_alloc((*(void *)(*(void *)(v8 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000AAE1C, 0LL, 0LL);
}

uint64_t sub_1000AAE1C()
{
  if (qword_100112380 != -1) {
    swift_once(&qword_100112380, sub_100080AF0);
  }
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = (void *)qword_10011A2F0;
  v0[14] = qword_10011A2F0;
  uint64_t v4 = sub_100018A04(&qword_1001142B0);
  uint64_t inited = swift_initStackObject(v4, v0 + 2);
  *(_OWORD *)(inited + 16) = xmmword_1000C3FD0;
  id v6 = v3;
  id v7 = [v1 anonym];
  *(void *)(inited + 32) = v7;
  specialized Array._endMutation()(v7);
  uint64_t v8 = sub_1000B1614( inited,  &qword_100112948,  &OBJC_CLASS___TUContinuityHandleAnonym_ptr,  (unint64_t *)&unk_100112950,  &qword_100115FC8);
  v0[15] = v8;
  swift_bridgeObjectRelease(inited);
  v0[7] = v6;
  uint64_t v9 = (void *)swift_task_alloc(48LL);
  v0[16] = v9;
  void v9[2] = v0 + 7;
  void v9[3] = v8;
  v9[4] = v2;
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v0[17] = v10;
  void *v10 = v0;
  v10[1] = sub_1000AAF94;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)( v0[13],  0LL,  0LL,  0xD000000000000015LL,  0x80000001000D85D0LL,  sub_1000B140C,  v9,  v0[12]);
}

uint64_t sub_1000AAF94()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 136LL);
  *(void *)(*(void *)v1 + 144LL) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1000AB080;
  }

  else
  {
    uint64_t v5 = v2[15];
    uint64_t v6 = v2[16];
    uint64_t v9 = v2 + 13;
    uint64_t v7 = v2[13];
    uint64_t v8 = (void *)v9[1];
    swift_bridgeObjectRelease(v5);

    swift_task_dealloc(v6);
    sub_10001C644(v7, type metadata accessor for CallIdentifier);
    uint64_t v4 = sub_1000AB028;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000AB028()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  sub_10002D35C(0);
  sub_1000AACD4(v3, v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AB080()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void **)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  swift_bridgeObjectRelease(*(void *)(v0 + 120));

  swift_task_dealloc(v1);
  sub_1000AACD4(v5, v4);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1000AB118(uint64_t a1, uint64_t a2)
{
  v4.receiver = v2;
  v4.super_class = (Class)_s19RecentCallsProviderCMa(a1, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t _s19RecentCallsProviderCMa(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider, a2);
}

uint64_t sub_1000AB21C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate;
  swift_beginAccess(v3, v5, 0LL, 0LL);
  return sub_1000B0E50(v3, a1);
}

double sub_1000AB270(uint64_t a1)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate;
  swift_beginAccess(v3, v5, 33LL, 0LL);
  sub_1000B0E08(a1, v3);
  *(void *)&double result = swift_endAccess(v5).n128_u64[0];
  return result;
}

uint64_t (*sub_1000AB2CC(uint64_t a1))(void)
{
  return j_j__swift_endAccess;
}

uint64_t sub_1000AB314()
{
  uint64_t v1 = (uint64_t *)(*v0
                 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_presentScreenTimeShield);
  swift_beginAccess(v1, v4, 0LL, 0LL);
  uint64_t v2 = *v1;
  sub_10002AE44(*v1, v1[1]);
  return v2;
}

uint64_t sub_1000AB370(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(*v2
                 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_presentScreenTimeShield);
  swift_beginAccess(v5, v9, 1LL, 0LL);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_10001C08C(v6, v7);
}

uint64_t (*sub_1000AB3D0(uint64_t a1))(void)
{
  return j__swift_endAccess;
}

uint64_t sub_1000AB418()
{
  id v1 = *(id *)(*v0 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_recentsQueue);
  sub_100018A04(&qword_100115F70);
  OS_dispatch_queue.sync<A>(execute:)(sub_1000AB554);

  return v3;
}

uint64_t sub_1000AB48C(uint64_t a1)
{
  return sub_1000A9ADC(a1, 0LL, 1);
}

uint64_t sub_1000AB4B4(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1000A9ADC(a1, a2, a3 & 1);
}

uint64_t sub_1000AB4D8()
{
  id v1 = *(id *)(*v0 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_recentsQueue);
  sub_100018A04((uint64_t *)&unk_100115F80);
  OS_dispatch_queue.sync<A>(execute:)(sub_1000B0E98);

  return v3;
}

void sub_1000AB554(void *a1@<X8>)
{
}

uint64_t sub_1000AB56C@<X0>(id *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v37 = a4;
  uint64_t v7 = type metadata accessor for RecentsCallHandleType(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v36 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  id v12 = (char *)&v36 - v11;
  id v13 = *a1;
  uint64_t v14 = (char *)[*a1 type];
  else {
    uint64_t v15 = (unsigned int *)*(&off_1000FC288 + (void)(v14 - 1));
  }
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v12, *v15, v7);
  id v16 = [v13 value];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  uint64_t v19 = v18;

  if (*(void *)(a2 + 16) && (unint64_t v20 = sub_10002FB98(v17, v19), (v21 & 1) != 0))
  {
    id v22 = *(id *)(*(void *)(a2 + 56) + 8 * v20);
    swift_bridgeObjectRelease(v19);
  }

  else
  {
    swift_bridgeObjectRelease(v19);
    sub_10001C5D0(0LL, &qword_100116048, &OBJC_CLASS___CNMutableContact_ptr);
    uint64_t v23 = CNMutableContact.init(handle:)(v13);
    if (!v23) {
      goto LABEL_12;
    }
    id v22 = (id)v23;
  }

  id v24 = v22;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v24);
  unint64_t v26 = *(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v25 = *(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v26 >= v25 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1LL);
  }
  uint64_t v27 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v24);
  specialized Array._endMutation()(v27);

LABEL_12:
  uint64_t v28 = v36;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v36, v12, v7);
  id v29 = [v13 value];
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  uint64_t v32 = v31;

  uint64_t v33 = v37;
  RecentsCallHandle.init(type:value:)(v28, v30, v32);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  uint64_t v34 = type metadata accessor for RecentsCallHandle(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56LL))( v33,  0LL,  1LL,  v34);
}

uint64_t sub_1000AB7E4@<X0>(void *a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = sub_100018A04(&qword_100116058);
  uint64_t v33 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  objc_super v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_100018A04(&qword_100116040);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for RecentsCallHandle(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v31 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = v4;
  uint64_t v13 = *v1;
  uint64_t v12 = v1[1];
  uint64_t v14 = v1[2];
  int64_t v15 = v1[3];
  unint64_t v16 = v1[4];
  if (v16)
  {
    uint64_t v17 = (v16 - 1) & v16;
    unint64_t v18 = __clz(__rbit64(v16)) | (v15 << 6);
LABEL_3:
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))( v7,  *(void *)(v13 + 48) + *(void *)(v9 + 72) * v18,  v8);
    uint64_t v19 = 0LL;
    goto LABEL_4;
  }

  int64_t v26 = v15 + 1;
  if (__OFADD__(v15, 1LL))
  {
LABEL_32:
    __break(1u);
    return result;
  }

  int64_t v27 = (unint64_t)(v14 + 64) >> 6;
  if (v26 >= v27)
  {
    uint64_t v17 = 0LL;
    uint64_t v19 = 1LL;
    goto LABEL_4;
  }

  unint64_t v28 = *(void *)(v12 + 8 * v26);
  if (v28)
  {
LABEL_12:
    uint64_t v17 = (v28 - 1) & v28;
    unint64_t v18 = __clz(__rbit64(v28)) + (v26 << 6);
    int64_t v15 = v26;
    goto LABEL_3;
  }

  int64_t v29 = v15 + 2;
  if (v15 + 2 >= v27) {
    goto LABEL_28;
  }
  unint64_t v28 = *(void *)(v12 + 8 * v29);
  if (v28)
  {
LABEL_16:
    int64_t v26 = v29;
    goto LABEL_12;
  }

  if (v15 + 3 >= v27) {
    goto LABEL_29;
  }
  unint64_t v28 = *(void *)(v12 + 8 * (v15 + 3));
  if (v28)
  {
    int64_t v26 = v15 + 3;
    goto LABEL_12;
  }

  int64_t v29 = v15 + 4;
  if (v15 + 4 < v27)
  {
    unint64_t v28 = *(void *)(v12 + 8 * v29);
    if (v28) {
      goto LABEL_16;
    }
    int64_t v26 = v15 + 5;
    if (v15 + 5 < v27)
    {
      unint64_t v28 = *(void *)(v12 + 8 * v26);
      if (v28) {
        goto LABEL_12;
      }
      int64_t v26 = v27 - 1;
      int64_t v30 = v15 + 6;
      while (v27 != v30)
      {
        unint64_t v28 = *(void *)(v12 + 8 * v30++);
        if (v28)
        {
          int64_t v26 = v30 - 1;
          goto LABEL_12;
        }
      }

uint64_t sub_1000ABAFC(uint64_t a1)
{
  uint64_t v1 = a1 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate;
  swift_beginAccess( a1 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_delegate,  v8,  0LL,  0LL);
  sub_1000B0E50(v1, (uint64_t)v9);
  if (!v10) {
    return sub_10001C608((uint64_t)v9, &qword_100115F78);
  }
  sub_1000B0EC0((uint64_t)v9, (uint64_t)v5);
  sub_10001C608((uint64_t)v9, &qword_100115F78);
  uint64_t v2 = v6;
  uint64_t v3 = v7;
  sub_10001C3FC(v5, v6);
  dispatch thunk of RecentCallProviderDelegate.recentCallsDidChange()(v2, v3);
  return sub_10001BFEC(v5);
}

uint64_t sub_1000ABBB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000ABC84(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000ABBCC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000ABDE0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000ABBE8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000ABF48(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1000ABC04(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000AC0D0(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1000ABC20(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000AC23C(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1000ABC3C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000AC3B8(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1000ABC58(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000AC514( a1,  a2,  a3,  (void *)*v3,  (uint64_t *)&unk_100116060,  (uint64_t (*)(void))&type metadata accessor for RecentsCallItem);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1000ABC84(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100018A04(&qword_1001159A8);
    uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  int64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_1000ABDE0(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100018A04((uint64_t *)&unk_1001128B0);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  int64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_1000ABF48(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100018A04(&qword_1001128A0);
    uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  unint64_t v14 = (unint64_t)(v11 + 4);
  unint64_t v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 16 * v8) {
      memmove(v11 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_30;
  }

  if (v15 >= v14 + 16 * v8 || v14 >= v15 + 16 * v8)
  {
    sub_100018A04(&qword_1001128A8);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_1000AC0D0(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100018A04((uint64_t *)&unk_1001160C0);
    uint64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 1;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 5);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8]) {
      memmove(v14, v15, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_1000AC23C(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100018A04(&qword_100112890);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_1000AC3A4(char a1, int64_t a2, char a3, void *a4)
{
  return sub_1000AC514(a1, a2, a3, a4, &qword_1001128C8, type metadata accessor for NearbyConversationViewModel);
}

uint64_t sub_1000AC3B8(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100018A04(&qword_100116070);
    uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_1000AC514( char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    unint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_100018A04(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  unint64_t v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  size_t v19 = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v19 - v17 == 0x8000000000000000LL && v15 == -1) {
    goto LABEL_34;
  }
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  uint64_t v21 = a6(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  id v24 = (char *)v18 + v23;
  unint64_t v25 = (char *)a4 + v23;
  if ((a1 & 1) != 0)
  {
    if (v18 < a4 || v24 >= &v25[*(void *)(v22 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v24, v25, v11, v21);
    }

    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v24);
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v26 = *(void *)(v22 + 72) * v11;
  int64_t v27 = &v24[v26];
  unint64_t v28 = (unint64_t)&v25[v26];
  if (v25 >= v27 || (unint64_t)v24 >= v28)
  {
    swift_arrayInitWithCopy(v24);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v18;
  }

uint64_t sub_1000AC6F4(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v16 = a1;
    }
    else {
      uint64_t v16 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (v4 < 0) {
    uint64_t v17 = *v1;
  }
  else {
    uint64_t v17 = v4 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*v1);
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_29;
  }
LABEL_5:
  uint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *uint64_t v1 = v4;
  uint64_t v5 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000LL) == 0 && (v4 & 0x4000000000000000LL) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1LL;
  }

  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1LL, v4);
    swift_bridgeObjectRelease(*v1);
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
LABEL_15:
    uint64_t result = sub_1000AF468(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0) {
      uint64_t v18 = v4;
    }
    else {
      uint64_t v18 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }

  if (v11 < 1) {
    goto LABEL_19;
  }
  uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  BOOL v13 = __OFADD__(v12, v11);
  uint64_t v14 = v12 + v11;
  if (!v13)
  {
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8LL) + 0x10) = v14;
LABEL_19:
    uint64_t v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }

  __break(1u);
  return result;
}

void sub_1000AC8AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_100019D10(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

uint64_t sub_1000ACA14(Swift::Int *a1, void *a2, unint64_t *a3, void *a4, uint64_t *a5)
{
  uint64_t v9 = v5;
  uint64_t v12 = *v5;
  if ((*v5 & 0xC000000000000001LL) != 0)
  {
    if (v12 < 0) {
      uint64_t v13 = *v5;
    }
    else {
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v5);
    id v14 = a2;
    uint64_t v15 = __CocoaSet.member(for:)();

    if (v15)
    {
      swift_bridgeObjectRelease(v12);

      uint64_t v42 = v15;
      uint64_t v16 = sub_10001C5D0(0LL, a3, a4);
      swift_unknownObjectRetain(v15);
      swift_dynamicCast(&v43, &v42, (char *)&type metadata for Swift.AnyObject + 8, v16, 7LL);
      *a1 = v43;
      swift_unknownObjectRelease(v15);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v13);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v29 = sub_1000AD2B0(v13, result + 1, a5, a3, a4);
    Swift::Int v43 = v29;
    unint64_t v30 = *(void *)(v29 + 16);
    if (*(void *)(v29 + 24) <= v30)
    {
      uint64_t v36 = v30 + 1;
      id v37 = v14;
      sub_1000AD4BC(v36, a5);
      uint64_t v31 = v43;
    }

    else
    {
      uint64_t v31 = v29;
      id v32 = v14;
    }

    sub_1000ADD5C((uint64_t)v14, v31);
    uint64_t v38 = *v9;
    *uint64_t v9 = v31;
    swift_bridgeObjectRelease(v38);
    *a1 = (Swift::Int)v14;
  }

  else
  {
    Swift::Int v18 = *(void *)(v12 + 40);
    swift_bridgeObjectRetain(v12);
    Swift::Int v19 = NSObject._rawHashValue(seed:)(v18);
    uint64_t v20 = -1LL << *(_BYTE *)(v12 + 32);
    unint64_t v21 = v19 & ~v20;
    int v39 = a4;
    if (((*(void *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v21) & 1) != 0)
    {
      sub_10001C5D0(0LL, a3, a4);
      id v22 = *(id *)(*(void *)(v12 + 48) + 8 * v21);
      char v23 = static NSObject.== infix(_:_:)();

      if ((v23 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v12);
        int64_t v27 = *(void **)(*(void *)(*v9 + 48) + 8 * v21);
        *a1 = (Swift::Int)v27;
        id v28 = v27;
        return 0LL;
      }

      uint64_t v24 = ~v20;
      while (1)
      {
        unint64_t v21 = (v21 + 1) & v24;
        if (((*(void *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v21) & 1) == 0) {
          break;
        }
        id v25 = *(id *)(*(void *)(v12 + 48) + 8 * v21);
        char v26 = static NSObject.== infix(_:_:)();

        if ((v26 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v12);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v9);
    Swift::Int v43 = *v9;
    *uint64_t v9 = 0x8000000000000000LL;
    id v34 = a2;
    sub_1000ADDDC((uint64_t)v34, v21, isUniquelyReferenced_nonNull_native, a5, a3, v39);
    uint64_t v35 = *v9;
    *uint64_t v9 = v43;
    swift_bridgeObjectRelease(v35);
    *a1 = (Swift::Int)v34;
  }

  return 1LL;
}

uint64_t sub_1000ACCDC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40LL);
  uint64_t v13 = sub_10001949C(&qword_1001136D0, v12, (uint64_t)&protocol conformance descriptor for UUID);
  swift_bridgeObjectRetain(v10);
  uint64_t v37 = a2;
  uint64_t v14 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v13);
  uint64_t v15 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v16 = v14 & ~v15;
  uint64_t v17 = v10;
  uint64_t v18 = v10 + 56;
  if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
  {
    uint64_t v33 = v3;
    uint64_t v34 = a1;
    uint64_t v35 = ~v15;
    uint64_t v36 = v7;
    uint64_t v19 = *(void *)(v7 + 72);
    uint64_t v20 = *(void (**)(void, void, void))(v7 + 16);
    while (1)
    {
      uint64_t v21 = v17;
      id v22 = v20;
      v20(v9, *(void *)(v17 + 48) + v19 * v16, v6);
      uint64_t v23 = sub_10001949C( (unint64_t *)&qword_100112E70,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v37, v6, v23);
      id v25 = *(void (**)(char *, uint64_t))(v36 + 8);
      v25(v9, v6);
      if ((v24 & 1) != 0) {
        break;
      }
      unint64_t v16 = (v16 + 1) & v35;
      uint64_t v17 = v21;
      uint64_t v20 = v22;
      if (((*(void *)(v18 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease(v21);
        unint64_t v3 = v33;
        a1 = v34;
        uint64_t v26 = v36;
        goto LABEL_7;
      }
    }

    __n128 v32 = swift_bridgeObjectRelease(v21);
    ((void (*)(uint64_t, uint64_t, __n128))v25)(v37, v6, v32);
    v22(v34, *(void *)(*v33 + 48LL) + v19 * v16, v6);
    return 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v20 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v26 = v7;
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v28 = v37;
    v20(v9, v37, v6);
    uint64_t v38 = *v3;
    void *v3 = 0x8000000000000000LL;
    sub_1000ADF6C((uint64_t)v9, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    void *v3 = v38;
    __n128 v30 = swift_bridgeObjectRelease(v29);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(v26 + 32))(a1, v28, v6, v30);
    return 1LL;
  }

uint64_t sub_1000ACF38(Swift::UInt *a1, Swift::UInt a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)(v14, *(void *)(*v2 + 40LL));
  Hasher._combine(_:)(a2);
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1LL << *(_BYTE *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
    v14[0] = *v2;
    void *v2 = 0x8000000000000000LL;
    sub_1000AE1C0(a2, v8, isUniquelyReferenced_nonNull_native);
    uint64_t v13 = *v2;
    void *v2 = v14[0];
    swift_bridgeObjectRelease(v13);
    uint64_t result = 1LL;
    goto LABEL_8;
  }

  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }

    while (*(void *)(v9 + 8 * v8) != a2);
  }

  uint64_t result = 0LL;
  a2 = *(void *)(*(void *)(*v2 + 48LL) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_1000AD054(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for RecentsCallHandle(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40LL);
  uint64_t v13 = sub_10001949C(&qword_100116028, v12, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
  swift_bridgeObjectRetain(v10);
  uint64_t v37 = a2;
  uint64_t v14 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v13);
  uint64_t v15 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v16 = v14 & ~v15;
  uint64_t v17 = v10;
  uint64_t v18 = v10 + 56;
  if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
  {
    uint64_t v33 = v3;
    uint64_t v34 = a1;
    uint64_t v35 = ~v15;
    uint64_t v36 = v7;
    uint64_t v19 = *(void *)(v7 + 72);
    uint64_t v20 = *(void (**)(void, void, void))(v7 + 16);
    while (1)
    {
      uint64_t v21 = v17;
      id v22 = v20;
      v20(v9, *(void *)(v17 + 48) + v19 * v16, v6);
      uint64_t v23 = sub_10001949C( &qword_100116030,  (uint64_t (*)(uint64_t))&type metadata accessor for RecentsCallHandle,  (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
      char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v37, v6, v23);
      id v25 = *(void (**)(char *, uint64_t))(v36 + 8);
      v25(v9, v6);
      if ((v24 & 1) != 0) {
        break;
      }
      unint64_t v16 = (v16 + 1) & v35;
      uint64_t v17 = v21;
      uint64_t v20 = v22;
      if (((*(void *)(v18 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease(v21);
        unint64_t v3 = v33;
        a1 = v34;
        uint64_t v26 = v36;
        goto LABEL_7;
      }
    }

    __n128 v32 = swift_bridgeObjectRelease(v21);
    ((void (*)(uint64_t, uint64_t, __n128))v25)(v37, v6, v32);
    v22(v34, *(void *)(*v33 + 48LL) + v19 * v16, v6);
    return 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v20 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v26 = v7;
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v28 = v37;
    v20(v9, v37, v6);
    uint64_t v38 = *v3;
    void *v3 = 0x8000000000000000LL;
    sub_1000AE30C((uint64_t)v9, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    void *v3 = v38;
    __n128 v30 = swift_bridgeObjectRelease(v29);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(v26 + 32))(a1, v28, v6, v30);
    return 1LL;
  }

Swift::Int sub_1000AD2B0(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, void *a5)
{
  if (a2)
  {
    sub_100018A04(a3);
    uint64_t v10 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v29 = v10;
    uint64_t v11 = __CocoaSet.makeIterator()(a1);
    uint64_t v12 = __CocoaSet.Iterator.next()(v11);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_10001C5D0(0LL, a4, a5);
      do
      {
        uint64_t v27 = v13;
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v14, 7LL);
        uint64_t v10 = v29;
        unint64_t v22 = *(void *)(v29 + 16);
        if (*(void *)(v29 + 24) <= v22)
        {
          sub_1000AD4BC(v22 + 1, a3);
          uint64_t v10 = v29;
        }

        uint64_t v15 = v28;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v10 + 40));
        uint64_t v17 = v10 + 56;
        uint64_t v18 = -1LL << *(_BYTE *)(v10 + 32);
        unint64_t v19 = result & ~v18;
        unint64_t v20 = v19 >> 6;
        if (((-1LL << v19) & ~*(void *)(v10 + 56 + 8 * (v19 >> 6))) != 0)
        {
          unint64_t v21 = __clz(__rbit64((-1LL << v19) & ~*(void *)(v10 + 56 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v23 = 0;
          unint64_t v24 = (unint64_t)(63 - v18) >> 6;
          do
          {
            if (++v20 == v24 && (v23 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v25 = v20 == v24;
            if (v20 == v24) {
              unint64_t v20 = 0LL;
            }
            v23 |= v25;
            uint64_t v26 = *(void *)(v17 + 8 * v20);
          }

          while (v26 == -1);
          unint64_t v21 = __clz(__rbit64(~v26)) + (v20 << 6);
        }

        *(void *)(v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v21;
        *(void *)(*(void *)(v10 + 48) + 8 * v21) = v15;
        ++*(void *)(v10 + 16);
        uint64_t v13 = __CocoaSet.Iterator.next()(result);
      }

      while (v13);
    }

    swift_release(v11);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  return v10;
}

Swift::Int sub_1000AD4B0(uint64_t a1)
{
  return sub_1000AD4BC(a1, &qword_1001160D0);
}

Swift::Int sub_1000AD4BC(uint64_t a1, uint64_t *a2)
{
  unint64_t v3 = v2;
  uint64_t v4 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(void *)(*v2 + 24);
  }
  sub_100018A04(a2);
  uint64_t v6 = static _SetStorage.resize(original:capacity:move:)(v4, v5, 1LL);
  uint64_t v7 = v6;
  if (*(void *)(v4 + 16))
  {
    uint64_t v31 = v3;
    uint64_t v8 = 1LL << *(_BYTE *)(v4 + 32);
    uint64_t v9 = (void *)(v4 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1LL << v8);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v4 + 56);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 56;
    Swift::Int result = swift_retain(v4);
    int64_t v15 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v15 << 6);
      }

      else
      {
        int64_t v19 = v15 + 1;
        if (__OFADD__(v15, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v19 >= v12) {
          goto LABEL_36;
        }
        unint64_t v20 = v9[v19];
        ++v15;
        if (!v20)
        {
          int64_t v15 = v19 + 1;
          if (v19 + 1 >= v12) {
            goto LABEL_36;
          }
          unint64_t v20 = v9[v15];
          if (!v20)
          {
            int64_t v15 = v19 + 2;
            if (v19 + 2 >= v12) {
              goto LABEL_36;
            }
            unint64_t v20 = v9[v15];
            if (!v20)
            {
              int64_t v21 = v19 + 3;
              if (v21 >= v12)
              {
LABEL_36:
                swift_release(v4);
                unint64_t v3 = v31;
                uint64_t v30 = 1LL << *(_BYTE *)(v4 + 32);
                if (v30 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v9 = -1LL << v30;
                }
                *(void *)(v4 + 16) = 0LL;
                break;
              }

              unint64_t v20 = v9[v21];
              if (!v20)
              {
                while (1)
                {
                  int64_t v15 = v21 + 1;
                  if (__OFADD__(v21, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v15 >= v12) {
                    goto LABEL_36;
                  }
                  unint64_t v20 = v9[v15];
                  ++v21;
                  if (v20) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v15 = v21;
            }
          }
        }

Swift::Int sub_1000AD754(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100018A04((uint64_t *)&unk_100116080);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  Swift::Int v6 = result;
  if (*(void *)(v3 + 16))
  {
    uint64_t v29 = v2;
    int64_t v7 = 0LL;
    uint64_t v8 = (void *)(v3 + 56);
    uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v3 + 56);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    Swift::Int v13 = result + 56;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v7 << 6);
      }

      else
      {
        int64_t v17 = v7 + 1;
        if (__OFADD__(v7, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v17 >= v12) {
          goto LABEL_36;
        }
        unint64_t v18 = v8[v17];
        ++v7;
        if (!v18)
        {
          int64_t v7 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_36;
          }
          unint64_t v18 = v8[v7];
          if (!v18)
          {
            int64_t v7 = v17 + 2;
            if (v17 + 2 >= v12) {
              goto LABEL_36;
            }
            unint64_t v18 = v8[v7];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_36:
                uint64_t v28 = 1LL << *(_BYTE *)(v3 + 32);
                if (v28 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v8 = -1LL << v28;
                }
                uint64_t v2 = v29;
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v7 = v19 + 1;
                  if (__OFADD__(v19, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v7 >= v12) {
                    goto LABEL_36;
                  }
                  unint64_t v18 = v8[v7];
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v7 = v19;
            }
          }
        }

void sub_1000AD9FC( uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v49 = a4;
  uint64_t v50 = a5;
  int64_t v7 = v5;
  uint64_t v48 = a2;
  uint64_t v9 = a2(0LL);
  uint64_t v47 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = *v7;
  if (*(void *)(*v7 + 24) > a1) {
    a1 = *(void *)(*v7 + 24);
  }
  sub_100018A04(a3);
  uint64_t v13 = static _SetStorage.resize(original:capacity:move:)(v12, a1, 1LL);
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_39;
  }
  uint64_t v15 = 1LL << *(_BYTE *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 56);
  uint64_t v46 = (void *)(v12 + 56);
  if (v15 < 64) {
    uint64_t v17 = ~(-1LL << v15);
  }
  else {
    uint64_t v17 = -1LL;
  }
  unint64_t v18 = v17 & v16;
  uint64_t v44 = v7;
  int64_t v45 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v19 = v13 + 56;
  __n128 v20 = swift_retain(v12);
  int64_t v21 = 0LL;
  while (1)
  {
    if (v18)
    {
      unint64_t v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_26;
    }

    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1LL))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return;
    }

    if (v25 >= v45) {
      goto LABEL_35;
    }
    unint64_t v26 = v46[v25];
    ++v21;
    if (!v26)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_35;
      }
      unint64_t v26 = v46[v21];
      if (!v26)
      {
        int64_t v21 = v25 + 2;
        if (v25 + 2 >= v45) {
          goto LABEL_35;
        }
        unint64_t v26 = v46[v21];
        if (!v26) {
          break;
        }
      }
    }

unint64_t sub_1000ADD5C(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_1000ADDDC(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5, void *a6)
{
  uint64_t v9 = v6;
  unint64_t v12 = *(void *)(*v6 + 16);
  unint64_t v13 = *(void *)(*v6 + 24);
  if (v13 > v12 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v14 = v12 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1000AD4BC(v14, a4);
  }

  else
  {
    if (v13 > v12)
    {
      sub_1000AE560(a4);
      goto LABEL_14;
    }

    sub_1000AEAB8(v14, a4);
  }

  uint64_t v15 = *v6;
  Swift::Int v16 = NSObject._rawHashValue(seed:)(*(void *)(*v6 + 40));
  uint64_t v17 = -1LL << *(_BYTE *)(v15 + 32);
  a2 = v16 & ~v17;
  if (((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v18 = sub_10001C5D0(0LL, a5, a6);
    id v19 = *(id *)(*(void *)(v15 + 48) + 8 * a2);
    char v20 = static NSObject.== infix(_:_:)();

    if ((v20 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v18);
      __break(1u);
    }

    else
    {
      uint64_t v21 = ~v17;
      while (1)
      {
        a2 = (a2 + 1) & v21;
        if (((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        id v22 = *(id *)(*(void *)(v15 + 48) + 8 * a2);
        char v23 = static NSObject.== infix(_:_:)();

        if ((v23 & 1) != 0) {
          goto LABEL_13;
        }
      }
    }
  }

uint64_t sub_1000ADF6C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v30 = a1;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  uint64_t v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1000AD9FC( v12,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t *)&unk_100116090,  &qword_1001136D0,  (uint64_t)&protocol conformance descriptor for UUID);
  }

  else
  {
    if (v11 > v10)
    {
      sub_1000AE894((uint64_t (*)(void))&type metadata accessor for UUID, (uint64_t *)&unk_100116090);
      goto LABEL_12;
    }

    sub_1000AEFA4( v12,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t *)&unk_100116090,  &qword_1001136D0,  (uint64_t)&protocol conformance descriptor for UUID);
  }

  uint64_t v13 = *v3;
  uint64_t v14 = *(void *)(*v3 + 40);
  uint64_t v15 = sub_10001949C( &qword_1001136D0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  uint64_t v17 = -1LL << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v18 = ~v17;
    uint64_t v19 = *(void *)(v7 + 72);
    char v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(void *)(v13 + 48) + v19 * a2, v6);
      uint64_t v21 = sub_10001949C( (unint64_t *)&qword_100112E70,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v18;
    }

    while (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

uint64_t sub_1000AE1C0(uint64_t result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1000AD754(v8);
  }

  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_1000AE700();
      goto LABEL_14;
    }

    sub_1000AED2C(v8);
  }

  uint64_t v9 = *v3;
  Hasher.init(_seed:)(v18, *(void *)(*v3 + 40));
  Hasher._combine(_:)(v5);
  uint64_t result = Hasher._finalize()();
  uint64_t v10 = -1LL << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v9 + 48);
    if (*(void *)(v11 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for PressType(0LL);
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }

    else
    {
      uint64_t v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v11 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }

uint64_t sub_1000AE30C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v30 = a1;
  uint64_t v6 = type metadata accessor for RecentsCallHandle(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  uint64_t v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1000AD9FC( v12,  (uint64_t (*)(uint64_t))&type metadata accessor for RecentsCallHandle,  &qword_100116038,  &qword_100116028,  (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
  }

  else
  {
    if (v11 > v10)
    {
      sub_1000AE894((uint64_t (*)(void))&type metadata accessor for RecentsCallHandle, &qword_100116038);
      goto LABEL_12;
    }

    sub_1000AEFA4( v12,  (uint64_t (*)(uint64_t))&type metadata accessor for RecentsCallHandle,  &qword_100116038,  &qword_100116028,  (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
  }

  uint64_t v13 = *v3;
  uint64_t v14 = *(void *)(*v3 + 40);
  uint64_t v15 = sub_10001949C( &qword_100116028,  (uint64_t (*)(uint64_t))&type metadata accessor for RecentsCallHandle,  (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
  uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  uint64_t v17 = -1LL << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v18 = ~v17;
    uint64_t v19 = *(void *)(v7 + 72);
    char v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(void *)(v13 + 48) + v19 * a2, v6);
      uint64_t v21 = sub_10001949C( &qword_100116030,  (uint64_t (*)(uint64_t))&type metadata accessor for RecentsCallHandle,  (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v18;
    }

    while (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

id sub_1000AE560(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_100018A04(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = static _SetStorage.copy(original:)(*v1);
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v3);
    uint64_t *v2 = v5;
    return result;
  }

  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1LL << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  int64_t v10 = 0LL;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }

    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }

void *sub_1000AE700()
{
  uint64_t v1 = v0;
  sub_100018A04((uint64_t *)&unk_100116080);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }

void *sub_1000AE894(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v4 = v2;
  uint64_t v5 = a1(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v27 - v7;
  sub_100018A04(a2);
  uint64_t v9 = *v2;
  uint64_t v10 = static _SetStorage.copy(original:)(*v2);
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16))
  {
    id result = (void *)swift_release(v9);
LABEL_30:
    *uint64_t v4 = v11;
    return result;
  }

  uint64_t v28 = v4;
  id result = (void *)(v10 + 56);
  uint64_t v13 = v9 + 56;
  unint64_t v14 = (unint64_t)((1LL << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  int64_t v16 = 0LL;
  *(void *)(v11 + 16) = *(void *)(v9 + 16);
  uint64_t v17 = 1LL << *(_BYTE *)(v9 + 32);
  uint64_t v18 = -1LL;
  if (v17 < 64) {
    uint64_t v18 = ~(-1LL << v17);
  }
  unint64_t v19 = v18 & *(void *)(v9 + 56);
  int64_t v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      unint64_t v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }

    int64_t v24 = v16 + 1;
    if (__OFADD__(v16, 1LL))
    {
      __break(1u);
      goto LABEL_32;
    }

    if (v24 >= v20) {
      goto LABEL_28;
    }
    unint64_t v25 = *(void *)(v13 + 8 * v24);
    ++v16;
    if (!v25)
    {
      int64_t v16 = v24 + 1;
      if (v24 + 1 >= v20) {
        goto LABEL_28;
      }
      unint64_t v25 = *(void *)(v13 + 8 * v16);
      if (!v25)
      {
        int64_t v16 = v24 + 2;
        if (v24 + 2 >= v20) {
          goto LABEL_28;
        }
        unint64_t v25 = *(void *)(v13 + 8 * v16);
        if (!v25) {
          break;
        }
      }
    }

Swift::Int sub_1000AEAB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(void *)(*v2 + 24);
  }
  sub_100018A04(a2);
  uint64_t v6 = static _SetStorage.resize(original:capacity:move:)(v4, v5, 0LL);
  uint64_t v7 = v6;
  if (!*(void *)(v4 + 16))
  {
    Swift::Int result = swift_release(v4);
LABEL_38:
    uint64_t *v3 = v7;
    return result;
  }

  uint64_t v31 = v3;
  uint64_t v8 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v9 = v4 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1LL << v8);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v4 + 56);
  int64_t v12 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v13 = v6 + 56;
  Swift::Int result = swift_retain(v4);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v18 = v17 | (v15 << 6);
      goto LABEL_27;
    }

    int64_t v19 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v19 >= v12) {
      goto LABEL_36;
    }
    unint64_t v20 = *(void *)(v9 + 8 * v19);
    ++v15;
    if (!v20)
    {
      int64_t v15 = v19 + 1;
      if (v19 + 1 >= v12) {
        goto LABEL_36;
      }
      unint64_t v20 = *(void *)(v9 + 8 * v15);
      if (!v20)
      {
        int64_t v15 = v19 + 2;
        if (v19 + 2 >= v12) {
          goto LABEL_36;
        }
        unint64_t v20 = *(void *)(v9 + 8 * v15);
        if (!v20) {
          break;
        }
      }
    }

Swift::Int sub_1000AED2C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100018A04((uint64_t *)&unk_100116080);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  Swift::Int v6 = result;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    Swift::Int *v2 = v6;
    return result;
  }

  unint64_t v28 = v2;
  int64_t v7 = 0LL;
  Swift::Int v8 = v3 + 56;
  uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  Swift::Int v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v7 << 6);
      goto LABEL_27;
    }

    int64_t v17 = v7 + 1;
    if (__OFADD__(v7, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v12) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v7;
    if (!v18)
    {
      int64_t v7 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_36;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v7);
      if (!v18)
      {
        int64_t v7 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_36;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v7);
        if (!v18) {
          break;
        }
      }
    }

void sub_1000AEFA4( uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v44 = a4;
  uint64_t v45 = a5;
  int64_t v7 = v5;
  uint64_t v43 = a2;
  uint64_t v9 = a2(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  int64_t v12 = (char *)&v40 - v11;
  uint64_t v13 = *v7;
  if (*(void *)(*v7 + 24) > a1) {
    a1 = *(void *)(*v7 + 24);
  }
  sub_100018A04(a3);
  uint64_t v14 = static _SetStorage.resize(original:capacity:move:)(v13, a1, 0LL);
  uint64_t v15 = v14;
  if (!*(void *)(v13 + 16))
  {
    swift_release(v13);
LABEL_37:
    uint64_t *v7 = v15;
    return;
  }

  uint64_t v16 = 1LL << *(_BYTE *)(v13 + 32);
  uint64_t v17 = *(void *)(v13 + 56);
  BOOL v40 = v7;
  uint64_t v41 = v13 + 56;
  if (v16 < 64) {
    uint64_t v18 = ~(-1LL << v16);
  }
  else {
    uint64_t v18 = -1LL;
  }
  unint64_t v19 = v18 & v17;
  int64_t v42 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v20 = v14 + 56;
  __n128 v21 = swift_retain(v13);
  int64_t v22 = 0LL;
  while (1)
  {
    if (v19)
    {
      unint64_t v24 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_26;
    }

    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v26 >= v42) {
      goto LABEL_35;
    }
    unint64_t v27 = *(void *)(v41 + 8 * v26);
    ++v22;
    if (!v27)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v42) {
        goto LABEL_35;
      }
      unint64_t v27 = *(void *)(v41 + 8 * v22);
      if (!v27)
      {
        int64_t v22 = v26 + 2;
        if (v26 + 2 >= v42) {
          goto LABEL_35;
        }
        unint64_t v27 = *(void *)(v41 + 8 * v22);
        if (!v27) {
          break;
        }
      }
    }

uint64_t sub_1000AF2C0(uint64_t a1, char a2)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  uint64_t *v2 = v5;
  uint64_t v7 = 0LL;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000LL) == 0 && (v5 & 0x4000000000000000LL) == 0)
  {
    if (a1 <= *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      return result;
    }
    uint64_t v7 = 1LL;
  }

  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v5);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v7,  v9,  a2 & 1,  v5);
  uint64_t *v2 = result;
  return result;
}

void (*sub_1000AF37C( void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  Swift::Int v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000AF3FC(v6, a2, a3);
  return sub_1000AF3D0;
}

void sub_1000AF3D0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_1000AF3FC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  Swift::Int v3 = result;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (*(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)Swift::Int v3 = v4;
    return destroy for CaptureDeviceState;
  }

  __break(1u);
  return result;
}

uint64_t sub_1000AF468(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v16 = a3;
    }
    else {
      uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7) {
      return a3;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v7) {
      return a3;
    }
  }

  if (!a1) {
    goto LABEL_25;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8LL;
  if (v6)
  {
    if (a3 < 0) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100022750( (unint64_t *)&unk_1001160E0,  &qword_1001160D8,  (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_100018A04(&qword_1001160D8);
          uint64_t v13 = sub_1000AF37C(v18, i, a3);
          id v15 = *v14;
          ((void (*)(void (**)(id *), void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

uint64_t sub_1000AF684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000AFB88(a1, a2, a3, a4, (uint64_t)&unk_1000FC1D0, (uint64_t)sub_1000B14A8, sub_100082E78);
}

uint64_t sub_1000AF6A0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3LL;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

void sub_1000AF740(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1000AF754(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1000AF768(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, void *a6)
{
  unint64_t v10 = a1;
  if ((a4 & 0xC000000000000001LL) == 0)
  {
    if ((a3 & 1) != 0) {
      goto LABEL_13;
    }
    if (a1 < 0 || 1LL << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }

    else if (((*(void *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2) {
        goto LABEL_20;
      }
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        uint64_t v14 = __CocoaSet.Index.element.getter(v10, a2);
        uint64_t v24 = v14;
        uint64_t v15 = sub_10001C5D0(0LL, a5, a6);
        swift_unknownObjectRetain(v14);
        swift_dynamicCast(&v25, &v24, (char *)&type metadata for Swift.AnyObject + 8, v15, 7LL);
        a5 = v25;
        swift_unknownObjectRelease(v14);
        Swift::Int v16 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
        uint64_t v17 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v10 = v16 & ~v17;
        if (((*(void *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
        {
          id v18 = *(id *)(*(void *)(a4 + 48) + 8 * v10);
          char v19 = static NSObject.== infix(_:_:)(v18, a5);

          if ((v19 & 1) == 0)
          {
            uint64_t v20 = ~v17;
            do
            {
              unint64_t v10 = (v10 + 1) & v20;
              if (((*(void *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
                goto LABEL_24;
              }
              id v21 = *(id *)(*(void *)(a4 + 48) + 8 * v10);
              char v22 = static NSObject.== infix(_:_:)(v21, a5);
            }

            while ((v22 & 1) == 0);
          }

LABEL_20:
          id v23 = *(id *)(*(void *)(a4 + 48) + 8 * v10);
          return;
        }

uint64_t sub_1000AF9C8@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (result < 0 || (uint64_t v4 = result, 1LL << *(_BYTE *)(a3 + 32) <= result))
  {
    __break(1u);
    goto LABEL_7;
  }

  if (((*(void *)(a3 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(_DWORD *)(a3 + 36) == a2)
  {
    uint64_t v6 = *(void *)(a3 + 48);
    uint64_t v7 = type metadata accessor for RecentsCallHandle(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16LL))( a4,  v6 + *(void *)(*(void *)(v7 - 8) + 72LL) * v4,  v7);
  }

uint64_t sub_1000AFA5C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

id sub_1000AFAE4(id result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1LL << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (((*(void *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8LL) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(_DWORD *)(a5 + 36) == a3)
  {
    id v7 = result;
    uint64_t v8 = *(void *)(a5 + 48);
    uint64_t v9 = type metadata accessor for UUID(0LL);
    (*(void (**)(id, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16LL))( v7,  v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * a2,  v9);
    return *(id *)(*(void *)(a5 + 56) + 8 * a2);
  }

uint64_t sub_1000AFB88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v18 = a6;
  char v19 = a7;
  uint64_t v11 = sub_100018A04(&qword_100115318);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))( (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v11);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  uint64_t v16 = swift_allocObject(a5, v15 + v13, v14 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))( v16 + v15,  (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v11);
  v19(a3, a4, v18, v16);
  return swift_release(v16);
}

void *sub_1000AFC84(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  uint64_t v6 = sub_100018A04(&qword_100116040);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for RecentsCallHandle(0LL);
  uint64_t v56 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v52 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v49 = (char *)&v46 - v12;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v13 = a1;
    }
    else {
      uint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v14 = __CocoaSet.makeIterator()(v13);
    uint64_t v15 = sub_10001C5D0(0LL, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
    uint64_t v16 = sub_10001C230(&qword_100116000, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
    uint64_t result = Set.Iterator.init(_cocoa:)(v59, v14, v15, v16);
    a1 = v59[0];
    uint64_t v50 = v59[1];
    uint64_t v18 = v59[2];
    int64_t v19 = v59[3];
    unint64_t v20 = v59[4];
  }

  else
  {
    uint64_t v21 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 56);
    uint64_t v50 = a1 + 56;
    uint64_t v23 = ~v21;
    uint64_t v24 = -v21;
    if (v24 < 64) {
      uint64_t v25 = ~(-1LL << v24);
    }
    else {
      uint64_t v25 = -1LL;
    }
    unint64_t v20 = v25 & v22;
    uint64_t result = (void *)swift_bridgeObjectRetain(a1);
    uint64_t v18 = v23;
    int64_t v19 = 0LL;
  }

  uint64_t v46 = v18;
  uint64_t v57 = _swiftEmptyArrayStorage;
  int64_t v48 = (unint64_t)(v18 + 64) >> 6;
  uint64_t v47 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v51 = a1;
  uint64_t v53 = v9;
  if ((a1 & 0x8000000000000000LL) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v26 = __CocoaSet.Iterator.next()(result);
  if (!v26)
  {
    a1 = v51;
    goto LABEL_47;
  }

  uint64_t v27 = v26;
  uint64_t v58 = v26;
  uint64_t v28 = sub_10001C5D0(0LL, &qword_100115FF8, &OBJC_CLASS___CHHandle_ptr);
  swift_unknownObjectRetain(v27);
  swift_dynamicCast(&v60, &v58, v47, v28, 7LL);
  id v29 = v60;
  swift_unknownObjectRelease(v27);
  int64_t v30 = v19;
  uint64_t v31 = v20;
  a1 = v51;
  while (v29)
  {
    id v60 = v29;
    sub_1000AB56C(&v60, v54, v55, (uint64_t)v8);
    if (v4)
    {

      sub_100022550(a1);
      uint64_t v45 = v57;
      swift_bridgeObjectRelease(v57);
      return v45;
    }

    uint64_t v35 = v56;
    uint64_t v36 = v53;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v8, 1LL, v53) == 1)
    {
      uint64_t result = (void *)sub_10001C608((uint64_t)v8, &qword_100116040);
      int64_t v19 = v30;
      unint64_t v20 = v31;
      if (a1 < 0) {
        goto LABEL_11;
      }
    }

    else
    {
      unint64_t v37 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
      BOOL v38 = v49;
      v37(v49, v8, v36);
      v37(v52, v38, v36);
      unint64_t v39 = (unint64_t)v57;
      if ((swift_isUniquelyReferenced_nonNull_native(v57) & 1) == 0) {
        unint64_t v39 = sub_100019F30(0, *(void *)(v39 + 16) + 1LL, 1, v39);
      }
      unint64_t v41 = *(void *)(v39 + 16);
      unint64_t v40 = *(void *)(v39 + 24);
      uint64_t v57 = (void *)v39;
      if (v41 >= v40 >> 1) {
        uint64_t v57 = (void *)sub_100019F30(v40 > 1, v41 + 1, 1, (unint64_t)v57);
      }
      uint64_t v42 = v56;
      uint64_t v43 = v57;
      v57[2] = v41 + 1;
      uint64_t result = (void *)((uint64_t (*)(char *, char *, uint64_t))v37)( (char *)v43 + ((*(unsigned __int8 *)(v42 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))
                         + *(void *)(v42 + 72) * v41,
                           v52,
                           v36);
      int64_t v19 = v30;
      unint64_t v20 = v31;
      a1 = v51;
      if (v51 < 0) {
        goto LABEL_11;
      }
    }

uint64_t sub_1000B0170(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RecentsCallHandle(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v11 = sub_10001949C(&qword_100116028, v10, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
  uint64_t result = Set.init(minimumCapacity:)(v9, v2, v11);
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v14 = *(void *)(v3 + 72);
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v15(v6, v13, v2);
      sub_1000AD054((uint64_t)v8, (uint64_t)v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v13 += v14;
      --v9;
    }

    while (v9);
    return v17;
  }

  return result;
}

uint64_t sub_1000B0298(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = RecentsCallHandle.value.getter();
  if (!v4) {
    return 0x6E776F6E6B6E55LL;
  }
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  if (*(void *)(a2 + 16))
  {
    swift_bridgeObjectRetain(v4);
    unint64_t v7 = sub_10002FB98(v5, v6);
    if ((v8 & 1) != 0)
    {
      id v9 = *(id *)(*(void *)(a2 + 56) + 8 * v7);
      id v10 = objc_msgSend(v9, "displayName", swift_bridgeObjectRelease(v6).n128_f64[0]);

      if (v10)
      {
        uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
        swift_bridgeObjectRelease(v6);
      }
    }

    else
    {
      swift_bridgeObjectRelease(v6);
    }
  }

  return v5;
}

uint64_t sub_1000B037C(uint64_t a1, uint64_t a2)
{
  uint64_t v52 = a2;
  uint64_t v3 = sub_100018A04(&qword_100116050);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v4);
  char v8 = (uint64_t *)((char *)&v51 - v7);
  uint64_t v9 = sub_100018A04(&qword_100116040);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for RecentsCallHandle(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v51 - v17;
  uint64_t v61 = 0LL;
  unint64_t v62 = 0xE000000000000000LL;
  if (*(void *)(a1 + 16) == 1LL)
  {
    sub_1000A8198(a1, (uint64_t)v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1LL, v12) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
      uint64_t v25 = sub_1000B0298((uint64_t)v18, v52);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      return v25;
    }

    sub_10001C608((uint64_t)v11, &qword_100116040);
  }

  uint64_t v19 = -1LL << *(_BYTE *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 56);
  uint64_t v21 = ~v19;
  uint64_t v22 = -v19;
  uint64_t v55 = a1;
  uint64_t v56 = a1 + 56;
  if (v22 < 64) {
    uint64_t v23 = ~(-1LL << v22);
  }
  else {
    uint64_t v23 = -1LL;
  }
  uint64_t v57 = v21;
  uint64_t v58 = 0LL;
  uint64_t v59 = v23 & v20;
  uint64_t v60 = 0LL;
  swift_bridgeObjectRetain(a1);
  sub_1000AB7E4(v6);
  sub_1000B1514((uint64_t)v6, (uint64_t)v8);
  uint64_t v24 = sub_100018A04(&qword_100116058);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48LL))(v8, 1LL, v24) == 1)
  {
    uint64_t v25 = 0LL;
  }

  else
  {
    uint64_t v26 = *(uint64_t (**)(char *, char *, uint64_t))(v13 + 32);
    uint64_t v53 = v6;
    uint64_t v54 = v26;
    uint64_t v27 = v52;
    do
    {
      uint64_t v30 = a1;
      uint64_t v31 = *v8;
      unint64_t v32 = v8;
      unint64_t v33 = (char *)v8 + *(int *)(v24 + 48);
      uint64_t v34 = v12;
      uint64_t v35 = v54(v16, v33, v12);
      uint64_t v36 = RecentsCallHandle.value.getter(v35);
      if (v37)
      {
        uint64_t v38 = v36;
        unint64_t v39 = v37;
        if (*(void *)(v27 + 16))
        {
          swift_bridgeObjectRetain(v37);
          unint64_t v40 = sub_10002FB98(v38, (uint64_t)v39);
          if ((v41 & 1) != 0)
          {
            id v42 = *(id *)(*(void *)(v27 + 56) + 8 * v40);
            id v43 = objc_msgSend(v42, "displayName", swift_bridgeObjectRelease(v39).n128_f64[0]);

            if (v43)
            {
              uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
              uint64_t v45 = v44;
              swift_bridgeObjectRelease(v39);

              unint64_t v39 = v45;
            }

            uint64_t v27 = v52;
          }

          else
          {
            swift_bridgeObjectRelease(v39);
          }
        }
      }

      else
      {
        unint64_t v39 = (void *)0xE700000000000000LL;
        uint64_t v38 = 0x6E776F6E6B6E55LL;
      }

      v46._uint64_t countAndFlagsBits = v38;
      v46._object = v39;
      String.append(_:)(v46);
      swift_bridgeObjectRelease(v39);
      a1 = v30;
      uint64_t v47 = *(void *)(v30 + 16);
      if (v31 == v47 - 2)
      {
        v28._uint64_t countAndFlagsBits = 2106912LL;
        v28._object = (void *)0xE300000000000000LL;
        String.append(_:)(v28);
        id v29 = v53;
        uint64_t v12 = v34;
        char v8 = v32;
      }

      else
      {
        BOOL v48 = v31 == v47 - 1;
        id v29 = v53;
        uint64_t v12 = v34;
        char v8 = v32;
        if (!v48)
        {
          v49._uint64_t countAndFlagsBits = 8236LL;
          v49._object = (void *)0xE200000000000000LL;
          String.append(_:)(v49);
        }
      }

      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      sub_1000AB7E4(v29);
      sub_1000B1514((uint64_t)v29, (uint64_t)v8);
      uint64_t v24 = sub_100018A04(&qword_100116058);
    }

    while ((*(unsigned int (**)(void *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48LL))(v8, 1LL, v24) != 1);
    uint64_t v25 = v61;
  }

  sub_100022550(v55);
  return v25;
}

char *sub_1000B0798(uint64_t a1, void *a2, uint64_t a3)
{
  id v29 = a2;
  uint64_t v6 = sub_100018A04((uint64_t *)&unk_100115FD0);
  __chkstk_darwin(v6);
  char v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for RecentsCallItem(0LL);
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  Swift::String v28 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v27 = (char *)&v24 - v12;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13) {
    return (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v25 = a1;
  uint64_t v14 = (unint64_t *)(a1 + 40);
  uint64_t v15 = (char *)_swiftEmptyArrayStorage;
  uint64_t v26 = a3;
  do
  {
    uint64_t v16 = *(v14 - 1);
    unint64_t v17 = *v14;
    uint64_t v30 = v16;
    unint64_t v31 = v17;
    sub_10004FE18(v16, v17);
    sub_1000A8DA8(v29, a3, (uint64_t)v8);
    if (v3)
    {
      sub_100022804(v16, v17);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v25);
      return v15;
    }

    sub_100022804(v16, v17);
    uint64_t v18 = v32;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v8, 1LL, v9) == 1)
    {
      sub_10001C608((uint64_t)v8, (uint64_t *)&unk_100115FD0);
    }

    else
    {
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
      uint64_t v20 = v27;
      v19(v27, v8, v9);
      v19(v28, v20, v9);
      if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0) {
        uint64_t v15 = (char *)sub_100019D10(0, *((void *)v15 + 2) + 1LL, 1, (unint64_t)v15);
      }
      unint64_t v22 = *((void *)v15 + 2);
      unint64_t v21 = *((void *)v15 + 3);
      if (v22 >= v21 >> 1) {
        uint64_t v15 = (char *)sub_100019D10(v21 > 1, v22 + 1, 1, (unint64_t)v15);
      }
      *((void *)v15 + 2) = v22 + 1;
      v19( &v15[((*(unsigned __int8 *)(v32 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))
           + *(void *)(v32 + 72) * v22],
        v28,
        v9);
      a3 = v26;
    }

    v14 += 2;
    --v13;
  }

  while (v13);
  swift_bridgeObjectRelease(v25);
  return v15;
}

void sub_1000B0A10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v43 = (unint64_t)_swiftEmptyArrayStorage;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v4 = a1;
    }
    else {
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v5 = __CocoaSet.makeIterator()(v4);
    uint64_t v6 = sub_10001C5D0(0LL, &qword_100113008, &OBJC_CLASS___TUConversationMember_ptr);
    uint64_t v7 = sub_10001C230((unint64_t *)&unk_100113010, &qword_100113008, &OBJC_CLASS___TUConversationMember_ptr);
    char v8 = Set.Iterator.init(_cocoa:)(v42, v5, v6, v7);
    uint64_t v3 = v42[0];
    uint64_t v39 = v42[1];
    uint64_t v9 = v42[2];
    uint64_t v10 = v42[3];
    unint64_t v11 = v42[4];
  }

  else
  {
    uint64_t v12 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v39 = a1 + 56;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v14 = ~(-1LL << v13);
    }
    else {
      uint64_t v14 = -1LL;
    }
    unint64_t v11 = v14 & *(void *)(a1 + 56);
    char v8 = (void *)swift_bridgeObjectRetain(a1);
    uint64_t v10 = 0LL;
  }

  int64_t v38 = (unint64_t)(v9 + 64) >> 6;
  while (v3 < 0)
  {
    uint64_t v18 = __CocoaSet.Iterator.next()(v8);
    if (!v18) {
      goto LABEL_44;
    }
    uint64_t v19 = v18;
    uint64_t v40 = v18;
    uint64_t v20 = sub_10001C5D0(0LL, &qword_100113008, &OBJC_CLASS___TUConversationMember_ptr);
    swift_unknownObjectRetain(v19);
    swift_dynamicCast(&v41, &v40, (char *)&type metadata for Swift.AnyObject + 8, v20, 7LL);
    id v21 = v41;
    swift_unknownObjectRelease(v19);
    uint64_t v17 = v10;
    uint64_t v15 = v11;
    if (!v21) {
      goto LABEL_44;
    }
LABEL_36:
    id v25 = [v21 handle];
    id v26 = [v25 normalizedValue];

    if (v26)
    {
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      uint64_t v29 = v28;

      uint64_t v30 = *(void *)(a2 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_contacts);
      if (*(void *)(v30 + 16))
      {
        swift_bridgeObjectRetain(*(void *)(a2
                                           + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_contacts));
        unint64_t v31 = sub_10002FB98(v27, v29);
        if ((v32 & 1) != 0)
        {
          id v33 = *(id *)(*(void *)(v30 + 56) + 8 * v31);

          swift_bridgeObjectRelease(v29);
          swift_bridgeObjectRelease(v30);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v34);
          unint64_t v36 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v35 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v36 >= v35 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v35 > 1, v36 + 1, 1LL);
          }
          uint64_t v37 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v36, v33);
          char v8 = (void *)specialized Array._endMutation()(v37);
        }

        else
        {

          swift_bridgeObjectRelease(v29);
          swift_bridgeObjectRelease(v30);
        }
      }

      else
      {

        swift_bridgeObjectRelease(v29);
      }
    }

    else
    {
    }

    uint64_t v10 = v17;
    unint64_t v11 = v15;
  }

  if (v11)
  {
    uint64_t v15 = (v11 - 1) & v11;
    unint64_t v16 = __clz(__rbit64(v11)) | (v10 << 6);
    uint64_t v17 = v10;
LABEL_35:
    id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v16);
    if (!v21) {
      goto LABEL_44;
    }
    goto LABEL_36;
  }

  int64_t v22 = v10 + 1;
  if (!__OFADD__(v10, 1LL))
  {
    if (v22 >= v38) {
      goto LABEL_44;
    }
    unint64_t v23 = *(void *)(v39 + 8 * v22);
    uint64_t v17 = v10 + 1;
    if (!v23)
    {
      uint64_t v17 = v10 + 2;
      if (v10 + 2 >= v38) {
        goto LABEL_44;
      }
      unint64_t v23 = *(void *)(v39 + 8 * v17);
      if (!v23)
      {
        uint64_t v17 = v10 + 3;
        if (v10 + 3 >= v38) {
          goto LABEL_44;
        }
        unint64_t v23 = *(void *)(v39 + 8 * v17);
        if (!v23)
        {
          uint64_t v17 = v10 + 4;
          if (v10 + 4 >= v38) {
            goto LABEL_44;
          }
          unint64_t v23 = *(void *)(v39 + 8 * v17);
          if (!v23)
          {
            uint64_t v17 = v10 + 5;
            if (v10 + 5 >= v38) {
              goto LABEL_44;
            }
            unint64_t v23 = *(void *)(v39 + 8 * v17);
            if (!v23)
            {
              uint64_t v24 = v10 + 6;
              while (v38 != v24)
              {
                unint64_t v23 = *(void *)(v39 + 8 * v24++);
                if (v23)
                {
                  uint64_t v17 = v24 - 1;
                  goto LABEL_34;
                }
              }

uint64_t sub_1000B0E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04(&qword_100115F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B0E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04(&qword_100115F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B0E98@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)(v1 + 16)
                 + OBJC_IVAR____TtCC8FaceTime24ContinuitySessionManager19RecentCallsProvider_queue_recentCallItems);
  *a1 = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_1000B0EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000B0F04()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000B0F28()
{
  uint64_t v1 = type metadata accessor for RecentsCallItem(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v6 = type metadata accessor for CallType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_1000B1000(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for RecentsCallItem(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(type metadata accessor for CallType(0LL) - 8) + 80LL);
  uint64_t v8 = v6 + v7 + 8;
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[4];
  uint64_t v12 = (uint64_t)v1 + v5;
  uint64_t v13 = *(void *)((char *)v1 + v6);
  uint64_t v14 = (uint64_t)v1 + (v8 & ~v7);
  uint64_t v15 = (void *)swift_task_alloc(dword_100115F94);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v15;
  void *v15 = v2;
  v15[1] = sub_10001C958;
  return sub_1000AADBC(a1, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_1000B10D8()
{
  uint64_t v1 = type metadata accessor for RecentsCallItem(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_1000B1170(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for RecentsCallItem(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8LL));
  uint64_t v11 = (void *)swift_task_alloc(dword_100115FA4);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10001C158;
  return sub_1000AA7C0(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_1000B121C()
{
  uint64_t v1 = type metadata accessor for RecentsCallItem(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for CallType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_1000B12E0(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for RecentsCallItem(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(type metadata accessor for CallType(0LL) - 8) + 80LL);
  unint64_t v8 = v5 + v6 + v7;
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[4];
  uint64_t v12 = (uint64_t)v1 + v5;
  uint64_t v13 = (uint64_t)v1 + (v8 & ~v7);
  uint64_t v14 = (void *)swift_task_alloc(dword_100115FB4);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_10001C958;
  return sub_1000AA344(a1, v9, v10, v11, v12, v13);
}

uint64_t sub_1000B139C(uint64_t a1)
{
  return sub_1000B1614( a1,  &qword_100112948,  &OBJC_CLASS___TUContinuityHandleAnonym_ptr,  (unint64_t *)&unk_100112950,  &qword_100115FC8);
}

uint64_t sub_1000B13C0(uint64_t a1)
{
  return sub_1000AFB88( a1,  v1[2],  v1[3],  v1[4],  (uint64_t)&unk_1000FC1A8,  (uint64_t)sub_1000B13F8,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100082320);
}

uint64_t sub_1000B13F8(uint64_t a1, uint64_t a2)
{
  return sub_1000B14B4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000B1D14);
}

uint64_t sub_1000B1404(uint64_t a1)
{
  return sub_1000B76E0(a1, *(char ***)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000B140C(uint64_t a1)
{
  return sub_1000AFB88(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_1000FC1D0, (uint64_t)sub_1000B14A8, sub_100082E78);
}

uint64_t sub_1000B1444()
{
  uint64_t v1 = sub_100018A04(&qword_100115318);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000B14A8(uint64_t a1, uint64_t a2)
{
  return sub_1000B14B4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100080488);
}

uint64_t sub_1000B14B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(sub_100018A04(&qword_100115318) - 8) + 80LL);
  return a3(a1, a2, v3 + ((v6 + 16) & ~v6));
}

uint64_t sub_1000B1514(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04(&qword_100116050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B155C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000B1580()
{
  return sub_1000ABAFC(*(void *)(v0 + 16));
}

uint64_t sub_1000B1588(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000B1598(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000B15A0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000B15CC()
{
}

uint64_t sub_1000B15F0(uint64_t a1)
{
  return sub_1000B1614( a1,  (unint64_t *)&unk_1001160A0,  &OBJC_CLASS___TUConversationActivity_ptr,  (unint64_t *)&unk_100113B80,  (uint64_t *)&unk_1001160B0);
}

uint64_t sub_1000B1614(uint64_t a1, unint64_t *a2, void *a3, unint64_t *a4, uint64_t *a5)
{
  unint64_t v10 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v21 = a1;
    }
    else {
      uint64_t v21 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v21);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v12 = sub_10001C5D0(0LL, a2, a3);
  uint64_t v13 = sub_10001C230(a4, a2, a3);
  uint64_t result = Set.init(minimumCapacity:)(v11, v12, v13);
  uint64_t v23 = result;
  if (v10)
  {
    if (a1 < 0) {
      uint64_t v16 = a1;
    }
    else {
      uint64_t v16 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter(v16);
    uint64_t result = swift_bridgeObjectRelease(a1);
    if (!v15) {
      return v23;
    }
  }

  else
  {
    uint64_t v15 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v15) {
      return v23;
    }
  }

  if (v15 >= 1)
  {
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        uint64_t v18 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        sub_1000ACA14((Swift::Int *)&v22, v18, a2, a3, a5);
      }
    }

    else
    {
      uint64_t v19 = (void **)(a1 + 32);
      do
      {
        uint64_t v20 = *v19++;
        sub_1000ACA14((Swift::Int *)&v22, v20, a2, a3, a5);

        --v15;
      }

      while (v15);
    }

    return v23;
  }

  __break(1u);
  return result;
}

uint64_t sub_1000B17A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for PressType(0LL);
  uint64_t v4 = v3;
  uint64_t v5 = sub_10001949C( &qword_100116078,  (uint64_t (*)(uint64_t))type metadata accessor for PressType,  (uint64_t)&unk_1000C4348);
  uint64_t result = Set.init(minimumCapacity:)(v2, v4, v5);
  uint64_t v10 = result;
  if (v2)
  {
    uint64_t v7 = (Swift::UInt *)(a1 + 32);
    do
    {
      Swift::UInt v8 = *v7++;
      sub_1000ACF38(&v9, v8);
      --v2;
    }

    while (v2);
    return v10;
  }

  return result;
}

uint64_t sub_1000B1848()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10001C378(v0, qword_10011A3F8);
  sub_10001C270(v0, (uint64_t)qword_10011A3F8);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x80000001000D8590LL,  0x616E614D6C6C6143LL,  0xEB00000000726567LL);
}

void sub_1000B18C4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for CallIdentifier(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_1000606A8(v2, (uint64_t)v10, v11);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    uint64_t v12 = *v10;
    uint64_t v13 = v10[1];
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(a1, v12, v13);
    swift_bridgeObjectRelease(v13);
  }

  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v10, v4);
    Hasher._combine(_:)(0LL);
    uint64_t v14 = sub_10001949C( &qword_1001136D0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(a1, v4, v14);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

Swift::Int sub_1000B1A1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for CallIdentifier(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (void *)((char *)&v14[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  Hasher.init(_seed:)(v14, 0LL);
  sub_1000606A8(v1, (uint64_t)v8, type metadata accessor for CallIdentifier);
  if (swift_getEnumCaseMultiPayload(v8, v6) == 1)
  {
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(v14, v9, v10);
    swift_bridgeObjectRelease(v10);
  }

  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v5, v8, v2);
    Hasher._combine(_:)(0LL);
    uint64_t v11 = sub_10001949C( &qword_1001136D0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v14, v2, v11);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  return Hasher._finalize()();
}

Swift::Int sub_1000B1BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (void *)((char *)&v18[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  Hasher.init(_seed:)(v18, a1);
  sub_1000606A8(v4, (uint64_t)v12, type metadata accessor for CallIdentifier);
  if (swift_getEnumCaseMultiPayload(v12, a2) == 1)
  {
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(v18, v13, v14);
    swift_bridgeObjectRelease(v14);
  }

  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 32))(v10, v12, v6);
    Hasher._combine(_:)(0LL);
    uint64_t v15 = sub_10001949C( &qword_1001136D0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v18, v6, v15);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }

  return Hasher._finalize()();
}

uint64_t sub_1000B1D14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04(&qword_100115310);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CallIdentifier(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v17 - v12;
  if (a2)
  {
    uint64_t v18 = a2;
    swift_errorRetain(a2);
    uint64_t v14 = sub_100018A04(&qword_100115318);
    return CheckedContinuation.resume(throwing:)(&v18, v14);
  }

  else
  {
    sub_1000B1EC8(a1, (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7) == 1)
    {
      uint64_t result = sub_10001C608((uint64_t)v6, &qword_100115310);
      __break(1u);
    }

    else
    {
      sub_1000B1F10((uint64_t)v6, (uint64_t)v13);
      sub_1000606A8((uint64_t)v13, (uint64_t)v11, type metadata accessor for CallIdentifier);
      uint64_t v16 = sub_100018A04(&qword_100115318);
      CheckedContinuation.resume(returning:)(v11, v16);
      return sub_10001C644((uint64_t)v13, type metadata accessor for CallIdentifier);
    }
  }

  return result;
}

uint64_t type metadata accessor for CallManager(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTime11CallManager, a2);
}

uint64_t type metadata accessor for CallIdentifier(uint64_t a1)
{
  return sub_100020F70(a1, qword_1001162A0, (uint64_t)&nominal type descriptor for CallIdentifier);
}

uint64_t sub_1000B1EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04(&qword_100115310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B1F10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CallIdentifier(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t *sub_1000B1F54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v11);
  }

  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      uint64_t v7 = type metadata accessor for CallType(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 1LL;
    }

    else
    {
      uint64_t v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      swift_bridgeObjectRetain(v12);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  return a1;
}

uint64_t sub_1000B2010(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for CallType(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
}

void *sub_1000B2060(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    uint64_t v6 = type metadata accessor for CallType(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    uint64_t v7 = a1;
    uint64_t v8 = a3;
    uint64_t v9 = 1LL;
  }

  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    swift_bridgeObjectRetain(v10);
    uint64_t v7 = a1;
    uint64_t v8 = a3;
    uint64_t v9 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v7, v8, v9);
  return a1;
}

void *sub_1000B20F0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10001C644((uint64_t)a1, type metadata accessor for OutgoingCallType);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      uint64_t v6 = type metadata accessor for CallType(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 1LL;
    }

    else
    {
      *a1 = *a2;
      uint64_t v10 = a2[1];
      a1[1] = v10;
      swift_bridgeObjectRetain(v10);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v7, v8, v9);
  }

  return a1;
}

uint64_t type metadata accessor for OutgoingCallType(uint64_t a1)
{
  return sub_100020F70(a1, qword_1001161F8, (uint64_t)&nominal type descriptor for OutgoingCallType);
}

void *sub_1000B21B4(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    uint64_t v6 = type metadata accessor for CallType(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1LL);
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  return a1;
}

void *sub_1000B2240(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10001C644((uint64_t)a1, type metadata accessor for OutgoingCallType);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      uint64_t v6 = type metadata accessor for CallType(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1LL);
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }
  }

  return a1;
}

uint64_t sub_1000B22E4(uint64_t a1)
{
  v4[0] = &unk_1000C7378;
  uint64_t result = type metadata accessor for CallType(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initEnumMetadataMultiPayload(a1, 256LL, 2LL, v4);
    return 0LL;
  }

  return result;
}

uint64_t *sub_1000B2354(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v11);
  }

  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain(v7);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 1LL;
    }

    else
    {
      uint64_t v12 = type metadata accessor for UUID(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
      uint64_t v8 = a1;
      uint64_t v9 = a3;
      uint64_t v10 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  return a1;
}

uint64_t sub_1000B2410(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
}

void *sub_1000B2460(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    swift_bridgeObjectRetain(v6);
    uint64_t v7 = a1;
    uint64_t v8 = a3;
    uint64_t v9 = 1LL;
  }

  else
  {
    uint64_t v10 = type metadata accessor for UUID(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16LL))(a1, a2, v10);
    uint64_t v7 = a1;
    uint64_t v8 = a3;
    uint64_t v9 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v7, v8, v9);
  return a1;
}

void *sub_1000B24F0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10001C644((uint64_t)a1, type metadata accessor for CallIdentifier);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      *a1 = *a2;
      uint64_t v6 = a2[1];
      a1[1] = v6;
      swift_bridgeObjectRetain(v6);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 1LL;
    }

    else
    {
      uint64_t v10 = type metadata accessor for UUID(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16LL))(a1, a2, v10);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v7, v8, v9);
  }

  return a1;
}

void *sub_1000B25A0(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    uint64_t v6 = type metadata accessor for UUID(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 0LL);
  }

  return a1;
}

void *sub_1000B2628(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10001C644((uint64_t)a1, type metadata accessor for CallIdentifier);
    if (swift_getEnumCaseMultiPayload(a2, a3))
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }

    else
    {
      uint64_t v6 = type metadata accessor for UUID(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 0LL);
    }
  }

  return a1;
}

uint64_t sub_1000B26C8(uint64_t a1)
{
  uint64_t result = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_1000C73A0;
    swift_initEnumMetadataMultiPayload(a1, 256LL, 2LL, v4);
    return 0LL;
  }

  return result;
}

uint64_t sub_1000B2734()
{
  return sub_10001949C(&qword_1001162D8, type metadata accessor for CallIdentifier, (uint64_t)&unk_1000C73B8);
}

uint64_t sub_1000B2760(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a2;
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CallIdentifier(0LL);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (uint64_t *)((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = sub_100018A04(&qword_1001162E8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = &v16[*(int *)(v14 + 48)];
  sub_1000606A8(a1, (uint64_t)v16, type metadata accessor for CallIdentifier);
  sub_1000606A8(v28, (uint64_t)v17, type metadata accessor for CallIdentifier);
  if (swift_getEnumCaseMultiPayload(v16, v7) != 1)
  {
    sub_1000606A8((uint64_t)v16, (uint64_t)v12, type metadata accessor for CallIdentifier);
    if (swift_getEnumCaseMultiPayload(v17, v7) != 1)
    {
      uint64_t v24 = v6;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v17, v3);
      char v23 = static UUID.== infix(_:_:)(v12, v6);
      id v25 = *(void (**)(char *, uint64_t))(v4 + 8);
      v25(v24, v3);
      v25(v12, v3);
      sub_10001C644((uint64_t)v16, type metadata accessor for CallIdentifier);
      return v23 & 1;
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
    goto LABEL_12;
  }

  sub_1000606A8((uint64_t)v16, (uint64_t)v10, type metadata accessor for CallIdentifier);
  uint64_t v19 = *v10;
  uint64_t v18 = v10[1];
  if (swift_getEnumCaseMultiPayload(v17, v7) != 1)
  {
    swift_bridgeObjectRelease(v18);
LABEL_12:
    sub_10001C608((uint64_t)v16, &qword_1001162E8);
    goto LABEL_13;
  }

  uint64_t v20 = *((void *)v17 + 1);
  if (v19 == *(void *)v17 && v18 == v20)
  {
    swift_bridgeObjectRelease_n(v18, 2LL);
    goto LABEL_16;
  }

  char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v18, *(void *)v17, *((void *)v17 + 1), 0LL);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v18);
  if ((v22 & 1) != 0)
  {
LABEL_16:
    sub_10001C644((uint64_t)v16, type metadata accessor for CallIdentifier);
    char v23 = 1;
    return v23 & 1;
  }

  sub_10001C644((uint64_t)v16, type metadata accessor for CallIdentifier);
LABEL_13:
  char v23 = 0;
  return v23 & 1;
}

uint64_t sub_1000B29FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CallType(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OutgoingCallType(0LL);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (uint64_t *)((char *)&v27 - v12);
  uint64_t v14 = sub_100018A04(&qword_1001162E0);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = &v17[*(int *)(v15 + 48)];
  sub_1000606A8(a1, (uint64_t)v17, type metadata accessor for OutgoingCallType);
  sub_1000606A8(a2, (uint64_t)v18, type metadata accessor for OutgoingCallType);
  if (swift_getEnumCaseMultiPayload(v17, v8) != 1)
  {
    sub_1000606A8((uint64_t)v17, (uint64_t)v13, type metadata accessor for OutgoingCallType);
    uint64_t v22 = *v13;
    uint64_t v21 = v13[1];
    if (swift_getEnumCaseMultiPayload(v18, v8) == 1)
    {
      swift_bridgeObjectRelease(v21);
LABEL_7:
      sub_10001C608((uint64_t)v17, &qword_1001162E0);
LABEL_20:
      char v19 = 0;
      return v19 & 1;
    }

    uint64_t v23 = *((void *)v18 + 1);
    if (v21)
    {
      if (v23)
      {
        if (v22 != *(void *)v18 || v21 != v23)
        {
          char v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v21, *(void *)v18, *((void *)v18 + 1), 0LL);
          swift_bridgeObjectRelease(v21);
          swift_bridgeObjectRelease(v23);
          if ((v25 & 1) != 0) {
            goto LABEL_23;
          }
LABEL_19:
          sub_10001C644((uint64_t)v17, type metadata accessor for OutgoingCallType);
          goto LABEL_20;
        }

        swift_bridgeObjectRelease(v21);
        swift_bridgeObjectRelease(v23);
LABEL_23:
        sub_10001C644((uint64_t)v17, type metadata accessor for OutgoingCallType);
        char v19 = 1;
        return v19 & 1;
      }
    }

    else
    {
      if (!v23) {
        goto LABEL_23;
      }
      uint64_t v21 = *((void *)v18 + 1);
    }

    swift_bridgeObjectRelease(v21);
    goto LABEL_19;
  }

  sub_1000606A8((uint64_t)v17, (uint64_t)v11, type metadata accessor for OutgoingCallType);
  if (swift_getEnumCaseMultiPayload(v18, v8) != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  char v19 = static CallType.== infix(_:_:)(v11, v7);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
  sub_10001C644((uint64_t)v17, type metadata accessor for OutgoingCallType);
  return v19 & 1;
}

uint64_t *sub_1000B2CB4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_100018A04(&qword_1001162F0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16LL) & ~(unint64_t)v5));
  }

  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = type metadata accessor for FaceTimeURL(0LL);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1LL, v7))
    {
      uint64_t v9 = sub_100018A04(&qword_100113258);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0LL, 1LL, v7);
    }

    uint64_t v11 = *(int *)(v6 + 28);
    uint64_t v10 = *(uint64_t *)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = v10;
  }

  swift_retain(v10);
  return a1;
}

double sub_1000B2DA8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(a1 + *(int *)(sub_100018A04(&qword_1001162F0) + 28));
  *(void *)&double result = swift_release(v4).n128_u64[0];
  return result;
}

char *sub_1000B2E18(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1LL, v4))
  {
    uint64_t v6 = sub_100018A04(&qword_100113258);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0LL, 1LL, v4);
  }

  uint64_t v7 = *(int *)(sub_100018A04(&qword_1001162F0) + 28);
  uint64_t v8 = *(void *)&a2[v7];
  *(void *)&a1[v7] = v8;
  swift_retain(v8);
  return a1;
}

char *sub_1000B2ED8(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1LL, v4);
  int v8 = v6(a2, 1LL, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 24))(a1, a2, v4);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }

  if (v8)
  {
LABEL_6:
    uint64_t v9 = sub_100018A04(&qword_100113258);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0LL, 1LL, v4);
LABEL_7:
  uint64_t v10 = *(int *)(sub_100018A04(&qword_1001162F0) + 28);
  uint64_t v11 = *(void *)&a1[v10];
  uint64_t v12 = *(void *)&a2[v10];
  *(void *)&a1[v10] = v12;
  swift_retain(v12);
  swift_release(v11);
  return a1;
}

char *sub_1000B2FF0(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1LL, v4))
  {
    uint64_t v6 = sub_100018A04(&qword_100113258);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0LL, 1LL, v4);
  }

  uint64_t v7 = sub_100018A04(&qword_1001162F0);
  *(void *)&a1[*(int *)(v7 + 28)] = *(void *)&a2[*(int *)(v7 + 28)];
  return a1;
}

char *sub_1000B30AC(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1LL, v4);
  int v8 = v6(a2, 1LL, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 40))(a1, a2, v4);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }

  if (v8)
  {
LABEL_6:
    uint64_t v9 = sub_100018A04(&qword_100113258);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0LL, 1LL, v4);
LABEL_7:
  uint64_t v10 = *(int *)(sub_100018A04(&qword_1001162F0) + 28);
  uint64_t v11 = *(void *)&a1[v10];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  swift_release(v11);
  return a1;
}

uint64_t sub_1000B31BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B31C8);
}

uint64_t sub_1000B31C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000B3414(a1, a2, a3, &qword_1001162F0);
}

uint64_t sub_1000B31D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B31E0);
}

uint64_t sub_1000B31E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000B3468(a1, a2, a3, a4, &qword_1001162F0);
}

uint64_t type metadata accessor for ContentView(uint64_t a1)
{
  return sub_100020F70(a1, (uint64_t *)&unk_100116350, (uint64_t)&nominal type descriptor for ContentView);
}

void sub_1000B3200(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1000B3214(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000E98DC, 1LL);
}

uint64_t sub_1000B3224@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100018A04(&qword_100115D78);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for TVFTRootView(0LL);
  __chkstk_darwin(v5);
  int v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100018A04(&qword_100116390);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100018A04(&qword_1001162F0);
  uint64_t v12 = ((uint64_t (*)(void))State.projectedValue.getter)();
  uint64_t v13 = static SafeAreaRegions.all.getter(v12);
  char v14 = static Edge.Set.all.getter();
  sub_1000606A8((uint64_t)v7, (uint64_t)v10, type metadata accessor for TVFTRootView);
  uint64_t v15 = &v10[*(int *)(v8 + 36)];
  *(void *)uint64_t v15 = v13;
  v15[8] = v14;
  sub_1000B33C0((uint64_t)v7);
  State.projectedValue.getter(v11);
  uint64_t v16 = sub_100018A04(&qword_100116398);
  sub_10001C3B8((uint64_t)v4, a1 + *(int *)(v16 + 36), &qword_100115D78);
  sub_10001C3B8((uint64_t)v10, a1, &qword_100116390);
  sub_10001C608((uint64_t)v4, &qword_100115D78);
  return sub_10001C608((uint64_t)v10, &qword_100116390);
}

uint64_t sub_1000B33C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TVFTRootView(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000B33FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B3408);
}

uint64_t sub_1000B3408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000B3414(a1, a2, a3, &qword_100115D78);
}

uint64_t sub_1000B3414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_100018A04(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(a1, a2, v6);
}

uint64_t sub_1000B3450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B345C);
}

uint64_t sub_1000B345C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000B3468(a1, a2, a3, a4, &qword_100115D78);
}

uint64_t sub_1000B3468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = sub_100018A04(a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(a1, a2, a2, v7);
}

uint64_t type metadata accessor for FaceTimeURLHandlingModifier(uint64_t a1)
{
  return sub_100020F70(a1, qword_1001163F8, (uint64_t)&nominal type descriptor for FaceTimeURLHandlingModifier);
}

void sub_1000B34BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1000B34D0( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (v7 <= 0x3F)
  {
    uint64_t v8 = *(void *)(v6 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v8, a1 + 16);
  }

void sub_1000B3540(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_10001C334(&qword_100113258);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }

unint64_t sub_1000B35A0()
{
  unint64_t result = qword_100116430;
  if (!qword_100116430)
  {
    uint64_t v1 = sub_10001C334(&qword_100116398);
    sub_1000B3624();
    sub_10001949C(&qword_100116440, type metadata accessor for FaceTimeURLHandlingModifier, (uint64_t)&unk_1000C74CC);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100116430);
  }

  return result;
}

unint64_t sub_1000B3624()
{
  unint64_t result = qword_100116438;
  if (!qword_100116438)
  {
    uint64_t v1 = sub_10001C334(&qword_100116390);
    sub_10001949C(&qword_100115E18, type metadata accessor for TVFTRootView, (uint64_t)&unk_1000C7030);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100116438);
  }

  return result;
}

uint64_t sub_1000B36A8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000E9904, 1LL);
}

uint64_t sub_1000B36B8(uint64_t a1)
{
  uint64_t v2 = sub_100018A04(&qword_100113258);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v10 - v6;
  static FaceTimeURL.from(url:allowCallLinks:)(a1, 0LL);
  sub_10001C3B8((uint64_t)v7, (uint64_t)v5, &qword_100113258);
  uint64_t v8 = sub_100018A04(&qword_100115D78);
  Binding.wrappedValue.setter(v5, v8);
  return sub_10001C608((uint64_t)v7, &qword_100113258);
}

uint64_t sub_1000B3790()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

double sub_1000B37A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(a1);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000606A8(v2, (uint64_t)v5, type metadata accessor for FaceTimeURLHandlingModifier);
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = swift_allocObject(&unk_1000FC388, v7 + v4, v6 | 7);
  sub_1000B3940((uint64_t)v5, v8 + v7);
  uint64_t v9 = sub_100018A04(&qword_100116448);
  unint64_t v10 = sub_1000B39C0();
  View.onOpenURL(perform:)(sub_1000B3984, v8, v9, v10);
  *(void *)&double result = swift_release(v8).n128_u64[0];
  return result;
}

uint64_t sub_1000B3888()
{
  uint64_t v1 = *(void *)(type metadata accessor for FaceTimeURLHandlingModifier(0LL) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release(*(void *)(v0 + v3));
  swift_release(*(void *)(v0 + v3 + 8));
  uint64_t v5 = v0 + v3 + *(int *)(sub_100018A04(&qword_100115D78) + 32);
  uint64_t v6 = type metadata accessor for FaceTimeURL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000B3940(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FaceTimeURLHandlingModifier(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B3984(uint64_t a1)
{
  return sub_1000B36B8(a1);
}

unint64_t sub_1000B39C0()
{
  unint64_t result = qword_100116450;
  if (!qword_100116450)
  {
    uint64_t v1 = sub_10001C334(&qword_100116448);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for _ViewModifier_Content<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100116450);
  }

  return result;
}

uint64_t sub_1000B3A0C()
{
  v1[0] = sub_10001C334(&qword_100116448);
  v1[1] = sub_1000B39C0();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.onOpenURL(perform:)>>,  1LL);
}

uint64_t sub_1000B3A58(void *a1)
{
  id v41 = a1;
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v1);
  uint64_t v42 = type metadata accessor for MultiwayViewController.PresentationMode(0LL);
  uint64_t v40 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v39 = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v38 = OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerQueue;
  v37[0] = sub_10001C5D0(0LL, (unint64_t *)&qword_100112DB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  char v14 = v2;
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = _swiftEmptyArrayStorage;
  uint64_t v15 = sub_10001949C( (unint64_t *)&qword_100113130,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v16 = sub_100018A04((uint64_t *)&unk_100112DC0);
  uint64_t v17 = sub_100022750( (unint64_t *)&qword_100113140,  (uint64_t *)&unk_100112DC0,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v8, v15);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))( v7,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v4);
  uint64_t v18 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000003CLL,  0x80000001000DCF40LL,  v13,  v10,  v7,  0LL);
  *(void *)(v37[1] + v38) = v18;
  uint64_t v19 = OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observers;
  *(void *)&v14[v19] = objc_msgSend((id)objc_opt_self( NSHashTable,  v20), "weakObjectsHashTable");
  *(void *)&v14[OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerCancellables] = _swiftEmptyArrayStorage;
  type metadata accessor for MultiwayViewController(0LL);
  id v21 = v41;
  uint64_t v22 = (void *)MultiwayViewController.__allocating_init(activeCall:)();
  uint64_t v23 = v39;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))( v39,  enum case for MultiwayViewController.PresentationMode.splitView(_:),  v42);
  MultiwayViewController.presentationMode.setter(v23);
  *(void *)&v14[OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_multiwayViewController] = v22;
  id v24 = v22;

  v46.receiver = v14;
  v46.super_class = ObjectType;
  id v25 = objc_msgSendSuper2(&v46, "initWithNibName:bundle:", 0, 0);
  uint64_t v26 = qword_100112380;
  uint64_t v27 = (char *)v25;
  if (v26 != -1) {
    swift_once(&qword_100112380, sub_100080AF0);
  }
  uint64_t v28 = *(void *)(qword_10011A2F0 + OBJC_IVAR____TtC8FaceTime14ATVCallManager_presentationManager);
  uint64_t v29 = *(void **)&v27[OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerQueue];
  uint64_t v30 = swift_allocObject(&unk_1000FC478, 24LL, 7LL);
  swift_unknownObjectWeakInit(v30 + 16, v27);
  uint64_t v31 = swift_allocObject(&unk_1000FC518, 32LL, 7LL);
  *(void *)(v31 + swift_unknownObjectWeakDestroy(v0 + 16) = v30;
  *(void *)(v31 + 24) = v28;
  uint64_t v32 = swift_allocObject(&unk_1000FC540, 32LL, 7LL);
  *(void *)(v32 + swift_unknownObjectWeakDestroy(v0 + 16) = sub_1000B58BC;
  *(void *)(v32 + 24) = v31;
  aBlock[4] = sub_10001C698;
  uint64_t v45 = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000983FC;
  aBlock[3] = &unk_1000FC558;
  id v33 = _Block_copy(aBlock);
  uint64_t v34 = v45;
  swift_retain_n(v28, 2LL);
  unint64_t v35 = v29;
  swift_retain(v32);
  swift_release(v34);
  dispatch_sync(v35, v33);

  _Block_release(v33);
  LOBYTE(v33) = swift_isEscapingClosureAtFileLocation(v32, "", 112LL, 94LL, 28LL, 1LL);

  swift_release(v28);
  swift_release(v31);
  uint64_t result = swift_release(v32);
  __break(1u);
  return result;
}

void sub_1000B3F0C()
{
  uint64_t v1 = v0;
  v9.receiver = v0;
  v9.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v9, "viewDidLoad");
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_multiwayViewController];
  objc_msgSend(v0, "bs_addChildViewController:", v2);
  id v3 = [v0 view];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [v2 view];
    if (v5)
    {
      uint64_t v6 = v5;
      sub_100092200(v5);

      MultiwayViewController.isOnScreen.setter(1LL);
      sub_1000B4014();
      uint64_t v7 = swift_allocObject(&unk_1000FC450, 24LL, 7LL);
      *(void *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
      id v8 = v1;
      sub_1000B4B00((uint64_t)sub_1000B50E4, v7);
      swift_release(v7);
      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

double sub_1000B4014()
{
  uint64_t v0 = sub_100018A04((uint64_t *)&unk_1001130A0);
  uint64_t v55 = *(void *)(v0 - 8);
  uint64_t v56 = v0;
  __chkstk_darwin(v0);
  uint64_t v54 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = sub_100018A04((uint64_t *)&unk_100113480);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for NSNotificationCenter.Publisher(0LL);
  uint64_t v46 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100018A04((uint64_t *)&unk_100113090);
  uint64_t v47 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100018A04(&qword_100113088);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v48 = v11;
  uint64_t v49 = v12;
  __chkstk_darwin(v11);
  char v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v16 = objc_msgSend((id)objc_opt_self(NSNotificationCenter, v15), "defaultCenter");
  NSNotificationCenter.publisher(for:object:)(UISceneDidDisconnectNotification, 0LL);

  uint64_t v17 = sub_10001C5D0(0LL, (unint64_t *)&qword_100112DB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v58[0] = (id)static OS_dispatch_queue.main.getter(v18);
  uint64_t v20 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0LL, v19);
  id v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL);
  uint64_t v53 = v20;
  uint64_t v51 = v21;
  ((void (*)(char *, uint64_t, uint64_t))v21)(v4, 1LL, 1LL);
  uint64_t v22 = sub_10001949C( &qword_1001130D8,  (uint64_t (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher,  (uint64_t)&protocol conformance descriptor for NSNotificationCenter.Publisher);
  uint64_t v23 = v17;
  uint64_t v52 = sub_100022510( (unint64_t *)&qword_100112E50,  (unint64_t *)&qword_100112DB0,  &OBJC_CLASS___OS_dispatch_queue_ptr,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue);
  Publisher.receive<A>(on:options:)(v58, v4, v5, v17, v22, v52);
  sub_10001C608((uint64_t)v4, (uint64_t *)&unk_100113480);

  uint64_t v24 = v5;
  uint64_t v25 = v50;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v24);
  uint64_t v26 = sub_100022750( &qword_1001130E0,  (uint64_t *)&unk_100113090,  (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  Publisher.filter(_:)(sub_1000B45C4, 0LL, v8, v26);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v8);
  uint64_t v27 = swift_allocObject(&unk_1000FC478, 24LL, 7LL);
  swift_unknownObjectWeakInit(v27 + 16, v25);
  uint64_t v28 = sub_100022750( &qword_1001130E8,  &qword_100113088,  (uint64_t)&protocol conformance descriptor for Publishers.Filter<A>);
  uint64_t v29 = v48;
  uint64_t v30 = Publisher<>.sink(receiveValue:)(sub_1000B5168, v27, v48, v28);
  __n128 v31 = swift_release(v27);
  (*(void (**)(char *, uint64_t, __n128))(v49 + 8))(v14, v29, v31);
  uint64_t v32 = v25 + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerCancellables;
  swift_beginAccess(v25 + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerCancellables, v58, 33LL, 0LL);
  uint64_t v33 = sub_100018A04(&qword_100114200);
  uint64_t v34 = sub_100022750(&qword_1001130D0, &qword_100114200, (uint64_t)&protocol conformance descriptor for [A]);
  AnyCancellable.store<A>(in:)(v32, v33, v34);
  swift_endAccess(v58);
  swift_release(v30);
  if (qword_100112380 != -1) {
    swift_once(&qword_100112380, sub_100080AF0);
  }
  v58[0] = *(id *)(qword_10011A2F0 + OBJC_IVAR____TtC8FaceTime14ATVCallManager_activeCallSubject);
  __n128 v35 = swift_retain(v58[0]);
  id v57 = (id)static OS_dispatch_queue.main.getter(v35);
  v51(v4, 1LL, 1LL, v53);
  uint64_t v36 = sub_100018A04((uint64_t *)&unk_100114910);
  uint64_t v37 = sub_100022750( (unint64_t *)&unk_1001130B0,  (uint64_t *)&unk_100114910,  (uint64_t)&protocol conformance descriptor for CurrentValueSubject<A, B>);
  uint64_t v38 = v54;
  Publisher.receive<A>(on:options:)(&v57, v4, v36, v23, v37, v52);
  sub_10001C608((uint64_t)v4, (uint64_t *)&unk_100113480);

  swift_release(v58[0]);
  uint64_t v39 = swift_allocObject(&unk_1000FC478, 24LL, 7LL);
  swift_unknownObjectWeakInit(v39 + 16, v25);
  uint64_t v40 = sub_100022750( (unint64_t *)&unk_1001130C0,  (uint64_t *)&unk_1001130A0,  (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  uint64_t v41 = v56;
  uint64_t v42 = Publisher<>.sink(receiveValue:)(sub_1000B5170, v39, v56, v40);
  __n128 v43 = swift_release(v39);
  (*(void (**)(char *, uint64_t, __n128))(v55 + 8))(v38, v41, v43);
  swift_beginAccess(v32, v58, 33LL, 0LL);
  AnyCancellable.store<A>(in:)(v32, v33, v34);
  swift_endAccess(v58);
  *(void *)&double result = swift_release(v42).n128_u64[0];
  return result;
}

uint64_t sub_1000B45C4()
{
  if (!v16[3])
  {
    sub_10001C608((uint64_t)v16, (uint64_t *)&unk_1001130F0);
    goto LABEL_9;
  }

  uint64_t v0 = sub_10001C5D0(0LL, (unint64_t *)&qword_100112FE8, &OBJC_CLASS___UIScene_ptr);
  if ((swift_dynamicCast(&v15, v16, (char *)&type metadata for Any + 8, v0, 6LL) & 1) == 0)
  {
LABEL_9:
    char v12 = 0;
    return v12 & 1;
  }

  id v1 = v15;
  id v2 = [v15 session];

  id v3 = [v2 role];
  uint64_t v4 = (void *)PBSUIWindowSceneSessionRoleCompact;
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v10 = v9;
  if (v5 == v8 && v7 == v9) {
    char v12 = 1;
  }
  else {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v8, v9, 0LL);
  }
  id v13 = v4;

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v10);
  return v12 & 1;
}

void sub_1000B471C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    sub_1000B476C();
  }

void sub_1000B476C()
{
  id v1 = v0;
  objc_msgSend( v0,  "bs_removeChildViewController:",  *(void *)&v0[OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_multiwayViewController]);
  uint64_t v2 = (uint64_t *)&v0[OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerCancellables];
  swift_beginAccess(&v0[OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerCancellables], v11, 1LL, 0LL);
  uint64_t v3 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain_n(*v2, 2LL);
    if (v4) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease_n(v3, 2LL);
    uint64_t v8 = *v2;
    uint64_t *v2 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease(v8);
    uint64_t v9 = swift_allocObject(&unk_1000FC4F0, 24LL, 7LL);
    *(void *)(v9 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
    id v10 = v1;
    sub_1000B4B00((uint64_t)sub_1000B5178, v9);
    swift_release(v9);
    return;
  }

  if (v3 < 0) {
    uint64_t v7 = *v2;
  }
  else {
    uint64_t v7 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(*v2, 2LL);
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v7);
  if (!v4) {
    goto LABEL_13;
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001LL) != 0)
      {
        uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
      }

      else
      {
        uint64_t v6 = *(void *)(v3 + 8 * i + 32);
        swift_retain(v6);
      }

      AnyCancellable.cancel()();
      swift_release(v6);
    }

    goto LABEL_13;
  }

  __break(1u);
}

void sub_1000B48E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018A04((uint64_t *)&unk_1001148A0);
  __chkstk_darwin(v4);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  a2 += 16LL;
  swift_beginAccess(a2, v12, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    sub_100054174(a1, (uint64_t)v6);
    uint64_t v9 = type metadata accessor for ActiveCallContext(0LL);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48LL))(v6, 1LL, v9) == 1)
    {
      sub_10001C608((uint64_t)v6, (uint64_t *)&unk_1001148A0);
      uint64_t v10 = 0LL;
    }

    else
    {
      uint64_t v10 = v6[*(int *)(v9 + 24)];
      sub_10005409C((uint64_t)v6);
    }

    MultiwayViewController.isCaptioningEnabled.setter(v10);
  }

uint64_t type metadata accessor for SplitViewCallViewController(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTime27SplitViewCallViewController, a2);
}

void sub_1000B4A94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    [*(id *)(Strong + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observers) addObject:a2];
  }

double sub_1000B4B00(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v24 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v8 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *(void **)(v2 + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerQueue);
  uint64_t v12 = swift_allocObject(&unk_1000FC478, 24LL, 7LL);
  swift_unknownObjectWeakInit(v12 + 16, v2);
  id v13 = (void *)swift_allocObject(&unk_1000FC4A0, 40LL, 7LL);
  v13[2] = v12;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_1000B5144;
  uint64_t v27 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100027654;
  aBlock[3] = &unk_1000FC4B8;
  char v14 = _Block_copy(aBlock);
  id v15 = v11;
  swift_retain(v12);
  swift_retain(a2);
  static DispatchQoS.unspecified.getter(v16);
  uint64_t v25 = _swiftEmptyArrayStorage;
  uint64_t v17 = sub_10001949C( (unint64_t *)&qword_100112930,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v18 = sub_100018A04((uint64_t *)&unk_100112FD0);
  uint64_t v19 = sub_100022750( (unint64_t *)&qword_100112940,  (uint64_t *)&unk_100112FD0,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v18, v19, v5, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v10, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v23);
  uint64_t v20 = v27;
  swift_release(v12);
  *(void *)&double result = swift_release(v20).n128_u64[0];
  return result;
}

void sub_1000B4D48(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v13, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    id v6 =  [*(id *)(Strong + OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observers) allObjects];
    uint64_t v7 = sub_100018A04(&qword_1001164A0);
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    if ((unint64_t)v8 >> 62)
    {
      if (v8 < 0) {
        uint64_t v12 = v8;
      }
      else {
        uint64_t v12 = v8 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v8);
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v12);
      swift_bridgeObjectRelease(v8);
      if (v9) {
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (v9)
      {
LABEL_4:
        if (v9 < 1)
        {
          __break(1u);
          return;
        }

        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if ((v8 & 0xC000000000000001LL) != 0)
          {
            uint64_t v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v8);
          }

          else
          {
            uint64_t v11 = *(void *)(v8 + 8 * i + 32);
            swift_unknownObjectRetain(v11);
          }

          a2(v11);
          swift_unknownObjectRelease(v11);
        }
      }
    }

    swift_bridgeObjectRelease(v8);
  }

void sub_1000B4E9C(void *a1)
{
  id v17 = [objc_allocWithZone(UIDismissSceneAction) initWithInfo:0 responder:0];
  id v2 = [a1 view];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 window];

    if (!v4 || (id v5 = [v4 windowScene], v4, !v5))
    {

      return;
    }

    id v6 = [v5 _FBSScene];

    uint64_t v7 = sub_100018A04(&qword_1001142B0);
    uint64_t inited = swift_initStackObject(v7, v19);
    *(_OWORD *)(inited + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C3FD0;
    *(void *)(inited + 32) = v17;
    uint64_t v18 = inited;
    specialized Array._endMutation()(inited);
    if ((unint64_t)v18 >> 62)
    {
      if (v18 < 0) {
        uint64_t v13 = v18;
      }
      else {
        uint64_t v13 = v18 & 0xFFFFFFFFFFFFFF8LL;
      }
      id v14 = v17;
      swift_bridgeObjectRetain(v18);
      uint64_t v15 = _CocoaArrayWrapper.endIndex.getter(v13);
      swift_bridgeObjectRelease(v18);
      if (v15) {
        goto LABEL_6;
      }
    }

    else
    {
      uint64_t v9 = *(void *)((v18 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      id v10 = v17;
      if (v9)
      {
LABEL_6:
        sub_1000B58DC(v18);
        uint64_t v12 = v11;
LABEL_13:
        swift_bridgeObjectRelease(v18);
        sub_10001C5D0(0LL, &qword_1001164A8, &OBJC_CLASS___BSAction_ptr);
        sub_100022510( &qword_1001164B0,  &qword_1001164A8,  &OBJC_CLASS___BSAction_ptr,  (uint64_t)&protocol conformance descriptor for NSObject);
        Class isa = Set._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v6, "sendActions:", isa, swift_bridgeObjectRelease(v12).n128_f64[0]);

        return;
      }
    }

    uint64_t v12 = &_swiftEmptySetSingleton;
    goto LABEL_13;
  }

  __break(1u);
}

uint64_t sub_1000B50C0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_1000B50E4(void *a1)
{
  return [a1 splitViewCallViewControllerDidStartPresentation:*(void *)(v1 + 16)];
}

uint64_t sub_1000B50F4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000B5118()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_1000B5144()
{
}

uint64_t sub_1000B5150(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000B5160(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_1000B5168(uint64_t a1)
{
}

void sub_1000B5170(uint64_t a1)
{
}

id sub_1000B5178(void *a1)
{
  return [a1 splitViewCallViewControllerDidEndPresentation:*(void *)(v1 + 16)];
}

void sub_1000B5188(uint64_t a1)
{
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(a1);
    if (v3)
    {
LABEL_3:
      sub_100018A04(&qword_1001164C0);
      id v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      uint64_t v26 = a1;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_11:
      if (a1 < 0) {
        uint64_t v7 = a1;
      }
      else {
        uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(a1);
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(a1);
      if (!v5) {
        return;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  id v4 = &_swiftEmptySetSingleton;
  uint64_t v26 = a1;
  if (v2) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    return;
  }
LABEL_15:
  unint64_t v8 = 0LL;
  uint64_t v9 = (char *)(v4 + 7);
  uint64_t v25 = v5;
  while ((v26 & 0xC000000000000001LL) != 0)
  {
    uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v26);
    BOOL v11 = __OFADD__(v8++, 1LL);
    if (v11) {
      goto LABEL_32;
    }
LABEL_24:
    uint64_t v27 = v10;
    uint64_t v29 = v10;
    uint64_t v12 = v4[5];
    uint64_t v13 = type metadata accessor for AnyCancellable(0LL);
    uint64_t v14 = sub_10001949C( &qword_100113A00,  (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable,  (uint64_t)&protocol conformance descriptor for AnyCancellable);
    uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v12, v13, v14);
    uint64_t v16 = -1LL << *((_BYTE *)v4 + 32);
    unint64_t v17 = v15 & ~v16;
    unint64_t v18 = v17 >> 6;
    uint64_t v19 = *(void *)&v9[8 * (v17 >> 6)];
    uint64_t v20 = 1LL << v17;
    if (((1LL << v17) & v19) != 0)
    {
      uint64_t v21 = ~v16;
      uint64_t v22 = sub_10001949C( &qword_1001164C8,  (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable,  (uint64_t)&protocol conformance descriptor for AnyCancellable);
      do
      {
        uint64_t v28 = *(void *)(v4[6] + 8 * v17);
        if ((dispatch thunk of static Equatable.== infix(_:_:)(&v28, &v29, v13, v22) & 1) != 0)
        {
          swift_release(v27);
          uint64_t v5 = v25;
          goto LABEL_17;
        }

        unint64_t v17 = (v17 + 1) & v21;
        unint64_t v18 = v17 >> 6;
        uint64_t v19 = *(void *)&v9[8 * (v17 >> 6)];
        uint64_t v20 = 1LL << v17;
      }

      while ((v19 & (1LL << v17)) != 0);
      uint64_t v5 = v25;
    }

    *(void *)&v9[8 * v18] = v20 | v19;
    *(void *)(v4[6] + 8 * v17) = v27;
    uint64_t v23 = v4[2];
    BOOL v11 = __OFADD__(v23, 1LL);
    uint64_t v24 = v23 + 1;
    if (v11) {
      goto LABEL_33;
    }
    void v4[2] = v24;
LABEL_17:
    if (v8 == v5) {
      return;
    }
  }

  if (v8 >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
    goto LABEL_34;
  }
  swift_retain(*(void *)(v26 + 32 + 8 * v8));
  BOOL v11 = __OFADD__(v8++, 1LL);
  if (!v11) {
    goto LABEL_24;
  }
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
}

uint64_t sub_1000B541C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v21 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10001C5D0(0LL, (unint64_t *)&qword_100112DB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v10 = (void *)static OS_dispatch_queue.main.getter(v9);
  uint64_t v11 = swift_allocObject(&unk_1000FC590, 24LL, 7LL);
  *(void *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = v0;
  aBlock[4] = sub_1000B58D4;
  uint64_t v23 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100027654;
  aBlock[3] = &unk_1000FC5A8;
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = v23;
  id v14 = v1;
  uint64_t v15 = swift_release(v13);
  static DispatchQoS.unspecified.getter(v15);
  aBlock[0] = _swiftEmptyArrayStorage;
  uint64_t v16 = sub_10001949C( (unint64_t *)&qword_100112930,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v17 = sub_100018A04((uint64_t *)&unk_100112FD0);
  uint64_t v18 = sub_100022750( (unint64_t *)&qword_100112940,  (uint64_t *)&unk_100112FD0,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v17, v18, v2, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v8, v4, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_1000B5630()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerQueue;
  uint64_t v19 = sub_10001C5D0(0LL, (unint64_t *)&qword_100112DB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter(v19);
  uint64_t v21 = _swiftEmptyArrayStorage;
  uint64_t v12 = sub_10001949C( (unint64_t *)&qword_100113130,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v13 = sub_100018A04((uint64_t *)&unk_100112DC0);
  uint64_t v14 = sub_100022750( (unint64_t *)&qword_100113140,  (uint64_t *)&unk_100112DC0,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v13, v14, v6, v12);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v2);
  uint64_t v15 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000003CLL,  0x80000001000DCF40LL,  v11,  v8,  v5,  0LL);
  *(void *)&v1[v20] = v15;
  uint64_t v16 = OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observers;
  *(void *)&v1[v16] = objc_msgSend((id)objc_opt_self( NSHashTable,  v17), "weakObjectsHashTable");
  *(void *)&v1[OBJC_IVAR____TtC8FaceTime27SplitViewCallViewController_observerCancellables] = _swiftEmptyArrayStorage;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/SplitViewCallViewController.swift",  42LL,  2LL,  44LL,  0);
  __break(1u);
}

uint64_t sub_1000B5890()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000B58BC()
{
}

uint64_t sub_1000B58C4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000B58D4()
{
}

void sub_1000B58DC(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100018A04(&qword_1001164B8);
      uint64_t v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2) {
        goto LABEL_4;
      }
LABEL_11:
      if (v1 < 0) {
        uint64_t v7 = v1;
      }
      else {
        uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v1);
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(v1);
      if (!v5) {
        return;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = &_swiftEmptySetSingleton;
  if (v2) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    return;
  }
LABEL_15:
  unint64_t v8 = (char *)(v4 + 7);
  uint64_t v45 = v5;
  if ((v1 & 0xC000000000000001LL) != 0)
  {
    uint64_t v9 = 0LL;
    uint64_t v43 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
        BOOL v11 = __OFADD__(v9++, 1LL);
        if (v11)
        {
          __break(1u);
          goto LABEL_42;
        }

        uint64_t v12 = v10;
        Swift::Int v13 = NSObject._rawHashValue(seed:)(v4[5]);
        uint64_t v14 = -1LL << *((_BYTE *)v4 + 32);
        unint64_t v15 = v13 & ~v14;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
        uint64_t v18 = 1LL << v15;
        if (((1LL << v15) & v17) != 0) {
          break;
        }
LABEL_26:
        *(void *)&v8[8 * v16] = v18 | v17;
        *(void *)(v4[6] + 8 * v15) = v12;
        uint64_t v24 = v4[2];
        BOOL v11 = __OFADD__(v24, 1LL);
        uint64_t v25 = v24 + 1;
        if (v11) {
          goto LABEL_43;
        }
        void v4[2] = v25;
        if (v9 == v5) {
          return;
        }
      }

      sub_10001C5D0(0LL, &qword_1001164A8, &OBJC_CLASS___BSAction_ptr);
      id v19 = *(id *)(v4[6] + 8 * v15);
      char v20 = static NSObject.== infix(_:_:)(v19, v12);

      if ((v20 & 1) == 0)
      {
        uint64_t v21 = ~v14;
        while (1)
        {
          unint64_t v15 = (v15 + 1) & v21;
          unint64_t v16 = v15 >> 6;
          uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
          uint64_t v18 = 1LL << v15;
          if ((v17 & (1LL << v15)) == 0) {
            break;
          }
          id v22 = *(id *)(v4[6] + 8 * v15);
          char v23 = static NSObject.== infix(_:_:)(v22, v12);

          if ((v23 & 1) != 0) {
            goto LABEL_17;
          }
        }

        uint64_t v1 = v43;
        uint64_t v5 = v45;
        goto LABEL_26;
      }

uint64_t sub_1000B5C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_1000B76A0(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (!v9)
    {
LABEL_6:
      unint64_t v15 = 0LL;
      return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (!v9) {
      goto LABEL_6;
    }
  }

  uint64_t v10 = *(void *)(a3 + 24);
  uint64_t ObjectType = swift_getObjectType(v9);
  swift_unknownObjectRetain(v9);
  uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  uint64_t v14 = v13;
  swift_unknownObjectRelease(v9);
  if (!(v14 | v12)) {
    goto LABEL_6;
  }
  v18[0] = 0LL;
  v18[1] = 0LL;
  unint64_t v15 = v18;
  v18[2] = v12;
  v18[3] = v14;
  return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_1000B5D7C(uint64_t a1, char *a2, void *a3)
{
  id v36 = a3;
  uint64_t v5 = type metadata accessor for Signposts.Interval(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100018A04((uint64_t *)&unk_100113110);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100018A04(&qword_100115308);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  unint64_t v15 = (char *)&aBlock[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&aBlock[-1] - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v18((char *)&aBlock[-1] - v16, a1, v11);
  v18(v15, (uint64_t)v17, v11);
  uint64_t v19 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v20 = (v19 + 16) & ~v19;
  uint64_t v21 = swift_allocObject(&unk_1000FC618, v20 + v13, v19 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v21 + v20, v17, v11);
  sub_100084528();
  uint64_t v22 = type metadata accessor for JoinCallContext(0LL);
  swift_storeEnumTagMultiPayload(v10, v22, 2LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56LL))(v10, 0LL, 1LL, v22);
  uint64_t v23 = (uint64_t)&a2[OBJC_IVAR____TtC8FaceTime14ATVCallManager_lastJoinCallContext];
  swift_beginAccess(&a2[OBJC_IVAR____TtC8FaceTime14ATVCallManager_lastJoinCallContext], aBlock, 33LL, 0LL);
  sub_100085860((uint64_t)v10, v23);
  *(void *)&double v24 = swift_endAccess(aBlock).n128_u64[0];
  id v25 = v36;
  id v26 = objc_msgSend(v36, "uuid", v24);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v26);

  uint64_t v27 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56LL))(v7, 0LL, 1LL, v27);
  uint64_t v28 = sub_10002EB94((uint64_t)v7);
  swift_release(v28);
  sub_10001C644((uint64_t)v7, type metadata accessor for Signposts.Interval);
  Swift::Int v29 = *(void **)&a2[OBJC_IVAR____TtC8FaceTime14ATVCallManager_conduit];
  uint64_t v30 = (void *)swift_allocObject(&unk_1000FC640, 40LL, 7LL);
  v30[2] = a2;
  v30[3] = sub_1000B7758;
  v30[4] = v21;
  aBlock[4] = sub_1000B77C4;
  id v38 = v30;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10008FD2C;
  aBlock[3] = &unk_1000FC658;
  unint64_t v31 = _Block_copy(aBlock);
  unint64_t v32 = v38;
  uint64_t v33 = a2;
  swift_retain(v21);
  objc_msgSend(v29, "joinContinuityConversationWithRequest:completion:", v25, v31, swift_release(v32).n128_f64[0]);
  _Block_release(v31);
  __n128 v34 = swift_release(v21);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v12 + 8))(v15, v11, v34);
}

uint64_t sub_1000B60B8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10001C378(v0, qword_1001164D0);
  sub_10001C270(v0, (uint64_t)qword_1001164D0);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x80000001000D8590LL,  0xD000000000000015LL,  0x80000001000C7570LL);
}

id sub_1000B6134()
{
  uint64_t v1 = OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___controlsView;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___controlsView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___controlsView);
  }

  else
  {
    uint64_t v4 = v0;
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC8FaceTime21StagingViewController_continuityConversation);
    id v6 = objc_allocWithZone((Class)type metadata accessor for ContinuityConversationControlsView(0LL));
    uint64_t v7 = (void *)ContinuityConversationControlsView.init(continuityConversation:isAudioEnabled:isVideoEnabled:)( v5,  1LL,  1LL);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v8 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    unint64_t v2 = 0LL;
  }

  id v9 = v2;
  return v3;
}

char *sub_1000B61D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___shadowView;
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___shadowView);
  if (v4)
  {
    uint64_t v5 = *(char **)(v2 + OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___shadowView);
  }

  else
  {
    uint64_t v6 = v2;
    uint64_t v7 = type metadata accessor for GradientView(0LL, a2);
    uint64_t v8 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7)) init];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v9 = sub_100018A04(&qword_1001142B0);
    uint64_t v10 = swift_allocObject(v9, 48LL, 7LL);
    *(_OWORD *)(v10 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C3FC0;
    *(void *)(v10 + 32) = objc_msgSend((id)objc_opt_self( UIColor,  v11), "clearColor");
    id v12 = [objc_allocWithZone(UIColor) initWithWhite:0.0 alpha:0.45];
    *(void *)(v10 + 40) = v12;
    v19[0] = v10;
    specialized Array._endMutation()(v12);
    uint64_t v13 = v10;
    uint64_t v14 = (uint64_t *)&v8[OBJC_IVAR____TtC8FaceTime12GradientView_colors];
    swift_beginAccess(&v8[OBJC_IVAR____TtC8FaceTime12GradientView_colors], v19, 1LL, 0LL);
    uint64_t v15 = *v14;
    *uint64_t v14 = v13;
    swift_bridgeObjectRelease(v15);
    sub_100029810();
    uint64_t v16 = *(void **)(v6 + v3);
    *(void *)(v6 + v3) = v8;
    uint64_t v5 = v8;

    uint64_t v4 = 0LL;
  }

  id v17 = v4;
  return v5;
}

id sub_1000B6324(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC8FaceTime21StagingViewController_delegate];
  *((void *)v3 + 1) = 0LL;
  uint64_t v4 = swift_unknownObjectWeakInit(v3, 0LL);
  *(void *)&v1[OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___controlsView] = 0LL;
  *(void *)&v1[OBJC_IVAR____TtC8FaceTime21StagingViewController____lazy_storage___shadowView] = 0LL;
  *(void *)&v1[OBJC_IVAR____TtC8FaceTime21StagingViewController_joinContinuityConversationTask] = 0LL;
  *(void *)&v1[OBJC_IVAR____TtC8FaceTime21StagingViewController_continuityConversation] = a1;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for StagingViewController(v4, v5);
  id v6 = a1;
  id v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v7, "setModalPresentationStyle:", 6, v9.receiver, v9.super_class);

  return v7;
}

void sub_1000B6488(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v78.receiver = v2;
  v78.super_class = (Class)type metadata accessor for StagingViewController(a1, a2);
  objc_msgSendSuper2(&v78, "viewDidLoad");
  id v4 = sub_1000B6134();
  unint64_t v6 = sub_1000B7A18((uint64_t)v4, v5);
  uint64_t v7 = swift_unknownObjectRetain(v3);
  dispatch thunk of ContinuityConversationControlsView.delegate.setter(v7, v6);

  id v8 = [v3 view];
  if (!v8)
  {
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v10 = v8;
  uint64_t v11 = sub_1000B61D0((uint64_t)v8, v9);
  [v10 addSubview:v11];

  id v12 = [v3 view];
  if (!v12)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v13 = v12;
  id v14 = sub_1000B6134();
  [v13 addSubview:v14];

  uint64_t v77 = sub_100018A04(&qword_1001142B0);
  uint64_t v15 = swift_allocObject(v77, 96LL, 7LL);
  *(_OWORD *)(v15 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C5EE0;
  id v16 = sub_1000B6134();
  id v17 = [v16 bottomAnchor];

  id v18 = [v3 safeAreaLayoutGuide];
  id v19 = [v18 bottomAnchor];

  id v20 = [v17 constraintEqualToAnchor:v19];
  *(void *)(v15 + 32) = v20;
  id v21 = sub_1000B6134();
  id v22 = [v21 leadingAnchor];

  id v23 = [v3 safeAreaLayoutGuide];
  id v24 = [v23 leadingAnchor];

  id v25 = [v22 constraintEqualToAnchor:v24];
  *(void *)(v15 + 40) = v25;
  id v26 = sub_1000B6134();
  id v27 = [v26 heightAnchor];

  id v28 = [v27 constraintEqualToConstant:600.0];
  *(void *)(v15 + 48) = v28;
  id v29 = sub_1000B6134();
  id v30 = [v29 widthAnchor];

  id v31 = [v30 constraintEqualToConstant:800.0];
  *(void *)(v15 + 56) = v31;
  __n128 v34 = sub_1000B61D0(v32, v33);
  id v35 = [v34 leadingAnchor];

  id v36 = [v3 view];
  if (!v36)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v37 = v36;
  id v38 = [v36 leadingAnchor];

  id v39 = [v35 constraintEqualToAnchor:v38];
  *(void *)(v15 + 64) = v39;
  uint64_t v42 = sub_1000B61D0(v40, v41);
  id v43 = [v42 trailingAnchor];

  id v44 = [v3 view];
  if (!v44)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v45 = v44;
  id v46 = [v44 trailingAnchor];

  id v47 = [v43 constraintEqualToAnchor:v46];
  *(void *)(v15 + 72) = v47;
  uint64_t v50 = sub_1000B61D0(v48, v49);
  id v51 = [v50 topAnchor];

  id v52 = [v3 view];
  if (!v52)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v53 = v52;
  id v54 = [v52 centerYAnchor];

  id v55 = [v51 constraintEqualToAnchor:v54];
  *(void *)(v15 + 80) = v55;
  uint64_t v58 = sub_1000B61D0(v56, v57);
  id v59 = [v58 bottomAnchor];

  id v60 = [v3 view];
  if (!v60)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  unint64_t v62 = v60;
  uint64_t v63 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint, v61);
  id v64 = [v62 bottomAnchor];

  id v65 = [v59 constraintEqualToAnchor:v64];
  *(void *)(v15 + 88) = v65;
  specialized Array._endMutation()(v66);
  uint64_t v67 = v15;
  sub_10001C5D0(0LL, (unint64_t *)&qword_100113120, &OBJC_CLASS___NSLayoutConstraint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v63, "activateConstraints:", isa, swift_bridgeObjectRelease(v67).n128_f64[0]);

  id v69 = [objc_allocWithZone(UITapGestureRecognizer) initWithTarget:v3 action:"menuButtonPressed:"];
  uint64_t v70 = swift_allocObject(v77, 40LL, 7LL);
  *(_OWORD *)(v70 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C3FD0;
  id v71 = v69;
  v72.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  *(NSNumber *)(v70 + 32) = v72;
  specialized Array._endMutation()(v72.super.super.isa);
  uint64_t v73 = v70;
  sub_10001C5D0(0LL, &qword_1001148C0, &OBJC_CLASS___NSNumber_ptr);
  Class v74 = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v71, "setAllowedPressTypes:", v74, swift_bridgeObjectRelease(v73).n128_f64[0]);

  id v75 = [v3 view];
  if (v75)
  {
    uint64_t v76 = v75;
    [v75 addGestureRecognizer:v71];

    return;
  }

id sub_1000B6BA0(uint64_t a1, uint64_t a2)
{
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for StagingViewController(a1, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for StagingViewController(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTime21StagingViewController, a2);
}

uint64_t sub_1000B6C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  v5[8] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[9] = v7;
  v5[10] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  v5[11] = static MainActor.shared.getter(v8);
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v5[12] = v9;
  v5[13] = v10;
  return swift_task_switch(sub_1000B6CEC, v9, v10);
}

uint64_t sub_1000B6CEC()
{
  if (qword_100112478 != -1) {
    swift_once(&qword_100112478, sub_1000B60B8);
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v0[14] = sub_10001C270(v2, (uint64_t)qword_1001164D0);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[6];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    id v24 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v7 = 138412290;
    v0[5] = v6;
    id v8 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 5, v0 + 6, v7 + 4, v7 + 12);
    *id v24 = v6;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Requesting to join %@", v7, 0xCu);
    uint64_t v9 = sub_100018A04((uint64_t *)&unk_100112E20);
    swift_arrayDestroy(v24, 1LL, v9);
    swift_slowDealloc(v24, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
  }

  if (qword_100112380 != -1) {
    swift_once(&qword_100112380, sub_100080AF0);
  }
  uint64_t v11 = v0[9];
  uint64_t v10 = v0[10];
  uint64_t v12 = v0[8];
  uint64_t v13 = (void *)v0[6];
  id v14 = (void *)qword_10011A2F0;
  v0[15] = qword_10011A2F0;
  id v15 = v14;
  id v16 = [v13 uuid];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v16);

  id v17 = sub_1000B6134();
  char v18 = dispatch thunk of ContinuityConversationControlsView.isAudioEnabled.getter();

  id v19 = sub_1000B6134();
  char v20 = dispatch thunk of ContinuityConversationControlsView.isVideoEnabled.getter();

  id v21 = objc_allocWithZone(&OBJC_CLASS___TUJoinContinuityConversationRequest);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  v0[16] = [v21 initWithUUID:isa isAudioEnabled:v18 & 1 isVideoEnabled:v20 & 1 wantsStagingArea:0];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  v0[2] = v15;
  return swift_task_switch(sub_1000B6F8C, 0LL, 0LL);
}

uint64_t sub_1000B6F8C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = swift_task_alloc(32LL);
  v0[17] = v2;
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v0 + 2;
  *(void *)(v2 + 24) = v1;
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v0[18] = v3;
  void *v3 = v0;
  v3[1] = sub_1000B7030;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)( v3,  0LL,  0LL,  0xD000000000000021LL,  0x80000001000DCE10LL,  sub_1000B76E8,  v2,  (char *)&type metadata for () + 8);
}

uint64_t sub_1000B7030()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 144);
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    os_log_type_t v4 = sub_1000B709C;
  }

  else
  {
    swift_task_dealloc(*(void *)(v2 + 136));
    os_log_type_t v4 = sub_1000B727C;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000B709C()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void **)(v0 + 120);

  swift_task_dealloc(v1);
  return swift_task_switch(sub_1000B70E4, *(void *)(v0 + 96), *(void *)(v0 + 104));
}

uint64_t sub_1000B70E4()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release(*(void *)(v0 + 88));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v12 = *(void *)(v0 + 152);
    os_log_type_t v4 = *(void **)(v0 + 48);
    BOOL v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)BOOL v5 = 138412290;
    *(void *)(v0 + 24) = v4;
    id v6 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v5 + 4, v5 + 12);
    *uint64_t v11 = v4;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to join %@", v5, 0xCu);
    uint64_t v7 = sub_100018A04((uint64_t *)&unk_100112E20);
    swift_arrayDestroy(v11, 1LL, v7);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
    swift_errorRelease(v12);
  }

  else
  {
    id v8 = *(void **)(v0 + 48);
    swift_errorRelease(*(void *)(v0 + 152));

    uint64_t v2 = *(os_log_s **)(v0 + 48);
  }

  uint64_t v9 = *(void *)(v0 + 80);

  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B727C()
{
  uint64_t v1 = *(void **)(v0 + 120);

  return swift_task_switch(sub_1000B72B8, *(void *)(v0 + 96), *(void *)(v0 + 104));
}

uint64_t sub_1000B72B8()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release(*(void *)(v0 + 88));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = *(void **)(v0 + 48);
    BOOL v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)BOOL v5 = 138412290;
    *(void *)(v0 + 32) = v4;
    id v6 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v5 + 4, v5 + 12);
    void *v10 = v4;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Successfully joined %@", v5, 0xCu);
    uint64_t v7 = sub_100018A04((uint64_t *)&unk_100112E20);
    swift_arrayDestroy(v10, 1LL, v7);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {

    uint64_t v2 = *(os_log_s **)(v0 + 48);
  }

  uint64_t v8 = *(void *)(v0 + 80);

  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000B7438()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC8FaceTime21StagingViewController_delegate);
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    id v3 = sub_1000B6134();
    char v4 = dispatch thunk of ContinuityConversationControlsView.isVideoEnabled.getter();

    id v5 = [v2 faceTimeContainerViewController];
    if (v5)
    {
      id v6 = v5;
      sub_1000781E8((v4 & 1) == 0, 1);
      swift_unknownObjectRelease(v2);
    }

    else
    {
      __break(1u);
    }
  }

double sub_1000B74EC(void *a1)
{
  uint64_t v3 = sub_100018A04(&qword_100114970);
  __chkstk_darwin(v3);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  type metadata accessor for MainActor(0LL);
  id v7 = a1;
  uint64_t v8 = v1;
  uint64_t v9 = static MainActor.shared.getter(v8);
  uint64_t v10 = (void *)swift_allocObject(&unk_1000FC5F0, 48LL, 7LL);
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v7;
  v10[5] = v8;
  uint64_t v11 = sub_1000B5C50((uint64_t)v5, (uint64_t)&unk_100116540, (uint64_t)v10);
  uint64_t v12 = *(void *)&v8[OBJC_IVAR____TtC8FaceTime21StagingViewController_joinContinuityConversationTask];
  *(void *)&v8[OBJC_IVAR____TtC8FaceTime21StagingViewController_joinContinuityConversationTask] = v11;
  *(void *)&double result = swift_release(v12).n128_u64[0];
  return result;
}

uint64_t sub_1000B75F4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000B7628(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc(dword_10011653C);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10001C158;
  return sub_1000B6C58(a1, v4, v5, v7, v6);
}

uint64_t sub_1000B76A0(uint64_t a1)
{
  uint64_t v2 = sub_100018A04(&qword_100114970);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000B76E0(uint64_t a1, char **a2, void *a3)
{
  return sub_1000B5D7C(a1, *a2, a3);
}

uint64_t sub_1000B76E8(uint64_t a1)
{
  return sub_1000B5D7C(a1, **(char ***)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000B76F4()
{
  uint64_t v1 = sub_100018A04(&qword_100115308);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000B7758(uint64_t a1)
{
  return sub_100080614(a1);
}

uint64_t sub_1000B7798()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000B77C4(uint64_t a1)
{
  return sub_100083CD4(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_1000B77D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000B77E0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_1000B77E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RootViewController.Event(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (uint64_t *)((char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (*(void *)&v0[OBJC_IVAR____TtC8FaceTime21StagingViewController_joinContinuityConversationTask])
  {
    if (qword_100112478 != -1) {
      swift_once(&qword_100112478, sub_1000B60B8);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    uint64_t v6 = sub_10001C270(v5, (uint64_t)qword_1001164D0);
    char v18 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v7, "Dropping menu press while join is in progress.", v8, 2u);
      swift_slowDealloc(v8, -1LL, -1LL);
    }
  }

  else
  {
    if (qword_100112478 != -1) {
      swift_once(&qword_100112478, sub_1000B60B8);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    uint64_t v10 = sub_10001C270(v9, (uint64_t)qword_1001164D0);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Backing out of staging area.", v13, 2u);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC8FaceTime21StagingViewController_delegate]);
    if (Strong)
    {
      uint64_t v15 = Strong;
      *uint64_t v4 = v1;
      swift_storeEnumTagMultiPayload(v4, v2, 5LL);
      id v16 = v1;
      sub_100056F4C((uint64_t)v4);
      sub_10001C644((uint64_t)v4, type metadata accessor for RootViewController.Event);
      swift_unknownObjectRelease(v15);
    }
  }

unint64_t sub_1000B7A18(uint64_t a1, uint64_t a2)
{
  unint64_t result = qword_100116548;
  if (!qword_100116548)
  {
    uint64_t v3 = type metadata accessor for StagingViewController(0LL, a2);
    unint64_t result = swift_getWitnessTable(&unk_1000C75A8, v3);
    atomic_store(result, (unint64_t *)&qword_100116548);
  }

  return result;
}

uint64_t sub_1000B7A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_1000B7B1C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  char v4 = a2;
  uint64_t v6 = type metadata accessor for SidebarNavigationBaseChildViewController(0LL, a2);
  uint64_t Strong = swift_dynamicCastClass(a1, v6);
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC8FaceTime27SidebarNavigationController_resizingDelegate]);
    if (Strong)
    {
      uint64_t v10 = Strong;
      char v11 = *(_BYTE *)(v9 + OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController_wantsExpandedSidebar);
      id v12 = a1;
      sub_100079164(v11);

      uint64_t Strong = swift_unknownObjectRelease(v10);
    }
  }

  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for SidebarNavigationController(Strong, v8);
  return objc_msgSendSuper2(&v14, "pushViewController:animated:", a1, v4 & 1);
}

id sub_1000B7C34(uint64_t a1, uint64_t a2)
{
  char v3 = a1;
  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for SidebarNavigationController(a1, a2);
  id v4 = objc_msgSendSuper2(&v14, "popViewControllerAnimated:", v3 & 1);
  id v5 = [v2 topViewController];
  if (v5)
  {
    os_log_type_t v7 = v5;
    uint64_t v8 = type metadata accessor for SidebarNavigationBaseChildViewController(0LL, v6);
    uint64_t v9 = swift_dynamicCastClass(v7, v8);
    if (v9
      && (uint64_t v10 = v9,
          (uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC8FaceTime27SidebarNavigationController_resizingDelegate])) != 0))
    {
      uint64_t v12 = Strong;
      sub_100079164(*(_BYTE *)(v10
                             + OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController_wantsExpandedSidebar));

      swift_unknownObjectRelease(v12);
    }

    else
    {
    }
  }

  return v4;
}

uint64_t sub_1000B7D40(uint64_t a1, uint64_t a2)
{
  char v3 = a1;
  v18.receiver = v2;
  v18.super_class = (Class)type metadata accessor for SidebarNavigationController(a1, a2);
  id v4 = objc_msgSendSuper2(&v18, "popToRootViewControllerAnimated:", v3 & 1);
  if (v4)
  {
    uint64_t v6 = v4;
    unint64_t v7 = sub_1000B87C0(0LL, v5);
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  id v9 = [v2 topViewController];
  if (v9)
  {
    char v11 = v9;
    uint64_t v12 = type metadata accessor for SidebarNavigationBaseChildViewController(0LL, v10);
    uint64_t v13 = swift_dynamicCastClass(v11, v12);
    if (v13
      && (uint64_t v14 = v13,
          (uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC8FaceTime27SidebarNavigationController_resizingDelegate])) != 0))
    {
      uint64_t v16 = Strong;
      sub_100079164(*(_BYTE *)(v14
                             + OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController_wantsExpandedSidebar));

      swift_unknownObjectRelease(v16);
    }

    else
    {
    }
  }

  return v8;
}

id sub_1000B7F2C()
{
  return sub_10004530C((uint64_t (*)(void))type metadata accessor for SidebarNavigationController);
}

uint64_t type metadata accessor for SidebarNavigationController(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTime27SidebarNavigationController, a2);
}

void sub_1000B8044(void *a1, void *a2, void *a3)
{
  uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___UIView, a2);
  [a1 duration];
  double v8 = v7;
  uint64_t v9 = swift_allocObject(&unk_1000FC748, 32LL, 7LL);
  *(void *)(v9 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  id v22 = sub_1000B878C;
  uint64_t v23 = v9;
  objc_super v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256LL;
  char v20 = sub_100027654;
  id v21 = &unk_1000FC760;
  uint64_t v10 = _Block_copy(&v18);
  uint64_t v11 = v23;
  id v12 = a2;
  id v13 = a3;
  swift_release(v11);
  uint64_t v14 = swift_allocObject(&unk_1000FC798, 24LL, 7LL);
  *(void *)(v14 + swift_unknownObjectWeakDestroy(v0 + 16) = v12;
  id v22 = sub_1000B87B8;
  uint64_t v23 = v14;
  objc_super v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256LL;
  char v20 = sub_1000B7A5C;
  id v21 = &unk_1000FC7B0;
  uint64_t v15 = _Block_copy(&v18);
  uint64_t v16 = v23;
  id v17 = v12;
  swift_release(v16);
  [v6 animateKeyframesWithDuration:0 delay:v10 options:v15 animations:v8 completion:0.0];
  _Block_release(v15);
  _Block_release(v10);
}

void sub_1000B81B0(void *a1, void *a2)
{
  id v4 = (void *)objc_opt_self(&OBJC_CLASS___UIView, a2);
  uint64_t v5 = swift_allocObject(&unk_1000FC7E8, 24LL, 7LL);
  *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  id v17 = sub_1000607B0;
  uint64_t v18 = v5;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 1107296256LL;
  uint64_t v15 = sub_100027654;
  uint64_t v16 = &unk_1000FC800;
  uint64_t v6 = _Block_copy(&v13);
  uint64_t v7 = v18;
  id v8 = a1;
  swift_release(v7);
  [v4 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:0.15];
  _Block_release(v6);
  uint64_t v9 = swift_allocObject(&unk_1000FC838, 24LL, 7LL);
  *(void *)(v9 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  id v17 = sub_1000607F0;
  uint64_t v18 = v9;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 1107296256LL;
  uint64_t v15 = sub_100027654;
  uint64_t v16 = &unk_1000FC850;
  uint64_t v10 = _Block_copy(&v13);
  uint64_t v11 = v18;
  id v12 = a2;
  swift_release(v11);
  [v4 addKeyframeWithRelativeStartTime:v10 relativeDuration:0.2 animations:0.8];
  _Block_release(v10);
}

void sub_1000B831C(int a1, id a2)
{
  id v2 = [a2 view];
  if (v2)
  {
    id v3 = v2;
    [v2 setAlpha:1.0];
  }

  else
  {
    __break(1u);
  }

id sub_1000B83E4()
{
  return sub_10004530C((uint64_t (*)(void))type metadata accessor for SidebarTransition);
}

uint64_t type metadata accessor for SidebarTransition(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTime17SidebarTransition, a2);
}

void sub_1000B8410(void *a1)
{
  id v2 = [a1 viewControllerForKey:UITransitionContextFromViewControllerKey];
  if (v2)
  {
    id v20 = v2;
    id v3 = [a1 viewControllerForKey:UITransitionContextToViewControllerKey];
    if (!v3)
    {

      return;
    }

    id v4 = v3;
    id v5 = [v3 view];
    if (v5)
    {
      uint64_t v6 = v5;
      [v5 setAlpha:0.0];

      id v7 = [a1 containerView];
      id v8 = [v4 view];
      if (v8)
      {
        uint64_t v9 = v8;
        [v7 addSubview:v8];

        id v10 = [objc_allocWithZone(UIViewPropertyAnimator) initWithDuration:0 curve:0 animations:0.5];
        uint64_t v11 = (void *)swift_allocObject(&unk_1000FC6A8, 40LL, 7LL);
        v11[2] = v10;
        v11[3] = v20;
        v11[4] = v4;
        id v25 = sub_1000B8704;
        id v26 = v11;
        aBlock = _NSConcreteStackBlock;
        uint64_t v22 = 1107296256LL;
        uint64_t v23 = sub_100027654;
        id v24 = &unk_1000FC6C0;
        id v12 = _Block_copy(&aBlock);
        id v13 = v26;
        id v14 = v10;
        id v15 = v20;
        id v16 = v4;
        swift_retain(v11);
        objc_msgSend(v14, "addAnimations:", v12, swift_release(v13).n128_f64[0]);
        _Block_release(v12);
        uint64_t v17 = swift_allocObject(&unk_1000FC6F8, 24LL, 7LL);
        *(void *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
        id v25 = sub_1000B874C;
        id v26 = (void *)v17;
        aBlock = _NSConcreteStackBlock;
        uint64_t v22 = 1107296256LL;
        uint64_t v23 = sub_1000B7A5C;
        id v24 = &unk_1000FC710;
        uint64_t v18 = _Block_copy(&aBlock);
        uint64_t v19 = v26;
        swift_unknownObjectRetain(a1);
        objc_msgSend(v14, "addCompletion:", v18, swift_release(v19).n128_f64[0]);
        _Block_release(v18);
        [v14 startAnimation];

        swift_release(v11);
        return;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
  }

uint64_t sub_1000B86D0()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_1000B8704()
{
}

uint64_t sub_1000B8710(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000B8720(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000B8728()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_1000B874C()
{
  return [*(id *)(v0 + 16) completeTransition:1];
}

uint64_t sub_1000B8760()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000B878C()
{
}

uint64_t sub_1000B8794()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000B87B8(int a1)
{
}

unint64_t sub_1000B87C0(uint64_t a1, uint64_t a2)
{
  unint64_t result = qword_100113080;
  if (!qword_100113080)
  {
    uint64_t v3 = objc_opt_self(&OBJC_CLASS___UIViewController, a2);
    unint64_t result = swift_getObjCClassMetadata(v3);
    atomic_store(result, (unint64_t *)&qword_100113080);
  }

  return result;
}

id sub_1000B882C()
{
  uint64_t v1 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (uint64_t *)((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  *id v4 = [v0 queue];
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  char v5 = _dispatchPreconditionTest(_:)(v4);
  id result = (id)(*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    id result = [v0 audioOrVideoCallWithStatus:4];
    if (!result)
    {
      id result = [v0 audioOrVideoCallWithStatus:1];
      if (!result)
      {
        id result = [v0 audioOrVideoCallWithStatus:3];
        if (!result) {
          return [v0 audioOrVideoCallWithStatus:2];
        }
      }
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_1000B895C()
{
  qword_10011A410 = 0x4048000000000000LL;
}

void sub_1000B896C()
{
  qword_10011A418 = 0x404E000000000000LL;
}

void sub_1000B897C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v46.receiver = v2;
  v46.super_class = (Class)type metadata accessor for AddParticipantNavigationSidebar(a1, a2);
  objc_msgSendSuper2(&v46, "viewDidLoad");
  id v4 = *(void **)&v2[OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar_visualEffectView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [v4 layer];
  [v5 setZPosition:-1.0];

  [v4 setUserInteractionEnabled:0];
  id v6 = [v3 view];
  if (!v6)
  {
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v7 = v6;
  [v6 addSubview:v4];

  id v8 = [v3 view];
  if (!v8)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v9 = v8;
  [v8 setClipsToBounds:0];

  uint64_t v10 = sub_100018A04(&qword_1001142B0);
  uint64_t v11 = swift_allocObject(v10, 64LL, 7LL);
  *(_OWORD *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C4CE0;
  id v12 = [v4 leadingAnchor];
  id v13 = [v3 view];
  if (!v13)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  id v14 = v13;
  id v15 = [v13 leadingAnchor];

  id v16 = [v12 constraintEqualToAnchor:v15];
  *(void *)(v11 + 32) = v16;
  id v17 = [v4 topAnchor];
  id v18 = [v3 view];
  if (!v18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v19 = v18;
  id v20 = [v18 topAnchor];

  id v21 = [v17 constraintEqualToAnchor:v20];
  *(void *)(v11 + 40) = v21;
  id v22 = [v4 bottomAnchor];
  id v23 = [v3 view];
  if (!v23)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  id v24 = v23;
  id v25 = [v23 bottomAnchor];

  id v26 = [v22 constraintEqualToAnchor:v25];
  *(void *)(v11 + 48) = v26;
  id v27 = [v4 trailingAnchor];
  id v28 = [v3 view];
  if (!v28)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  id v30 = v28;
  id v31 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint, v29);
  id v32 = [v30 trailingAnchor];

  id v33 = [v27 constraintEqualToAnchor:v32];
  *(void *)(v11 + 56) = v33;
  specialized Array._endMutation()(v34);
  uint64_t v35 = v11;
  sub_10001C5D0(0LL, (unint64_t *)&qword_100113120, &OBJC_CLASS___NSLayoutConstraint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v31, "activateConstraints:", isa, swift_bridgeObjectRelease(v35).n128_f64[0]);

  id v37 = [objc_allocWithZone(UITapGestureRecognizer) init];
  [v37 addTarget:v3 action:"menuButtonActionWithRecognizer:"];
  uint64_t v38 = swift_allocObject(v10, 40LL, 7LL);
  *(_OWORD *)(v38 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C3FD0;
  id v39 = objc_allocWithZone(&OBJC_CLASS___NSNumber);
  id v40 = v37;
  id v41 = [v39 initWithInteger:5];
  *(void *)(v38 + 32) = v41;
  specialized Array._endMutation()(v41);
  uint64_t v42 = v38;
  sub_10001C5D0(0LL, &qword_1001148C0, &OBJC_CLASS___NSNumber_ptr);
  Class v43 = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v40, "setAllowedPressTypes:", v43, swift_bridgeObjectRelease(v42).n128_f64[0]);

  id v44 = [v3 view];
  if (v44)
  {
    uint64_t v45 = v44;
    [v44 addGestureRecognizer:v40];

    return;
  }

id sub_1000B8E80()
{
  id v0 = [objc_allocWithZone(UIView) init];
  id v1 = [v0 layer];
  id v3 = objc_msgSend((id)objc_opt_self(UIColor, v2), "blackColor");
  id v4 = [v3 colorWithAlphaComponent:0.2];

  id v5 = [v4 CGColor];
  [v1 setShadowColor:v5];

  id v6 = [v0 layer];
  objc_msgSend(v6, "setShadowOffset:", 0.0, 4.0);

  id v7 = [v0 layer];
  if (qword_100112480 != -1) {
    swift_once(&qword_100112480, sub_1000B895C);
  }
  [v7 setShadowRadius:*(double *)&qword_10011A410];

  id v8 = [v0 layer];
  LODWORD(v9) = 1.0;
  [v8 setShadowOpacity:v9];

  id v10 = [v0 layer];
  [v10 setShadowPathIsBounds:1];

  id v11 = [v0 layer];
  [v0 bounds];
  id v17 =  objc_msgSend( (id)objc_opt_self(UIBezierPath, v12),  "bezierPathWithRoundedRect:cornerRadius:",  v13,  v14,  v15,  v16,  *(double *)&qword_10011A410);
  id v18 = [v17 CGPath];

  [v11 setShadowPath:v18];
  sub_10001C5D0(0LL, (unint64_t *)&unk_100114ED0, &OBJC_CLASS___UIBlurEffect_ptr);
  uint64_t v19 = (void *)UIBlurEffect.init(privateStyle:)(4005LL);
  id v20 = [objc_allocWithZone(UIVisualEffectView) initWithEffect:v19];

  id v21 = [v20 layer];
  [v21 setCornerRadius:*(double *)&qword_10011A410];

  id v22 = [v20 layer];
  [v22 setMasksToBounds:1];

  id v23 = [v20 layer];
  [v23 setBorderWidth:1.0];

  id v24 = [v20 layer];
  id v25 = [objc_allocWithZone(UIColor) initWithWhite:1.0 alpha:0.1];
  id v26 = [v25 CGColor];

  [v24 setBorderColor:v26];
  [v0 addSubview:v20];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v28 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint, v27);
  uint64_t v29 = sub_100018A04(&qword_1001142B0);
  uint64_t v30 = swift_allocObject(v29, 64LL, 7LL);
  *(_OWORD *)(v30 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C4CE0;
  id v31 = [v20 topAnchor];
  id v32 = [v0 topAnchor];
  id v33 = [v31 constraintEqualToAnchor:v32];

  *(void *)(v30 + 32) = v33;
  id v34 = [v20 bottomAnchor];
  id v35 = [v0 bottomAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35];

  *(void *)(v30 + 40) = v36;
  id v37 = [v20 leadingAnchor];
  id v38 = [v0 leadingAnchor];
  id v39 = [v37 constraintEqualToAnchor:v38];

  *(void *)(v30 + 48) = v39;
  id v40 = [v20 trailingAnchor];
  id v41 = [v0 trailingAnchor];
  id v42 = [v40 constraintEqualToAnchor:v41];

  *(void *)(v30 + 56) = v42;
  specialized Array._endMutation()(v43);
  sub_10001C5D0(0LL, (unint64_t *)&qword_100113120, &OBJC_CLASS___NSLayoutConstraint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v28, "activateConstraints:", isa, swift_bridgeObjectRelease(v30).n128_f64[0]);

  return v0;
}

id sub_1000B9494()
{
  uint64_t v1 = OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar____lazy_storage___widthConstraint;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar____lazy_storage___widthConstraint];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar____lazy_storage___widthConstraint];
LABEL_5:
    id v9 = v2;
    return v3;
  }

  id result = [v0 view];
  if (result)
  {
    id v5 = result;
    id v6 = [result widthAnchor];

    id v7 = [v6 constraintEqualToConstant:490.0];
    id v8 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v7;
    id v3 = v7;

    uint64_t v2 = 0LL;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

void sub_1000B96C4(char a1)
{
  if ((a1 & 1) != 0) {
    double v2 = 1112.0;
  }
  else {
    double v2 = 490.0;
  }
  id v3 = sub_1000B9494();
  [v3 constant];
  double v5 = v4;

  if (v2 != v5)
  {
    id v6 = objc_msgSend( objc_allocWithZone(UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  200.0,  25.0,  0.0,  0.0);
    id v7 = [objc_allocWithZone(UIViewPropertyAnimator) initWithDuration:v6 timingParameters:1.0];

    uint64_t v8 = swift_allocObject(&unk_1000FC8E8, 32LL, 7LL);
    *(void *)(v8 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
    *(double *)(v8 + 24) = v2;
    v12[4] = sub_1000BB270;
    uint64_t v13 = v8;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256LL;
    v12[2] = sub_100027654;
    v12[3] = &unk_1000FC900;
    id v9 = _Block_copy(v12);
    uint64_t v10 = v13;
    id v11 = v1;
    objc_msgSend(v7, "addAnimations:", v9, swift_release(v10).n128_f64[0]);
    _Block_release(v9);
    [v7 startAnimation];
  }

id sub_1000B98C8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar_visualEffectView;
  id v6 = v2;
  *(void *)&v2[v5] = sub_1000B8E80();
  *(void *)&v6[OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar____lazy_storage___widthConstraint] = 0LL;

  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(a1);
    a1 = ObjCClassFromMetadata;
  }

  if (a2)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(a2);
    uint64_t v9 = ObjCClassFromMetadata;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for AddParticipantNavigationSidebar(ObjCClassFromMetadata, v8);
  return objc_msgSendSuper2(&v11, "initWithNavigationBarClass:toolbarClass:", a1, v9);
}

id sub_1000B9A54(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar_visualEffectView;
  id v7 = v3;
  *(void *)&v3[v6] = sub_1000B8E80();
  *(void *)&v7[OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar____lazy_storage___widthConstraint] = 0LL;

  if (a2)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v10 = 0LL;
  }

  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for AddParticipantNavigationSidebar(v8, v9);
  id v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_1000B9BEC(uint64_t a1, uint64_t a2)
{
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for AddParticipantNavigationSidebar(a1, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for AddParticipantNavigationSidebar(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTime31AddParticipantNavigationSidebar, a2);
}

void sub_1000B9C74(char a1)
{
  id v3 = [*v1 parentViewController];
  if (v3)
  {
    id v4 = v3;
    [v3 dismissViewControllerAnimated:a1 & 1 completion:0];
  }

void sub_1000B9CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_1000BAC6C(a1);
  }

id sub_1000B9D5C()
{
  uint64_t v1 = v0;
  double v2 = (uint64_t *)&v0[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_cancellables];
  swift_beginAccess(v2, v10, 0LL, 0LL);
  uint64_t v3 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    id result = (id)swift_bridgeObjectRetain_n(*v2, 2LL);
    if (v4) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease_n(v3, 2LL);
    v9.receiver = v1;
    v9.super_class = (Class)type metadata accessor for AddParticipantContainerViewController(0LL);
    return objc_msgSendSuper2(&v9, "dealloc");
  }

  if (v3 < 0) {
    uint64_t v8 = *v2;
  }
  else {
    uint64_t v8 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(v3, 2LL);
  id result = (id)_CocoaArrayWrapper.endIndex.getter(v8);
  uint64_t v4 = (uint64_t)result;
  if (!result) {
    goto LABEL_13;
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001LL) != 0)
      {
        uint64_t v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
      }

      else
      {
        uint64_t v7 = *(void *)(v3 + 8 * i + 32);
        swift_retain(v7);
      }

      AnyCancellable.cancel()();
      swift_release(v7);
    }

    goto LABEL_13;
  }

  __break(1u);
  return result;
}

uint64_t sub_1000B9F18()
{
  return type metadata accessor for AddParticipantContainerViewController(0LL);
}

uint64_t type metadata accessor for AddParticipantContainerViewController(uint64_t a1)
{
  uint64_t result = qword_1001167D8;
  if (!qword_1001167D8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AddParticipantContainerViewController);
  }
  return result;
}

void sub_1000B9F5C()
{
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for AddParticipantContainerViewController(0LL);
  objc_msgSendSuper2(&v11, "updateViewConstraints");
  uint64_t v1 = sub_100018A04(&qword_1001142B0);
  uint64_t v2 = swift_allocObject(v1, 40LL, 7LL);
  *(_OWORD *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C3FD0;
  id v3 = [v0 view];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint, v4);
    id v7 = [v5 widthAnchor];

    id v8 = [v7 constraintEqualToConstant:490.0];
    *(void *)(v2 + 32) = v8;
    specialized Array._endMutation()(v9);
    sub_10001C5D0(0LL, (unint64_t *)&qword_100113120, &OBJC_CLASS___NSLayoutConstraint_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v6, "activateConstraints:", isa, swift_bridgeObjectRelease(v2).n128_f64[0]);
  }

  else
  {
    __break(1u);
  }

void sub_1000BA0E0(uint64_t a1, char a2)
{
  id v3 = v2;
  v51.receiver = v3;
  v51.super_class = (Class)type metadata accessor for AddParticipantContainerViewController(0LL);
  objc_msgSendSuper2(&v51, "viewDidMoveToWindow:shouldAppearOrDisappear:", a1, a2 & 1);
  uint64_t v6 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_conversationControlsManager];
  if (v6)
  {
    id v7 = v6;
    id v8 = [v3 view];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = [v8 superview];

      if (v10)
      {
        if (a1)
        {
          uint64_t v11 = OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar;
          if (*(void *)&v3[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar])
          {

LABEL_9:
            return;
          }

          uint64_t v12 = makeConversationDetailsController(for:delegate:)(v7, v3);
          objc_super v13 = (uint64_t *)&v3[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_infoPanelViewController];
          double v14 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_infoPanelViewController];
          *objc_super v13 = v12;
          v13[1] = v15;

          uint64_t v18 = *v13;
          if (v18)
          {
            id v19 = objc_msgSend( objc_allocWithZone((Class)type metadata accessor for AddParticipantNavigationSidebar(v16, v17)),  "initWithRootViewController:",  v18);
            [v19 setDelegate:v3];
            v3[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_showingConversationDetails] = 1;
            objc_msgSend(v3, "bs_addChildViewController:", v19);
            id v20 = [v3 view];
            if (v20)
            {
              id v21 = v20;
              id v22 = [v19 view];
              if (v22)
              {
                id v23 = v22;
                [v21 addSubview:v22];

                id v24 = [v19 view];
                if (v24)
                {
                  id v25 = v24;
                  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

                  uint64_t v26 = sub_100018A04(&qword_1001142B0);
                  uint64_t v27 = swift_allocObject(v26, 56LL, 7LL);
                  *(_OWORD *)(v27 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_1000C5ED0;
                  id v28 = [v19 view];
                  if (v28)
                  {
                    uint64_t v29 = v28;
                    id v30 = [v28 leadingAnchor];

                    id v31 = [v10 leadingAnchor];
                    if (qword_100112488 != -1) {
                      swift_once(&qword_100112488, sub_1000B896C);
                    }
                    id v32 =  objc_msgSend( v30,  "constraintEqualToAnchor:constant:",  v31,  *(double *)&qword_10011A418,  v11);

                    *(void *)(v27 + 32) = v32;
                    id v33 = [v19 view];
                    if (v33)
                    {
                      id v35 = v33;
                      id v36 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint, v34);
                      id v37 = [v35 centerYAnchor];

                      id v38 = [v10 centerYAnchor];
                      id v39 = [v37 constraintEqualToAnchor:v38];

                      *(void *)(v27 + 40) = v39;
                      id v40 = sub_1000B9494();
                      *(void *)(v27 + 48) = v40;
                      specialized Array._endMutation()(v40);
                      uint64_t v41 = v27;
                      sub_10001C5D0(0LL, (unint64_t *)&qword_100113120, &OBJC_CLASS___NSLayoutConstraint_ptr);
                      Class isa = Array._bridgeToObjectiveC()().super.isa;
                      objc_msgSend(v36, "activateConstraints:", isa, swift_bridgeObjectRelease(v41).n128_f64[0]);

                      id v43 = [v19 view];
                      if (v43)
                      {
                        id v44 = v43;
                        id v45 = [v43 heightAnchor];

                        id v46 = [v45 constraintEqualToConstant:450.0];
                        uint64_t v47 = OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebarHeightConstraint;
                        uint64_t v48 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebarHeightConstraint];
                        *(void *)&v3[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebarHeightConstraint] = v46;

                        [*(id *)&v3[v47] setActive:1];
                        uint64_t v49 = *(void **)&v3[v50];
                        *(void *)&v3[v50] = v19;

                        id v10 = v49;
                        goto LABEL_9;
                      }

void sub_1000BA7AC(uint64_t a1, uint64_t a2)
{
  id v3 = (char *)objc_msgSend( objc_allocWithZone((Class)type metadata accessor for AddPeopleToCallViewController(0, a2)),  "init");
  uint64_t v5 = v3;
  uint64_t v6 = OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar;
  id v7 = *(void **)(v2 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar);
  if (v7)
  {
    *((void *)&v14 + 1) = type metadata accessor for AddParticipantNavigationSidebar((uint64_t)v3, v4);
    uint64_t v15 = &off_1000FC878;
    *(void *)&__int128 v13 = v7;
  }

  else
  {
    uint64_t v15 = 0LL;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
  }

  uint64_t v8 = (uint64_t)&v5[OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_sidebarDelegate];
  swift_beginAccess( &v5[OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_sidebarDelegate],  v12,  33LL,  0LL);
  uint64_t v9 = v5;
  id v10 = v7;
  sub_1000362F0((uint64_t)&v13, v8, &qword_1001128D8);
  swift_endAccess(v12);

  v9[OBJC_IVAR____TtC8FaceTime38ContactListWithSnowglobeViewController_isAddingParticipants] = 1;
  uint64_t v11 = *(void **)(v2 + v6);
  if (v11)
  {
    [v11 pushViewController:v9 animated:1];
  }

  else
  {
    __break(1u);
  }

void sub_1000BA9B4(char *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AddPeopleToCallViewController(0LL, a2);
  if (!swift_dynamicCastClass(a1, v4)) {
    goto LABEL_9;
  }
  *(_BYTE *)(a2 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_showingConversationDetails) = 0;
  a1 = (char *)OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar;
  uint64_t v5 = *(void **)(a2 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar);
  if (!v5)
  {
    __break(1u);
    goto LABEL_23;
  }

  id v6 = v5;
  sub_1000B96C4(1);

  id v7 = *(void **)(a2 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebarHeightConstraint);
  if (!v7)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  [v7 setConstant:960.0];
  uint64_t v8 = *(void **)&a1[a2];
  if (!v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  id v9 = [v8 view];
  if (!v9)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  id v10 = v9;
  [v9 setNeedsLayout];

  uint64_t v11 = *(void **)&a1[a2];
  if (!v11)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  id v12 = [v11 view];
  if (v12)
  {
LABEL_21:
    id v26 = v12;
    [v12 layoutIfNeeded];

    return;
  }

  __break(1u);
LABEL_9:
  __int128 v13 = *(char **)(a2 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_infoPanelViewController);
  if (v13) {
    BOOL v14 = v13 == a1;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    *(_BYTE *)(a2 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_showingConversationDetails) = 1;
    uint64_t v15 = OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar;
    uint64_t v16 = *(void **)(a2 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar);
    if (v16)
    {
      id v17 = v16;
      sub_1000B96C4(0);

      id v18 = [a1 view];
      if (v18)
      {
        id v19 = v18;
        [v18 setNeedsLayout];

        id v20 = [a1 view];
        if (v20)
        {
          id v21 = v20;
          [v20 layoutIfNeeded];

          id v22 = *(void **)(a2 + v15);
          if (v22)
          {
            id v23 = [v22 view];
            if (v23)
            {
              id v24 = v23;
              [v23 setNeedsLayout];

              id v25 = *(void **)(a2 + v15);
              if (v25)
              {
                id v12 = [v25 view];
                if (v12) {
                  goto LABEL_21;
                }
LABEL_33:
                __break(1u);
                return;
              }

uint64_t sub_1000BAC6C(uint64_t a1)
{
  uint64_t v3 = sub_100018A04((uint64_t *)&unk_1001148A0);
  uint64_t v4 = __chkstk_darwin(v3);
  id v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)v25 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  id v12 = (char *)v25 - v11;
  __chkstk_darwin(v10);
  BOOL v14 = (char *)v25 - v13;
  uint64_t v15 = v1 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_activeCallContext;
  swift_beginAccess( v1 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_activeCallContext,  v26,  0LL,  0LL);
  sub_100054174(v15, (uint64_t)v14);
  sub_100054174(a1, (uint64_t)v12);
  swift_beginAccess(v15, v25, 33LL, 0LL);
  sub_1000362F0((uint64_t)v12, v15, (uint64_t *)&unk_1001148A0);
  swift_endAccess(v25);
  sub_100054174((uint64_t)v14, (uint64_t)v9);
  uint64_t v16 = type metadata accessor for ActiveCallContext(0LL);
  id v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48LL);
  if (v17(v9, 1LL, v16) == 1)
  {
    sub_1000BAFB0((uint64_t)v9);
    int v18 = 2;
  }

  else
  {
    int v18 = v9[*(int *)(v16 + 24)];
    sub_10005409C((uint64_t)v9);
  }

  sub_100054174(a1, (uint64_t)v6);
  if (v17(v6, 1LL, v16) == 1)
  {
    sub_1000BAFB0((uint64_t)v6);
    if (v18 == 2) {
      return sub_1000BAFB0((uint64_t)v14);
    }
  }

  else
  {
    int v19 = v6[*(int *)(v16 + 24)];
    sub_10005409C((uint64_t)v6);
    if (v18 != 2 && (((v18 == 0) ^ v19) & 1) != 0) {
      return sub_1000BAFB0((uint64_t)v14);
    }
  }

  uint64_t v20 = v1 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_infoPanelViewController;
  uint64_t v21 = *(void *)(v1 + OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_infoPanelViewController);
  if (v21)
  {
    uint64_t v22 = *(void *)(v20 + 8);
    uint64_t ObjectType = swift_getObjectType(v21);
    v25[0] = v21;
    dispatch thunk of ConversationDetailsPresenting.captioningStateDidChange()(ObjectType, v22);
  }

  return sub_1000BAFB0((uint64_t)v14);
}

void sub_1000BAEC0(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = "\b";
  void v4[2] = &unk_1000C76D0;
  v4[3] = "\b";
  sub_1000BAF5C(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(v2 - 8) + 64LL;
    v4[5] = &unk_1000C76E8;
    v4[6] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_updateClassMetadata2(a1, 256LL, 7LL, v4, a1 + 80);
  }

void sub_1000BAF5C(uint64_t a1)
{
  if (!qword_1001167E8)
  {
    uint64_t v2 = type metadata accessor for ActiveCallContext(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1001167E8);
    }
  }

uint64_t sub_1000BAFB0(uint64_t a1)
{
  uint64_t v2 = sub_100018A04((uint64_t *)&unk_1001148A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_1000BAFF0()
{
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebar] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_sidebarHeightConstraint] = 0LL;
  uint64_t v1 = &v0[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_infoPanelViewController];
  *uint64_t v1 = 0LL;
  v1[1] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_conversationControlsManager] = 0LL;
  uint64_t v2 = &v0[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_activeCallContext];
  uint64_t v3 = type metadata accessor for ActiveCallContext(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(v2, 1LL, 1LL, v3);
  v0[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_showingConversationDetails] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8FaceTime37AddParticipantContainerViewController_cancellables] = _swiftEmptyArrayStorage;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/AddParticipantContainerViewController.swift",  52LL,  2LL,  139LL,  0);
  __break(1u);
}

double sub_1000BB0D4(void *a1, char a2)
{
  uint64_t v6 = swift_allocObject(&unk_1000FC898, 32LL, 7LL);
  *(void *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v6 + 24) = v2;
  if ((a2 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_opt_self(&OBJC_CLASS___UIView, v5);
    v13[4] = sub_1000BB22C;
    uint64_t v14 = v6;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256LL;
    v13[2] = sub_100027654;
    v13[3] = &unk_1000FC8B0;
    uint64_t v8 = _Block_copy(v13);
    uint64_t v9 = v14;
    id v10 = a1;
    id v11 = v2;
    swift_retain(v6);
    swift_release(v9);
    [v7 animateWithDuration:v8 animations:0.3];
    swift_release(v6);
    _Block_release(v8);
  }

  else
  {
    sub_1000BA9B4((char *)a1, (uint64_t)v2);
    *(void *)&double result = swift_release(v6).n128_u64[0];
  }

  return result;
}

uint64_t sub_1000BB200()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000BB22C()
{
}

uint64_t sub_1000BB234(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000BB244(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000BB24C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000BB270()
{
  double v1 = *(double *)(v0 + 24);
  id v2 = sub_1000B9494();
  [v2 setConstant:v1];
}

uint64_t type metadata accessor for ResourceBundleClass(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(&OBJC_CLASS____TtC8FaceTimeP33_DAA8DC7DA45215E4A59FBAD2FDFF4DF419ResourceBundleClass, a2);
}

void sub_1000BB2E8(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not retreive Dual SIM activation policy",  v1,  2u);
}

void sub_1000BB328(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not retreive Dual SIM activation policy, mobileGestaltErrorCode: %d",  (uint8_t *)v3,  8u);
}

void sub_1000BB3A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not obtain application record with bundle identifier %@; attempt failed with error %@",
    (uint8_t *)&v3,
    0x16u);
}

uint64_t sub_1000BB424()
{
  uint64_t v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  return sub_1000BB444(v1);
}

void sub_1000BB444()
{
}

void sub_1000BB4A4()
{
}

void sub_1000BB504()
{
}

void sub_1000BB564()
{
}

void sub_1000BB5C4()
{
}

void sub_1000BB624(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@: PiP Proxy doesn't implement selector, won't set title and avatar",  (uint8_t *)&v2,  0xCu);
}

void sub_1000BB698(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Invalid state detected: PIP is starting while shouldPIPWhenEnteringBackground is NO. Attempting to recover by immedi ately stopping PIP.",  v1,  2u);
}

void sub_1000BB6D8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}@: Received unknown PIP FaceTime action %ld",  (uint8_t *)&v3,  0x16u);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__applicationDidBecomeActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationDidBecomeActive:");
}

id objc_msgSend__applicationEnteredBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationEnteredBackground:");
}

id objc_msgSend__applyAutoRotationCorrectionForOrientation_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:");
}

id objc_msgSend__applyPreviewMSROptimizationTransformsForOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyPreviewMSROptimizationTransformsForOrientation:");
}

id objc_msgSend__carScreen(void *a1, const char *a2, ...)
{
  return _[a1 _carScreen];
}

id objc_msgSend__contentViewWidthForApplicationBoundsSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentViewWidthForApplicationBoundsSize:");
}

id objc_msgSend__dissociateVideoLayers(void *a1, const char *a2, ...)
{
  return _[a1 _dissociateVideoLayers];
}

id objc_msgSend__ensureLocalVideoWillBecomeVisible(void *a1, const char *a2, ...)
{
  return _[a1 _ensureLocalVideoWillBecomeVisible];
}

id objc_msgSend__ensureProperPositionForContentView(void *a1, const char *a2, ...)
{
  return _[a1 _ensureProperPositionForContentView];
}

id objc_msgSend__ensureVideoLayersExist(void *a1, const char *a2, ...)
{
  return _[a1 _ensureVideoLayersExist];
}

id objc_msgSend__fadeInLocalVideo(void *a1, const char *a2, ...)
{
  return _[a1 _fadeInLocalVideo];
}

id objc_msgSend__intents_extensionMatchingAttributesForIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intents_extensionMatchingAttributesForIntents:");
}

id objc_msgSend__isValidFaceTimeOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidFaceTimeOrientation:");
}

id objc_msgSend__layoutWrappedSubview(void *a1, const char *a2, ...)
{
  return _[a1 _layoutWrappedSubview];
}

id objc_msgSend__phImageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_phImageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend__previewMSROptimizationCompensationForOrientation_withTransform_withBounds_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_previewMSROptimizationCompensationForOrientation:withTransform:withBounds:");
}

id objc_msgSend__scene(void *a1, const char *a2, ...)
{
  return _[a1 _scene];
}

id objc_msgSend__setCaptureView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCaptureView:");
}

id objc_msgSend__setGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGroupName:");
}

id objc_msgSend__setupVideoLayers(void *a1, const char *a2, ...)
{
  return _[a1 _setupVideoLayers];
}

id objc_msgSend__tuVideoDeviceOrientationForDeviceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tuVideoDeviceOrientationForDeviceOrientation:");
}

id objc_msgSend__updateLocalPreviewStatusBarGradient(void *a1, const char *a2, ...)
{
  return _[a1 _updateLocalPreviewStatusBarGradient];
}

id objc_msgSend__updateLocalVideoOrientationAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocalVideoOrientationAnimated:");
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return _[a1 activationState];
}

id objc_msgSend_activeConversationForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeConversationForCall:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceOrientation];
}

id objc_msgSend_activeRemoteParticipants(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipants];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activityIdentifier];
}

id objc_msgSend_activitySessions(void *a1, const char *a2, ...)
{
  return _[a1 activitySessions];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListenerID:forService:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _[a1 airplaneMode];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_alwaysShowLocalVideo(void *a1, const char *a2, ...)
{
  return _[a1 alwaysShowLocalVideo];
}

id objc_msgSend_ambientHorizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 ambientHorizontalSizeClass];
}

id objc_msgSend_ambientVerticalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 ambientVerticalSizeClass];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_applicationsForUserActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationsForUserActivityType:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associateLocalVideoLayers(void *a1, const char *a2, ...)
{
  return _[a1 associateLocalVideoLayers];
}

id objc_msgSend_availabilityForListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availabilityForListenerID:forService:");
}

id objc_msgSend_baseViewController(void *a1, const char *a2, ...)
{
  return _[a1 baseViewController];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_cachedIsUsingIPadExternalCamera(void *a1, const char *a2, ...)
{
  return _[a1 cachedIsUsingIPadExternalCamera];
}

id objc_msgSend_callingSupported(void *a1, const char *a2, ...)
{
  return _[a1 callingSupported];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_captureGroup(void *a1, const char *a2, ...)
{
  return _[a1 captureGroup];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentViewAnimationsFadeInsteadOfMove(void *a1, const char *a2, ...)
{
  return _[a1 contentViewAnimationsFadeInsteadOfMove];
}

id objc_msgSend_contentViewCanRotate(void *a1, const char *a2, ...)
{
  return _[a1 contentViewCanRotate];
}

id objc_msgSend_contentViewOffscreenEdge(void *a1, const char *a2, ...)
{
  return _[a1 contentViewOffscreenEdge];
}

id objc_msgSend_contentViewSizeForFaceTime(void *a1, const char *a2, ...)
{
  return _[a1 contentViewSizeForFaceTime];
}

id objc_msgSend_conversationManager(void *a1, const char *a2, ...)
{
  return _[a1 conversationManager];
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyCarrierBundleValue_keyHierarchy_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCarrierBundleValue:keyHierarchy:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleValueWithDefault_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCarrierBundleValueWithDefault:key:bundleType:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentAudioAndVideoCallCount(void *a1, const char *a2, ...)
{
  return _[a1 currentAudioAndVideoCallCount];
}

id objc_msgSend_currentAudioAndVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 currentAudioAndVideoCalls];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentInputDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentInputDevice];
}

id objc_msgSend_currentInputIsExternal(void *a1, const char *a2, ...)
{
  return _[a1 currentInputIsExternal];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return _[a1 currentLayout];
}

id objc_msgSend_currentVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 currentVideoCall];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultPIPController(void *a1, const char *a2, ...)
{
  return _[a1 defaultPIPController];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_destinationIdIsPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 destinationIdIsPhoneNumber];
}

id objc_msgSend_detailsViewController(void *a1, const char *a2, ...)
{
  return _[a1 detailsViewController];
}

id objc_msgSend_deviceIsFrontFacingOrExternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsFrontFacingOrExternal:");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_didAnimatePictureInPictureStopCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 didAnimatePictureInPictureStopCompletionBlock];
}

id objc_msgSend_didDeferStartCameraAction(void *a1, const char *a2, ...)
{
  return _[a1 didDeferStartCameraAction];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_disableAnimation(void *a1, const char *a2, ...)
{
  return _[a1 disableAnimation];
}

id objc_msgSend_disabledOverlayView(void *a1, const char *a2, ...)
{
  return _[a1 disabledOverlayView];
}

id objc_msgSend_disconnectCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCall:");
}

id objc_msgSend_disconnectedReason(void *a1, const char *a2, ...)
{
  return _[a1 disconnectedReason];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_displayUIAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayUIAnimated:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_enableAnimation(void *a1, const char *a2, ...)
{
  return _[a1 enableAnimation];
}

id objc_msgSend_errorAlertMessage(void *a1, const char *a2, ...)
{
  return _[a1 errorAlertMessage];
}

id objc_msgSend_errorAlertTitle(void *a1, const char *a2, ...)
{
  return _[a1 errorAlertTitle];
}

id objc_msgSend_expanseEnabled(void *a1, const char *a2, ...)
{
  return _[a1 expanseEnabled];
}

id objc_msgSend_expectingSystemInitiatedPIPInterruptionStop(void *a1, const char *a2, ...)
{
  return _[a1 expectingSystemInitiatedPIPInterruptionStop];
}

id objc_msgSend_extensionsWithMatchingAttributes_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionsWithMatchingAttributes:completion:");
}

id objc_msgSend_faceTimeAudioIsSupported(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeAudioIsSupported];
}

id objc_msgSend_faceTimeSupported(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeSupported];
}

id objc_msgSend_faceTimeVideoIsSupported(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeVideoIsSupported];
}

id objc_msgSend_fadeInAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fadeInAnimated:");
}

id objc_msgSend_fbsOrientationObserver(void *a1, const char *a2, ...)
{
  return _[a1 fbsOrientationObserver];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_fetchCellularRadioEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fetchCellularRadioEnabled];
}

id objc_msgSend_fetchRingerSwitchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fetchRingerSwitchEnabled];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flipCamera(void *a1, const char *a2, ...)
{
  return _[a1 flipCamera];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frameForRestoreAnimation(void *a1, const char *a2, ...)
{
  return _[a1 frameForRestoreAnimation];
}

id objc_msgSend_frontmostAudioOrVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 frontmostAudioOrVideoCall];
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return _[a1 groupName];
}

id objc_msgSend_groupUUID(void *a1, const char *a2, ...)
{
  return _[a1 groupUUID];
}

id objc_msgSend_handleDisableCameraAction(void *a1, const char *a2, ...)
{
  return _[a1 handleDisableCameraAction];
}

id objc_msgSend_handleEnableCameraAction(void *a1, const char *a2, ...)
{
  return _[a1 handleEnableCameraAction];
}

id objc_msgSend_handleFlipCameraAction(void *a1, const char *a2, ...)
{
  return _[a1 handleFlipCameraAction];
}

id objc_msgSend_handleMuteMicrophoneAction(void *a1, const char *a2, ...)
{
  return _[a1 handleMuteMicrophoneAction];
}

id objc_msgSend_handleShowSystemHUDAction(void *a1, const char *a2, ...)
{
  return _[a1 handleShowSystemHUDAction];
}

id objc_msgSend_handleUnmuteMicrophoneAction(void *a1, const char *a2, ...)
{
  return _[a1 handleUnmuteMicrophoneAction];
}

id objc_msgSend_hasCurrentVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 hasCurrentVideoCalls];
}

id objc_msgSend_hasParticipantVideoForActiveConversation(void *a1, const char *a2, ...)
{
  return _[a1 hasParticipantVideoForActiveConversation];
}

id objc_msgSend_hasStatusBarSuppressionReasons(void *a1, const char *a2, ...)
{
  return _[a1 hasStatusBarSuppressionReasons];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_inCall(void *a1, const char *a2, ...)
{
  return _[a1 inCall];
}

id objc_msgSend_inCallBottomBarSpacing(void *a1, const char *a2, ...)
{
  return _[a1 inCallBottomBarSpacing];
}

id objc_msgSend_inCallControlSpacing(void *a1, const char *a2, ...)
{
  return _[a1 inCallControlSpacing];
}

id objc_msgSend_inCallRootViewControllerClass(void *a1, const char *a2, ...)
{
  return _[a1 inCallRootViewControllerClass];
}

id objc_msgSend_inCallStatusBarSuppressionReasons(void *a1, const char *a2, ...)
{
  return _[a1 inCallStatusBarSuppressionReasons];
}

id objc_msgSend_incomingCall(void *a1, const char *a2, ...)
{
  return _[a1 incomingCall];
}

id objc_msgSend_incomingVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 incomingVideoCall];
}

id objc_msgSend_initForScreenSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForScreenSharing:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_privateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:privateStyle:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_inputDevices(void *a1, const char *a2, ...)
{
  return _[a1 inputDevices];
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:below:");
}

id objc_msgSend_interfaceOrientationForDeviceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientationForDeviceOrientation:");
}

id objc_msgSend_isBeingRemoteControlled(void *a1, const char *a2, ...)
{
  return _[a1 isBeingRemoteControlled];
}

id objc_msgSend_isBroadcastingScreenSharing(void *a1, const char *a2, ...)
{
  return _[a1 isBroadcastingScreenSharing];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return _[a1 isConnecting];
}

id objc_msgSend_isContentViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isContentViewLoaded];
}

id objc_msgSend_isContinuitySession(void *a1, const char *a2, ...)
{
  return _[a1 isContinuitySession];
}

id objc_msgSend_isConversation(void *a1, const char *a2, ...)
{
  return _[a1 isConversation];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToConversation:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeProvider];
}

id objc_msgSend_isIPadIdiom(void *a1, const char *a2, ...)
{
  return _[a1 isIPadIdiom];
}

id objc_msgSend_isIncoming(void *a1, const char *a2, ...)
{
  return _[a1 isIncoming];
}

id objc_msgSend_isOneToOneModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isOneToOneModeEnabled];
}

id objc_msgSend_isPictureInPictureActive(void *a1, const char *a2, ...)
{
  return _[a1 isPictureInPictureActive];
}

id objc_msgSend_isPictureInPictureInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 isPictureInPictureInterrupted];
}

id objc_msgSend_isPictureInPicturePossible(void *a1, const char *a2, ...)
{
  return _[a1 isPictureInPicturePossible];
}

id objc_msgSend_isPictureInPictureStashedOrUnderLock(void *a1, const char *a2, ...)
{
  return _[a1 isPictureInPictureStashedOrUnderLock];
}

id objc_msgSend_isPictureInPictureSupported(void *a1, const char *a2, ...)
{
  return _[a1 isPictureInPictureSupported];
}

id objc_msgSend_isPipped(void *a1, const char *a2, ...)
{
  return _[a1 isPipped];
}

id objc_msgSend_isPippedOrStartingPIP(void *a1, const char *a2, ...)
{
  return _[a1 isPippedOrStartingPIP];
}

id objc_msgSend_isReadyForPreview(void *a1, const char *a2, ...)
{
  return _[a1 isReadyForPreview];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _[a1 isRestricted];
}

id objc_msgSend_isRotating(void *a1, const char *a2, ...)
{
  return _[a1 isRotating];
}

id objc_msgSend_isSendingVideo(void *a1, const char *a2, ...)
{
  return _[a1 isSendingVideo];
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return _[a1 isSimHidden];
}

id objc_msgSend_isSpringBoardLocked(void *a1, const char *a2, ...)
{
  return _[a1 isSpringBoardLocked];
}

id objc_msgSend_isSpringBoardPasscodeLocked(void *a1, const char *a2, ...)
{
  return _[a1 isSpringBoardPasscodeLocked];
}

id objc_msgSend_isStatusBarHidden(void *a1, const char *a2, ...)
{
  return _[a1 isStatusBarHidden];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isSuspended];
}

id objc_msgSend_isSystemProvider(void *a1, const char *a2, ...)
{
  return _[a1 isSystemProvider];
}

id objc_msgSend_isUplinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 isUplinkMuted];
}

id objc_msgSend_isUsedForScreenSharing(void *a1, const char *a2, ...)
{
  return _[a1 isUsedForScreenSharing];
}

id objc_msgSend_isUsingIPadExternalCamera(void *a1, const char *a2, ...)
{
  return _[a1 isUsingIPadExternalCamera];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return _[a1 isVideo];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return _[a1 labelID];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIsLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIsLocked:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localFrontLayer(void *a1, const char *a2, ...)
{
  return _[a1 localFrontLayer];
}

id objc_msgSend_localVideoLayersAreAssociated(void *a1, const char *a2, ...)
{
  return _[a1 localVideoLayersAreAssociated];
}

id objc_msgSend_localVideoView(void *a1, const char *a2, ...)
{
  return _[a1 localVideoView];
}

id objc_msgSend_localVideoViewController(void *a1, const char *a2, ...)
{
  return _[a1 localVideoViewController];
}

id objc_msgSend_lostModeIsActive(void *a1, const char *a2, ...)
{
  return _[a1 lostModeIsActive];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_manuallyStopPIPWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manuallyStopPIPWithCompletion:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_needsManualInCallSounds(void *a1, const char *a2, ...)
{
  return _[a1 needsManualInCallSounds];
}

id objc_msgSend_newPhoneNumberRefForDestinationID_useNetworkCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newPhoneNumberRefForDestinationID:useNetworkCountryCode:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_obtainDismissalAssertionForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "obtainDismissalAssertionForReason:");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pausePreview(void *a1, const char *a2, ...)
{
  return _[a1 pausePreview];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_phPathForImageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPathForImageNamed:inBundle:");
}

id objc_msgSend_pictureInPictureProxyWithControlsStyle_viewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pictureInPictureProxyWithControlsStyle:viewController:");
}

id objc_msgSend_pipDeviceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 pipDeviceOrientation];
}

id objc_msgSend_pipIsBeingResized(void *a1, const char *a2, ...)
{
  return _[a1 pipIsBeingResized];
}

id objc_msgSend_pipProxy(void *a1, const char *a2, ...)
{
  return _[a1 pipProxy];
}

id objc_msgSend_pipState(void *a1, const char *a2, ...)
{
  return _[a1 pipState];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_preferredContentSizeDidChangeForViewController(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeDidChangeForViewController];
}

id objc_msgSend_preferredPIPContentAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 preferredPIPContentAspectRatio];
}

id objc_msgSend_preferredPiPContentAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 preferredPiPContentAspectRatio];
}

id objc_msgSend_preparedToAnimateToFullScreenCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 preparedToAnimateToFullScreenCompletionBlock];
}

id objc_msgSend_presentControlCenterFaceTimePanelWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentControlCenterFaceTimePanelWithCompletion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_previewMSROptimizationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 previewMSROptimizationEnabled];
}

id objc_msgSend_prioritizedSenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 prioritizedSenderIdentities];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_providerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithIdentifier:");
}

id objc_msgSend_registerForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForRingerStateNotifications];
}

id objc_msgSend_releaseDismissalAssertionForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseDismissalAssertionForReason:");
}

id objc_msgSend_remoteMembers(void *a1, const char *a2, ...)
{
  return _[a1 remoteMembers];
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandles];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeListenerID:forService:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_resetViewController(void *a1, const char *a2, ...)
{
  return _[a1 resetViewController];
}

id objc_msgSend_restoreUserInterfaceForPictureInPictureStopCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 restoreUserInterfaceForPictureInPictureStopCompletionBlock];
}

id objc_msgSend_restoreViewControllerHierarchyWhenExitingPiP(void *a1, const char *a2, ...)
{
  return _[a1 restoreViewControllerHierarchyWhenExitingPiP];
}

id objc_msgSend_ringerStateNotifyToken(void *a1, const char *a2, ...)
{
  return _[a1 ringerStateNotifyToken];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rotateContentContainer_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateContentContainer:withCompletionHandler:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_screenSharingRemoteControlEnabled(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingRemoteControlEnabled];
}

id objc_msgSend_screenSize(void *a1, const char *a2, ...)
{
  return _[a1 screenSize];
}

id objc_msgSend_screensaverActive(void *a1, const char *a2, ...)
{
  return _[a1 screensaverActive];
}

id objc_msgSend_sendMessageIntentExtension(void *a1, const char *a2, ...)
{
  return _[a1 sendMessageIntentExtension];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizesSubviews:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCachedIsUsingIPadExternalCamera_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedIsUsingIPadExternalCamera:");
}

id objc_msgSend_setCameraActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraActive:");
}

id objc_msgSend_setCanSwitchCamera_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanSwitchCamera:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClientSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientSessionIdentifier:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentViewHiddenPosition(void *a1, const char *a2, ...)
{
  return _[a1 setContentViewHiddenPosition];
}

id objc_msgSend_setContentsGravity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsGravity:");
}

id objc_msgSend_setCurrentInputDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentInputDevice:");
}

id objc_msgSend_setCurrentPIPAnimationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPIPAnimationStyle:");
}

id objc_msgSend_setCurrentVideoOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentVideoOrientation:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDidAnimatePictureInPictureStopCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidAnimatePictureInPictureStopCompletionBlock:");
}

id objc_msgSend_setDidDeferStartCameraAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidDeferStartCameraAction:");
}

id objc_msgSend_setDisabledOverlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabledOverlayView:");
}

id objc_msgSend_setDisablesLayerCloning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisablesLayerCloning:");
}

id objc_msgSend_setExpectingSystemInitiatedPIPInterruptionStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectingSystemInitiatedPIPInterruptionStop:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupName:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setInCallStatusBarSuppressionReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInCallStatusBarSuppressionReasons:");
}

id objc_msgSend_setIsBeingRemoteControlled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBeingRemoteControlled:");
}

id objc_msgSend_setIsBroadcastingScreenSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBroadcastingScreenSharing:");
}

id objc_msgSend_setIsSendingVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSendingVideo:");
}

id objc_msgSend_setIsUsedForScreenSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUsedForScreenSharing:");
}

id objc_msgSend_setLocalFrontLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalFrontLayer:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMicrophoneMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMicrophoneMuted:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setPictureInPictureShouldStartWhenEnteringBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPictureInPictureShouldStartWhenEnteringBackground:");
}

id objc_msgSend_setPipContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipContentViewController:");
}

id objc_msgSend_setPipDeviceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipDeviceOrientation:");
}

id objc_msgSend_setPipInterruptedCallIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipInterruptedCallIdentifier:");
}

id objc_msgSend_setPipIsBeingResized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipIsBeingResized:");
}

id objc_msgSend_setPipProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipProxy:");
}

id objc_msgSend_setPipState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipState:");
}

id objc_msgSend_setPreparedToAnimateToFullScreenCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreparedToAnimateToFullScreenCompletionBlock:");
}

id objc_msgSend_setRemoteVideoPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteVideoPresentationState:");
}

id objc_msgSend_setRenderMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderMode:");
}

id objc_msgSend_setRestoreUserInterfaceForPictureInPictureStopCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:");
}

id objc_msgSend_setRingerSwitchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRingerSwitchEnabled:");
}

id objc_msgSend_setRotating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotating:");
}

id objc_msgSend_setScreenSharingTitle_avatar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSharingTitle:avatar:");
}

id objc_msgSend_setScreensaverActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreensaverActive:");
}

id objc_msgSend_setSharedInstanceOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedInstanceOverride:");
}

id objc_msgSend_setShouldObtainDismissalAssertions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldObtainDismissalAssertions:");
}

id objc_msgSend_setShouldStartPIPWhenPossible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldStartPIPWhenPossible:");
}

id objc_msgSend_setSpringBoardLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpringBoardLocked:");
}

id objc_msgSend_setStartCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartCompletionBlock:");
}

id objc_msgSend_setStatusBarOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusBarOrientation:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setUpScreensaverObservers(void *a1, const char *a2, ...)
{
  return _[a1 setUpScreensaverObservers];
}

id objc_msgSend_setUplinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkMuted:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setVideoWasPausedForInterruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoWasPausedForInterruption:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWaitingForLocalVideoFirstFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitingForLocalVideoFirstFrame:");
}

id objc_msgSend_setWantsPreferredContentSizeUpdateAfterRotationFinishes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsPreferredContentSizeUpdateAfterRotationFinishes:");
}

id objc_msgSend_setWillAnimatePictureInPictureStopCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWillAnimatePictureInPictureStopCompletionBlock:");
}

id objc_msgSend_setWrappedViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrappedViewController:");
}

id objc_msgSend_setWrapperViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrapperViewController:");
}

id objc_msgSend_setupContentViewFullSize(void *a1, const char *a2, ...)
{
  return _[a1 setupContentViewFullSize];
}

id objc_msgSend_setupContentViewSidebar(void *a1, const char *a2, ...)
{
  return _[a1 setupContentViewSidebar];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedMonitor];
}

id objc_msgSend_sharedMonitorForDisplayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedMonitorForDisplayType:");
}

id objc_msgSend_shouldAllowRingingCallStatusIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAllowRingingCallStatusIndicator:");
}

id objc_msgSend_shouldDeferStartCameraAction(void *a1, const char *a2, ...)
{
  return _[a1 shouldDeferStartCameraAction];
}

id objc_msgSend_shouldDisableEdgeClip(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisableEdgeClip];
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return _[a1 shouldMakeUIForDefaultPNG];
}

id objc_msgSend_shouldObtainDismissalAssertions(void *a1, const char *a2, ...)
{
  return _[a1 shouldObtainDismissalAssertions];
}

id objc_msgSend_shouldPIPWhenEnteringBackground(void *a1, const char *a2, ...)
{
  return _[a1 shouldPIPWhenEnteringBackground];
}

id objc_msgSend_shouldShowAutomaticTelephonyCallFallback(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowAutomaticTelephonyCallFallback];
}

id objc_msgSend_shouldStartPIPWhenPossible(void *a1, const char *a2, ...)
{
  return _[a1 shouldStartPIPWhenPossible];
}

id objc_msgSend_shouldSuppressInCallStatusBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSuppressInCallStatusBar:");
}

id objc_msgSend_shouldUseExplicitLayoutDimensions(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseExplicitLayoutDimensions];
}

id objc_msgSend_showContentViewAnimated_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showContentViewAnimated:completionBlock:");
}

id objc_msgSend_showFaceTimeFirstRunViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 showFaceTimeFirstRunViewIfNeeded];
}

id objc_msgSend_showsLocalPreviewStatusBarGradient(void *a1, const char *a2, ...)
{
  return _[a1 showsLocalPreviewStatusBarGradient];
}

id objc_msgSend_sourceProvider(void *a1, const char *a2, ...)
{
  return _[a1 sourceProvider];
}

id objc_msgSend_startCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 startCompletionBlock];
}

id objc_msgSend_startPIPNow(void *a1, const char *a2, ...)
{
  return _[a1 startPIPNow];
}

id objc_msgSend_startPictureInPicture(void *a1, const char *a2, ...)
{
  return _[a1 startPictureInPicture];
}

id objc_msgSend_startPreview(void *a1, const char *a2, ...)
{
  return _[a1 startPreview];
}

id objc_msgSend_startPreviewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 startPreviewIfNeeded];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateForNotifyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateForNotifyToken:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return _[a1 statusBarOrientation];
}

id objc_msgSend_stopPictureInPictureAndRestoreUserInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopPictureInPictureAndRestoreUserInterface:");
}

id objc_msgSend_stopPreview(void *a1, const char *a2, ...)
{
  return _[a1 stopPreview];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForPIPState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForPIPState:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return _[a1 subscriptions];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsAutoRotation(void *a1, const char *a2, ...)
{
  return _[a1 supportsAutoRotation];
}

id objc_msgSend_supportsScreenSharing(void *a1, const char *a2, ...)
{
  return _[a1 supportsScreenSharing];
}

id objc_msgSend_supportsSendMessageIntent(void *a1, const char *a2, ...)
{
  return _[a1 supportsSendMessageIntent];
}

id objc_msgSend_systemAttentionState(void *a1, const char *a2, ...)
{
  return _[a1 systemAttentionState];
}

id objc_msgSend_systemPreferredCamera(void *a1, const char *a2, ...)
{
  return _[a1 systemPreferredCamera];
}

id objc_msgSend_tabBarCanSlide(void *a1, const char *a2, ...)
{
  return _[a1 tabBarCanSlide];
}

id objc_msgSend_tabBarFillsScreen(void *a1, const char *a2, ...)
{
  return _[a1 tabBarFillsScreen];
}

id objc_msgSend_tearDownScreensaverObservers(void *a1, const char *a2, ...)
{
  return _[a1 tearDownScreensaverObservers];
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return _[a1 telephonyClient];
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 telephonyProvider];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_tu_containsObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_containsObjectPassingTest:");
}

id objc_msgSend_tu_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_firstObjectPassingTest:");
}

id objc_msgSend_uniqueProxyIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueProxyIdentifier];
}

id objc_msgSend_unregisterForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterForRingerStateNotifications];
}

id objc_msgSend_unsetSharedInstanceOverride(void *a1, const char *a2, ...)
{
  return _[a1 unsetSharedInstanceOverride];
}

id objc_msgSend_updateInCallStatusBarSuppression(void *a1, const char *a2, ...)
{
  return _[a1 updateInCallStatusBarSuppression];
}

id objc_msgSend_updatePIPFrame(void *a1, const char *a2, ...)
{
  return _[a1 updatePIPFrame];
}

id objc_msgSend_updatePIPProxyControlStates(void *a1, const char *a2, ...)
{
  return _[a1 updatePIPProxyControlStates];
}

id objc_msgSend_updatePIPProxyLayerCloning(void *a1, const char *a2, ...)
{
  return _[a1 updatePIPProxyLayerCloning];
}

id objc_msgSend_updatePIPProxyMicrophoneControlStates(void *a1, const char *a2, ...)
{
  return _[a1 updatePIPProxyMicrophoneControlStates];
}

id objc_msgSend_updatePlaybackStateUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaybackStateUsingBlock:");
}

id objc_msgSend_updateShouldPIPWhenEnteringBackground(void *a1, const char *a2, ...)
{
  return _[a1 updateShouldPIPWhenEnteringBackground];
}

id objc_msgSend_updateViewControllerForOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateViewControllerForOrientation:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_usesUnifiedInterface(void *a1, const char *a2, ...)
{
  return _[a1 usesUnifiedInterface];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_videoDeviceController(void *a1, const char *a2, ...)
{
  return _[a1 videoDeviceController];
}

id objc_msgSend_videoWasPausedForInterruption(void *a1, const char *a2, ...)
{
  return _[a1 videoWasPausedForInterruption];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerForPiP(void *a1, const char *a2, ...)
{
  return _[a1 viewControllerForPiP];
}

id objc_msgSend_viewDidAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewDidAppear:");
}

id objc_msgSend_viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController( void *a1, const char *a2, ...)
{
  return _[a1 viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController];
}

id objc_msgSend_viewWillAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWillAppear:");
}

id objc_msgSend_viewWillDisappear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWillDisappear:");
}

id objc_msgSend_waitingForLocalVideoFirstFrame(void *a1, const char *a2, ...)
{
  return _[a1 waitingForLocalVideoFirstFrame];
}

id objc_msgSend_wantsHoldMusic(void *a1, const char *a2, ...)
{
  return _[a1 wantsHoldMusic];
}

id objc_msgSend_wantsPreferredContentSizeUpdateAfterRotationFinishes(void *a1, const char *a2, ...)
{
  return _[a1 wantsPreferredContentSizeUpdateAfterRotationFinishes];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_willAnimatePictureInPictureStopCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 willAnimatePictureInPictureStopCompletionBlock];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowForTransitionAnimation(void *a1, const char *a2, ...)
{
  return _[a1 windowForTransitionAnimation];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _[a1 windows];
}

id objc_msgSend_wombatWisdomEnabled(void *a1, const char *a2, ...)
{
  return _[a1 wombatWisdomEnabled];
}

id objc_msgSend_wrappedViewController(void *a1, const char *a2, ...)
{
  return _[a1 wrappedViewController];
}

id objc_msgSend_wrapperViewController(void *a1, const char *a2, ...)
{
  return _[a1 wrapperViewController];
}

id objc_msgSend_wrapperViewControllerNeedsCleanup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapperViewControllerNeedsCleanup:");
}

id objc_msgSend_wrapperViewControllerPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapperViewControllerPreferredContentSize:");
}

id objc_msgSend_wrapperViewControllerShouldReturnRestoreWrappedViewControllerHierarchy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapperViewControllerShouldReturnRestoreWrappedViewControllerHierarchy:");
}

id objc_msgSend_yOffsetForDialerLCDView(void *a1, const char *a2, ...)
{
  return _[a1 yOffsetForDialerLCDView];
}

id objc_msgSend_yOffsetForDialerLCDViewForDxDevices(void *a1, const char *a2, ...)
{
  return _[a1 yOffsetForDialerLCDViewForDxDevices];
}

id objc_msgSend_yParticipantsViewAdjustmentForKeypad(void *a1, const char *a2, ...)
{
  return _[a1 yParticipantsViewAdjustmentForKeypad];
}