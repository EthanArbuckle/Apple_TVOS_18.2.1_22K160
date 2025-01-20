@interface NDCallbackQueue
- (NDCallbackQueue)initWithDelegate:(id)a3;
- (NDCallbackQueueDelegate)delegate;
- (unint64_t)count;
- (void)addPendingCallback:(id)a3 wakeRequirement:(int64_t)a4;
- (void)addPendingCallbackToFront:(id)a3;
- (void)drainCallback:(id)a3;
- (void)drainCallbacksForTaskIdentifier:(unint64_t)a3;
- (void)performAllCallbacks;
- (void)performCallback:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NDCallbackQueue

- (NDCallbackQueue)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NDCallbackQueue;
  v5 = -[NDCallbackQueue init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[NDCallbackQueue setDelegate:](v5, "setDelegate:", v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    callbacks = v6->_callbacks;
    v6->_callbacks = (NSMutableArray *)v7;
  }

  return v6;
}

- (void)performCallback:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v99 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);
  id v6 = [v4 taskIdentifier];
  switch([v4 type])
  {
    case 0u:
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNull);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        id v10 = 0LL;
      }

      else
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        id v10 = (id)objc_claimAutoreleasedReturnValue([v67 objectAtIndexedSubscript:0]);
      }

      v68 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectAtIndexedSubscript:1]);
      uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSNull);
      if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0)
      {
        v71 = 0LL;
      }

      else
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        v71 = (void *)objc_claimAutoreleasedReturnValue([v77 objectAtIndexedSubscript:1]);
      }

      v78 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v79 = (void *)objc_claimAutoreleasedReturnValue([v78 objectAtIndexedSubscript:2]);

      v182[0] = _NSConcreteStackBlock;
      v182[1] = 3221225472LL;
      v182[2] = sub_10003F540;
      v182[3] = &unk_100079A28;
      v182[4] = self;
      v80 = (void *)objc_claimAutoreleasedReturnValue([v99 remoteObjectProxyWithErrorHandler:v182]);
      v177[0] = _NSConcreteStackBlock;
      v177[1] = 3221225472LL;
      v177[2] = sub_10003F5A4;
      v177[3] = &unk_100079CA8;
      id v181 = v6;
      id v178 = WeakRetained;
      v179 = self;
      id v180 = v4;
      [v80 backgroundTask:v6 didCompleteWithError:v10 taskMetrics:v71 info:v79 reply:v177];

      goto LABEL_53;
    case 1u:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      if ([v11 count])
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
      }

      else
      {
        v13 = 0LL;
      }

      uint64_t v81 = objc_opt_class(&OBJC_CLASS_____NSCFURLSessionTaskInfo);
      char isKindOfClass = objc_opt_isKindOfClass(v13, v81);
      id v83 = v13;
      v84 = v83;
      id v10 = v83;
      if ((isKindOfClass & 1) != 0)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue([v83 pathToDownloadTaskFile]);
        if (v85
          || (v86 = (void *)objc_claimAutoreleasedReturnValue([v84 additionalProperties]),
              v85 = (void *)objc_claimAutoreleasedReturnValue([v86 objectForKeyedSubscript:@"pathToDownloadTaskFile"]),
              v86,
              v85))
        {
          id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v85,  0LL));
        }

        else
        {
          id v10 = (id)objc_claimAutoreleasedReturnValue([v84 downloadFileURL]);
        }
      }

      v87 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v88 = (void *)objc_claimAutoreleasedReturnValue([v87 objectAtIndexedSubscript:1]);

      uint64_t v89 = objc_opt_class(&OBJC_CLASS___NSNull);
      if ((objc_opt_isKindOfClass(v88, v89) & 1) != 0) {
        v90 = 0LL;
      }
      else {
        v90 = v88;
      }
      v172[0] = _NSConcreteStackBlock;
      v172[1] = 3221225472LL;
      v172[2] = sub_10003F698;
      v172[3] = &unk_100079CA8;
      id v176 = v6;
      id v173 = WeakRetained;
      v174 = self;
      id v175 = v4;
      [v99 backgroundDownloadTask:v6 didFinishDownloadingToURL:v10 response:v90 reply:v172];

      goto LABEL_53;
    case 2u:
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);

      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:1]);

      v17 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained descriptionForTaskWithIdentifier:v6]);
        *(_DWORD *)buf = 138543618;
        id v184 = v18;
        __int16 v185 = 2112;
        id v186 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ performing auth challenge callback, challenge %@",  buf,  0x16u);
      }

      v168[0] = _NSConcreteStackBlock;
      v168[1] = 3221225472LL;
      v168[2] = sub_10003F780;
      v168[3] = &unk_100079A50;
      id v19 = v4;
      id v169 = v19;
      v170 = self;
      id v20 = v16;
      id v171 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v99 remoteObjectProxyWithErrorHandler:v168]);
      v162[0] = _NSConcreteStackBlock;
      v162[1] = 3221225472LL;
      v162[2] = sub_10003F808;
      v162[3] = &unk_100079A78;
      id v163 = v19;
      id v164 = WeakRetained;
      id v167 = v6;
      id v22 = v20;
      id v166 = v22;
      v165 = self;
      [v21 backgroundTask:v6 didReceiveChallenge:v10 reply:v162];

      goto LABEL_53;
    case 3u:
      v23 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained descriptionForTaskWithIdentifier:v6]);
        *(_DWORD *)buf = 138543362;
        id v184 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ performing did start app wake callback.",  buf,  0xCu);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:0]);

      v160[0] = _NSConcreteStackBlock;
      v160[1] = 3221225472LL;
      v160[2] = sub_10003FA74;
      v160[3] = &unk_100079C30;
      v160[4] = self;
      id v161 = v4;
      [v99 backgroundSessionDidStartAppWake:v10 reply:v160];

      goto LABEL_53;
    case 4u:
      v26 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained descriptionForTaskWithIdentifier:v6]);
        *(_DWORD *)buf = 138543362;
        id v184 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@ performing did finish app wake callback.",  buf,  0xCu);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:0]);

      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472LL;
      v158[2] = sub_10003FA80;
      v158[3] = &unk_100079C30;
      v158[4] = self;
      id v159 = v4;
      [v99 backgroundSessionDidFinishAppWake:v10 reply:v158];

      goto LABEL_53;
    case 5u:
      v29 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v96 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:0]);

      v30 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v95 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:1]);

      v31 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", v6, v95));
        *(_DWORD *)buf = 138543618;
        id v184 = v32;
        __int16 v185 = 2112;
        id v186 = v96;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@ performing will send request callback, request %@",  buf,  0x16u);
      }

      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472LL;
      v151[2] = sub_10003FA8C;
      v151[3] = &unk_100079AA0;
      id v33 = v4;
      id v152 = v33;
      id v34 = WeakRetained;
      id v153 = v34;
      id v157 = v6;
      id v35 = v95;
      id v156 = v35;
      id v10 = v96;
      id v154 = v10;
      v155 = self;
      v36 = (void *)objc_claimAutoreleasedReturnValue([v99 remoteObjectProxyWithErrorHandler:v151]);
      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472LL;
      v145[2] = sub_10003FBA8;
      v145[3] = &unk_100079AC8;
      id v146 = v33;
      id v147 = v34;
      id v150 = v6;
      id v37 = v35;
      id v149 = v37;
      v148 = self;
      objc_msgSend(v36, "backgroundTask:_willSendRequestForEstablishedConnection:reply:", v6, v10, v145);

      goto LABEL_53;
    case 6u:
      v38 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v38 objectAtIndexedSubscript:0]);

      v39 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectAtIndexedSubscript:1]);
      id v41 = [v40 intValue];

      v42 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectAtIndexedSubscript:2]);

      v44 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v184 = v10;
        __int16 v185 = 1024;
        LODWORD(v186) = (_DWORD)v41;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Performing open file at path callback for path %@ mode %d",  buf,  0x12u);
      }

      v142[0] = _NSConcreteStackBlock;
      v142[1] = 3221225472LL;
      v142[2] = sub_10003FD08;
      v142[3] = &unk_100079AF0;
      id v45 = v4;
      id v143 = v45;
      v144 = self;
      v46 = (void *)objc_claimAutoreleasedReturnValue([v99 remoteObjectProxyWithErrorHandler:v142]);
      v138[0] = _NSConcreteStackBlock;
      v138[1] = 3221225472LL;
      v138[2] = sub_10003FD78;
      v138[3] = &unk_100079B18;
      id v139 = v45;
      id v47 = v43;
      id v141 = v47;
      v140 = self;
      [v46 openFileAtPath:v10 mode:v41 withReply:v138];

      goto LABEL_53;
    case 8u:
      v48 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      if ([v48 count])
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        id v10 = (id)objc_claimAutoreleasedReturnValue([v49 objectAtIndexedSubscript:0]);
      }

      else
      {
        id v10 = 0LL;
      }

      v133[0] = _NSConcreteStackBlock;
      v133[1] = 3221225472LL;
      v133[2] = sub_10003FE74;
      v133[3] = &unk_100079B40;
      id v137 = v6;
      id v134 = WeakRetained;
      v135 = self;
      id v91 = v4;
      id v136 = v91;
      v92 = (void *)objc_claimAutoreleasedReturnValue([v99 remoteObjectProxyWithErrorHandler:v133]);
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472LL;
      v131[2] = sub_10003FF74;
      v131[3] = &unk_100079C30;
      v131[4] = self;
      id v132 = v91;
      [v92 backgroundAVAssetDownloadTask:v6 didResolveMediaSelectionProperyList:v10 reply:v131];

      goto LABEL_53;
    case 9u:
      v58 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:0]);

      v59 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v98 = (void *)objc_claimAutoreleasedReturnValue([v59 objectAtIndexedSubscript:1]);

      v60 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained descriptionForTaskWithIdentifier:v6]);
        *(_DWORD *)buf = 138543362;
        id v184 = v61;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%{public}@ performing begin delayed request callback",  buf,  0xCu);
      }

      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472LL;
      v118[2] = sub_10004008C;
      v118[3] = &unk_100079B68;
      id v62 = v4;
      id v119 = v62;
      id v63 = WeakRetained;
      id v120 = v63;
      id v123 = v6;
      id v64 = v98;
      v121 = self;
      id v122 = v64;
      v65 = (void *)objc_claimAutoreleasedReturnValue([v99 remoteObjectProxyWithErrorHandler:v118]);
      v112[0] = _NSConcreteStackBlock;
      v112[1] = 3221225472LL;
      v112[2] = sub_1000401A8;
      v112[3] = &unk_100079B90;
      id v113 = v62;
      id v114 = v63;
      id v117 = v6;
      id v66 = v64;
      v115 = self;
      id v116 = v66;
      [v65 backgroundTask:v6 willBeginDelayedRequest:v10 reply:v112];

      goto LABEL_53;
    case 0xAu:
      v50 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained descriptionForTaskWithIdentifier:v6]);
        *(_DWORD *)buf = 138543362;
        id v184 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%{public}@ performing get auth headers for response callback.",  buf,  0xCu);
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      v97 = (void *)objc_claimAutoreleasedReturnValue([v52 objectAtIndexedSubscript:0]);

      v53 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      BOOL v54 = (unint64_t)[v53 count] > 1;

      if (v54)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        id v10 = (id)objc_claimAutoreleasedReturnValue([v55 objectAtIndexedSubscript:1]);
      }

      else
      {
        id v10 = 0LL;
      }

      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472LL;
      v106[2] = sub_1000402F0;
      v106[3] = &unk_100079B68;
      id v72 = v4;
      id v107 = v72;
      id v73 = WeakRetained;
      id v108 = v73;
      id v111 = v6;
      id v74 = v97;
      v109 = self;
      id v110 = v74;
      v75 = (void *)objc_claimAutoreleasedReturnValue([v99 remoteObjectProxyWithErrorHandler:v106]);
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472LL;
      v100[2] = sub_100040430;
      v100[3] = &unk_100079BB8;
      id v101 = v72;
      id v102 = v73;
      id v105 = v6;
      id v76 = v74;
      v103 = self;
      id v104 = v76;
      [v75 backgroundTask:v6 getAuthHeadersForResponse:v10 reply:v100];

      goto LABEL_53;
    case 0xBu:
      v56 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
      if ([v56 count])
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        id v10 = (id)objc_claimAutoreleasedReturnValue([v57 objectAtIndexedSubscript:0]);
      }

      else
      {
        id v10 = 0LL;
      }

      v126[0] = _NSConcreteStackBlock;
      v126[1] = 3221225472LL;
      v126[2] = sub_10003FF80;
      v126[3] = &unk_100079B40;
      id v130 = v6;
      id v127 = WeakRetained;
      v128 = self;
      id v93 = v4;
      id v129 = v93;
      v94 = (void *)objc_claimAutoreleasedReturnValue([v99 remoteObjectProxyWithErrorHandler:v126]);
      v124[0] = _NSConcreteStackBlock;
      v124[1] = 3221225472LL;
      v124[2] = sub_100040080;
      v124[3] = &unk_100079C30;
      v124[4] = self;
      id v125 = v93;
      [v94 backgroundAVAssetDownloadTask:v6 willDownloadVariants:v10 reply:v124];

