@interface MCNewEmailAccountPayloadHandler
+ (id)MCACAccountIdentifierWithIncomingAccountInfo:(id)a3;
+ (id)MCACAccountIdentifierWithOutgoingAccountInfo:(id)a3;
+ (id)unhashedAccountIdentifierWithType:(id)a3 hostname:(id)a4 username:(id)a5;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (MCNewEmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (NSString)incomingACAccountIdentifier;
- (NSString)outgoingACAccountIdentifier;
- (id)_authSchemeForAuthenticationMethod:(id)a3;
- (id)_errorFromValidationError:(id)a3;
- (id)_incomingAccountInfoDictionaryWithUserInput:(id)a3 isPreflight:(BOOL)a4 outError:(id *)a5;
- (id)_incomingAccountWithAccountInfo:(id)a3;
- (id)_installWithIncomingAccountInfo:(id)a3 outgoingAccountInfo:(id)a4 isInstalledByMDM:(BOOL)a5 personaID:(id)a6 rmAccountIdentifier:(id)a7;
- (id)_outgoingAccountInfoDictionaryWithUserInput:(id)a3;
- (id)_outgoingAccountWithAccountInfo:(id)a3;
- (id)_persistentIDForCertificateUUID:(id)a3 notFoundLocErrorString:(id)a4 badLocErrorString:(id)a5 outError:(id *)a6;
- (id)_removeAccountWithPersistentResourceID:(id)a3 fromArray:(id)a4 outArray:(id *)a5;
- (id)userInputFields;
- (void)_remove;
- (void)_removePersonaIDForMailAccountWithPersistentResourceID:(id)a3;
- (void)_validateIncomingAccountOnThread;
- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5;
- (void)remove;
- (void)setAside;
- (void)setIncomingACAccountIdentifier:(id)a3;
- (void)setOutgoingACAccountIdentifier:(id)a3;
- (void)unsetAside;
@end

@implementation MCNewEmailAccountPayloadHandler

- (MCNewEmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCNewEmailAccountPayloadHandler;
  v4 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v8, "initWithPayload:profileHandler:", a3, a4);
  if (v4)
  {
    v5 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
    validationLock = v4->_validationLock;
    v4->_validationLock = v5;
  }

  return v4;
}

- (id)userInputFields
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountName]);

  if (!v5)
  {
    uint64_t v7 = kMCEAPEmailAccountNameKey;
    uint64_t v8 = MCLocalizedString(@"SENDER_NAME_PROMPT_TITLE", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
    uint64_t v11 = MCLocalizedFormat(@"SENDER_NAME_DESCRIPTION_P_ACCOUNT");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  v7,  v9,  v12,  0LL,  0LL,  0LL,  0LL,  0LL,  6LL));
    [v3 addObject:v13];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAddress]);

  if (!v14)
  {
    uint64_t v16 = kMCEAPEmailAddressKey;
    uint64_t v17 = MCLocalizedString(@"EMAIL_PROMPT_TITLE", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    uint64_t v20 = MCLocalizedFormat(@"EMAIL_PROMPT_DESCRIPTION");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  v16,  v18,  v21,  0LL,  0LL,  0LL,  0LL,  0LL,  2LL));
    [v3 addObject:v22];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 incomingMailServerUsername]);

  if (!v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
      v26 = @"EMAIL_INCOMING_USER_NAME_P_ACCOUNT";
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v4 incomingMailServerHostname]);
      v26 = @"EMAIL_INCOMING_USER_NAME_PROMPT";
    }

    uint64_t v27 = MCLocalizedFormat(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    uint64_t v29 = kMCEAPIncomingMailServerUsernameKey;
    uint64_t v31 = MCLocalizedString(@"USERNAME_PROMPT_TITLE", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  v29,  v32,  v28,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL));
    [v3 addObject:v33];
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 incomingMailServerAuthentication]);
  uint64_t v35 = kMCEmailAccountPayloadAuthenticationTypeNone;
  if (([v34 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeNone] & 1) == 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue([v4 incomingPassword]);

    if (v36) {
      goto LABEL_17;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
      v39 = @"EMAIL_INCOMING_PASSWORD_P_ACCOUNT";
    }

    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v4 incomingMailServerHostname]);
      v39 = @"EMAIL_INCOMING_PASSWORD_PROMPT";
    }

    uint64_t v40 = MCLocalizedFormat(v39);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v40);

    uint64_t v41 = kMCEAPIncomingPasswordKey;
    uint64_t v43 = MCLocalizedString(@"PASSWORD_PROMPT_TITLE", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    uint64_t v46 = MCLocalizedString(@"EMAIL_PASSWORD_PLACEHOLDER", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  v41,  v44,  v34,  0LL,  0LL,  0LL,  v47,  0LL,  3LL));
    [v3 addObject:v48];
  }

LABEL_17:
  v49 = (void *)objc_claimAutoreleasedReturnValue([v4 outgoingMailServerAuthentication]);
  unsigned __int8 v50 = [v49 isEqualToString:v35];

  if ((v50 & 1) == 0)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
      v74 = v52;
      v53 = @"EMAIL_OUTGOING_USER_NAME_P_ACCOUNT";
    }

    else
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue([v4 outgoingMailServerHostname]);
      v74 = v52;
      v53 = @"EMAIL_OUTGOING_USER_NAME_PROMPT";
    }

    uint64_t v54 = MCLocalizedFormat(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outgoingMailServerUsername", v74));
    if (!v56)
    {
      uint64_t v58 = kMCEAPOutgoingMailServerUsernameKey;
      uint64_t v59 = MCLocalizedString(@"USERNAME_PROMPT_TITLE", v57);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderVal ue:minimumLength:fieldType:flags:",  v58,  v60,  v55,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL));
      [v3 addObject:v61];
    }

    uint64_t v62 = objc_claimAutoreleasedReturnValue([v4 outgoingPassword]);
    if (v62)
    {
      v63 = (void *)v62;
    }

    else
    {
      if ([v4 outgoingPasswordSameAsIncomingPassword])
      {
LABEL_31:

        goto LABEL_32;
      }

      v64 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
      if (v64)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAccountDescription]);
        v66 = @"EMAIL_OUTGOING_PASSWORD_P_ACCOUNT";
      }

      else
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue([v4 outgoingMailServerHostname]);
        v66 = @"EMAIL_OUTGOING_PASSWORD_PROMPT";
      }

      uint64_t v67 = MCLocalizedFormat(v66);
      uint64_t v68 = objc_claimAutoreleasedReturnValue(v67);

      uint64_t v69 = kMCEAPOutgoingPasswordKey;
      uint64_t v71 = MCLocalizedString(@"PASSWORD_PROMPT_TITLE", v70);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderVal ue:minimumLength:fieldType:flags:",  v69,  v63,  v68,  0LL,  0LL,  0LL,  0LL,  0LL,  3LL));
      [v3 addObject:v72];

      v55 = (void *)v68;
    }

    goto LABEL_31;
  }

- (id)_authSchemeForAuthenticationMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeCRAMMD5])
  {
    v4 = (id *)&MFAuthSchemeCramMd5;
  }

  else if ([v3 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeNTLM])
  {
    v4 = (id *)&MFAuthSchemeNTLM;
  }

  else
  {
    if (![v3 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeHTTPMD5])
    {
      v5 = &stru_1000C4568;
      goto LABEL_8;
    }

    v4 = (id *)&MFAuthSchemeDigestMD5;
  }

  v5 = (__CFString *)*v4;
LABEL_8:

  return v5;
}

- (id)_persistentIDForCertificateUUID:(id)a3 notFoundLocErrorString:(id)a4 badLocErrorString:(id)a5 outError:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (a3)
  {
    id v12 = a3;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistentIDForCertificateUUID:v12]);

    if (v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 profile]);
      id v17 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:]( MCKeychain,  "copyIdentityWithPersistentID:useSystemKeychain:",  v14,  [v16 isInstalledForSystem]);

      if (v17)
      {
        CFRelease(v17);
        goto LABEL_11;
      }

      uint64_t v27 = MCEmailErrorDomain;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 friendlyName]);
      uint64_t v31 = v21;
      uint64_t v28 = MCErrorArray(v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v28);
      uint64_t v24 = MCErrorTypeFatal;
      uint64_t v25 = v27;
      uint64_t v26 = 7004LL;
    }

    else
    {
      uint64_t v19 = MCEmailErrorDomain;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 friendlyName]);
      uint64_t v31 = v21;
      uint64_t v22 = MCErrorArray(v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      uint64_t v24 = MCErrorTypeFatal;
      uint64_t v25 = v19;
      uint64_t v26 = 7003LL;
    }

    id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v25,  v26,  v23,  v24,  v31,  0LL));

    if (v29)
    {
      if (a6)
      {
        id v29 = v29;
        id v18 = 0LL;
        *a6 = v29;
      }

      else
      {
        id v18 = 0LL;
      }

      goto LABEL_12;
    }

+ (id)MCACAccountIdentifierWithIncomingAccountInfo:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"MCNewEmailAccountPayloadHandlerAccountType"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MailAccountHostname]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MFMailAccountUsername]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:hostname:username:]( &OBJC_CLASS___MCNewEmailAccountPayloadHandler,  "unhashedAccountIdentifierWithType:hostname:username:",  v4,  v5,  v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 MCHashedIdentifier]);

  return v8;
}

+ (id)MCACAccountIdentifierWithOutgoingAccountInfo:(id)a3
{
  uint64_t v3 = MailAccountHostname;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v3]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:MFMailAccountUsername]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:hostname:username:]( &OBJC_CLASS___MCNewEmailAccountPayloadHandler,  "unhashedAccountIdentifierWithType:hostname:username:",  @"smtp",  v5,  v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 MCHashedIdentifier]);

  return v8;
}

+ (id)unhashedAccountIdentifierWithType:(id)a3 hostname:(id)a4 username:(id)a5
{
  id v7 = a5;
  uint64_t v8 = 0LL;
  if (a3)
  {
    if (a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%@", a3, a4));
      uint64_t v8 = v9;
      if (v7)
      {
        if (v9)
        {
          uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingFormat:@"|%@", v7]);

          uint64_t v8 = (void *)v10;
        }
      }
    }
  }

  return v8;
}

