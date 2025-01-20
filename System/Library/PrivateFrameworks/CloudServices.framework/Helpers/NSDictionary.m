@interface NSDictionary
- (id)base64EncodedStringFromDict;
- (id)keysOfEntriesContainingObject:(id)a3;
- (int64_t)compare:(id)a3 with:(id)a4;
- (void)recordIDAndClientMetadataForSilentAttemptFromRecords:(id)a3 passphraseLength:(unint64_t)a4 platform:(int)a5 sosCompatibilityModeEnabled:(BOOL)a6 reply:(id)a7;
@end

@implementation NSDictionary

- (id)keysOfEntriesContainingObject:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B254;
  v7[3] = &unk_100069010;
  id v8 = a3;
  id v4 = v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary keysOfEntriesPassingTest:](self, "keysOfEntriesPassingTest:", v7));

  return v5;
}

- (int64_t)compare:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"metadata"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"BackupKeybagDigest"]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"metadata"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"BackupKeybagDigest"]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary keysOfEntriesContainingObject:](self, "keysOfEntriesContainingObject:", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary keysOfEntriesContainingObject:](self, "keysOfEntriesContainingObject:", v11));
  uint64_t v14 = kSecureBackupEscrowDateKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSecureBackupEscrowDateKey]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);
  if ([v12 isEqualToSet:v13])
  {
    int64_t v17 = (int64_t)[v15 compare:v16];
    uint64_t v18 = CloudServicesLog(v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v17 == -1)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        v31 = "candidate can recover same views but is newer";
        goto LABEL_42;
      }

      goto LABEL_43;
    }

    if (!v20) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v21 = "candidate can recover same views but is not newer";
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
    goto LABEL_44;
  }

  v45 = v16;
  v46 = v15;
  v47 = v11;
  v48 = v9;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v22 = [&off_10006DAB0 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (!v22) {
    goto LABEL_15;
  }
  id v23 = v22;
  uint64_t v24 = *(void *)v50;
  while (2)
  {
    for (i = 0LL; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v50 != v24) {
        objc_enumerationMutation(&off_10006DAB0);
      }
      uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
      id v27 = [v12 compareMembershipOfObject:v26 withSet:v13];
      int64_t v17 = (int64_t)v27;
      if (v27 == (id)1)
      {
        uint64_t v32 = CloudServicesLog(1LL);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = v26;
          v33 = "candidate cannot recover %@";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
        }

- (void)recordIDAndClientMetadataForSilentAttemptFromRecords:(id)a3 passphraseLength:(unint64_t)a4 platform:(int)a5 sosCompatibilityModeEnabled:(BOOL)a6 reply:(id)a7
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void *, void))a7;
  uint64_t v10 = CloudServicesLog(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v105 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "looking for record for silent attempt of passphrase length %lu",  buf,  0xCu);
  }

  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v100 objects:v106 count:16];
  if (!v13)
  {
    v85 = 0LL;
    v71 = 0LL;
    v68 = 0LL;
    v74 = (os_log_s *)v12;
    unint64_t v75 = a4;
    goto LABEL_62;
  }

  id v14 = v13;
  v77 = v9;
  v81 = 0LL;
  v82 = 0LL;
  v85 = 0LL;
  uint64_t v95 = kSecureBackupEscrowDateKey;
  uint64_t v96 = *(void *)v101;
  uint64_t v94 = kSecureBackupRecordIDKey;
  uint64_t v93 = kSecureBackupRemainingAttemptsKey;
  uint64_t v91 = kEscrowServiceRecordMetadataKey;
  uint64_t v86 = kSecureBackupClientMetadataKey;
  uint64_t v84 = kSecureBackupBottleIDKey;
  uint64_t v83 = kSecureBackupBottleValidityKey;
  uint64_t v15 = kSecureBackupUsesNumericPassphraseKey;
  uint64_t v79 = kSecureBackupNumericPassphraseLengthKey;
  unint64_t v92 = a4;
  id v87 = v12;
  do
  {
    v16 = 0LL;
    id v90 = v14;
    do
    {
      if (*(void *)v101 != v96) {
        objc_enumerationMutation(v12);
      }
      int64_t v17 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)v16);
      v98 = objc_autoreleasePoolPush();
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v95]);
      v99 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v94]);
      uint64_t v19 = CloudServicesLog(v99);
      BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  v18));
        *(_DWORD *)buf = 138412546;
        *(void *)v105 = v99;
        *(_WORD *)&v105[8] = 2112;
        *(void *)&v105[10] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "checking escrow record: %@ from %@",  buf,  0x16u);
      }

      v97 = (void *)v18;

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v93]);
      unsigned int v23 = [v22 intValue];

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"silentAttemptAllowed"]);
      unsigned int v25 = [v24 isEqual:&__kCFBooleanFalse];

      if (v23 == 10 && (v25 & 1) == 0)
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v91]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v86]);

        id v29 = [v28 mutableCopy];
        if (!a6)
        {
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v91]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v84]);
          [v29 setObject:v31 forKeyedSubscript:v84];

          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v91]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v83]);
          [v29 setObject:v33 forKeyedSubscript:v83];

          uint64_t v35 = CloudServicesLog(v34);
          id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v105 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "metadata containing bottle: %@",  buf,  0xCu);
          }
        }

        id v37 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"device_platform"]);
        unsigned int v38 = [v37 intValue];

        id v39 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v15]);
        unsigned int v40 = [v39 BOOLValue];

        if (v38 != a5)
        {
          uint64_t v54 = CloudServicesLog(v41);
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          *(_WORD *)buf = 0;
          v48 = v46;
          __int128 v49 = "escrow record not same platform, skipping";
          goto LABEL_28;
        }

        if (v40)
        {
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v79]);
          id v43 = [v42 unsignedIntegerValue];

          uint64_t v45 = CloudServicesLog(v44);
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
          if ((unint64_t)v43 > a4)
          {
            if (v47)
            {
              *(_DWORD *)buf = 134218240;
              *(void *)v105 = v43;
              *(_WORD *)&v105[8] = 2048;
              *(void *)&v105[10] = a4;
              v48 = v46;
              __int128 v49 = "escrow passphrase length (%lu) longer than silent attempt passphrase (%lu), skipping";
              uint32_t v50 = 22;
              goto LABEL_29;
            }

            goto LABEL_30;
          }

          if (v47)
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v105 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "found clean record with passlen: %lu",  buf,  0xCu);
          }

          if (v85)
          {
            int64_t v61 = -[NSDictionary compare:with:](self, "compare:with:", v85, v17);
            if (v61 != -1)
            {
              uint64_t v62 = CloudServicesLog(v61);
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
              if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_30;
              }
LABEL_34:
              *(_WORD *)buf = 0;
              v48 = v46;
              __int128 v49 = "keeping current candidate";
LABEL_28:
              uint32_t v50 = 2;
LABEL_29:
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v49, buf, v50);
LABEL_30:
              id v43 = (id)v92;
