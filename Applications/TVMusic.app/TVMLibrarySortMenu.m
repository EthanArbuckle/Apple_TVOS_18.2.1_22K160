@interface TVMLibrarySortMenu
- (NSArray)sortDescriptors;
- (TVMLibrarySortMenu)init;
- (int64_t)filterType;
@end

@implementation TVMLibrarySortMenu

- (NSArray)sortDescriptors
{
  v2 = self;
  sub_1001640C8();
  uint64_t v4 = v3;

  if (v4)
  {
    sub_100165950();
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.isa = 0LL;
  }

  return (NSArray *)v5.super.isa;
}

- (int64_t)filterType
{
  v2 = self;
  int64_t v3 = sub_100164148();

  return v3;
}

- (TVMLibrarySortMenu)init
{
  result = (TVMLibrarySortMenu *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.SortMenu",  16LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR___TVMLibrarySortMenu__isFiltered;
  uint64_t v4 = sub_1000DFE10(&qword_1002BA170);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end