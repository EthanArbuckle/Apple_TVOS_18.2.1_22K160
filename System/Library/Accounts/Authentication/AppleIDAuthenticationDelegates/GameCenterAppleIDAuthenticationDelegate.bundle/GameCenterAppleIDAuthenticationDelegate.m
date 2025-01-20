LABEL_17:
    v12[2](v12);
LABEL_18:
    v38 = v211;
    goto LABEL_19;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"com.apple.gamecenter"));

  if (v23)
  {
    v24 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"com.apple.gamecenter"));

    v9 = (__CFString *)v24;
  }

  block = v12;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  if ([v25 isAccountModificationRestricted])
  {

LABEL_13:
    if (!os_log_GKGeneral) {
      v29 = (id)GKOSLoggers(v26);
    }
    v30 = (os_log_s *)os_log_GKAccount;
    v12 = block;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
      sub_6510(v30, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_17;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  v28 = [v27 isGameCenterRestricted];

  if (v28) {
    goto LABEL_13;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"status"));
  v40 = [v39 intValue];

  if (v40)
  {
    v41 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"status-message"));
    v42 = (void *)v41;
    if (!os_log_GKGeneral) {
      v43 = (id)GKOSLoggers(v41);
    }
    v44 = (os_log_s *)os_log_GKAccount;
    v12 = block;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
      sub_65A0((uint64_t)v42, v44);
    }
    block[2](block);

    goto LABEL_18;
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString accountType](v11, "accountType"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 identifier]);
  v47 = ACAccountTypeIdentifierAppleAccount;
  v48 = [v46 isEqualToString:ACAccountTypeIdentifierAppleAccount];

  v49 = (void *)os_log_GKGeneral;
  if ((v48 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      v73 = (id)((uint64_t (*)(void))GKOSLoggers)();
    }
    v74 = (os_log_s *)os_log_GKAccount;
    v12 = block;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
      sub_6570(v74, v75, v76, v77, v78, v79, v80, v81);
    }
    goto LABEL_17;
  }

  if (!os_log_GKGeneral)
  {
    v50 = (id)((uint64_t (*)(void))GKOSLoggers)();
    v49 = (void *)os_log_GKGeneral;
  }

  v51 = v49;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v235 = v11;
    _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate inAccount:%@", buf, 0xCu);
  }

  v52 = (void *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v53 = (id)((uint64_t (*)(void))GKOSLoggers)();
    v52 = (void *)os_log_GKGeneral;
  }

  v195 = v47;
  v54 = v52;
  v12 = block;
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v235 = v9;
    _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate parameters:%@", buf, 0xCu);
  }

  v198 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"alias"));
  v197 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"firstName"));
  v196 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"lastName"));
  v55 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", GKAppleIDKey));
  v202 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"dsid"));
  v56 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"altDSID"));
  v199 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", GKPlayerIDKey));
  v200 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"auth-token"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", GKEnvironmentKey));
  v209 = (char *)+[GKPreferences environmentForString:](&OBJC_CLASS___GKPreferences, "environmentForString:", v57);

  v58 = v56;
  if (!v56) {
    v58 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"alternate-dsid"));
  }
  if (v55 && v202 | v58 && v200 && v199)
  {
    v59 = (void *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v60 = (id)((uint64_t (*)(void))GKOSLoggers)();
      v59 = (void *)os_log_GKGeneral;
    }

    v61 = v59;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v235 = v55;
      _os_log_impl( &dword_0,  v61,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate: Looking for GC account with username: %@",  buf,  0xCu);
    }

    v201 = v58;
    v204 = v55;

    v191 = ACAccountTypeIdentifierGameCenter;
    v227 = 0u;
    v228 = 0u;
    v229 = 0u;
    v230 = 0u;
    v62 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountsWithAccountTypeIdentifier:"));
    v63 = [v62 countByEnumeratingWithState:&v227 objects:v233 count:16];
    v194 = v10;
    v192 = v11;
    if (v63)
    {
      v64 = v63;
      v65 = *(void *)v228;
      while (2)
      {
        for (i = 0LL; i != v64; i = (char *)i + 1)
        {
          if (*(void *)v228 != v65) {
            objc_enumerationMutation(v62);
          }
          v203 = *(ACAccount **)(*((void *)&v227 + 1) + 8LL * (void)i);
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount username](v203, "username"));
          v68 = [v67 isEqualToString:v55];

          if (v68)
          {
            v84 = v203;
            v85 = (void *)os_log_GKGeneral;
            if (!os_log_GKGeneral)
            {
              v86 = (id)((uint64_t (*)(void))GKOSLoggers)();
              v85 = (void *)os_log_GKGeneral;
            }

            v87 = v85;
            if (!os_log_type_enabled(v87, OS_LOG_TYPE_INFO)) {
              goto LABEL_82;
            }
            v88 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ACAccount username](v84, "username"));
            *(_DWORD *)buf = 138412290;
            v235 = v88;
            v89 = "GKAppleIDAuthenticationDelegate: will populate existing account '%@' with production token";
            v90 = v87;
            v91 = 12;
LABEL_81:
            _os_log_impl(&dword_0, v90, OS_LOG_TYPE_INFO, v89, buf, v91);

            goto LABEL_82;
          }

          if (v58)
          {
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountPropertyForKey:](v203, "accountPropertyForKey:", @"altDSID"));
            v70 = [v69 isEqualToString:v58];

            if (v70)
            {
              v92 = v203;
              v93 = (void *)os_log_GKGeneral;
              if (!os_log_GKGeneral)
              {
                v94 = (id)((uint64_t (*)(void))GKOSLoggers)();
                v93 = (void *)os_log_GKGeneral;
              }

              v87 = v93;
              if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
              {
                v88 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ACAccount username](v92, "username"));
                *(_DWORD *)buf = 138412546;
                v235 = v88;
                v236 = 2112;
                v237 = (uint64_t)v55;
                v89 = "GKAppleIDAuthenticationDelegate: found a gamecenter ACAccount (%@) with same altDSID than incoming account:%@";
                goto LABEL_80;
              }

