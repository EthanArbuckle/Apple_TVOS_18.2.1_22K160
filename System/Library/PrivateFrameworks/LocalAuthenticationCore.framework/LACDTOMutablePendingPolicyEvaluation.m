@interface LACDTOMutablePendingPolicyEvaluation
- (BOOL)hasNotifiedUserAboutCompletion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalidated;
- (BOOL)isNotificationScheduledForDate:(id)a3;
- (NSDate)coolOffStarted;
- (NSDate)notificationScheduledAt;
- (NSString)callbackReason;
- (NSString)description;
- (NSString)identifier;
- (NSString)ratchetUUID;
- (NSURL)callbackURL;
- (_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation)init;
- (_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation)initWithIdentifier:(id)a3;
- (void)setCallbackReason:(id)a3;
- (void)setCallbackURL:(id)a3;
- (void)setCoolOffStarted:(id)a3;
- (void)setIsInvalidated:(BOOL)a3;
- (void)setNotificationScheduledAt:(id)a3;
- (void)setRatchetUUID:(id)a3;
@end

@implementation LACDTOMutablePendingPolicyEvaluation

- (NSString)identifier
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_identifier);
  uint64_t v3 = *(void *)&self->identifier[OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_identifier];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x1895E445C](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)isInvalidated
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_isInvalidated;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInvalidated:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_isInvalidated;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)callbackReason
{
  return (NSString *)@objc LACDTOMutablePendingPolicyEvaluation.callbackReason.getter( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackReason);
}

- (void)setCallbackReason:(id)a3
{
}

- (NSURL)callbackURL
{
  return (NSURL *)@objc LACDTOMutablePendingPolicyEvaluation.callbackURL.getter( (uint64_t)self,  (uint64_t)a2,  &demangling cache variable for type metadata for URL?,  &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackURL,  (uint64_t (*)(void))MEMORY[0x189606A90],  MEMORY[0x1896069E8]);
}

- (void)setCallbackURL:(id)a3
{
}

- (NSDate)notificationScheduledAt
{
  return (NSDate *)@objc LACDTOMutablePendingPolicyEvaluation.callbackURL.getter( (uint64_t)self,  (uint64_t)a2,  &demangling cache variable for type metadata for Date?,  &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_notificationScheduledAt,  (uint64_t (*)(void))MEMORY[0x189606E60],  MEMORY[0x189606E00]);
}

- (void)setNotificationScheduledAt:(id)a3
{
}

- (NSDate)coolOffStarted
{
  return (NSDate *)@objc LACDTOMutablePendingPolicyEvaluation.callbackURL.getter( (uint64_t)self,  (uint64_t)a2,  &demangling cache variable for type metadata for Date?,  &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_coolOffStarted,  (uint64_t (*)(void))MEMORY[0x189606E60],  MEMORY[0x189606E00]);
}

- (void)setCoolOffStarted:(id)a3
{
}

- (NSString)ratchetUUID
{
  return (NSString *)@objc LACDTOMutablePendingPolicyEvaluation.callbackReason.getter( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_ratchetUUID);
}

- (void)setRatchetUUID:(id)a3
{
}

- (BOOL)hasNotifiedUserAboutCompletion
{
  uint64_t v2 = self;
  char v3 = LACDTOMutablePendingPolicyEvaluation.hasNotifiedUserAboutCompletion.getter();

  return v3 & 1;
}

- (_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation)initWithIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_isInvalidated) = 0;
  v7 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackReason);
  void *v7 = 0LL;
  v7[1] = 0LL;
  v8 = (char *)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackURL;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  v10 = (char *)self
      + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_notificationScheduledAt;
  uint64_t v11 = type metadata accessor for Date();
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL);
  v12(v10, 1LL, 1LL, v11);
  v12( (char *)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_coolOffStarted,  1LL,  1LL,  v11);
  v13 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_ratchetUUID);
  void *v13 = 0LL;
  v13[1] = 0LL;
  v14 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_identifier);
  uint64_t *v14 = v4;
  v14[1] = v6;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for LACDTOMutablePendingPolicyEvaluation();
  return -[LACDTOMutablePendingPolicyEvaluation init](&v16, sel_init);
}

- (BOOL)isNotificationScheduledForDate:(id)a3
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  char v9 = LACDTOMutablePendingPolicyEvaluation.isNotificationScheduled(for:)(v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation)init
{
  result = (_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  uint64_t v2 = self;
  uint64_t v3 = LACDTOMutablePendingPolicyEvaluation.description.getter();
  uint64_t v5 = v4;

  uint64_t v6 = (void *)MEMORY[0x1895E445C](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }

  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }

  char v6 = LACDTOMutablePendingPolicyEvaluation.isEqual(_:)((uint64_t)v8);

  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

@end