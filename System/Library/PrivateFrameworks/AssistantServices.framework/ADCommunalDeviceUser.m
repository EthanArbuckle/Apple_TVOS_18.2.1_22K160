@interface ADCommunalDeviceUser
+ (id)saHomeMemberInfo:(id)a3;
+ (id)saMultiUserInfo:(id)a3;
+ (id)saRemoteDeviceForHomeMember:(id)a3;
- (ADCommunalDeviceUser)initWithDictionary:(id)a3 attribute:(unint64_t)a4;
- (ADCommunalDeviceUserAttributes)attributes;
- (BOOL)allowExplicitContent;
- (BOOL)companionPeerToPeerHandoffCapable;
- (BOOL)companionSyncMetadataCapable;
- (BOOL)loggingIsAllowed;
- (BOOL)nonCloudSyncedUser;
- (BOOL)personalDomainsIsEnabled;
- (BOOL)unauthenticatedRequestsAllowed;
- (BOOL)voiceIDAllowedByUser;
- (NSData)audioAppSignals;
- (NSDictionary)companionSyncMetadata;
- (NSDictionary)settings;
- (NSString)aceHost;
- (NSString)companionAssistantID;
- (NSString)companionIDSIdentifier;
- (NSString)companionSpeechID;
- (NSString)enrollmentName;
- (NSString)homeUserUUID;
- (NSString)iCloudAltDSID;
- (NSString)loggableCompanionAssistantID;
- (NSString)loggableMultiUserSharedUserID;
- (NSString)loggableMusicSyncSharedUserID;
- (NSString)loggableSharedUserID;
- (NSString)perceptionIdentifier;
- (NSString)personaID;
- (NSString)productPrefix;
- (NSString)shareOwnerName;
- (NSString)sharedUserID;
- (NSString)speechID;
- (id)dictionaryRepresentation;
- (id)init:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 attribute:(unint64_t)a7;
- (id)lastSyncDateForSyncType:(id)a3;
- (id)lastSyncGenerationForSyncType:(id)a3;
- (id)userProperties;
- (void)setAceHost:(id)a3;
- (void)setAllowExplicitContent:(BOOL)a3;
- (void)setAttributes:(id)a3;
- (void)setAudioAppSignals:(id)a3;
- (void)setCompanionAssistantID:(id)a3;
- (void)setCompanionIDSIdentifier:(id)a3;
- (void)setCompanionPeerToPeerHandoffCapable:(BOOL)a3;
- (void)setCompanionSpeechID:(id)a3;
- (void)setCompanionSyncMetadata:(id)a3;
- (void)setCompanionSyncMetadataCapable:(BOOL)a3;
- (void)setEnrollmentName:(id)a3;
- (void)setLoggableCompanionAssistantID:(id)a3;
- (void)setLoggableMultiUserSharedUserID:(id)a3;
- (void)setLoggableMusicSyncSharedUserID:(id)a3;
- (void)setNonCloudSyncedUserAttribute:(BOOL)a3;
- (void)setPerceptionIdentifier:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setPersonalDomainsIsEnabled:(BOOL)a3;
- (void)setProductPrefix:(id)a3;
- (void)setSettings:(id)a3;
- (void)setShareOwnerName:(id)a3;
- (void)setSharedUserID:(id)a3;
- (void)setSpeechID:(id)a3;
- (void)setUnauthenticatedRequestsAllowed:(BOOL)a3;
- (void)setVoiceIDAllowedByUser:(BOOL)a3;
- (void)testAndSetLoggingIsAllowed:(BOOL)a3;
@end

@implementation ADCommunalDeviceUser

