@interface VOTSettings
- (AXCVoiceSelection)_systemVoiceSelection;
- (AXCVoiceSelection)systemVoiceSelection;
- (AXVoiceOverActivity)_currentActivity;
- (AXVoiceOverActivity)currentActivity;
- (BOOL)speakUpEnabled;
- (BOOL)stringIsSupported:(id)a3 language:(id)a4;
- (NSArray)voiceRotors;
- (NSString)selectedLanguageIdentifier;
- (NSString)systemLanguageIdentifier;
- (_TtC3vot11VOTSettings)init;
- (void)currentElementDidUpdate:(id)a3;
- (void)initialize;
- (void)rotorRateWithCompletionHandler:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setRotorRate:(float)a3 completionHandler:(id)a4;
- (void)setSelectedLanguageIdentifier:(id)a3;
- (void)setSystemVoiceSelection:(id)a3;
- (void)set_currentActivity:(id)a3;
- (void)set_systemVoiceSelection:(id)a3;
- (void)voiceSelectionForAction:(id)a3 languageCode:(id)a4 completionHandler:(id)a5;
- (void)voiceSelectionWithLanguageCode:(id)a3 withActivity:(id)a4 completionHandler:(id)a5;
@end

@implementation VOTSettings

- (NSString)systemLanguageIdentifier
{
  return (NSString *)sub_1000E9A94(self, (uint64_t)a2, (void (*)(void))sub_1000E7460);
}

- (AXCVoiceSelection)_systemVoiceSelection
{
  return (AXCVoiceSelection *)sub_1000E7D60( (uint64_t)self,  (uint64_t)a2,  &qword_1001ACAE8,  &OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection,  (uint64_t (*)(void))&type metadata accessor for VoiceSelection,  (uint64_t (*)(void))&VoiceSelection._bridgeToObjectiveC());
}

- (void)set_systemVoiceSelection:(id)a3
{
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (a3)
  {
    v7 = self;
    id v8 = a3;
    static VoiceSelection._unconditionallyBridgeFromObjectiveC(_:)(a3);

    uint64_t v9 = type metadata accessor for VoiceSelection(0LL);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v6, 0LL, 1LL, v9);
  }

  else
  {
    uint64_t v10 = type metadata accessor for VoiceSelection(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v6, 1LL, 1LL, v10);
    v11 = self;
  }

  v12 = (char *)self + OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection, v14, 33LL, 0LL);
  sub_1000EE834((uint64_t)v6, (uint64_t)v12, &qword_1001ACAE8);
  swift_endAccess(v14);
}

- (AXCVoiceSelection)systemVoiceSelection
{
  v4 = (char *)&v14[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t KeyPath = swift_getKeyPath(&unk_100133238);
  v14[0] = self;
  uint64_t v6 = sub_1000EE57C(&qword_1001ACA30, type metadata accessor for VOTSettings, (uint64_t)&unk_100133128);
  v7 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v14, KeyPath, v6);
  swift_release(KeyPath);
  uint64_t v8 = (uint64_t)v7 + OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection;
  swift_beginAccess((char *)v7 + OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection, v14, 0LL, 0LL);
  sub_1000EE798(v8, (uint64_t)v4, &qword_1001ACAE8);

  uint64_t v9 = type metadata accessor for VoiceSelection(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v4, 1LL, v9) != 1)
  {
    v11 = (void *)VoiceSelection._bridgeToObjectiveC()();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v4, v9);
  }

  return (AXCVoiceSelection *)v11;
}

- (void)setSystemVoiceSelection:(id)a3
{
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    v7 = self;
    id v8 = a3;
    static VoiceSelection._unconditionallyBridgeFromObjectiveC(_:)(a3);

    uint64_t v9 = type metadata accessor for VoiceSelection(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v6, 0LL, 1LL, v9);
  }

  else
  {
    uint64_t v10 = type metadata accessor for VoiceSelection(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v6, 1LL, 1LL, v10);
    v11 = self;
  }

  uint64_t KeyPath = swift_getKeyPath(&unk_100133238);
  __chkstk_darwin();
  *(&v14 - 2) = (uint64_t)self;
  *(&v14 - 1) = (uint64_t)v6;
  v15 = self;
  uint64_t v13 = sub_1000EE57C(&qword_1001ACA30, type metadata accessor for VOTSettings, (uint64_t)&unk_100133128);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( &v15,  KeyPath,  sub_1000EEC9C,  &v14 - 4,  (char *)&type metadata for () + 8,  v13);
  swift_release(KeyPath);
  sub_1000EE648((uint64_t)v6, &qword_1001ACAE8);
}