LABEL_82:
              v206 = 0;
              goto LABEL_83;
            }
          }

          if (v202)
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountPropertyForKey:](v203, "accountPropertyForKey:", @"dsid"));
            v72 = [v71 isEqualToString:v202];

            if (v72)
            {
              v95 = v203;
              v96 = (void *)os_log_GKGeneral;
              if (!os_log_GKGeneral)
              {
                v97 = (id)((uint64_t (*)(void))GKOSLoggers)();
                v96 = (void *)os_log_GKGeneral;
              }

              v87 = v96;
              if (!os_log_type_enabled(v87, OS_LOG_TYPE_INFO)) {
                goto LABEL_82;
              }
              v88 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ACAccount username](v95, "username"));
              *(_DWORD *)buf = 138412546;
              v235 = v88;
              v236 = 2112;
              v237 = (uint64_t)v55;
              v89 = "GKAppleIDAuthenticationDelegate: found a gamecenter ACAccount (%@) with same dsid than incoming account:%@";
LABEL_80:
              v90 = v87;
              v91 = 22;
              goto LABEL_81;
            }
          }
        }

        v64 = [v62 countByEnumeratingWithState:&v227 objects:v233 count:16];
        v203 = 0LL;
        v206 = 1;
        if (v64) {
          continue;
        }
        break;
      }
    }

    else
    {
      v203 = 0LL;
      v206 = 1;
    }