- (id)init:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 attribute:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___ADCommunalDeviceUser;
  v17 = -[ADCommunalDeviceUser init](&v35, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_homeUserUUID, a3);
    objc_storeStrong((id *)&v18->_sharedUserID, a4);
    objc_storeStrong((id *)&v18->_loggableSharedUserID, a5);
    objc_storeStrong((id *)&v18->_iCloudAltDSID, a6);
    v19 = -[ADCommunalDeviceUserAttributes initWithAttribute:]( objc_alloc(&OBJC_CLASS___ADCommunalDeviceUserAttributes),  "initWithAttribute:",  a7);
    attributes = v18->_attributes;
    v18->_attributes = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 UUIDString]);
    speechID = v18->_speechID;
    v18->_speechID = (NSString *)v22;

    v18->_voiceIDAllowedByUser = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 UUIDString]);
    loggableCompanionAssistantID = v18->_loggableCompanionAssistantID;
    v18->_loggableCompanionAssistantID = (NSString *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 UUIDString]);
    loggableMultiUserSharedUserID = v18->_loggableMultiUserSharedUserID;
    v18->_loggableMultiUserSharedUserID = (NSString *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 UUIDString]);
    loggableMusicSyncSharedUserID = v18->_loggableMusicSyncSharedUserID;
    v18->_loggableMusicSyncSharedUserID = (NSString *)v31;

    companionSyncMetadata = v18->_companionSyncMetadata;
    v18->_companionSyncMetadata = (NSDictionary *)&__NSDictionary0__struct;

    *(_WORD *)&v18->_companionSyncMetadataCapable = 0;
  }

  return v18;
}

