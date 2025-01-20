@interface IDSRegistrationRequestTracker
+ (IDSRegistrationRequestTracker)sharedInstance;
- (IDSRegistrationRequestTracker)init;
- (id)eventHistoryStringWithWantsBAADigests:(BOOL)a3;
- (void)completedRequest:(id)a3 resultCode:(int64_t)a4 interface:(unint64_t)a5;
@end

@implementation IDSRegistrationRequestTracker

+ (IDSRegistrationRequestTracker)sharedInstance
{
  if (qword_1009C7000 != -1) {
    swift_once(&qword_1009C7000, sub_1004D4870);
  }
  return (IDSRegistrationRequestTracker *)(id)qword_1009C7970;
}

- (IDSRegistrationRequestTracker)init
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RegistrationRequestTracker();
  v2 = -[IDSRegistrationRequestTracker init](&v9, "init");
  uint64_t v3 = swift_allocObject(&unk_100907F30, 24LL, 7LL);
  swift_unknownObjectWeakInit(v3 + 16, v2);
  v4 = v2;
  uint64_t v5 = swift_retain(v3);
  id v7 = sub_100481CA8(v5, v6);
  registerSysdiagnoseBlock(title:queue:block:)( 0xD000000000000018LL,  0x8000000100843520LL,  (uint64_t)v7,  (uint64_t)sub_1004D7E08,  v3);

  swift_release_n(v3, 2LL);
  return v4;
}

- (void)completedRequest:(id)a3 resultCode:(int64_t)a4 interface:(unint64_t)a5
{
  id v9 = a3;
  v10 = self;
  sub_1004D6AA4(a3, a4, a5);
}

- (id)eventHistoryStringWithWantsBAADigests:(BOOL)a3
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

@end