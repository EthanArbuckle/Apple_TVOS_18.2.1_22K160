@interface TUCallCenter
+ (BOOL)isCurrentJoinedConservationGroupFaceTime;
+ (BOOL)isCurrentJoinedConversationSharePlayOnly;
+ (id)_joinedConversation;
@end

@implementation TUCallCenter

+ (BOOL)isCurrentJoinedConservationGroupFaceTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _joinedConversation]);
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 activeRemoteParticipants]);
  id v26 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v26)
  {
    uint64_t v5 = *(void *)v30;
    uint64_t v23 = *(void *)v30;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v5) {
        objc_enumerationMutation(v4);
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v6), "handle", v23));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteMembers]);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100026AB8;
      v27[3] = &unk_1003D10D8;
      id v9 = v7;
      id v28 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_firstObjectPassingTest:", v27));

      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 association]);
      if ([v11 type] == (id)2)
      {
        if ([v11 isPrimary])
        {
          unsigned __int8 v25 = -[NSMutableSet containsObject:](v3, "containsObject:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
          v13 = v4;
          v14 = v3;
          v15 = v2;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v2 localMember]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handle]);
          unsigned __int8 v24 = [v12 isEqualToHandle:v17];

          v2 = v15;
          v3 = v14;
          v4 = v13;
          uint64_t v5 = v23;

          if ((v25 & 1) == 0 && (v24 & 1) == 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
            -[NSMutableSet addObject:](v3, "addObject:", v18);
          }

          goto LABEL_13;
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
        -[NSMutableSet removeObject:](v3, "removeObject:", v19);
      }

      -[NSMutableSet addObject:](v3, "addObject:", v9);
LABEL_13:
      id v20 = -[NSMutableSet count](v3, "count");

      if ((unint64_t)v20 > 1)
      {
        BOOL v21 = 1;
        goto LABEL_18;
      }

      if (v26 == (id)++v6)
      {
        id v26 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v26) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v21 = 0;
LABEL_18:

  return v21;
}

+ (BOOL)isCurrentJoinedConversationSharePlayOnly
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _joinedConversation]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localMember]);
  unsigned __int8 v4 = [v3 isLightweightMember];

  return v4;
}

+ (id)_joinedConversation
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 conversationManager]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeConversations]);

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ([v8 state] == (id)3)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

@end