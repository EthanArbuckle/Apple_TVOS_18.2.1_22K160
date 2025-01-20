@interface CSDMessagingConversationActivity
+ (CSDMessagingConversationActivity)activityWithCSDConversationActivity:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5;
+ (CSDMessagingConversationActivity)activityWithCSDConversationActivity:(id)a3 handle:(id)a4;
- (BOOL)hasActivityContext;
- (BOOL)hasActivityIdentifier;
- (BOOL)hasActivityMetadata;
- (BOOL)hasApplicationContext;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasFallbackApplicationName;
- (BOOL)hasFromHandle;
- (BOOL)hasIdentifierUUIDString;
- (BOOL)hasIsSystemActivity;
- (BOOL)hasMetadata;
- (BOOL)hasOriginatorHandle;
- (BOOL)hasTimestampAsTimeIntervalSinceReferenceDate;
- (BOOL)hasUpdatedDateEpochTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemActivity;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationActivityContext)activityContext;
- (CSDMessagingConversationActivityMetadata)activityMetadata;
- (CSDMessagingHandle)fromHandle;
- (CSDMessagingHandle)originatorHandle;
- (NSData)applicationContext;
- (NSData)metadata;
- (NSString)activityIdentifier;
- (NSString)bundleIdentifier;
- (NSString)fallbackApplicationName;
- (NSString)identifierUUIDString;
- (TUConversationActivity)tuConversationActivity;
- (double)timestampAsTimeIntervalSinceReferenceDate;
- (double)updatedDateEpochTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)mappedLifetimePolicy:(int64_t)a3;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityContext:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setActivityMetadata:(id)a3;
- (void)setApplicationContext:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFallbackApplicationName:(id)a3;
- (void)setFromHandle:(id)a3;
- (void)setHasIsSystemActivity:(BOOL)a3;
- (void)setHasTimestampAsTimeIntervalSinceReferenceDate:(BOOL)a3;
- (void)setHasUpdatedDateEpochTime:(BOOL)a3;
- (void)setIdentifierUUIDString:(id)a3;
- (void)setIsSystemActivity:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setOriginatorHandle:(id)a3;
- (void)setTimestampAsTimeIntervalSinceReferenceDate:(double)a3;
- (void)setUpdatedDateEpochTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivity

+ (CSDMessagingConversationActivity)activityWithCSDConversationActivity:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivity);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  -[CSDMessagingConversationActivity setIdentifierUUIDString:](v9, "setIdentifierUUIDString:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationContext]);
  -[CSDMessagingConversationActivity setApplicationContext:](v9, "setApplicationContext:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  -[CSDMessagingConversationActivity setBundleIdentifier:](v9, "setBundleIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 activityIdentifier]);
  -[CSDMessagingConversationActivity setActivityIdentifier:](v9, "setActivityIdentifier:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 context]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivityContext activityContextWithTUActivityContext:]( &OBJC_CLASS___CSDMessagingConversationActivityContext,  "activityContextWithTUActivityContext:",  v16));
  -[CSDMessagingConversationActivity setActivityContext:](v9, "setActivityContext:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 localMember]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 handle]);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v19));
  -[CSDMessagingConversationActivity setOriginatorHandle:](v9, "setOriginatorHandle:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v7 timestamp]);
  [v21 timeIntervalSince1970];
  -[CSDMessagingConversationActivity setUpdatedDateEpochTime:](v9, "setUpdatedDateEpochTime:");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v7 fallbackApplicationName]);
  -[CSDMessagingConversationActivity setFallbackApplicationName:](v9, "setFallbackApplicationName:", v22);

  -[CSDMessagingConversationActivity setIsSystemActivity:]( v9,  "setIsSystemActivity:",  [v7 isSystemActivity]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v7 timestamp]);
  [v23 timeIntervalSinceReferenceDate];
  -[CSDMessagingConversationActivity setTimestampAsTimeIntervalSinceReferenceDate:]( v9,  "setTimestampAsTimeIntervalSinceReferenceDate:");

  v24 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivityMetadata);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 title]);
  -[CSDMessagingConversationActivityMetadata setTitle:](v24, "setTitle:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 subTitle]);
  -[CSDMessagingConversationActivityMetadata setSubtitle:](v24, "setSubtitle:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 fallbackURL]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 absoluteString]);
  -[CSDMessagingConversationActivityMetadata setFallbackURL:](v24, "setFallbackURL:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  -[CSDMessagingConversationActivityMetadata setSupportsContinuationOnTV:]( v24,  "setSupportsContinuationOnTV:",  [v32 supportsContinuationOnTV]);

  v33 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  -[CSDMessagingConversationActivityMetadata setPreferredBroadcastingAttributes:]( v24,  "setPreferredBroadcastingAttributes:",  [v33 preferredBroadcastingAttributes]);

  v34 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  -[CSDMessagingConversationActivityMetadata setLifetimePolicy:]( v24,  "setLifetimePolicy:",  [v34 lifetimePolicy]);

  v35 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivitySceneAssociationBehavior);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 sceneAssociationBehavior]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 targetContentIdentifier]);
  -[CSDMessagingConversationActivitySceneAssociationBehavior setTargetContentIdentifier:]( v35,  "setTargetContentIdentifier:",  v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 sceneAssociationBehavior]);
  -[CSDMessagingConversationActivitySceneAssociationBehavior setShouldAssociateScene:]( v35,  "setShouldAssociateScene:",  [v40 shouldAssociateScene]);

  v41 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 sceneAssociationBehavior]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 preferredSceneSessionRole]);
  -[CSDMessagingConversationActivitySceneAssociationBehavior setPreferredSceneSessionRole:]( v35,  "setPreferredSceneSessionRole:",  v43);

  -[CSDMessagingConversationActivityMetadata setSceneAssociationBehavior:](v24, "setSceneAssociationBehavior:", v35);
  -[CSDMessagingConversationActivity setActivityMetadata:](v9, "setActivityMetadata:", v24);
  if (v5)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue([v7 trustedFromHandle]);

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue([v7 trustedFromHandle]);
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v45));
      -[CSDMessagingConversationActivity setFromHandle:](v9, "setFromHandle:", v46);
    }
  }

  return v9;
}

