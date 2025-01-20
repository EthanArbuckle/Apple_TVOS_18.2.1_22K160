@interface IMDChat
- (void)addGroupContextToSendMessageDictionary:(id)a3 callerID:(id)a4;
@end

@implementation IMDChat

- (void)addGroupContextToSendMessageDictionary:(id)a3 callerID:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMDChat groupID](self, "groupID"));
  [v7 setObject:v8 forKeyedSubscript:@"gid"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMDChat participants](self, "participants"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayByApplyingSelector:"ID"]);
  id v11 = [v10 mutableCopy];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 _stripFZIDPrefix]);
  [v11 addObject:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _URIsFromIDs]);
  [v7 setObject:v13 forKeyedSubscript:@"p"];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMDChat displayName](self, "displayName"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMDChat displayName](self, "displayName"));
    [v7 setObject:v15 forKeyedSubscript:@"n"];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMDChat properties](self, "properties"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"gv"]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"gv"]);
    [v7 setObject:v18 forKeyedSubscript:@"gv"];
  }

  uint64_t v19 = IMDChatGroupParticipantVersionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:IMDChatGroupParticipantVersionKey]);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v19]);
    [v7 setObject:v21 forKeyedSubscript:v19];
  }

  [v22 setObject:v7 forKeyedSubscript:@"cprm"];
}

@end