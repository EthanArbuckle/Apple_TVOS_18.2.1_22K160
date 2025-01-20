@interface CSDIDSGroupSession
- (BOOL)isJoined;
- (BOOL)isUnderlyingLinksConnected;
- (CSDConversationServerBag)serverBag;
- (CSDIDSGroupSession)initWithGroupSessionProvider:(id)a3;
- (CSDIDSGroupSession)initWithGroupSessionProvider:(id)a3 featureFlags:(id)a4;
- (CSDIDSGroupSessionDelegate)delegate;
- (CSDIDSGroupSessionProvider)sessionProvider;
- (NSArray)participantDestinationIDs;
- (NSMutableDictionary)preferences;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)idsDestination;
- (TUFeatureFlags)featureFlags;
- (id)_updateParticipantDestinationIDForParticipant:(id)a3 members:(id)a4;
- (id)idsDestinationForActiveParticipant:(id)a3;
- (unint64_t)callTypeForJoinContext:(id)a3;
- (unint64_t)lightweightRetryCount;
- (unint64_t)localParticipantIdentifier;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unint64_t)retryCount;
- (unsigned)localParticipantType;
- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4;
- (void)addMembers:(id)a3 toExistingMembers:(id)a4 activeParticipants:(id)a5 activitySessions:(id)a6 link:(id)a7 otherInvitedHandles:(id)a8 report:(id)a9 invitationPreferences:(id)a10 requiredCapabilities:(id)a11 messagesGroupUUID:(id)a12 messagesGroupName:(id)a13 addingFromLetMeIn:(BOOL)a14 triggeredLocally:(BOOL)a15 highlightIdentifier:(id)a16 stagedActivitySession:(id)a17 avMode:(unint64_t)a18;
- (void)addMembers:(id)a3 toExistingMembers:(id)a4 participantDestinationIDs:(id)a5 webDestinationIDs:(id)a6 activeParticipants:(id)a7 activitySessions:(id)a8 link:(id)a9 otherInvitedHandles:(id)a10 report:(id)a11 invitationPreferences:(id)a12;
- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)allowMember:(id)a3;
- (void)joinUsingContext:(id)a3 localParticipantAVCData:(id)a4 members:(id)a5 otherInvitedHandles:(id)a6 participantDestinationIDs:(id)a7 link:(id)a8 report:(id)a9 stagedActivitySession:(id)a10 personaHandshakeBlob:(id)a11 activitySession:(id)a12;
- (void)kickMember:(id)a3;
- (void)leaveGroupSessionWithContext:(id)a3;
- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5;
- (void)reconnect;
- (void)registerPluginWithOptions:(id)a3;
- (void)removeMembers:(id)a3 fromExistingMembers:(id)a4 activeParticipants:(id)a5 triggeredLocally:(BOOL)a6;
- (void)requestActiveParticipants;
- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4;
- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4;
- (void)restart;
- (void)sendLocalParticipant:(id)a3;
- (void)sessionProvider:(id)a3 didJoinGroupWithParticipantIdentifiers:(id)a4 localParticipantIdentifier:(unint64_t)a5 error:(id)a6;
- (void)sessionProvider:(id)a3 didLeaveGroupWithError:(id)a4;
- (void)sessionProvider:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5;
- (void)sessionProvider:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5;
- (void)sessionProvider:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6;
- (void)sessionProvider:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5;
- (void)sessionProvider:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)sessionProvider:(id)a3 didReceiveKickedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7;
- (void)sessionProvider:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)sessionProvider:(id)a3 didReceiveLocalParticipantType:(unsigned __int16)a4 error:(id)a5;
- (void)sessionProvider:(id)a3 didReceiveReport:(id)a4;
- (void)sessionProvider:(id)a3 didReceiveServerErrorCode:(unsigned int)a4;
- (void)sessionProvider:(id)a3 didReceiveUnderlyingLinksStatus:(BOOL)a4;
- (void)sessionProvider:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)sessionProvider:(id)a3 didUnregisterPluginAllocationInfo:(id)a4;
- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5;
- (void)sessionProviderDidReceiveKeyUpdate:(id)a3;
- (void)sessionProviderDidTerminate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setJoined:(BOOL)a3;
- (void)setLightweightRetryCount:(unint64_t)a3;
- (void)setLocalParticipantIdentifier:(unint64_t)a3;
- (void)setLocalParticipantType:(unsigned __int16)a3;
- (void)setParticipantType:(unsigned __int16)a3 forParticipant:(id)a4 members:(id)a5 isLocalParticipant:(BOOL)a6;
- (void)setRetryCount:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setServerBag:(id)a3;
- (void)updateLocalParticipantInfo:(id)a3;
@end

@implementation CSDIDSGroupSession

- (CSDIDSGroupSession)initWithGroupSessionProvider:(id)a3 featureFlags:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSDIDSGroupSession;
  v9 = -[CSDIDSSession initWithSessionProvider:](&v18, "initWithSessionProvider:", v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureFlags, a4);
    v10->_localParticipantType = (unsigned __int16)[v7 isAVLess] ^ 1;
    objc_storeStrong((id *)&v10->_sessionProvider, a3);
    -[CSDIDSGroupSessionProvider setDelegate:](v10->_sessionProvider, "setDelegate:", v10);
    v11 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    serverBag = v10->_serverBag;
    v10->_serverBag = (CSDConversationServerBag *)v11;

    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](v10, "sessionProvider"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clientUUIDString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v15,  IDSSessionClientUUIDKey);

    preferences = v10->_preferences;
    v10->_preferences = v13;
  }

  return v10;
}

- (CSDIDSGroupSession)initWithGroupSessionProvider:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  v6 = -[CSDIDSGroupSession initWithGroupSessionProvider:featureFlags:]( self,  "initWithGroupSessionProvider:featureFlags:",  v4,  v5);

  return v6;
}

- (NSString)idsDestination
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 destination]);

  return (NSString *)v3;
}

- (NSArray)participantDestinationIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 participantDestinationIDs]);

  return (NSArray *)v3;
}

