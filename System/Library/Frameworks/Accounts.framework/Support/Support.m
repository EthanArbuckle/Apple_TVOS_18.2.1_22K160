uint64_t start()
{
  uint64_t v0;
  os_log_s *v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  void *i;
  void *v42;
  void *v43;
  BOOL v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  CFStringRef v101;
  id v102;
  CFStringRef v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  id v159;
  id v160;
  uint64_t v161;
  void *k;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v172;
  uint64_t v173;
  uint64_t v174[2];
  ACAccountStore *v175;
  id v176;
  void *v177;
  id v178;
  void *v179;
  uint64_t v180;
  id v181;
  CFStringRef v182;
  CFStringRef v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  void *j;
  id v193;
  id v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  void v207[5];
  int v208;
  _BYTE v209[128];
  id v210;
  id v211;
  _BYTE v212[128];
  _BYTE v213[128];
  v177 = objc_autoreleasePoolPush();
  v0 = _ACLogSystem();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG);

  if (v2)
  {
    v175 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
    v176 = (id)objc_claimAutoreleasedReturnValue(-[ACAccountStore accounts](v175, "accounts"));
    if ([v176 count])
    {
      sub_100003224(@"=======================================", v10, v11, v12, v13, v14, v15, v16, v174[0]);
      sub_100003224(@"Accounts Summary:", v17, v18, v19, v20, v21, v22, v23, v174[0]);
      sub_100003224(@"=======================================", v24, v25, v26, v27, v28, v29, v30, v174[0]);
      sub_100003224(&stru_100004208, v31, v32, v33, v34, v35, v36, v37, v174[0]);
      v174[1] = (uint64_t)v174;
      __chkstk_darwin();
      v207[0] = _NSConcreteStackBlock;
      v207[1] = 3221225472LL;
      v207[2] = sub_1000032AC;
      v207[3] = &unk_100004168;
      v207[4] = &v173;
      v208 = 10;
      v179 = objc_retainBlock(v207);
      v205 = 0u;
      v206 = 0u;
      v203 = 0u;
      v204 = 0u;
      v38 = v176;
      v39 = [v38 countByEnumeratingWithState:&v203 objects:v213 count:16];
      if (v39)
      {
        v40 = *(void *)v204;
        do
        {
          for (i = 0LL; i != v39; i = (char *)i + 1)
          {
            if (*(void *)v204 != v40) {
              objc_enumerationMutation(v38);
            }
            v42 = *(void **)(*((void *)&v203 + 1) + 8LL * (void)i);
            v43 = (void *)objc_claimAutoreleasedReturnValue([v42 parentAccountIdentifier]);
            v44 = v43 == 0LL;

            if (v44)
            {
              LOBYTE(v173) = 0;
              v45 = objc_retainBlock(v179);
              ((void (*)(void *, void *, void, id))v179[2])(v179, v42, 0LL, v45);
            }
          }

          v39 = [v38 countByEnumeratingWithState:&v203 objects:v213 count:16];
        }

        while (v39);
      }

      sub_100003224(&stru_100004208, v46, v47, v48, v49, v50, v51, v52, v173);
      sub_100003224(&stru_100004208, v53, v54, v55, v56, v57, v58, v59, v173);
      sub_100003224(@"=======================================", v60, v61, v62, v63, v64, v65, v66, v173);
      sub_100003224(@"Accounts Configuration:", v67, v68, v69, v70, v71, v72, v73, v173);
      sub_100003224(@"=======================================", v74, v75, v76, v77, v78, v79, v80, v173);
      sub_100003224(&stru_100004208, v81, v82, v83, v84, v85, v86, v87, v173);
      v201 = 0u;
      v202 = 0u;
      v199 = 0u;
      v200 = 0u;
      v178 = v38;
      v181 = [v178 countByEnumeratingWithState:&v199 objects:v212 count:16];
      if (v181)
      {
        v180 = *(void *)v200;
        do
        {
          for (j = 0LL; j != v181; j = (char *)j + 1)
          {
            if (*(void *)v200 != v180) {
              objc_enumerationMutation(v178);
            }
            v88 = *(void **)(*((void *)&v199 + 1) + 8LL * (void)j);
            v89 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"AccountDelegate"]);
            v194 = [v89 mutableCopy];

            [v194 removeObjectForKey:@"tokens"];
            [v88 setObject:v194 forKeyedSubscript:@"AccountDelegate"];
            [v88 setObject:0 forKeyedSubscript:@"pushDeviceToken"];
            v191 = (id)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"kCalDAVPrincipalsKey"]);
            v184 = (id)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"kCalDAVMainPrincipalUIDKey"]);
            v193 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "objectForKeyedSubscript:"));
            if (v193)
            {
              v210 = v184;
              v211 = v193;
              v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v211,  &v210,  1LL));
              [v88 setObject:v90 forKeyedSubscript:@"kCalDAVPrincipalsKey"];
            }

            v91 = objc_claimAutoreleasedReturnValue([v88 fullDescription]);
            v92 = [v91 UTF8String];
            sub_100003224(@"%s", v93, v94, v95, v96, v97, v98, v99, (uint64_t)v92);

            v190 = (id)objc_claimAutoreleasedReturnValue([v88 credential]);
            v189 = (id)objc_claimAutoreleasedReturnValue([v190 password]);
            v100 = [v189 length];
            v101 = @"Yes";
            if (!v100) {
              v101 = @"No";
            }
            v183 = v101;
            v188 = (id)objc_claimAutoreleasedReturnValue([v88 credential]);
            v187 = (id)objc_claimAutoreleasedReturnValue([v188 token]);
            v102 = [v187 length];
            v103 = @"Yes";
            if (!v102) {
              v103 = @"No";
            }
            v182 = v103;
            v186 = (id)objc_claimAutoreleasedReturnValue([v88 credential]);
            v185 = (id)objc_claimAutoreleasedReturnValue([v186 oauthToken]);
            [v185 length];
            v104 = (void *)objc_claimAutoreleasedReturnValue([v88 credential]);
            v105 = (void *)objc_claimAutoreleasedReturnValue([v104 oauthRefreshToken]);
            [v105 length];
            v106 = (void *)objc_claimAutoreleasedReturnValue([v88 credential]);
            v107 = (void *)objc_claimAutoreleasedReturnValue([v106 oauthTokenSecret]);
            [v107 length];
            v108 = (void *)objc_claimAutoreleasedReturnValue([v88 credential]);
            v172 = (void *)objc_claimAutoreleasedReturnValue([v108 expiryDate]);
            sub_100003224( @"credential: Password:%@ Token:%@ OAuthToken:%@ RefreshToken:%@ TokenSecret:%@ ExpirationDate:%@\n\n",  v109,  v110,  v111,  v112,  v113,  v114,  v115,  (uint64_t)v183);
          }

          v181 = [v178 countByEnumeratingWithState:&v199 objects:v212 count:16];
        }

        while (v181);
      }
    }

    else
    {
      sub_100003224(@"No accounts.", v10, v11, v12, v13, v14, v15, v16, v174[0]);
    }

    sub_100003224(&stru_100004208, v116, v117, v118, v119, v120, v121, v122, v174[0]);
    sub_100003224(&stru_100004208, v123, v124, v125, v126, v127, v128, v129, v174[0]);
    sub_100003224(@"=======================================", v130, v131, v132, v133, v134, v135, v136, v174[0]);
    sub_100003224(@"Accounts Types:", v137, v138, v139, v140, v141, v142, v143, v174[0]);
    sub_100003224(@"=======================================", v144, v145, v146, v147, v148, v149, v150, v174[0]);
    sub_100003224(&stru_100004208, v151, v152, v153, v154, v155, v156, v157, v174[0]);
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore allAccountTypes](v175, "allAccountTypes"));
    v197 = 0u;
    v198 = 0u;
    v195 = 0u;
    v196 = 0u;
    v159 = v158;
    v160 = [v159 countByEnumeratingWithState:&v195 objects:v209 count:16];
    if (v160)
    {
      v161 = *(void *)v196;
      do
      {
        for (k = 0LL; k != v160; k = (char *)k + 1)
        {
          if (*(void *)v196 != v161) {
            objc_enumerationMutation(v159);
          }
          v163 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v195 + 1) + 8 * (void)k) fullDescription]);
          sub_100003224(@"%@\n\n", v164, v165, v166, v167, v168, v169, v170, (uint64_t)v163);
        }

        v160 = [v159 countByEnumeratingWithState:&v195 objects:v209 count:16];
      }

      while (v160);
    }
  }

  else
  {
    sub_100003224( @"Accounts summary disabled. It can be enabled by installing the Accounts profile from https://developer.apple.com/bug-reporting/profiles-and-logs/",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v174[0]);
  }

  objc_autoreleasePoolPop(v177);
  return 0LL;
}

