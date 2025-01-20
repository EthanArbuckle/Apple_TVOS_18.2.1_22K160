@interface DewConfigurationObjectiveC
- (BOOL)fastWatchdogExit;
- (_TtC13transparencyd26DewConfigurationObjectiveC)init;
- (_TtC13transparencyd26DewConfigurationObjectiveC)initWithSettings:(id)a3;
- (double)coreDataInitialDelaySync;
- (double)resetEnvLogClientNetworkTimeout;
- (double)selfValidateCloudKitTimeout;
- (double)selfValidationEnrollment;
- (id)dewConfig;
- (unint64_t)validatePendingSMTLimit;
- (unint64_t)validatePendingURILimit;
- (void)overrideCoreDataInitialDelaySyncWithTimeInterval:(double)a3;
- (void)overrideSelfValidateCloudKitTimeoutWithTimeInterval:(double)a3;
- (void)overrideSelfValidationEnrollmentWithTimeInterval:(double)a3;
- (void)printAllDescriptions;
- (void)updateDewConfigurationWithData:(id)a3;
@end

@implementation DewConfigurationObjectiveC

- (_TtC13transparencyd26DewConfigurationObjectiveC)initWithSettings:(id)a3
{
  v4 = (_TtC13transparencyd26DewConfigurationObjectiveC *)sub_100084E78((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (id)dewConfig
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x90);
  v3 = self;
  v4 = (void *)v2();

  return v4;
}

- (double)selfValidationEnrollment
{
  return sub_100082BA0( (char *)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_selfValidsationEnrollment);
}

- (void)overrideSelfValidationEnrollmentWithTimeInterval:(double)a3
{
}

- (double)coreDataInitialDelaySync
{
  return sub_100082BA0( (char *)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_initialDelaySync);
}

- (void)overrideCoreDataInitialDelaySyncWithTimeInterval:(double)a3
{
}

- (unint64_t)validatePendingURILimit
{
  return sub_1000829F0( (char *)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_validatePendingURILimitConfig);
}

- (unint64_t)validatePendingSMTLimit
{
  return sub_1000829F0( (char *)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_validatePendingSMTLimitConfig);
}

- (double)selfValidateCloudKitTimeout
{
  return sub_100082BA0( (char *)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_selfValidateCloudKitTimeoutConfig);
}

- (void)overrideSelfValidateCloudKitTimeoutWithTimeInterval:(double)a3
{
}

- (double)resetEnvLogClientNetworkTimeout
{
  return sub_100082BA0( (char *)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_resetEnvLogClientNetworkTimeoutConfig);
}

- (BOOL)fastWatchdogExit
{
  void (*v2)(BOOL *__return_ptr);
  _TtC13transparencyd26DewConfigurationObjectiveC *v3;
  BOOL v5;
  v2 = *(void (**)(BOOL *__return_ptr))(**(void **)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_fastWatchDogExit)
                                                   + 200LL);
  v3 = self;
  v2(&v5);

  return v5;
}

- (void)printAllDescriptions
{
  uint64_t v2 = qword_1002E9A68;
  v3 = self;
  if (v2 != -1) {
    swift_once(&qword_1002E9A68, sub_100080FD0);
  }
  (*(void (**)(void))(*(void *)qword_1002E9A70 + 160LL))();
}

- (void)updateDewConfigurationWithData:(id)a3
{
  id v5 = a3;
  v10 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;

  v9 = (void *)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v10->super.isa) + 0x90))();
  (*(void (**)(uint64_t, unint64_t))((swift_isaMask & *v9) + 0x80LL))(v6, v8);

  sub_100072BE0(v6, v8);
}

- (_TtC13transparencyd26DewConfigurationObjectiveC)init
{
  result = (_TtC13transparencyd26DewConfigurationObjectiveC *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.DewConfigurationObjectiveC",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_selfValidsationEnrollment));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_initialDelaySync));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_validatePendingURILimitConfig));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_validatePendingSMTLimitConfig));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_selfValidateCloudKitTimeoutConfig));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_resetEnvLogClientNetworkTimeoutConfig));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_fastWatchDogExit));
}

@end