- (void)joinUsingContext:(id)a3 localParticipantAVCData:(id)a4 members:(id)a5 otherInvitedHandles:(id)a6 participantDestinationIDs:(id)a7 link:(id)a8 report:(id)a9 stagedActivitySession:(id)a10 personaHandshakeBlob:(id)a11 activitySession:(id)a12
{
  id v18 = a3;
  id v116 = a4;
  id v19 = a8;
  id v20 = a9;
  v21 = self;
  id v117 = a12;
  id v22 = a10;
  id v112 = a7;
  id v23 = a6;
  id v24 = a5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](v21, "sessionProvider"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession preferences](v21, "preferences"));
  [v25 setPreferences:v26];

  v27 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext);
  -[CSDMessagingConversationParticipantDidJoinContext setTuConversationMembers:](v27, "setTuConversationMembers:", v24);

  -[CSDMessagingConversationParticipantDidJoinContext setOtherInvitedTUHandles:](v27, "setOtherInvitedTUHandles:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v18 messagesGroupUUID]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
  -[CSDMessagingConversationParticipantDidJoinContext setMessagesGroupUUIDString:]( v27,  "setMessagesGroupUUIDString:",  v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue([v18 messagesGroupName]);
  -[CSDMessagingConversationParticipantDidJoinContext setMessagesGroupName:](v27, "setMessagesGroupName:", v30);

  -[CSDMessagingConversationParticipantDidJoinContext setIsMomentsAvailable:]( v27,  "setIsMomentsAvailable:",  [v18 isMomentsAvailable]);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](v21, "featureFlags"));
  if ([v31 groupFacetimeAsAServiceEnabled])
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v18 provider]);
    -[CSDMessagingConversationParticipantDidJoinContext setIsScreenSharingAvailable:]( v27,  "setIsScreenSharingAvailable:",  [v32 supportsSharePlay]);
  }

  else
  {
    -[CSDMessagingConversationParticipantDidJoinContext setIsScreenSharingAvailable:]( v27,  "setIsScreenSharingAvailable:",  1LL);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](v21, "featureFlags"));
  if ([v33 groupFacetimeAsAServiceEnabled])
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v18 provider]);
    -[CSDMessagingConversationParticipantDidJoinContext setIsGondolaCallingAvailable:]( v27,  "setIsGondolaCallingAvailable:",  [v34 supportsLinks]);
  }

  else
  {
    -[CSDMessagingConversationParticipantDidJoinContext setIsGondolaCallingAvailable:]( v27,  "setIsGondolaCallingAvailable:",  1LL);
  }

  if ([v18 isVideo])
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](v21, "featureFlags"));
    if ([v35 groupFacetimeAsAServiceEnabled])
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v18 provider]);
      -[CSDMessagingConversationParticipantDidJoinContext setVideo:]( v27,  "setVideo:",  [v36 supportsVideo]);
    }

    else
    {
      -[CSDMessagingConversationParticipantDidJoinContext setVideo:](v27, "setVideo:", 1LL);
    }
  }

  else
  {
    -[CSDMessagingConversationParticipantDidJoinContext setVideo:](v27, "setVideo:", 0LL);
  }

  if ([v18 isVideoEnabled])
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](v21, "featureFlags"));
    if ([v37 groupFacetimeAsAServiceEnabled])
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v18 provider]);
      -[CSDMessagingConversationParticipantDidJoinContext setVideoEnabled:]( v27,  "setVideoEnabled:",  [v38 supportsVideo]);
    }

    else
    {
      -[CSDMessagingConversationParticipantDidJoinContext setVideoEnabled:](v27, "setVideoEnabled:", 1LL);
    }
  }

  else
  {
    -[CSDMessagingConversationParticipantDidJoinContext setVideoEnabled:](v27, "setVideoEnabled:", 0LL);
  }

  -[CSDMessagingConversationParticipantDidJoinContext setSupportsLeaveContext:](v27, "setSupportsLeaveContext:", 1LL);
  -[CSDMessagingConversationParticipantDidJoinContext setSupportsRequestToScreenShare:]( v27,  "setSupportsRequestToScreenShare:",  [v18 supportsRequestToScreenShare]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsPersonaAvailable:]( v27,  "setIsPersonaAvailable:",  [v18 isPersonaAvailable]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsGFTDowngradeToOneToOneAvailable:]( v27,  "setIsGFTDowngradeToOneToOneAvailable:",  [v18 isGFTDowngradeToOneToOneAvailable]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsUPlusNDowngradeAvailable:]( v27,  "setIsUPlusNDowngradeAvailable:",  [v18 isUPlusNDowngradeAvailable]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v18 provider]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 identifier]);
  -[CSDMessagingConversationParticipantDidJoinContext setProviderIdentifier:](v27, "setProviderIdentifier:", v40);

  id v41 = -[CSDMessagingConversationParticipantDidJoinContext setSharePlayProtocolVersion:]( v27,  "setSharePlayProtocolVersion:",  TUSharePlayProtocolVersion( -[CSDMessagingConversationParticipantDidJoinContext setIsLightweight:]( v27,  "setIsLightweight:",  [v18 isLightweight])));
  id v42 = -[CSDMessagingConversationParticipantDidJoinContext setVisionFeatureVersion:]( v27,  "setVisionFeatureVersion:",  TUVisionFeatureVersion(v41));
  -[CSDMessagingConversationParticipantDidJoinContext setVisionCallEstablishmentVersion:]( v27,  "setVisionCallEstablishmentVersion:",  TUVisionCallEstablishmentVersion(v42));
  -[CSDMessagingConversationParticipantDidJoinContext setIsUPlusOneVisionToVisionAvailable:]( v27,  "setIsUPlusOneVisionToVisionAvailable:",  [v18 isUPlusOneVisionToVisionAvailable]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v18 collaborationIdentifier]);
  -[CSDMessagingConversationParticipantDidJoinContext setCollaborationIdentifier:]( v27,  "setCollaborationIdentifier:",  v43);

  -[CSDMessagingConversationParticipantDidJoinContext setIsUPlusOneScreenSharingAvailable:]( v27,  "setIsUPlusOneScreenSharingAvailable:",  [v18 isUPlusOneScreenShareAvailable]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsSpatialPersonaEnabled:]( v27,  "setIsSpatialPersonaEnabled:",  [v18 isSpatialPersonaEnabled]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsPhotosSharePlayAvailable:]( v27,  "setIsPhotosSharePlayAvailable:",  TUIsPhotosSharePlayAvailable( -[CSDMessagingConversationParticipantDidJoinContext setIsUPlusOneAVLessAvailable:]( v27,  "setIsUPlusOneAVLessAvailable:",  [v18 isUPlusOneAVLessAvailable])));
  uint64_t v44 = objc_claimAutoreleasedReturnValue([v18 screenSharingRequest]);
  if (v44)
  {
    v45 = (void *)v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](v21, "featureFlags"));
    unsigned int v47 = [v46 usesModernScreenSharingFromMessages];

    if (v47)
    {
      v48 = objc_alloc(&OBJC_CLASS___CSDMessagingScreenShareContext);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v18 screenSharingRequest]);
      id v50 = -[CSDMessagingScreenShareContext initOutgoingRequestWithScreenSharingRequest:]( v48,  "initOutgoingRequestWithScreenSharingRequest:",  v49);
      -[CSDMessagingConversationParticipantDidJoinContext setScreenSharingRequest:]( v27,  "setScreenSharingRequest:",  v50);
    }
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](v21, "featureFlags"));
  if ([v51 conversationHandoffEnabled])
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue([v18 participantAssociation]);

    if (!v52) {
      goto LABEL_26;
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue([v18 participantAssociation]);
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipantAssociation participantAssociationWithTUConversationParticipantAssociation:]( &OBJC_CLASS___CSDMessagingConversationParticipantAssociation,  "participantAssociationWithTUConversationParticipantAssociation:",  v51));
    -[CSDMessagingConversationParticipantDidJoinContext setParticipantAssociation:]( v27,  "setParticipantAssociation:",  v53);
  }