+ (CSDMessagingConversationActivity)activityWithCSDConversationActivity:(id)a3 handle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivity);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  -[CSDMessagingConversationActivity setIdentifierUUIDString:](v7, "setIdentifierUUIDString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationContext]);
  -[CSDMessagingConversationActivity setApplicationContext:](v7, "setApplicationContext:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  -[CSDMessagingConversationActivity setBundleIdentifier:](v7, "setBundleIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 activityIdentifier]);
  -[CSDMessagingConversationActivity setActivityIdentifier:](v7, "setActivityIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 context]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivityContext activityContextWithTUActivityContext:]( &OBJC_CLASS___CSDMessagingConversationActivityContext,  "activityContextWithTUActivityContext:",  v14));
  -[CSDMessagingConversationActivity setActivityContext:](v7, "setActivityContext:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSDMessagingHandle handleWithTUHandle:](&OBJC_CLASS___CSDMessagingHandle, "handleWithTUHandle:", v5));
  -[CSDMessagingConversationActivity setOriginatorHandle:](v7, "setOriginatorHandle:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
  [v17 timeIntervalSince1970];
  -[CSDMessagingConversationActivity setUpdatedDateEpochTime:](v7, "setUpdatedDateEpochTime:");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 fallbackApplicationName]);
  -[CSDMessagingConversationActivity setFallbackApplicationName:](v7, "setFallbackApplicationName:", v18);

  -[CSDMessagingConversationActivity setIsSystemActivity:]( v7,  "setIsSystemActivity:",  [v6 isSystemActivity]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
  [v19 timeIntervalSinceReferenceDate];
  -[CSDMessagingConversationActivity setTimestampAsTimeIntervalSinceReferenceDate:]( v7,  "setTimestampAsTimeIntervalSinceReferenceDate:");

  v20 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivityMetadata);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 title]);
  -[CSDMessagingConversationActivityMetadata setTitle:](v20, "setTitle:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 subTitle]);
  -[CSDMessagingConversationActivityMetadata setSubtitle:](v20, "setSubtitle:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 imageData]);
  -[CSDMessagingConversationActivityMetadata setImage:](v20, "setImage:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 fallbackURL]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 absoluteString]);
  -[CSDMessagingConversationActivityMetadata setFallbackURL:](v20, "setFallbackURL:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  -[CSDMessagingConversationActivityMetadata setSupportsContinuationOnTV:]( v20,  "setSupportsContinuationOnTV:",  [v30 supportsContinuationOnTV]);

  v31 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  -[CSDMessagingConversationActivityMetadata setPreferredBroadcastingAttributes:]( v20,  "setPreferredBroadcastingAttributes:",  [v31 preferredBroadcastingAttributes]);

  v32 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  -[CSDMessagingConversationActivityMetadata setLifetimePolicy:]( v20,  "setLifetimePolicy:",  [v32 lifetimePolicy]);

  v33 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivitySceneAssociationBehavior);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 sceneAssociationBehavior]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 targetContentIdentifier]);
  -[CSDMessagingConversationActivitySceneAssociationBehavior setTargetContentIdentifier:]( v33,  "setTargetContentIdentifier:",  v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 sceneAssociationBehavior]);
  -[CSDMessagingConversationActivitySceneAssociationBehavior setShouldAssociateScene:]( v33,  "setShouldAssociateScene:",  [v38 shouldAssociateScene]);

  v39 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 sceneAssociationBehavior]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 preferredSceneSessionRole]);
  -[CSDMessagingConversationActivitySceneAssociationBehavior setPreferredSceneSessionRole:]( v33,  "setPreferredSceneSessionRole:",  v41);

  -[CSDMessagingConversationActivityMetadata setSceneAssociationBehavior:](v20, "setSceneAssociationBehavior:", v33);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);

  -[CSDMessagingConversationActivityMetadata setSupportsActivityPreviews:]( v20,  "setSupportsActivityPreviews:",  [v42 supportsActivityPreviews]);
  -[CSDMessagingConversationActivity setActivityMetadata:](v7, "setActivityMetadata:", v20);

  return v7;
}

