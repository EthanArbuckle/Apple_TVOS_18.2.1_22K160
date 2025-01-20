@interface TVSettingsPosterItem
- (BOOL)disabled;
- (BOOL)selected;
- (BOOL)showICloudSetupWhenSelected;
- (NSString)identifier;
- (NSString)localizedAccessoryText;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (PRSPosterConfiguration)model;
- (_TtC10TVSettings20TVSettingsPosterItem)init;
- (_TtC10TVSettings20TVSettingsPosterItem)initWithModel:(id)a3;
- (id)previewImageNameWithIsMusicAlbumsSelected:(BOOL)a3;
- (int64_t)orderCompareTo:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation TVSettingsPosterItem

- (NSString)identifier
{
  return (NSString *)sub_1000EB7A8( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_identifier);
}

- (NSString)localizedName
{
  return (NSString *)sub_1000EB7A8( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_localizedName);
}

- (NSString)localizedDescription
{
  return (NSString *)sub_1000EB7A8( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_localizedDescription);
}

- (NSString)localizedAccessoryText
{
  uint64_t v2 = *(void *)&self->identifier[OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_localizedAccessoryText];
  if (v2)
  {
    swift_bridgeObjectRetain(*(void *)&self->identifier[OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_localizedAccessoryText]);
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    NSString v3 = 0LL;
  }

  return (NSString *)v3;
}

- (BOOL)disabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_disabled);
}

- (BOOL)showICloudSetupWhenSelected
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_showICloudSetupWhenSelected);
}

- (PRSPosterConfiguration)model
{
  return (PRSPosterConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_model));
}

- (BOOL)selected
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_selected);
}

- (void)setSelected:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_selected) = a3;
}

- (_TtC10TVSettings20TVSettingsPosterItem)initWithModel:(id)a3
{
  return (_TtC10TVSettings20TVSettingsPosterItem *)sub_1000EB89C(a3);
}

- (id)previewImageNameWithIsMusicAlbumsSelected:(BOOL)a3
{
  v4 = self;
  sub_1000EC664(a3);
  uint64_t v6 = v5;

  if (v6)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }

  else
  {
    NSString v7 = 0LL;
  }

  return v7;
}

- (int64_t)orderCompareTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  int64_t v6 = sub_1000EC7F4((uint64_t)v4);

  return v6;
}

- (_TtC10TVSettings20TVSettingsPosterItem)init
{
  result = (_TtC10TVSettings20TVSettingsPosterItem *)_swift_stdlib_reportUnimplementedInitializer( "TVSettings.TVSettingsPosterItem",  31LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(void *)&self->identifier[OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_bundleIdentifier]);
  NSString v3 = (char *)self + OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_previewImageNameForBundleIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10TVSettings20TVSettingsPosterItem_orderForBundleIdentifiers));
}

@end