LABEL_26:
  v54 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationMessage);
  v55 = -[CSDMessagingConversationReport initWithTUConversationReport:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationReport),  "initWithTUConversationReport:",  v20);
  -[CSDMessagingConversationMessage setReportData:](v54, "setReportData:", v55);

  -[CSDMessagingConversationMessage setStagedActivitySession:](v54, "setStagedActivitySession:", v22);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](v21, "featureFlags"));
  unsigned int v57 = [v56 avLessSharePlayEnabled];

  if (v57)
  {
    uint64_t v58 = (uint64_t)[v18 avMode];
  }

  else if ([v18 isVideo])
  {
    uint64_t v58 = 2LL;
  }

  else
  {
    uint64_t v58 = 1LL;
  }

  -[CSDMessagingConversationMessage setAvMode:](v54, "setAvMode:", v58);
  -[CSDMessagingConversationMessage setPresentationMode:]( v54,  "setPresentationMode:",  [v18 presentationMode]);
  if (v117) {
    -[CSDMessagingConversationMessage addActivitySessions:](v54, "addActivitySessions:", v117);
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue([v18 invitationPreferences]);
  id v60 = [v59 count];

  if (v60)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue([v18 invitationPreferences]);
    -[CSDMessagingConversationMessage setTUInvitationPreferences:](v54, "setTUInvitationPreferences:", v61);
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](v21, "featureFlags"));
  if ([v62 groupFacetimeAsAServiceEnabled])
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue([v18 provider]);
    unsigned __int8 v64 = [v63 supportsLinks];

    char v65 = v64 ^ 1;
  }

  else
  {
    char v65 = 0;
  }

  if (v19 && (v65 & 1) == 0)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationLink linkWithTUConversationLink:includeGroupUUID:]( &OBJC_CLASS___CSDMessagingConversationLink,  "linkWithTUConversationLink:includeGroupUUID:",  v19,  1LL));
    -[CSDMessagingConversationMessage setLink:](v54, "setLink:", v66);
  }

  if ([v18 isInvitation])
  {
    -[CSDMessagingConversationMessage setShouldSuppressInCallUI:]( v54,  "setShouldSuppressInCallUI:",  [v18 shouldSuppressInCallUI]);
  }

  else if ([v18 isUpgrade] {
         && (v67 = (void *)objc_claimAutoreleasedReturnValue([v18 upgradeSessionUUID]),
  }
             v67,
             v67))
  {
    -[CSDMessagingConversationMessage setType:](v54, "setType:", 2LL);
    v68 = (void *)objc_claimAutoreleasedReturnValue([v18 upgradeSessionUUID]);
    v69 = (void *)objc_claimAutoreleasedReturnValue([v68 UUIDString]);
    -[CSDMessagingConversationMessage setProtoUpgradeSessionUUID:](v54, "setProtoUpgradeSessionUUID:", v69);
  }

  else if ([v18 isOneToOneModeEnabled] && objc_msgSend(v18, "isInitiator"))
  {
    -[CSDMessagingConversationMessage setType:](v54, "setType:", 1LL);
  }

  -[CSDMessagingConversationParticipantDidJoinContext setMessage:](v27, "setMessage:", v54);
  else {
    id v70 = 0LL;
  }
  v111 = v54;
  v115 = v19;
  id v71 = sub_1001704C4();
  v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    else {
      v73 = @"NO";
    }
    *(_DWORD *)buf = 136315906;
    else {
      v74 = @"NO";
    }
    v121 = "-[CSDIDSGroupSession joinUsingContext:localParticipantAVCData:members:otherInvitedHandles:participantDestinat"
           "ionIDs:link:report:stagedActivitySession:personaHandshakeBlob:activitySession:]";
    if ((_DWORD)v70) {
      v75 = @"YES";
    }
    else {
      v75 = @"NO";
    }
    __int16 v122 = 2112;
    v123 = (void *)v73;
    __int16 v124 = 2112;
    v125 = v74;
    __int16 v126 = 2112;
    v127 = v75;
    _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "%s: isOneToOneModeEnabled: %@, isInitiator: %@, shouldHaveNewServerAllocation: %@",  buf,  0x2Au);
  }

  v114 = v20;

  id v76 = sub_1001704C4();
  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v121 = "-[CSDIDSGroupSession joinUsingContext:localParticipantAVCData:members:otherInvitedHandles:participantDestinat"
           "ionIDs:link:report:stagedActivitySession:personaHandshakeBlob:activitySession:]";
    __int16 v122 = 2112;
    v123 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "%s: Joining with participantJoinContext: %@",  buf,  0x16u);
  }

  v109 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext data](v27, "data"));
  uint64_t v108 = IDSGroupSessionClientContextDataKey;
  uint64_t v118 = IDSGroupSessionAllParticipantsKey;
  uint64_t v119 = IDSGroupSessionNoStreamsKey;
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v119,  &v118,  1LL));
  uint64_t v107 = IDSGroupSessionSubscribedStreamsKey;
  v78 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", TUMultiwayMaxConcurrentStreams());
  v106 = (void *)objc_claimAutoreleasedReturnValue(v78);
  uint64_t v105 = IDSGroupSessionMaxConcurrentStreamsKey;
  v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 isUpgrade]));
  uint64_t v103 = IDSGroupSessionJoinTypeKey;
  v113 = v21;
  v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSDIDSGroupSession callTypeForJoinContext:](v21, "callTypeForJoinContext:", v18)));
  uint64_t v101 = IDSGroupSessionCommandContextKey;
  v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v18 isOneToOneModeEnabled]));
  uint64_t v100 = IDSGroupSessionStartedAsUPlusOneKey;
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v70));
  v82 = (void *)objc_claimAutoreleasedReturnValue([v112 allObjects]);

  uint64_t v83 = IDSGroupSessionMessagesGroupMembersKey;
  v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v18 isInitiator]));
  uint64_t v85 = IDSGroupSessionIsInitiatorKey;
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v18 isScreening]));
  v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v109,  v108,  v102,  v107,  v106,  v105,  v104,  v103,  v79,  v101,  v80,  v100,  v81,  @"gs-new-server-allocation-key",  v82,  v83,  v84,  v85,  v86,  IDSGroupSessionCallScreeningMode,  0LL));

  v87 = v27;
  if (-[CSDMessagingConversationParticipantDidJoinContext isLightweight](v27, "isLightweight"))
  {
    v88 = objc_alloc_init(&OBJC_CLASS___NSData);
    v89 = v110;
    [v110 setObject:v88 forKeyedSubscript:IDSSessionParticipantDataKey];

    v90 = v116;
  }

  else
  {
    v89 = v110;
    v90 = v116;
    [v110 setObject:v116 forKeyedSubscript:IDSSessionParticipantDataKey];
  }

  v91 = (void *)objc_claimAutoreleasedReturnValue([v114 conversationID]);

  if (v91)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue([v114 conversationID]);
    [v89 setObject:v92 forKeyedSubscript:IDSGroupSessionConversationIDKey];
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue([v114 timebase]);

  if (v93)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue([v114 timebase]);
    [v89 setObject:v94 forKeyedSubscript:IDSGroupSessionTimeBaseKey];
  }

  v95 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationJoinContext:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationJoinContext:",  v87));
  [v95 setAvcData:v90];
  v96 = (void *)objc_claimAutoreleasedReturnValue([v95 data]);
  [v89 setObject:v96 forKeyedSubscript:IDSGroupSessionParticipantInfoKey];

  id v97 = sub_1001704C4();
  v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v121 = (const char *)v95;
    _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "joinUsingContext: sending dataBlob %@",  buf,  0xCu);
  }

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](v113, "sessionProvider"));
  [v99 joinWithOptions:v89];
}

- (void)removeMembers:(id)a3 fromExistingMembers:(id)a4 activeParticipants:(id)a5 triggeredLocally:(BOOL)a6
{
  uint64_t v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v40 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v12 = [v10 mutableCopy];
  [v12 minusSet:v9];
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  *(void *)(*((void *)&v49 + 1) + 8LL * (void)i)));
        [v11 addObject:v18];
      }

      id v15 = [v13 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }

    while (v15);
  }

  if ((_DWORD)v6)
  {
    unsigned int v36 = v6;
    id v37 = v10;
    v38 = v9;
    v35 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext);
    -[CSDMessagingConversationParticipantDidJoinContext setTuConversationMembers:]( v35,  "setTuConversationMembers:",  v13);
    id v19 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationMessage);
    -[CSDMessagingConversationMessage setType:](v19, "setType:", 19LL);
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v20 = v40;
    id v21 = [v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  v25));
          if ([v25 isLightweight]) {
            -[CSDMessagingConversationMessage addActiveLightweightParticipants:]( v19,  "addActiveLightweightParticipants:",  v26);
          }
          else {
            -[CSDMessagingConversationMessage addActiveParticipants:](v19, "addActiveParticipants:", v26);
          }
        }

        id v22 = [v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }

      while (v22);
    }

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v9 = v38;
    id v27 = v38;
    id v28 = [v27 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (k = 0LL; k != v29; k = (char *)k + 1)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  *(void *)(*((void *)&v41 + 1) + 8LL * (void)k)));
          -[CSDMessagingConversationMessage addRemovedMembers:](v19, "addRemovedMembers:", v32);
        }

        id v29 = [v27 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }

      while (v29);
    }

    -[CSDMessagingConversationParticipantDidJoinContext setMessage:](v35, "setMessage:", v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext data](v35, "data"));

    id v10 = v37;
    uint64_t v6 = v36;
  }

  else
  {
    v33 = 0LL;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v34 updateParticipantDestinationIDs:v11 withContextData:v33 triggeredLocally:v6];
}