- (id)_incomingAccountInfoDictionaryWithUserInput:(id)a3 isPreflight:(BOOL)a4 outError:(id *)a5
{
  BOOL v70 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v9 = kMCEAPEmailAddressKey;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 emailAddress]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v6,  v9,  v10));

  uint64_t v12 = kMCEAPIncomingMailServerUsernameKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 incomingMailServerUsername]);
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v6,  v12,  v13));

  uint64_t v14 = kMCEAPIncomingMailServerHostnameKey;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 incomingMailServerHostname]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v6,  v14,  v15));

  uint64_t v17 = kMCEAPIncomingPasswordKey;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 incomingPassword]);
  v75 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v6,  v17,  v18));

  uint64_t v19 = kMCEAPEmailAccountDescriptionKey;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 emailAccountDescription]);
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v6,  v19,  v20));

  uint64_t v21 = kMCEAPEmailAccountNameKey;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 emailAccountName]);
  uint64_t v23 = objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v6,  v21,  v22));

  if (v11)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
    [v7 MCSetObjectIfNotNil:v24 forKey:MailAccountEmailAddresses];
  }

  [v7 MCSetObjectIfNotNil:v76 forKey:MFMailAccountUsername];
  [v7 MCSetObjectIfNotNil:v16 forKey:MailAccountHostname];
  uint64_t v25 = MailAccountPassword;
  [v7 MCSetObjectIfNotNil:v75 forKey:MailAccountPassword];
  [v7 MCSetObjectIfNotNil:v74 forKey:MFMailAccountDescription];
  v72 = (void *)v23;
  [v7 MCSetObjectIfNotNil:v23 forKey:MailAccountFullUserName];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 incomingMailServerPortNumber]);
  [v7 MCSetObjectIfNotNil:v26 forKey:MailAccountPortNumber];

  if ([v8 incomingMailServerUseSSL])
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    [v7 setObject:v27 forKey:MailAccountSSLEnabled];
  }

  if ([v8 preventMove])
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 preventMove]));
    [v7 setObject:v28 forKey:MFMailAccountRestrictMessageTransfersToOtherAccounts];
  }

  if ([v8 preventAppSheet])
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 preventAppSheet]));
    [v7 setObject:v29 forKey:MFMailAccountRestrictSendingFromExternalProcesses];
  }

  if ([v8 isRecentsSyncingDisabled])
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    [v7 setObject:v30 forKey:MFMailAccountRestrictRecentsSyncing];
  }

  if ([v8 isMailDropEnabled])
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    [v7 setObject:v31 forKey:MFMailAccountSupportsMailDrop];
  }

  v73 = (void *)v11;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v8 emailAccountType]);
  unsigned int v33 = [v32 isEqualToString:kMCEmailAccountPayloadTypeIMAP];

  if (v33) {
    v34 = @"imap";
  }
  else {
    v34 = @"pop";
  }
  [v7 setValue:v34 forKey:@"MCNewEmailAccountPayloadHandlerAccountType"];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v8 incomingMailServerAuthentication]);
  v36 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _authSchemeForAuthenticationMethod:]( self,  "_authSchemeForAuthenticationMethod:",  v35));
  [v7 setObject:v36 forKey:MFMailAccountAuthenticationScheme];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v25]);
  if (v37) {
    v38 = &__kCFBooleanTrue;
  }
  else {
    v38 = &__kCFBooleanFalse;
  }
  [v7 setObject:v38 forKey:ACAccountPropertyShouldNeverUseSyncableCredential];
  v39 = (void *)objc_claimAutoreleasedReturnValue([v8 incomingMailServerIMAPPathPrefix]);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:hostname:username:]( &OBJC_CLASS___MCNewEmailAccountPayloadHandler,  "unhashedAccountIdentifierWithType:hostname:username:",  v34,  v16,  v76));
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v8 profile]);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 displayName]);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%@", v40, v42));

  [v7 setObject:v43 forKey:MailAccountManagedTag];
  if (![v8 SMIMEEnabled])
  {
    id v48 = 0LL;
    goto LABEL_52;
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue([v8 SMIMESigningIdentityUUID]);

  if (v44)
  {
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v8 SMIMESigningIdentityUUID]);
    if (v70)
    {
      uint64_t v80 = 0LL;
      uint64_t v46 = (id *)&v80;
      uint64_t v47 = objc_claimAutoreleasedReturnValue( -[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:]( self,  "_temporaryPersistentIDForIdentityUUID:outError:",  v45,  &v80));
    }

    else
    {
      uint64_t v79 = 0LL;
      uint64_t v46 = (id *)&v79;
      uint64_t v47 = objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:]( self,  "_persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:",  v45,  @"EMAIL_ERROR_SMIME_SIGNING_CERT_NOT_FOUND_P_PAYLOAD",  @"EMAIL_ERROR_SMIME_SIGNING_CERT_BAD_P_PAYLOAD",  &v79));
    }

    v49 = (void *)v47;
    id v48 = *v46;

    if (v48) {
      goto LABEL_51;
    }
    if (!v49)
    {
      uint64_t v61 = MCEmailErrorDomain;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v52 friendlyName]);
      uint64_t v62 = MCErrorArray(@"EMAIL_ERROR_SMIME_SIGNING_CERT_NOT_FOUND_P_PAYLOAD");
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(v62);
      id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v61,  7003LL,  v57,  MCErrorTypeFatal,  v69,  0LL));
      goto LABEL_50;
    }

    [v7 setObject:v49 forKey:@"MCSMIMESigningIdentityPersistentID"];
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v8 SMIMESigningEnabled]);
  if (v49)
  {
    [v7 setObject:v49 forKey:MFMailAccountSigningEnabled];
  }

  else
  {
    unsigned __int8 v50 = (void *)objc_claimAutoreleasedReturnValue([v8 SMIMESigningIdentityUUID]);

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      [v7 setObject:v51 forKey:MFMailAccountSigningEnabled];
    }
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 SMIMESigningUserOverrideable]));
  [v7 setObject:v52 forKey:@"SMIMESigningUserOverrideable"];
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 SMIMESigningIdentityUserOverrideable]));
  objc_msgSend(v7, "setObject:forKey:");
  v53 = (void *)objc_claimAutoreleasedReturnValue([v8 SMIMEEncryptionIdentityUUID]);

  if (!v53)
  {
LABEL_42:
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v8 SMIMEEncryptionEnabled]);
    if (v57)
    {
      [v7 setObject:v57 forKey:MFMailAccountEncryptionEnabled];
    }

    else
    {
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v8 SMIMEEncryptionIdentityUUID]);

      if (v58)
      {
        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        [v7 setObject:v59 forKey:MFMailAccountEncryptionEnabled];
      }
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 SMIMEEncryptionIdentityUserOverrideable]));
    [v7 setObject:v60 forKey:@"SMIMEEncryptionIdentityUserOverrideable"];

    id v48 = 0LL;
    goto LABEL_50;
  }

  uint64_t v68 = v52;
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v8 SMIMEEncryptionIdentityUUID]);
  if (v70)
  {
    uint64_t v78 = 0LL;
    v55 = (id *)&v78;
    uint64_t v56 = objc_claimAutoreleasedReturnValue( -[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:]( self,  "_temporaryPersistentIDForIdentityUUID:outError:",  v54,  &v78));
  }

  else
  {
    uint64_t v77 = 0LL;
    v55 = (id *)&v77;
    uint64_t v56 = objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:]( self,  "_persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:",  v54,  @"EMAIL_ERROR_SMIME_ENCRYPTION_CERT_NOT_FOUND_P_PAYLOAD",  @"EMAIL_ERROR_SMIME_ENCRYPTION_CERT_BAD_P_PAYLOAD",  &v77));
  }

  uint64_t v57 = (void *)v56;
  id v48 = *v55;

  if (!v48)
  {
    [v7 setObject:v57 forKey:@"MCSMIMEEncryptionIdentityPersistentID"];

    v52 = v68;
    goto LABEL_42;
  }

  v52 = v68;