- (TUConversationActivity)tuConversationActivity
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[TUConversationActivitySceneAssociationBehavior defaultBehavior]( &OBJC_CLASS___TUConversationActivitySceneAssociationBehavior,  "defaultBehavior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  unsigned int v5 = [v4 hasSceneAssociationBehavior];

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___TUConversationActivitySceneAssociationBehavior);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
    v54 = (void *)objc_claimAutoreleasedReturnValue([v56 sceneAssociationBehavior]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v54 targetContentIdentifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sceneAssociationBehavior]);
    id v10 = [v9 shouldAssociateScene];
    v11 = (void *)v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sceneAssociationBehavior]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredSceneSessionRole]);
    id v15 = [v6 initWithTargetContentIdentifier:v7 shouldAssociateScene:v10 preferredSceneSessionRole:v14];

    v57 = v15;
  }

  else
  {
    v57 = (void *)v3;
  }

  id v48 = objc_alloc(&OBJC_CLASS___TUConversationActivityMetadata);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityContext](self, "activityContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v55 tuConversationActivityContext]);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v53 fallbackURL]);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v52));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  unsigned int v46 = [v51 supportsContinuationOnTV];
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v50 title]);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v49 subtitle]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v45 image]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  uint64_t v20 = [v19 preferredBroadcastingAttributes];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  unsigned __int8 v22 = [v21 supportsActivityPreviews];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityMetadata](self, "activityMetadata"));
  LOBYTE(v43) = v22;
  id v24 = objc_msgSend( v48,  "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:prefe rredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:",  v16,  0,  v47,  0,  v46,  v44,  v17,  v18,  v20,  v57,  v43,  -[CSDMessagingConversationActivity mappedLifetimePolicy:]( self,  "mappedLifetimePolicy:",  objc_msgSend(v23, "lifetimePolicy")));

  v25 = v24;
  v26 = objc_alloc(&OBJC_CLASS___TUConversationActivity);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity bundleIdentifier](self, "bundleIdentifier"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity applicationContext](self, "applicationContext"));
  v29 = objc_alloc(&OBJC_CLASS___NSUUID);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity identifierUUIDString](self, "identifierUUIDString"));
  v31 = -[NSUUID initWithUUIDString:](v29, "initWithUUIDString:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity activityIdentifier](self, "activityIdentifier"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity fallbackApplicationName](self, "fallbackApplicationName"));
  v34 = -[TUConversationActivity initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:]( v26,  "initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:",  v27,  v25,  v28,  v31,  v32,  v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity originatorHandle](self, "originatorHandle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 tuHandle]);
  -[TUConversationActivity setOriginator:](v34, "setOriginator:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity fromHandle](self, "fromHandle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 tuHandle]);
  -[TUConversationActivity setTrustedFromHandle:](v34, "setTrustedFromHandle:", v38);

  -[TUConversationActivity setSystemActivity:]( v34,  "setSystemActivity:",  -[CSDMessagingConversationActivity isSystemActivity](self, "isSystemActivity"));
  if (-[CSDMessagingConversationActivity hasTimestampAsTimeIntervalSinceReferenceDate]( self,  "hasTimestampAsTimeIntervalSinceReferenceDate"))
  {
    -[CSDMessagingConversationActivity timestampAsTimeIntervalSinceReferenceDate]( self,  "timestampAsTimeIntervalSinceReferenceDate");
    uint64_t v39 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    -[CSDMessagingConversationActivity updatedDateEpochTime](self, "updatedDateEpochTime");
    uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  }

  v40 = (void *)v39;
  -[TUConversationActivity setTimestamp:](v34, "setTimestamp:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversationActivity sanitizedCopy](v34, "sanitizedCopy"));
  return (TUConversationActivity *)v41;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationActivity;
  id v3 = -[CSDMessagingConversationActivity description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity dictionaryRepresentation](self, "dictionaryRepresentation"));
  uint64_t v6 = TULoggableStringForObject(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v7));

  return v8;
}

- (int64_t)mappedLifetimePolicy:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 != 1 && a3 != 2)
  {
    id v4 = sub_1001704C4();
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Couldn't convert TUConversationActivityLifetimePolicy=%ld to known value, setting to TUConversationActivityLifet imePolicyUnknown",  (uint8_t *)&v7,  0xCu);
    }

    return 0LL;
  }

  return v3;
}

- (BOOL)hasIdentifierUUIDString
{
  return self->_identifierUUIDString != 0LL;
}

- (BOOL)hasApplicationContext
{
  return self->_applicationContext != 0LL;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0LL;
}

- (BOOL)hasActivityIdentifier
{
  return self->_activityIdentifier != 0LL;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0LL;
}

- (BOOL)hasActivityContext
{
  return self->_activityContext != 0LL;
}

- (BOOL)hasOriginatorHandle
{
  return self->_originatorHandle != 0LL;
}

- (void)setUpdatedDateEpochTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_updatedDateEpochTime = a3;
}

- (void)setHasUpdatedDateEpochTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdatedDateEpochTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasFallbackApplicationName
{
  return self->_fallbackApplicationName != 0LL;
}

- (BOOL)hasActivityMetadata
{
  return self->_activityMetadata != 0LL;
}

- (void)setIsSystemActivity:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isSystemActivity = a3;
}

