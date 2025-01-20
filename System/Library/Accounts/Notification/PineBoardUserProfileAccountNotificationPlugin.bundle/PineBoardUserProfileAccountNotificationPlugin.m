LABEL_46:
LABEL_47:
                goto LABEL_48;
              }
            }
          }
        }

        else if (v60)
        {
          if ([v17 isEqualToString:v22])
          {
            v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_homeIdentifier"));
            if (v48)
            {
              v49 = (void *)v48;
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_homeUserIdentifiers"));
              if ([v50 count])
              {
              }

              else
              {
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_homeUserHiddenIdentifiers"));
                v55 = [v54 count];

                if (v55) {
                  goto LABEL_34;
                }
              }
            }
          }
        }

        v46 = (os_log_s *)[[PBSUserProfileAccountNotification alloc] initWithType:v59 accountIdentifier:v40 accountTypeIdentifier:v17 altDSID:v42];
        v51 = userProfileAccountNotificationLog();
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v62 = v46;
          _os_log_impl( &dword_0,  v52,  OS_LOG_TYPE_INFO,  "Sending account changed notification to PineBoard. {notification=%@}",  buf,  0xCu);
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue( +[PBSAccountsPluginService sharedInstance]( &OBJC_CLASS___PBSAccountsPluginService,  "sharedInstance"));
        [v53 handleUserProfileAccountNotification:v46];

        goto LABEL_46;
      }

      if (v12 && [v11 isActive])
      {
        v23 = [v9 isActive] ^ 1;
        if (((v14 | v23) & 1) == 0) {
          goto LABEL_14;
        }
      }

      else
      {
        v23 = v60;
        if (((v60 | v14) & 1) == 0)
        {
LABEL_14:
LABEL_20:
          v25 = v15;
          v26 = userProfileAccountNotificationLog();
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v58 = [v11 isActive];
            v56 = [v9 isActive];
            v57 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ams_altDSID"));
            *(_DWORD *)buf = 67110658;
            *(_DWORD *)v62 = v7;
            *(_WORD *)&v62[4] = 1024;
            *(_DWORD *)&v62[6] = v58;
            LOWORD(v63) = 1024;
            *(_DWORD *)((char *)&v63 + 2) = v56;
            HIWORD(v63) = 2160;
            *(void *)v64 = 1752392040LL;
            *(_WORD *)&v64[8] = 2112;
            v65 = v57;
            v66 = 2160;
            v67 = 1752392040LL;
            v68 = 2112;
            v69 = v28;
            _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "Asking PineBoard to validate active iTunes account. {changeType=%u, oldIsActive=%{BOOL}d, newIsActive=%{BO OL}d, accountIdentifier=%{mask.hash}@, altDSID=%{mask.hash}@}",  buf,  0x3Cu);
          }

          v29 = objc_alloc(&OBJC_CLASS___PBSUserProfileAccountNotification);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ams_altDSID"));
          v32 = [v29 initWithType:3 accountIdentifier:v22 accountTypeIdentifier:v30 altDSID:v31];

          v33 = (void *)objc_claimAutoreleasedReturnValue( +[PBSAccountsPluginService sharedInstance]( &OBJC_CLASS___PBSAccountsPluginService,  "sharedInstance"));
          [v33 handleUserProfileAccountNotification:v32];

          goto LABEL_23;
        }
      }

      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_20;
  }

  v24 = userProfileAccountNotificationLog();
  v15 = (id)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG)) {
    sub_2E0C(v7, (os_log_s *)v15);
  }
LABEL_48:
}

void sub_2E0C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( &dword_0,  a2,  OS_LOG_TYPE_DEBUG,  "Ignoring account changed because of its change type. {changeType=%u}",  (uint8_t *)v2,  8u);
}

void sub_2E80(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2160;
  uint64_t v6 = 1752392040LL;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Ignoring account changed notification, missing identifiers. {identifier=%{public}@, altDSID=%{mask.hash}@}",  (uint8_t *)&v3,  0x20u);
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}
 = ACAccountTypeIdentifieriTunesStore;
      if ([v17 isEqualToString:ACAccountTypeIdentifieriTunesStore])
      {
      }

      if (![v17 isEqualToString:v22])
      {
LABEL_23:
        if ((_os_feature_enabled_impl("UserProfiles", "accountEventHandling") & 1) != 0) {
          goto LABEL_47;
        }
        if (v12)
        {
          if ([v17 isEqualToString:v22])
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_homeIdentifier"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_homeIdentifier"));
            v36 = BSEqualObjects(v34, v35);

            if (v36)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_homeUserIdentifiers"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_homeUserIdentifiers"));
              v39 = BSEqualObjects(v37, v38);

              if ((v39 & 1) != 0) {
                goto LABEL_47;
              }
            }
          }
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "aa_altDSID"));
        v42 = (void *)v41;
        if (!v40 || !v41)
        {
          v47 = userProfileAccountNotificationLog();
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            sub_2E80((uint64_t)v40, (uint64_t)v42, v46);
          }
          goto LABEL_46;
        }

        if (_os_feature_enabled_impl("UserProfiles", "loreto"))
        {
          if (v60)
          {
            if ([v17 isEqualToString:v22])
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_homeUserAllIdentifiers"));
              v44 = [v43 count];

              if (v44)
              {
LABEL_34:
                v45 = userProfileAccountNotificationLog();
                v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543874;
                  *(void *)v62 = v40;
                  *(_WORD *)&v62[8] = 2160;
                  v63 = 1752392040LL;
                  *(_WORD *)v64 = 2112;
                  *(void *)&v64[2] = v42;
                  _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_INFO,  "Ignoring iTunes account added notification, home/hidden account. {identifier=%{public}@, altDSID=%{mask.hash}@}",  buf,  0x20u);
                }

- (NSDictionary)allowedChangeTypeForAccountType
{
  return self->_allowedChangeTypeForAccountType;
}

- (void).cxx_destruct
{
}

@end