- (void)addMembers:(id)a3 toExistingMembers:(id)a4 activeParticipants:(id)a5 activitySessions:(id)a6 link:(id)a7 otherInvitedHandles:(id)a8 report:(id)a9 invitationPreferences:(id)a10 requiredCapabilities:(id)a11 messagesGroupUUID:(id)a12 messagesGroupName:(id)a13 addingFromLetMeIn:(BOOL)a14 triggeredLocally:(BOOL)a15 highlightIdentifier:(id)a16 stagedActivitySession:(id)a17 avMode:(unint64_t)a18
{
  id v141 = a3;
  id v135 = a4;
  id v123 = a5;
  id v131 = a6;
  id v128 = a7;
  id v124 = a8;
  id v130 = a9;
  id v129 = a10;
  id v132 = a11;
  id v127 = a12;
  id v126 = a13;
  id v125 = a17;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v174 = 0u;
  __int128 v175 = 0u;
  __int128 v176 = 0u;
  __int128 v177 = 0u;
  id obj = v141;
  id v24 = [obj countByEnumeratingWithState:&v174 objects:v187 count:16];
  v142 = v23;
  if (v24)
  {
    id v25 = v24;
    char v139 = 0;
    char v134 = 0;
    uint64_t v26 = *(void *)v175;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v175 != v26) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v174 + 1) + 8LL * (void)i);
        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  v28));
        [v23 addObject:v29];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 handle]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 value]);
        unsigned int v32 = [v31 destinationIdIsPseudonym];

        if (v32)
        {
          [v140 addObject:v29];
        }

        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v28 handle]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 value]);
          unsigned int v35 = [v34 destinationIdIsTemporary];

          if (v35)
          {
            unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  v28));
            [v138 addObject:v36];
          }

          else
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
            v38 = (void *)objc_claimAutoreleasedReturnValue([v28 idsDestination]);
            unsigned int v39 = [v37 faceTimeMultiwayAvailabilityForDestination:v38];

            if (v39)
            {
              id v40 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
              __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v28 idsDestination]);
              unsigned __int8 v42 = [v40 isWebCapableFaceTimeAvailableForDestination:v41];

              v139 |= v42;
            }

            else
            {
              char v134 = 1;
            }
          }
        }

        uint64_t v23 = v142;
      }

      id v25 = [obj countByEnumeratingWithState:&v174 objects:v187 count:16];
    }

    while (v25);
  }

  else
  {
    char v139 = 0;
    char v134 = 0;
  }

  __int128 v172 = 0u;
  __int128 v173 = 0u;
  __int128 v170 = 0u;
  __int128 v171 = 0u;
  id v136 = v135;
  id v43 = [v136 countByEnumeratingWithState:&v170 objects:v186 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v171;
    do
    {
      for (j = 0LL; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v171 != v45) {
          objc_enumerationMutation(v136);
        }
        __int128 v47 = *(void **)(*((void *)&v170 + 1) + 8LL * (void)j);
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  v47));
        [v142 addObject:v48];
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 handle]);
        __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 value]);
        unsigned int v51 = [v50 destinationIdIsPseudonym];

        if (v51)
        {
          __int128 v52 = v140;
LABEL_26:
          [v52 addObject:v48];
          goto LABEL_28;
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue([v47 handle]);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v53 value]);
        unsigned int v55 = [v54 destinationIdIsTemporary];

        if (v55)
        {
          __int128 v52 = v138;
          goto LABEL_26;
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
        unsigned int v57 = (void *)objc_claimAutoreleasedReturnValue([v47 idsDestination]);
        [v56 faceTimeMultiwayAvailabilityForDestination:v57];

        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
        v59 = (void *)objc_claimAutoreleasedReturnValue([v47 idsDestination]);
        int v60 = [v58 isWebCapableFaceTimeAvailableForDestination:v59];

        v139 |= v60;
LABEL_28:
      }

      id v44 = [v136 countByEnumeratingWithState:&v170 objects:v186 count:16];
    }

    while (v44);
  }

  BOOL v61 = a15;
  if (a15)
  {
    v62 = v123;
    if ([v138 count])
    {
      if ((v139 & 1) != 0)
      {
        -[CSDIDSGroupSession addMembers:toExistingMembers:participantDestinationIDs:webDestinationIDs:activeParticipants:activitySessions:link:otherInvitedHandles:report:invitationPreferences:]( self,  "addMembers:toExistingMembers:participantDestinationIDs:webDestinationIDs:activeParticipants:activitySessions:l ink:otherInvitedHandles:report:invitationPreferences:",  obj,  v136,  v142,  v138,  v123,  v131,  v128,  v124,  v130,  v129);
      }

      else if ((v134 & 1) != 0)
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v142 count]));
        __int128 v166 = 0u;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v169 = 0u;
        id v67 = v142;
        id v68 = [v67 countByEnumeratingWithState:&v166 objects:v185 count:16];
        if (v68)
        {
          id v69 = v68;
          uint64_t v70 = *(void *)v167;
          do
          {
            for (k = 0LL; k != v69; k = (char *)k + 1)
            {
              if (*(void *)v167 != v70) {
                objc_enumerationMutation(v67);
              }
              v72 = *(void **)(*((void *)&v166 + 1) + 8LL * (void)k);
              if (([v138 containsObject:v72] & 1) == 0)
              {
                v73 = (void *)objc_claimAutoreleasedReturnValue([v72 destinationURIs]);
                v74 = (void *)objc_claimAutoreleasedReturnValue([v73 allObjects]);
                [v66 addObjectsFromArray:v74];
              }
            }

            id v69 = [v67 countByEnumeratingWithState:&v166 objects:v185 count:16];
          }

          while (v69);
        }

        id v75 = sub_1001704C4();
        id v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v182 = (const char *)v66;
          _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "Querying for capabilities of call members using native destinations: %@",  buf,  0xCu);
        }

        v77 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDSLookupManager sharedManager](&OBJC_CLASS___TUIDSLookupManager, "sharedManager"));
        v155[0] = _NSConcreteStackBlock;
        v155[1] = 3221225472LL;
        v155[2] = sub_10011E9C8;
        v155[3] = &unk_1003DA848;
        v155[4] = self;
        id v156 = obj;
        id v157 = v136;
        id v158 = v67;
        id v159 = v138;
        id v160 = v123;
        id v161 = v131;
        id v162 = v128;
        id v163 = v124;
        id v164 = v130;
        id v165 = v129;
        [v77 queryHasWebOnlyEndpointsForDestinations:v66 completionBlock:v155];
      }
    }

    v78 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext);
    -[CSDMessagingConversationParticipantDidJoinContext setTuConversationMembers:]( v78,  "setTuConversationMembers:",  v136);
    -[CSDMessagingConversationParticipantDidJoinContext setIsScreenSharingAvailable:]( v78,  "setIsScreenSharingAvailable:",  1LL);
    id v79 = -[CSDMessagingConversationParticipantDidJoinContext setSharePlayProtocolVersion:]( v78,  "setSharePlayProtocolVersion:",  TUSharePlayProtocolVersion( -[CSDMessagingConversationParticipantDidJoinContext setIsGondolaCallingAvailable:]( v78,  "setIsGondolaCallingAvailable:",  1LL)));
    id v80 = -[CSDMessagingConversationParticipantDidJoinContext setVisionFeatureVersion:]( v78,  "setVisionFeatureVersion:",  TUVisionFeatureVersion(v79));
    id v81 = -[CSDMessagingConversationParticipantDidJoinContext setVisionCallEstablishmentVersion:]( v78,  "setVisionCallEstablishmentVersion:",  TUVisionCallEstablishmentVersion(v80));
    -[CSDMessagingConversationParticipantDidJoinContext setIsPhotosSharePlayAvailable:]( v78,  "setIsPhotosSharePlayAvailable:",  TUIsPhotosSharePlayAvailable(v81));
    -[CSDMessagingConversationParticipantDidJoinContext setMessagesGroupName:](v78, "setMessagesGroupName:", v126);
    v82 = (void *)objc_claimAutoreleasedReturnValue([v127 UUIDString]);
    -[CSDMessagingConversationParticipantDidJoinContext setMessagesGroupUUIDString:]( v78,  "setMessagesGroupUUIDString:",  v82);

    uint64_t v83 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationMessage);
    v84 = -[CSDMessagingConversationReport initWithTUConversationReport:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationReport),  "initWithTUConversationReport:",  v130);
    -[CSDMessagingConversationMessage setReportData:](v83, "setReportData:", v84);

    id v85 = sub_1001704C4();
    v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage reportData](v83, "reportData"));
      *(_DWORD *)buf = 136315394;
      v182 = "-[CSDIDSGroupSession addMembers:toExistingMembers:activeParticipants:activitySessions:link:otherInvitedHand"
             "les:report:invitationPreferences:requiredCapabilities:messagesGroupUUID:messagesGroupName:addingFromLetMeIn"
             ":triggeredLocally:highlightIdentifier:stagedActivitySession:avMode:]";
      __int16 v183 = 2112;
      v184 = v87;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%s: Conversation report = %@", buf, 0x16u);
    }

    -[CSDMessagingConversationMessage setType:](v83, "setType:", 3LL);
    __int128 v153 = 0u;
    __int128 v154 = 0u;
    __int128 v151 = 0u;
    __int128 v152 = 0u;
    id v88 = v123;
    id v89 = [v88 countByEnumeratingWithState:&v151 objects:v180 count:16];
    if (v89)
    {
      id v90 = v89;
      uint64_t v91 = *(void *)v152;
      do
      {
        for (m = 0LL; m != v90; m = (char *)m + 1)
        {
          if (*(void *)v152 != v91) {
            objc_enumerationMutation(v88);
          }
          v93 = *(void **)(*((void *)&v151 + 1) + 8LL * (void)m);
          v94 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  v93));
          if ([v93 isLightweight]) {
            -[CSDMessagingConversationMessage addActiveLightweightParticipants:]( v83,  "addActiveLightweightParticipants:",  v94);
          }
          else {
            -[CSDMessagingConversationMessage addActiveParticipants:](v83, "addActiveParticipants:", v94);
          }
        }

        id v90 = [v88 countByEnumeratingWithState:&v151 objects:v180 count:16];
      }

      while (v90);
    }

    __int128 v149 = 0u;
    __int128 v150 = 0u;
    __int128 v147 = 0u;
    __int128 v148 = 0u;
    id v95 = obj;
    id v96 = [v95 countByEnumeratingWithState:&v147 objects:v179 count:16];
    if (v96)
    {
      id v97 = v96;
      uint64_t v98 = *(void *)v148;
      do
      {
        for (n = 0LL; n != v97; n = (char *)n + 1)
        {
          if (*(void *)v148 != v98) {
            objc_enumerationMutation(v95);
          }
          uint64_t v100 = *(void **)(*((void *)&v147 + 1) + 8LL * (void)n);
          unsigned int v101 = [v100 isLightweightMember];
          v102 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v100));
          if (v101) {
            -[CSDMessagingConversationMessage addLightweightMembers:](v83, "addLightweightMembers:", v102);
          }
          else {
            -[CSDMessagingConversationMessage addAddedMembers:](v83, "addAddedMembers:", v102);
          }
        }

        id v97 = [v95 countByEnumeratingWithState:&v147 objects:v179 count:16];
      }

      while (v97);
    }

    __int128 v145 = 0u;
    __int128 v146 = 0u;
    __int128 v143 = 0u;
    __int128 v144 = 0u;
    id v103 = v131;
    id v104 = [v103 countByEnumeratingWithState:&v143 objects:v178 count:16];
    unsigned __int8 v64 = v128;
    if (v104)
    {
      id v105 = v104;
      uint64_t v106 = *(void *)v144;
      do
      {
        for (ii = 0LL; ii != v105; ii = (char *)ii + 1)
        {
          if (*(void *)v144 != v106) {
            objc_enumerationMutation(v103);
          }
          -[CSDMessagingConversationMessage addActivitySessions:]( v83,  "addActivitySessions:",  *(void *)(*((void *)&v143 + 1) + 8LL * (void)ii));
        }

        id v105 = [v103 countByEnumeratingWithState:&v143 objects:v178 count:16];
      }

      while (v105);
    }

    if (v128)
    {
      uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationLink linkWithTUConversationLink:includeGroupUUID:]( &OBJC_CLASS___CSDMessagingConversationLink,  "linkWithTUConversationLink:includeGroupUUID:",  v128,  1LL));
      -[CSDMessagingConversationMessage setLink:](v83, "setLink:", v108);

      v109 = (void *)objc_claimAutoreleasedReturnValue([v128 groupUUID]);
      -[CSDMessagingConversationMessage setConversationGroupUUID:](v83, "setConversationGroupUUID:", v109);
    }

    if (v129) {
      -[CSDMessagingConversationMessage setTUInvitationPreferences:](v83, "setTUInvitationPreferences:");
    }
    if (a14) {
      -[CSDMessagingConversationMessage setIsLetMeInApproved:](v83, "setIsLetMeInApproved:", 1LL);
    }
    -[CSDMessagingConversationMessage setStagedActivitySession:](v83, "setStagedActivitySession:", v125);
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](self, "featureFlags"));
    unsigned int v111 = [v110 avLessSharePlayEnabled];

    if (v111) {
      -[CSDMessagingConversationMessage setAvMode:](v83, "setAvMode:", a18);
    }
    -[CSDMessagingConversationParticipantDidJoinContext setMessage:](v78, "setMessage:", v83);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext data](v78, "data"));

    char v65 = v132;
    BOOL v61 = a15;
  }

  else
  {
    v63 = 0LL;
    v62 = v123;
    unsigned __int8 v64 = v128;
    char v65 = v132;
  }

  if ([v140 count])
  {
    if ([v65 count]) {
      id v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v65));
    }
    else {
      id v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    }
    v113 = v112;
    [v112 addObject:IDSRegistrationPropertySupportsModernGFT];
    -[CSDIDSGroupSession addRequiredCapabilities:requiredLackOfCapabilities:]( self,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v113,  0LL);

    char v65 = v132;
  }

  if (v61 && ([v138 count] || objc_msgSend(v140, "count")))
  {
    if ([v65 count]) {
      v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v65));
    }
    else {
      v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    }
    uint64_t v118 = v114;
    [v114 addObject:IDSRegistrationPropertySupportsGondola];
    [v118 addObject:IDSRegistrationPropertySupportsModernGFT];
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
    __int16 v122 = (void *)objc_claimAutoreleasedReturnValue([v118 allObjects]);
    [v121 updateParticipantDestinationIDs:v142 withContextData:v63 requiredCapabilities:v122 requiredLackOfCapabilities:&__NSArray0__struct triggeredLocally:1];

    v120 = v129;
    uint64_t v119 = v142;
    id v117 = v132;
  }

  else
  {
    id v115 = [v65 count];
    id v116 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
    id v117 = v65;
    uint64_t v118 = v116;
    if (v115)
    {
      uint64_t v119 = v142;
      [v116 updateParticipantDestinationIDs:v142 withContextData:v63 requiredCapabilities:v117 requiredLackOfCapabilities:&__NSArray0__struct triggeredLocally:v61];
    }

    else
    {
      uint64_t v119 = v142;
      [v116 updateParticipantDestinationIDs:v142 withContextData:v63 triggeredLocally:v61];
    }

    v120 = v129;
  }
}