#error "1000031E4: call analysis failed (funcsize=29)"
void sub_100003224( void *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  id v9;
  NSString *v10;
  FILE *v11;
  NSString *v12;
  v9 = a1;
  v10 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v9, &a9);

  v11 = __stdoutp;
  v12 = v10;
  fprintf(v11, "%s\n", -[NSString UTF8String](v12, "UTF8String"));
}

void sub_1000032AC(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3 >= 1)
  {
    uint64_t v9 = 0LL;
    do
    {
      strcpy((char *)(*(void *)(a1 + 32) + v9), "    ");
      v9 += 4LL;
    }

    while (4LL * a3 != v9);
  }

  int v35 = a3;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 accountType]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 accountType]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectID]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  sub_100003224(@"%s%@(%@) %@ %@", v15, v16, v17, v18, v19, v20, v21, v10);

  v22 = (void (**)(id, void, uint64_t, id))objc_retainBlock(v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v7 childAccounts]);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v23));

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v25 = v24;
  id v26 = [v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v37;
    int v29 = v35 + 1;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v25);
        }
        int v31 = *(_DWORD *)(a1 + 40);
        if (v29 >= v31) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = v29;
        }
        v22[2](v22, *(void *)(*((void *)&v36 + 1) + 8LL * (void)i), v32, v8);
      }

      id v27 = [v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v27);
  }
}