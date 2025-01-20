@interface TVRDKeepAlive
+ (NSString)keepAliveFilePath;
+ (NSURL)keepAliveFileURL;
+ (OS_os_transaction)tvremotedKeepAliveTransaction;
+ (void)setTvremotedKeepAliveTransaction:(id)a3;
- (_TtC9tvremoted13TVRDKeepAlive)init;
@end

@implementation TVRDKeepAlive

+ (NSURL)keepAliveFileURL
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (one-time initialization token for keepAliveFileURL != -1) {
    swift_once( &one-time initialization token for keepAliveFileURL,  one-time initialization function for keepAliveFileURL);
  }
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)static TVRDKeepAlive.keepAliveFileURL);
  outlined init with copy of URL?(v5, (uint64_t)v4);
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  v9 = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1LL, v6) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }

  return (NSURL *)v9;
}

+ (NSString)keepAliveFilePath
{
  if (one-time initialization token for keepAliveFilePath != -1) {
    swift_once( &one-time initialization token for keepAliveFilePath,  one-time initialization function for keepAliveFilePath);
  }
  uint64_t v2 = qword_100026CE8;
  if (qword_100026CE8)
  {
    swift_bridgeObjectRetain(qword_100026CE8);
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    NSString v3 = 0LL;
  }

  return (NSString *)v3;
}

+ (OS_os_transaction)tvremotedKeepAliveTransaction
{
  return (OS_os_transaction *)(id)swift_unknownObjectRetain( static TVRDKeepAlive.tvremotedKeepAliveTransaction,  a2);
}

+ (void)setTvremotedKeepAliveTransaction:(id)a3
{
  uint64_t v3 = static TVRDKeepAlive.tvremotedKeepAliveTransaction;
  static TVRDKeepAlive.tvremotedKeepAliveTransaction = (uint64_t)a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

- (_TtC9tvremoted13TVRDKeepAlive)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVRDKeepAlive();
  return -[TVRDKeepAlive init](&v3, "init");
}

@end