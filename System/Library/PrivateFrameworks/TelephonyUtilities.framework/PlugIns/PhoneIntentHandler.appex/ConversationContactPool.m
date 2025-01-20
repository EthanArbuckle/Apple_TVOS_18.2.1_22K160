@interface ConversationContactPool
- (BOOL)callerPoolContainsOneOf:(id)a3;
- (BOOL)participantsPoolContainsOneOf:(id)a3;
- (ContactPool)callerPool;
- (ContactPool)participantsPool;
- (void)setCallerPool:(id)a3;
- (void)setParticipantsPool:(id)a3;
@end

@implementation ConversationContactPool

- (BOOL)callerPoolContainsOneOf:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationContactPool callerPool](self, "callerPool"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allContactIds]);

  id v7 = IntentHandlerDefaultLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ConversationContactPool: Searching for %@ in caller ContactPool: %@",  (uint8_t *)&v12,  0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationContactPool callerPool](self, "callerPool"));
  if (v9) {
    unsigned __int8 v10 = [v6 intersectsSet:v4];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)participantsPoolContainsOneOf:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationContactPool participantsPool](self, "participantsPool"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allContactIds]);

  id v7 = IntentHandlerDefaultLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ConversationContactPool: Searching for %@ in participants ContactPool: %@",  (uint8_t *)&v12,  0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationContactPool participantsPool](self, "participantsPool"));
  if (v9) {
    unsigned __int8 v10 = [v6 intersectsSet:v4];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (ContactPool)callerPool
{
  return self->_callerPool;
}

- (void)setCallerPool:(id)a3
{
}

- (ContactPool)participantsPool
{
  return self->_participantsPool;
}

- (void)setParticipantsPool:(id)a3
{
}

- (void).cxx_destruct
{
}

@end