- (void)addMembers:(id)a3 toExistingMembers:(id)a4 participantDestinationIDs:(id)a5 webDestinationIDs:(id)a6 activeParticipants:(id)a7 activitySessions:(id)a8 link:(id)a9 otherInvitedHandles:(id)a10 report:(id)a11 invitationPreferences:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v87 = a5;
  id v86 = a7;
  id v85 = a8;
  id v18 = a9;
  id v84 = a10;
  id v83 = a11;
  id v82 = a12;
  id v88 = [v16 mutableCopy];
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  id obj = v16;
  id v19 = [obj countByEnumeratingWithState:&v106 objects:v116 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v107;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v107 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v106 + 1) + 8LL * (void)i);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 handle]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 value]);
        unsigned int v26 = [v25 destinationIdIsTemporary];

        if (v26) {
          [v88 removeObject:v23];
        }
      }

      id v20 = [obj countByEnumeratingWithState:&v106 objects:v116 count:16];
    }

    while (v20);
  }

  if ([v88 count])
  {
    id v80 = v18;
    id v27 = [v17 mutableCopy];
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    id v28 = v17;
    id v29 = [v28 countByEnumeratingWithState:&v102 objects:v115 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v103;
      do
      {
        for (j = 0LL; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v103 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v102 + 1) + 8LL * (void)j);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 handle]);
          unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 value]);
          unsigned int v36 = [v35 destinationIdIsTemporary];

          if (v36) {
            [v27 removeObject:v33];
          }
        }

        id v30 = [v28 countByEnumeratingWithState:&v102 objects:v115 count:16];
      }

      while (v30);
    }

    id v37 = [v84 mutableCopy];
    v38 = (char *)[v27 count];
    if (&v38[(void)[v88 count]] <= (char *)2)
    {
      do
      {
        if (![v37 count]) {
          break;
        }
        unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v37 anyObject]);
        id v40 = -[TUConversationMember initWithHandle:]( objc_alloc(&OBJC_CLASS___TUConversationMember),  "initWithHandle:",  v39);
        [v88 addObject:v40];
        [v37 removeObject:v39];

        __int128 v41 = (char *)[v27 count];
      }

      while (&v41[(void)[v88 count]] < (char *)3);
    }

    v78 = v37;
    unsigned __int8 v42 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext);
    id v79 = v27;
    -[CSDMessagingConversationParticipantDidJoinContext setTuConversationMembers:]( v42,  "setTuConversationMembers:",  v27);
    -[CSDMessagingConversationParticipantDidJoinContext setIsScreenSharingAvailable:]( v42,  "setIsScreenSharingAvailable:",  1LL);
    id v43 = -[CSDMessagingConversationParticipantDidJoinContext setSharePlayProtocolVersion:]( v42,  "setSharePlayProtocolVersion:",  TUSharePlayProtocolVersion( -[CSDMessagingConversationParticipantDidJoinContext setIsGondolaCallingAvailable:]( v42,  "setIsGondolaCallingAvailable:",  1LL)));
    id v44 = -[CSDMessagingConversationParticipantDidJoinContext setVisionFeatureVersion:]( v42,  "setVisionFeatureVersion:",  TUVisionFeatureVersion(v43));
    id v45 = -[CSDMessagingConversationParticipantDidJoinContext setVisionCallEstablishmentVersion:]( v42,  "setVisionCallEstablishmentVersion:",  TUVisionCallEstablishmentVersion(v44));
    v77 = v42;
    -[CSDMessagingConversationParticipantDidJoinContext setIsPhotosSharePlayAvailable:]( v42,  "setIsPhotosSharePlayAvailable:",  TUIsPhotosSharePlayAvailable(v45));
    __int128 v46 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationMessage);
    __int128 v47 = -[CSDMessagingConversationReport initWithTUConversationReport:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationReport),  "initWithTUConversationReport:",  v83);
    -[CSDMessagingConversationMessage setReportData:](v46, "setReportData:", v47);

    -[CSDMessagingConversationMessage setType:](v46, "setType:", 3LL);
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    id v48 = v86;
    id v49 = [v48 countByEnumeratingWithState:&v98 objects:v114 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v99;
      do
      {
        for (k = 0LL; k != v50; k = (char *)k + 1)
        {
          if (*(void *)v99 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)k);
          v54 = (void *)objc_claimAutoreleasedReturnValue([v53 handle]);
          unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue([v54 value]);
          unsigned __int8 v56 = [v55 destinationIdIsTemporary];

          if ((v56 & 1) == 0)
          {
            unsigned int v57 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  v53));
            -[CSDMessagingConversationMessage addActiveParticipants:](v46, "addActiveParticipants:", v57);
          }
        }

        id v50 = [v48 countByEnumeratingWithState:&v98 objects:v114 count:16];
      }

      while (v50);
    }

    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    id v58 = v88;
    id v59 = [v58 countByEnumeratingWithState:&v94 objects:v113 count:16];
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v95;
      do
      {
        for (m = 0LL; m != v60; m = (char *)m + 1)
        {
          if (*(void *)v95 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)m);
          unsigned int v64 = [v63 isLightweightMember];
          char v65 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v63));
          if (v64) {
            -[CSDMessagingConversationMessage addLightweightMembers:](v46, "addLightweightMembers:", v65);
          }
          else {
            -[CSDMessagingConversationMessage addAddedMembers:](v46, "addAddedMembers:", v65);
          }
        }

        id v60 = [v58 countByEnumeratingWithState:&v94 objects:v113 count:16];
      }

      while (v60);
    }

    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    id v66 = v85;
    id v67 = [v66 countByEnumeratingWithState:&v90 objects:v112 count:16];
    if (v67)
    {
      id v68 = v67;
      uint64_t v69 = *(void *)v91;
      do
      {
        for (n = 0LL; n != v68; n = (char *)n + 1)
        {
          if (*(void *)v91 != v69) {
            objc_enumerationMutation(v66);
          }
          -[CSDMessagingConversationMessage addActivitySessions:]( v46,  "addActivitySessions:",  *(void *)(*((void *)&v90 + 1) + 8LL * (void)n));
        }

        id v68 = [v66 countByEnumeratingWithState:&v90 objects:v112 count:16];
      }

      while (v68);
    }

    id v18 = v80;
    if (v80)
    {
      id v71 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationLink linkWithTUConversationLink:includeGroupUUID:]( &OBJC_CLASS___CSDMessagingConversationLink,  "linkWithTUConversationLink:includeGroupUUID:",  v80,  1LL));
      -[CSDMessagingConversationMessage setLink:](v46, "setLink:", v71);

      v72 = (void *)objc_claimAutoreleasedReturnValue([v80 groupUUID]);
      -[CSDMessagingConversationMessage setConversationGroupUUID:](v46, "setConversationGroupUUID:", v72);
    }

    if (v82) {
      -[CSDMessagingConversationMessage setTUInvitationPreferences:](v46, "setTUInvitationPreferences:");
    }
    -[CSDMessagingConversationParticipantDidJoinContext setMessage:](v77, "setMessage:", v46);
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext data](v77, "data"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
    uint64_t v111 = IDSRegistrationPropertySupportsGondola;
    id v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v111, 1LL));
    uint64_t v110 = IDSRegistrationPropertySupportsModernGFT;
    id v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v110, 1LL));
    [v74 updateParticipantDestinationIDs:v87 withContextData:v73 requiredCapabilities:v75 requiredLackOfCapabilities:v76 triggeredLocally:1];
  }
}

