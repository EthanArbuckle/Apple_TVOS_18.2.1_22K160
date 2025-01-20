@interface KTEnrollmentSignatureSupport
+ (BOOL)validateSignatures:(id)a3 error:(id *)a4;
+ (id)enrollementLoggingKeys:(id)a3;
+ (void)updateClientData:(id)a3 deps:(id)a4 complete:(id)a5;
@end

@implementation KTEnrollmentSignatureSupport

+ (void)updateClientData:(id)a3 deps:(id)a4 complete:(id)a5
{
  id v106 = a3;
  id v7 = a4;
  id v95 = a5;
  id v131 = 0LL;
  uint64_t v132 = 0LL;
  v133 = &v132;
  uint64_t v134 = 0x3032000000LL;
  v135 = sub_10017B97C;
  v136 = sub_10017B98C;
  id v137 = 0LL;
  uint64_t v126 = 0LL;
  v127 = &v126;
  uint64_t v128 = 0x3032000000LL;
  v129 = sub_10017B97C;
  v130 = sub_10017B98C;
  uint64_t v122 = 0LL;
  v123 = &v122;
  uint64_t v124 = 0x2020000000LL;
  char v125 = 0;
  v105 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountOperations]);
  v9 = (id *)(v127 + 5);
  id obj = (id)v127[5];
  v96 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryAccount:&obj]);
  objc_storeStrong(v9, obj);

  if (!v96)
  {
    if (qword_1002EEB40 != -1) {
      dispatch_once(&qword_1002EEB40, &stru_100285D10);
    }
    v56 = (os_log_s *)qword_1002EEB48;
    if (os_log_type_enabled((os_log_t)qword_1002EEB48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "TransparencyAccount no account", buf, 2u);
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    (*((void (**)(id, void *, void, void, uint64_t))v95 + 2))(v95, v57, 0LL, 0LL, v127[5]);
    goto LABEL_89;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 accountOperations]);
  id v93 = [v10 accountLevel:v96];

  if (v93 != (id)4)
  {
    if (qword_1002EEB40 != -1) {
      dispatch_once(&qword_1002EEB40, &stru_100285D30);
    }
    v11 = (os_log_s *)qword_1002EEB48;
    if (os_log_type_enabled((os_log_t)qword_1002EEB48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v141) = (_DWORD)v93;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "TransparencyAccount level not HSA2: %d",  buf,  8u);
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "aa_altDSID"));
  if (!v12)
  {
    if (qword_1002EEB40 != -1) {
      dispatch_once(&qword_1002EEB40, &stru_100285D50);
    }
    v13 = (os_log_s *)qword_1002EEB48;
    if (os_log_type_enabled((os_log_t)qword_1002EEB48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Can't get AltDSID", buf, 2u);
    }
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "aa_personID"));
  if (!v14)
  {
    if (qword_1002EEB40 != -1) {
      dispatch_once(&qword_1002EEB40, &stru_100285D70);
    }
    v15 = (os_log_s *)qword_1002EEB48;
    if (os_log_type_enabled((os_log_t)qword_1002EEB48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't get DSID", buf, 2u);
    }
  }

  v103 = (void *)v14;
  v104 = (void *)v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v106 requests]);
  v94 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);

  if (![v94 count])
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    (*((void (**)(id, void *, void, void, void))v95 + 2))(v95, v58, 0LL, 0LL, 0LL);
    goto LABEL_88;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v105 smDataStore]);
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472LL;
  v120[2] = sub_10017BA54;
  v120[3] = &unk_100285D98;
  v120[4] = &v132;
  [v17 fetchDeviceSignature:v94 complete:v120];

  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue([(id)v133[5] allValues]);
  id v19 = [v18 countByEnumeratingWithState:&v116 objects:v146 count:16];
  if (!v19)
  {
    char v100 = 0;
    goto LABEL_62;
  }

  char v100 = 0;
  uint64_t v20 = *(void *)v117;
  id v101 = v18;
  do
  {
    v21 = 0LL;
    do
    {
      if (*(void *)v117 != v20) {
        objc_enumerationMutation(v101);
      }
      v22 = *(void **)(*((void *)&v116 + 1) + 8LL * (void)v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v106 requests]);
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 application]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v24]);

      v26 = (void *)objc_claimAutoreleasedReturnValue([v22 tbsKTIDSRegistrationData]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v25 tbsKTIDSRegistrationData]);
      LOBYTE(v24) = [v26 isEqual:v27];

      if ((v24 & 1) == 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v105 logger]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v22 application]);
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TBS-%@-%@",  @"u",  v38));
        [v37 incrementIntegerPropertyForKey:v39];

        if (qword_1002EEB40 != -1) {
          dispatch_once(&qword_1002EEB40, &stru_100285DB8);
        }
        v35 = (os_log_s *)(id)qword_1002EEB48;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue([v22 application]);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v22 tbsKTIDSRegistrationData]);
          id v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "kt_hexString"));
          v43 = (void *)objc_claimAutoreleasedReturnValue([v25 tbsKTIDSRegistrationData]);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "kt_hexString"));
          *(_DWORD *)buf = 138412802;
          v141 = v40;
          __int16 v142 = 2112;
          id v143 = v42;
          __int16 v144 = 2112;
          v145 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "TBS changed since last update: %@, old %@, new %@",  buf,  0x20u);
        }

        char v100 = 1;
        goto LABEL_51;
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue([v22 pushToken]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v25 pushToken]);
      unsigned __int8 v30 = [v28 isEqual:v29];

      if ((v30 & 1) == 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue([v105 logger]);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v22 application]);
        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TBS-%@-%@",  @"h",  v46));
        [v45 incrementIntegerPropertyForKey:v47];

        if (qword_1002EEB40 != -1) {
          dispatch_once(&qword_1002EEB40, &stru_100285DD8);
        }
        v35 = (os_log_s *)(id)qword_1002EEB48;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue([v22 application]);
          *(_DWORD *)buf = 138412290;
          v141 = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Pushtoken changed since last update: %@",  buf,  0xCu);
        }

        goto LABEL_51;
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue([v22 altDSID]);
      v32 = v31;
      if (v31 && v104)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v22 altDSID]);
        unsigned __int8 v34 = [v104 isEqual:v33];

        if ((v34 & 1) == 0)
        {
          if (qword_1002EEB40 != -1) {
            dispatch_once(&qword_1002EEB40, &stru_100285DF8);
          }
          v35 = (os_log_s *)(id)qword_1002EEB48;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue([v22 application]);
            *(_DWORD *)buf = 138412290;
            v141 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "TBS have different DSID: %@", buf, 0xCu);
          }

          goto LABEL_51;
        }
      }

      else
      {
      }

      v49 = (void *)objc_claimAutoreleasedReturnValue([v22 dsid]);
      BOOL v50 = v49 == 0LL;

      if (v50)
      {
        if (qword_1002EEB40 != -1) {
          dispatch_once(&qword_1002EEB40, &stru_100285E18);
        }
        v51 = (os_log_s *)(id)qword_1002EEB48;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue([v22 application]);
          *(_DWORD *)buf = 138412290;
          v141 = v52;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "TBS missing dsid, adding in: %@",  buf,  0xCu);
        }

        [v22 setDsid:v103];
      }

      v53 = (void *)objc_claimAutoreleasedReturnValue([v22 signature]);
      if (v53)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v22 publicKey]);
        BOOL v55 = v54 == 0LL;

        if (!v55)
        {
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 application]);
          [v97 addObject:v35];
