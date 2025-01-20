@interface CSDConversationJoinContext
- (BOOL)isGFTDowngradeToOneToOneAvailable;
- (BOOL)isInitiator;
- (BOOL)isInvitation;
- (BOOL)isLightweight;
- (BOOL)isMomentsAvailable;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isPersonaAvailable;
- (BOOL)isScreening;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isUPlusNDowngradeAvailable;
- (BOOL)isUPlusOneAVLessAvailable;
- (BOOL)isUPlusOneScreenShareAvailable;
- (BOOL)isUPlusOneVisionToVisionAvailable;
- (BOOL)isUpgrade;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)representsTransitionFromPending;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)supportsLeaveContext;
- (BOOL)supportsRequestToScreenShare;
- (BOOL)wantsStagingArea;
- (CSDConversationJoinContext)init;
- (NSSet)invitationPreferences;
- (NSString)collaborationIdentifier;
- (NSString)messagesGroupName;
- (NSUUID)messagesGroupUUID;
- (NSUUID)upgradeSessionUUID;
- (TUConversationActivity)activity;
- (TUConversationParticipantAssociation)participantAssociation;
- (TUConversationProvider)provider;
- (TUScreenSharingRequest)screenSharingRequest;
- (id)description;
- (unint64_t)avMode;
- (unint64_t)presentationMode;
- (unint64_t)sharePlayProtocolVersion;
- (unint64_t)visionCallEstablishmentVersion;
- (unint64_t)visionFeatureVersion;
- (void)setActivity:(id)a3;
- (void)setAvMode:(unint64_t)a3;
- (void)setCollaborationIdentifier:(id)a3;
- (void)setGftDowngradeToOneToOneAvailable:(BOOL)a3;
- (void)setInitiator:(BOOL)a3;
- (void)setInvitation:(BOOL)a3;
- (void)setInvitationPreferences:(id)a3;
- (void)setLightweight:(BOOL)a3;
- (void)setMessagesGroupName:(id)a3;
- (void)setMessagesGroupUUID:(id)a3;
- (void)setMomentsAvailable:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setParticipantAssociation:(id)a3;
- (void)setPersonaAvailable:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setProvider:(id)a3;
- (void)setRepresentsTransitionFromPending:(BOOL)a3;
- (void)setScreenSharingRequest:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setSharePlayProtocolVersion:(unint64_t)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setSpatialPersonaEnabled:(BOOL)a3;
- (void)setSupportsLeaveContext:(BOOL)a3;
- (void)setSupportsRequestToScreenShare:(BOOL)a3;
- (void)setUPlusNDowngradeAvailable:(BOOL)a3;
- (void)setUPlusOneAVLessAvailable:(BOOL)a3;
- (void)setUPlusOneScreenShareAvailable:(BOOL)a3;
- (void)setUPlusOneVisionToVisionAvailable:(BOOL)a3;
- (void)setUpgrade:(BOOL)a3;
- (void)setUpgradeSessionUUID:(id)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVisionCallEstablishmentVersion:(unint64_t)a3;
- (void)setVisionFeatureVersion:(unint64_t)a3;
- (void)setWantsStagingArea:(BOOL)a3;
@end

@implementation CSDConversationJoinContext