- (ADCommunalDeviceUser)initWithDictionary:(id)a3 attribute:(unint64_t)a4
{
  id v6 = a3;
  v73.receiver = self;
  v73.super_class = (Class)&OBJC_CLASS___ADCommunalDeviceUser;
  v7 = -[ADCommunalDeviceUser init](&v73, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"homeUserId"]);
    else {
      v9 = v8;
    }
    objc_storeStrong((id *)&v7->_homeUserUUID, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"sharedUserId"]);
    else {
      v11 = v10;
    }
    objc_storeStrong((id *)&v7->_sharedUserID, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loggableSharedUserId"]);
    else {
      id v13 = v12;
    }
    objc_storeStrong((id *)&v7->_loggableSharedUserID, v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"iCloudAltDSID"]);
    else {
      id v15 = v14;
    }
    objc_storeStrong((id *)&v7->_iCloudAltDSID, v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"companionAssistantId"]);
    else {
      v17 = v16;
    }
    objc_storeStrong((id *)&v7->_companionAssistantID, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"companionSpeechId"]);
    else {
      v19 = v18;
    }
    objc_storeStrong((id *)&v7->_companionSpeechID, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"companionIDSIdentifier"]);
    else {
      v21 = v20;
    }
    objc_storeStrong((id *)&v7->_companionIDSIdentifier, v21);

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"enrollmentName"]);
    else {
      v23 = v22;
    }
    objc_storeStrong((id *)&v7->_enrollmentName, v23);

    v24 = -[ADCommunalDeviceUserAttributes initWithAttribute:]( objc_alloc(&OBJC_CLASS___ADCommunalDeviceUserAttributes),  "initWithAttribute:",  a4);
    attributes = v7->_attributes;
    v7->_attributes = v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"speechIdentifier"]);
    speechID = v7->_speechID;
    v7->_speechID = (NSString *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"companionSyncMetadata"]);
    companionSyncMetadata = v7->_companionSyncMetadata;
    v7->_companionSyncMetadata = (NSDictionary *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"companionSyncMetadataCapable"]);
    v7->_companionSyncMetadataCapable = [v30 BOOLValue];

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"companionPeerToPeerHandoffCapable"]);
    v7->_companionPeerToPeerHandoffCapable = [v31 BOOLValue];

    if (!v7->_speechID)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v33 = objc_claimAutoreleasedReturnValue([v32 UUIDString]);
      v34 = v7->_speechID;
      v7->_speechID = (NSString *)v33;
    }

    uint64_t v35 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"cloudShareOwnerName"]);
    shareOwnerName = v7->_shareOwnerName;
    v7->_shareOwnerName = (NSString *)v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"voiceIDAllowedByUser"]);
    v7->_voiceIDAllowedByUser = [v37 BOOLValue];

    v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"personalDomainEnabled"]);
    v7->_personalDomainsIsEnabled = [v38 BOOLValue];

    v39 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"personalDomainUnauthenticatedRequestsAllowed"]);
    v7->_unauthenticatedRequestsAllowed = [v39 BOOLValue];

    v40 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"allowExplicitContent"]);
    v7->_allowExplicitContent = [v40 BOOLValue];

    uint64_t v41 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"userAgent"]);
    productPrefix = v7->_productPrefix;
    v7->_productPrefix = (NSString *)v41;

    uint64_t v43 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"aceHost"]);
    aceHost = v7->_aceHost;
    v7->_aceHost = (NSString *)v43;

    uint64_t v45 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loggableCompanionAssistantId"]);
    loggableCompanionAssistantID = v7->_loggableCompanionAssistantID;
    v7->_loggableCompanionAssistantID = (NSString *)v45;

    if (!v7->_loggableCompanionAssistantID)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 UUIDString]);
      v49 = v7->_loggableCompanionAssistantID;
      v7->_loggableCompanionAssistantID = (NSString *)v48;
    }

    uint64_t v50 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loggableMultiUserSharedUserId"]);
    loggableMultiUserSharedUserID = v7->_loggableMultiUserSharedUserID;
    v7->_loggableMultiUserSharedUserID = (NSString *)v50;

    if (!v7->_loggableMultiUserSharedUserID)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v53 = objc_claimAutoreleasedReturnValue([v52 UUIDString]);
      v54 = v7->_loggableMultiUserSharedUserID;
      v7->_loggableMultiUserSharedUserID = (NSString *)v53;
    }

    uint64_t v55 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loggableMusicSyncSharedUserId"]);
    loggableMusicSyncSharedUserID = v7->_loggableMusicSyncSharedUserID;
    v7->_loggableMusicSyncSharedUserID = (NSString *)v55;

    if (!v7->_loggableMusicSyncSharedUserID)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v58 = objc_claimAutoreleasedReturnValue([v57 UUIDString]);
      v59 = v7->_loggableMusicSyncSharedUserID;
      v7->_loggableMusicSyncSharedUserID = (NSString *)v58;
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"homeMemberSettings"]);
    uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v60, v61) & 1) != 0)
    {
      v62 = v60;
      settings = v7->_settings;
      v7->_settings = v62;
    }

    else
    {
      uint64_t v64 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v60, v64) & 1) == 0)
      {
LABEL_39:
        uint64_t v68 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"personaId"]);
        personaID = v7->_personaID;
        v7->_personaID = (NSString *)v68;

        uint64_t v70 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"perceptionIdentifier"]);
        perceptionIdentifier = v7->_perceptionIdentifier;
        v7->_perceptionIdentifier = (NSString *)v70;

        goto LABEL_40;
      }

      settings = (NSDictionary *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"homeMemberSettings"]);
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithPlistData:](&OBJC_CLASS___AceObject, "aceObjectWithPlistData:", settings));
      uint64_t v66 = objc_claimAutoreleasedReturnValue([v65 dictionary]);
      v67 = v7->_settings;
      v7->_settings = (NSDictionary *)v66;
    }

    goto LABEL_39;
  }

- (id)userProperties
{
  v18 = objc_alloc(&OBJC_CLASS___NSDictionary);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self, "sharedUserID"));
  v4 = (void *)v3;
  if (v3) {
    v5 = (const __CFString *)v3;
  }
  else {
    v5 = @"empty";
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self, "homeUserUUID"));
  v7 = (void *)v6;
  if (v6) {
    v8 = (const __CFString *)v6;
  }
  else {
    v8 = @"empty";
  }
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self, "iCloudAltDSID"));
  v10 = (void *)v9;
  if (v9) {
    v11 = (const __CFString *)v9;
  }
  else {
    v11 = @"empty";
  }
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser enrollmentName](self, "enrollmentName"));
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (const __CFString *)v12;
  }
  else {
    id v14 = @"empty";
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ADCommunalDeviceUser voiceIDAllowedByUser](self, "voiceIDAllowedByUser")));
  id v16 = -[NSDictionary initWithObjectsAndKeys:]( v18,  "initWithObjectsAndKeys:",  v5,  @"sharedUserId",  v8,  @"homeUserId",  v11,  @"iCloudAltDSID",  v14,  @"enrollmentName",  v15,  @"voiceIDAllowedByUser",  0LL);

  return v16;
}

