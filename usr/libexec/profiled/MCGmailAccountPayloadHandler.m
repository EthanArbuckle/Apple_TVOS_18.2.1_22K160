@interface MCGmailAccountPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (MCGmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (NSDictionary)setAsideAccountDictionary;
- (id)MCACAccountIdentifier;
- (id)_installWithAccountDictionary:(id)a3;
- (id)accountDictionaryWithIsInstalledByMDM:(BOOL)a3 personaID:(id)a4 rmAccountIdentifier:(id)a5;
- (id)unhashedAccountIdentifier;
- (void)_remove;
- (void)remove;
- (void)setAside;
- (void)setSetAsideAccountDictionary:(id)a3;
- (void)unsetAside;
@end

@implementation MCGmailAccountPayloadHandler

- (MCGmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCGmailAccountPayloadHandler;
  return -[MCNewPayloadHandler initWithPayload:profileHandler:](&v5, "initWithPayload:profileHandler:", a3, a4);
}

- (id)unhashedAccountIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 emailAddress]);
  if (v3) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"google|%@", v3));
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)MCACAccountIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler unhashedAccountIdentifier](self, "unhashedAccountIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 MCHashedIdentifier]);

  return v3;
}

- (id)accountDictionaryWithIsInstalledByMDM:(BOOL)a3 personaID:(id)a4 rmAccountIdentifier:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 emailAddress]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 accountDescription]);
    v26 = v8;
    if (![v12 length])
    {
      id v13 = v11;

      v12 = v13;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 accountName]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler unhashedAccountIdentifier](self, "unhashedAccountIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 profile]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 displayName]);
    v25 = (void *)v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%@", v15, v17));

    v27[0] = MFMailAccountDescription;
    v27[1] = MFMailAccountUsername;
    v28[0] = v12;
    v28[1] = v11;
    v28[2] = v18;
    v27[2] = MailAccountManagedTag;
    v27[3] = @"MCAccountIsManaged";
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    v27[4] = MailAccountSSLEnabled;
    v28[3] = v19;
    v28[4] = &__kCFBooleanTrue;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  5LL));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v20));

    if ([v14 length]) {
      [v21 setObject:v14 forKey:MailAccountFullUserName];
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue([v10 communicationServiceRules]);

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 communicationServiceRules]);
      [v21 setObject:v23 forKeyedSubscript:kMCCommunicationServiceRulesAccountProperty];
    }

    id v8 = v26;
    if ([v26 length]) {
      [v21 setObject:v26 forKeyedSubscript:ACAccountPropertyPersonaIdentifier];
    }
    if (v9) {
      [v21 setObject:v9 forKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];
    }
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

- (id)_installWithAccountDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id v6 = +[GmailAccount newAccountWithDictionary:](&OBJC_CLASS___GmailAccount, "newAccountWithDictionary:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentAccount]);
  [v7 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 friendlyName]);
  [v7 setManagingSourceName:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  LODWORD(v9) = [v10 userMode];

  if ((_DWORD)v9 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler MCACAccountIdentifier](self, "MCACAccountIdentifier"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      [v7 setAccountProperty:v12 forKey:@"MCAccountIdentifer"];

      [v7 setIdentifier:v11];
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
  [v7 setMcPayloadUUID:v14];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 profile]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUID]);
  [v7 setMcProfileUUID:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 profile]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);

  if (v20)
  {
    [v7 setMcConfigurationProfileIdentifier:v20];
  }

  else
  {
    v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to retrieve profile identifier. Not setting profile identifier account property on Google account.",  buf,  2u);
    }
  }

  [v7 setAccountProperty:&__kCFBooleanFalse forKey:ACAccountPropertyShouldNeverUseSyncableCredential];
  if (v6)
  {
    [v6 savePersistentAccount];
    v22 = 0LL;
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:MFMailAccountUsername]);
    uint64_t v24 = MCGoogleErrorDomain;
    uint64_t v25 = MCErrorArray(@"ERROR_GOOGLE_CANNOT_CREATE_ACCOUNT_P_EMAIL");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v24,  47000LL,  v26,  MCErrorTypeFatal,  v23,  0LL));
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentAccount]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  [v29 setAcAccountIdentifier:v28];

  return v22;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
  id v9 = [v8 BOOLValue];

  if (!(_DWORD)v9)
  {
    id v13 = 0LL;
    goto LABEL_5;
  }

  uint64_t v10 = kMDMPersonaKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMDMPersonaKey]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v10]);
  }
  else {
    id v13 = 0LL;
  }

  uint64_t v15 = kMCInstallProfileOptionManagingProfileIdentifier;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
    v14 = 0LL;
    goto LABEL_11;
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);

  if (!v18)
  {
LABEL_5:
    v14 = 0LL;
    goto LABEL_12;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v18));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
  v16 = (void *)v18;
LABEL_11:

LABEL_12:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v22 = (void *)objc_claimAutoreleasedReturnValue( -[MCGmailAccountPayloadHandler accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:]( self,  "accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:",  v9,  v13,  v14));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:MailAccountManagedTag]);
  if (v22)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[MCGmailAccountPayloadHandler _installWithAccountDictionary:]( self,  "_installWithAccountDictionary:",  v22));
    if (!v24)
    {
      [v21 setPersistentResourceID:v23];
LABEL_21:
      BOOL v35 = 1;
      goto LABEL_22;
    }
  }

  else
  {
    v37 = v13;
    uint64_t v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Could not create Google account description",  buf,  2u);
    }

    uint64_t v26 = MCGoogleErrorDomain;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v21 emailAddress]);
    uint64_t v28 = MCErrorArray(@"ERROR_GOOGLE_CANNOT_CREATE_ACCOUNT_P_EMAIL");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v26,  47000LL,  v29,  MCErrorTypeFatal,  v27,  0LL));

    id v13 = v37;
    if (!v24) {
      goto LABEL_21;
    }
  }

  os_log_t v30 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v38 = v13;
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 friendlyName]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v24 MCVerboseDescription]);
    *(_DWORD *)buf = 138543618;
    v40 = v33;
    __int16 v41 = 2114;
    v42 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Could not install Google payload %{public}@. Error: %{public}@",  buf,  0x16u);

    id v13 = v38;
  }

  BOOL v35 = 0;
LABEL_22:

  return v35;
}

- (BOOL)isInstalled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentResourceID]);

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierGmail]);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 accountsWithAccountType:v5]);
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      uint64_t v10 = MailAccountManagedTag;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)i),  "accountPropertyForKey:",  v10,  (void)v16));
          id v13 = v12;
          if (v12 && ([v12 isEqualToString:v3] & 1) != 0)
          {

            BOOL v14 = 1;
            goto LABEL_14;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    BOOL v14 = 0;
LABEL_14:
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_remove
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentResourceID]);

  if (v3)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v31 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierGmail]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accountsWithAccountType:"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v41;
      uint64_t v10 = MailAccountManagedTag;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v41 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountPropertyForKey:v10]);
          BOOL v14 = v13;
        }

        id v8 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }

      while (v8);
    }

    os_log_t v30 = v3;
    uint64_t v28 = v6;

    uint64_t v15 = dispatch_group_create();
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id obj = v5;
    id v16 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    __int128 v17 = v31;
    if (v16)
    {
      id v18 = v16;
      uint64_t v19 = *(void *)v37;
      uint64_t v20 = MailAccountManagedTag;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 accountPropertyForKey:v20]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 componentsSeparatedByString:@"|"]);
          if ((unint64_t)[v24 count] < 2)
          {
            id v26 = 0LL;
          }

          else
          {
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndex:1]);
            if ([v25 length]) {
              id v26 = v25;
            }
            else {
              id v26 = 0LL;
            }

            __int128 v17 = v31;
          }

          dispatch_group_enter(v15);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_10006B240;
          v33[3] = &unk_1000C3E88;
          id v34 = v26;
          BOOL v35 = v15;
          id v27 = v26;
          [v17 removeAccount:v22 withCompletionHandler:v33];
        }

        id v18 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v18);
    }

    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v3 = v30;
  }
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned int v4 = [v3 isSetAside];

  if (v4) {
    -[MCGmailAccountPayloadHandler setSetAsideAccountDictionary:](self, "setSetAsideAccountDictionary:", 0LL);
  }
  else {
    -[MCGmailAccountPayloadHandler _remove](self, "_remove");
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  [v5 setPersistentResourceID:0];
}

- (void)setAside
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierGmail]);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue([v5 accountsWithAccountType:v6]);
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v19 = v6;
      uint64_t v9 = *(void *)v21;
      uint64_t v10 = MailAccountManagedTag;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountPropertyForKey:v10]);
          BOOL v14 = v13;
          if (v13 && [v13 isEqualToString:v4])
          {
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 accountPropertyForKey:@"MCAccountIsManaged"]);
            id v16 = [v17 BOOLValue];

            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 accountPropertyForKey:ACAccountPropertyPersonaIdentifier]);
            id v8 = (id)objc_claimAutoreleasedReturnValue([v12 accountPropertyForKey:ACAccountPropertyRemoteManagingAccountIdentifier]);

            goto LABEL_13;
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }

      uint64_t v15 = 0LL;
      id v16 = 0LL;
LABEL_13:
      id v6 = v19;
    }

    else
    {
      uint64_t v15 = 0LL;
      id v16 = 0LL;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[MCGmailAccountPayloadHandler accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:]( self,  "accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:",  v16,  v15,  v8));
    -[MCGmailAccountPayloadHandler setSetAsideAccountDictionary:](self, "setSetAsideAccountDictionary:", v18);

    -[MCGmailAccountPayloadHandler _remove](self, "_remove");
  }
}

- (void)unsetAside
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler setAsideAccountDictionary](self, "setAsideAccountDictionary"));

  if (v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler setAsideAccountDictionary](self, "setAsideAccountDictionary"));
    id v4 = -[MCGmailAccountPayloadHandler _installWithAccountDictionary:](self, "_installWithAccountDictionary:", v5);
  }

- (NSDictionary)setAsideAccountDictionary
{
  return self->_setAsideAccountDictionary;
}

- (void)setSetAsideAccountDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end