LABEL_53:
      break;
    default:
      break;
  }
}

- (void)drainCallback:(id)a3
{
  id v4 = a3;
  if (([v4 hasBeenCalled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    switch([v4 type])
    {
      case 2u:
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);

        v8 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( WeakRetained,  "descriptionForTaskWithIdentifier:",  objc_msgSend(v4, "taskIdentifier")));
          int v21 = 138543362;
          id v22 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ draining authentication challenge callback",  (uint8_t *)&v21,  0xCu);
        }

        goto LABEL_5;
      case 5u:
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);

        v11 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( WeakRetained,  "descriptionForTaskWithIdentifier:",  objc_msgSend(v4, "taskIdentifier")));
          int v21 = 138543362;
          id v22 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ draining willSendRequest callback",  (uint8_t *)&v21,  0xCu);
        }

        v7[2](v7, 0LL, 0LL);
        goto LABEL_18;
      case 6u:
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:2]);

        v14 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( WeakRetained,  "descriptionForTaskWithIdentifier:",  objc_msgSend(v4, "taskIdentifier")));
          int v21 = 138543362;
          id v22 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ draining openFileAtPath callback",  (uint8_t *)&v21,  0xCu);
        }

        ((void (*)(void (**)(void, void, void), void))v7[2])(v7, 0LL);
        goto LABEL_18;
      case 9u:
        v16 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:1]);

        v8 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( WeakRetained,  "descriptionForTaskWithIdentifier:",  objc_msgSend(v4, "taskIdentifier")));
          int v21 = 138543362;
          id v22 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ draining willBeginDelayedRequest callback",  (uint8_t *)&v21,  0xCu);
        }

- (void)addPendingCallbackToFront:(id)a3
{
}

- (void)addPendingCallback:(id)a3 wakeRequirement:(int64_t)a4
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NSMutableArray addObject:](self->_callbacks, "addObject:", v8);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);

  if (v7)
  {
    -[NDCallbackQueue performCallback:](self, "performCallback:", v8);
  }

  else if (a4)
  {
    [WeakRetained wakeUpClient:a4];
  }
}

- (void)performAllCallbacks
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v3 = self->_callbacks;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[NDCallbackQueue performCallback:]( self,  "performCallback:",  *(void *)(*((void *)&v7 + 1) + 8LL * (void)v6),  (void)v7);
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (void)drainCallbacksForTaskIdentifier:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = self->_callbacks;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ([v10 taskIdentifier] == (id)a3) {
          [v5 addObject:v10];
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v7);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)j);
        -[NDCallbackQueue drainCallback:](self, "drainCallback:", v15, (void)v16);
        -[NSMutableArray removeObject:](self->_callbacks, "removeObject:", v15);
      }

      id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v12);
  }
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_callbacks, "count");
}

- (NDCallbackQueueDelegate)delegate
{
  return (NDCallbackQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end