- (void)sendLocalParticipant:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
  id v6 = [v5 copy];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v7 updateParticipantInfo:v6];

  [v11 setAvcData:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 avcData]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
  [v8 sendParticipantData:v9 withContext:v10];
}

- (void)updateLocalParticipantInfo:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
  [v4 updateParticipantInfo:v5];
}

- (void)requestActiveParticipants
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "requestActiveParticipants self: %@",  (uint8_t *)&v6,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v5 requestActiveParticipants];
}

- (void)leaveGroupSessionWithContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipantDidLeaveContext);
    -[CSDMessagingConversationParticipantDidLeaveContext setLeaveReason:]( v5,  "setLeaveReason:",  [v4 leaveReason]);
  }

  else
  {
    v5 = 0LL;
  }

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Leaving with participantLeaveContext: %@",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidLeaveContext data](v5, "data"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidLeaveContext data](v5, "data"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v9,  IDSGroupSessionClientContextDataKey,  0LL));
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v11 leaveWithOptions:v10];
}

- (void)registerPluginWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "registerPluginWithOptions:%@ self: %@",  (uint8_t *)&v8,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v7 registerPluginWithOptions:v4];
}

- (void)restart
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restart self: %@", (uint8_t *)&v6, 0xCu);
  }

  -[CSDIDSGroupSession setJoined:](self, "setJoined:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v5 restart];
}

