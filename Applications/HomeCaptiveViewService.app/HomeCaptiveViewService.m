void sub_100003FAC(id a1)
{
  os_log_t v1;
  void *v2;
  v1 = os_log_create("com.apple.HomeCaptiveViewService", "general");
  v2 = (void *)qword_10001AB60;
  qword_10001AB60 = (uint64_t)v1;
}

uint64_t start(int a1, char **a2)
{
  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  return v8;
}

uint64_t sub_100004050()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for WifiInfo()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService8WifiInfo);
}

uint64_t sub_100004080()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100004CC4(v0, qword_10001A5C0);
  uint64_t v1 = sub_100004CAC(v0, (uint64_t)qword_10001A5C0);
  if (qword_10001A448 != -1) {
    swift_once(&qword_10001A448, sub_100005070);
  }
  uint64_t v2 = sub_100004CAC(v0, (uint64_t)qword_10001AB68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

id sub_100004110()
{
  uint64_t v1 = OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController____lazy_storage___backgroundView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController____lazy_storage___backgroundView);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v4 = [(id)objc_opt_self(UIBlurEffect) effectWithStyle:4005];
    id v3 = [objc_allocWithZone(UIVisualEffectView) initWithEffect:v4];

    v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v6 = v3;
    sub_100004D04(v5);
  }

  sub_100004D14(v2);
  return v3;
}
}

void sub_1000042C4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v4 = 0LL;
  }

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for PinViewController();
  objc_msgSendSuper2(&v9, "setTitle:", v4);

  v5 = *(void **)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_digitEntryViewController];
  if (v5)
  {
    id v6 = [v5 titleLabel];
    if (v6)
    {
      v7 = v6;
      id v8 = [v2 title];
      [v7 setText:v8];
    }

    else
    {
      __break(1u);
    }
  }

id sub_100004544()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for PinViewController();
  objc_msgSendSuper2(&v16, "viewDidLoad");
  id v1 = sub_100004110();
  if (!v1) {
    goto LABEL_5;
  }
  id v2 = v1;
  id result = [v0 view];
  if (result)
  {
    NSString v4 = result;
    [result bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    objc_msgSend(v2, "setFrame:", v6, v8, v10, v12);
    id result = [v0 view];
    if (result)
    {
      v13 = result;
      [result addSubview:v2];

LABEL_5:
      uint64_t v14 = *(void *)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_pin];
      uint64_t v15 = *(void *)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_pin + 8];
      swift_bridgeObjectRetain(v15);
      sub_1000046A4(v14, v15);
      return (id)swift_bridgeObjectRelease(v15);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

void sub_1000046A4(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    if (qword_10001A440 != -1) {
      swift_once(&qword_10001A440, sub_100004080);
    }
    uint64_t v8 = type metadata accessor for Logger(0LL);
    sub_100004CAC(v8, (uint64_t)qword_10001A5C0);
    oslog = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(oslog, v9)) {
      goto LABEL_10;
    }
    double v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)double v10 = 0;
    double v11 = "Pin is nil. Skipping DigitEntryViewController configuration.";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, v11, v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
    goto LABEL_10;
  }

  uint64_t v4 = OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_digitEntryViewController;
  double v5 = *(void **)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_digitEntryViewController];
  if (v5) {
    goto LABEL_3;
  }
  id v12 = objc_msgSend( objc_allocWithZone(TVSUIDigitEntryViewController),  "initWithNumberOfDigits:",  String.count.getter(a1, a2));
  if (!v12)
  {
    if (qword_10001A440 != -1) {
      swift_once(&qword_10001A440, sub_100004080);
    }
    uint64_t v28 = type metadata accessor for Logger(0LL);
    sub_100004CAC(v28, (uint64_t)qword_10001A5C0);
    oslog = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v9)) {
      goto LABEL_10;
    }
    double v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)double v10 = 0;
    double v11 = "Failed to create TVSUIDigitEntryViewController instance";
    goto LABEL_9;
  }

  v13 = v12;
  [v12 setEditable:0];
  id v14 = [v13 titleLabel];
  if (!v14)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }

  uint64_t v15 = v14;
  objc_super v16 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v17 = [v16 whiteColor];
  [v15 setTextColor:v17];

  id v18 = [v13 titleLabel];
  if (!v18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  v19 = v18;
  id v20 = [v2 title];
  [v19 setText:v20];

  id v21 = [v13 promptLabel];
  if (!v21)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  v22 = v21;
  id v23 = [v16 whiteColor];
  [v22 setTextColor:v23];

  id v24 = [v13 promptLabel];
  if (!v24)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  v25 = v24;
  uint64_t v26 = *(void *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName + 8];
  if (v26)
  {
    swift_bridgeObjectRetain(*(void *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName + 8]);
    NSString v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v26);
  }

  else
  {
    NSString v27 = 0LL;
  }

  [v25 setText:v27];

  v29 = *(void **)&v2[v4];
  *(void *)&v2[v4] = v13;
  id v30 = v13;

  [v2 addChildViewController:v30];
  id v31 = [v30 view];
  if (!v31) {
    goto LABEL_34;
  }
  v32 = v31;
  id v33 = [v2 view];
  if (!v33)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }

  v34 = v33;
  [v33 bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  objc_msgSend(v32, "setFrame:", v36, v38, v40, v42);
  id v43 = [v2 view];
  if (!v43)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  v44 = v43;
  id v45 = [v30 view];
  if (!v45)
  {
LABEL_37:
    __break(1u);
    return;
  }

  v46 = v45;
  [v44 addSubview:v45];

  [v30 didMoveToParentViewController:v2];
  id v47 =  [(id)objc_opt_self(UITraitCollection) traitCollectionWithUserInterfaceStyle:2];
  [v2 setOverrideTraitCollection:v47 forChildViewController:v30];

  double v5 = *(void **)&v2[v4];
  if (v5)
  {
LABEL_3:
    id v6 = [v5 digitGroupView];
    if (v6)
    {
      double v7 = v6;
      oslog = (os_log_s *)String._bridgeToObjectiveC()();
      objc_msgSend(v7, "setText:");

LABEL_10:
      return;
    }

    __break(1u);
    goto LABEL_30;
  }

id sub_100004BFC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PinViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService17PinViewController);
}

uint64_t sub_100004CAC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100004CC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

void sub_100004D04(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_100004D14(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

void sub_100004D78()
{
  id v1 = v0;
  id v2 = [objc_allocWithZone(UIImageView) initWithImage:*(void *)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_image]];
  [v2 setContentMode:1];
  id v3 = [objc_allocWithZone(UIColor) initWithWhite:1.0 alpha:0.4];
  [v2 setTintColor:v3];

  id v4 = [v2 layer];
  [v4 setCompositingFilter:kCAFilterPlusL];

  id v5 = [v1 view];
  if (v5)
  {
    id v6 = v5;
    [v5 addSubview:v2];

    id v7 = [v1 view];
    if (v7)
    {
      uint64_t v8 = v7;
      sub_1000099B8(v7);

      os_log_type_t v9 = *(void **)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_imageView];
      *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_imageView] = v2;

      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

id sub_100004FE8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnboardingImageViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OnboardingImageViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService29OnboardingImageViewController);
}

void sub_100005070()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100004CC4(v0, qword_10001AB68);
  sub_100004CAC(v0, (uint64_t)qword_10001AB68);
  id v1 = [(id)objc_opt_self(NSBundle) mainBundle];
  id v2 = [v1 bundleIdentifier];

  if (v2)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
    uint64_t v6 = v5;

    Logger.init(subsystem:category:)(v4, v6, 0x6C6172656E6567LL, 0xE700000000000000LL);
  }

  else
  {
    __break(1u);
  }

uint64_t sub_10000513C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100004CC4(v0, qword_10001A660);
  uint64_t v1 = sub_100004CAC(v0, (uint64_t)qword_10001A660);
  if (qword_10001A448 != -1) {
    swift_once(&qword_10001A448, sub_100005070);
  }
  uint64_t v2 = sub_100004CAC(v0, (uint64_t)qword_10001AB68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

unint64_t sub_1000051CC(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0LL:
      unint64_t result = 0x6E776F6E6B6E55LL;
      break;
    case 1LL:
      unint64_t result = 0x4955206F72746E49LL;
      break;
    case 2LL:
      unint64_t result = 0xD000000000000013LL;
      break;
    case 3LL:
      unint64_t result = 0xD000000000000019LL;
      break;
    case 4LL:
      unint64_t result = 0xD000000000000012LL;
      break;
    case 5LL:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 6LL:
      unint64_t result = 0x7369442072657355LL;
      break;
    case 7LL:
      unint64_t result = 0x726F727245LL;
      break;
    default:
      unint64_t result = 0x72696150206E6950LL;
      break;
  }

  return result;
}

unint64_t sub_1000052D8(uint64_t a1)
{
  return sub_1000051CC(a1, *(void *)(v1 + 8));
}

uint64_t sub_1000052E0(uint64_t *a1, uint64_t a2)
{
  return sub_10000839C(*a1, a1[1], *(void *)a2, *(void *)(a2 + 8));
}

void sub_1000053D4()
{
  if (qword_10001A450 != -1) {
    swift_once(&qword_10001A450, sub_10000513C);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100004CAC(v1, (uint64_t)qword_10001A660);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting SetupCoordinator", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = &v0[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
  if (*(void *)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state + 8])
  {
    id v14 = v0;
    id v7 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v10 = swift_slowAlloc(32LL, -1LL);
      uint64_t v16 = v10;
      *(_DWORD *)os_log_type_t v9 = 136315138;
      switch(*((void *)v6 + 1))
      {
        case 0LL:
          unint64_t v11 = 0xE700000000000000LL;
          uint64_t v12 = 0x6E776F6E6B6E55LL;
          break;
        case 1LL:
          unint64_t v11 = 0xE800000000000000LL;
          uint64_t v12 = 0x4955206F72746E49LL;
          break;
        case 2LL:
          uint64_t v12 = 0xD000000000000013LL;
          v13 = "Showing Progress UI";
          goto LABEL_17;
        case 3LL:
          uint64_t v12 = 0xD000000000000019LL;
          v13 = "SetupKit Server Initiated";
          goto LABEL_17;
        case 4LL:
          unint64_t v11 = 0x8000000100012240LL;
          uint64_t v12 = 0xD000000000000012LL;
          break;
        case 5LL:
          uint64_t v12 = 0xD00000000000001ELL;
          v13 = "Captive Network Join Completed";
LABEL_17:
          unint64_t v11 = (unint64_t)(v13 - 32) | 0x8000000000000000LL;
          break;
        case 6LL:
          unint64_t v11 = 0xEE0064657373696DLL;
          uint64_t v12 = 0x7369442072657355LL;
          break;
        case 7LL:
          unint64_t v11 = 0xE500000000000000LL;
          uint64_t v12 = 0x726F727245LL;
          break;
        default:
          unint64_t v11 = 0xE800000000000000LL;
          uint64_t v12 = 0x72696150206E6950LL;
          break;
      }

      uint64_t v15 = sub_100007D5C(v12, v11, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v9 + 4, v9 + 12);

      swift_bridgeObjectRelease(v11);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Cannot start SetupCoordinator when  state = %s", v9, 0xCu);
      swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
    }
  }

  else
  {
    sub_10000571C(0LL, 1uLL);
  }

void sub_10000571C(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = (uint64_t *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
  uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state + 8];
  switch(v6)
  {
    case 0LL:
      if (a2) {
        goto LABEL_24;
      }
      break;
    case 1LL:
      if (a2 != 1) {
        goto LABEL_24;
      }
      break;
    case 2LL:
      if (a2 != 2) {
        goto LABEL_24;
      }
      break;
    case 3LL:
      if (a2 != 3) {
        goto LABEL_24;
      }
      break;
    case 4LL:
      if (a2 != 4) {
        goto LABEL_24;
      }
      break;
    case 5LL:
      if (a2 != 5) {
        goto LABEL_24;
      }
      break;
    case 6LL:
      if (a2 != 6) {
        goto LABEL_24;
      }
      break;
    case 7LL:
      if (a2 != 7) {
        goto LABEL_24;
      }
      break;
    default:
      if (a2 < 8
        || (*v5 == a1 ? (BOOL v7 = v6 == a2) : (BOOL v7 = 0), !v7 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0))
      {
LABEL_24:
        if (qword_10001A450 != -1) {
          swift_once(&qword_10001A450, sub_10000513C);
        }
        uint64_t v8 = type metadata accessor for Logger(0LL);
        sub_100004CAC(v8, (uint64_t)qword_10001A660);
        os_log_type_t v9 = v2;
        sub_10000856C(a1, a2);
        uint64_t v10 = v9;
        uint64_t v11 = sub_10000856C(a1, a2);
        uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
        os_log_type_t v13 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = swift_slowAlloc(22LL, -1LL);
          uint64_t v15 = swift_slowAlloc(64LL, -1LL);
          uint64_t v26 = v15;
          *(_DWORD *)uint64_t v14 = 136315394;
          uint64_t v24 = v15;
          switch(v5[1])
          {
            case 0LL:
              unint64_t v16 = 0xE700000000000000LL;
              uint64_t v17 = 0x6E776F6E6B6E55LL;
              break;
            case 1LL:
              unint64_t v16 = 0xE800000000000000LL;
              uint64_t v17 = 0x4955206F72746E49LL;
              break;
            case 2LL:
              uint64_t v17 = 0xD000000000000013LL;
              id v18 = "Showing Progress UI";
              goto LABEL_36;
            case 3LL:
              uint64_t v17 = 0xD000000000000019LL;
              id v18 = "SetupKit Server Initiated";
              goto LABEL_36;
            case 4LL:
              unint64_t v16 = 0x8000000100012240LL;
              uint64_t v17 = 0xD000000000000012LL;
              break;
            case 5LL:
              uint64_t v17 = 0xD00000000000001ELL;
              id v18 = "Captive Network Join Completed";
LABEL_36:
              unint64_t v16 = (unint64_t)(v18 - 32) | 0x8000000000000000LL;
              break;
            case 6LL:
              uint64_t v17 = 0x7369442072657355LL;
              unint64_t v16 = 0xEE0064657373696DLL;
              break;
            case 7LL:
              unint64_t v16 = 0xE500000000000000LL;
              uint64_t v17 = 0x726F727245LL;
              break;
            default:
              unint64_t v16 = 0xE800000000000000LL;
              uint64_t v17 = 0x72696150206E6950LL;
              break;
          }

          uint64_t v25 = sub_100007D5C(v17, v16, &v26);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v14 + 4, v14 + 12);

          swift_bridgeObjectRelease(v16);
          *(_WORD *)(v14 + 12) = 2080;
          switch(a2)
          {
            case 0uLL:
              unint64_t v19 = 0xE700000000000000LL;
              uint64_t v20 = 0x6E776F6E6B6E55LL;
              break;
            case 1uLL:
              unint64_t v19 = 0xE800000000000000LL;
              uint64_t v20 = 0x4955206F72746E49LL;
              break;
            case 2uLL:
              uint64_t v20 = 0xD000000000000013LL;
              id v21 = "Showing Progress UI";
              goto LABEL_47;
            case 3uLL:
              uint64_t v20 = 0xD000000000000019LL;
              id v21 = "SetupKit Server Initiated";
              goto LABEL_47;
            case 4uLL:
              unint64_t v19 = 0x8000000100012240LL;
              uint64_t v20 = 0xD000000000000012LL;
              break;
            case 5uLL:
              uint64_t v20 = 0xD00000000000001ELL;
              id v21 = "Captive Network Join Completed";
LABEL_47:
              unint64_t v19 = (unint64_t)(v21 - 32) | 0x8000000000000000LL;
              break;
            case 6uLL:
              uint64_t v20 = 0x7369442072657355LL;
              unint64_t v19 = 0xEE0064657373696DLL;
              break;
            case 7uLL:
              unint64_t v19 = 0xE500000000000000LL;
              uint64_t v20 = 0x726F727245LL;
              break;
            default:
              unint64_t v19 = 0xE800000000000000LL;
              uint64_t v20 = 0x72696150206E6950LL;
              break;
          }

          uint64_t v25 = sub_100007D5C(v20, v19, &v26);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v14 + 14, v14 + 22);
          swift_bridgeObjectRelease(v19);
          sub_100008580(a1, a2);
          sub_100008580(a1, a2);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Transitioning from %s to %s", (uint8_t *)v14, 0x16u);
          swift_arrayDestroy(v24, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v24, -1LL, -1LL);
          swift_slowDealloc(v14, -1LL, -1LL);
        }

        else
        {

          sub_100008580(a1, a2);
          sub_100008580(a1, a2);
        }

        uint64_t v22 = *v5;
        unint64_t v23 = v5[1];
        uint64_t *v5 = a1;
        v5[1] = a2;
        sub_10000856C(a1, a2);
        sub_100008580(v22, v23);
        sub_100006C24();
      }

      break;
  }

