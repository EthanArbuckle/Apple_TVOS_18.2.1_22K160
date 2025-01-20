@interface TTKConversationTest
+ (id)fromJsonDict:(id)a3;
+ (id)testWithConversation:(id)a3 sendersToTest:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7;
- (BOOL)adaptToReceivedMessages;
- (BOOL)adaptToSentMessages;
- (NSArray)conversation;
- (NSSet)sendersToTest;
- (id)overridingJsonKeys:(id)a3;
- (id)toJsonDict;
- (unint64_t)warmupMessages;
@end

@implementation TTKConversationTest

+ (id)testWithConversation:(id)a3 sendersToTest:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = objc_alloc_init(&OBJC_CLASS___TTKConversationTest);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_conversation, a3);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
    sendersToTest = v15->_sendersToTest;
    v15->_sendersToTest = (NSSet *)v16;

    v15->_warmupMessages = a5;
    v15->_adaptToSentMessages = a6;
    v15->_adaptToReceivedMessages = a7;
  }

  return v15;
}

+ (id)fromJsonDict:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"warmupMessages"]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"warmupMessages"]);
    signed int v6 = [v5 intValue];

    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"conversation"]);
  v9 = sub_1A67C(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"sendersToTest"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"adaptToSentMessages"]);
  id v13 = [v12 BOOLValue];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"adaptToReceivedMessages"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TTKConversationTest testWithConversation:sendersToTest:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:]( TTKConversationTest,  "testWithConversation:sendersToTest:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:",  v10,  v11,  v7,  v13,  [v14 BOOLValue]));

  return v15;
}

- (id)toJsonDict
{
  v11[0] = @"conversation";
  id v3 = sub_1A7A8(self->_conversation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v12[0] = v4;
  v11[1] = @"sendersToTest";
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_sendersToTest, "allObjects"));
  v12[1] = v5;
  v11[2] = @"warmupMessages";
  signed int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", LODWORD(self->_warmupMessages)));
  v12[2] = v6;
  v11[3] = @"adaptToSentMessages";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_adaptToSentMessages));
  v12[3] = v7;
  v11[4] = @"adaptToReceivedMessages";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_adaptToReceivedMessages));
  v12[4] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  5LL));

  return v9;
}

- (id)overridingJsonKeys:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TTKConversationTest toJsonDict](self, "toJsonDict"));
  id v6 = [v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[TTKConversationTest fromJsonDict:](&OBJC_CLASS___TTKConversationTest, "fromJsonDict:", v6));

  return v7;
}

- (NSArray)conversation
{
  return self->_conversation;
}

- (NSSet)sendersToTest
{
  return self->_sendersToTest;
}

- (unint64_t)warmupMessages
{
  return self->_warmupMessages;
}

- (BOOL)adaptToSentMessages
{
  return self->_adaptToSentMessages;
}

- (BOOL)adaptToReceivedMessages
{
  return self->_adaptToReceivedMessages;
}

- (void).cxx_destruct
{
}

@end