- (NSArray)voiceRotors
{
  v2 = self;
  uint64_t v3 = (void *)AXPreferences.VoiceOver.$voiceRotors.getter();
  dispatch thunk of AXSetting.cachedValue.getter(&v7);

  uint64_t v4 = v7;
  type metadata accessor for AXPreferences.VoiceOver.VoiceRotorItem(0LL);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (AXVoiceOverActivity)_currentActivity
{
  return (AXVoiceOverActivity *)sub_1000E7D60( (uint64_t)self,  (uint64_t)a2,  &qword_1001ACA40,  &OBJC_IVAR____TtC3vot11VOTSettings__currentActivity,  (uint64_t (*)(void))&type metadata accessor for AXPreferences.VoiceOver.Activity,  (uint64_t (*)(void))&AXPreferences.VoiceOver.Activity._bridgeToObjectiveC());
}

- (void)set_currentActivity:(id)a3
{
  uint64_t v5 = sub_1000ED63C(&qword_1001ACA40);
  uint64_t v6 = __chkstk_darwin(v5);
  id v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v6);
  uint64_t v10 = &v17[-v9];
  if (a3)
  {
    v11 = self;
    id v12 = a3;
    static AXPreferences.VoiceOver.Activity._unconditionallyBridgeFromObjectiveC(_:)(a3);

    uint64_t v13 = type metadata accessor for AXPreferences.VoiceOver.Activity(0LL);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 0LL, 1LL, v13);
  }

  else
  {
    uint64_t v14 = type metadata accessor for AXPreferences.VoiceOver.Activity(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v10, 1LL, 1LL, v14);
    v15 = self;
  }

  v16 = (char *)self + OBJC_IVAR____TtC3vot11VOTSettings__currentActivity;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC3vot11VOTSettings__currentActivity, v18, 0LL, 0LL);
  sub_1000EE798((uint64_t)v16, (uint64_t)v8, &qword_1001ACA40);
  swift_beginAccess(v16, v17, 33LL, 0LL);
  sub_1000EE604((uint64_t)v10, (uint64_t)v16, &qword_1001ACA40);
  swift_endAccess(v17);
  sub_1000E7FD4((uint64_t)v8);
  sub_1000EE648((uint64_t)v10, &qword_1001ACA40);
  sub_1000EE648((uint64_t)v8, &qword_1001ACA40);
}

- (AXVoiceOverActivity)currentActivity
{
  uint64_t v3 = sub_1000ED63C(&qword_1001ACA40);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v15[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t KeyPath = swift_getKeyPath(&unk_1001331E8);
  v15[0] = self;
  uint64_t v7 = sub_1000EE57C(&qword_1001ACA30, type metadata accessor for VOTSettings, (uint64_t)&unk_100133128);
  id v8 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v15, KeyPath, v7);
  swift_release(KeyPath);
  uint64_t v9 = (uint64_t)v8 + OBJC_IVAR____TtC3vot11VOTSettings__currentActivity;
  swift_beginAccess((char *)v8 + OBJC_IVAR____TtC3vot11VOTSettings__currentActivity, v15, 0LL, 0LL);
  sub_1000EE798(v9, (uint64_t)v5, &qword_1001ACA40);

  uint64_t v10 = type metadata accessor for AXPreferences.VoiceOver.Activity(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  id v12 = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1LL, v10) != 1)
  {
    id v12 = (void *)AXPreferences.VoiceOver.Activity._bridgeToObjectiveC()();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }

  return (AXVoiceOverActivity *)v12;
}

- (void)setCurrentActivity:(id)a3
{
  uint64_t v5 = sub_1000ED63C(&qword_1001ACA40);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    id v8 = self;
    id v9 = a3;
    static AXPreferences.VoiceOver.Activity._unconditionallyBridgeFromObjectiveC(_:)(a3);

    uint64_t v10 = type metadata accessor for AXPreferences.VoiceOver.Activity(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 0LL, 1LL, v10);
  }

  else
  {
    uint64_t v11 = type metadata accessor for AXPreferences.VoiceOver.Activity(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v7, 1LL, 1LL, v11);
    id v12 = self;
  }

  uint64_t KeyPath = swift_getKeyPath(&unk_1001331E8);
  __chkstk_darwin(KeyPath);
  *(&v15 - 2) = (uint64_t)self;
  *(&v15 - 1) = (uint64_t)v7;
  v16 = self;
  uint64_t v14 = sub_1000EE57C(&qword_1001ACA30, type metadata accessor for VOTSettings, (uint64_t)&unk_100133128);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( &v16,  KeyPath,  sub_1000EECB0,  &v15 - 4,  (char *)&type metadata for () + 8,  v14);
  swift_release(KeyPath);
  sub_1000EE648((uint64_t)v7, &qword_1001ACA40);
}

- (void)currentElementDidUpdate:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_1000E8B50((uint64_t)v5);
}

