@interface MetadataStore
- (_TtC10LinkDaemon13MetadataStore)init;
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
- (id)bundleRegistrationsWithError:(id *)a3;
- (id)bundlesWithError:(id *)a3;
- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)entitiesWithError:(id *)a3;
- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsWithError:(id *)a3;
- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5;
- (id)queriesWithError:(id *)a3;
- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4;
@end

@implementation MetadataStore

- (_TtC10LinkDaemon13MetadataStore)init
{
}

- (void).cxx_destruct
{
}

- (id)actionsWithError:(id *)a3
{
  return sub_100057BD8(self, (uint64_t)a2, (uint64_t)a3, sub_100056EC4, &qword_100132480);
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  v13 = self;
  uint64_t v14 = sub_100057CB8( v7,  v9,  v10,  v12,  (uint64_t (*)(id, id, uint64_t, uint64_t, uint64_t, uint64_t))sub_10007A7AC);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  sub_10000A1A0(0LL, (unint64_t *)&unk_100132490, &OBJC_CLASS___LNActionMetadata_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return isa;
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_10000A1A0(0LL, (unint64_t *)&qword_100130BA0, &OBJC_CLASS___LNSystemProtocol_ptr);
  unint64_t v10 = sub_100038038();
  uint64_t v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v9, v10);
  if (a5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v12;
  }

  v13 = self;
  sub_1000517C4();
  uint64_t v15 = v14;
  swift_bridgeObjectRelease(v11);

  swift_bridgeObjectRelease(a5);
  sub_100008DB0(&qword_100132480);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  return isa;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = self;
  sub_100057D30();
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  sub_10000A1A0(0LL, &qword_1001337D0, &OBJC_CLASS___LNBundleActionsMetadata_ptr);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100057A9C( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)sub_10007ABFC,  (unint64_t *)&unk_100132490,  &OBJC_CLASS___LNActionMetadata_ptr);
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100057D80(self, (uint64_t)a2, (uint64_t)a3);
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  v13 = self;
  uint64_t v14 = (void *)sub_100057CB8( v7,  v9,  v10,  v12,  (uint64_t (*)(id, id, uint64_t, uint64_t, uint64_t, uint64_t))sub_100079604);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  return v14;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v10 = sub_10000A1A0(0LL, &qword_100132488, &OBJC_CLASS___LNValueType_ptr);
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  v10,  &protocol witness table for String);
  if (a5)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v13;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  id v14 = a3;
  uint64_t v15 = self;
  sub_1000573C8((uint64_t)v15, v11, v12, (uint64_t)a5);
  uint64_t v17 = v16;
  swift_bridgeObjectRelease(v11);

  swift_bridgeObjectRelease(a5);
  sub_100008DB0(&qword_100132480);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  return isa;
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_10000A1A0(0LL, &qword_1001337F0, &OBJC_CLASS___LNFullyQualifiedActionIdentifier_ptr);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  uint64_t v8 = self;
  sub_100057578();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease(v7);

  sub_100008DB0(&qword_100132480);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

- (id)bundlesWithError:(id *)a3
{
  v3 = self;
  sub_1000576C4();
  uint64_t v5 = v4;

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  v3 = self;
  sub_100057798();
  uint64_t v5 = v4;

  sub_10000A1A0(0LL, (unint64_t *)&unk_100132470, &OBJC_CLASS___LNRegisteredBundleMetadata_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (id)queriesWithError:(id *)a3
{
  return sub_100057BD8(self, (uint64_t)a2, (uint64_t)a3, sub_100057880, &qword_100132468);
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  uint64_t v8 = v7;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v9;
  }

  uint64_t v10 = self;
  sub_1000578C0();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease(v8);

  swift_bridgeObjectRelease(a4);
  sub_10000A1A0(0LL, (unint64_t *)&qword_100132460, &OBJC_CLASS___LNQueryMetadata_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  return isa;
}

- (id)enumsWithError:(id *)a3
{
  return sub_100057BD8(self, (uint64_t)a2, (uint64_t)a3, sub_100057A40, &qword_1001336E0);
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100057A9C( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)sub_1000799DC,  (unint64_t *)&qword_100132450,  &OBJC_CLASS___LNEnumMetadata_ptr);
}

- (id)entitiesWithError:(id *)a3
{
  return sub_100057BD8(self, (uint64_t)a2, (uint64_t)a3, sub_100057B98, &qword_100133750);
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100057A9C( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)sub_100079A28,  (unint64_t *)&qword_100132440,  &OBJC_CLASS___LNEntityMetadata_ptr);
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100057D80(self, (uint64_t)a2, (uint64_t)a3);
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = self;
  sub_100057E48(v6, v8, a4);
  int64_t v11 = v10;

  swift_bridgeObjectRelease(v8);
  return v11;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_100057ED0(v5, v7);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease(v7);

  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return v11;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100057A9C( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)sub_10007E024,  &qword_100133690,  &OBJC_CLASS___LNExamplePhraseDescription_ptr);
}

@end