- (id)dictionaryRepresentation
{
  if ((AFIsATV(self, a2) & 1) != 0 || self->_homeUserUUID && self->_sharedUserID && self->_loggableSharedUserID)
  {
    v51 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self, "sharedUserID"));
    v4 = (void *)v3;
    v5 = @"empty";
    if (v3) {
      uint64_t v6 = (const __CFString *)v3;
    }
    else {
      uint64_t v6 = @"empty";
    }
    uint64_t v50 = v6;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self, "homeUserUUID"));
    v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = (const __CFString *)v7;
    }
    else {
      uint64_t v9 = @"empty";
    }
    v49 = v9;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser enrollmentName](self, "enrollmentName"));
    v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (const __CFString *)v10;
    }
    else {
      uint64_t v12 = @"empty";
    }
    uint64_t v48 = v12;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser loggableSharedUserID](self, "loggableSharedUserID"));
    id v14 = (void *)v13;
    if (v13) {
      id v15 = (const __CFString *)v13;
    }
    else {
      id v15 = @"empty";
    }
    v47 = v15;
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self, "iCloudAltDSID"));
    v17 = (void *)v16;
    if (v16) {
      v5 = (const __CFString *)v16;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser speechID](self, "speechID"));
    v19 = v18;
    if (!v18)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v46 UUIDString]);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionSyncMetadata](self, "companionSyncMetadata"));
    v21 = (void *)v20;
    uint64_t v22 = &__NSDictionary0__struct;
    if (v20) {
      uint64_t v22 = (void *)v20;
    }
    v23 = -[NSMutableDictionary initWithObjectsAndKeys:]( v51,  "initWithObjectsAndKeys:",  v50,  @"sharedUserId",  v49,  @"homeUserId",  v48,  @"enrollmentName",  v47,  @"loggableSharedUserId",  v5,  @"iCloudAltDSID",  v19,  @"speechIdentifier",  v22,  @"companionSyncMetadata",  0LL);

    if (!v18)
    {
    }

    if (self->_companionSyncMetadataCapable)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([&__kCFBooleanTrue stringValue]);
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v24, @"companionSyncMetadataCapable");
    }

    if (self->_companionPeerToPeerHandoffCapable)
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([&__kCFBooleanTrue stringValue]);
      -[NSMutableDictionary setObject:forKey:]( v23,  "setObject:forKey:",  v25,  @"companionPeerToPeerHandoffCapable");
    }

    if (self->_companionAssistantID)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionAssistantID](self, "companionAssistantID"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v26, @"companionAssistantId");
    }

    if (self->_companionSpeechID)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionSpeechID](self, "companionSpeechID"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v27, @"companionSpeechId");
    }

    if (self->_companionIDSIdentifier)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionIDSIdentifier](self, "companionIDSIdentifier"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v28, @"companionIDSIdentifier");
    }

    if (self->_productPrefix)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser productPrefix](self, "productPrefix"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v29, @"userAgent");
    }

    if (self->_personalDomainsIsEnabled)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([&__kCFBooleanTrue stringValue]);
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v30, @"personalDomainEnabled");
    }

    if (self->_unauthenticatedRequestsAllowed)
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([&__kCFBooleanTrue stringValue]);
      -[NSMutableDictionary setObject:forKey:]( v23,  "setObject:forKey:",  v31,  @"personalDomainUnauthenticatedRequestsAllowed");
    }

    if (self->_allowExplicitContent)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([&__kCFBooleanTrue stringValue]);
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v32, @"allowExplicitContent");
    }

    if (self->_shareOwnerName)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser shareOwnerName](self, "shareOwnerName"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v33, @"cloudShareOwnerName");
    }

    if (self->_voiceIDAllowedByUser)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ADCommunalDeviceUser voiceIDAllowedByUser](self, "voiceIDAllowedByUser")));
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 stringValue]);
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v35, @"voiceIDAllowedByUser");
    }

    if (self->_nonCloudSyncedUser)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([&__kCFBooleanTrue stringValue]);
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v36, @"voiceIDAllowedByUser");
    }

    if (self->_loggableMultiUserSharedUserID)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser loggableMultiUserSharedUserID](self, "loggableMultiUserSharedUserID"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v37, @"loggableMultiUserSharedUserId");
    }

    if (self->_loggableCompanionAssistantID)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser loggableCompanionAssistantID](self, "loggableCompanionAssistantID"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v38, @"loggableCompanionAssistantId");
    }

    if (self->_loggableMusicSyncSharedUserID)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser loggableMusicSyncSharedUserID](self, "loggableMusicSyncSharedUserID"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v39, @"loggableMusicSyncSharedUserId");
    }

    aceHost = self->_aceHost;
    if (aceHost) {
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", aceHost, @"aceHost");
    }
    if (self->_settings)
    {
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser settings](self, "settings"));
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v41,  200LL,  0LL,  0LL));

      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v42, @"homeMemberSettings");
    }

    if (self->_personaID)
    {
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser personaID](self, "personaID"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v43, @"personaId");
    }

    if (self->_perceptionIdentifier)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser perceptionIdentifier](self, "perceptionIdentifier"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v44, @"perceptionIdentifier");
    }
  }

  else
  {
    v23 = 0LL;
  }

  return v23;
}