- (void)reconnect
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "reconnect self: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v5 reconnect];
}

- (void)kickMember:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "member: %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDestinations]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v9 kickParticipants:v8];
}

- (void)allowMember:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "member: %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDestinations]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v9 allowParticipants:v8];
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "requestDataCryptorForTopic: %@ self: %@",  (uint8_t *)&v11,  0x16u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v10 requestDataCryptorForTopic:v6 completionHandler:v7];
}

- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "requestEncryptionKeyForParticipants: %@ topic: %@ self: %@",  (uint8_t *)&v11,  0x20u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v10 requestEncryptionKeyForParticipants:v6 topic:v7];
}

- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "addAliasesToConversationContainer: %@ salt: %@ self: %@",  (uint8_t *)&v11,  0x20u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v10 addAliasesToConversationContainer:v6 withSalt:v7];
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218498;
    unint64_t v13 = a3;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "participantIDForAlias: %llu salt: %@ self: %@",  (uint8_t *)&v12,  0x20u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  id v10 = [v9 participantIDForAlias:a3 salt:v6];

  return (unint64_t)v10;
}

- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    unint64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "participantIDForAlias: %llu salt: %@ self: %@",  (uint8_t *)&v13,  0x20u);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v12 participantIDForAlias:a3 salt:v8 completion:v9];
}

- (NSSet)requiredCapabilities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 requiredCapabilities]);

  return (NSSet *)v3;
}

- (NSSet)requiredLackOfCapabilities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 requiredLackOfCapabilities]);

  return (NSSet *)v3;
}

- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "addRequiredCapabilities: %@ requiredLackOfCapabilities: %@ self: %@",  (uint8_t *)&v11,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v10 addRequiredCapabilities:v6 requiredLackOfCapabilities:v7];
}

- (void)setParticipantType:(unsigned __int16)a3 forParticipant:(id)a4 members:(id)a5 isLocalParticipant:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_1001704C4();
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218754;
    uint64_t v19 = v8;
    id v14 = @"YES";
    __int16 v20 = 2112;
    if (!v6) {
      id v14 = @"NO";
    }
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "setParticipantType: %ld isLocalParticipant: %@, for forParticipant: %@, members: %@",  (uint8_t *)&v18,  0x2Au);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDIDSGroupSession _updateParticipantDestinationIDForParticipant:members:]( self,  "_updateParticipantDestinationIDForParticipant:members:",  v10,  v11));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  __int16 v17 = v16;
  if (v6) {
    [v16 setLocalParticipantType:v8 memberDestinations:v15];
  }
  else {
    [v16 setParticipantType:v8 forRemoteMemberDestinations:v15];
  }
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v3) {
      id v7 = @"YES";
    }
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSDIDSGroupSession: setScreening: %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession sessionProvider](self, "sessionProvider"));
  [v8 setScreening:v3];
}

- (id)_updateParticipantDestinationIDForParticipant:(id)a3 members:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession participantDestinationIDs](self, "participantDestinationIDs"));
  id v9 = [v8 mutableCopy];

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "participantDestinationIDs: %@", buf, 0xCu);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v33;
    *(void *)&__int128 v14 = 138412290LL;
    __int128 v31 = v14;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v12);
        }
        int v18 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "handle", v31));
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
        unsigned int v21 = [v19 isEqualToHandle:v20];

        if (v21)
        {
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  v18));
          if ([v9 containsObject:v22])
          {
            [v9 removeObject:v22];
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 tuConversationParticipant]);
            __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationParticipant:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationParticipant:",  v23));
            [v9 addObject:v24];

            id v25 = sub_1001704C4();
            unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 tuConversationParticipant]);
              *(_DWORD *)buf = 138412546;
              id v37 = v22;
              __int16 v38 = 2112;
              unsigned int v39 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "_updateParticipantDestinationIDForParticipant: remove: %@, add: %@",  buf,  0x16u);
            }
          }

          else
          {
            id v28 = sub_1001704C4();
            unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v31;
              id v37 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "_updateParticipantDestinationIDForParticipant: couldn't find idsDestination: %@",  buf,  0xCu);
            }
          }
        }
      }

      id v15 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v15);
  }

  id v29 = [v9 copy];
  return v29;
}

- (id)idsDestinationForActiveParticipant:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 participantPushToken]);
  if (v4
    && (id v5 = (void *)v4,
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 participantURI]),
        v6,
        v5,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 participantPushToken]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 participantURI]);
    id v9 = (void *)IDSCopyIDForTokenWithID(v7, v8);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 participantURI]);
  }

  return v9;
}

- (unint64_t)callTypeForJoinContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession featureFlags](self, "featureFlags"));
  if ([v5 groupFacetimeAsAServiceEnabled])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    unsigned int v7 = [v6 supportsVideo];
  }

  else
  {
    unsigned int v7 = 1;
  }

  else {
    unint64_t v8 = 2LL;
  }

  return v8;
}

- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sessionProvider: %@ reason: %d error: %@",  (uint8_t *)&v13,  0x1Cu);
  }

  -[CSDIDSGroupSession setJoined:](self, "setJoined:", 0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v12 session:self endedWithError:v9 reason:v6];
}

- (void)sessionProvider:(id)a3 didJoinGroupWithParticipantIdentifiers:(id)a4 localParticipantIdentifier:(unint64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = sub_1001704C4();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2048;
    unint64_t v32 = a5;
    __int16 v33 = 2112;
    id v34 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "sessionProvider: %@ participantIDs: %@ localParticipantID: %llu error: %@",  buf,  0x2Au);
  }

  -[CSDIDSGroupSession setLocalParticipantIdentifier:](self, "setLocalParticipantIdentifier:", a5);
  -[CSDIDSGroupSession setJoined:](self, "setJoined:", v12 == 0LL);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  int v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allValues", 0));
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      __int16 v20 = 0LL;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        [v15 addObjectsFromArray:*(void *)(*((void *)&v22 + 1) + 8 * (void)v20)];
        __int16 v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v18);
  }

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  objc_msgSend( v21,  "session:didJoinGroup:participantIdentifiers:error:",  self,  -[CSDIDSGroupSession isJoined](self, "isJoined"),  v15,  v12);
}

- (void)sessionProvider:(id)a3 didLeaveGroupWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "sessionProvider: %@ error: %@",  (uint8_t *)&v11,  0x16u);
  }

  -[CSDIDSGroupSession setJoined:](self, "setJoined:", 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v10 session:self didLeaveGroupWithError:v7];
}

- (void)sessionProvider:(id)a3 didReceiveLocalParticipantType:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sessionProvider: %@ participantType: %ld error: %@",  (uint8_t *)&v13,  0x20u);
  }

  if (!v9) {
    -[CSDIDSGroupSession setLocalParticipantType:](self, "setLocalParticipantType:", v6);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v12 session:self didReceiveLocalParticipantType:v6 error:v9];
}

- (void)sessionProviderDidTerminate:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "sessionProviderDidTerminate: %@",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v7 sessionDidTerminate:self];
}