- (void)setHasIsSystemActivity:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsSystemActivity
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimestampAsTimeIntervalSinceReferenceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampAsTimeIntervalSinceReferenceDate = a3;
}

- (void)setHasTimestampAsTimeIntervalSinceReferenceDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampAsTimeIntervalSinceReferenceDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFromHandle
{
  return self->_fromHandle != 0LL;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  identifierUUIDString = self->_identifierUUIDString;
  if (identifierUUIDString) {
    [v3 setObject:identifierUUIDString forKey:@"identifierUUIDString"];
  }
  applicationContext = self->_applicationContext;
  if (applicationContext) {
    [v4 setObject:applicationContext forKey:@"applicationContext"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  activityIdentifier = self->_activityIdentifier;
  if (activityIdentifier) {
    [v4 setObject:activityIdentifier forKey:@"activityIdentifier"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }
  activityContext = self->_activityContext;
  if (activityContext)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationActivityContext dictionaryRepresentation]( activityContext,  "dictionaryRepresentation"));
    [v4 setObject:v11 forKey:@"activityContext"];
  }

  originatorHandle = self->_originatorHandle;
  if (originatorHandle)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](originatorHandle, "dictionaryRepresentation"));
    [v4 setObject:v13 forKey:@"originatorHandle"];
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_updatedDateEpochTime));
    [v4 setObject:v14 forKey:@"updatedDateEpochTime"];
  }

  fallbackApplicationName = self->_fallbackApplicationName;
  if (fallbackApplicationName) {
    [v4 setObject:fallbackApplicationName forKey:@"fallbackApplicationName"];
  }
  activityMetadata = self->_activityMetadata;
  if (activityMetadata)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationActivityMetadata dictionaryRepresentation]( activityMetadata,  "dictionaryRepresentation"));
    [v4 setObject:v17 forKey:@"activityMetadata"];
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isSystemActivity));
    [v4 setObject:v19 forKey:@"isSystemActivity"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_timestampAsTimeIntervalSinceReferenceDate));
    [v4 setObject:v20 forKey:@"timestampAsTimeIntervalSinceReferenceDate"];
  }

  fromHandle = self->_fromHandle;
  if (fromHandle)
  {
    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](fromHandle, "dictionaryRepresentation"));
    [v4 setObject:v22 forKey:@"fromHandle"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001103F8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  identifierUUIDString = self->_identifierUUIDString;
  id v16 = v4;
  if (identifierUUIDString)
  {
    PBDataWriterWriteStringField(v4, identifierUUIDString, 1LL);
    id v4 = v16;
  }

  applicationContext = self->_applicationContext;
  if (applicationContext)
  {
    PBDataWriterWriteDataField(v16, applicationContext, 2LL);
    id v4 = v16;
  }

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    PBDataWriterWriteStringField(v16, bundleIdentifier, 3LL);
    id v4 = v16;
  }

  activityIdentifier = self->_activityIdentifier;
  if (activityIdentifier)
  {
    PBDataWriterWriteStringField(v16, activityIdentifier, 4LL);
    id v4 = v16;
  }

  metadata = self->_metadata;
  if (metadata)
  {
    PBDataWriterWriteDataField(v16, metadata, 5LL);
    id v4 = v16;
  }

  activityContext = self->_activityContext;
  if (activityContext)
  {
    PBDataWriterWriteSubmessage(v16, activityContext, 7LL);
    id v4 = v16;
  }

  originatorHandle = self->_originatorHandle;
  if (originatorHandle)
  {
    PBDataWriterWriteSubmessage(v16, originatorHandle, 8LL);
    id v4 = v16;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v16, 9LL, self->_updatedDateEpochTime);
    id v4 = v16;
  }

  fallbackApplicationName = self->_fallbackApplicationName;
  if (fallbackApplicationName)
  {
    PBDataWriterWriteStringField(v16, fallbackApplicationName, 10LL);
    id v4 = v16;
  }

  activityMetadata = self->_activityMetadata;
  if (activityMetadata)
  {
    PBDataWriterWriteSubmessage(v16, activityMetadata, 11LL);
    id v4 = v16;
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField(v16, self->_isSystemActivity, 12LL);
    id v4 = v16;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v16, 13LL, self->_timestampAsTimeIntervalSinceReferenceDate);
    id v4 = v16;
  }

  fromHandle = self->_fromHandle;
  if (fromHandle)
  {
    PBDataWriterWriteSubmessage(v16, fromHandle, 14LL);
    id v4 = v16;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifierUUIDString)
  {
    objc_msgSend(v4, "setIdentifierUUIDString:");
    id v4 = v6;
  }

  if (self->_applicationContext)
  {
    objc_msgSend(v6, "setApplicationContext:");
    id v4 = v6;
  }

  if (self->_bundleIdentifier)
  {
    objc_msgSend(v6, "setBundleIdentifier:");
    id v4 = v6;
  }

  if (self->_activityIdentifier)
  {
    objc_msgSend(v6, "setActivityIdentifier:");
    id v4 = v6;
  }

  if (self->_metadata)
  {
    objc_msgSend(v6, "setMetadata:");
    id v4 = v6;
  }

  if (self->_activityContext)
  {
    objc_msgSend(v6, "setActivityContext:");
    id v4 = v6;
  }

  if (self->_originatorHandle)
  {
    objc_msgSend(v6, "setOriginatorHandle:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_updatedDateEpochTime;
    *((_BYTE *)v4 + 108) |= 2u;
  }

  if (self->_fallbackApplicationName)
  {
    objc_msgSend(v6, "setFallbackApplicationName:");
    id v4 = v6;
  }

  if (self->_activityMetadata)
  {
    objc_msgSend(v6, "setActivityMetadata:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 104) = self->_isSystemActivity;
    *((_BYTE *)v4 + 108) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestampAsTimeIntervalSinceReferenceDate;
    *((_BYTE *)v4 + 108) |= 1u;
  }

  if (self->_fromHandle)
  {
    objc_msgSend(v6, "setFromHandle:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_identifierUUIDString, "copyWithZone:", a3);
  int v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = -[NSData copyWithZone:](self->_applicationContext, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = -[NSString copyWithZone:](self->_activityIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  id v15 = (void *)v5[11];
  v5[11] = v14;

  id v16 = -[CSDMessagingConversationActivityContext copyWithZone:](self->_activityContext, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  id v18 = -[CSDMessagingHandle copyWithZone:](self->_originatorHandle, "copyWithZone:", a3);
  v19 = (void *)v5[12];
  v5[12] = v18;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[2] = *(void *)&self->_updatedDateEpochTime;
    *((_BYTE *)v5 + 108) |= 2u;
  }

  id v20 = -[NSString copyWithZone:](self->_fallbackApplicationName, "copyWithZone:", a3);
  v21 = (void *)v5[8];
  v5[8] = v20;

  id v22 = -[CSDMessagingConversationActivityMetadata copyWithZone:](self->_activityMetadata, "copyWithZone:", a3);
  v23 = (void *)v5[5];
  v5[5] = v22;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v5 + 104) = self->_isSystemActivity;
    *((_BYTE *)v5 + 108) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v5[1] = *(void *)&self->_timestampAsTimeIntervalSinceReferenceDate;
    *((_BYTE *)v5 + 108) |= 1u;
  }

  id v25 = -[CSDMessagingHandle copyWithZone:](self->_fromHandle, "copyWithZone:", a3);
  v26 = (void *)v5[9];
  v5[9] = v25;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  identifierUUIDString = self->_identifierUUIDString;
  if ((unint64_t)identifierUUIDString | *((void *)v4 + 10))
  {
  }

  applicationContext = self->_applicationContext;
  if ((unint64_t)applicationContext | *((void *)v4 + 6))
  {
  }

  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 7))
  {
  }

  activityIdentifier = self->_activityIdentifier;
  if ((unint64_t)activityIdentifier | *((void *)v4 + 4))
  {
  }

  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 11))
  {
  }

  activityContext = self->_activityContext;
  if ((unint64_t)activityContext | *((void *)v4 + 3))
  {
    if (!-[CSDMessagingConversationActivityContext isEqual:](activityContext, "isEqual:")) {
      goto LABEL_40;
    }
  }

  originatorHandle = self->_originatorHandle;
  if ((unint64_t)originatorHandle | *((void *)v4 + 12))
  {
    if (!-[CSDMessagingHandle isEqual:](originatorHandle, "isEqual:")) {
      goto LABEL_40;
    }
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_40;
  }

  fallbackApplicationName = self->_fallbackApplicationName;
  if ((unint64_t)fallbackApplicationName | *((void *)v4 + 8)
    && !-[NSString isEqual:](fallbackApplicationName, "isEqual:"))
  {
    goto LABEL_40;
  }

  activityMetadata = self->_activityMetadata;
  if ((unint64_t)activityMetadata | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingConversationActivityMetadata isEqual:](activityMetadata, "isEqual:")) {
      goto LABEL_40;
    }
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) != 0)
    {
      if (self->_isSystemActivity)
      {
        if (!*((_BYTE *)v4 + 104)) {
          goto LABEL_40;
        }
        goto LABEL_33;
      }

      if (!*((_BYTE *)v4 + 104)) {
        goto LABEL_33;
      }
    }