- (void)setNonCloudSyncedUserAttribute:(BOOL)a3
{
  self->_nonCloudSyncedUser = a3;
  if (a3) {
    -[ADCommunalDeviceUserAttributes addAttribute:](self->_attributes, "addAttribute:", 4LL);
  }
}

- (void)testAndSetLoggingIsAllowed:(BOOL)a3
{
  if (self->_loggingIsAllowed != a3)
  {
    self->_loggingIsAllowed = a3;
    if (a3)
    {
      objc_storeStrong((id *)&self->_loggableCompanionAssistantID, self->_companionAssistantID);
      v4 = self->_sharedUserID;
      loggableMultiUserSharedUserID = self->_loggableMultiUserSharedUserID;
      self->_loggableMultiUserSharedUserID = v4;
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      loggableCompanionAssistantID = self->_loggableCompanionAssistantID;
      self->_loggableCompanionAssistantID = v7;

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
      uint64_t v10 = self->_loggableMultiUserSharedUserID;
      self->_loggableMultiUserSharedUserID = v9;
    }
  }

- (id)lastSyncDateForSyncType:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionSyncMetadata](self, "companionSyncMetadata"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"syncTimestamp"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0LL;
  }
  [v9 floatValue];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v10));

  return v11;
}

- (id)lastSyncGenerationForSyncType:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionSyncMetadata](self, "companionSyncMetadata"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"syncGeneration"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v10 = v9;

  return v10;
}