LABEL_50:

LABEL_51:
LABEL_52:

  if (v48)
  {
    os_log_t v63 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v64 = v63;
      v65 = (void *)objc_claimAutoreleasedReturnValue([v48 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      v82 = v65;
      _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Cannot create incoming account dictionary. Error: %{public}@",  buf,  0xCu);
    }

    id v66 = 0LL;
    if (a5) {
      *a5 = v48;
    }
  }

  else
  {
    id v66 = v7;
  }

  return v66;
}

- (id)_incomingAccountWithAccountInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"MCNewEmailAccountPayloadHandlerAccountType"]);
  unsigned int v6 = [v5 isEqualToString:@"imap"];
  id v7 = &OBJC_CLASS___IMAPAccount_ptr;
  if (!v6) {
    id v7 = &OBJC_CLASS___POPAccount_ptr;
  }
  uint64_t v8 = (objc_class *)objc_opt_class(*v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  unsigned int v10 = [v9 userMode];

  if (v10 == 1)
  {
    uint64_t v47 = v5;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    uint64_t v12 = v11;
    v13 = &ACAccountTypeIdentifierIMAP;
    if (!v6) {
      v13 = &ACAccountTypeIdentifierPOP;
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 accountTypeWithAccountTypeIdentifier:*v13]);
    uint64_t v15 = -[ACAccount initWithAccountType:](objc_alloc(&OBJC_CLASS___ACAccount), "initWithAccountType:", v14);
    -[ACAccount setManagingOwnerIdentifier:](v15, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 friendlyName]);
    -[ACAccount setManagingSourceName:](v15, "setManagingSourceName:", v17);

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewEmailAccountPayloadHandler MCACAccountIdentifierWithIncomingAccountInfo:]( &OBJC_CLASS___MCNewEmailAccountPayloadHandler,  "MCACAccountIdentifierWithIncomingAccountInfo:",  v4));
    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount identifier](v15, "identifier"));
      -[ACAccount setAccountProperty:forKey:](v15, "setAccountProperty:forKey:", v19, @"MCAccountIdentifer");

      -[ACAccount setIdentifier:](v15, "setIdentifier:", v18);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "supportedDataclassesForAccountType:", v14, v12));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v21 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v53 != v23) {
            objc_enumerationMutation(v20);
          }
          -[ACAccount setProvisioned:forDataclass:]( v15,  "setProvisioned:forDataclass:",  1LL,  *(void *)(*((void *)&v52 + 1) + 8LL * (void)i));
        }

        id v22 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }

      while (v22);
    }

    -[ACAccount setAuthenticated:](v15, "setAuthenticated:", 1LL);
    id v25 = [v4 mutableCopy];
    uint64_t v26 = NSStringFromClass(v8);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    [v25 setObject:v27 forKey:MFMailAccountClass];

    id v28 = [[v8 alloc] initWithPersistentAccount:v15];
    [v28 _setAccountProperties:v25];

    v5 = v47;
  }

  else
  {
    id v28 = -[objc_class newAccountWithDictionary:](v8, "newAccountWithDictionary:", v4);
    uint64_t v29 = kMCAccountManagingOwnerIdentifier;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 persistentAccount]);
    [v30 setManagingOwnerIdentifier:v29];

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 friendlyName]);
    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v28 persistentAccount]);
    [v33 setManagingSourceName:v32];
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v28 persistentAccount]);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 provisionedDataclasses]);

  id v36 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v49;
    do
    {
      for (j = 0LL; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)j);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v28 persistentAccount]);
        [v41 setEnabled:1 forDataclass:v40];
      }

      id v37 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }

    while (v37);
  }

  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v28 persistentAccount]);
  uint64_t v43 = (NSString *)objc_claimAutoreleasedReturnValue([v42 identifier]);
  incomingACAccountIdentifier = self->_incomingACAccountIdentifier;
  self->_incomingACAccountIdentifier = v43;

  return v28;
}

- (id)_outgoingAccountInfoDictionaryWithUserInput:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v7 = kMCEAPOutgoingMailServerUsernameKey;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 outgoingMailServerUsername]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v4,  v7,  v8));

  uint64_t v10 = kMCEAPOutgoingMailServerHostnameKey;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 outgoingMailServerHostname]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v4,  v10,  v11));

  uint64_t v13 = kMCEAPIncomingPasswordKey;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 incomingPassword]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v4,  v13,  v14));

  uint64_t v16 = kMCEAPOutgoingPasswordKey;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 outgoingPassword]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v4,  v16,  v17));

  [v6 MCSetObjectIfNotNil:v9 forKey:MFMailAccountUsername];
  [v6 MCSetObjectIfNotNil:v12 forKey:MailAccountHostname];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 outgoingMailServerPortNumber]);
  [v6 MCSetObjectIfNotNil:v19 forKey:MailAccountPortNumber];

  if (v15 && [v5 outgoingPasswordSameAsIncomingPassword])
  {
    uint64_t v20 = MailAccountPassword;
    id v21 = v6;
    id v22 = v15;
  }

  else
  {
    uint64_t v20 = MailAccountPassword;
    if (!v18) {
      goto LABEL_7;
    }
    id v21 = v6;
    id v22 = v18;
  }

  [v21 setObject:v22 forKey:v20];
LABEL_7:
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 outgoingMailServerAuthentication]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _authSchemeForAuthenticationMethod:]( self,  "_authSchemeForAuthenticationMethod:",  v23));
  [v6 setObject:v24 forKey:MFMailAccountAuthenticationScheme];

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v20]);
  if (v25) {
    uint64_t v26 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v26 = &__kCFBooleanFalse;
  }
  [v6 setObject:v26 forKey:ACAccountPropertyShouldNeverUseSyncableCredential];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:hostname:username:]( &OBJC_CLASS___MCNewEmailAccountPayloadHandler,  "unhashedAccountIdentifierWithType:hostname:username:",  @"smtp",  v12,  v9));
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
  uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 displayName]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%@", v27, v29));

  [v6 setObject:v30 forKey:MailAccountManagedTag];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v5 outgoingMailServerAuthentication]);
  LOBYTE(v29) = [v31 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeNone];

  if ((v29 & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    [v6 setObject:v32 forKey:DeliveryAccountShouldUseAuthentication];
  }

  if ([v5 outgoingMailServerUseSSL])
  {
    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    [v6 setObject:v33 forKey:MailAccountSSLEnabled];
  }

  return v6;
}

- (id)_outgoingAccountWithAccountInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  unsigned int v6 = [v5 userMode];

  if (v6 == 1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierSMTP]);
    uint64_t v9 = -[ACAccount initWithAccountType:](objc_alloc(&OBJC_CLASS___ACAccount), "initWithAccountType:", v8);
    -[ACAccount setManagingOwnerIdentifier:](v9, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 friendlyName]);
    -[ACAccount setManagingSourceName:](v9, "setManagingSourceName:", v11);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewEmailAccountPayloadHandler MCACAccountIdentifierWithOutgoingAccountInfo:]( &OBJC_CLASS___MCNewEmailAccountPayloadHandler,  "MCACAccountIdentifierWithOutgoingAccountInfo:",  v4));
    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount identifier](v9, "identifier"));
      -[ACAccount setAccountProperty:forKey:](v9, "setAccountProperty:forKey:", v13, @"MCAccountIdentifer");

      -[ACAccount setIdentifier:](v9, "setIdentifier:", v12);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 supportedDataclassesForAccountType:v8]);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        id v18 = 0LL;
        do
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          -[ACAccount setProvisioned:forDataclass:]( v9,  "setProvisioned:forDataclass:",  1LL,  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v18));
          id v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v16);
    }

    -[ACAccount setAuthenticated:](v9, "setAuthenticated:", 1LL);
    id v19 = [v4 mutableCopy];
    uint64_t v20 = (objc_class *)objc_opt_class(&OBJC_CLASS___SMTPAccount);
    id v21 = NSStringFromClass(v20);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v19 setObject:v22 forKey:MFMailAccountClass];

    id v23 = [[SMTPAccount alloc] initWithPersistentAccount:v9];
    [v23 _setAccountProperties:v19];
  }

  else
  {
    id v23 = +[SMTPAccount newAccountWithDictionary:](&OBJC_CLASS___SMTPAccount, "newAccountWithDictionary:", v4);
    uint64_t v24 = kMCAccountManagingOwnerIdentifier;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 persistentAccount]);
    [v25 setManagingOwnerIdentifier:v24];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 friendlyName]);
    uint64_t v9 = (ACAccount *)objc_claimAutoreleasedReturnValue([v23 persistentAccount]);
    -[ACAccount setManagingSourceName:](v9, "setManagingSourceName:", v8);
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v23 persistentAccount]);
  uint64_t v27 = (NSString *)objc_claimAutoreleasedReturnValue([v26 identifier]);
  outgoingACAccountIdentifier = self->_outgoingACAccountIdentifier;
  self->_outgoingACAccountIdentifier = v27;

  return v23;
}

- (void)_validateIncomingAccountOnThread
{
  uint64_t v3 = objc_autoreleasePoolPush();
  self->_validationResult = 0;
  self->_validationDone = 0;
  id v4 = objc_alloc_init(&OBJC_CLASS___MFAccountValidator);
  [v4 setDelegate:self];
  [v4 validateAccount:self->_incomingAccount useSSL:self->_incomingAccountUsesSSL];
  while (!self->_validationDone)
  {
    v5 = -[NSDate initWithTimeIntervalSinceNow:](objc_alloc(&OBJC_CLASS___NSDate), "initWithTimeIntervalSinceNow:", 0.3);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v6 runUntilDate:v5];
  }

  -[NSConditionLock lockWhenCondition:](self->_validationLock, "lockWhenCondition:", 1LL);
  -[NSConditionLock unlockWithCondition:](self->_validationLock, "unlockWithCondition:", 2LL);

  objc_autoreleasePoolPop(v3);
}

- (id)_errorFromValidationError:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  id v4 = (char *)[v3 code];
  id v5 = MCErrorTypeSkippable;
  if ((unint64_t)(v4 - 1042) >= 3)
  {
    if (v4 == (char *)1030)
    {
      uint64_t v7 = 7002LL;
      goto LABEL_10;
    }

    unsigned int v6 = (id *)&MCErrorTypeFatal;
    if (v4 == (char *)1032)
    {
      unsigned int v6 = (id *)&MCErrorTypeRetryable;
      uint64_t v7 = 7001LL;
    }

    else
    {
      uint64_t v7 = 7002LL;
    }
  }

  else
  {
    unsigned int v6 = (id *)&MCErrorTypeRetryable;
    uint64_t v7 = 7000LL;
  }

  id v9 = *v6;

  id v5 = v9;