LABEL_83:
    v193 = v9;
    v225 = 0u;
    v226 = 0u;
    v223 = 0u;
    v224 = 0u;
    obj = v62;
    v98 = [obj countByEnumeratingWithState:&v223 objects:v232 count:16];
    if (v98)
    {
      v99 = v98;
      v205 = 0;
      v100 = *(void *)v224;
      do
      {
        for (j = 0LL; j != v99; j = (char *)j + 1)
        {
          if (*(void *)v224 != v100) {
            objc_enumerationMutation(obj);
          }
          v102 = *(void **)(*((void *)&v223 + 1) + 8LL * (void)j);
          v103 = (void *)objc_claimAutoreleasedReturnValue([v102 credential]);
          v104 = (void *)objc_claimAutoreleasedReturnValue([v103 token]);

          if (v104)
          {
            if (([v104 isEqualToString:@"<gone>"] & 1) == 0)
            {
              v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v209));
              v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKCredentialScope-%@",  v105));
              v107 = (void *)objc_claimAutoreleasedReturnValue([v102 accountPropertyForKey:v106]);
              v108 = [v107 unsignedIntegerValue];

              if ((v108 & 4) != 0)
              {
                v109 = (void *)os_log_GKGeneral;
                if (!os_log_GKGeneral)
                {
                  v110 = (id)((uint64_t (*)(void))GKOSLoggers)();
                  v109 = (void *)os_log_GKGeneral;
                }

                v111 = v109;
                if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                {
                  v112 = (__CFString *)objc_claimAutoreleasedReturnValue([v102 username]);
                  *(_DWORD *)buf = 138412290;
                  v235 = v112;
                  _os_log_impl( &dword_0,  v111,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate: Existing primary production account '%@'",  buf,  0xCu);
                }

                v205 = 1;
                v206 = 0;
              }
            }
          }
        }

        v99 = [obj countByEnumeratingWithState:&v223 objects:v232 count:16];
      }

      while (v99);
    }

    else
    {
      v205 = 0;
    }

    v113 = (void *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v114 = (id)((uint64_t (*)(void))GKOSLoggers)();
      v113 = (void *)os_log_GKGeneral;
    }

    v115 = v113;
    v10 = v194;
    v11 = v192;
    v12 = block;
    v58 = v201;
    if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
    {
      v116 = @"NO";
      if ((v206 & 1) != 0) {
        v117 = @"YES";
      }
      else {
        v117 = @"NO";
      }
      if ((v205 & 1) != 0) {
        v116 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v235 = v117;
      v236 = 2112;
      v237 = (uint64_t)v116;
      _os_log_impl( &dword_0,  v115,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate: looked at the existing account. We want to create a new GC account (%@), and ex istingPrimaryAccount is %@",  buf,  0x16u);
    }

    v9 = v193;
    if ((v206 & 1) != 0)
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString accountType](v192, "accountType"));
      v119 = (void *)objc_claimAutoreleasedReturnValue([v118 identifier]);
      v120 = [v119 isEqualToString:v195];

      if (v120)
      {
        v121 = (void *)os_log_GKGeneral;
        if (!os_log_GKGeneral)
        {
          v122 = (id)((uint64_t (*)(void))GKOSLoggers)();
          v121 = (void *)os_log_GKGeneral;
        }

        v123 = v121;
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v123,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate: if an existing primary was found, the new account will not be active",  buf,  2u);
        }

        v124 = (void *)objc_claimAutoreleasedReturnValue([v194 accountTypeWithIdentifier:v191]);
        v125 = -[ACAccount initWithAccountType:](objc_alloc(&OBJC_CLASS___ACAccount), "initWithAccountType:", v124);

        -[ACAccount setUsername:](v125, "setUsername:", v204);
        v126 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
        if ([v126 isGuestPersona])
        {
          v127 = (void *)objc_claimAutoreleasedReturnValue([v126 userPersonaUniqueString]);
          -[ACAccount setAccountProperty:forKey:]( v125,  "setAccountProperty:forKey:",  v127,  ACAccountPropertyPersonaIdentifier);
        }
      }

      else
      {
        v125 = v203;
      }

      v58 = v201;
    }

    else
    {
      v125 = v203;
    }

    v128 = (void *)os_log_GKGeneral;
    v207 = v125;
    if (v125)
    {
      if (!os_log_GKGeneral)
      {
        v129 = (id)((uint64_t (*)(void))GKOSLoggers)();
        v128 = (void *)os_log_GKGeneral;
      }

      v130 = v128;
      if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
      {
        v131 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ACAccount shortDebugName](v125, "shortDebugName"));
        *(_DWORD *)buf = 138412290;
        v235 = v131;
        _os_log_impl( &dword_0,  v130,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate: Updating token for account %@",  buf,  0xCu);
      }

      v132 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount credential](v125, "credential"));
      if (!v132)
      {
        v133 = objc_alloc_init(&OBJC_CLASS___ACAccountCredential);
        -[ACAccount setCredential:](v125, "setCredential:", v133);
      }

      v134 = -[ACAccount setAuthenticated:](v125, "setAuthenticated:", 1LL);
      if (v209 == (_BYTE *)&dword_4 + 1)
      {
        v135 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount credential](v125, "credential"));
        [v135 setToken:v200];
      }

      else
      {
        v145 = (void *)os_log_GKGeneral;
        if (!os_log_GKGeneral)
        {
          v146 = (id)GKOSLoggers(v134);
          v145 = (void *)os_log_GKGeneral;
        }

        v147 = v145;
        if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v147,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate: non production environment, set account property",  buf,  2u);
        }

        v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v209));
        v148 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKEnvToken-%@",  v135));
        -[ACAccount setAccountProperty:forKey:](v125, "setAccountProperty:forKey:", v200, v148);
      }

      v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v209));
      v150 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKCredentialScope-%@",  v149));
      if ((v205 & 1) != 0)
      {
        v151 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountPropertyForKey:](v125, "accountPropertyForKey:", v150));
        v152 = v125;
        v153 = [v151 unsignedIntegerValue];

        v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v209));
        v150 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKCredentialScope-%@",  v149));
        if ((v153 & 4) != 0) {
          v154 = &off_8578;
        }
        else {
          v154 = &off_8590;
        }
        -[ACAccount setAccountProperty:forKey:](v152, "setAccountProperty:forKey:", v154, v150);
        v125 = v152;
      }

      else
      {
        -[ACAccount setAccountProperty:forKey:](v125, "setAccountProperty:forKey:", &off_8578, v150);
      }

      v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v209));
      v157 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKCredentialScope-%@-mod-date",  v156));
      -[ACAccount setAccountProperty:forKey:](v125, "setAccountProperty:forKey:", v155, v157);

      v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v209));
      v159 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"altDSID-%@",  v158));
      -[ACAccount setAccountProperty:forKey:](v125, "setAccountProperty:forKey:", v201, v159);

      -[ACAccount setAccountProperty:forKey:](v125, "setAccountProperty:forKey:", v201, @"altDSID");
      v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v209));
      v162 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"altDSID-%@-mod-date",  v161));
      -[ACAccount setAccountProperty:forKey:](v125, "setAccountProperty:forKey:", v160, v162);

      -[ACAccount setAccountProperty:forKey:](v125, "setAccountProperty:forKey:", v202, @"dsid");
      v163 = -[ACAccount setAccountProperty:forKey:](v125, "setAccountProperty:forKey:", v199, @"playerID");
      v164 = (void *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v165 = (id)GKOSLoggers(v163);
        v164 = (void *)os_log_GKGeneral;
      }

      v166 = v164;
      if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
      {
        v167 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[ACAccount accountProperties](v125, "accountProperties"));
        *(_DWORD *)buf = 138412290;
        v235 = v167;
        _os_log_impl( &dword_0,  v166,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate: all account properties: %@",  buf,  0xCu);
      }

      -[ACAccount setUsername:](v125, "setUsername:", v204);
      -[ACAccount setAccountDescription:](v125, "setAccountDescription:", v204);
      v168 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount _gkPlayerInternal](v125, "_gkPlayerInternal"));
      +[GKContactsIntegrationUserSettings applySettingsToObject:fromResults:]( &OBJC_CLASS___GKContactsIntegrationUserSettings,  "applySettingsToObject:fromResults:",  v168,  v193);
      [v168 setAlias:v198];
      [v168 setFirstName:v197];
      [v168 setLastName:v196];
      v169 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerInternal compositeNameForFirstName:lastName:]( &OBJC_CLASS___GKPlayerInternal,  "compositeNameForFirstName:lastName:",  v197,  v196));
      [v168 setCompositeName:v169];

      [v168 setAccountName:v204];
      -[ACAccount _gkSetPlayerInternal:](v125, "_gkSetPlayerInternal:", v168);
      v170 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
      v171 = v170;
      if (v201)
      {
        if (!os_log_GKGeneral) {
          v172 = (id)GKOSLoggers(v170);
        }
        v173 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(v173, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v235 = (const __CFString *)v201;
          _os_log_impl( &dword_0,  v173,  OS_LOG_TYPE_INFO,  "GKAuth:telling authkit account is in use using altDSID:%@",  buf,  0xCu);
        }

        [v171 setAppleIDWithAltDSID:v201 inUse:1 forService:6];
      }

      else if (v202)
      {
        v174 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [(id)v202 longLongValue]));
        v175 = (__CFString *)v174;
        if (!os_log_GKGeneral) {
          v176 = (id)GKOSLoggers(v174);
        }
        v177 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v235 = v175;
          _os_log_impl( &dword_0,  v177,  OS_LOG_TYPE_INFO,  "GKAuth:telling authkit account is in use using DSID:%@",  buf,  0xCu);
        }

        [v171 setAppleIDWithDSID:v175 inUse:1 forService:6];
      }

      v210 = v171;
      v178 = dispatch_group_create();
      dispatch_group_enter(v178);
      v220[0] = _NSConcreteStackBlock;
      v220[1] = 3221225472LL;
      v220[2] = sub_628C;
      v220[3] = &unk_8220;
      v179 = v125;
      v221 = v179;
      v180 = v178;
      v222 = v180;
      [v194 saveAccount:v179 verify:0 dataclassActions:0 completion:v220];
      v218 = 0u;
      v219 = 0u;
      v216 = 0u;
      v217 = 0u;
      v181 = obj;
      v182 = [v181 countByEnumeratingWithState:&v216 objects:v231 count:16];
      if (v182)
      {
        v183 = v182;
        v184 = *(void *)v217;
        while (2)
        {
          for (k = 0LL; k != v183; k = (char *)k + 1)
          {
            if (*(void *)v217 != v184) {
              objc_enumerationMutation(v181);
            }
            v186 = *(void **)(*((void *)&v216 + 1) + 8LL * (void)k);
            v187 = (void *)objc_claimAutoreleasedReturnValue([v186 username]);
            v188 = [v187 isEqualToString:v204];

            if ((v188 & 1) == 0)
            {
              [v186 setAccountProperty:&stru_8520 forKey:@"GKPlayerSelectedEnvironment"];
              dispatch_group_enter(v180);
              v213[0] = _NSConcreteStackBlock;
              v213[1] = 3221225472LL;
              v213[2] = sub_63DC;
              v213[3] = &unk_8220;
              v214 = v179;
              v215 = v180;
              [v194 saveAccount:v186 verify:0 dataclassActions:0 completion:v213];

              goto LABEL_172;
            }
          }

          v183 = [v181 countByEnumeratingWithState:&v216 objects:v231 count:16];
          if (v183) {
            continue;
          }
          break;
        }
      }