- (CSDConversationJoinContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDConversationJoinContext;
  result = -[CSDConversationJoinContext init](&v3, "init");
  if (result) {
    result->_uPlusOneAVLessAvailable = 1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@ %p ", objc_opt_class(self, v4), self);
  v5 = NSStringFromSelector("isInvitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v6,  -[CSDConversationJoinContext isInvitation](self, "isInvitation"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v7 = NSStringFromSelector("isMomentsAvailable");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v8,  -[CSDConversationJoinContext isMomentsAvailable](self, "isMomentsAvailable"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v9 = NSStringFromSelector("isPersonaAvailable");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v10,  -[CSDConversationJoinContext isPersonaAvailable](self, "isPersonaAvailable"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v11 = NSStringFromSelector("isUpgrade");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v12,  -[CSDConversationJoinContext isUpgrade](self, "isUpgrade"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v13 = NSStringFromSelector("isVideo");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v14,  -[CSDConversationJoinContext isVideo](self, "isVideo"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v15 = NSStringFromSelector("isVideoEnabled");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v16,  -[CSDConversationJoinContext isVideoEnabled](self, "isVideoEnabled"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v17 = NSStringFromSelector("shouldSuppressInCallUI");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v18,  -[CSDConversationJoinContext shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v19 = NSStringFromSelector("wantsStagingArea");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v20,  -[CSDConversationJoinContext wantsStagingArea](self, "wantsStagingArea"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v21 = NSStringFromSelector("upgradeSessionUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext upgradeSessionUUID](self, "upgradeSessionUUID"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v22, v23);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v24 = NSStringFromSelector("isOneToOneModeEnabled");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v25,  -[CSDConversationJoinContext isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v26 = NSStringFromSelector("provider");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext provider](self, "provider"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v27, v28);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v29 = NSStringFromSelector("invitationPreferences");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext invitationPreferences](self, "invitationPreferences"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v30, v31);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v32 = NSStringFromSelector("isLightweight");
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v33,  -[CSDConversationJoinContext isLightweight](self, "isLightweight"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v34 = NSStringFromSelector("sharePlayProtocolVersion");
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSDConversationJoinContext sharePlayProtocolVersion](self, "sharePlayProtocolVersion")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v35, v36);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v37 = NSStringFromSelector("visionFeatureVersion");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSDConversationJoinContext visionFeatureVersion](self, "visionFeatureVersion")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v38, v39);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v40 = NSStringFromSelector("visionCallEstablishmentVersion");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSDConversationJoinContext visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v41, v42);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v43 = NSStringFromSelector("isGFTDowngradeToOneToOneAvailable");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v44,  -[CSDConversationJoinContext isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v45 = NSStringFromSelector("isUPlusNDowngradeAvailable");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v46,  -[CSDConversationJoinContext isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v47 = NSStringFromSelector("supportsLeaveContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v48,  -[CSDConversationJoinContext supportsLeaveContext](self, "supportsLeaveContext"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v49 = NSStringFromSelector("supportsRequestToScreenShare");
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v50,  -[CSDConversationJoinContext supportsRequestToScreenShare](self, "supportsRequestToScreenShare"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v51 = NSStringFromSelector("isUPlusOneScreenShareAvailable");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v52,  -[CSDConversationJoinContext isUPlusOneScreenShareAvailable](self, "isUPlusOneScreenShareAvailable"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v53 = NSStringFromSelector("isUPlusOneAVLessAvailable");
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v54,  -[CSDConversationJoinContext isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v55 = NSStringFromSelector("avMode");
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%lu",  v56,  -[CSDConversationJoinContext avMode](self, "avMode"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v57 = NSStringFromSelector("presentationMode");
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%lu",  v58,  -[CSDConversationJoinContext presentationMode](self, "presentationMode"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v59 = NSStringFromSelector("screening");
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v60,  -[CSDConversationJoinContext isScreening](self, "isScreening"));

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext participantAssociation](self, "participantAssociation"));
  if (v61)
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
    v62 = NSStringFromSelector("participantAssociation");
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext participantAssociation](self, "participantAssociation"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v63, v64);
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext activity](self, "activity"));

  if (v65)
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
    v66 = NSStringFromSelector("activity");
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext activity](self, "activity"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v67, v68);
  }

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext screenSharingRequest](self, "screenSharingRequest"));

  if (v69)
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
    v70 = NSStringFromSelector("screenSharingRequest");
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext screenSharingRequest](self, "screenSharingRequest"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v71, v72);
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v73 = NSStringFromSelector("isSpatialPersonaEnabled");
  v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v74,  -[CSDConversationJoinContext isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v75 = NSStringFromSelector("isUPlusOneVisionToVisionAvailable");
  v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%d",  v76,  -[CSDConversationJoinContext isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  id v77 = -[NSMutableString copy](v3, "copy");

  return v77;
}

- (BOOL)isInvitation
{
  return self->_invitation;
}

