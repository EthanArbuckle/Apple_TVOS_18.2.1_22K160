@interface TUConversation
- (BOOL)anyActiveParticipantHasAV;
- (BOOL)isEligibleForCall;
- (BOOL)shouldAdvertiseConversationHandoff;
- (CXCallFailureContext)failureContext;
- (NSSet)activeRemoteParticipantCXHandles;
@end

@implementation TUConversation

- (BOOL)isEligibleForCall
{
  v3 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)anyActiveParticipantHasAV
{
  v3 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  if (-[TUFeatureFlags avLessSharePlayEnabled](v3, "avLessSharePlayEnabled"))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) audioVideoMode])
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }

        id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (NSSet)activeRemoteParticipantCXHandles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) handle]);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v10));
        [v4 addObject:v11];

        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = [v4 copy];
  return (NSSet *)v12;
}

- (CXCallFailureContext)failureContext
{
  return (CXCallFailureContext *)-[TUConversation conversationFailureContext](self, "conversationFailureContext");
}

- (BOOL)shouldAdvertiseConversationHandoff
{
  else {
    return -[TUConversation isContinuitySession](self, "isContinuitySession") ^ 1;
  }
}

@end