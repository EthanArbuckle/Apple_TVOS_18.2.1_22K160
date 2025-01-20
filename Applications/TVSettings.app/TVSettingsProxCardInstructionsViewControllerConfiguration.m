@interface TVSettingsProxCardInstructionsViewControllerConfiguration
- (NSArray)buttons;
- (NSString)body;
- (NSString)instructions;
- (NSString)instructionsFooter;
- (NSString)instructionsTitle;
- (NSString)title;
- (TVSettingsProxCardInstructionsViewControllerConfiguration)init;
- (UIAction)footerAction;
- (id)copyWithZone:(void *)a3;
- (id)startAdvertisingHandler;
- (id)stopAdvertisingHandler;
- (void)setBody:(id)a3;
- (void)setButtons:(id)a3;
- (void)setFooterAction:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setInstructionsFooter:(id)a3;
- (void)setInstructionsTitle:(id)a3;
- (void)setStartAdvertisingHandler:(id)a3;
- (void)setStopAdvertisingHandler:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVSettingsProxCardInstructionsViewControllerConfiguration

- (NSString)title
{
  return (NSString *)sub_1000EEC20( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return (NSString *)sub_1000EEC20( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_body);
}

- (void)setBody:(id)a3
{
}

- (NSArray)buttons
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_buttons);
  sub_1000EF884(0LL, &qword_1001E1110, &OBJC_CLASS___UIAction_ptr);
  swift_bridgeObjectRetain(v2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setButtons:(id)a3
{
  uint64_t v5 = sub_1000EF884(0LL, &qword_1001E1110, &OBJC_CLASS___UIAction_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_buttons);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_buttons) = v6;
  swift_bridgeObjectRelease(v7);
}

- (UIAction)footerAction
{
  return (UIAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_footerAction));
}

- (void)setFooterAction:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_footerAction);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_footerAction) = (Class)a3;
  id v3 = a3;
}

- (NSString)instructionsTitle
{
  return (NSString *)sub_1000EEC20( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_instructionsTitle);
}

- (void)setInstructionsTitle:(id)a3
{
}

- (NSString)instructions
{
  return (NSString *)sub_1000EEC20( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_instructions);
}

- (void)setInstructions:(id)a3
{
}

- (NSString)instructionsFooter
{
  return (NSString *)sub_1000EEC20( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_instructionsFooter);
}

- (void)setInstructionsFooter:(id)a3
{
}

- (id)startAdvertisingHandler
{
  return sub_1000EED64( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_startAdvertisingHandler,  (uint64_t)&unk_100195610);
}

- (void)setStartAdvertisingHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    id v4 = (void *)swift_allocObject(&unk_1001955F8, 24LL, 7LL);
    v4[2] = v5;
    v6 = sub_1000EF900;
  }

  else
  {
    v6 = 0LL;
  }

  uint64_t v7 = (uint64_t (**)())((char *)self
                      + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_startAdvertisingHandler);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_startAdvertisingHandler);
  uint64_t v8 = *(void *)&self->title[OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_startAdvertisingHandler];
  *uint64_t v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1000EF748(v9, v8);
}

- (id)stopAdvertisingHandler
{
  return sub_1000EED64( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_stopAdvertisingHandler,  (uint64_t)&unk_1001955C0);
}

- (void)setStopAdvertisingHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    id v4 = (void *)swift_allocObject(&unk_1001955A8, 24LL, 7LL);
    v4[2] = v5;
    v6 = sub_1000EF7A0;
  }

  else
  {
    v6 = 0LL;
  }

  uint64_t v7 = (uint64_t (**)())((char *)self
                      + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_stopAdvertisingHandler);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_stopAdvertisingHandler);
  uint64_t v8 = *(void *)&self->title[OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_stopAdvertisingHandler];
  *uint64_t v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1000EF748(v9, v8);
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  sub_1000EEE60(v8);

  uint64_t v4 = v9;
  uint64_t v5 = sub_1000EF758(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  sub_1000ED7E8(v8);
  return v6;
}

- (TVSettingsProxCardInstructionsViewControllerConfiguration)init
{
  return (TVSettingsProxCardInstructionsViewControllerConfiguration *)sub_1000EF068();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_buttons));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_footerAction));
  swift_bridgeObjectRelease(*(void *)&self->title[OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_instructionsTitle]);
  swift_bridgeObjectRelease(*(void *)&self->title[OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_instructions]);
  swift_bridgeObjectRelease(*(void *)&self->title[OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_instructionsFooter]);
  sub_1000EF748( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_startAdvertisingHandler),  *(void *)&self->title[OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_startAdvertisingHandler]);
  sub_1000EF748( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_stopAdvertisingHandler),  *(void *)&self->title[OBJC_IVAR___TVSettingsProxCardInstructionsViewControllerConfiguration_stopAdvertisingHandler]);
}

@end