void sub_100005C60()
{
  if (qword_10001A450 != -1) {
    swift_once(&qword_10001A450, sub_10000513C);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_100004CAC(v0, (uint64_t)qword_10001A660);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Stopping SetupCoordinator", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  sub_100008A00();
  sub_10000571C(0LL, 0LL);
}

void sub_100005D7C()
{
  uint64_t v1 = v0;
  if (qword_10001A450 != -1) {
    swift_once(&qword_10001A450, sub_10000513C);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_100004CAC(v2, (uint64_t)qword_10001A660);
  os_log_type_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v10 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v9 = sub_100007D5C(0xD000000000000013LL, 0x8000000100012500LL, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  if (*(void *)(v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state + 8) == 1LL)
  {
    uint64_t v8 = swift_allocObject(&unk_100014808, 24LL, 7LL);
    swift_unknownObjectWeakInit(v8 + 16, v1);
    swift_retain(v8);
    sub_100008C1C((uint64_t)sub_1000087CC, v8);
    swift_release_n(v8, 2LL);
    sub_10000571C(0LL, 2LL);
  }

void sub_100005F6C(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3, v4);
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    sub_100005FC4(a1);
  }

void sub_100005FC4(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10001A450 != -1) {
    swift_once(&qword_10001A450, sub_10000513C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100004CAC(v4, (uint64_t)qword_10001A660);
  id v5 = a1;
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v48 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_1000087D4((int)[v5 eventType]);
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
    unint64_t v14 = v13;

    uint64_t v47 = sub_100007D5C(v12, v14, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v8 + 4, v8 + 12);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Recieved SKEvent: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v15 = v9;
    uint64_t v2 = v1;
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  id v16 = [v5 error];
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = v2;
    id v19 = v17;
    uint64_t v20 = (char *)v18;
    id v21 = v19;
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc(22LL, -1LL);
      uint64_t v25 = swift_slowAlloc(64LL, -1LL);
      uint64_t v48 = v25;
      *(_DWORD *)uint64_t v24 = 136315394;
      switch(*(void *)&v20[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state + 8])
      {
        case 0LL:
          unint64_t v26 = 0xE700000000000000LL;
          uint64_t v27 = 0x6E776F6E6B6E55LL;
          break;
        case 1LL:
          unint64_t v26 = 0xE800000000000000LL;
          uint64_t v27 = 0x4955206F72746E49LL;
          break;
        case 2LL:
          uint64_t v27 = 0xD000000000000013LL;
          double v38 = "Showing Progress UI";
          goto LABEL_27;
        case 3LL:
          uint64_t v27 = 0xD000000000000019LL;
          double v38 = "SetupKit Server Initiated";
          goto LABEL_27;
        case 4LL:
          unint64_t v26 = 0x8000000100012240LL;
          uint64_t v27 = 0xD000000000000012LL;
          break;
        case 5LL:
          uint64_t v27 = 0xD00000000000001ELL;
          double v38 = "Captive Network Join Completed";
LABEL_27:
          unint64_t v26 = (unint64_t)(v38 - 32) | 0x8000000000000000LL;
          break;
        case 6LL:
          unint64_t v26 = 0xEE0064657373696DLL;
          uint64_t v27 = 0x7369442072657355LL;
          break;
        case 7LL:
          unint64_t v26 = 0xE500000000000000LL;
          uint64_t v27 = 0x726F727245LL;
          break;
        default:
          unint64_t v26 = 0xE800000000000000LL;
          uint64_t v27 = 0x72696150206E6950LL;
          break;
      }

      uint64_t v47 = sub_100007D5C(v27, v26, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v24 + 4, v24 + 12);

      swift_bridgeObjectRelease(v26);
      *(_WORD *)(v24 + 12) = 2080;
      swift_getErrorValue(v21, v46, v45);
      uint64_t v39 = Error.localizedDescription.getter(v45[1], v45[2]);
      unint64_t v41 = v40;
      uint64_t v47 = sub_100007D5C(v39, v40, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v24 + 14, v24 + 22);

      swift_bridgeObjectRelease(v41);
      _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "CurrentState - %s - SetupKit Error: %s",  (uint8_t *)v24,  0x16u);
      swift_arrayDestroy(v25, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    else
    {
    }

    sub_10000571C(0LL, 7LL);
  }

  else
  {
    id v28 = [v5 eventType];
    if ((int)v28 <= 99)
    {
      switch((int)v28)
      {
        case 0:
        case 10:
          return;
        case 20:
        case 30:
        case 41:
          goto LABEL_38;
        case 40:
          uint64_t v37 = 3LL;
          goto LABEL_34;
        default:
LABEL_35:
          double v42 = (os_log_s *)Logger.logObject.getter(v28);
          os_log_type_t v43 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v42, v43))
          {
            v44 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)v44 = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, v43, "bad state. Dismissing...", v44, 2u);
            swift_slowDealloc(v44, -1LL, -1LL);
          }

LABEL_38:
          sub_100006780();
          break;
      }
    }

    else
    {
      switch((int)v28)
      {
        case 100:
        case 120:
        case 130:
          return;
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
        case 129:
        case 131:
        case 132:
        case 133:
        case 134:
        case 135:
        case 136:
        case 137:
        case 138:
        case 139:
          goto LABEL_35;
        case 110:
          uint64_t v29 = objc_opt_self(&OBJC_CLASS___SKAuthenticationPresentEvent);
          id v30 = (void *)swift_dynamicCastObjCClass(v5, v29);
          if (!v30) {
            goto LABEL_40;
          }
          id v31 = v5;
          id v32 = [v30 password];
          if (v32)
          {
            v34 = v32;
            id v30 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v32, v33);
            unint64_t v36 = v35;
          }

          else
          {

            id v30 = 0LL;
LABEL_40:
            unint64_t v36 = 0xE000000000000000LL;
          }

          sub_10000571C(v30, v36);
          swift_bridgeObjectRelease(v36);
          return;
        case 140:
          uint64_t v37 = 4LL;
          break;
        default:
          if ((_DWORD)v28 != 202) {
            goto LABEL_35;
          }
          uint64_t v37 = 5LL;
          break;
      }

LABEL_34:
      sub_10000571C(0LL, v37);
    }
  }

void sub_100006780()
{
  if (qword_10001A450 != -1) {
    swift_once(&qword_10001A450, sub_10000513C);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  sub_100004CAC(v1, (uint64_t)qword_10001A660);
  uint64_t v2 = v0;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v6;
    *(_DWORD *)id v5 = 136315138;
    switch(*(void *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state + 8])
    {
      case 0LL:
        unint64_t v7 = 0xE700000000000000LL;
        uint64_t v8 = 0x6E776F6E6B6E55LL;
        break;
      case 1LL:
        unint64_t v7 = 0xE800000000000000LL;
        uint64_t v8 = 0x4955206F72746E49LL;
        break;
      case 2LL:
        uint64_t v8 = 0xD000000000000013LL;
        uint64_t v10 = "Showing Progress UI";
        goto LABEL_13;
      case 3LL:
        uint64_t v8 = 0xD000000000000019LL;
        uint64_t v10 = "SetupKit Server Initiated";
        goto LABEL_13;
      case 4LL:
        unint64_t v7 = 0x8000000100012240LL;
        uint64_t v8 = 0xD000000000000012LL;
        break;
      case 5LL:
        uint64_t v8 = 0xD00000000000001ELL;
        uint64_t v10 = "Captive Network Join Completed";
LABEL_13:
        unint64_t v7 = (unint64_t)(v10 - 32) | 0x8000000000000000LL;
        break;
      case 6LL:
        unint64_t v7 = 0xEE0064657373696DLL;
        uint64_t v8 = 0x7369442072657355LL;
        break;
      case 7LL:
        unint64_t v7 = 0xE500000000000000LL;
        uint64_t v8 = 0x726F727245LL;
        break;
      default:
        unint64_t v7 = 0xE800000000000000LL;
        uint64_t v8 = 0x72696150206E6950LL;
        break;
    }

    uint64_t v25 = sub_100007D5C(v8, v7, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, aBlock, v5 + 4, v5 + 12);

    swift_bridgeObjectRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Dismissing UI - Current State: %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v11 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    unint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Stopping SetupCoordinator", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  sub_100008A00();
  uint64_t v14 = sub_10000571C(0LL, 0LL);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Dismissing remoteViewController", v17, 2u);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  uint64_t Strong = swift_unknownObjectWeakLoadStrong( &v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController],  v18);
  if (Strong)
  {
    uint64_t v20 = (void *)Strong;
    uint64_t v21 = swift_allocObject(&unk_1000147B8, 24LL, 7LL);
    *(void *)(v21 + 16) = v2;
    aBlock[4] = (uint64_t)sub_10000848C;
    uint64_t v27 = v21;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_100006BC4;
    aBlock[3] = (uint64_t)&unk_1000147D0;
    uint64_t v22 = _Block_copy(aBlock);
    uint64_t v23 = v27;
    uint64_t v24 = v2;
    swift_release(v23);
    [v20 dismissViewControllerAnimated:1 completion:v22];
    _Block_release(v22);
  }

uint64_t sub_100006BC4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100006C24()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state + 8);
  switch(v3)
  {
    case 0LL:
    case 3LL:
    case 5LL:
      return;
    case 1LL:
      uint64_t v4 = OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setupViewController;
      if (!*(void *)(v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setupViewController))
      {
        id v5 = objc_allocWithZone((Class)type metadata accessor for IntroViewController());
        uint64_t v6 = (char *)sub_10000D5B4();
        swift_unknownObjectWeakAssign( &v6[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_setupCoordinator],  v1);
        unint64_t v7 = *(void **)(v1 + v4);
        *(void *)(v1 + v4) = v6;
        v44 = v6;

        uint64_t v8 = v44;
        goto LABEL_19;
      }

      break;
    case 2LL:
      uint64_t v8 = (char *)[objc_allocWithZone((Class)type metadata accessor for ActivityViewController()) init];
      id v28 = *(char **)(v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setupViewController);
      v44 = v8;
      if (v28)
      {
        uint64_t v29 = *(void **)&v28[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_introNavigationController];
        id v30 = v28;
        [v29 pushViewController:v44 animated:1];
      }

      else
      {
LABEL_19:
        sub_1000070D0(v8);
      }

      os_log_type_t v43 = v44;
      goto LABEL_21;
    case 4LL:
      uint64_t v31 = OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController;
      id v32 = *(void **)(v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController);
      if (v32)
      {
        id v33 = [v32 topViewController];
        if (v33)
        {
          v34 = v33;
          uint64_t v35 = type metadata accessor for PinViewController();
          uint64_t v36 = swift_dynamicCastClass(v34, v35);

          if (v36)
          {
            if (qword_10001A450 != -1) {
              swift_once(&qword_10001A450, sub_10000513C);
            }
            uint64_t v37 = type metadata accessor for Logger(0LL);
            uint64_t v38 = sub_100004CAC(v37, (uint64_t)qword_10001A660);
            uint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
            os_log_type_t v40 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v39, v40))
            {
              unint64_t v41 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              *(_WORD *)unint64_t v41 = 0;
              _os_log_impl((void *)&_mh_execute_header, v39, v40, "Dismissing PinViewController", v41, 2u);
              swift_slowDealloc(v41, -1LL, -1LL);
            }

            double v42 = *(void **)(v1 + v31);
            if (v42)
            {
              os_log_type_t v43 = (char *)[v42 popViewControllerAnimated:1];
LABEL_21:
            }
          }
        }
      }

      break;
    case 6LL:
      sub_100008684();
      sub_100006780();
      break;
    case 7LL:
      sub_100007350();
      break;
    default:
      uint64_t v9 = *v2;
      uint64_t v10 = (objc_class *)type metadata accessor for PinViewController();
      uint64_t v11 = (char *)objc_allocWithZone(v10);
      *(void *)&v11[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController____lazy_storage___backgroundView] = 1LL;
      *(void *)&v11[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_digitEntryViewController] = 0LL;
      os_log_type_t v12 = &v11[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName];
      *(void *)os_log_type_t v12 = 0LL;
      *((void *)v12 + 1) = 0LL;
      unint64_t v13 = &v11[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_pin];
      *(void *)unint64_t v13 = v9;
      *((void *)v13 + 1) = v3;
      v45.receiver = v11;
      v45.super_class = v10;
      swift_bridgeObjectRetain(v3);
      uint64_t v14 = (char *)objc_msgSendSuper2(&v45, "initWithNibName:bundle:", 0, 0);
      uint64_t v15 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
      os_log_type_t v16 = (NSBundle *)[v15 mainBundle];
      v46._object = (void *)0xE000000000000000LL;
      v17._object = (void *)0x80000001000124E0LL;
      v17._countAndFlagsBits = 0xD000000000000015LL;
      v18.value._countAndFlagsBits = 0x617A696C61636F4CLL;
      v18.value._object = (void *)0xEB00000000656C62LL;
      v19._countAndFlagsBits = 0LL;
      v19._object = (void *)0xE000000000000000LL;
      v46._countAndFlagsBits = 0LL;
      Swift::String v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, v18, v16, v19, v46);

      uint64_t v21 = *(void *)&v14[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName + 8];
      *(Swift::String *)&v14[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName] = v20;
      swift_bridgeObjectRelease(v21);
      uint64_t v22 = (NSBundle *)[v15 mainBundle];
      v47._object = (void *)0xE000000000000000LL;
      v23._countAndFlagsBits = 0x49544E4548545541LL;
      v23._object = (void *)0xEC00000045544143LL;
      v24.value._countAndFlagsBits = 0x617A696C61636F4CLL;
      v24.value._object = (void *)0xEB00000000656C62LL;
      v25._countAndFlagsBits = 0LL;
      v25._object = (void *)0xE000000000000000LL;
      v47._countAndFlagsBits = 0LL;
      object = NSLocalizedString(_:tableName:bundle:value:comment:)(v23, v24, v22, v25, v47)._object;

      NSString v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      [v14 setTitle:v27];

      sub_1000070D0(v14);
      break;
  }