LABEL_172:
      global_queue = dispatch_get_global_queue(0LL, 0LL);
      v190 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v12 = block;
      dispatch_group_notify(v180, v190, block);

      v9 = v193;
      v10 = v194;
      v11 = v192;
      v55 = v204;
      v58 = v201;
    }

    else
    {
      v55 = v204;
      if (!os_log_GKGeneral) {
        v136 = (id)((uint64_t (*)(void))GKOSLoggers)();
      }
      v137 = (os_log_s *)os_log_GKAccount;
      if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
        sub_6540(v137, v138, v139, v140, v141, v142, v143, v144);
      }
      block[2](block);
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      v82 = (id)((uint64_t (*)(void))GKOSLoggers)();
    }
    v83 = (os_log_s *)os_log_GKAccount;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v235 = v55;
      v236 = 2112;
      v237 = v202;
      v238 = 2112;
      v239 = v199;
      v240 = 2112;
      v241 = v200;
      _os_log_error_impl( &dword_0,  v83,  OS_LOG_TYPE_ERROR,  "GKAppleIDAuthenticationDelegate did not receive the required parameters. Apple ID: %@ DSID: %@ playerID: %@ token: %@",  buf,  0x2Au);
    }

    block[2](block);
  }

  v38 = v211;

LABEL_19:
}