- (NSString)homeUserUUID
{
  return self->_homeUserUUID;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (void)setSharedUserID:(id)a3
{
}

- (NSString)loggableSharedUserID
{
  return self->_loggableSharedUserID;
}

- (NSString)iCloudAltDSID
{
  return self->_iCloudAltDSID;
}

- (NSData)audioAppSignals
{
  return self->_audioAppSignals;
}

- (void)setAudioAppSignals:(id)a3
{
}

- (NSString)loggableMultiUserSharedUserID
{
  return self->_loggableMultiUserSharedUserID;
}

- (void)setLoggableMultiUserSharedUserID:(id)a3
{
}

- (NSString)loggableMusicSyncSharedUserID
{
  return self->_loggableMusicSyncSharedUserID;
}

- (void)setLoggableMusicSyncSharedUserID:(id)a3
{
}

- (NSString)loggableCompanionAssistantID
{
  return self->_loggableCompanionAssistantID;
}

- (void)setLoggableCompanionAssistantID:(id)a3
{
}

- (NSString)companionAssistantID
{
  return self->_companionAssistantID;
}

- (void)setCompanionAssistantID:(id)a3
{
}

- (NSString)companionSpeechID
{
  return self->_companionSpeechID;
}

- (void)setCompanionSpeechID:(id)a3
{
}

- (NSString)enrollmentName
{
  return self->_enrollmentName;
}

- (void)setEnrollmentName:(id)a3
{
}

- (ADCommunalDeviceUserAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)companionIDSIdentifier
{
  return self->_companionIDSIdentifier;
}

- (void)setCompanionIDSIdentifier:(id)a3
{
}

- (NSString)speechID
{
  return self->_speechID;
}

- (void)setSpeechID:(id)a3
{
}

- (NSString)productPrefix
{
  return self->_productPrefix;
}

- (void)setProductPrefix:(id)a3
{
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setAceHost:(id)a3
{
}

- (BOOL)personalDomainsIsEnabled
{
  return self->_personalDomainsIsEnabled;
}

- (void)setPersonalDomainsIsEnabled:(BOOL)a3
{
  self->_personalDomainsIsEnabled = a3;
}

- (BOOL)unauthenticatedRequestsAllowed
{
  return self->_unauthenticatedRequestsAllowed;
}

- (void)setUnauthenticatedRequestsAllowed:(BOOL)a3
{
  self->_unauthenticatedRequestsAllowed = a3;
}

- (BOOL)voiceIDAllowedByUser
{
  return self->_voiceIDAllowedByUser;
}

- (void)setVoiceIDAllowedByUser:(BOOL)a3
{
  self->_voiceIDAllowedByUser = a3;
}

- (BOOL)allowExplicitContent
{
  return self->_allowExplicitContent;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  self->_allowExplicitContent = a3;
}

- (NSDictionary)companionSyncMetadata
{
  return self->_companionSyncMetadata;
}

- (void)setCompanionSyncMetadata:(id)a3
{
}

- (NSString)shareOwnerName
{
  return self->_shareOwnerName;
}

- (void)setShareOwnerName:(id)a3
{
}

- (BOOL)nonCloudSyncedUser
{
  return self->_nonCloudSyncedUser;
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (BOOL)loggingIsAllowed
{
  return self->_loggingIsAllowed;
}

- (BOOL)companionSyncMetadataCapable
{
  return self->_companionSyncMetadataCapable;
}

- (void)setCompanionSyncMetadataCapable:(BOOL)a3
{
  self->_companionSyncMetadataCapable = a3;
}

- (BOOL)companionPeerToPeerHandoffCapable
{
  return self->_companionPeerToPeerHandoffCapable;
}

- (void)setCompanionPeerToPeerHandoffCapable:(BOOL)a3
{
  self->_companionPeerToPeerHandoffCapable = a3;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (NSString)perceptionIdentifier
{
  return self->_perceptionIdentifier;
}

- (void)setPerceptionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)saHomeMemberInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SAHomeMemberInfo);
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sharedUserID]);
    -[SAHomeMemberInfo setSharedUserId:](v5, "setSharedUserId:", v6);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 loggableSharedUserID]);
    -[SAHomeMemberInfo setLoggableSharedUserId:](v5, "setLoggableSharedUserId:", v7);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 companionAssistantID]);
    -[SAHomeMemberInfo setCompanionAssistantId:](v5, "setCompanionAssistantId:", v8);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 companionSpeechID]);
    -[SAHomeMemberInfo setCompanionSpeechId:](v5, "setCompanionSpeechId:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 attributes]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[ADCommunalDeviceUserAttributes saCopy:]( &OBJC_CLASS___ADCommunalDeviceUserAttributes,  "saCopy:",  v10));
    -[SAHomeMemberInfo setAttributes:](v5, "setAttributes:", v11);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 enrollmentName]);
    -[SAHomeMemberInfo setEnrollmentName:](v5, "setEnrollmentName:", v12);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 speechID]);
    -[SAHomeMemberInfo setSpeechId:](v5, "setSpeechId:", v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 loggableCompanionAssistantID]);
    -[SAHomeMemberInfo setLoggableCompanionAssistantId:](v5, "setLoggableCompanionAssistantId:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 loggableMultiUserSharedUserID]);
    -[SAHomeMemberInfo setLoggableMultiUserSharedUserId:](v5, "setLoggableMultiUserSharedUserId:", v15);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 aceHost]);
    -[SAHomeMemberInfo setLastVisitedAceHost:](v5, "setLastVisitedAceHost:", v16);

    id v17 = objc_alloc(&OBJC_CLASS___SAHomeMemberSettings);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v3 settings]);
    id v19 = [v17 initWithDictionary:v18];

    objc_msgSend( v19,  "setMediaPlayerExplicitContentDisallowed:",  objc_msgSend(v3, "allowExplicitContent") ^ 1);
    -[SAHomeMemberInfo setHomeMemberSettings:](v5, "setHomeMemberSettings:", v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 personaID]);
    -[SAHomeMemberInfo setPersonaIdentifier:](v5, "setPersonaIdentifier:", v20);
  }

  else
  {
    uint64_t v21 = AFMultiUserDefaultSharedUserId;
    -[SAHomeMemberInfo setSharedUserId:](v4, "setSharedUserId:", AFMultiUserDefaultSharedUserId);
    -[SAHomeMemberInfo setLoggableSharedUserId:](v5, "setLoggableSharedUserId:", v21);
    -[SAHomeMemberInfo setCompanionAssistantId:](v5, "setCompanionAssistantId:", 0LL);
    -[SAHomeMemberInfo setCompanionSpeechId:](v5, "setCompanionSpeechId:", 0LL);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[ADCommunalDeviceUserAttributes saCopy:]( &OBJC_CLASS___ADCommunalDeviceUserAttributes,  "saCopy:",  0LL));
    -[SAHomeMemberInfo setAttributes:](v5, "setAttributes:", v22);

    -[SAHomeMemberInfo setEnrollmentName:](v5, "setEnrollmentName:", @"unknown");
    -[SAHomeMemberInfo setSpeechId:](v5, "setSpeechId:", 0LL);
    -[SAHomeMemberInfo setLastVisitedAceHost:](v5, "setLastVisitedAceHost:", 0LL);
    -[SAHomeMemberInfo setLoggableCompanionAssistantId:](v5, "setLoggableCompanionAssistantId:", 0LL);
    -[SAHomeMemberInfo setLoggableMultiUserSharedUserId:](v5, "setLoggableMultiUserSharedUserId:", 0LL);
    -[SAHomeMemberInfo setPersonaIdentifier:](v5, "setPersonaIdentifier:", v21);
  }

  return v5;
}

+ (id)saMultiUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SAMultiUserInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommunalDeviceUser saHomeMemberInfo:](&OBJC_CLASS___ADCommunalDeviceUser, "saHomeMemberInfo:", v3));

  uint64_t v8 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  -[SAMultiUserInfo setHomeMembers:](v4, "setHomeMembers:", v6);

  return v4;
}

+ (id)saRemoteDeviceForHomeMember:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 companionAssistantID]);
  if (v3)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___SARemoteDevice);
    [v5 setAssistantId:v4];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 personalDomainsIsEnabled]));
    [v5 setPersonalDomainsEnabled:v6];

    unsigned int v7 = [v3 unauthenticatedRequestsAllowed];
    uint64_t v8 = &SARemoteDevicePersonalDomainsAuthenticationModeNeverValue;
    if (!v7) {
      uint64_t v8 = &SARemoteDevicePersonalDomainsAuthenticationModeSecureRequestsValue;
    }
    [v5 setPersonalDomainsAuthenticationMode:*v8];
    [v5 setSiriEnabled:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 productPrefix]);
    [v5 setUserAgent:v9];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

@end