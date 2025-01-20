@interface IMSyndicationAction
- (void)addParametersToSendMessageDictionary:(id)a3;
@end

@implementation IMSyndicationAction

- (void)addParametersToSendMessageDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", 0LL));
  [v4 setObject:v5 forKeyedSubscript:IMSyndicationActionTypeKey_v1];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IMSyndicationAction syndicationActionType](self, "syndicationActionType")));
  [v4 setObject:v6 forKeyedSubscript:IMSyndicationActionTypeKey_v2];

  v7 = (void *)objc_opt_class(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMSyndicationAction syndicationStartDate](self, "syndicationStartDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 nanoSecondsFromDate:v8]);
  [v4 setObject:v9 forKeyedSubscript:IMSyndicationActionSyndicationDateKey];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IMSyndicationAction syndicatedItemType](self, "syndicatedItemType")));
  [v4 setObject:v10 forKeyedSubscript:IMSyndicationActionItemTypeKey];

  id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IMSyndicationAction version](self, "version")));
  [v4 setObject:v11 forKeyedSubscript:IMSyndicationActionVersionKey];
}

@end