- (unint64_t)hash
{
  NSUInteger v23 = -[NSString hash](self->_identifierUUIDString, "hash");
  unint64_t v22 = (unint64_t)-[NSData hash](self->_applicationContext, "hash");
  NSUInteger v21 = -[NSString hash](self->_bundleIdentifier, "hash");
  NSUInteger v3 = -[NSString hash](self->_activityIdentifier, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_metadata, "hash");
  unint64_t v5 = -[CSDMessagingConversationActivityContext hash](self->_activityContext, "hash");
  unint64_t v6 = -[CSDMessagingHandle hash](self->_originatorHandle, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    double updatedDateEpochTime = self->_updatedDateEpochTime;
    double v9 = -updatedDateEpochTime;
    if (updatedDateEpochTime >= 0.0) {
      double v9 = self->_updatedDateEpochTime;
    }
    double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }

    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  NSUInteger v12 = -[NSString hash](self->_fallbackApplicationName, "hash");
  unint64_t v13 = -[CSDMessagingConversationActivityMetadata hash](self->_activityMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t v14 = 2654435761LL * self->_isSystemActivity;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v19 = 0LL;
    return v22 ^ v23 ^ v21 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ v19 ^ -[CSDMessagingHandle hash]( self->_fromHandle,  "hash");
  }

  uint64_t v14 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double timestampAsTimeIntervalSinceReferenceDate = self->_timestampAsTimeIntervalSinceReferenceDate;
  double v16 = -timestampAsTimeIntervalSinceReferenceDate;
  if (timestampAsTimeIntervalSinceReferenceDate >= 0.0) {
    double v16 = self->_timestampAsTimeIntervalSinceReferenceDate;
  }
  double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }

  else
  {
    v19 -= (unint64_t)fabs(v18);
  }

  return v22 ^ v23 ^ v21 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ v19 ^ -[CSDMessagingHandle hash]( self->_fromHandle,  "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (*((void *)v4 + 10))
  {
    -[CSDMessagingConversationActivity setIdentifierUUIDString:](self, "setIdentifierUUIDString:");
    id v4 = v14;
  }

  if (*((void *)v4 + 6))
  {
    -[CSDMessagingConversationActivity setApplicationContext:](self, "setApplicationContext:");
    id v4 = v14;
  }

  if (*((void *)v4 + 7))
  {
    -[CSDMessagingConversationActivity setBundleIdentifier:](self, "setBundleIdentifier:");
    id v4 = v14;
  }

  if (*((void *)v4 + 4))
  {
    -[CSDMessagingConversationActivity setActivityIdentifier:](self, "setActivityIdentifier:");
    id v4 = v14;
  }

  if (*((void *)v4 + 11))
  {
    -[CSDMessagingConversationActivity setMetadata:](self, "setMetadata:");
    id v4 = v14;
  }

  activityContext = self->_activityContext;
  uint64_t v6 = *((void *)v4 + 3);
  if (activityContext)
  {
    if (!v6) {
      goto LABEL_17;
    }
    -[CSDMessagingConversationActivityContext mergeFrom:](activityContext, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_17;
    }
    -[CSDMessagingConversationActivity setActivityContext:](self, "setActivityContext:");
  }

  id v4 = v14;
LABEL_17:
  originatorHandle = self->_originatorHandle;
  uint64_t v8 = *((void *)v4 + 12);
  if (originatorHandle)
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[CSDMessagingHandle mergeFrom:](originatorHandle, "mergeFrom:");
  }

  else
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[CSDMessagingConversationActivity setOriginatorHandle:](self, "setOriginatorHandle:");
  }

  id v4 = v14;