LABEL_10:
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);

  if (!v10)
  {
    uint64_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = (int)v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Validation error %u does not have a description.",  buf,  8u);
    }

    uint64_t v12 = MCLocalizedFormat(@"UNKNOWN_ERROR");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

  uint64_t v13 = MCEmailErrorDomain;
  uint64_t v14 = MCErrorArrayFromLocalizedDescription(v10);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v13,  v7,  v15,  v5));

  return v16;
}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  id v7 = a3;
  uint64_t v8 = (DeliveryAccount *)a4;
  if (![v7 accountIsValid])
  {
    self->_validationResult = 0;
    if (self->_incomingAccount == v8)
    {
      os_log_t v15 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v11 = v15;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 MCVerboseDescription]);
      int v19 = 138543362;
      uint64_t v20 = v13;
      uint64_t v14 = "Error validating incoming server information: %{public}@";
    }

    else
    {
      if (self->_outgoingAccount != v8) {
        goto LABEL_13;
      }
      os_log_t v10 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v11 = v10;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 MCVerboseDescription]);
      int v19 = 138543362;
      uint64_t v20 = v13;
      uint64_t v14 = "Error validating outgoing server information: %{public}@";
    }

    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, 0xCu);

    goto LABEL_13;
  }

  outgoingAccount = self->_outgoingAccount;
  if (self->_incomingAccount == v8)
  {
    [v7 validateAccount:outgoingAccount useSSL:self->_outgoingAccountUsesSSL];
    goto LABEL_16;
  }

  if (outgoingAccount == v8)
  {
    self->_validationResult = 1;
LABEL_13:
    if (!self->_validationResult)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
      uint64_t v17 = (NSError *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _errorFromValidationError:]( self,  "_errorFromValidationError:",  v16));
      validationError = self->_validationError;
      self->_validationError = v17;
    }

    self->_validationDone = 1;
  }

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v48 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:]( self,  "_incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:",  v6,  1LL,  &v48));
  id v9 = (NSError *)v48;
  if (v9)
  {
    os_log_t v10 = v9;

    goto LABEL_17;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _outgoingAccountInfoDictionaryWithUserInput:]( self,  "_outgoingAccountInfoDictionaryWithUserInput:",  v6));
  uint64_t v12 = (MailAccount *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _incomingAccountWithAccountInfo:]( self,  "_incomingAccountWithAccountInfo:",  v8));
  incomingAccount = self->_incomingAccount;
  self->_incomingAccount = v12;

  self->_incomingAccountUsesSSL = [v7 incomingMailServerUseSSL];
  uint64_t v14 = (DeliveryAccount *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _outgoingAccountWithAccountInfo:]( self,  "_outgoingAccountWithAccountInfo:",  v11));
  outgoingAccount = self->_outgoingAccount;
  self->_outgoingAccount = v14;

  self->_outgoingAccountUsesSSL = [v7 outgoingMailServerUseSSL];
  if (!self->_incomingAccount)
  {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v7 emailAccountType]);
    unsigned int v32 = [v31 isEqualToString:kMCEmailAccountPayloadTypeIMAP];

    uint64_t v33 = MCEmailErrorDomain;
    uint64_t v29 = (NSError *)objc_claimAutoreleasedReturnValue([v7 emailAccountDescription]);
    uint64_t v47 = v29;
    if (v32)
    {
      uint64_t v34 = MCErrorArray(@"EMAIL_ERROR_IMAP_BAD_P_PAYLOAD");
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      uint64_t v36 = MCErrorTypeFatal;
      uint64_t v37 = v33;
      uint64_t v38 = 7005LL;
    }

    else
    {
      uint64_t v41 = MCErrorArray(@"EMAIL_ERROR_POP_BAD_P_PAYLOAD");
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v41);
      uint64_t v36 = MCErrorTypeFatal;
      uint64_t v37 = v33;
      uint64_t v38 = 7006LL;
    }

    goto LABEL_15;
  }

  if (!self->_outgoingAccount)
  {
    uint64_t v39 = MCEmailErrorDomain;
    uint64_t v29 = (NSError *)objc_claimAutoreleasedReturnValue([v7 emailAccountDescription]);
    uint64_t v47 = v29;
    uint64_t v40 = MCErrorArray(@"EMAIL_ERROR_SMTP_BAD_P_PAYLOAD");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v40);
    uint64_t v36 = MCErrorTypeFatal;
    uint64_t v37 = v39;
    uint64_t v38 = 7007LL;
LABEL_15:
    os_log_t v10 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v37,  v38,  v35,  v36,  v47,  0LL));

    goto LABEL_16;
  }

  os_log_t v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v16;
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v7 emailAccountDescription]);
    *(_DWORD *)buf = 138543362;
    __int128 v50 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Validating account “%{public}@”", buf, 0xCu);
  }

  -[NSConditionLock lock](self->_validationLock, "lock");
  -[NSConditionLock unlockWithCondition:](self->_validationLock, "unlockWithCondition:", 1LL);
  int v19 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "_validateIncomingAccountOnThread",  0LL);
  validationThread = self->_validationThread;
  self->_validationThread = v19;

  -[NSThread start](self->_validationThread, "start");
  -[NSConditionLock lockWhenCondition:](self->_validationLock, "lockWhenCondition:", 2LL);
  -[NSConditionLock unlock](self->_validationLock, "unlock");
  id v21 = self->_validationThread;
  self->_validationThread = 0LL;

  id v22 = self->_incomingAccount;
  self->_incomingAccount = 0LL;

  id v23 = self->_outgoingAccount;
  self->_outgoingAccount = 0LL;

  os_log_t v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    id v25 = v24;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 emailAccountDescription]);
    uint64_t v27 = MCStringForBool(self->_validationResult);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138543618;
    __int128 v50 = v26;
    __int16 v51 = 2114;
    __int128 v52 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Validation of account “%{public}@” done. Result: %{public}@",  buf,  0x16u);
  }

  uint64_t v29 = self->_validationError;
  validationError = self->_validationError;
  self->_validationError = 0LL;

  if (self->_validationResult)
  {
    os_log_t v10 = 0LL;
  }

  else
  {
    uint64_t v29 = v29;
    os_log_t v10 = v29;
  }

