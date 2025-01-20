@interface JSAMS
- (NSDictionary)props;
- (_TtC14amsengagementd10JSFollowUp)followUp;
- (_TtC14amsengagementd10JSLocalize)localize;
- (_TtC14amsengagementd10JSLocation)location;
- (_TtC14amsengagementd10JSMediaAPI)media;
- (_TtC14amsengagementd11JSExtension)plugin;
- (_TtC14amsengagementd11JSMarketing)marketing;
- (_TtC14amsengagementd11JSTelephony)telephony;
- (_TtC14amsengagementd14JSAccountStore)accounts;
- (_TtC14amsengagementd15JSDatabaseStore)database;
- (_TtC14amsengagementd16JSTreatmentStore)treatmentStore;
- (_TtC14amsengagementd17JSServerDataCache)serverDataCache;
- (_TtC14amsengagementd19JSUserNotifications)userNotifications;
- (_TtC14amsengagementd20JSSubscriptionStatus)subscription;
- (_TtC14amsengagementd5JSAMS)init;
- (_TtC14amsengagementd5JSApp)app;
- (_TtC14amsengagementd5JSLog)log;
- (_TtC14amsengagementd8JSClient)client;
- (_TtC14amsengagementd8JSDevice)device;
- (_TtC14amsengagementd8JSFamily)family;
- (_TtC14amsengagementd9JSBacklog)backlog;
- (_TtC14amsengagementd9JSContent)content;
- (_TtC14amsengagementd9JSMetrics)metrics;
- (_TtC14amsengagementd9JSNetwork)network;
- (_TtC14amsengagementd9JSPrivacy)privacy;
- (void)dealloc;
- (void)setProps:(id)a3;
@end

@implementation JSAMS

- (_TtC14amsengagementd14JSAccountStore)accounts
{
  return (_TtC14amsengagementd14JSAccountStore *)sub_10007B76C();
}

- (_TtC14amsengagementd5JSApp)app
{
  return (_TtC14amsengagementd5JSApp *)sub_10007B798();
}

- (_TtC14amsengagementd9JSBacklog)backlog
{
  return (_TtC14amsengagementd9JSBacklog *)sub_10007B7C4();
}

- (_TtC14amsengagementd8JSClient)client
{
  return (_TtC14amsengagementd8JSClient *)sub_10007B7F0();
}

- (_TtC14amsengagementd9JSContent)content
{
  return (_TtC14amsengagementd9JSContent *)sub_10007B81C();
}

- (_TtC14amsengagementd15JSDatabaseStore)database
{
  return (_TtC14amsengagementd15JSDatabaseStore *)sub_10007B848();
}

- (_TtC14amsengagementd8JSDevice)device
{
  return (_TtC14amsengagementd8JSDevice *)sub_10007B874();
}

- (_TtC14amsengagementd8JSFamily)family
{
  return (_TtC14amsengagementd8JSFamily *)sub_10007B8A0();
}

- (_TtC14amsengagementd10JSFollowUp)followUp
{
  return (_TtC14amsengagementd10JSFollowUp *)sub_10007B8CC();
}

- (_TtC14amsengagementd10JSLocalize)localize
{
  return (_TtC14amsengagementd10JSLocalize *)sub_10007B8F8();
}

- (_TtC14amsengagementd10JSLocation)location
{
  return (_TtC14amsengagementd10JSLocation *)sub_10007B924();
}

- (_TtC14amsengagementd5JSLog)log
{
  return (_TtC14amsengagementd5JSLog *)sub_10007B950();
}

- (_TtC14amsengagementd11JSMarketing)marketing
{
  return (_TtC14amsengagementd11JSMarketing *)sub_10007B97C();
}

- (_TtC14amsengagementd10JSMediaAPI)media
{
  return (_TtC14amsengagementd10JSMediaAPI *)sub_10007B9A8();
}

- (_TtC14amsengagementd9JSMetrics)metrics
{
  return (_TtC14amsengagementd9JSMetrics *)sub_10007B9D4();
}

- (_TtC14amsengagementd9JSNetwork)network
{
  return (_TtC14amsengagementd9JSNetwork *)sub_10007BA00();
}

- (_TtC14amsengagementd11JSExtension)plugin
{
  return (_TtC14amsengagementd11JSExtension *)sub_10007BA2C();
}

- (_TtC14amsengagementd9JSPrivacy)privacy
{
  return (_TtC14amsengagementd9JSPrivacy *)sub_10007BA58();
}

- (NSDictionary)props
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setProps:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v5 = self;
  sub_10007BB34(v4);
}

- (_TtC14amsengagementd17JSServerDataCache)serverDataCache
{
  return (_TtC14amsengagementd17JSServerDataCache *)sub_10007BB6C();
}

- (_TtC14amsengagementd20JSSubscriptionStatus)subscription
{
  return (_TtC14amsengagementd20JSSubscriptionStatus *)sub_10007BB98();
}

- (_TtC14amsengagementd11JSTelephony)telephony
{
  return (_TtC14amsengagementd11JSTelephony *)sub_10007BBC4();
}

- (_TtC14amsengagementd16JSTreatmentStore)treatmentStore
{
  return (_TtC14amsengagementd16JSTreatmentStore *)sub_10007BBF0();
}

- (_TtC14amsengagementd19JSUserNotifications)userNotifications
{
  return (_TtC14amsengagementd19JSUserNotifications *)sub_10007BC1C();
}

- (void)dealloc
{
  v2 = self;
  sub_10007C380();
}

- (void).cxx_destruct
{
}

- (_TtC14amsengagementd5JSAMS)init
{
}

@end