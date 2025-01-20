@interface TVSSShowInAppStringSearchResultsIntentPrototype
- (_TtC17TVSystemUIService47TVSSShowInAppStringSearchResultsIntentPrototype)init;
- (void)performWithBundleIdentifier:(NSString *)a3 term:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation TVSSShowInAppStringSearchResultsIntentPrototype

- (void)performWithBundleIdentifier:(NSString *)a3 term:(NSString *)a4 completionHandler:(id)a5
{
  v5 = a3;
  v6 = a4;
  v12 = _Block_copy(a5);
  v7 = self;
  v8 = (void *)swift_allocObject(&unk_1001BC3F8, 48LL, 7LL);
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = v12;
  v8[5] = self;
  sub_10013BFBC((uint64_t)&unk_1002216D8, (uint64_t)v8);
}

- (_TtC17TVSystemUIService47TVSSShowInAppStringSearchResultsIntentPrototype)init
{
  return (_TtC17TVSystemUIService47TVSSShowInAppStringSearchResultsIntentPrototype *)TVSSShowInAppStringSearchResultsIntentPrototype.init()();
}

@end