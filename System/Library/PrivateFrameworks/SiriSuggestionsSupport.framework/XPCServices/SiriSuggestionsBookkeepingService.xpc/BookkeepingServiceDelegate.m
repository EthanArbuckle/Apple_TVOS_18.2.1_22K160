@interface BookkeepingServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate)init;
@end

@implementation BookkeepingServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000093D4((uint64_t)v8, v7);

  return 1;
}

- (_TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate)init
{
}

- (void).cxx_destruct
{
  sub_10000397C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_suggestionsLoggerFactory));
  sub_10000397C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureServiceFactory));
  sub_10000397C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureFlagProvider));
}

@end