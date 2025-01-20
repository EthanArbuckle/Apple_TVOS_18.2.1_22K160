@interface TVRDUtils
+ (NSURL)prefsDirectoryURL;
- (_TtC9tvremoted9TVRDUtils)init;
@end

@implementation TVRDUtils

+ (NSURL)prefsDirectoryURL
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (one-time initialization token for prefsDirectoryURL != -1) {
    swift_once( &one-time initialization token for prefsDirectoryURL,  one-time initialization function for prefsDirectoryURL);
  }
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)static TVRDUtils.prefsDirectoryURL);
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

- (_TtC9tvremoted9TVRDUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVRDUtils();
  return -[TVRDUtils init](&v3, "init");
}

@end