void sub_1000070D0(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [objc_allocWithZone(UITapGestureRecognizer) initWithTarget:v1 action:"menuButtonPressed:"];
  uint64_t v5 = sub_100008528(&qword_10001A880);
  uint64_t v6 = swift_allocObject(v5, 40LL, 7LL);
  *(_OWORD *)(v6 + 16) = xmmword_100012ED0;
  id v7 = objc_allocWithZone(&OBJC_CLASS___NSNumber);
  id v27 = v4;
  *(void *)(v6 + 32) = [v7 initWithInteger:5];
  specialized Array._endMutation()();
  uint64_t v8 = v6;
  sub_100008970();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  [v27 setAllowedPressTypes:isa];

  id v10 = [a1 view];
  if (v10)
  {
    uint64_t v11 = v10;
    [v10 addGestureRecognizer:v27];

    uint64_t v13 = OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController;
    uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController);
    if (v14)
    {
      id v15 = v14;
      [v15 pushViewController:a1 animated:1];
    }

    else
    {
      uint64_t Strong = swift_unknownObjectWeakLoadStrong( v2 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController,  v12);
      if (Strong)
      {
        Swift::String v17 = (void *)Strong;
        id v18 = objc_allocWithZone((Class)type metadata accessor for TVSetupContainerViewController());
        Swift::String v19 = sub_10000CB64(a1);
        Swift::String v20 = &v19[OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_progressDelegate];
        *((void *)v20 + 1) = &off_100014790;
        swift_unknownObjectWeakAssign(v20, v2);
        id v21 = [v19 presentationController];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = objc_opt_self(&OBJC_CLASS____UIProgressiveBlurPresentationController);
          Swift::String_optional v24 = (void *)swift_dynamicCastObjCClass(v22, v23);
          if (v24) {
            [v24 setBlurStyle:4009];
          }
        }

        [v17 presentViewController:v19 animated:1 completion:0];
        id v25 = *(id *)&v19[OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_mainNavigationController];
      }

      else
      {

        id v25 = 0LL;
      }

      unint64_t v26 = *(void **)(v2 + v13);
      *(void *)(v2 + v13) = v25;
    }
  }

  else
  {
    __break(1u);
  }

void sub_100007350()
{
  uint64_t v1 = v0;
  if (qword_10001A450 != -1) {
    swift_once(&qword_10001A450, sub_10000513C);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_100004CAC(v2, (uint64_t)qword_10001A660);
  id v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Stopping SetupCoordinator", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  sub_100008A00();
  sub_10000571C(0LL, 0LL);
  id v7 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
  uint64_t v8 = (NSBundle *)[v7 mainBundle];
  v47._object = (void *)0xE000000000000000LL;
  v9._countAndFlagsBits = 0x49545F524F525245LL;
  v9._object = (void *)0xEB00000000454C54LL;
  v10.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v10.value._object = (void *)0xEB00000000656C62LL;
  v11._countAndFlagsBits = 0LL;
  v11._object = (void *)0xE000000000000000LL;
  v47._countAndFlagsBits = 0LL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, v8, v11, v47)._object;

  uint64_t v13 = sub_100008528(&qword_10001A748);
  uint64_t v14 = swift_allocObject(v13, 72LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_100012EE0;
  id v15 = [objc_allocWithZone(CWFInterface) init];
  [v15 activate];
  id v16 = [v15 networkName];
  if (v16)
  {
    id v18 = v16;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);
    unint64_t v21 = v20;
  }

  else
  {
    uint64_t v19 = 0LL;
    unint64_t v21 = 0LL;
  }

  [v15 invalidate];

  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 64) = sub_1000089AC();
  if (v21) {
    uint64_t v22 = v19;
  }
  else {
    uint64_t v22 = 0LL;
  }
  if (v21) {
    unint64_t v23 = v21;
  }
  else {
    unint64_t v23 = 0xE000000000000000LL;
  }
  *(void *)(v14 + 32) = v22;
  *(void *)(v14 + 40) = v23;
  Swift::String_optional v24 = (NSBundle *)[v7 mainBundle];
  v48._object = (void *)0xE000000000000000LL;
  v25._countAndFlagsBits = 0x454D5F524F525245LL;
  v25._object = (void *)0xED00004547415353LL;
  v26.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v26.value._object = (void *)0xEB00000000656C62LL;
  v27._countAndFlagsBits = 0LL;
  v27._object = (void *)0xE000000000000000LL;
  v48._countAndFlagsBits = 0LL;
  Swift::String v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, v26, v24, v27, v48);

  String.init(format:arguments:)(v28._countAndFlagsBits, v28._object, v14);
  uint64_t v30 = v29;
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v28._object);
  NSString v31 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  NSString v32 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v30);
  id v33 =  [(id)objc_opt_self(UIAlertController) alertControllerWithTitle:v31 message:v32 preferredStyle:1];

  v34 = (NSBundle *)[v7 mainBundle];
  v49._object = (void *)0xE000000000000000LL;
  v35._countAndFlagsBits = 0x4B4F5F524F525245LL;
  v35._object = (void *)0xEF4E4F545455425FLL;
  v36.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v36.value._object = (void *)0xEB00000000656C62LL;
  v37._countAndFlagsBits = 0LL;
  v37._object = (void *)0xE000000000000000LL;
  v49._countAndFlagsBits = 0LL;
  uint64_t v38 = NSLocalizedString(_:tableName:bundle:value:comment:)(v35, v36, v34, v37, v49)._object;

  uint64_t v39 = swift_allocObject(&unk_100014808, 24LL, 7LL);
  swift_unknownObjectWeakInit(v39 + 16, v1);
  swift_retain(v39);
  NSString v40 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v38);
  aBlock[4] = sub_1000089F0;
  uint64_t v46 = v39;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000078A4;
  aBlock[3] = &unk_100014820;
  unint64_t v41 = _Block_copy(aBlock);
  swift_release(v46);
  id v42 = [(id)objc_opt_self(UIAlertAction) actionWithTitle:v40 style:1 handler:v41];
  _Block_release(v41);
  swift_release(v39);

  [v33 addAction:v42];
  os_log_type_t v43 = *(void **)(v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController);
  if (v43)
  {
    id v44 = v43;
    [v44 presentViewController:v33 animated:1 completion:0];
  }
}

void sub_100007854(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v2, v3);
  if (Strong)
  {
    os_log_type_t v5 = (void *)Strong;
    sub_100006780();
  }

void sub_1000078A4(uint64_t a1, void *a2)
{
  id v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

id sub_100007A20()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SetupCoordinator()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService16SetupCoordinator);
}

unint64_t destroy for SetupFlowState(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s22HomeCaptiveViewService14SetupFlowStateOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }

  return a1;
}

void *assignWithCopy for SetupFlowState(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = a2[1];
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }

LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(a1[1]);
    goto LABEL_7;
  }

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4);
  return a1;
}

  __break(1u);
}

__n128 initializeWithTake for SetupFlowState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for SetupFlowState(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  unint64_t v5 = *(void *)(a2 + 8);
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(v4);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SetupFlowState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFF8 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483640);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 7;
  if (v4 >= 9) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for SetupFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFF7)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)__n128 result = a2 - 2147483640;
    if (a3 >= 0x7FFFFFF8) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFF8) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 7;
    }
  }

  return result;
}

uint64_t sub_100007D10(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100007D2C(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0LL;
  }

  else if (a2)
  {
    result[1] = (a2 - 1);
  }

  return result;
}

ValueMetadata *type metadata accessor for SetupFlowState()
{
  return &type metadata for SetupFlowState;
}

uint64_t sub_100007D5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007E2C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000084EC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000084EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000084CC(v12);
  return v7;
}

uint64_t sub_100007E2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_100007FE4(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_100007FE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008078(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008250(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008250(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008078(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      unsigned int v5 = sub_1000081EC(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_1000081EC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_100008528((uint64_t *)&unk_10001A730);
  unsigned int v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100008250(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100008528((uint64_t *)&unk_10001A730);
    Swift::String v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    Swift::String v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10000839C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0LL:
      if (a4) {
        goto LABEL_22;
      }
      uint64_t result = 1LL;
      break;
    case 1LL:
      if (a4 != 1) {
        goto LABEL_22;
      }
      uint64_t result = 1LL;
      break;
    case 2LL:
      if (a4 != 2) {
        goto LABEL_22;
      }
      uint64_t result = 1LL;
      break;
    case 3LL:
      if (a4 != 3) {
        goto LABEL_22;
      }
      uint64_t result = 1LL;
      break;
    case 4LL:
      if (a4 != 4) {
        goto LABEL_22;
      }
      uint64_t result = 1LL;
      break;
    case 5LL:
      if (a4 != 5) {
        goto LABEL_22;
      }
      uint64_t result = 1LL;
      break;
    case 6LL:
      if (a4 != 6) {
        goto LABEL_22;
      }
      uint64_t result = 1LL;
      break;
    case 7LL:
      if (a4 != 7) {
        goto LABEL_22;
      }
      uint64_t result = 1LL;
      break;
    default:
      if (a4 < 8)
      {
LABEL_22:
        uint64_t result = 0LL;
      }

      else if (a1 == a3 && a2 == a4)
      {
        uint64_t result = 1LL;
      }

      else
      {
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      }

      break;
  }

  return result;
}

uint64_t sub_100008468()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_10000848C()
{
  id result = *(id *)(*(void *)(v0 + 16)
                 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewControllerProxy);
  if (result) {
    return [result dismissWithResult:0];
  }
  return result;
}

uint64_t sub_1000084B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000084C4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000084CC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000084EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008528(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000856C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 8) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t sub_100008580(uint64_t a1, unint64_t a2)
{
  if (a2 >= 8) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

id sub_100008594(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType(v2);
  unint64_t v6 = &v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController];
  swift_unknownObjectWeakInit(&v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController], 0LL);
  *(void *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController] = 0LL;
  uint64_t v7 = OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewControllerProxy;
  *(void *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewControllerProxy] = 0LL;
  int64_t v8 = &v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
  *(void *)int64_t v8 = 0LL;
  *((void *)v8 + 1) = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setupViewController] = 0LL;
  uint64_t v9 = type metadata accessor for Setup();
  uint64_t v10 = swift_allocObject(v9, 25LL, 7LL);
  *(void *)(v10 + 16) = 0LL;
  *(_BYTE *)(v10 + 24) = 0;
  *(void *)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup] = v10;
  swift_unknownObjectWeakAssign(v6, a1);
  uint64_t v11 = *(void *)&v2[v7];
  *(void *)&v2[v7] = a2;
  swift_unknownObjectRetain(a2, v12);
  swift_unknownObjectRelease(v11);
  v14.receiver = v2;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, "init");
}

void sub_100008684()
{
  if (qword_10001A450 != -1) {
    swift_once(&qword_10001A450, sub_10000513C);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_100004CAC(v0, (uint64_t)qword_10001A660);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Posting Darwin notification", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  unsigned int v5 = CFNotificationCenterGetDarwinNotifyCenter();
  unint64_t v6 = (__CFString *)String._bridgeToObjectiveC()();
  CFNotificationCenterPostNotification(v5, v6, 0LL, 0LL, 1u);
}

uint64_t sub_1000087A8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000087CC(void *a1)
{
}

__CFString *sub_1000087D4(int a1)
{
  if (a1 > 109)
  {
    if (a1 <= 199)
    {
      if (a1 > 129)
      {
        if (a1 == 130)
        {
          uint64_t v1 = @"AuthenticationResponse";
          goto LABEL_39;
        }

        if (a1 == 140)
        {
          uint64_t v1 = @"AuthenticationCompleted";
          goto LABEL_39;
        }
      }

      else
      {
        if (a1 == 110)
        {
          uint64_t v1 = @"AuthenticationPresent";
          goto LABEL_39;
        }

        if (a1 == 120)
        {
          uint64_t v1 = @"AuthenticationRequest";
          goto LABEL_39;
        }
      }

      goto LABEL_38;
    }

    if (a1 > 201)
    {
      if (a1 == 202)
      {
        uint64_t v1 = @"CaptiveNetworkAuthenticated";
        goto LABEL_39;
      }

      if (a1 == 300)
      {
        uint64_t v1 = @"BasicConfigUpdated";
        goto LABEL_39;
      }

      goto LABEL_38;
    }

    if (a1 == 200) {
      uint64_t v1 = @"CaptiveNetworkPresent";
    }
    else {
      uint64_t v1 = @"CaptiveNetworkNavigation";
    }
  }

  else
  {
    if (a1 <= 39)
    {
      if (a1 > 19)
      {
        if (a1 == 20)
        {
          uint64_t v1 = @"Completed";
          goto LABEL_39;
        }

        if (a1 == 30)
        {
          uint64_t v1 = @"Invalidated";
          goto LABEL_39;
        }
      }

      else
      {
        if (!a1)
        {
          uint64_t v1 = @"Unknown";
          goto LABEL_39;
        }

        if (a1 == 10)
        {
          uint64_t v1 = @"Started";
          goto LABEL_39;
        }
      }

LABEL_38:
      uint64_t v1 = @"?";
      goto LABEL_39;
    }

    if (a1 > 41)
    {
      if (a1 == 42)
      {
        uint64_t v1 = @"Error";
        goto LABEL_39;
      }

      if (a1 == 100)
      {
        uint64_t v1 = @"AuthenticationTypeChanged";
        goto LABEL_39;
      }

      goto LABEL_38;
    }

    if (a1 == 40) {
      uint64_t v1 = @"ConnectionStarted";
    }
    else {
      uint64_t v1 = @"ConnectionEnded";
    }
  }

LABEL_39:
  uint64_t v2 = v1;
  return v1;
}

unint64_t sub_100008970()
{
  unint64_t result = qword_10001A740;
  if (!qword_10001A740)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001A740);
  }

  return result;
}

