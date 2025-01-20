@interface IDSDAccountMetrics
+ (BOOL)areAllAliasesSelectedOnAccount:(id)a3;
+ (BOOL)areAllSelectedAliasesRegisteredOnAccount:(id)a3;
+ (BOOL)isAccountsFrameworkAvailable;
+ (BOOL)isProductionEnvironment;
+ (BOOL)isiCloudAccountMatchingAccount:(id)a3;
+ (BOOL)isiCloudSignedIn;
+ (BOOL)isiTunesSignedIn;
+ (double)timeSinceDateOnAccount:(id)a3;
+ (double)timeSinceLastRegistrationFailureOnAccount:(id)a3;
+ (double)timeSinceLastRegistrationSuccessOnAccount:(id)a3;
+ (id)registrationAccountStatusMetricForAccount:(id)a3;
+ (id)registrationAccountStatusMetricForNonexistentAccountWithType:(int)a3 serviceIdentifier:(id)a4;
+ (int64_t)accountSecurityLevelForAccount:(id)a3;
@end

@implementation IDSDAccountMetrics

+ (BOOL)isAccountsFrameworkAvailable
{
  unsigned int v2 = objc_msgSend( (id)IMWeakLinkClass(@"AKAccountManager", @"AuthKit"),  "isAccountsFrameworkAvailable");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDataMigrationTracker sharedInstance](&OBJC_CLASS___IDSDataMigrationTracker, "sharedInstance"));
    unsigned __int8 v4 = [v3 hasPerformedMigration];

    LOBYTE(v2) = v4;
  }

  return v2;
}

+ (BOOL)isiCloudSignedIn
{
  unsigned int v2 = [a1 isAccountsFrameworkAvailable];
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    unsigned __int8 v4 = [v3 isiCloudSignedIn];

    LOBYTE(v2) = v4;
  }

  return v2;
}

+ (BOOL)isiTunesSignedIn
{
  unsigned int v2 = [a1 isAccountsFrameworkAvailable];
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    unsigned __int8 v4 = [v3 isiTunesSignedIn];

    LOBYTE(v2) = v4;
  }

  return v2;
}

+ (BOOL)isiCloudAccountMatchingAccount:(id)a3
{
  id v4 = a3;
  if ([a1 isAccountsFrameworkAvailable])
  {
    v5 = objc_alloc(&OBJC_CLASS___IDSSystemAccountAdapter);
    uint64_t v7 = im_primary_queue(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[IDSSystemAccountAdapter initWithQueue:](v5, "initWithQueue:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSystemAccountAdapter iCloudSystemAccountWithError:](v9, "iCloudSystemAccountWithError:", 0LL));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 dsID]);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 DSID]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 dsID]);
        unsigned __int8 v14 = [v12 isEqualToString:v13];
      }

      else
      {
        unsigned __int8 v14 = 0;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 loginID]);
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 loginID]);
        unsigned __int8 v19 = [v17 isEqualToString:v18];
      }

      else
      {
        unsigned __int8 v19 = 0;
      }

      char v15 = v14 | v19;
    }

    else
    {
      char v15 = 0;
    }
  }

  else
  {
    char v15 = 0;
  }

  return v15;
}

+ (int64_t)accountSecurityLevelForAccount:(id)a3
{
  id v4 = a3;
  if ([v4 accountType] == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dsID]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 loginID]);
    if ([a1 isAccountsFrameworkAvailable])
    {
      id v7 = objc_msgSend((id)IMWeakLinkClass(@"AKAccountManager", @"AuthKit"), "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      if (v8)
      {
        id v9 = sub_10012F10C(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 authKitAccountWithDSID:v10]);
        if (v11) {
          goto LABEL_10;
        }
        id v16 = 0LL;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 authKitAccountWithAppleID:v6 error:&v16]);
        id v12 = v16;
        if (v12)
        {
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Error fetching authkit account with AppleID. { error: %@ }",  buf,  0xCu);
          }
        }

        if (v11)
        {
LABEL_10:
          id v14 = [v8 securityLevelForAccount:v11];
        }

        else
        {
          id v14 = 0LL;
        }
      }

      else
      {
        id v14 = 0LL;
      }
    }

    else
    {
      id v14 = 0LL;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return (int64_t)v14;
}