- (void)setInvitation:(BOOL)a3
{
  self->_invitation = a3;
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (void)setVideoPaused:(BOOL)a3
{
  self->_videoPaused = a3;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (BOOL)representsTransitionFromPending
{
  return self->_representsTransitionFromPending;
}

- (void)setRepresentsTransitionFromPending:(BOOL)a3
{
  self->_representsTransitionFromPending = a3;
}

- (BOOL)isUpgrade
{
  return self->_upgrade;
}

- (void)setUpgrade:(BOOL)a3
{
  self->_upgrade = a3;
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (BOOL)isMomentsAvailable
{
  return self->_momentsAvailable;
}

- (void)setMomentsAvailable:(BOOL)a3
{
  self->_momentsAvailable = a3;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (BOOL)isPersonaAvailable
{
  return self->_personaAvailable;
}

- (void)setPersonaAvailable:(BOOL)a3
{
  self->_personaAvailable = a3;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  return self->_gftDowngradeToOneToOneAvailable;
}

- (void)setGftDowngradeToOneToOneAvailable:(BOOL)a3
{
  self->_gftDowngradeToOneToOneAvailable = a3;
}

- (BOOL)isUPlusNDowngradeAvailable
{
  return self->_uPlusNDowngradeAvailable;
}

- (void)setUPlusNDowngradeAvailable:(BOOL)a3
{
  self->_uPlusNDowngradeAvailable = a3;
}

- (BOOL)supportsLeaveContext
{
  return self->_supportsLeaveContext;
}

- (void)setSupportsLeaveContext:(BOOL)a3
{
  self->_supportsLeaveContext = a3;
}

- (BOOL)supportsRequestToScreenShare
{
  return self->_supportsRequestToScreenShare;
}

- (void)setSupportsRequestToScreenShare:(BOOL)a3
{
  self->_supportsRequestToScreenShare = a3;
}

- (BOOL)isUPlusOneScreenShareAvailable
{
  return self->_uPlusOneScreenShareAvailable;
}

- (void)setUPlusOneScreenShareAvailable:(BOOL)a3
{
  self->_uPlusOneScreenShareAvailable = a3;
}

- (BOOL)isUPlusOneAVLessAvailable
{
  return self->_uPlusOneAVLessAvailable;
}

- (void)setUPlusOneAVLessAvailable:(BOOL)a3
{
  self->_uPlusOneAVLessAvailable = a3;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isLightweight
{
  return self->_lightweight;
}

- (void)setLightweight:(BOOL)a3
{
  self->_lightweight = a3;
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
}

- (NSUUID)upgradeSessionUUID
{
  return self->_upgradeSessionUUID;
}

- (void)setUpgradeSessionUUID:(id)a3
{
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  self->_oneToOneModeEnabled = a3;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (TUConversationProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSSet)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
}

- (unint64_t)sharePlayProtocolVersion
{
  return self->_sharePlayProtocolVersion;
}

- (void)setSharePlayProtocolVersion:(unint64_t)a3
{
  self->_sharePlayProtocolVersion = a3;
}

- (unint64_t)visionFeatureVersion
{
  return self->_visionFeatureVersion;
}

- (void)setVisionFeatureVersion:(unint64_t)a3
{
  self->_visionFeatureVersion = a3;
}

- (unint64_t)visionCallEstablishmentVersion
{
  return self->_visionCallEstablishmentVersion;
}

- (void)setVisionCallEstablishmentVersion:(unint64_t)a3
{
  self->_visionCallEstablishmentVersion = a3;
}

- (TUConversationParticipantAssociation)participantAssociation
{
  return self->_participantAssociation;
}

- (void)setParticipantAssociation:(id)a3
{
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (TUConversationActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (TUScreenSharingRequest)screenSharingRequest
{
  return self->_screenSharingRequest;
}

- (void)setScreenSharingRequest:(id)a3
{
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (BOOL)isUPlusOneVisionToVisionAvailable
{
  return self->_uPlusOneVisionToVisionAvailable;
}

- (void)setUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  self->_uPlusOneVisionToVisionAvailable = a3;
}

- (void).cxx_destruct
{
}

@end