unint64_t sub_1000089AC()
{
  unint64_t result = qword_10001A750;
  if (!qword_10001A750)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001A750);
  }

  return result;
}

void sub_1000089F0(uint64_t a1)
{
}

void sub_100008A00()
{
  uint64_t v1 = v0;
  if (*(_BYTE *)(v0 + 24)) {
    uint64_t v2 = 0x657669746341LL;
  }
  else {
    uint64_t v2 = 0x6576697463616E49LL;
  }
  if (*(_BYTE *)(v0 + 24)) {
    unint64_t v3 = 0xE600000000000000LL;
  }
  else {
    unint64_t v3 = 0xE800000000000000LL;
  }
  if (qword_10001A458 != -1) {
    swift_once(&qword_10001A458, sub_100008EC0);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100004CAC(v4, (uint64_t)qword_10001A760);
  uint64_t v5 = swift_bridgeObjectRetain(v3);
  unint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v9;
    *(_DWORD *)int64_t v8 = 136315138;
    swift_bridgeObjectRetain(v3);
    uint64_t v13 = sub_100007D5C(v2, v3, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(v3, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Invalidating %s server", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);

    uint64_t v10 = *(void **)(v1 + 16);
    if (!v10) {
      goto LABEL_15;
    }
  }

  else
  {

    swift_bridgeObjectRelease_n(v3, 2LL);
    uint64_t v10 = *(void **)(v1 + 16);
    if (!v10)
    {
LABEL_15:
      uint64_t v12 = 0LL;
      goto LABEL_16;
    }
  }

  [v10 invalidate];
  uint64_t v11 = *(void **)(v1 + 16);
  if (!v11) {
    goto LABEL_15;
  }
  [v11 setEventHandler:0];
  uint64_t v12 = *(void **)(v1 + 16);
LABEL_16:
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;

  *(_BYTE *)(v1 + 24) = 0;
}

void sub_100008C1C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(v2 + 24) & 1) != 0)
  {
    if (qword_10001A458 != -1) {
      swift_once(&qword_10001A458, sub_100008EC0);
    }
    uint64_t v3 = type metadata accessor for Logger(0LL);
    uint64_t v4 = sub_100004CAC(v3, (uint64_t)qword_10001A760);
    oslog = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v5))
    {
      unint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v5, "SKServer already running. Ignoring the call", v6, 2u);
      swift_slowDealloc(v6, -1LL, -1LL);
    }
  }

  else
  {
    uint64_t v7 = v2;
    *(_BYTE *)(v2 + 24) = 1;
    if (qword_10001A458 != -1) {
      swift_once(&qword_10001A458, sub_100008EC0);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_100004CAC(v10, (uint64_t)qword_10001A760);
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Starting SetupKit Server", v14, 2u);
      swift_slowDealloc(v14, -1LL, -1LL);
    }

    id v15 = [objc_allocWithZone(SKSetupCaptiveNetworkJoinServer) init];
    id v16 = *(void **)(v7 + 16);
    *(void *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = v15;

    uint64_t v17 = *(void **)(v7 + 16);
    if (v17)
    {
      [v17 setMode:0];
      id v18 = *(void **)(v7 + 16);
      if (v18)
      {
        [v18 setPasswordType:1];
        uint64_t v19 = *(void **)(v7 + 16);
        if (v19)
        {
          aBlock[4] = a1;
          uint64_t v26 = a2;
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 1107296256LL;
          aBlock[2] = sub_1000078A4;
          aBlock[3] = &unk_100014870;
          unint64_t v20 = _Block_copy(aBlock);
          uint64_t v21 = v26;
          id v22 = v19;
          swift_retain(a2);
          swift_release(v21);
          [v22 setEventHandler:v20];
          _Block_release(v20);

          unint64_t v23 = *(void **)(v7 + 16);
          if (v23) {
            [v23 activate];
          }
        }
      }
    }
  }

uint64_t sub_100008EC0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100004CC4(v0, qword_10001A760);
  uint64_t v1 = sub_100004CAC(v0, (uint64_t)qword_10001A760);
  if (qword_10001A448 != -1) {
    swift_once(&qword_10001A448, sub_100005070);
  }
  uint64_t v2 = sub_100004CAC(v0, (uint64_t)qword_10001AB68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_100008F50()
{
  return swift_deallocClassInstance(v0, 25LL, 7LL);
}

uint64_t type metadata accessor for Setup()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService5Setup);
}

uint64_t sub_100008F94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008FA4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100008FAC()
{
  qword_10001A820 = 0x4085E00000000000LL;
}

void sub_100008FC0()
{
  qword_10001A828 = 0x408A180000000000LL;
}

void sub_100008FD4()
{
  qword_10001A830 = 0x405F400000000000LL;
}

void sub_100008FE8()
{
  qword_10001A838 = 0x4062C00000000000LL;
}

void sub_100008FFC()
{
  qword_10001A840 = 0x405B800000000000LL;
}

void sub_100009208()
{
  id v1 = [objc_allocWithZone(UIStackView) init];
  id v52 = v1;
  if (qword_10001A480 != -1)
  {
    swift_once(&qword_10001A480, sub_100008FFC);
    id v1 = v52;
  }

  objc_msgSend(v1, "setSpacing:", *(double *)&qword_10001A840, v52);
  [v53 setDistribution:0];
  [v53 setAxis:0];
  [v53 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v2 = [(id)objc_opt_self(UIApplication) sharedApplication];
  id v3 = [v2 userInterfaceLayoutDirection];

  if (v3 == (id)1)
  {
    uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_accessoryViewController];
    id v5 = [v4 view];
    if (!v5)
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }

    unint64_t v6 = v5;
    [v53 addArrangedSubview:v5];

    uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_dialogueViewController];
    id v8 = [v7 view];
    if (!v8)
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    uint64_t v9 = v8;
    [v53 addArrangedSubview:v8];

    if (qword_10001A470 != -1) {
      swift_once(&qword_10001A470, sub_100008FD4);
    }
    uint64_t v10 = qword_10001A830;
    if (qword_10001A478 != -1) {
      swift_once(&qword_10001A478, sub_100008FE8);
    }
    uint64_t v11 = &qword_10001A838;
  }

  else
  {
    uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_dialogueViewController];
    id v12 = [v7 view];
    if (!v12)
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    os_log_type_t v13 = v12;
    [v53 addArrangedSubview:v12];

    uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_accessoryViewController];
    id v14 = [v4 view];
    if (!v14)
    {
LABEL_40:
      __break(1u);
      return;
    }

    id v15 = v14;
    [v53 addArrangedSubview:v14];

    if (qword_10001A478 != -1) {
      swift_once(&qword_10001A478, sub_100008FE8);
    }
    uint64_t v10 = qword_10001A838;
    if (qword_10001A470 != -1) {
      swift_once(&qword_10001A470, sub_100008FD4);
    }
    uint64_t v11 = &qword_10001A830;
  }

  double v16 = *(double *)v11;
  id v17 = [v0 view];
  if (!v17)
  {
    __break(1u);
    goto LABEL_31;
  }

  id v18 = v17;
  [v17 addSubview:v53];

  [v4 didMoveToParentViewController:v0];
  [v7 didMoveToParentViewController:v0];
  uint64_t v19 = sub_100008528(&qword_10001A880);
  uint64_t v20 = swift_allocObject(v19, 80LL, 7LL);
  *(_OWORD *)(v20 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_100012F10;
  id v21 = [v53 leadingAnchor];
  id v22 = [v0 view];
  if (!v22)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  unint64_t v23 = v22;
  id v24 = [v22 leadingAnchor];

  id v25 = [v21 constraintEqualToAnchor:v24 constant:*(double *)&v10];
  *(void *)(v20 + 32) = v25;
  id v26 = [v53 trailingAnchor];
  id v27 = [v0 view];
  if (!v27)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  Swift::String v28 = v27;
  id v29 = [v27 trailingAnchor];

  id v30 = [v26 constraintEqualToAnchor:v29 constant:-v16];
  *(void *)(v20 + 40) = v30;
  id v31 = [v53 topAnchor];
  id v32 = [v0 view];
  if (!v32)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }

  id v33 = v32;
  id v34 = [v32 topAnchor];

  id v35 = [v31 constraintEqualToAnchor:v34];
  *(void *)(v20 + 48) = v35;
  id v36 = [v53 bottomAnchor];
  id v37 = [v0 view];
  if (!v37)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  uint64_t v38 = v37;
  id v39 = [v37 bottomAnchor];

  id v40 = [v36 constraintEqualToAnchor:v39];
  *(void *)(v20 + 56) = v40;
  id v41 = [v7 view];
  if (!v41)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  id v42 = v41;
  id v43 = [v41 widthAnchor];

  if (qword_10001A468 != -1) {
    swift_once(&qword_10001A468, sub_100008FC0);
  }
  id v44 = [v43 constraintEqualToConstant:*(double *)&qword_10001A828];

  *(void *)(v20 + 64) = v44;
  id v45 = [v4 view];
  if (!v45) {
    goto LABEL_36;
  }
  uint64_t v46 = v45;
  Swift::String v47 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  id v48 = [v46 widthAnchor];

  if (qword_10001A460 != -1) {
    swift_once(&qword_10001A460, sub_100008FAC);
  }
  id v49 = [v48 constraintEqualToConstant:*(double *)&qword_10001A820];

  *(void *)(v20 + 72) = v49;
  specialized Array._endMutation()(v50);
  sub_10000997C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v20);
  [v47 activateConstraints:isa];
}

id sub_1000098F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TwoUpColumnViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TwoUpColumnViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService25TwoUpColumnViewController);
}

unint64_t sub_10000997C()
{
  unint64_t result = qword_10001A888;
  if (!qword_10001A888)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001A888);
  }

  return result;
}

void sub_1000099B8(void *a1)
{
  objc_super v2 = v1;
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v5 = sub_100008528(&qword_10001A880);
  uint64_t v6 = swift_allocObject(v5, 64LL, 7LL);
  *(_OWORD *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_100012F50;
  id v7 = [v2 leadingAnchor];
  id v8 = [a1 leadingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];

  *(void *)(v6 + 32) = v9;
  id v10 = [v2 trailingAnchor];
  id v11 = [a1 trailingAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];

  *(void *)(v6 + 40) = v12;
  id v13 = [v2 topAnchor];
  id v14 = [a1 topAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];

  *(void *)(v6 + 48) = v15;
  id v16 = [v2 bottomAnchor];
  id v17 = [a1 bottomAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];

  *(void *)(v6 + 56) = v18;
  specialized Array._endMutation()();
  sub_10000997C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  [v4 activateConstraints:isa];
}

void sub_100009C00(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v4 = v2[1];
  if (v4)
  {
    uint64_t v5 = *v2;
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v4);
    String.hash(into:)(a1, v5, v4);
    swift_bridgeObjectRelease(v4);
    uint64_t v6 = v2[3];
    if (v6)
    {
LABEL_3:
      uint64_t v7 = v2[2];
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain(v6);
      String.hash(into:)(a1, v7, v6);
      swift_bridgeObjectRelease(v6);
      goto LABEL_6;
    }
  }

  else
  {
    Hasher._combine(_:)(0);
    uint64_t v6 = v2[3];
    if (v6) {
      goto LABEL_3;
    }
  }

  Hasher._combine(_:)(0);
LABEL_6:
  Hasher._combine(_:)(v2[4] & 1);
  uint64_t v8 = v2[5];
  if (v8)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v8);
    sub_10000C78C(a1, v8);
    swift_bridgeObjectRelease(v8);
    uint64_t v9 = v2[7];
    if (v9)
    {
LABEL_8:
      uint64_t v10 = v2[6];
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain(v9);
      String.hash(into:)(a1, v10, v9);
      swift_bridgeObjectRelease(v9);
      return;
    }
  }

  else
  {
    Hasher._combine(_:)(0);
    uint64_t v9 = v2[7];
    if (v9) {
      goto LABEL_8;
    }
  }

  Hasher._combine(_:)(0);
}

Swift::Int sub_100009D3C()
{
  return Hasher._finalize()();
}

Swift::Int sub_100009D7C(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100009DB4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  __int128 v3 = a1[3];
  v7[2] = a1[2];
  v7[3] = v3;
  __int128 v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  __int128 v5 = a2[3];
  v8[2] = a2[2];
  v8[3] = v5;
  return sub_10000C8A0((uint64_t)v7, (uint64_t)v8) & 1;
}

void sub_100009DFC()
{
  qword_10001A900 = 0x4054000000000000LL;
}

void sub_100009E0C()
{
  qword_10001A908 = 0x4046000000000000LL;
}

void sub_100009E1C()
{
  qword_10001A910 = 0x4046000000000000LL;
}

void sub_100009E2C()
{
  qword_10001A918 = 0x402C000000000000LL;
}

void sub_100009E3C()
{
  qword_10001A920 = 0x404E000000000000LL;
}

void sub_100009EA0()
{
  if (*(void *)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 8] == 1LL) {
    return;
  }
  id v5 = v0;
  v282 = &v0[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration];
  p_type = &stru_100018FF0.type;
  id v7 = [v0 view];
  if (!v7)
  {
    __break(1u);
    goto LABEL_171;
  }

  uint64_t v8 = v7;
  id v9 = [v7 subviews];

  uint64_t v10 = sub_10000CA9C(0LL, &qword_10001A968, &OBJC_CLASS___UIView_ptr);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  if ((unint64_t)v11 >> 62)
  {
    if (v11 < 0) {
      uint64_t v16 = v11;
    }
    else {
      uint64_t v16 = v11 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v11);
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter(v16);
    if (!v12) {
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v11);
    if (!v12) {
      goto LABEL_15;
    }
  }

  if (v12 < 1)
  {
    __break(1u);
    goto LABEL_90;
  }

  for (uint64_t i = 0LL; i != v12; ++i)
  {
    if ((v11 & 0xC000000000000001LL) != 0) {
      id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v11);
    }
    else {
      id v14 = *(id *)(v11 + 8 * i + 32);
    }
    id v15 = v14;
    [v14 removeFromSuperview];
  }

