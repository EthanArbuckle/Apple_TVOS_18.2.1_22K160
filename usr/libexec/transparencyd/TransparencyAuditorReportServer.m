@interface TransparencyAuditorReportServer
+ (void)makeReports:(id)a3 additionalData:(id)a4 auditorURI:(id)a5 logClient:(id)a6 completionBlock:(id)a7;
@end

@implementation TransparencyAuditorReportServer

+ (void)makeReports:(id)a3 additionalData:(id)a4 auditorURI:(id)a5 logClient:(id)a6 completionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v48 = a5;
  id v49 = a6;
  v50 = (void (**)(id, void *))a7;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id obj = v11;
  id v13 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v69;
    uint64_t v15 = kTransparencyAuditorReportApplication;
    uint64_t v53 = kTransparencyAuditorReportUUID;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v69 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  *(void *)(*((void *)&v68 + 1) + 8LL * (void)v16)));
        v18 = v17;
        if (v12) {
          [v17 setObject:v12 forKeyedSubscript:@"userInput"];
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v15]);
        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v19));
          BOOL v21 = v20 == 0LL;

          if (v21)
          {
            if (qword_1002EEC10 != -1) {
              dispatch_once(&qword_1002EEC10, &stru_1002866E8);
            }
            v29 = (void *)qword_1002EEC18;
            if (os_log_type_enabled((os_log_t)qword_1002EEC18, OS_LOG_TYPE_ERROR))
            {
              v30 = v29;
              v31 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v53]);
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v19;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "skipping auditor report with unknown application %@ : %@",  buf,  0x16u);
            }
          }

          else
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:v19]);
            BOOL v23 = v22 == 0LL;

            if (v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              [v56 setObject:v24 forKeyedSubscript:v19];
            }

            v25 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:v19]);
            [v25 addObject:v18];
          }
        }

        else
        {
          if (qword_1002EEC10 != -1) {
            dispatch_once(&qword_1002EEC10, &stru_1002866C8);
          }
          v26 = (void *)qword_1002EEC18;
          if (os_log_type_enabled((os_log_t)qword_1002EEC18, OS_LOG_TYPE_ERROR))
          {
            v27 = v26;
            v28 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v53]);
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "skipping auditor report with missing application: %@",  buf,  0xCu);
          }
        }

        v16 = (char *)v16 + 1;
      }

      while (v13 != v16);
      id v13 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
    }

    while (v13);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v56 allKeys]);
  BOOL v33 = [v32 count] == 0;

  if (v33)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInterface,  -178LL,  @"no auditor reports with valid applications"));
    v50[2](v50, v47);
  }

  else
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v74 = sub_100185EE8;
    v75 = sub_100185EF8;
    id v76 = 0LL;
    group = dispatch_group_create();
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    v34 = v56;
    id v35 = [v34 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v65;
      uint64_t v54 = kTransparencyErrorInterface;
      v51 = v34;
LABEL_26:
      uint64_t v37 = 0LL;
      while (1)
      {
        if (*(void *)v65 != v36) {
          objc_enumerationMutation(v34);
        }
        uint64_t v38 = *(void *)(*((void *)&v64 + 1) + 8 * v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:v38]);
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v39))
        {
          id v63 = 0LL;
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v39,  0LL,  &v63));
          id v42 = v63;
          if (v41)
          {
            dispatch_group_enter(group);
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472LL;
            v60[2] = sub_100185F00;
            v60[3] = &unk_100286710;
            v62 = buf;
            v34 = v51;
            v61 = group;
            [v49 postReport:v41 uuid:v40 application:v38 completionHandler:v60];

            int v43 = 0;
          }

          else
          {
            v50[2](v50, v42);
            int v43 = 1;
          }
        }

        else
        {
          id v42 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v54,  -300LL,  @"auditor report is not a valid JSON object"));
          v50[2](v50, v42);
          int v43 = 1;
        }

        if (v43) {
          break;
        }
        if (v35 == (id)++v37)
        {
          id v35 = [v34 countByEnumeratingWithState:&v64 objects:v72 count:16];
          if (v35) {
            goto LABEL_26;
          }
          goto LABEL_38;
        }
      }
    }

    else
    {
LABEL_38:

      dispatch_queue_attr_t v44 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v45 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v44);
      v46 = dispatch_queue_create("com.apple.transparency.auditReports", v45);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100185F54;
      block[3] = &unk_10027A918;
      v58 = v50;
      v59 = buf;
      dispatch_group_notify(group, v46, block);

      v34 = v58;
    }

    _Block_object_dispose(buf, 8);
  }
}

@end