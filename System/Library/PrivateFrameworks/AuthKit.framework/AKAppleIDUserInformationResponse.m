@interface AKAppleIDUserInformationResponse
- (AKAppleIDUserInformationResponse)initWithResponseBody:(id)a3;
- (AKUserInformation)userInformationRepresentation;
- (NSArray)allAccountNames;
- (NSDictionary)dictionaryRepresentation;
- (void)setUserInformationRepresentation:(id)a3;
@end

@implementation AKAppleIDUserInformationResponse

- (AKAppleIDUserInformationResponse)initWithResponseBody:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKAppleIDUserInformationResponse;
  v5 = -[AKAppleIDUserInformationResponse init](&v9, "init");
  if (v5)
  {
    v6 = -[AKUserInformation initWithResponseBody:]( objc_alloc(&OBJC_CLASS___AKUserInformation),  "initWithResponseBody:",  v4);
    userInformationRepresentation = v5->_userInformationRepresentation;
    v5->_userInformationRepresentation = v6;
  }

  return v5;
}

- (NSArray)allAccountNames
{
  allAccountNames = self->_allAccountNames;
  if (allAccountNames) {
    return allAccountNames;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[AKUserInformation primaryEmailAddress](self->_userInformationRepresentation, "primaryEmailAddress"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation vettedPrimaryEmail](self->_userInformationRepresentation, "vettedPrimaryEmail"));
    if (([v7 BOOLValue] & 1) == 0)
    {

      goto LABEL_7;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation phoneAsAppleID](self->_userInformationRepresentation, "phoneAsAppleID"));
    unsigned __int8 v9 = [v8 BOOLValue];

    if ((v9 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInformation primaryEmailAddress]( self->_userInformationRepresentation,  "primaryEmailAddress"));
      [v4 addObject:v6];
LABEL_7:
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation accountAliases](self->_userInformationRepresentation, "accountAliases"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation accountAliases](self->_userInformationRepresentation, "accountAliases"));
    [v4 addObjectsFromArray:v11];
  }

  v12 = (NSArray *)[v4 copy];
  v13 = self->_allAccountNames;
  self->_allAccountNames = v12;

  allAccountNames = self->_allAccountNames;
  return allAccountNames;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (-[AKUserInformation appleIDSecurityLevel](self->_userInformationRepresentation, "appleIDSecurityLevel"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AKUserInformation appleIDSecurityLevel]( self->_userInformationRepresentation,  "appleIDSecurityLevel")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  AKAuthenticationSecurityLevelKey);
  }

  if (-[AKUserInformation authMode](self->_userInformationRepresentation, "authMode"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AKUserInformation authMode](self->_userInformationRepresentation, "authMode")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  AKAuthenticationAppleIDAuthModeKey);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation isUnderage](self->_userInformationRepresentation, "isUnderage"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  AKAuthenticationIsUnderageKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation isLegacyStudent](self->_userInformationRepresentation, "isLegacyStudent"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  AKAuthenticationIsLegacyStudentKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation masterKeyID](self->_userInformationRepresentation, "masterKeyID"));
  if (v8)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation masterKeyID](self->_userInformationRepresentation, "masterKeyID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  AKAuthenticationMasterKeyIDKey);
  }

  if (-[AKUserInformation repairState](self->_userInformationRepresentation, "repairState"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AKUserInformation repairState](self->_userInformationRepresentation, "repairState")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  AKAuthenticationRepairStateKey);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation vettedPrimaryEmail](self->_userInformationRepresentation, "vettedPrimaryEmail"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation vettedPrimaryEmail](self->_userInformationRepresentation, "vettedPrimaryEmail"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  AKAuthenticationPrimaryVettedEmailKey);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation forwardingEmail](self->_userInformationRepresentation, "forwardingEmail"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation forwardingEmail](self->_userInformationRepresentation, "forwardingEmail"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  AKAuthenticationForwardingEmailKey);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation reachableEmails](self->_userInformationRepresentation, "reachableEmails"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation reachableEmails](self->_userInformationRepresentation, "reachableEmails"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v16,  AKAuthenticationReachableEmailsKey);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation familyName](self->_userInformationRepresentation, "familyName"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation familyName](self->_userInformationRepresentation, "familyName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v18,  AKAuthenticationFamilyNameKey);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation givenName](self->_userInformationRepresentation, "givenName"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation givenName](self->_userInformationRepresentation, "givenName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v20,  AKAuthenticationGivenNameKey);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInformation previouslySelectedEmail]( self->_userInformationRepresentation,  "previouslySelectedEmail"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInformation previouslySelectedEmail]( self->_userInformationRepresentation,  "previouslySelectedEmail"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v22,  AKAuthenticationSelectedAuthorizationEmailKey);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation hasSOSActiveDevice](self->_userInformationRepresentation, "hasSOSActiveDevice"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation hasSOSActiveDevice](self->_userInformationRepresentation, "hasSOSActiveDevice"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v24,  AKAuthenticationHasSOSActiveDeviceKey);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation SOSNeeded](self->_userInformationRepresentation, "SOSNeeded"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation SOSNeeded](self->_userInformationRepresentation, "SOSNeeded"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v26,  AKAuthenticationSOSNeededKey);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInformation hasModernRecoveryKey]( self->_userInformationRepresentation,  "hasModernRecoveryKey"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInformation hasModernRecoveryKey]( self->_userInformationRepresentation,  "hasModernRecoveryKey"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v28,  AKAuthenticationHasModernRKKey);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInformation thirdPartyRegulatoryOverride]( self->_userInformationRepresentation,  "thirdPartyRegulatoryOverride"));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInformation thirdPartyRegulatoryOverride]( self->_userInformationRepresentation,  "thirdPartyRegulatoryOverride"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v30,  AK3PRegulatoryOverrideKey);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInformation previouslyWantedPrivateEmail]( self->_userInformationRepresentation,  "previouslyWantedPrivateEmail"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v31,  AKAuthenticationSelectedPrivateEmailKey);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation additionalInfo](self->_userInformationRepresentation, "additionalInfo"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v32,  AKAuthenticationAdditionalInfoKey);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation adpCohort](self->_userInformationRepresentation, "adpCohort"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v33,  AKAuthenticationADPCohortKey);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation edpState](self->_userInformationRepresentation, "edpState"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v34, AKEDPStateKey);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation passwordVersion](self->_userInformationRepresentation, "passwordVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v35, AKPasswordVersionKey);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation srpProtocol](self->_userInformationRepresentation, "srpProtocol"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v36, AKSRPProtocolKey);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation idmsEDPTokenId](self->_userInformationRepresentation, "idmsEDPTokenId"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v37, AKIdMSEDPTokenIdKey);

  id v38 = -[NSMutableDictionary copy](v3, "copy");
  return (NSDictionary *)v38;
}

- (AKUserInformation)userInformationRepresentation
{
  return self->_userInformationRepresentation;
}

- (void)setUserInformationRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end