- (void)sessionProvider:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    unint64_t v45 = (unint64_t)v8;
    __int16 v46 = 2112;
    id v47 = v9;
    __int16 v48 = 1024;
    BOOL v49 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sessionProvider: %@ activeParticipants: %@ success: %d",  buf,  0x1Cu);
  }

  if (v5)
  {
    id v37 = v8;
    -[CSDIDSGroupSession setRetryCount:](self, "setRetryCount:", 0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v9 count]));
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v36 = v9;
    id obj = v9;
    id v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(obj);
          }
          __int16 v17 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          uint64_t v18 = objc_claimAutoreleasedReturnValue( -[CSDIDSGroupSession idsDestinationForActiveParticipant:]( self,  "idsDestinationForActiveParticipant:",  v17));
          uint64_t v19 = self;
          __int16 v20 = (void *)v18;
          if (v18) {
            unsigned int v21 = (const __CFString *)v18;
          }
          else {
            unsigned int v21 = &stru_1003E7718;
          }
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v17 participantIdentifier]));
          [v12 setObject:v21 forKeyedSubscript:v22];

          self = v19;
        }

        id v14 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }

      while (v14);
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
    [v23 session:self receivedActiveParticipantDestinationsByIdentifier:v12];

    id v9 = v36;
    id v8 = v37;
  }

  else
  {
    id v24 = sub_1001704C4();
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received an error for active remote participants",  buf,  2u);
    }

    unint64_t v26 = -[CSDIDSGroupSession retryCount](self, "retryCount");
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession serverBag](self, "serverBag"));
    id v28 = [v27 maxActiveParticipantFetchRetries];

    if (v26 >= (unint64_t)v28)
    {
      id v32 = sub_1001704C4();
      __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession serverBag](self, "serverBag"));
        id v35 = [v34 maxActiveParticipantFetchRetries];
        *(_DWORD *)buf = 134217984;
        unint64_t v45 = (unint64_t)v35;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not retrying requestActiveParticipants, max retry count (%lu) reached",  buf,  0xCu);
      }
    }

    else
    {
      -[CSDIDSGroupSession setRetryCount:]( self,  "setRetryCount:",  (char *)-[CSDIDSGroupSession retryCount](self, "retryCount") + 1);
      id v29 = sub_1001704C4();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v31 = -[CSDIDSGroupSession retryCount](self, "retryCount");
        *(_DWORD *)buf = 134217984;
        unint64_t v45 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[WARN] Retrying requestActiveParticipants, retry_count=%lu",  buf,  0xCu);
      }

      -[CSDIDSGroupSession requestActiveParticipants](self, "requestActiveParticipants");
    }
  }
}

- (void)sessionProvider:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    unint64_t v45 = (unint64_t)v8;
    __int16 v46 = 2112;
    id v47 = v9;
    __int16 v48 = 1024;
    BOOL v49 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sessionProvider: %@ didReceiveActiveLightweightParticipants: %@ success: %d",  buf,  0x1Cu);
  }

  if (v5)
  {
    id v37 = v8;
    -[CSDIDSGroupSession setLightweightRetryCount:](self, "setLightweightRetryCount:", 0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v9 count]));
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v36 = v9;
    id obj = v9;
    id v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(obj);
          }
          __int16 v17 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          uint64_t v18 = objc_claimAutoreleasedReturnValue( -[CSDIDSGroupSession idsDestinationForActiveParticipant:]( self,  "idsDestinationForActiveParticipant:",  v17));
          uint64_t v19 = self;
          __int16 v20 = (void *)v18;
          if (v18) {
            unsigned int v21 = (const __CFString *)v18;
          }
          else {
            unsigned int v21 = &stru_1003E7718;
          }
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v17 participantIdentifier]));
          [v12 setObject:v21 forKeyedSubscript:v22];

          self = v19;
        }

        id v14 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }

      while (v14);
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
    [v23 session:self receivedActiveLightweightParticipantDestinationsByIdentifier:v12];

    id v9 = v36;
    id v8 = v37;
  }

  else
  {
    id v24 = sub_1001704C4();
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received an error for active remote participants",  buf,  2u);
    }

    unint64_t v26 = -[CSDIDSGroupSession lightweightRetryCount](self, "lightweightRetryCount");
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession serverBag](self, "serverBag"));
    id v28 = [v27 maxActiveParticipantFetchRetries];

    if (v26 >= (unint64_t)v28)
    {
      id v32 = sub_1001704C4();
      __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession serverBag](self, "serverBag"));
        id v35 = [v34 maxActiveParticipantFetchRetries];
        *(_DWORD *)buf = 134217984;
        unint64_t v45 = (unint64_t)v35;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not retrying requestActiveLightweightParticipants, max retry count (%lu) reached",  buf,  0xCu);
      }
    }

    else
    {
      -[CSDIDSGroupSession setLightweightRetryCount:]( self,  "setLightweightRetryCount:",  (char *)-[CSDIDSGroupSession lightweightRetryCount](self, "lightweightRetryCount") + 1);
      id v29 = sub_1001704C4();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v31 = -[CSDIDSGroupSession lightweightRetryCount](self, "lightweightRetryCount");
        *(_DWORD *)buf = 134217984;
        unint64_t v45 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[WARN] Retrying requestActiveLightweightParticipants, retry_count=%lu",  buf,  0xCu);
      }

      -[CSDIDSGroupSession requestActiveParticipants](self, "requestActiveParticipants");
    }
  }
}

- (void)sessionProvider:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sessionProvider: %@ didReceiveJoinedParticipantID: %llu clientContext: %@",  (uint8_t *)&v13,  0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v12 session:self didReceiveJoinedParticipantID:a4 withContext:v9];
}

- (void)sessionProvider:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sessionProvider: %@ didReceiveLeftParticipantID: %llu clientContext: %@",  (uint8_t *)&v13,  0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v12 session:self didReceiveLeftParticipantID:a4 withContext:v9];
}

- (void)sessionProvider:(id)a3 didReceiveReport:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v6 session:self didReceiveReport:v5];
}

- (void)sessionProvider:(id)a3 didReceiveKickedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v11 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v12 session:self didReceiveKickedParticipantIDs:v11 withCode:v9 withType:v8 isTruncated:v7];
}

- (void)sessionProvider:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v6 session:self didRegisterPluginAllocationInfo:v5];
}

- (void)sessionProvider:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v6 session:self didUnregisterPluginAllocationInfo:v5];
}

- (void)sessionProviderDidReceiveKeyUpdate:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate", a3));
  [v4 sessionDidReceiveKeyUpdate:self];
}

- (void)sessionProvider:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v9 session:self didReceiveDataBlob:v8 forParticipant:v7];
}

- (void)sessionProvider:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6
{
  uint64_t v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate"));
  [v11 session:self didReceiveData:v10 dataType:v6 forParticipant:v9];
}

- (void)sessionProvider:(id)a3 didReceiveServerErrorCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSession delegate](self, "delegate", a3));
  [v6 session:self didReceiveServerErrorCode:v4];
}

- (void)sessionProvider:(id)a3 didReceiveUnderlyingLinksStatus:(BOOL)a4
{
}

- (BOOL)isUnderlyingLinksConnected
{
  return self->_isUnderlyingLinksConnected;
}

- (CSDIDSGroupSessionDelegate)delegate
{
  return (CSDIDSGroupSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isJoined
{
  return self->_joined;
}

- (void)setJoined:(BOOL)a3
{
  self->_joined = a3;
}

- (unint64_t)localParticipantIdentifier
{
  return self->_localParticipantIdentifier;
}

- (void)setLocalParticipantIdentifier:(unint64_t)a3
{
  self->_localParticipantIdentifier = a3;
}

- (unsigned)localParticipantType
{
  return self->_localParticipantType;
}

- (void)setLocalParticipantType:(unsigned __int16)a3
{
  self->_localParticipantType = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDIDSGroupSessionProvider)sessionProvider
{
  return self->_sessionProvider;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)lightweightRetryCount
{
  return self->_lightweightRetryCount;
}

- (void)setLightweightRetryCount:(unint64_t)a3
{
  self->_lightweightRetryCount = a3;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (NSMutableDictionary)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
}

@end