LABEL_51:
        }
      }

      v21 = (char *)v21 + 1;
    }

    while (v19 != v21);
    v18 = v101;
    id v19 = [v101 countByEnumeratingWithState:&v116 objects:v146 count:16];
  }

  while (v19);
LABEL_62:

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v94));
  [v59 minusSet:v97];
  v98 = v59;
  v99 = objc_alloc_init(&OBJC_CLASS___KDeviceSet);
  if ([v59 count])
  {
    id v102 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v114 = 0u;
    __int128 v115 = 0u;
    __int128 v112 = 0u;
    __int128 v113 = 0u;
    id v60 = v59;
    id v61 = [v60 countByEnumeratingWithState:&v112 objects:v139 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v113;
      do
      {
        for (i = 0LL; i != v61; i = (char *)i + 1)
        {
          if (*(void *)v113 != v62) {
            objc_enumerationMutation(v60);
          }
          uint64_t v64 = *(void *)(*((void *)&v112 + 1) + 8LL * (void)i);
          v65 = (void *)objc_claimAutoreleasedReturnValue([v106 requests]);
          v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:v64]);

          v67 = objc_alloc(&OBJC_CLASS___TransparencyIDSRegistrationData);
          v68 = (void *)objc_claimAutoreleasedReturnValue([v66 tbsKTIDSRegistrationData]);
          v69 = -[TransparencyIDSRegistrationData initWithApplication:registrationData:]( v67,  "initWithApplication:registrationData:",  v64,  v68);

          v70 = (void *)objc_claimAutoreleasedReturnValue([v66 pushToken]);
          -[TransparencyIDSRegistrationData setPushToken:](v69, "setPushToken:", v70);

          -[TransparencyIDSRegistrationData setAltDSID:](v69, "setAltDSID:", v104);
          -[TransparencyIDSRegistrationData setDsid:](v69, "setDsid:", v103);
          [v102 addObject:v69];
          [(id)v133[5] setObject:v69 forKeyedSubscript:v64];
          v71 = (void *)objc_claimAutoreleasedReturnValue([v66 pushToken]);
          if (v71)
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue([v66 tbsKTIDSRegistrationData]);
            BOOL v73 = v72 == 0LL;

            if (!v73)
            {
              v74 = (void *)objc_claimAutoreleasedReturnValue([v66 pushToken]);
              v75 = (void *)objc_claimAutoreleasedReturnValue([v66 tbsKTIDSRegistrationData]);
              id v76 = -[KDeviceSet addDevice:registationData:app:](v99, "addDevice:registationData:app:", v74, v75, v64);
            }
          }
        }

        id v61 = [v60 countByEnumeratingWithState:&v112 objects:v139 count:16];
      }

      while (v61);
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue([v105 smDataStore]);
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472LL;
    v111[2] = sub_10017BB60;
    v111[3] = &unk_100285E40;
    v111[4] = &v126;
    v111[5] = &v122;
    [v77 storeDeviceSignature:v102 complete:v111];

    v78 = (void *)objc_claimAutoreleasedReturnValue([v105 cloudRecords]);
    if (v78)
    {
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      __int128 v107 = 0u;
      __int128 v108 = 0u;
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](v99, "devices"));
      v80 = (void *)objc_claimAutoreleasedReturnValue([v79 allObjects]);

      id v81 = [v80 countByEnumeratingWithState:&v107 objects:v138 count:16];
      if (v81)
      {
        uint64_t v82 = *(void *)v108;
        do
        {
          for (j = 0LL; j != v81; j = (char *)j + 1)
          {
            if (*(void *)v108 != v82) {
              objc_enumerationMutation(v80);
            }
            v84 = *(void **)(*((void *)&v107 + 1) + 8LL * (void)j);
            v85 = (void *)objc_claimAutoreleasedReturnValue([v105 cloudRecords]);
            v86 = (void *)objc_claimAutoreleasedReturnValue([v84 pushToken]);
            v87 = (void *)objc_claimAutoreleasedReturnValue([v84 registrationData]);
            v88 = (void *)objc_claimAutoreleasedReturnValue([v84 apps]);
            v89 = (void *)objc_claimAutoreleasedReturnValue([v88 allObjects]);
            [v85 updateSelfCloudDeviceWithPushToken:v86 tbsRegistrationData:v87 applications:v89];
          }

          id v81 = [v80 countByEnumeratingWithState:&v107 objects:v138 count:16];
        }

        while (v81);
      }

      if (v93 == (id)4)
      {
        v90 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"CloudKitOutgoing",  2LL,  5.0);
        v91 = (void *)objc_claimAutoreleasedReturnValue([v105 flagHandler]);
        [v91 handlePendingFlag:v90];
      }
    }
  }

  if (v93 == (id)4) {
    v92 = (void *)v133[5];
  }
  else {
    v92 = &__NSDictionary0__struct;
  }
  (*((void (**)(id, void *, void, void, uint64_t))v95 + 2))( v95,  v92,  *((unsigned __int8 *)v123 + 24),  v100 & 1,  v127[5]);

  v58 = v97;
LABEL_88:

  v57 = v104;
LABEL_89:

  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v126, 8);

  _Block_object_dispose(&v132, 8);
}

+ (id)enrollementLoggingKeys:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [&off_10029A310 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&off_10029A310);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TBS-%@-%@",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8),  v3));
        [v4 addObject:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [&off_10029A310 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v4;
}

+ (BOOL)validateSignatures:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 1;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10017B97C;
  id v19 = sub_10017B98C;
  id v20 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 smDataStore]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017BE44;
  v11[3] = &unk_100285E68;
  __int128 v13 = &v15;
  __int128 v14 = &v21;
  id v7 = v5;
  id v12 = v7;
  [v6 fetchDeviceSignature:0 complete:v11];

  if (a4)
  {
    v8 = (void *)v16[5];
    if (v8) {
      *a4 = v8;
    }
  }

  char v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end