LABEL_15:
  swift_bridgeObjectRelease_n(v11, 2LL);
  id v17 = &stru_100018FF0.type;
  id v18 = [objc_allocWithZone(UIView) init];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v12 = (uint64_t)&_swiftEmptyArrayStorage;
  id v285 = v18;
  uint64_t v286 = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v19 = &stru_100018FF0.type;
  uint64_t v20 = *((void *)v282 + 1);
  uint64_t v1 = &stru_100018FF0.type;
  id v21 = &stru_100018FF0.type;
  id v22 = &stru_100018FF0.type;
  if (v20 == 1)
  {
LABEL_137:
    v283 = 0LL;
    goto LABEL_138;
  }

  id v281 = v5;
  uint64_t v23 = *(void *)v282;
  uint64_t v25 = *((void *)v282 + 6);
  uint64_t v24 = *((void *)v282 + 7);
  uint64_t v27 = *((void *)v282 + 4);
  uint64_t v26 = *((void *)v282 + 5);
  uint64_t v29 = *((void *)v282 + 2);
  uint64_t v28 = *((void *)v282 + 3);
  swift_bridgeObjectRetain(v20);
  sub_10000C9F4(v23, v20, v29, v28, v27, v26, v25, v24);
  sub_10000CA48(v23, v20, v29, v28, v27, v26, v25, v24);
  if (!v20)
  {
    v60 = 0LL;
    uint64_t v1 = &stru_100018FF0.type;
    goto LABEL_28;
  }

  id v30 = [objc_allocWithZone(UILabel) init];
  id v31 =  [(id)objc_opt_self(UIFont) _preferredFontForTextStyle:UIFontTextStyleTitle1 variant:1024];
  [v30 setFont:v31];

  NSString v32 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  [v30 setText:v32];

  [v30 setTextAlignment:1];
  id v33 = [(id)objc_opt_self(UIColor) labelColor];
  [v30 setTextColor:v33];

  id v34 = [v30 layer];
  [v34 setCompositingFilter:kCAFilterPlusL];

  [v30 setNumberOfLines:2];
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v285 addSubview:v30];
  id v35 = [v30 leadingAnchor];
  id v36 = [v285 leadingAnchor];
  uint64_t v1 = &stru_100018FF0.type;
  id v2 = [v35 constraintEqualToAnchor:v36];

  id v37 = [v30 trailingAnchor];
  id v38 = [v285 trailingAnchor];
  id v3 = [v37 constraintEqualToAnchor:v38];

  id v39 = [v30 centerXAnchor];
  id v40 = [v285 centerXAnchor];
  id v4 = [v39 constraintEqualToAnchor:v40];

  uint64_t v11 = (uint64_t)v30;
  id v41 = [v30 topAnchor];
  id v42 = [v285 topAnchor];
  id v5 = [v41 constraintEqualToAnchor:v42];

  if (!((unint64_t)&_swiftEmptyArrayStorage >> 62))
  {
    unint64_t v43 = (unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFF8LL;
    unint64_t v44 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v45 = v44 + 4;
    if (!__OFADD__(v44, 4LL)) {
      goto LABEL_19;
    }
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }

LABEL_90:
  if (v12 < 0) {
    uint64_t v183 = v12;
  }
  else {
    uint64_t v183 = v12 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v12);
  unint64_t v44 = _CocoaArrayWrapper.endIndex.getter(v183);
  swift_bridgeObjectRelease(v12);
  uint64_t v45 = v44 + 4;
  if (__OFADD__(v44, 4LL)) {
    goto LABEL_95;
  }
LABEL_19:
  uint64_t v46 = sub_10000C6D0(v45, 1);
  specialized Array._endMutation()(v46);
  id v2 = v2;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v44 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v43 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v44 >= v43 >> 1) {
LABEL_96:
  }
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v43 > 1, v44 + 1, 1LL);
  uint64_t v47 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v44, v2);
  specialized Array._endMutation()(v47);
  id v48 = v3;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v50 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v49 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v50 >= v49 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v49 > 1, v50 + 1, 1LL);
  }
  uint64_t v51 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v50, v48);
  specialized Array._endMutation()(v51);
  id v52 = v4;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v54 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v53 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v54 >= v53 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v53 > 1, v54 + 1, 1LL);
  }
  uint64_t v55 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v54, v52);
  specialized Array._endMutation()(v55);
  id v56 = v5;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v58 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v57 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v58 >= v57 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v57 > 1, v58 + 1, 1LL);
  }
  uint64_t v59 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v58, v56);
  specialized Array._endMutation()(v59);

  v60 = (void *)v11;
  id v17 = (char **)(&stru_100018FF0 + 16);
LABEL_28:
  uint64_t v61 = *((void *)v282 + 1);
  if (v61 != 1)
  {
    v284 = v60;
    uint64_t v62 = *(void *)v282;
    uint64_t v64 = *((void *)v282 + 6);
    uint64_t v63 = *((void *)v282 + 7);
    uint64_t v66 = *((void *)v282 + 4);
    uint64_t v65 = *((void *)v282 + 5);
    uint64_t v68 = *((void *)v282 + 2);
    uint64_t v67 = *((void *)v282 + 3);
    swift_bridgeObjectRetain(v67);
    sub_10000C9F4(v62, v61, v68, v67, v66, v65, v64, v63);
    sub_10000CA48(v62, v61, v68, v67, v66, v65, v64, v63);
    if (!v67) {
      goto LABEL_49;
    }
    id v69 = [objc_allocWithZone(UILabel) v17[287]];
    v70 = (void *)UIFontTextStyleHeadline1;
    v71 = (void *)objc_opt_self(&OBJC_CLASS___UIFont);
    id v72 = v70;
    id v73 = [v71 preferredFontForTextStyle:v72];
    [v69 setFont:v73];

    NSString v74 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v67);
    [v69 setText:v74];

    [v69 setTextAlignment:1];
    id v75 = [(id)objc_opt_self(UIColor) tertiaryLabelColor];
    [v69 setTextColor:v75];

    id v76 = [v69 layer];
    [v76 setCompositingFilter:kCAFilterPlusL];

    [v69 setNumberOfLines:0];
    [v69 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v285 addSubview:v69];
    id v77 = [v69 leadingAnchor];
    id v78 = [v285 leadingAnchor];
    id v79 = objc_msgSend(v77, v1[320], v78);

    id v80 = [v69 trailingAnchor];
    id v81 = [v285 trailingAnchor];
    id v82 = objc_msgSend(v80, v1[320], v81);

    id v83 = [v69 centerXAnchor];
    id v84 = [v285 centerXAnchor];
    id v85 = objc_msgSend(v83, v1[320], v84);

    if ((unint64_t)v286 >> 62)
    {
      if (v286 < 0) {
        uint64_t v184 = v286;
      }
      else {
        uint64_t v184 = v286 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v286);
      uint64_t v185 = _CocoaArrayWrapper.endIndex.getter(v184);
      swift_bridgeObjectRelease(v286);
      unint64_t v88 = v185 + 3;
      if (!__OFADD__(v185, 3LL))
      {
LABEL_33:
        uint64_t v89 = sub_10000C6D0(v88, 1);
        specialized Array._endMutation()(v89);
        id v79 = v79;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v88 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v86 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v88 < v86 >> 1)
        {
LABEL_34:
          uint64_t v90 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v88, v79);
          specialized Array._endMutation()(v90);
          id v91 = v82;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          unint64_t v92 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v93 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v92 >= v93 >> 1)
          {
            unint64_t v187 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v93 > 1, v92 + 1, 1LL);
            unint64_t v92 = v187;
          }

          uint64_t v94 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v92, v91);
          specialized Array._endMutation()(v94);
          id v95 = v85;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          unint64_t v96 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v97 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v96 >= v97 >> 1)
          {
            unint64_t v188 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v97 > 1, v96 + 1, 1LL);
            unint64_t v96 = v188;
          }

          uint64_t v98 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v96, v95);
          specialized Array._endMutation()(v98);

          if (v284 && (uint64_t v99 = objc_opt_self(&OBJC_CLASS___UILabel), (v100 = swift_dynamicCastObjCClass(v284, v99)) != 0))
          {
            v101 = (void *)v100;
            id v102 = v284;
            id v103 = [v69 firstBaselineAnchor];
            id v104 = [v101 lastBaselineAnchor];
            if (qword_10001A488 != -1) {
              swift_once(&qword_10001A488, sub_100009DFC);
            }
            id v105 = [v103 constraintEqualToAnchor:v104 constant:*(double *)&qword_10001A900];

            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            unint64_t v107 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
            unint64_t v106 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
            if (v107 >= v106 >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v106 > 1, v107 + 1, 1LL);
            }
            uint64_t v108 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v107, v105);
            specialized Array._endMutation()(v108);
          }

          else
          {
            id v109 = [v69 topAnchor];
            id v110 = [v285 topAnchor];
            id v111 = objc_msgSend(v109, v1[320], v110);

            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            unint64_t v113 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
            unint64_t v112 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
            if (v113 >= v112 >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v112 > 1, v113 + 1, 1LL);
            }
            uint64_t v114 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v113, v111);
            specialized Array._endMutation()(v114);

            id v102 = v284;
          }

          v284 = v69;
LABEL_49:
          id v21 = (char **)(&stru_100018FF0 + 16);
          uint64_t v19 = (char **)(&stru_100018FF0 + 16);
          uint64_t v115 = *((void *)v282 + 1);
          if (v115 == 1)
          {
            id v5 = v281;
            p_type = (char **)(&stru_100018FF0 + 16);
            id v22 = (char **)(&stru_100018FF0 + 16);
LABEL_130:
            v60 = v284;
            goto LABEL_131;
          }

          uint64_t v116 = *(void *)v282;
          uint64_t v117 = v282[32];
          uint64_t v119 = *((void *)v282 + 6);
          uint64_t v118 = *((void *)v282 + 7);
          uint64_t v120 = *((void *)v282 + 5);
          uint64_t v121 = *((void *)v282 + 2);
          uint64_t v122 = *((void *)v282 + 3);
          unint64_t v123 = ((unint64_t)*(unsigned int *)(v282 + 33) << 8) | ((unint64_t)(*(unsigned __int16 *)(v282 + 37) | (v282[39] << 16)) << 40) | v117;
          swift_bridgeObjectRetain(v118);
          swift_bridgeObjectRetain(v115);
          swift_bridgeObjectRetain(v122);
          swift_bridgeObjectRetain(v120);
          sub_10000CA48(v116, v115, v121, v122, v123, v120, v119, v118);
          if ((v117 & 1) != 0)
          {
            id v125 = [objc_allocWithZone(UIActivityIndicatorView) initWithActivityIndicatorStyle:20];
            [v125 setTranslatesAutoresizingMaskIntoConstraints:0];
            [v285 addSubview:v125];
            id v126 = [v125 centerXAnchor];
            id v127 = [v285 centerXAnchor];
            uint64_t v1 = &stru_100018FF0.type;
            id v128 = [v126 constraintEqualToAnchor:v127];

            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            unint64_t v130 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
            unint64_t v129 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
            id v22 = &stru_100018FF0.type;
            if (v130 >= v129 >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v129 > 1, v130 + 1, 1LL);
            }
            uint64_t v131 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v130, v128);
            specialized Array._endMutation()(v131);
            v132 = (char **)(&stru_100018FF0 + 16);
            if (v284)
            {
              id v133 = v284;
              id v134 = [v125 topAnchor];
              id v135 = [v133 bottomAnchor];
              if (qword_10001A490 != -1) {
                swift_once(&qword_10001A490, sub_100009E0C);
              }
              id v136 = [v134 constraintEqualToAnchor:v135 constant:*(double *)&qword_10001A908];

              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v138 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
              unint64_t v137 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
              if (v138 >= v137 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v137 > 1,  v138 + 1,  1LL);
              }
              uint64_t v139 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v138, v136);
              specialized Array._endMutation()(v139);
            }

            else
            {
              id v161 = [v125 centerYAnchor];
              id v162 = [v285 centerYAnchor];
              id v163 = [v161 constraintEqualToAnchor:v162];

              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v165 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
              unint64_t v164 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
              if (v165 >= v164 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v164 > 1,  v165 + 1,  1LL);
              }
              uint64_t v166 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v165, v163);
              specialized Array._endMutation()(v166);
            }

            [v125 startAnimating];

            uint64_t v19 = (char **)(&stru_100018FF0 + 16);
            v60 = v284;
            goto LABEL_110;
          }

          uint64_t v124 = *((void *)v282 + 1);
          if (v124 == 1)
          {
            id v5 = v281;
            p_type = (char **)(&stru_100018FF0 + 16);
            uint64_t v1 = (char **)(&stru_100018FF0 + 16);
LABEL_129:
            id v22 = (char **)(&stru_100018FF0 + 16);
            id v21 = (char **)(&stru_100018FF0 + 16);
            uint64_t v19 = (char **)(&stru_100018FF0 + 16);
            goto LABEL_130;
          }

          uint64_t v141 = *((void *)v282 + 6);
          uint64_t v140 = *((void *)v282 + 7);
          unint64_t v143 = *((void *)v282 + 4);
          uint64_t v142 = *((void *)v282 + 5);
          uint64_t v145 = *((void *)v282 + 2);
          v144 = (void *)*((void *)v282 + 3);
          uint64_t v146 = *(void *)v282;
          swift_bridgeObjectRetain(v142);
          sub_10000C9F4(v146, v124, v145, (uint64_t)v144, v143, v142, v141, v140);
          sub_10000CA48(v146, v124, v145, (uint64_t)v144, v143, v142, v141, v140);
          if (!v142)
          {
            uint64_t v1 = (char **)(&stru_100018FF0 + 16);
            id v22 = (char **)(&stru_100018FF0 + 16);
            uint64_t v19 = (char **)(&stru_100018FF0 + 16);
            v60 = v284;
            id v18 = v285;
            v132 = (char **)(&stru_100018FF0 + 16);
            goto LABEL_111;
          }

          id v22 = (char **)(&stru_100018FF0 + 16);
          v60 = v284;
          v132 = &stru_100018FF0.type;
          if ((unint64_t)v142 >> 62)
          {
            if (v142 >= 0) {
              uint64_t v189 = v142 & 0xFFFFFFFFFFFFFF8LL;
            }
            else {
              uint64_t v189 = v142;
            }
            swift_bridgeObjectRetain(v142);
            uint64_t v190 = v189;
            v60 = v284;
            uint64_t v147 = _CocoaArrayWrapper.endIndex.getter(v190);
            swift_bridgeObjectRelease(v142);
            uint64_t v1 = &stru_100018FF0.type;
            if (v147)
            {
LABEL_65:
              id v148 = [objc_allocWithZone(UIStackView) init];
              [v148 setAxis:1];
              if (qword_10001A4A0 != -1) {
                swift_once(&qword_10001A4A0, sub_100009E2C);
              }
              [v148 setSpacing:*(double *)&qword_10001A918];
              [v148 setTranslatesAutoresizingMaskIntoConstraints:0];
              [v148 setDistribution:3];
              sub_10000CA9C(0LL, (unint64_t *)&unk_10001A970, &OBJC_CLASS___UIButton_ptr);
              uint64_t v149 = objc_opt_self(&OBJC_CLASS___UIColor);
              if (v147 < 1)
              {
                __break(1u);
              }

              else
              {
                v151 = (void *)v149;
                uint64_t v152 = 0LL;
                uint64_t v153 = v142;
                unint64_t v154 = v142 & 0xC000000000000001LL;
                uint64_t v155 = v147;
                do
                {
                  if (v154) {
                    id v156 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v152, v153);
                  }
                  else {
                    id v156 = *(id *)(v153 + 8 * v152 + 32);
                  }
                  id v157 = v156;
                  ++v152;
                  id v158 = v156;
                  v159 = (void *)UIButton.init(type:primaryAction:)(1LL, v157);
                  id v160 = [v151 clearColor];
                  [v159 _setVisualEffectViewEnabled:0 backgroundColor:v160];

                  [v159 setTranslatesAutoresizingMaskIntoConstraints:0];
                  [v148 addArrangedSubview:v159];
                }

                while (v155 != v152);
                uint64_t v141 = 0x100019000LL;
                swift_bridgeObjectRelease(v153);
                v144 = v148;
                [v285 addSubview:v148];
                id v167 = [v148 centerXAnchor];
                id v168 = [v285 centerXAnchor];
                uint64_t v142 = (uint64_t)[v167 constraintEqualToAnchor:v168];

                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v143 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
                unint64_t v150 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
                if (v143 < v150 >> 1) {
                  goto LABEL_78;
                }
              }

              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v150 > 1, v143 + 1, 1LL);
