@interface TVSettingsTapToRepairUserPresenterConfiguration
- (BOOL)needsCDPRepair;
- (BOOL)shouldEnableRecognizeMyVoiceAfterRepair;
- (NSString)cancelActionTitle;
- (TVSettingsTapToRepairUserPresenterConfiguration)init;
- (id)copyWithZone:(void *)a3;
- (int64_t)copyStyle;
- (void)setCancelActionTitle:(id)a3;
- (void)setCopyStyle:(int64_t)a3;
- (void)setNeedsCDPRepair:(BOOL)a3;
- (void)setShouldEnableRecognizeMyVoiceAfterRepair:(BOOL)a3;
@end

@implementation TVSettingsTapToRepairUserPresenterConfiguration

- (int64_t)copyStyle
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_copyStyle);
}

- (void)setCopyStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_copyStyle) = (Class)a3;
}

- (BOOL)needsCDPRepair
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_needsCDPRepair);
}

- (void)setNeedsCDPRepair:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_needsCDPRepair) = a3;
}

- (NSString)cancelActionTitle
{
  uint64_t v2 = *(void *)&self->copyStyle[OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_cancelActionTitle];
  if (v2)
  {
    swift_bridgeObjectRetain(*(void *)&self->copyStyle[OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_cancelActionTitle]);
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    NSString v3 = 0LL;
  }

  return (NSString *)v3;
}

- (void)setCancelActionTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
  }

  v6 = (uint64_t *)((char *)self + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_cancelActionTitle);
  uint64_t v7 = *(void *)&self->copyStyle[OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_cancelActionTitle];
  uint64_t *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)shouldEnableRecognizeMyVoiceAfterRepair
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_shouldEnableRecognizeMyVoiceAfterRepair);
}

- (void)setShouldEnableRecognizeMyVoiceAfterRepair:(BOOL)a3
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_shouldEnableRecognizeMyVoiceAfterRepair) = a3;
}

- (TVSettingsTapToRepairUserPresenterConfiguration)init
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_cancelActionTitle);
  *uint64_t v4 = 0LL;
  v4[1] = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_copyStyle) = 0LL;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_needsCDPRepair) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR___TVSettingsTapToRepairUserPresenterConfiguration_shouldEnableRecognizeMyVoiceAfterRepair) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[TVSettingsTapToRepairUserPresenterConfiguration init](&v6, "init");
}

- (id)copyWithZone:(void *)a3
{
  NSString v3 = self;
  sub_1000F0DC8(v4, v9);

  uint64_t v5 = v10;
  objc_super v6 = sub_1000EF758(v9, v10);
  uint64_t v7 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  sub_1000ED7E8(v9);
  return v7;
}

- (void).cxx_destruct
{
}

@end