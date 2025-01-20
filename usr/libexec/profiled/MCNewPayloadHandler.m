@interface MCNewPayloadHandler
+ (id)prioritizeUserInput:(id)a3 key:(id)a4 overField:(id)a5;
+ (id)promptDictionaryForKey:(id)a3 title:(id)a4 description:(id)a5 retypeDescription:(id)a6 finePrint:(id)a7 defaultValue:(id)a8 placeholderValue:(id)a9 minimumLength:(unint64_t)a10 fieldType:(int)a11 flags:(int)a12;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5;
- (MCNewPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (MCPayload)payload;
- (MCProfileHandler)profileHandler;
- (NSArray)userInputResponses;
- (id)_temporaryPersistentIDForIdentityUUID:(id)a3 outError:(id *)a4;
- (id)userInputFields;
- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4;
- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6;
- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6 personaID:(id)a7;
- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4;
- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6;
- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6 personaID:(id)a7;
- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4;
- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6;
- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 personaID:(id)a5;
- (void)setAsideWithInstaller:(id)a3;
- (void)setUserInputResponses:(id)a3;
@end

@implementation MCNewPayloadHandler

- (MCNewPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCNewPayloadHandler;
  v9 = -[MCNewPayloadHandler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payload, a3);
    objc_storeWeak((id *)&v10->_profileHandler, v8);
  }

  return v10;
}

- (id)userInputFields
{
  return +[NSArray array](&OBJC_CLASS___NSArray, "array");
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  return 1;
}

- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  return 1;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return 1;
}

- (BOOL)isInstalled
{
  return 1;
}

- (void)setAsideWithInstaller:(id)a3
{
}

- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:",  v7,  v6);
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v7,  v6);
}

- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 personaID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:",  v10,  v9,  1LL,  0LL,  v8);
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:",  v10,  v9,  1LL,  0LL,  v8);
}

- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:]( self,  "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:",  v11,  v10,  v7,  v6);
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:",  v11,  v10,  v7,  v6);
}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4
{
}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6 personaID:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [a7 length];
  v14 = (void **)&kMCDMCertificateToPayloadUUIDDependencyKey;
  if (v13) {
    v14 = (void **)&kMCDMEnterpriseCertificateToPayloadUUIDDependencyKey;
  }
  v15 = *v14;
  if (v13) {
    v16 = (id *)&kMCDMPayloadUUIDToEnterpriseCertificateDependencyKey;
  }
  else {
    v16 = (id *)&kMCDMPayloadUUIDToCertificateDependencyKey;
  }
  id v20 = v15;
  id v17 = *v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v12 MCHexString]);

  [v18 addDependent:v11 ofParent:v19 inDomain:v20 reciprocalDomain:v17 toSystem:v9 user:v8];
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4
{
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6 personaID:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [a7 length];
  v14 = (void **)&kMCDMCertificateToPayloadUUIDDependencyKey;
  if (v13) {
    v14 = (void **)&kMCDMEnterpriseCertificateToPayloadUUIDDependencyKey;
  }
  v15 = *v14;
  if (v13) {
    v16 = (id *)&kMCDMPayloadUUIDToEnterpriseCertificateDependencyKey;
  }
  else {
    v16 = (id *)&kMCDMPayloadUUIDToCertificateDependencyKey;
  }
  id v20 = v15;
  id v17 = *v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v12 MCHexString]);

  [v18 removeDependent:v11 fromParent:v19 inDomain:v20 reciprocalDomain:v17 fromSystem:v9 user:v8];
}

- (id)_temporaryPersistentIDForIdentityUUID:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if (!v6
    || (BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler")),
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadHandlerWithUUID:v6]),
        v7,
        !v8))
  {
    id v10 = 0LL;
LABEL_15:
    id v13 = 0LL;
    goto LABEL_16;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 certificatePersistentID]);
  if (v10)
  {
LABEL_14:
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUID]);
    -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v10,  v21);

    goto LABEL_15;
  }

  id v25 = 0LL;
  id v11 = [v8 copyIdentityImmediatelyWithInteractionClient:0 outError:&v25];
  id v12 = v25;
  id v13 = v12;
  if (!v12 && v11)
  {
    v24 = v11;
    id v14 = [v8 accessibility];
    v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Getting temporary persistent ID for identity, storing with accessibility %@",  buf,  0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v23 UUID]);
    uint64_t v17 = kMCAppleIdentitiesKeychainGroup;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 profile]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v24,  v16,  v17,  [v19 isInstalledForSystem],  v14));

    CFRelease(v24);
    goto LABEL_14;
  }

  if (!v12)
  {
    id v10 = 0LL;
    goto LABEL_14;
  }

  if (a4)
  {
    id v13 = v13;
    id v10 = 0LL;
    *a4 = v13;
  }

  else
  {
    id v10 = 0LL;
  }

+ (id)promptDictionaryForKey:(id)a3 title:(id)a4 description:(id)a5 retypeDescription:(id)a6 finePrint:(id)a7 defaultValue:(id)a8 placeholderValue:(id)a9 minimumLength:(unint64_t)a10 fieldType:(int)a11 flags:(int)a12
{
  return +[MCPayloadUserPromptUtilities promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCPayloadUserPromptUtilities,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLen gth:fieldType:flags:",  a3,  a4,  a5,  a6,  a7,  a8);
}

+ (id)prioritizeUserInput:(id)a3 key:(id)a4 overField:(id)a5
{
  return +[MCPayloadUserPromptUtilities prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCPayloadUserPromptUtilities,  "prioritizeUserInput:key:overField:",  a3,  a4,  a5);
}

- (MCPayload)payload
{
  return self->_payload;
}

- (MCProfileHandler)profileHandler
{
  return (MCProfileHandler *)objc_loadWeakRetained((id *)&self->_profileHandler);
}

- (NSArray)userInputResponses
{
  return self->_userInputResponses;
}

- (void)setUserInputResponses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end