void sub_628C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)os_log_GKGeneral;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    v9 = (void *)os_log_GKAccount;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
      sub_6614(a1, v9);
    }
  }

  else
  {
    if (!os_log_GKGeneral)
    {
      id v10 = (id)GKOSLoggers();
      v7 = (void *)os_log_GKGeneral;
    }

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(a1 + 32);
      v12 = v7;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 shortDebugName]);
      int v14 = 138412290;
      v15 = v13;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate: Saving the game center account %@ succeeded.",  (uint8_t *)&v14,  0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_63DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    id v8 = (void *)os_log_GKAccount;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
      sub_6614(a1, v8);
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers();
    }
    id v10 = (void *)os_log_GKAccount;
    if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
      sub_669C(a1, v10);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_64B0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_64C0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_64FC(uint64_t a1, void *a2)
{
  return a2;
}

  ;
}

void sub_6510( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6540( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6570( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_65A0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "GKAppleIDAuthenticationDelegate Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_6614(uint64_t a1, void *a2)
{
  id v3 = sub_64FC(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 shortDebugName]);
  sub_64E4();
  sub_64C0( &dword_0,  v5,  v6,  "GKAppleIDAuthenticationDelegate: Saving the game center account %@ failed. Error: %@",  v7,  v8,  v9,  v10,  v11);

  sub_64D4();
}

void sub_669C(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 shortDebugName]);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl( &dword_0,  v3,  OS_LOG_TYPE_DEBUG,  "GKAppleIDAuthenticationDelegate: Saving the game center account %@ succeeded.",  (uint8_t *)&v5,  0xCu);
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}