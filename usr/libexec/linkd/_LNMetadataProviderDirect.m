@interface _LNMetadataProviderDirect
- (_TtC10LinkDaemon25_LNMetadataProviderDirect)init;
- (_TtC10LinkDaemon25_LNMetadataProviderDirect)initWithConnection:(id)a3 options:(int64_t)a4 error:(id *)a5;
- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsWithError:(id *)a3;
- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4;
- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4;
- (id)bundleRegistrationsWithError:(id *)a3;
- (id)bundlesWithError:(id *)a3;
- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)entitiesWithError:(id *)a3;
- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsWithError:(id *)a3;
- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4;
- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5;
- (id)queriesWithError:(id *)a3;
- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4;
- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5;
- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4;
@end

@implementation _LNMetadataProviderDirect

- (_TtC10LinkDaemon25_LNMetadataProviderDirect)initWithConnection:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  return (_TtC10LinkDaemon25_LNMetadataProviderDirect *)_LNMetadataProviderDirect.init(connection:options:)( a3,  a4);
}

- (id)actionsWithError:(id *)a3
{
  return sub_100082488(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.actions(), &qword_100132480);
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v10 = sub_10000A1A0(0LL, (unint64_t *)&qword_100130BA0, &OBJC_CLASS___LNSystemProtocol_ptr);
  unint64_t v11 = sub_100038038();
  uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v10, v11);
  if (a5)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v14;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  v15 = self;
  _LNMetadataProviderDirect.actionsConforming(to:logicalType:bundleIdentifier:)(v12, a4, v13, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_100008DB0(&qword_100132480);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  v5 = self;
  _LNMetadataProviderDirect.actionsAndSystemProtocolDefaults(forBundleIdentifier:)();

  swift_bridgeObjectRelease();
  sub_10000A1A0(0LL, &qword_1001337D0, &OBJC_CLASS___LNBundleActionsMetadata_ptr);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100082138( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actions(forBundleIdentifier:),  (unint64_t *)&unk_100132490,  &OBJC_CLASS___LNActionMetadata_ptr);
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100082554( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actionIdentifiers(forBundleIdentifier:));
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  uint64_t v13 = self;
  v14 = (void *)_LNMetadataProviderDirect.action(forBundleIdentifier:andActionIdentifier:)(v7, v9, v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  uint64_t v13 = self;
  _LNMetadataProviderDirect.actions(forBundleIdentifier:andActionIdentifier:)(v7, v9, v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10000A1A0(0LL, (unint64_t *)&unk_100132490, &OBJC_CLASS___LNActionMetadata_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v10 = sub_10000A1A0(0LL, &qword_100132488, &OBJC_CLASS___LNValueType_ptr);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  v10,  &protocol witness table for String);
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  }
  id v11 = a3;
  uint64_t v12 = self;
  _LNMetadataProviderDirect.actionsConforming(to:withParametersOfTypes:bundleIdentifier:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_100008DB0(&qword_100132480);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_10000A1A0(0LL, &qword_1001337F0, &OBJC_CLASS___LNFullyQualifiedActionIdentifier_ptr);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  uint64_t v7 = self;
  _LNMetadataProviderDirect.actions(withFullyQualifiedIdentifiers:)();
  swift_bridgeObjectRelease();

  sub_100008DB0(&qword_100132480);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)bundlesWithError:(id *)a3
{
  v3 = self;
  _LNMetadataProviderDirect.bundles()();

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  v3 = self;
  _LNMetadataProviderDirect.bundleRegistrations()();

  sub_10000A1A0(0LL, (unint64_t *)&unk_100132470, &OBJC_CLASS___LNRegisteredBundleMetadata_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)queriesWithError:(id *)a3
{
  return sub_100082488(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.queries(), &qword_100132468);
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v11;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v12 = self;
  _LNMetadataProviderDirect.queries(forBundleIdentifier:ofType:)(v7, v9, v10, (uint64_t)a4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10000A1A0(0LL, (unint64_t *)&qword_100132460, &OBJC_CLASS___LNQueryMetadata_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)enumsWithError:(id *)a3
{
  return sub_100082488(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.enums(), &qword_1001336E0);
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100082138( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.enums(forBundleIdentifier:),  (unint64_t *)&qword_100132450,  &OBJC_CLASS___LNEnumMetadata_ptr);
}

- (id)entitiesWithError:(id *)a3
{
  return sub_100082488(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.entities(), &qword_100133750);
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100082138( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entities(forBundleIdentifier:),  (unint64_t *)&qword_100132440,  &OBJC_CLASS___LNEntityMetadata_ptr);
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100082554( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entityIdentifiers(forBundleIdentifier:));
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = self;
  id v10 = _LNMetadataProviderDirect.metadataVersion(forBundleIdentifier:error:)(v6, v8, a4);

  swift_bridgeObjectRelease();
  return (int64_t)v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  _LNMetadataProviderDirect.appShortcutsProviderMangledTypeName(forBundleIdentifier:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      uint64_t v12 = (void *)_convertErrorToNSError(_:)(v11);
      swift_errorRelease(v11);
      id v13 = v12;
      NSString v14 = 0LL;
      *a4 = v12;
    }

    else
    {
      swift_errorRelease(v11);
      NSString v14 = 0LL;
    }
  }

  else
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return v14;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100082138( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.examplePhrases(forBundleIdentifier:),  &qword_100133690,  &OBJC_CLASS___LNExamplePhraseDescription_ptr);
}

- (_TtC10LinkDaemon25_LNMetadataProviderDirect)init
{
}

- (void).cxx_destruct
{
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  _Block_copy(v8);
  v15 = self;
  sub_100082B78(v9, v11, v12, v14, v15, (void (**)(void, void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  _Block_copy(v6);
  uint64_t v10 = self;
  sub_100083050(v7, v9, v10, (void (**)(void, void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  v5 = self;
  _LNMetadataProviderDirect.autoShortcuts(forLocaleIdentifier:)();
  swift_bridgeObjectRelease();

  sub_100008DB0(&qword_100133520);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  uint64_t v7 = self;
  _LNMetadataProviderDirect.properties(forIdentifiers:)();
  swift_bridgeObjectRelease();

  sub_10000A1A0(0LL, &qword_1001309A8, &OBJC_CLASS___LNProperty_ptr);
  sub_100008C18( &qword_100130E40,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

@end