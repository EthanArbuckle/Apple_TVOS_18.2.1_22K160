@interface AppInstallImportAndPolicyTask
- (AppInstallImportAndPolicyTask)init;
- (void)main;
@end

@implementation AppInstallImportAndPolicyTask

- (AppInstallImportAndPolicyTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppInstallImportAndPolicyTask;
  result = -[Task init](&v3, "init");
  if (result)
  {
    BYTE1(result->super._error) = 0;
    LOBYTE(result->super._error) = 1;
  }

  return result;
}

- (void)main
{
  if (!self)
  {
    v70 = 0LL;
    goto LABEL_66;
  }

  uint64_t v97 = 0LL;
  v98 = &v97;
  uint64_t v99 = 0x3032000000LL;
  v100 = sub_10025EC90;
  v101 = sub_10025ECA0;
  id v102 = 0LL;
  externalID = self->_externalID;
  if (externalID) {
    externalID = objc_getProperty(externalID, a2, 40LL, 1);
  }
  id v4 = externalID;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = sub_1001E2698(v5, (uint64_t)@"archive_type");

  v7 = (id *)(v98 + 5);
  id v8 = (id)v98[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID valueForProperty:](self->_externalID, "valueForProperty:", @"client_type"));
  BOOL v10 = [v9 integerValue] == (id)1;

  if (v10)
  {
    LOBYTE(v107) = 0;
    id v11 = sub_100323D88(self->_externalID);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v96[0] = 0LL;
    id v13 = sub_1001E43F8((uint64_t)&OBJC_CLASS___IXAppInstallCoordinator, v12, 3LL, 0LL, (uint64_t)&v107, (uint64_t)v96);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v96[0];

    if (v14)
    {
      id v16 = [v14 creatorIdentifier];
      uint64_t v17 = ASDLogHandleForCategory(2LL);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v16 == (id)23)
      {
        if (v19)
        {
          install = self->_install;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = install;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%@] Taking over vpp coordinator: %{public}@",  buf,  0x16u);
        }

        *(void *)v108 = v15;
        id v21 = *(id *)v108;

        uint64_t v22 = ASDLogHandleForCategory(2LL);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        v18 = v23;
        if (v21)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = self->_install;
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v21;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "[%@] Unable to take over vpp coordinator due to error: %{public}@",  buf,  0x16u);
          }
        }

        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v26 = self->_install;
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%@] Took over coordinator vpp coordinator",  buf,  0xCu);
          }

          -[NSUUID setValue:forProperty:]( self->_externalID,  "setValue:forProperty:",  &off_10040CBC8,  @"coordinator_intent");
          v27 = self->_externalID;
          v28 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
          -[NSUUID setValue:forProperty:](v27, "setValue:forProperty:", v29, @"coordinator_id");

          id v30 = v14;
          id v21 = 0LL;
          v18 = *(os_log_s **)&self->_suppressEvaluatorDialogs;
          *(void *)&self->_suppressEvaluatorDialogs = v30;
        }
      }

      else
      {
        if (v19)
        {
          v25 = self->_install;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%@] Not taking over coordinator: %{public}@ ",  buf,  0x16u);
        }

        id v21 = v15;
      }
    }

    else
    {
      id v21 = v15;
    }
  }

  else
  {
    id v21 = 0LL;
  }

  v31 = *(void **)&self->_suppressEvaluatorDialogs;
  if (v31) {
    goto LABEL_34;
  }
  v32 = self->_externalID;
  id v107 = v21;
  v33 = sub_1002DF434(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  id v35 = v107;

  if (v34)
  {
    id v106 = v35;
    id v36 = sub_1002DF048(v34, &v106);
    uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    id v21 = v106;

    v38 = *(void **)&self->_suppressEvaluatorDialogs;
    *(void *)&self->_suppressEvaluatorDialogs = v37;

    v39 = *(void **)&self->_suppressEvaluatorDialogs;
    if (v39)
    {
      v40 = self->_externalID;
      v41 = (void *)objc_claimAutoreleasedReturnValue([v39 uniqueIdentifier]);
      -[NSUUID setValue:forProperty:](v40, "setValue:forProperty:", v41, @"coordinator_id");
    }
  }

  else
  {
    id v21 = v35;
  }

  v31 = *(void **)&self->_suppressEvaluatorDialogs;
  if (v31)
  {
LABEL_34:
    if ([v31 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithPlaceholderPromise])
    {
      v42 = *(void **)&self->_suppressEvaluatorDialogs;
      if (v42)
      {
        if ([v42 creatorIdentifier] == (id)1
          && (sub_1001E4DA0(*(void **)&self->_suppressEvaluatorDialogs) & 1) == 0)
        {
          v44 = self->_externalID;
          if (v44) {
            id Property = objc_getProperty(self->_externalID, v43, 40LL, 1);
          }
          else {
            id Property = 0LL;
          }
          id v46 = Property;
          v47 = (void *)objc_claimAutoreleasedReturnValue([v46 firstObject]);
          id v105 = v21;
          v48 = sub_10026D48C(v44, v47, &v105);
          v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
          id v50 = v105;

          id v104 = v50;
          id v51 = sub_10026C808((uint64_t)v49, &v104);
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          id v53 = v104;

          if (!v52)
          {
            uint64_t v54 = ASDLogHandleForCategory(2LL);
            v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v56 = self->_install;
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v56;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "[%@]: Failed to create placeholder: %{public}@",  buf,  0x16u);
            }
          }

          v57 = *(void **)&self->_suppressEvaluatorDialogs;
          id v103 = v53;
          unsigned __int8 v58 = sub_1001E606C(v57, v52, &v103);
          id v21 = v103;

          if ((v58 & 1) == 0)
          {
            uint64_t v59 = ASDLogHandleForCategory(2LL);
            v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              v61 = self->_install;
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v61;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "[%@]: Failed to set placeholder: %{public}@",  buf,  0x16u);
            }

            [v52 cancelForReason:v21 client:1 error:0];
          }
        }
      }
    }
  }

  uint64_t v62 = *(void *)&self->_suppressEvaluatorDialogs;
  if (!v62)
  {
    id v8 = v21;
    uint64_t v62 = *(void *)&self->_suppressEvaluatorDialogs;
  }

  buf[0] = v62 != 0;

  char v63 = buf[0];
  objc_storeStrong(v7, v8);
  if ((v63 & 1) != 0)
  {
LABEL_49:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4010000000LL;
    v113 = &unk_10039135E;
    id v64 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    v96[0] = _NSConcreteStackBlock;
    v96[1] = (id)3221225472LL;
    v96[2] = sub_10025ED68;
    v96[3] = &unk_1003EED00;
    v96[4] = self;
    v96[5] = buf;
    v96[6] = &v97;
    [v65 modifyUsingTransaction:v96];

    uint64_t v66 = *(void *)(*(void *)&buf[8] + 56LL);
    if (v66 == 2)
    {
      if (!BYTE1(self->super._error)) {
        goto LABEL_60;
      }
    }

    else if (!v66)
    {
      uint64_t v67 = ASDLogHandleForCategory(2LL);
      v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v93 = sub_100323C54(&self->_externalID->super.isa);
        v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
        uint64_t v95 = v98[5];
        *(_DWORD *)v108 = 138412546;
        *(void *)&v108[4] = v94;
        *(_WORD *)&v108[12] = 2114;
        *(void *)&v108[14] = v95;
        _os_log_error_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "[%@] Database import failed with error: %{public}@",  v108,  0x16u);
      }

      v69 = sub_10025ECA8( (uint64_t)&OBJC_CLASS___AppInstallImportResult,  *(void **)&self->_suppressEvaluatorDialogs,  *(void **)&self->super._success,  (void *)v98[5]);
      v70 = (AppInstallImportResult *)objc_claimAutoreleasedReturnValue(v69);
      goto LABEL_64;
    }

    v71 = sub_100323CB4(self->_externalID);
    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
    if (!v72)
    {
      v73 = sub_1002E5EDC((uint64_t)&OBJC_CLASS___AppInstallPolicy);
      v72 = (void *)objc_claimAutoreleasedReturnValue(v73);
    }

    coordinator = self->_coordinator;
    if (coordinator)
    {
      uint64_t v75 = (*((uint64_t (**)(IXAppInstallCoordinator *, BOOL, void *))coordinator + 2))( coordinator,  *(void *)(*(void *)&buf[8] + 56LL) == 2LL,  v72);
      uint64_t v76 = objc_claimAutoreleasedReturnValue(v75);

      v72 = (void *)v76;
    }

    sub_100323D30(self->_externalID, (id *)v72);
    id v77 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
    *(void *)v108 = _NSConcreteStackBlock;
    *(void *)&v108[8] = 3221225472LL;
    *(void *)&v108[16] = sub_10025EE84;
    v109 = &unk_1003EA938;
    v111 = buf;
    id v79 = v72;
    id v110 = v79;
    [v78 modifyUsingTransaction:v108];

    if (*(void *)(*(void *)&buf[8] + 56LL) != 2LL)
    {
      v86 = *(void **)&self->super._success;
      v87 = (IXAppInstallCoordinator *)*(id *)&self->_suppressEvaluatorDialogs;
      v82 = v86;
      objc_opt_self(&OBJC_CLASS___AppInstallImportResult);
      v70 = objc_alloc_init(&OBJC_CLASS___AppInstallImportResult);
      v70->_status = 0LL;
      v88 = v70->_coordinator;
      v70->_coordinator = v87;
      v84 = v87;

      goto LABEL_63;
    }

- (void).cxx_destruct
{
}

@end