LABEL_78:
              uint64_t v169 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v143, v142);
              specialized Array._endMutation()(v169);
              id v22 = (char **)(&stru_100018FF0 + 16);
              v132 = (char **)v141;
              if (v284)
              {
                id v170 = v284;
                id v171 = [v144 topAnchor];
                id v172 = [v170 bottomAnchor];
                if (qword_10001A498 != -1) {
                  swift_once(&qword_10001A498, sub_100009E1C);
                }
                id v173 = [v171 constraintEqualToAnchor:v172 constant:*(double *)&qword_10001A910];

                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v175 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
                unint64_t v174 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
                if (v175 >= v174 >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v174 > 1,  v175 + 1,  1LL);
                }
                uint64_t v176 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v175, v173);
                specialized Array._endMutation()(v176);
              }

              else
              {
                id v177 = [v144 topAnchor];
                id v178 = [v285 topAnchor];
                id v179 = [v177 constraintEqualToAnchor:v178];

                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v181 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
                unint64_t v180 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
                if (v181 >= v180 >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v180 > 1,  v181 + 1,  1LL);
                }
                uint64_t v182 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v181, v179);
                specialized Array._endMutation()(v182);
              }

              v60 = v144;
              uint64_t v1 = (char **)(&stru_100018FF0 + 16);
              goto LABEL_109;
            }
          }

          else
          {
            uint64_t v147 = *(void *)((v142 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
            uint64_t v1 = (char **)(&stru_100018FF0 + 16);
            if (v147) {
              goto LABEL_65;
            }
          }

          swift_bridgeObjectRelease(v142);
LABEL_109:
          uint64_t v19 = (char **)(&stru_100018FF0 + 16);
LABEL_110:
          id v18 = v285;
LABEL_111:
          uint64_t v191 = *((void *)v282 + 1);
          if (v191 == 1)
          {
            id v5 = v281;
            p_type = (char **)(&stru_100018FF0 + 16);
            id v21 = (char **)(&stru_100018FF0 + 16);
            goto LABEL_132;
          }

          v284 = v60;
          uint64_t v193 = *((void *)v282 + 6);
          uint64_t v192 = *((void *)v282 + 7);
          uint64_t v195 = *((void *)v282 + 4);
          uint64_t v194 = *((void *)v282 + 5);
          uint64_t v197 = *((void *)v282 + 2);
          uint64_t v196 = *((void *)v282 + 3);
          uint64_t v198 = *(void *)v282;
          swift_bridgeObjectRetain(v192);
          sub_10000C9F4(v198, v191, v197, v196, v195, v194, v193, v192);
          sub_10000CA48(v198, v191, v197, v196, v195, v194, v193, v192);
          if (!v192)
          {
            id v5 = v281;
            p_type = (char **)(&stru_100018FF0 + 16);
            goto LABEL_129;
          }

          id v199 = [objc_allocWithZone(UILabel) v132[287]];
          id v200 =  [(id)objc_opt_self(UIFont) preferredFontForTextStyle:UIFontTextStyleCaption2];
          [v199 setFont:v200];

          NSString v201 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v192);
          [v199 setText:v201];

          [v199 setTextAlignment:1];
          id v202 = [(id)objc_opt_self(UIColor) tertiaryLabelColor];
          [v199 setTextColor:v202];

          id v203 = [v199 layer];
          [v203 setCompositingFilter:kCAFilterPlusL];

          [v199 setNumberOfLines:2];
          [v199 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v285 addSubview:v199];
          id v204 = [v199 leadingAnchor];
          id v205 = [v285 leadingAnchor];
          id v206 = objc_msgSend(v204, v1[320], v205);

          id v207 = [v199 trailingAnchor];
          id v208 = [v285 trailingAnchor];
          id v209 = objc_msgSend(v207, v1[320], v208);

          id v210 = [v199 centerXAnchor];
          id v211 = [v285 centerXAnchor];
          id v212 = objc_msgSend(v210, v1[320], v211);

          if ((unint64_t)v286 >> 62)
          {
            if (v286 < 0) {
              uint64_t v280 = v286;
            }
            else {
              uint64_t v280 = v286 & 0xFFFFFFFFFFFFFF8LL;
            }
            swift_bridgeObjectRetain(v286);
            unint64_t v214 = _CocoaArrayWrapper.endIndex.getter(v280);
            swift_bridgeObjectRelease(v286);
          }

          else
          {
            unint64_t v213 = v286 & 0xFFFFFFFFFFFFF8LL;
            unint64_t v214 = *(void *)((v286 & 0xFFFFFFFFFFFFF8LL) + 0x10);
          }

          id v22 = (char **)(&stru_100018FF0 + 16);
          if (__OFADD__(v214, 3LL))
          {
            __break(1u);
          }

          else
          {
            uint64_t v215 = sub_10000C6D0(v214 + 3, 1);
            specialized Array._endMutation()(v215);
            id v206 = v206;
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            unint64_t v214 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
            unint64_t v213 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
            if (v214 < v213 >> 1)
            {
LABEL_118:
              uint64_t v216 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v214, v206);
              specialized Array._endMutation()(v216);
              id v217 = v209;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v219 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
              unint64_t v218 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
              if (v219 >= v218 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v218 > 1,  v219 + 1,  1LL);
              }
              uint64_t v220 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v219, v217);
              specialized Array._endMutation()(v220);
              id v221 = v212;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v223 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
              unint64_t v222 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
              if (v223 >= v222 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v222 > 1,  v223 + 1,  1LL);
              }
              uint64_t v224 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v223, v221);
              specialized Array._endMutation()(v224);

              if (v284)
              {
                id v225 = v284;
                id v226 = [v199 firstBaselineAnchor];
                id v227 = [v225 bottomAnchor];
                id v5 = v281;
                p_type = (char **)(&stru_100018FF0 + 16);
                if (qword_10001A4A8 != -1) {
                  swift_once(&qword_10001A4A8, sub_100009E3C);
                }
                id v228 = [v226 constraintEqualToAnchor:v227 constant:*(double *)&qword_10001A920];

                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v230 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
                unint64_t v229 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
                if (v230 >= v229 >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v229 > 1,  v230 + 1,  1LL);
                }
                uint64_t v231 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v230, v228);
                specialized Array._endMutation()(v231);
              }

              else
              {
                id v273 = [v199 topAnchor];
                id v274 = [v285 topAnchor];
                id v275 = objc_msgSend(v273, v1[320], v274);

                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v277 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
                unint64_t v276 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
                id v5 = v281;
                p_type = (char **)(&stru_100018FF0 + 16);
                if (v277 >= v276 >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v276 > 1,  v277 + 1,  1LL);
                }
                uint64_t v278 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v277, v275);
                specialized Array._endMutation()(v278);
              }

              v283 = v199;
              uint64_t v1 = (char **)(&stru_100018FF0 + 16);
              id v18 = v285;
              goto LABEL_134;
            }
          }

          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v213 > 1, v214 + 1, 1LL);
          goto LABEL_118;
        }

LABEL_103:
        unint64_t v186 = v88;
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v86 > 1, v88 + 1, 1LL);
        unint64_t v88 = v186;
        goto LABEL_34;
      }
    }

    else
    {
      unint64_t v86 = v286 & 0xFFFFFFFFFFFFF8LL;
      uint64_t v87 = *(void *)((v286 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      unint64_t v88 = v87 + 3;
      if (!__OFADD__(v87, 3LL)) {
        goto LABEL_33;
      }
    }

    __break(1u);
    goto LABEL_103;
  }

  id v5 = v281;
  p_type = (char **)(&stru_100018FF0 + 16);
  id v22 = (char **)(&stru_100018FF0 + 16);
  id v21 = (char **)(&stru_100018FF0 + 16);
  uint64_t v19 = (char **)(&stru_100018FF0 + 16);
LABEL_131:
  id v18 = v285;
LABEL_132:
  if (!v60) {
    goto LABEL_137;
  }
  v283 = v60;
  id v199 = v60;
LABEL_134:
  id v232 = v199;
  id v233 = [v232 bottomAnchor];
  id v234 = [v18 bottomAnchor];
  id v235 = objc_msgSend(v233, v1[320], v234);

  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v237 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v236 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v237 >= v236 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v236 > 1, v237 + 1, 1LL);
  }
  uint64_t v238 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v237, v235);
  specialized Array._endMutation()(v238);

  id v21 = (char **)(&stru_100018FF0 + 16);
  uint64_t v19 = (char **)(&stru_100018FF0 + 16);
  id v18 = v285;
LABEL_138:
  id v239 = objc_msgSend(v5, p_type[262]);
  if (!v239)
  {
LABEL_171:

    __break(1u);
    goto LABEL_172;
  }

  v240 = v239;
  [v239 addSubview:v18];

  id v241 = [v18 v19[316]];
  id v242 = objc_msgSend(v5, p_type[262]);
  if (!v242)
  {
LABEL_172:

    __break(1u);
    goto LABEL_173;
  }

  v243 = v242;
  id v244 = [v242 v19[316]];

  id v245 = objc_msgSend(v241, v1[320], v244);
  id v246 = [v18 v21[318]];
  id v247 = objc_msgSend(v5, p_type[262]);
  if (!v247)
  {
LABEL_173:

    __break(1u);
    goto LABEL_174;
  }

  v248 = v1;
  v249 = v18;
  v250 = v247;
  id v251 = [v247 v21[318]];

  id v252 = objc_msgSend(v246, v248[320], v251);
  id v253 = [v249 v22[327]];
  id v254 = objc_msgSend(v5, p_type[262]);
  if (!v254)
  {
LABEL_174:

    __break(1u);
    return;
  }

  v255 = v254;
  id v256 = [v254 v22[327]];

  id v257 = objc_msgSend(v253, v248[320], v256);
  if (!((unint64_t)v286 >> 62))
  {
    unint64_t v258 = v286 & 0xFFFFFFFFFFFFF8LL;
    unint64_t v259 = *(void *)((v286 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v260 = v259 + 3;
    if (!__OFADD__(v259, 3LL)) {
      goto LABEL_144;
    }
LABEL_160:
    __break(1u);
    goto LABEL_161;
  }

  if (v286 < 0) {
    uint64_t v279 = v286;
  }
  else {
    uint64_t v279 = v286 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v286);
  unint64_t v259 = _CocoaArrayWrapper.endIndex.getter(v279);
  swift_bridgeObjectRelease(v286);
  uint64_t v260 = v259 + 3;
  if (__OFADD__(v259, 3LL)) {
    goto LABEL_160;
  }
LABEL_144:
  uint64_t v261 = sub_10000C6D0(v260, 1);
  specialized Array._endMutation()(v261);
  id v245 = v245;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v259 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v258 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v259 >= v258 >> 1) {
LABEL_161:
  }
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v258 > 1, v259 + 1, 1LL);
  uint64_t v262 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v259, v245);
  specialized Array._endMutation()(v262);
  id v263 = v252;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v265 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v264 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v265 >= v264 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v264 > 1, v265 + 1, 1LL);
  }
  uint64_t v266 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v265, v263);
  specialized Array._endMutation()(v266);
  id v267 = v257;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v269 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v268 = *(void *)((v286 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v269 >= v268 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v268 > 1, v269 + 1, 1LL);
  }
  uint64_t v270 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v269, v267);
  specialized Array._endMutation()(v270);

  v271 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  sub_10000CA9C(0LL, (unint64_t *)&qword_10001A888, &OBJC_CLASS___NSLayoutConstraint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v286);
  [v271 activateConstraints:isa];
}

id sub_10000C054()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnboardingContentViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OnboardingContentViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService31OnboardingContentViewController);
}

uint64_t initializeBufferWithCopyOfBuffer for OnboardingContentViewControllerConfiguration( uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for OnboardingContentViewControllerConfiguration(void *a1)
{
  return swift_bridgeObjectRelease(a1[7]);
}

uint64_t initializeWithCopy for OnboardingContentViewControllerConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v5;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t assignWithCopy for OnboardingContentViewControllerConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v8);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for OnboardingContentViewControllerConfiguration(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return result;
}