LABEL_23:
  if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    self->_double updatedDateEpochTime = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 8))
  {
    -[CSDMessagingConversationActivity setFallbackApplicationName:](self, "setFallbackApplicationName:");
    id v4 = v14;
  }

  activityMetadata = self->_activityMetadata;
  uint64_t v10 = *((void *)v4 + 5);
  if (activityMetadata)
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[CSDMessagingConversationActivityMetadata mergeFrom:](activityMetadata, "mergeFrom:");
  }

  else
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[CSDMessagingConversationActivity setActivityMetadata:](self, "setActivityMetadata:");
  }

  id v4 = v14;
LABEL_33:
  char v11 = *((_BYTE *)v4 + 108);
  if ((v11 & 4) != 0)
  {
    self->_isSystemActivity = *((_BYTE *)v4 + 104);
    *(_BYTE *)&self->_has |= 4u;
    char v11 = *((_BYTE *)v4 + 108);
  }

  if ((v11 & 1) != 0)
  {
    self->_double timestampAsTimeIntervalSinceReferenceDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  fromHandle = self->_fromHandle;
  uint64_t v13 = *((void *)v4 + 9);
  if (fromHandle)
  {
    if (v13)
    {
      -[CSDMessagingHandle mergeFrom:](fromHandle, "mergeFrom:");
LABEL_42:
      id v4 = v14;
    }
  }

  else if (v13)
  {
    -[CSDMessagingConversationActivity setFromHandle:](self, "setFromHandle:");
    goto LABEL_42;
  }
}

- (NSString)identifierUUIDString
{
  return self->_identifierUUIDString;
}

- (void)setIdentifierUUIDString:(id)a3
{
}

- (NSData)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (CSDMessagingConversationActivityContext)activityContext
{
  return self->_activityContext;
}

- (void)setActivityContext:(id)a3
{
}

- (CSDMessagingHandle)originatorHandle
{
  return self->_originatorHandle;
}

- (void)setOriginatorHandle:(id)a3
{
}

- (double)updatedDateEpochTime
{
  return self->_updatedDateEpochTime;
}

- (NSString)fallbackApplicationName
{
  return self->_fallbackApplicationName;
}

- (void)setFallbackApplicationName:(id)a3
{
}

- (CSDMessagingConversationActivityMetadata)activityMetadata
{
  return self->_activityMetadata;
}

- (void)setActivityMetadata:(id)a3
{
}

- (BOOL)isSystemActivity
{
  return self->_isSystemActivity;
}

- (double)timestampAsTimeIntervalSinceReferenceDate
{
  return self->_timestampAsTimeIntervalSinceReferenceDate;
}

- (CSDMessagingHandle)fromHandle
{
  return self->_fromHandle;
}

- (void)setFromHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end