+ (double)timeSinceDateOnAccount:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;

  return v6;
}

+ (double)timeSinceLastRegistrationFailureOnAccount:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 lastRegistrationFailureDate]);
  [a1 timeSinceDateOnAccount:v4];
  double v6 = v5;

  return v6;
}

+ (double)timeSinceLastRegistrationSuccessOnAccount:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 lastRegistrationSuccessDate]);
  [a1 timeSinceDateOnAccount:v4];
  double v6 = v5;

  return v6;
}

+ (BOOL)areAllAliasesSelectedOnAccount:(id)a3
{
  id v3 = a3;
  if ([v3 accountType] == 1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 aliases]);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "__imArrayByFilteringWithBlock:", &stru_1008F9FB0));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 vettedAliases]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v7));

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController registeredPhoneNumbers]( &OBJC_CLASS___IDSRegistrationController,  "registeredPhoneNumbers"));
    [v8 minusSet:v9];

    unsigned __int8 v10 = [v8 isEqualToSet:v6];
  }

  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

+ (BOOL)areAllSelectedAliasesRegisteredOnAccount:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 registration]);
  id v5 = [v4 registrationStatus];

  if (v5 == (id)8)
  {
    if ([v3 accountType] == 1)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 aliases]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imArrayByFilteringWithBlock:", &stru_1008F9FD0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 unprefixedURIStringsFromRegistration]);
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

      unsigned __int8 v11 = [v10 isEqualToSet:v8];
    }

    else
    {
      unsigned __int8 v11 = 1;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (BOOL)isProductionEnvironment
{
  uint64_t v2 = IMGetEnvironmentName(a1, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 isEqualToIgnoringCase:@"prod"];

  return v4;
}

+ (id)registrationAccountStatusMetricForAccount:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 aliases]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "__imArrayByFilteringWithBlock:", &stru_1008F9FF0));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 vettedAliases]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController registeredPhoneNumbers]( &OBJC_CLASS___IDSRegistrationController,  "registeredPhoneNumbers"));
  [v8 minusSet:v9];

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v53 = 0LL;
    uint64_t v54 = 0LL;
    uint64_t v52 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v56 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
        if (([v6 containsObject:v17] & 1) == 0)
        {
          switch([v3 unselectReasonForAlias:v17])
          {
            case 0u:
            case 1u:
            case 2u:
              ++v14;
              break;
            case 3u:
              ++v54;
              break;
            case 4u:
              ++v53;
              break;
            case 5u:
              ++v52;
              break;
            case 6u:
              ++v13;
              break;
            default:
              continue;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }

    while (v12);
  }

  else
  {
    uint64_t v53 = 0LL;
    uint64_t v54 = 0LL;
    uint64_t v52 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  id v50 = objc_alloc(&OBJC_CLASS___IDSRegistrationAccountStatusMetric);
  unsigned int v49 = [v3 accountType];
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
  unsigned int v48 = [v3 isEnabled];
  unsigned int v47 = [v3 isUserDisabled];
  unsigned int v46 = [a1 isiCloudSignedIn];
  unsigned __int8 v45 = [a1 isiCloudAccountMatchingAccount:v3];
  unsigned __int8 v43 = [a1 isiTunesSignedIn];
  id v42 = [v3 registrationError];
  unsigned int v41 = [v3 registrationErrorReason];
  v44 = (void *)objc_claimAutoreleasedReturnValue([v3 registration]);
  id v40 = [v44 registrationStatus];
  unsigned int v39 = [v3 registrationStatus];
  unsigned __int8 v38 = [v3 hasEverRegistered];
  id v37 = [v3 lastRegistrationFailureError];
  [a1 timeSinceLastRegistrationFailureOnAccount:v3];
  double v21 = v20;
  [a1 timeSinceLastRegistrationSuccessOnAccount:v3];
  double v23 = v22;
  id v36 = [a1 accountSecurityLevelForAccount:v3];
  unsigned __int8 v35 = [a1 areAllAliasesSelectedOnAccount:v3];
  unsigned __int8 v34 = [a1 areAllSelectedAliasesRegisteredOnAccount:v3];
  id v24 = [v6 count];
  id v25 = [v10 count];
  LOBYTE(v33) = [a1 isProductionEnvironment];
  BYTE1(v32) = v34;
  LOBYTE(v32) = v35;
  BYTE4(v31) = v38;
  LODWORD(v31) = v39;
  LODWORD(v30) = v41;
  BYTE1(v29) = v43;
  LOBYTE(v29) = v45;
  id v26 = objc_msgSend( v50,  "initWithAccountType:serviceIdentifier:doesExist:isEnabled:isUserDisabled:isiCloudSignedIn:doesMatchiCloudAccou nt:isiTunesSignedIn:registrationError:registrationErrorReason:registrationStatus:accountRegistrationStatus:has EverRegistered:lastRegistrationFailureError:timeIntervalSinceLastRegistrationFailure:timeIntervalSinceLastRegi strationSuccess:accountSecurityLevel:areAllAliasesSelected:areAllSelectedAliasesRegistered:numberOfSelected:nu mberOfVetted:numberOfUnselectReasonUnknown:numberOfUnselectReasonAlertDenial:numberOfUnselectReasonClientCall: numberOfUnselectReasonBadAlias:numberOfUnselectReasonUpdateInfo:isProdEnvironment:",  v49,  v19,  1,  v48,  v47,  v46,  v21,  v23,  v29,  v42,  v30,  v40,  v31,  v37,  v36,  v32,  v24,  v25,  v14,  v54,  v53,  v52,  v13,  v33);

  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v60 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Constructed registration account status metric { metric: %@ }",  buf,  0xCu);
  }

  return v26;
}