uint64_t assignWithTake for OnboardingContentViewControllerConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnboardingContentViewControllerConfiguration( uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OnboardingContentViewControllerConfiguration( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 64) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for OnboardingContentViewControllerConfiguration()
{
  return &type metadata for OnboardingContentViewControllerConfiguration;
}

unint64_t sub_10000C398()
{
  unint64_t result = qword_10001A958;
  if (!qword_10001A958)
  {
    unint64_t result = swift_getWitnessTable(&unk_100012FC0, &type metadata for OnboardingContentViewControllerConfiguration);
    atomic_store(result, (unint64_t *)&qword_10001A958);
  }

  return result;
}

id sub_10000C3DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  unint64_t v4 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    unint64_t v6 = a2 >> 62;
    if (!(a2 >> 62)) {
      goto LABEL_3;
    }
LABEL_50:
    if (v2 < 0) {
      uint64_t v31 = v2;
    }
    else {
      uint64_t v31 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v2);
    uint64_t v32 = _CocoaArrayWrapper.endIndex.getter(v31);
    swift_bridgeObjectRelease(v2);
    if (v5 == v32) {
      goto LABEL_4;
    }
LABEL_54:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }

  if (a1 < 0) {
    uint64_t v30 = a1;
  }
  else {
    uint64_t v30 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  unint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v30);
  swift_bridgeObjectRelease(v3);
  unint64_t v6 = (unint64_t)v2 >> 62;
LABEL_3:
  if (v5 != *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
    goto LABEL_54;
  }
LABEL_4:
  if (!v5) {
    goto LABEL_37;
  }
  uint64_t v7 = v3 & 0xFFFFFFFFFFFFFF8LL;
  if (v3 < 0) {
    uint64_t v7 = v3;
  }
  if (!v4) {
    uint64_t v7 = (v3 & 0xFFFFFFFFFFFFFF8LL) + 32;
  }
  uint64_t v8 = v2 & 0xFFFFFFFFFFFFFF8LL;
  uint64_t v9 = (v2 & 0xFFFFFFFFFFFFFF8LL) + 32;
  if (v2 < 0) {
    uint64_t v10 = v2;
  }
  else {
    uint64_t v10 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  if (v6) {
    uint64_t v9 = v10;
  }
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }

  if ((v5 & 0x8000000000000000LL) != 0) {
    goto LABEL_60;
  }
  unint64_t v33 = v3 & 0xC000000000000001LL;
  if ((v3 & 0xC000000000000001LL) != 0) {
    goto LABEL_61;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v3))
  {
    uint64_t v12 = result;
    if ((v2 & 0xC000000000000001LL) == 0) {
      break;
    }
    id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v2);
LABEL_21:
    id v14 = v13;
    sub_10000CA9C(0LL, (unint64_t *)&qword_10001A960, &OBJC_CLASS___UIAction_ptr);
    char v15 = static NSObject.== infix(_:_:)(v12, v14);

    if ((v15 & 1) == 0) {
      goto LABEL_54;
    }
    unint64_t v16 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((v2 | v3) & 0xC000000000000001LL) != 0)
    {
      uint64_t v17 = 0LL;
      unint64_t v18 = v5 - 2;
      while (v16 != v17)
      {
        unint64_t v5 = v17 + 1;
        if (v33) {
          id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17 + 1, v3);
        }
        else {
          id v19 = *(id *)(v3 + 40 + 8 * v17);
        }
        uint64_t v20 = v19;
        if ((v2 & 0xC000000000000001LL) != 0)
        {
          id v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17 + 1, v2);
        }

        else
        {
          if (v5 >= *(void *)(v8 + 16)) {
            goto LABEL_59;
          }
          id v21 = *(id *)(v2 + 40 + 8 * v17);
        }

        id v22 = v21;
        unint64_t v5 = static NSObject.== infix(_:_:)(v20, v21);

        if ((v5 & 1) != 0 && v18 != v17++) {
          continue;
        }
        return (id)(v5 & 1);
      }

      __break(1u);
    }

    else
    {
      unint64_t v24 = *(void *)(v8 + 16);
      if (v24 <= 1) {
        unint64_t v24 = 1LL;
      }
      unint64_t v25 = v24 - 1;
      uint64_t v26 = (void **)(v3 + 40);
      uint64_t v8 = v2 + 40;
      while (v16)
      {
        if (!v25) {
          goto LABEL_58;
        }
        uint64_t v28 = *v26++;
        uint64_t v27 = v28;
        uint64_t v29 = *(void **)v8;
        v8 += 8LL;
        uint64_t v2 = v27;
        uint64_t v3 = v29;
        unint64_t v5 = static NSObject.== infix(_:_:)(v2, v3);

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16) {
            continue;
          }
        }

        return (id)(v5 & 1);
      }
    }

    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    ;
  }

  if (*(void *)(v8 + 16))
  {
    id v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }

  __break(1u);
  return result;
}

uint64_t sub_10000C6D0(uint64_t a1, char a2)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  *uint64_t v2 = v5;
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
  *uint64_t v2 = result;
  return result;
}

void sub_10000C78C(uint64_t a1, uint64_t a2)
{
  if (!((unint64_t)a2 >> 62))
  {
    Hasher._combine(_:)(*(void *)((a2 & 0xFFFFFFFFFFFFFF8LL) + 0x10));
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    if (!v4) {
      return;
    }
    goto LABEL_3;
  }

  if (a2 < 0) {
    uint64_t v10 = a2;
  }
  else {
    uint64_t v10 = a2 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a2);
  Swift::UInt v11 = _CocoaArrayWrapper.endIndex.getter(v10);
  swift_bridgeObjectRelease(a2);
  Hasher._combine(_:)(v11);
  swift_bridgeObjectRetain(a2);
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v10);
  swift_bridgeObjectRelease(a2);
  if (v4)
  {
LABEL_3:
    if (v4 < 1)
    {
      __break(1u);
    }

    else if ((a2 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a2);
        NSObject.hash(into:)(a1);
        swift_unknownObjectRelease(v6);
      }
    }

    else
    {
      uint64_t v7 = (void **)(a2 + 32);
      do
      {
        uint64_t v8 = *v7++;
        id v9 = v8;
        NSObject.hash(into:)(a1);

        --v4;
      }

      while (v4);
    }
  }

uint64_t sub_10000C8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (!v4)
  {
    if (v5) {
      return 0LL;
    }
    goto LABEL_10;
  }

  if (!v5) {
    return 0LL;
  }
  BOOL v6 = *(void *)a1 == *(void *)a2 && v4 == v5;
  if (v6 || (v7 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0LL, (v7 & 1) != 0))
  {
LABEL_10:
    uint64_t v9 = *(void *)(a1 + 24);
    uint64_t v10 = *(void *)(a2 + 24);
    if (v9)
    {
      if (!v10) {
        return 0LL;
      }
      if (*(void *)(a1 + 16) != *(void *)(a2 + 16) || v9 != v10)
      {
        char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = 0LL;
        if ((v11 & 1) == 0) {
          return result;
        }
      }
    }

    else if (v10)
    {
      return 0LL;
    }

    if (((*(unsigned __int8 *)(a1 + 32) ^ *(unsigned __int8 *)(a2 + 32)) & 1) == 0)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      unint64_t v13 = *(void *)(a2 + 40);
      if (v12)
      {
        if (!v13) {
          return 0LL;
        }
        swift_bridgeObjectRetain(*(void *)(a2 + 40));
        uint64_t v14 = swift_bridgeObjectRetain(v12);
        unsigned __int8 v15 = sub_10000C3DC(v14, v13);
        swift_bridgeObjectRelease(v12);
        swift_bridgeObjectRelease(v13);
        if ((v15 & 1) == 0) {
          return 0LL;
        }
      }

      else if (v13)
      {
        return 0LL;
      }

      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(a2 + 56);
      if (v16)
      {
        if (!v17
          || (*(void *)(a1 + 48) != *(void *)(a2 + 48) || v16 != v17)
          && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          return 0LL;
        }
      }

      else if (v17)
      {
        return 0LL;
      }

      return 1LL;
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_10000C9F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain(a8);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a6);
  }

  return result;
}

uint64_t sub_10000CA48( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
    return swift_bridgeObjectRelease(a8);
  }

  return result;
}

uint64_t sub_10000CA9C(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_10000CAD4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100004CC4(v0, qword_10001A980);
  uint64_t v1 = sub_100004CAC(v0, (uint64_t)qword_10001A980);
  if (qword_10001A448 != -1) {
    swift_once(&qword_10001A448, sub_100005070);
  }
  uint64_t v2 = sub_100004CAC(v0, (uint64_t)qword_10001AB68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

char *sub_10000CB64(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_progressDelegate];
  *((void *)v3 + 1) = 0LL;
  swift_unknownObjectWeakInit(v3, 0LL);
  id v4 = objc_allocWithZone(&OBJC_CLASS___UINavigationController);
  uint64_t v5 = v1;
  id v6 = [v4 initWithRootViewController:a1];
  *(void *)&v5[OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_mainNavigationController] = v6;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for TVSetupContainerViewController();
  char v7 = (char *)objc_msgSendSuper2(&v11, "initWithNibName:bundle:", 0, 0);
  [v7 setModalPresentationStyle:8];
  [v7 setOverrideUserInterfaceStyle:2];
  uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_mainNavigationController];
  [v8 setDelegate:v7];
  id v9 = v8;
  [v9 setNavigationBarHidden:1];

  return v7;
}

void sub_10000CCF8()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for TVSetupContainerViewController();
  objc_msgSendSuper2(&v16, "viewDidLoad");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_mainNavigationController];
  [v0 addChildViewController:v1];
  id v2 = [v1 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_6;
  }

  uint64_t v3 = v2;
  id v4 = [v0 view];
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v5 = v4;
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
  id v14 = [v0 view];
  if (v14)
  {
    unsigned __int8 v15 = v14;
    [v14 addSubview:v3];

    [v1 didMoveToParentViewController:v0];
    return;
  }

void sub_10000CE9C(void *a1, uint64_t a2, uint64_t a3, const char **a4, const char *a5)
{
  v19.receiver = a1;
  v19.super_class = (Class)type metadata accessor for TVSetupContainerViewController();
  double v8 = *a4;
  double v9 = (char *)v19.receiver;
  objc_msgSendSuper2(&v19, v8, a3);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong( &v9[OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_progressDelegate],  v10);
  if (Strong)
  {
    uint64_t v12 = Strong;
    if (qword_10001A450 != -1) {
      swift_once(&qword_10001A450, sub_10000513C);
    }
    uint64_t v13 = type metadata accessor for Logger(0LL);
    uint64_t v14 = sub_100004CAC(v13, (uint64_t)qword_10001A660);
    unsigned __int8 v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v17 = static os_log_type_t.info.getter(v15, v16);
    if (os_log_type_enabled(v15, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v17, a5, v18, 2u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    swift_unknownObjectRelease(v12);
  }

  else
  {
    unsigned __int8 v15 = (os_log_s *)v9;
  }
}

id sub_10000D004()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupContainerViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TVSetupContainerViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService30TVSetupContainerViewController);
}

void sub_10000D0E8(void *a1)
{
  if (qword_10001A4B0 != -1) {
    swift_once(&qword_10001A4B0, sub_10000CAD4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100004CAC(v2, (uint64_t)qword_10001A980);
  id v10 = a1;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v5 = static os_log_type_t.info.getter(v3, v4);
  if (os_log_type_enabled(v3, v5))
  {
    double v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    double v7 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)double v6 = 138412290;
    id v11 = v10;
    id v8 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    void *v7 = v10;

    _os_log_impl((void *)&_mh_execute_header, v3, v5, "navigationController didShow: %@", v6, 0xCu);
    uint64_t v9 = sub_100008528((uint64_t *)&unk_10001AA30);
    swift_arrayDestroy(v7, 1LL, v9);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {
  }

uint64_t sub_10000D298(uint64_t a1)
{
  return a1;
}

char *sub_10000D2BC()
{
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for ActivityViewController();
  uint64_t v1 = (char *)objc_msgSendSuper2(&v23, "initWithNibName:bundle:", 0, 0);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = (id)SFLocalizableWAPIStringKeyForKey();

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);
  double v7 = v6;

  id v8 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
  v24._object = (void *)0xE000000000000000LL;
  v9._countAndFlagsBits = v5;
  v9._object = v7;
  v10.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v10.value._object = (void *)0xEB00000000656C62LL;
  v11._countAndFlagsBits = 0LL;
  v11._object = (void *)0xE000000000000000LL;
  v24._countAndFlagsBits = 0LL;
  Swift::String v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, v8, v11, v24);
  swift_bridgeObjectRelease(v7);

  uint64_t v13 = (Swift::String *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration];
  uint64_t v14 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration];
  uint64_t v15 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 8];
  uint64_t v16 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 16];
  uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 24];
  uint64_t v18 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 32];
  uint64_t v19 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 40];
  uint64_t v20 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 48];
  uint64_t v21 = *(void *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 56];
  Swift::String *v13 = v12;
  v13[1]._countAndFlagsBits = 0LL;
  v13[1]._object = 0LL;
  v13[2]._countAndFlagsBits = 1LL;
  v13[2]._object = 0LL;
  v13[3]._countAndFlagsBits = 0LL;
  v13[3]._object = 0LL;
  sub_10000CA48(v14, v15, v16, v17, v18, v19, v20, v21);

  return v1;
}

id sub_10000D4D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivityViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService22ActivityViewController);
}