- (BOOL)speakUpEnabled
{
  v2 = self;
  uint64_t v3 = (void *)AXPreferences.VoiceOver.$speakUpEnabled.getter();
  dispatch thunk of AXSetting.cachedValue.getter(&v5);

  return v5;
}

- (NSString)selectedLanguageIdentifier
{
  return (NSString *)sub_1000E9A94(self, (uint64_t)a2, (void (*)(void))sub_1000E9AFC);
}

- (void)setSelectedLanguageIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = self;
  sub_1000E9E18(v4, v6);
}

- (void)rotorRateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000ED63C(&qword_1001ACA48);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_10017A628, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_10017A650, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1001ACB80;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject(&unk_10017A678, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1001ACB88;
  v12[5] = v11;
  uint64_t v13 = self;
  uint64_t v14 = sub_1000ED7DC((uint64_t)v7, (uint64_t)&unk_1001ACB90, (uint64_t)v12);
  swift_release(v14);
}

- (void)setRotorRate:(float)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000ED63C(&qword_1001ACA48);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_10017A588, 40LL, 7LL);
  *(float *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_10017A5B0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1001ACB40;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_10017A5D8, 48LL, 7LL);
  v14[2] = 0LL;
  void v14[3] = 0LL;
  v14[4] = &unk_1001ACB50;
  v14[5] = v13;
  uint64_t v15 = self;
  uint64_t v16 = sub_1000ED7DC((uint64_t)v9, (uint64_t)&unk_1001ACB60, (uint64_t)v14);
  swift_release(v16);
}

- (void)voiceSelectionForAction:(id)a3 languageCode:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject(&unk_10017A560, 24LL, 7LL);
  *(void *)(v13 + 16) = v8;
  id v15 = a3;
  uint64_t v14 = self;
  sub_1000EB598(a3, v10, v12, (uint64_t)sub_1000EE8A4, v13);
  swift_release(v13);
  swift_bridgeObjectRelease(v12);
}

- (void)voiceSelectionWithLanguageCode:(id)a3 withActivity:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000ED63C(&qword_1001ACA40);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v13);
  uint64_t v16 = v15;
  if (a4)
  {
    uint64_t v17 = self;
    id v18 = a4;
    static AXPreferences.VoiceOver.Activity._unconditionallyBridgeFromObjectiveC(_:)(a4);

    uint64_t v19 = type metadata accessor for AXPreferences.VoiceOver.Activity(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v11, 0LL, 1LL, v19);
  }

  else
  {
    uint64_t v20 = type metadata accessor for AXPreferences.VoiceOver.Activity(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v11, 1LL, 1LL, v20);
    v21 = self;
  }

  uint64_t v22 = swift_allocObject(&unk_10017A538, 24LL, 7LL);
  *(void *)(v22 + 16) = v12;
  sub_1000EBCEC(v14, v16, (uint64_t)v11, (uint64_t)sub_1000EE8A4, v22);
  swift_release(v22);
  swift_bridgeObjectRelease(v16);

  sub_1000EE648((uint64_t)v11, &qword_1001ACA40);
}

- (_TtC3vot11VOTSettings)init
{
  return (_TtC3vot11VOTSettings *)sub_1000EC2B8();
}

- (void)initialize
{
  uint64_t v7 = self;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v3 = swift_allocObject(&unk_10017A4E8, 24LL, 7LL);
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = v2;
  sub_1000E8E1C((uint64_t)sub_1000EEC54, v3);
  swift_release(v3);
  dispatch_group_enter(v4);
  uint64_t v5 = swift_allocObject(&unk_10017A510, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = v4;
  sub_1000EA230((uint64_t)sub_1000EE878, v5);
  swift_release(v5);
  OS_dispatch_group.wait()();
}

- (BOOL)stringIsSupported:(id)a3 language:(id)a4
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v8 = v6;
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
    a4 = v10;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t v11 = self;
  char v12 = sub_1000ECBF8(v7, v8, v9, (uint64_t)a4);
  swift_bridgeObjectRelease(v8);

  swift_bridgeObjectRelease(a4);
  return v12 & 1;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3vot11VOTSettings_resolver));
  sub_1000EE648((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings__systemLanguage, &qword_1001ACA28);
  sub_1000EE648((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings__systemVoiceSelection, &qword_1001ACAE8);
  sub_1000EE648((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings__currentActivity, &qword_1001ACA40);
  sub_1000EE648((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings___overrideLanguage, &qword_1001ACA28);
  sub_1000EE648((uint64_t)self + OBJC_IVAR____TtC3vot11VOTSettings__selectedLanguage, &qword_1001ACA28);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3vot11VOTSettings__languageCharacters));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3vot11VOTSettings__languageCharactersLock));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC3vot11VOTSettings___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end