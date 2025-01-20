@interface BMDaemonLibraryLoader
+ (void)loadRootLibrary;
- (_TtC34IntelligencePlatformComputeService21BMDaemonLibraryLoader)init;
@end

@implementation BMDaemonLibraryLoader

+ (void)loadRootLibrary
{
  uint64_t v2 = type metadata accessor for Library(0LL);
  unint64_t v3 = sub_100003F60();
  static UnifiedLibrary.add(library:)(v2, v3);
}

- (_TtC34IntelligencePlatformComputeService21BMDaemonLibraryLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return -[BMDaemonLibraryLoader init](&v3, "init");
}

@end