LABEL_52:
              v53 = v98;

              unint64_t v92 = (unint64_t)v43;
              id v12 = v87;
              id v14 = v90;
              goto LABEL_53;
            }
          }

          uint64_t v63 = CloudServicesLog(v61);
          v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = @"better";
            if (!v85) {
              v65 = @"first";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)v105 = v65;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "found %@ candidate", buf, 0xCu);
          }

          id v59 = v17;
          id v66 = v99;

          v46 = v82;
          v81 = v66;
          v82 = (os_log_s *)v29;
        }

        else
        {
          if (v85)
          {
            int64_t v41 = -[NSDictionary compare:with:](self, "compare:with:", v85, v17);
            if (v41 != -1)
            {
              uint64_t v55 = CloudServicesLog(v41);
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
              if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_30;
              }
              goto LABEL_34;
            }
          }

          uint64_t v56 = CloudServicesLog(v41);
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = @"better";
            if (!v85) {
              v58 = @"first";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)v105 = v58;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "found %@ candidate", buf, 0xCu);
          }

          id v59 = v17;
          id v60 = v99;

          v46 = v82;
          v81 = v60;
          v82 = (os_log_s *)v29;
          id v43 = (id)a4;
        }

        v85 = v59;
        goto LABEL_52;
      }

      uint64_t v51 = CloudServicesLog(v26);
      id v28 = (void *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        __int128 v52 = &stru_10006AB28;
        if (v25) {
          __int128 v52 = @"not ";
        }
        *(_DWORD *)v105 = v23;
        *(_WORD *)&v105[4] = 2112;
        *(void *)&v105[6] = v52;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v28,  OS_LOG_TYPE_DEFAULT,  "candidate not eligible: remaining attempts = %d, silent attempt %@allowed",  buf,  0x12u);
      }

      v53 = v98;
LABEL_53:

      objc_autoreleasePoolPop(v53);
      v16 = (char *)v16 + 1;
    }

    while (v14 != v16);
    id v14 = [v12 countByEnumeratingWithState:&v100 objects:v106 count:16];
  }

  while (v14);

  v68 = v81;
  if (v81)
  {
    uint64_t v69 = CloudServicesLog(v67);
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    v9 = v77;
    v71 = v82;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_1000448F0((uint64_t)v81, (uint64_t)v82, v70);
    }

    uint64_t v73 = CloudServicesLog(v72);
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      sub_100044858(v85, v91, v74);
    }
    unint64_t v75 = v92;
LABEL_62:

    unint64_t v76 = v75;
  }

  else
  {
    v9 = v77;
    v71 = v82;
    unint64_t v76 = v92;
  }

  v9[2](v9, v68, v71, v76);
}

- (id)base64EncodedStringFromDict
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  self,  200LL,  0LL,  0LL));
  v3 = v2;
  if (v2) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 base64EncodedStringWithOptions:0]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

@end