@interface TUJoinConversationRequest
- (CXJoinCallAction)joinCallAction;
@end

@implementation TUJoinConversationRequest

- (CXJoinCallAction)joinCallAction
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest remoteMembers](v2, "remoteMembers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest remoteMembers](v2, "remoteMembers"));
  id v6 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v55 + 1) + 8 * (void)i) handle]);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v10));
        [v4 addObject:v11];
      }

      id v7 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }

    while (v7);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest otherInvitedHandles](v2, "otherInvitedHandles"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v12 count]));

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest otherInvitedHandles](v2, "otherInvitedHandles", 0LL));
  id v15 = [v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v52;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[CXHandle handleWithTUHandle:]( &OBJC_CLASS___CXHandle,  "handleWithTUHandle:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)j)));
        [v13 addObject:v19];
      }

      id v16 = [v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }

    while (v16);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest conversationLink](v2, "conversationLink"));
  if (v20
    && (-[TUJoinConversationRequest isJoiningConversationWithLink](v2, "isJoiningConversationWithLink") & 1) == 0)
  {
    id v23 = (id)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest UUID](v2, "UUID"));
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest messagesGroupUUID](v2, "messagesGroupUUID"));
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest conversationLink](v2, "conversationLink"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 groupUUID]);
      v26 = v25;
      if (v25) {
        id v27 = v25;
      }
      else {
        id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      }
      id v23 = v27;
    }
  }

  v28 = objc_alloc(&OBJC_CLASS___CXJoinCallAction);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest UUID](v2, "UUID"));
  v30 = -[CXJoinCallAction initWithCallUUID:groupUUID:](v28, "initWithCallUUID:groupUUID:", v29, v23);

  if (v20)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v20 pseudonym]);
    -[CXJoinCallAction setPseudonym:](v30, "setPseudonym:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue([v20 publicKey]);
    -[CXJoinCallAction setPublicKey:](v30, "setPublicKey:", v32);
  }

  -[CXJoinCallAction setRemoteMembers:](v30, "setRemoteMembers:", v4);
  -[CXJoinCallAction setOtherInvitedHandles:](v30, "setOtherInvitedHandles:", v13);
  -[CXJoinCallAction setVideoEnabled:]( v30,  "setVideoEnabled:",  -[TUJoinConversationRequest isVideoEnabled](v2, "isVideoEnabled"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest activity](v2, "activity"));
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest activity](v2, "activity"));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[CXJoinCallActivity activityWithTUConversationActivity:]( &OBJC_CLASS___CXJoinCallActivity,  "activityWithTUConversationActivity:",  v34));
    -[CXJoinCallAction setJoinCallActivity:](v30, "setJoinCallActivity:", v35);
  }

  else
  {
    -[CXJoinCallAction setJoinCallActivity:](v30, "setJoinCallActivity:", 0LL);
  }

  -[CXJoinCallAction setVideo:](v30, "setVideo:", -[TUJoinConversationRequest isVideo](v2, "isVideo"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest callerID](v2, "callerID"));
  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest callerID](v2, "callerID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v37));
    -[CXJoinCallAction setCallerID:](v30, "setCallerID:", v38);
  }

  else
  {
    -[CXJoinCallAction setCallerID:](v30, "setCallerID:", 0LL);
  }

  -[CXJoinCallAction setAvMode:](v30, "setAvMode:", -[TUJoinConversationRequest avMode](v2, "avMode"));
  -[CXJoinCallAction setPresentationMode:]( v30,  "setPresentationMode:",  -[TUJoinConversationRequest presentationMode](v2, "presentationMode"));
  -[CXJoinCallAction setUplinkMuted:]( v30,  "setUplinkMuted:",  -[TUJoinConversationRequest isUplinkMuted](v2, "isUplinkMuted"));
  -[CXJoinCallAction setShouldSuppressInCallUI:]( v30,  "setShouldSuppressInCallUI:",  -[TUJoinConversationRequest shouldSuppressInCallUI](v2, "shouldSuppressInCallUI"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest messagesGroupUUID](v2, "messagesGroupUUID"));
  -[CXJoinCallAction setMessagesGroupUUID:](v30, "setMessagesGroupUUID:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest messagesGroupName](v2, "messagesGroupName"));
  -[CXJoinCallAction setMessagesGroupName:](v30, "setMessagesGroupName:", v40);

  -[CXJoinCallAction setWantsStagingArea:]( v30,  "setWantsStagingArea:",  -[TUJoinConversationRequest wantsStagingArea](v2, "wantsStagingArea"));
  -[CXJoinCallAction setLetMeIn:]( v30,  "setLetMeIn:",  -[TUJoinConversationRequest sendLetMeInRequest](v2, "sendLetMeInRequest"));
  -[CXJoinCallAction setJoiningConversationWithLink:]( v30,  "setJoiningConversationWithLink:",  -[TUJoinConversationRequest isJoiningConversationWithLink](v2, "isJoiningConversationWithLink"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest provider](v2, "provider"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier]);
  -[CXJoinCallAction setConversationProviderIdentifier:](v30, "setConversationProviderIdentifier:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest collaborationIdentifier](v2, "collaborationIdentifier"));
  -[CXJoinCallAction setCollaborationIdentifier:](v30, "setCollaborationIdentifier:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest invitationPreferences](v2, "invitationPreferences"));
  id v45 = [v44 count];

  if (v45)
  {
    id v46 = sub_1001704C4();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest invitationPreferences](v2, "invitationPreferences"));
      *(_DWORD *)buf = 138412290;
      v60 = v48;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Join request specifies invitation preferences: %@",  buf,  0xCu);
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[TUJoinConversationRequest notificationStylesByHandleType](v2, "notificationStylesByHandleType"));
    -[CXJoinCallAction setNotificationStylesByHandleType:](v30, "setNotificationStylesByHandleType:", v49);
  }

  -[CXJoinCallAction setRelay:]( v30,  "setRelay:",  -[TUJoinConversationRequest endpointOnCurrentDevice](v2, "endpointOnCurrentDevice") ^ 1);

  return v30;
}

@end