- (id)_installWithIncomingAccountInfo:(id)a3 outgoingAccountInfo:(id)a4 isInstalledByMDM:(BOOL)a5 personaID:(id)a6 rmAccountIdentifier:(id)a7
{
  BOOL v60 = a5;
  id v10 = a3;
  id v11 = a4;
  id v62 = a7;
  v64 = v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _incomingAccountWithAccountInfo:]( self,  "_incomingAccountWithAccountInfo:",  v10));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 profile]);
  os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
  uint64_t v16 = kMCAccountProfileUUIDKey;
  [v12 setAccountProperty:v15 forKey:kMCAccountProfileUUIDKey];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUID]);
  uint64_t v19 = kMCAccountPayloadUUIDKey;
  [v12 setAccountProperty:v18 forKey:kMCAccountPayloadUUIDKey];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 profile]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
  uint64_t v23 = ACAccountPropertyConfigurationProfileIdentifier;
  [v12 setAccountProperty:v22 forKey:ACAccountPropertyConfigurationProfileIdentifier];

  os_log_t v63 = v11;
  os_log_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _outgoingAccountWithAccountInfo:]( self,  "_outgoingAccountWithAccountInfo:",  v11));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 profile]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUID]);
  [v24 setAccountProperty:v27 forKey:v16];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUID]);
  [v24 setAccountProperty:v29 forKey:v19];

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 profile]);
  unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
  [v24 setAccountProperty:v32 forKey:v23];

  [v12 setDeliveryAccount:v24];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](&OBJC_CLASS___MailAccount, "mailAccounts"));
  id v34 = [v33 mutableCopy];

  [v34 addObject:v12];
  uint64_t v61 = v34;
  +[MailAccount setMailAccounts:](&OBJC_CLASS___MailAccount, "setMailAccounts:", v34);
  if (v62)
  {
    uint64_t v35 = ACAccountPropertyRemoteManagingAccountIdentifier;
    [v12 setAccountProperty:v62 forKey:ACAccountPropertyRemoteManagingAccountIdentifier];
    [v24 setAccountProperty:v62 forKey:v35];
  }

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if (v60) {
    [v12 setValueInAccountProperties:&__kCFBooleanTrue forKey:@"MCAccountIsManaged"];
  }
  uint64_t v37 = v64;
  if ([v36 SMIMEEnabled])
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v36 SMIMEPerMessageSwitchEnabled]));
    [v12 setAccountProperty:v38 forKey:MFMailAccountPerMessageEncryptionEnabled];
  }

  [v12 savePersistentAccount];
  +[DeliveryAccount addDeliveryAccount:](&OBJC_CLASS___DeliveryAccount, "addDeliveryAccount:", v24);
  if (v60) {
    [v24 setValueInAccountProperties:&__kCFBooleanTrue forKey:@"MCAccountIsManaged"];
  }
  if ([v36 SMIMEEnabled])
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v36 SMIMEPerMessageSwitchEnabled]));
    [v24 setAccountProperty:v39 forKey:MFMailAccountPerMessageEncryptionEnabled];
  }

  [v24 savePersistentAccount];
  if ([v36 SMIMEEnabled])
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKey:@"MCSMIMESigningIdentityPersistentID"]);
    if (v40)
    {
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKey:MailAccountEmailAddresses]);
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      id v42 = [v41 countByEnumeratingWithState:&v69 objects:v76 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v70;
        do
        {
          for (i = 0LL; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v70 != v44) {
              objc_enumerationMutation(v41);
            }
            [v12 setSigningIdentityPersistentReference:v40 forAddress:*(void *)(*((void *)&v69 + 1) + 8 * (void)i)];
          }

          id v43 = [v41 countByEnumeratingWithState:&v69 objects:v76 count:16];
        }

        while (v43);
      }

      [v36 setSMIMESigningIdentityPersistentID:v40];

      uint64_t v37 = v64;
    }

    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"MCSMIMEEncryptionIdentityPersistentID"]);
    if (v46)
    {
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:MailAccountEmailAddresses]);
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v48 = [v47 countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v48)
      {
        id v49 = v48;
        uint64_t v50 = *(void *)v66;
        do
        {
          for (j = 0LL; j != v49; j = (char *)j + 1)
          {
            if (*(void *)v66 != v50) {
              objc_enumerationMutation(v47);
            }
            [v12 setEncryptionIdentityPersistentReference:v46 forAddress:*(void *)(*((void *)&v65 + 1) + 8 * (void)j)];
          }

          id v49 = [v47 countByEnumeratingWithState:&v65 objects:v75 count:16];
        }

        while (v49);
      }

      [v36 setSMIMEEncryptionIdentityPersistentID:v46];

      uint64_t v37 = v64;
    }
  }

  v73[0] = @"IncomingAccountInfo";
  v73[1] = @"OutgoingAccountInfo";
  v74[0] = v37;
  v74[1] = v63;
  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  2LL));
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v52,  200LL,  0LL,  0LL));
  if (v53)
  {
    __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 UUID]);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v56 profile]);
    +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:]( MCKeychain,  "setData:forService:account:label:description:useSystemKeychain:outError:",  v53,  @"MCEmailAccount",  v55,  0,  0,  [v57 isInstalledForSystem],  0);

    uint64_t v37 = v64;
  }

  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v12 accountPropertyForKey:MailAccountManagedTag]);

  return v58;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
  id v10 = [v9 BOOLValue];

  if (!(_DWORD)v10)
  {
    uint64_t v14 = 0LL;
    goto LABEL_5;
  }

  uint64_t v11 = kMDMPersonaKey;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMDMPersonaKey]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v11]);
  }
  else {
    uint64_t v14 = 0LL;
  }

  uint64_t v16 = kMCInstallProfileOptionManagingProfileIdentifier;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
  {
    os_log_t v15 = 0LL;
    goto LABEL_11;
  }

  uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v16]);

  if (!v19)
  {
LABEL_5:
    os_log_t v15 = 0LL;
    goto LABEL_12;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v19));

  os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
  uint64_t v17 = (void *)v19;
LABEL_11:

LABEL_12:
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
  id v34 = 0LL;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:]( self,  "_incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:",  v22,  0LL,  &v34));
  id v24 = v34;

  if (v24)
  {

    os_log_t v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = v25;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 friendlyName]);
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v28;
      __int16 v37 = 2114;
      id v38 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Could not install email payload %{public}@. Error: %{public}@",  buf,  0x16u);
    }

    if (a6) {
      *a6 = [v24 MCCopyAsPrimaryError];
    }
  }

  else
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _outgoingAccountInfoDictionaryWithUserInput:]( self,  "_outgoingAccountInfoDictionaryWithUserInput:",  v29));

    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:]( self,  "_installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:",  v23,  v30,  v10,  v14,  v15));
    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    [v32 setPersistentResourceID:v31];
    [v32 setIncomingACAccountIdentifier:self->_incomingACAccountIdentifier];
    [v32 setOutgoingACAccountIdentifier:self->_outgoingACAccountIdentifier];
  }

  return v24 == 0LL;
}

