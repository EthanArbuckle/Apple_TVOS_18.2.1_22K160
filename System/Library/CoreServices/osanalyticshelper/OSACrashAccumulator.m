@interface OSACrashAccumulator
- (BOOL)isValidEvent:(id)a3;
- (NSSet)firstPartyBundleIDs;
- (OSACrashAccumulator)initWithTargetAppVersions:(id)a3 isBaseline:(BOOL)a4;
- (void)addEvent:(id)a3 withBundleID:(id)a4;
@end

@implementation OSACrashAccumulator

- (OSACrashAccumulator)initWithTargetAppVersions:(id)a3 isBaseline:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___OSACrashAccumulator;
  v8 = -[OSAAccumulator init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    v8->_isBaseline = a4;
    objc_storeStrong((id *)&v8->_targetAppVersions, a3);
    if (a4) {
      v10 = 0LL;
    }
    else {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    }
    objc_storeStrong((id *)&v9->_firstPartyBundleIDs, v10);
    if (!a4) {

    }
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"0xdead10cc",  @"0x2bad45ec",  @"0x8badf00d",  0LL));
    terminationReasonCodeDenyList = v9->_terminationReasonCodeDenyList;
    v9->_terminationReasonCodeDenyList = (NSSet *)v11;
  }

  return v9;
}

- (NSSet)firstPartyBundleIDs
{
  if (self->_firstPartyBundleIDs) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:"));
  }
  else {
    v2 = 0LL;
  }
  return (NSSet *)v2;
}

- (BOOL)isValidEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 eventBody]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 terminationReason]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 namespaceName]);
  if ([v7 isEqualToString:@"LIBXPC"])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 eventBody]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 terminationReason]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 code]);
    unsigned __int8 v11 = [v10 isEqualToString:@"0x3"];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 eventBody]);
  LOBYTE(v6) = 0;
  if (([v12 isBeta] & 1) == 0 && (v11 & 1) == 0)
  {
    terminationReasonCodeDenyList = self->_terminationReasonCodeDenyList;
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v4 eventBody]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 terminationReason]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 code]);
    LODWORD(v6) = !-[NSSet containsObject:](terminationReasonCodeDenyList, "containsObject:", v16);
  }

  return (char)v6;
}

- (void)addEvent:(id)a3 withBundleID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v19 eventBody]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appVersion]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v19 eventBody]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleVersion]);
  id v11 = sub_10000D440((uint64_t)v8, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_targetAppVersions, "objectForKeyedSubscript:", v6));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[OSAAccumulator targetKey](self, "targetKey"));
  if (v14)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OSAAccumulator targetKey](self, "targetKey"));
  }

  unsigned int v15 = -[OSACrashAccumulator isValidEvent:](self, "isValidEvent:", v19);
  if (v12) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16 && ([v12 isEqualToString:v13] & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v19 eventBody]);
    if (![v17 isFirstParty])
    {

      if (v14) {
        goto LABEL_18;
      }
      goto LABEL_20;
    }

    BOOL v16 = !self->_isBaseline;
  }

  if (v14)
  {

    if (!v16) {
      goto LABEL_20;
    }
LABEL_14:
    [v19 timestamp];
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    -[OSAAccumulator addUnsignedInteger:forKey:onDate:](self, "addUnsignedInteger:forKey:onDate:", 1LL, v6, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v19 eventBody]);
    if ([v9 isFirstParty])
    {
      BOOL isBaseline = self->_isBaseline;

      if (!isBaseline) {
        -[NSMutableSet addObject:](self->_firstPartyBundleIDs, "addObject:", v6);
      }
      goto LABEL_19;
    }

- (void).cxx_destruct
{
}

@end