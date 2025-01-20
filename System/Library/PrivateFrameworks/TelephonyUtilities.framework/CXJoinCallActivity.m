@interface CXJoinCallActivity
+ (CXJoinCallActivity)activityWithTUConversationActivity:(id)a3;
- (TUConversationActivity)tuActivity;
@end

@implementation CXJoinCallActivity

+ (CXJoinCallActivity)activityWithTUConversationActivity:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___CXJoinCallActivity);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serializedData]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationContext]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 activityIdentifier]);
  v10 = -[CXJoinCallActivity initWithBundleIdentifier:metadata:applicationContext:activityIdentifier:]( v4,  "initWithBundleIdentifier:metadata:applicationContext:activityIdentifier:",  v5,  v7,  v8,  v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  -[CXJoinCallActivity setUUID:](v10, "setUUID:", v11);

  id v12 = [v3 startWhenStaged];
  -[CXJoinCallActivity setStartWhenStaged:](v10, "setStartWhenStaged:", v12);
  return v10;
}

- (TUConversationActivity)tuActivity
{
  id v3 = objc_alloc(&OBJC_CLASS___TUConversationActivity);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CXJoinCallActivity metadata](self, "metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationActivityMetadata activityMetadataWithDataBlob:]( &OBJC_CLASS___TUConversationActivityMetadata,  "activityMetadataWithDataBlob:",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXJoinCallActivity applicationContext](self, "applicationContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CXJoinCallActivity UUID](self, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CXJoinCallActivity activityIdentifier](self, "activityIdentifier"));
  v9 = -[TUConversationActivity initWithMetadata:applicationContext:uuid:activityIdentifier:]( v3,  "initWithMetadata:applicationContext:uuid:activityIdentifier:",  v5,  v6,  v7,  v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CXJoinCallActivity bundleIdentifier](self, "bundleIdentifier"));
  -[TUConversationActivity setBundleIdentifier:](v9, "setBundleIdentifier:", v10);

  -[TUConversationActivity setStartWhenStaged:]( v9,  "setStartWhenStaged:",  -[CXJoinCallActivity startWhenStaged](self, "startWhenStaged"));
  return v9;
}

@end