- (BOOL)isInstalled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentResourceID]);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](&OBJC_CLASS___MailAccount, "mailAccounts"));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = MailAccountManagedTag;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "accountPropertyForKey:",  v8,  (void)v13));
        if (v10 && ([v3 isEqualToString:v10] & 1) != 0)
        {

          BOOL v11 = 1;
          goto LABEL_12;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (id)_removeAccountWithPersistentResourceID:(id)a3 fromArray:(id)a4 outArray:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v22;
    uint64_t v14 = MailAccountManagedTag;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v9);
        }
        __int128 v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountPropertyForKey:v14]);
        if (v17 && ([v6 isEqualToString:v17] & 1) != 0)
        {
          id v18 = v16;

          uint64_t v12 = v18;
        }

        else
        {
          [v8 addObject:v16];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  if (a5) {
    *a5 = v8;
  }

  return v12;
}

- (void)_removePersonaIDForMailAccountWithPersistentResourceID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v33[0] = ACAccountTypeIdentifierPOP;
  v33[1] = ACAccountTypeIdentifierAol;
  v33[2] = ACAccountTypeIdentifierYahoo;
  v33[3] = ACAccountTypeIdentifierGmail;
  v33[4] = ACAccountTypeIdentifierIMAP;
  v33[5] = ACAccountTypeIdentifierIMAPMail;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 6LL));
  __int128 v22 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountsWithAccountTypeIdentifiers:v5 error:0]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v25;
    uint64_t v12 = MailAccountManagedTag;
    uint64_t v21 = ACAccountPropertyPersonaIdentifier;
    *(void *)&__int128 v9 = 138412546LL;
    __int128 v20 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountPropertyForKey:", v12, v20));
        if (v15)
        {
          if ([v3 isEqualToString:v15])
          {
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 personaIdentifier]);

            if (v16)
            {
              uint64_t v17 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v29 = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Removing personaIdentifier for mail account: %@",  buf,  0xCu);
              }

              [v14 setAccountProperty:0 forKey:v21];
              id v23 = 0LL;
              [v22 saveVerifiedAccount:v14 error:&v23];
              id v18 = v23;
              if (v18)
              {
                uint64_t v19 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v20;
                  uint64_t v29 = v14;
                  __int16 v30 = 2114;
                  id v31 = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to remove personaIdentifier for mail account: %@, error: %{public}@",  buf,  0x16u);
                }
              }
            }
          }
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v10);
  }
}

- (void)_remove
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);

  -[MCNewEmailAccountPayloadHandler _removePersonaIDForMailAccountWithPersistentResourceID:]( self,  "_removePersonaIDForMailAccountWithPersistentResourceID:",  v4);
  +[MailAccount reloadAccounts](&OBJC_CLASS___MailAccount, "reloadAccounts");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](&OBJC_CLASS___MailAccount, "mailAccounts"));
  id v13 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewEmailAccountPayloadHandler _removeAccountWithPersistentResourceID:fromArray:outArray:]( self,  "_removeAccountWithPersistentResourceID:fromArray:outArray:",  v4,  v5,  &v13));
  id v7 = v13;

  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deliveryAccount]);
    +[DeliveryAccount removeDeliveryAccount:](&OBJC_CLASS___DeliveryAccount, "removeDeliveryAccount:", v8);

    +[MailAccount setMailAccounts:](&OBJC_CLASS___MailAccount, "setMailAccounts:", v7);
    [v6 removePersistentAccount];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  @"MCEmailAccount",  v10,  0,  0,  [v12 isInstalledForSystem],  0);
  }
}

- (void)remove
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned int v4 = [v3 isSetAside];

  if (v4)
  {
    setAsideAccountInfo = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = 0LL;
  }

  else
  {
    -[MCNewEmailAccountPayloadHandler _remove](self, "_remove");
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  [v6 setPersistentResourceID:0];
}

- (void)setAside
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:]( MCKeychain,  "dataFromService:account:label:description:useSystemKeychain:outError:",  @"MCEmailAccount",  v4,  0,  0,  [v6 isInstalledForSystem],  0));

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](&OBJC_CLASS___MailAccount, "mailAccounts"));
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    __int128 v24 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = MailAccountManagedTag;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountPropertyForKey:", v10, v24));
        if (v13)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 persistentResourceID]);
          unsigned int v16 = [v15 isEqualToString:v13];

          if (v16)
          {
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 valueInAccountPropertiesForKey:@"MCAccountIsManaged"]);
            LOBYTE(v8) = [v19 BOOLValue];

            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v12 persistentAccount]);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:ACAccountPropertyPersonaIdentifier]);

            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 persistentAccount]);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v21 objectForKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier]);

            goto LABEL_12;
          }
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    uint64_t v17 = 0LL;
    id v18 = 0LL;
LABEL_12:
    id v7 = v24;
  }

  else
  {
    uint64_t v17 = 0LL;
    id v18 = 0LL;
  }

  if (v7)
  {
    __int128 v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v7,  0LL,  0LL,  0LL));
    setAsideAccountInfo = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = v22;

    self->_wasInstalledByMDM = (char)v8;
    objc_storeStrong((id *)&self->_personaID, v18);
    objc_storeStrong((id *)&self->_rmAccountIdentifier, v17);
  }

  -[MCNewEmailAccountPayloadHandler _remove](self, "_remove");
}

- (void)unsetAside
{
  setAsideAccountInfo = self->_setAsideAccountInfo;
  if (setAsideAccountInfo)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](setAsideAccountInfo, "objectForKey:", @"IncomingAccountInfo"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_setAsideAccountInfo,  "objectForKey:",  @"OutgoingAccountInfo"));
    id v6 =  -[MCNewEmailAccountPayloadHandler _installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:]( self,  "_installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:",  v4,  v5,  self->_wasInstalledByMDM,  self->_personaID,  self->_rmAccountIdentifier);

    id v7 = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = 0LL;
  }

- (NSString)incomingACAccountIdentifier
{
  return self->_incomingACAccountIdentifier;
}

- (void)setIncomingACAccountIdentifier:(id)a3
{
}

- (NSString)outgoingACAccountIdentifier
{
  return self->_outgoingACAccountIdentifier;
}

- (void)setOutgoingACAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end