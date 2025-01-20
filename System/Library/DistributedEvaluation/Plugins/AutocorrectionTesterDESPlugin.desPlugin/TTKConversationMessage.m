@interface TTKConversationMessage
+ (id)fromJsonDict:(id)a3;
+ (id)messageWithText:(id)a3 senderId:(id)a4;
- (NSString)senderId;
- (NSString)text;
- (id)toJsonDict;
@end

@implementation TTKConversationMessage

+ (id)messageWithText:(id)a3 senderId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___TTKConversationMessage);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_text, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (id)fromJsonDict:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"text"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"senderId"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TTKConversationMessage messageWithText:senderId:]( &OBJC_CLASS___TTKConversationMessage,  "messageWithText:senderId:",  v4,  v5));
  return v6;
}

- (id)toJsonDict
{
  v4[0] = @"text";
  v4[1] = @"senderId";
  senderId = self->_senderId;
  v5[0] = self->_text;
  v5[1] = senderId;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL));
}

- (NSString)text
{
  return self->_text;
}

- (NSString)senderId
{
  return self->_senderId;
}

- (void).cxx_destruct
{
}

@end