uint64_t sub_10000D524()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100004CC4(v0, qword_10001AA68);
  uint64_t v1 = sub_100004CAC(v0, (uint64_t)qword_10001AA68);
  if (qword_10001A448 != -1) {
    swift_once(&qword_10001A448, sub_100005070);
  }
  uint64_t v2 = sub_100004CAC(v0, (uint64_t)qword_10001AB68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

id sub_10000D5B4()
{
  uint64_t v1 = type metadata accessor for OnboardingContentViewController();
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  id v3 = v0;
  id v109 = (char *)[v2 init];
  id v4 = [objc_allocWithZone(UINavigationController) initWithRootViewController:v109];
  uint64_t v5 = OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_introNavigationController;
  *(void *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_introNavigationController] = v4;
  id v6 = v4;
  [v6 setNavigationBarHidden:1];

  uint64_t v7 = type metadata accessor for OnboardingImageViewController();
  id v8 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7)) init];
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [(id)objc_opt_self(UIImage) imageNamed:v9];

  if (v10)
  {
    id v11 = [v10 imageWithRenderingMode:2];
  }

  else
  {
    id v11 = 0LL;
  }

  uint64_t v12 = OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_image;
  uint64_t v13 = *(void **)&v8[OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_image];
  *(void *)&v8[OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_image] = v11;
  id v14 = v11;

  if ([v8 isViewLoaded])
  {
    uint64_t v15 = *(void **)&v8[OBJC_IVAR____TtC22HomeCaptiveViewService29OnboardingImageViewController_imageView];
    if (v15) {
      [v15 setImage:*(void *)&v8[v12]];
    }
  }

  uint64_t v16 = *(void **)&v3[v5];
  *(void *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_accessoryViewController] = v8;
  *(void *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_dialogueViewController] = v16;
  v110.receiver = v3;
  v110.super_class = (Class)type metadata accessor for TwoUpColumnViewController();
  uint64_t v108 = v8;
  id v17 = v16;
  id v18 = objc_msgSendSuper2(&v110, "initWithNibName:bundle:", 0, 0);
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = (id)SFLocalizableWAPIStringKeyForKey();

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);
  Swift::String v24 = v23;

  unint64_t v25 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
  uint64_t v26 = (NSBundle *)[v25 mainBundle];
  v111._object = (void *)0xE000000000000000LL;
  v27._countAndFlagsBits = v22;
  v27._object = v24;
  v28.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v28.value._object = (void *)0xEB00000000656C62LL;
  v29._countAndFlagsBits = 0LL;
  v29._object = (void *)0xE000000000000000LL;
  v111._countAndFlagsBits = 0LL;
  Swift::String v30 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, v28, v26, v29, v111);
  swift_bridgeObjectRelease(v24);

  NSString v31 = String._bridgeToObjectiveC()();
  id v32 = (id)SFLocalizableWAPIStringKeyForKey();

  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32, v33);
  id v36 = v35;

  uint64_t v105 = sub_100008528(&qword_10001A748);
  uint64_t v37 = swift_allocObject(v105, 72LL, 7LL);
  *(_OWORD *)(v37 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_100012EE0;
  id v38 = [objc_allocWithZone(CWFInterface) init];
  [v38 activate];
  id v39 = [v38 networkName];
  if (v39)
  {
    id v41 = v39;
    uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39, v40);
    unint64_t v44 = v43;
  }

  else
  {
    uint64_t v42 = 0LL;
    unint64_t v44 = 0LL;
  }

  [v38 invalidate];

  *(void *)(v37 + 56) = &type metadata for String;
  unint64_t v104 = sub_1000089AC();
  *(void *)(v37 + 64) = v104;
  if (v44) {
    uint64_t v45 = v42;
  }
  else {
    uint64_t v45 = 0LL;
  }
  if (v44) {
    unint64_t v46 = v44;
  }
  else {
    unint64_t v46 = 0xE000000000000000LL;
  }
  *(void *)(v37 + 32) = v45;
  *(void *)(v37 + 40) = v46;
  uint64_t v47 = (NSBundle *)[v25 mainBundle];
  v112._object = (void *)0xE000000000000000LL;
  v48._countAndFlagsBits = v34;
  v48._object = v36;
  v49.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v49.value._object = (void *)0xEB00000000656C62LL;
  v50._countAndFlagsBits = 0LL;
  v50._object = (void *)0xE000000000000000LL;
  v112._countAndFlagsBits = 0LL;
  Swift::String v51 = NSLocalizedString(_:tableName:bundle:value:comment:)(v48, v49, v47, v50, v112);

  uint64_t v52 = String.init(format:arguments:)(v51._countAndFlagsBits, v51._object, v37);
  unint64_t v106 = v53;
  uint64_t v107 = v52;
  swift_bridgeObjectRelease(v36);
  swift_bridgeObjectRelease(v37);
  swift_bridgeObjectRelease(v51._object);
  uint64_t v54 = sub_100008528(&qword_10001A880);
  uint64_t v55 = swift_allocObject(v54, 56LL, 7LL);
  *(_OWORD *)(v55 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_100013090;
  sub_10000E9F0();
  id v56 = (NSBundle *)[v25 mainBundle];
  v113._object = (void *)0xE000000000000000LL;
  v57._object = (void *)0x8000000100012C30LL;
  v57._countAndFlagsBits = 0xD000000000000013LL;
  v58.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v58.value._object = (void *)0xEB00000000656C62LL;
  v59._countAndFlagsBits = 0LL;
  v59._object = (void *)0xE000000000000000LL;
  v113._countAndFlagsBits = 0LL;
  Swift::String v60 = NSLocalizedString(_:tableName:bundle:value:comment:)(v57, v58, v56, v59, v113);

  uint64_t v61 = swift_allocObject(&unk_100014970, 24LL, 7LL);
  swift_unknownObjectWeakInit(v61 + 16, v18);
  *(void *)(v55 + 32) = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)( v60._countAndFlagsBits,  v60._object,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  sub_10000EA50,  v61);
  uint64_t v62 = (NSBundle *)[v25 mainBundle];
  v114._object = (void *)0xE000000000000000LL;
  v63._object = (void *)0x8000000100012C50LL;
  v63._countAndFlagsBits = 0xD000000000000013LL;
  v64.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v64.value._object = (void *)0xEB00000000656C62LL;
  v65._countAndFlagsBits = 0LL;
  v65._object = (void *)0xE000000000000000LL;
  v114._countAndFlagsBits = 0LL;
  Swift::String v66 = NSLocalizedString(_:tableName:bundle:value:comment:)(v63, v64, v62, v65, v114);

  uint64_t v67 = swift_allocObject(&unk_100014970, 24LL, 7LL);
  swift_unknownObjectWeakInit(v67 + 16, v18);
  *(void *)(v55 + 40) = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)( v66._countAndFlagsBits,  v66._object,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  sub_10000EA58,  v67);
  uint64_t v68 = (NSBundle *)[v25 mainBundle];
  v115._object = (void *)0xE000000000000000LL;
  v69._object = (void *)0x8000000100012C70LL;
  v69._countAndFlagsBits = 0xD000000000000013LL;
  v70.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v70.value._object = (void *)0xEB00000000656C62LL;
  v71._countAndFlagsBits = 0LL;
  v71._object = (void *)0xE000000000000000LL;
  v115._countAndFlagsBits = 0LL;
  Swift::String v72 = NSLocalizedString(_:tableName:bundle:value:comment:)(v69, v70, v68, v71, v115);

  uint64_t v73 = swift_allocObject(&unk_100014970, 24LL, 7LL);
  swift_unknownObjectWeakInit(v73 + 16, v18);
  uint64_t v74 = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)( v72._countAndFlagsBits,  v72._object,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  sub_10000EA60,  v73);
  *(void *)(v55 + 48) = v74;
  specialized Array._endMutation()(v74);
  id v75 = (void *)v55;
  uint64_t v76 = swift_allocObject(v105, 72LL, 7LL);
  *(_OWORD *)(v76 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_100012EE0;
  id v77 = [objc_allocWithZone(CWFInterface) init];
  [v77 activate];
  id v78 = [v77 MACAddress];
  if (v78)
  {
    id v80 = v78;
    uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)(v78, v79);
    unint64_t v83 = v82;
  }

  else
  {
    uint64_t v81 = 0LL;
    unint64_t v83 = 0LL;
  }

  [v77 invalidate];

  *(void *)(v76 + 56) = &type metadata for String;
  *(void *)(v76 + 64) = v104;
  if (v83) {
    uint64_t v84 = v81;
  }
  else {
    uint64_t v84 = 0LL;
  }
  if (v83) {
    unint64_t v85 = v83;
  }
  else {
    unint64_t v85 = 0xE000000000000000LL;
  }
  *(void *)(v76 + 32) = v84;
  *(void *)(v76 + 40) = v85;
  unint64_t v86 = (NSBundle *)[v25 mainBundle];
  v87._countAndFlagsBits = 0xD000000000000011LL;
  v116._object = (void *)0xE000000000000000LL;
  v87._object = (void *)0x8000000100012C90LL;
  v88.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v88.value._object = (void *)0xEB00000000656C62LL;
  v89._countAndFlagsBits = 0LL;
  v89._object = (void *)0xE000000000000000LL;
  v116._countAndFlagsBits = 0LL;
  Swift::String v90 = NSLocalizedString(_:tableName:bundle:value:comment:)(v87, v88, v86, v89, v116);

  uint64_t v91 = String.init(format:arguments:)(v90._countAndFlagsBits, v90._object, v76);
  unint64_t v93 = v92;
  swift_bridgeObjectRelease(v76);
  swift_bridgeObjectRelease(v90._object);
  uint64_t v94 = (Swift::String *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration];
  uint64_t v95 = *(void *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration];
  uint64_t v96 = *(void *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 8];
  uint64_t v97 = *(void *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 16];
  uint64_t v98 = *(void *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 24];
  uint64_t v99 = *(void *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 32];
  uint64_t v100 = *(void *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 40];
  uint64_t v101 = *(void *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 48];
  uint64_t v102 = *(void *)&v109[OBJC_IVAR____TtC22HomeCaptiveViewService31OnboardingContentViewController_configuration + 56];
  *uint64_t v94 = v30;
  v94[1]._countAndFlagsBits = v107;
  v94[1]._object = v106;
  v94[2]._countAndFlagsBits = 0LL;
  v94[2]._object = v75;
  v94[3]._countAndFlagsBits = v91;
  v94[3]._object = v93;
  sub_10000CA48(v95, v96, v97, v98, v99, v100, v101, v102);

  return v18;
}

void sub_10000DEA0(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  if (qword_10001A4B8 != -1) {
    swift_once(&qword_10001A4B8, sub_10000D524);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100004CAC(v4, (uint64_t)qword_10001AA68);
  id v5 = a1;
  id v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v21 = v3;
    id v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    v23[0] = v9;
    *(_DWORD *)id v8 = 136315138;
    id v10 = [v5 title];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
    unint64_t v14 = v13;

    uint64_t v22 = sub_100007D5C(v12, v14, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v8 + 4, v8 + 12);

    unint64_t v15 = v14;
    uint64_t v3 = v21;
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "User selected: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  swift_beginAccess(v3, v23, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3, v16);
  if (Strong)
  {
    NSString v19 = (void *)Strong;
    id v20 = (void *)swift_unknownObjectWeakLoadStrong( Strong + OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_setupCoordinator,  v18);

    if (v20)
    {
      sub_100005D7C();
    }
  }

void sub_10000E0BC(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  if (qword_10001A4B8 != -1) {
    swift_once(&qword_10001A4B8, sub_10000D524);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100004CAC(v4, (uint64_t)qword_10001AA68);
  id v5 = a1;
  id v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v22 = v3;
    id v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    v24[0] = v9;
    *(_DWORD *)id v8 = 136315138;
    id v10 = [v5 title];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
    unint64_t v14 = v13;

    uint64_t v23 = sub_100007D5C(v12, v14, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v8 + 4, v8 + 12);

    unint64_t v15 = v14;
    uint64_t v3 = v22;
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "User selected: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  swift_beginAccess(v3, v24, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3, v16);
  if (Strong)
  {
    uint64_t v18 = (char *)Strong;
    sub_10000E580();
    uint64_t v20 = swift_unknownObjectWeakLoadStrong( &v18[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_setupCoordinator],  v19);
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      sub_100006780();
    }
  }

void sub_10000E2E0(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  if (qword_10001A4B8 != -1) {
    swift_once(&qword_10001A4B8, sub_10000D524);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100004CAC(v4, (uint64_t)qword_10001AA68);
  id v5 = a1;
  id v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v21 = v3;
    id v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    v23[0] = v9;
    *(_DWORD *)id v8 = 136315138;
    id v10 = [v5 title];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
    unint64_t v14 = v13;

    uint64_t v22 = sub_100007D5C(v12, v14, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v8 + 4, v8 + 12);

    unint64_t v15 = v14;
    uint64_t v3 = v21;
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "User selected: %s. Dismissing UI", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  swift_beginAccess(v3, v23, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3, v16);
  if (Strong)
  {
    uint64_t v19 = (void *)Strong;
    uint64_t v20 = (void *)swift_unknownObjectWeakLoadStrong( Strong + OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_setupCoordinator,  v18);

    if (v20)
    {
      sub_100008684();
      sub_100006780();
    }
  }

void sub_10000E580()
{
  id v1 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v2 = String._bridgeToObjectiveC()();
  id v14 = [v1 initWithSuiteName:v2];

  if (v14)
  {
    if ([v14 BOOLForKey:BYBuddyDoneKey])
    {
      id v4 = [objc_allocWithZone(CWFInterface) init];
      [v4 activate];
      id v5 = [v4 currentKnownNetworkProfile];
      if (v5)
      {
        id v6 = v5;
        id v16 = 0LL;
        unsigned int v7 = [v4 removeKnownNetworkProfile:v5 reason:2 error:&v16];
        id v8 = v16;
        if (v7)
        {
          id v9 = v16;
        }

        else
        {
          id v12 = v16;
          uint64_t v13 = _convertNSErrorToError(_:)(v8);

          swift_willThrow();
          swift_errorRelease(v13);
        }
      }

      objc_msgSend(v4, "invalidate", v14);
      sub_10000E820();
    }

    else
    {
      uint64_t Strong = swift_unknownObjectWeakLoadStrong( v0 + OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_setupCoordinator,  v3);
      if (Strong)
      {
        uint64_t v11 = (void *)Strong;
        sub_100008684();
        sub_100006780();
      }
    }
  }

void sub_10000E76C()
{
}

id sub_10000E798()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntroViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewService19IntroViewController);
}

id sub_10000E820()
{
  uint64_t v0 = ((uint64_t (*)(void))__chkstk_darwin)();
  objc_super v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v0);
  id v4 = (char *)&v12 - v3;
  URL.init(string:)(0xD000000000000030LL, 0x8000000100012BB0LL);
  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  if (result)
  {
    id v6 = result;
    sub_10000E968((uint64_t)v4, (uint64_t)v2);
    uint64_t v7 = type metadata accessor for URL(0LL);
    uint64_t v8 = *(void *)(v7 - 8);
    id v10 = 0LL;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v2, 1LL, v7) != 1)
    {
      URL._bridgeToObjectiveC()(v9);
      id v10 = v11;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v2, v7);
    }

    [v6 openSensitiveURL:v10 withOptions:0];

    return (id)sub_10000E9B0((uint64_t)v4);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10000E968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008528(&qword_10001AAB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E9B0(uint64_t a1)
{
  uint64_t v2 = sub_100008528(&qword_10001AAB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_10000E9F0()
{
  unint64_t result = qword_10001A960;
  if (!qword_10001A960)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___UIAction);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001A960);
  }

  return result;
}

uint64_t sub_10000EA2C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10000EA50(void *a1)
{
}

void sub_10000EA58(void *a1)
{
}

void sub_10000EA60(void *a1)
{
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC22HomeCaptiveViewServiceP33_719F72E893261951C0B1DDBAD2EA33AE19ResourceBundleClass);
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerProxy];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_initWithHostViewController_remoteViewControllerProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHostViewController:remoteViewControllerProxy:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setSetupCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupCoordinator:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 setupCoordinator];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}