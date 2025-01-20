@interface GCSProfile
- (GCSProfile)initWithName:(id)a3 sfSymbolsName:(id)a4 customizable:(BOOL)a5 uuid:(id)a6;
- (id)directionPadMappingForPhysicalPress:(id)a3;
- (id)elementMappingForPhysicalPress:(id)a3;
- (id)logicalButtonForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4;
- (id)logicalDirectionPadForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4;
- (id)logicalElementForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4;
@end

@implementation GCSProfile

- (id)logicalElementForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCSProfile elementMappings](self, "elementMappings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryAlias]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 elements]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 mappingKey]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)logicalButtonForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[GCSProfile logicalElementForPhysicalPressOf:onPhysicalInputProfile:]( self,  "logicalElementForPhysicalPressOf:onPhysicalInputProfile:",  a3,  a4));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___GCControllerButtonInput);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)logicalDirectionPadForPhysicalPressOf:(id)a3 onPhysicalInputProfile:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[GCSProfile logicalElementForPhysicalPressOf:onPhysicalInputProfile:]( self,  "logicalElementForPhysicalPressOf:onPhysicalInputProfile:",  a3,  a4));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___GCControllerDirectionPad);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)elementMappingForPhysicalPress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCSProfile elementMappings](self, "elementMappings"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryAlias]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  return v7;
}

- (id)directionPadMappingForPhysicalPress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCSProfile elementMappings](self, "elementMappings"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryAlias]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___GCSDirectionPadMapping);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    id v9 = v7;
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (GCSProfile)initWithName:(id)a3 sfSymbolsName:(id)a4 customizable:(BOOL)a5 uuid:(id)a6
{
  BOOL v7 = a5;
  uint64_t v10 = sub_18140(&qword_566C0);
  __chkstk_darwin(v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v18 = v17;
  if (a6)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
    uint64_t v19 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v12, 0LL, 1LL, v19);
  }

  else
  {
    uint64_t v20 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v12, 1LL, 1LL, v20);
  }

  return (GCSProfile *)sub_36F9C(v13, v15, v16, v18, v7, (uint64_t)v12);
}

@end