+ (id)registrationAccountStatusMetricForNonexistentAccountWithType:(int)a3 serviceIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___IDSRegistrationAccountStatusMetric);
  id v8 = [a1 isiCloudSignedIn];
  unsigned __int8 v9 = [a1 isiTunesSignedIn];
  LOBYTE(v17) = [a1 isProductionEnvironment];
  LOWORD(v16) = 0;
  BYTE4(v15) = 0;
  LODWORD(v15) = 0;
  LODWORD(v14) = -1;
  BYTE1(v13) = v9;
  LOBYTE(v13) = 0;
  id v10 = objc_msgSend( v7,  "initWithAccountType:serviceIdentifier:doesExist:isEnabled:isUserDisabled:isiCloudSignedIn:doesMatchiCloudAccou nt:isiTunesSignedIn:registrationError:registrationErrorReason:registrationStatus:accountRegistrationStatus:has EverRegistered:lastRegistrationFailureError:timeIntervalSinceLastRegistrationFailure:timeIntervalSinceLastRegi strationSuccess:accountSecurityLevel:areAllAliasesSelected:areAllSelectedAliasesRegistered:numberOfSelected:nu mberOfVetted:numberOfUnselectReasonUnknown:numberOfUnselectReasonAlertDenial:numberOfUnselectReasonClientCall: numberOfUnselectReasonBadAlias:numberOfUnselectReasonUpdateInfo:isProdEnvironment:",  v4,  v6,  0,  0,  0,  v8,  0.0,  0.0,  v13,  -1,  v14,  0,  v15,  -1,  0,  v16,  0,  0,  0,  0,  0,  0,  0,  v17);

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Constructed registration account status metric { metric: %@ }",  buf,  0xCu);
  }

  return v10;
}

@end