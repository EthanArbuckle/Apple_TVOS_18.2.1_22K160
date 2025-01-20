@interface SwitchAppOwnerTask
- (void)main;
@end

@implementation SwitchAppOwnerTask

- (void)main
{
  id v3 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v180 = 0LL;
  id v5 = sub_100255E30((uint64_t)v4, (uint64_t)@"switch-arcade-user", &v180);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v180;

  if (v7)
  {
    uint64_t v8 = ASDLogHandleForCategory(28LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v185 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[SwitchArcade]: Error reading switch bag key. Error: %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v10 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    v11 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(-[os_log_s URLForKey:](v9, "URLForKey:", @"switch-arcade-user"));
    logKey = self->_logKey;
    self->_logKey = v11;
  }

LABEL_7:
  id newValue = v7;
  v13 = self->_logKey;
  uint64_t v14 = ASDLogHandleForCategory(28LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
    error = self->super._error;
    v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success username]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
    *(_DWORD *)buf = 138544643;
    id v185 = v16;
    __int16 v186 = 2113;
    *(void *)v187 = error;
    *(_WORD *)&v187[8] = 2113;
    *(void *)&v187[10] = v18;
    __int16 v188 = 2114;
    v189 = v19;
    __int16 v190 = 1024;
    BOOL v191 = v13 != 0LL;
    __int16 v192 = 1024;
    BOOL v193 = v6 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Starting switch bundleID: %{public}@ fromUserName: %{private}@ toUserName: %{private}@/%{public}@ usingSwithArcadeUserEndpoint: %d hadURL: %d",  buf,  0x36u);
  }

  v179 = v6;

  v20 = &OBJC_IVAR___ODRApplication__variantID;
  if (!v13)
  {
    v38 = sub_1002E5EDC((uint64_t)&OBJC_CLASS___AppInstallPolicy);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    sub_1002E60D4((uint64_t)v39, 3LL);
    sub_1002E6174((uint64_t)v39, 4LL);
    sub_1002E5F7C((uint64_t)v39, 60LL);
    v40 = objc_alloc(&OBJC_CLASS___RestoreAppInstall);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSString storeMetadata](self->_fromUserName, "storeMetadata"));
    if (v40) {
      id v42 = sub_1002D7418(v40, v41, 1LL, -1LL, v39);
    }
    else {
      id v42 = 0LL;
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSString deviceIdentifierForVendor](self->_fromUserName, "deviceIdentifierForVendor"));
    if (v43)
    {
      v44 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v43);
      if (v44 && v42) {
        [v42 setValue:v44 forProperty:@"vid"];
      }
    }

    v45 = objc_alloc(&OBJC_CLASS___ContentRestoreTask);
    id v194 = v42;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v194, 1LL));
    v47 = sub_1001D533C((id *)&v45->super.super.super.isa, v46, *(void **)&self->super._success);

    id v183 = 0LL;
    BOOL v48 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v47, &v183);
    v49 = (os_log_s *)v183;
    if (v49)
    {
      os_log_t v51 = v49;
      uint64_t v52 = ASDLogHandleForCategory(28LL);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v161 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        *(_DWORD *)buf = 138543618;
        id v185 = v161;
        __int16 v186 = 2112;
        *(void *)v187 = v51;
        _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "[SwitchArcade] [%{public}@] Content restore call resulted in error: %@",  buf,  0x16u);
      }

      goto LABEL_130;
    }

    if (v47) {
      id Property = objc_getProperty(v47, v50, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v56 = Property;
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 firstObject]);

    if (v53)
    {
      id v58 = objc_getProperty(v53, v57, 72LL, 1);
      v60 = v58;
      if (v58) {
        id v58 = objc_getProperty(v58, v59, 144LL, 1);
      }
    }

    else
    {
      v60 = 0LL;
      id v58 = 0LL;
    }

    id v61 = v58;

    if (!v61)
    {
      uint64_t v155 = ASDLogHandleForCategory(28LL);
      v177 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
      if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
      {
        v166 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        *(_DWORD *)buf = 138543362;
        id v185 = v166;
        _os_log_error_impl( (void *)&_mh_execute_header,  v177,  OS_LOG_TYPE_ERROR,  "[SwitchArcade]: Unable to find SINF in server response for bundleID: %{public}@",  buf,  0xCu);
      }

      os_log_t v51 = 0LL;
      goto LABEL_129;
    }

    v174 = v43;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSString applicationIdentity](self->_fromUserName, "applicationIdentity"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleURL](self->_fromUserName, "bundleURL"));
    id v182 = 0LL;
    id v176 = v61;
    unsigned int v64 = sub_1001E52B4( (uint64_t)&OBJC_CLASS___IXAppInstallCoordinator,  v62,  (uint64_t)v63,  v61,  (uint64_t)&v182);
    v65 = (os_log_s *)v182;

    uint64_t v66 = ASDLogHandleForCategory(28LL);
    v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    v68 = v67;
    if (!v64)
    {
      v177 = v67;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v167 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        *(_DWORD *)buf = 138543618;
        id v185 = v167;
        __int16 v186 = 2114;
        *(void *)v187 = v65;
        _os_log_error_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "[SwitchArcade]: Unable to swap SINF for bundleID: %{public}@ error: %{public}@",  buf,  0x16u);
      }

      BOOL v48 = 0;
      os_log_t v51 = v65;
      v43 = v174;
      id v61 = v176;
      goto LABEL_129;
    }

    os_log_t log = v65;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
      *(_DWORD *)buf = 138543618;
      id v185 = v69;
      __int16 v186 = 2114;
      *(void *)v187 = v70;
      _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Updated SINF for bundleID: %{public}@ to account: %{public}@",  buf,  0x16u);
    }

    v43 = v174;
    if (!v53 || (v71 = (os_log_s *)sub_1002CB4AC(v53, *(void **)&self->super._success, 1)) == 0LL)
    {
      uint64_t v156 = ASDLogHandleForCategory(28LL);
      v157 = (os_log_s *)objc_claimAutoreleasedReturnValue(v156);
      v171 = v157;
      if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
      {
        v168 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        *(_DWORD *)buf = 138543362;
        id v185 = v168;
        _os_log_error_impl( (void *)&_mh_execute_header,  v157,  OS_LOG_TYPE_ERROR,  "[SwitchArcade]: Unable to generate new metadata for bundleID: %{public}@",  buf,  0xCu);
      }

      v177 = 0LL;
      BOOL v48 = 1;
      os_log_t v51 = log;
      goto LABEL_128;
    }

    v72 = v71;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
    uint64_t v74 = objc_claimAutoreleasedReturnValue(-[NSString bundleURL](self->_fromUserName, "bundleURL"));
    v75 = v72;
    v76 = (void *)v74;
    os_log_t v181 = log;
    v177 = v75;
    unsigned int v170 = sub_10030456C(v75, v73, v74, &v181);
    os_log_t v51 = v181;

    if (!v170)
    {
      BOOL v48 = 0;
      id v61 = v176;
LABEL_129:

LABEL_130:
      buf[0] = v48;

      goto LABEL_131;
    }

    id v78 = objc_getProperty(v53, v77, 40LL, 1);
    if (v78) {
      sub_1002F36C0((uint64_t)self, self->_fromUserName, v78);
    }
    v171 = (os_log_s *)v78;
    uint64_t v79 = ASDLogHandleForCategory(28LL);
    v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
      *(_DWORD *)buf = 138543618;
      id v185 = v81;
      __int16 v186 = 2114;
      *(void *)v187 = v82;
      _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Updated metadata for bundleID: %{public}@ to account: %{public}@",  buf,  0x16u);
    }

    id v83 = objc_claimAutoreleasedReturnValue( -[NSString canonicalExecutablePath]( self->_fromUserName, "canonicalExecutablePath"));
    [v83 fileSystemRepresentation];
    sub_1001242AC();
    int v85 = v84;

    BOOL v48 = v85 == 0;
    uint64_t v86 = ASDLogHandleForCategory(28LL);
    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
    BOOL v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
    if (v85)
    {
      int v169 = v85;
      v6 = v179;
      if (v88)
      {
        loga = v87;
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        *(_DWORD *)buf = 138543618;
        id v185 = v89;
        __int16 v186 = 2048;
        *(void *)v187 = v169;
        _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Not launching following SINF update for bundleID: %{public}@ subscription status: %ld",  buf,  0x16u);
LABEL_126:

        v87 = loga;
      }
    }

    else
    {
      v6 = v179;
      if (v88)
      {
        loga = v87;
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
        *(_DWORD *)buf = 138543618;
        id v185 = v89;
        __int16 v186 = 2114;
        *(void *)v187 = v164;
        _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Launching for bundleID: %{public}@ to account: %{public}@",  buf,  0x16u);

        v6 = v179;
        goto LABEL_126;
      }
    }

LABEL_128:
    id v61 = v176;

    goto LABEL_129;
  }

  v21 = objc_alloc(&OBJC_CLASS___SwitchAppOwnerURLRequestEncoder);
  id v22 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = -[SwitchAppOwnerURLRequestEncoder initWithBag:](v21, "initWithBag:", v23);

  if (*(void *)&self->super._success) {
    -[SwitchAppOwnerURLRequestEncoder setAccount:](v24, "setAccount:");
  }
  v175 = v24;
  v25 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
  if (v26) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v26, @"guid");
  }
  v27 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
  v29 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v27,  "initWithBundleIdentifier:allowPlaceholder:error:",  v28,  0LL,  0LL);

  if (!v29)
  {
    v54 = 0LL;
    v37 = 0LL;
LABEL_56:

    goto LABEL_58;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord URL](v29, "URL"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 path]);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord executableURL](v29, "executableURL"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 lastPathComponent]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 stringByAppendingPathExtension:@"sinf"]);

  if ([v31 length] && objc_msgSend(v34, "length"))
  {
    v35 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  v31,  @"SC_Info",  v34,  0LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v35));
    if (v36) {
      v37 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v36);
    }
    else {
      v37 = 0LL;
    }
  }

  else
  {
    v37 = 0LL;
  }

  if (v37)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v37, "base64EncodedStringWithOptions:", 0LL));
    v20 = &OBJC_IVAR___ODRApplication__variantID;
    if (v54) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v54,  @"existingSinf");
    }
    goto LABEL_56;
  }

  v20 = &OBJC_IVAR___ODRApplication__variantID;
LABEL_58:
  v90 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  v91 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->super.super.super.isa + v20[105]) bundleID]);
  v92 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v90,  "initWithBundleIdentifier:allowPlaceholder:error:",  v91,  0LL,  0LL);

  if (!v92)
  {
    v98 = 0LL;
    v97 = 0LL;
    v96 = v175;
LABEL_66:

    goto LABEL_68;
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord dataContainerURL](v92, "dataContainerURL"));
  v94 = (void *)objc_claimAutoreleasedReturnValue([v93 URLByAppendingPathComponent:@"StoreKit"]);
  v95 = (void *)objc_claimAutoreleasedReturnValue([v94 URLByAppendingPathComponent:@"receipt"]);

  v96 = v175;
  if (v95) {
    v97 = -[NSData initWithContentsOfURL:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfURL:", v95);
  }
  else {
    v97 = 0LL;
  }

  if (v97)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v97, "base64EncodedStringWithOptions:", 0LL));
    v20 = &OBJC_IVAR___ODRApplication__variantID;
    if (v98) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v98,  @"existingReceipt");
    }
    goto LABEL_66;
  }

  v20 = &OBJC_IVAR___ODRApplication__variantID;
LABEL_68:
  v99 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->super.super.super.isa + v20[105]) deviceIdentifierForVendor]);
  if (v99) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v99, @"vid");
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue( -[SwitchAppOwnerURLRequestEncoder requestWithMethod:bagURL:parameters:]( v96,  "requestWithMethod:bagURL:parameters:",  4LL,  self->_logKey,  v25));
  id v194 = 0LL;
  v101 = (void *)objc_claimAutoreleasedReturnValue([v100 resultWithError:&v194]);
  id v102 = v194;

  id v103 = sub_1001F4ADC((uint64_t)&OBJC_CLASS___AMSProcessInfo);
  v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
  v105 = sub_1001A5534((uint64_t)&OBJC_CLASS___AMSURLSession, v104);
  v106 = (void *)objc_claimAutoreleasedReturnValue(v105);

  v107 = (void *)objc_claimAutoreleasedReturnValue([v106 dataTaskPromiseWithRequest:v101]);
  id v183 = v102;
  v108 = (void *)objc_claimAutoreleasedReturnValue([v107 resultWithError:&v183]);
  id v109 = v183;

  if (v109)
  {
    uint64_t v110 = ASDLogHandleForCategory(28LL);
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v185 = v109;
      _os_log_error_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_ERROR,  "[SwitchArcade]: Resulted with error: %{public}@",  buf,  0xCu);
    }

    id v112 = v109;
    v113 = 0LL;
  }

  else
  {
    v113 = (void *)objc_claimAutoreleasedReturnValue([v108 object]);
  }

  id v114 = v109;
  uint64_t v115 = ASDLogHandleForCategory(28LL);
  v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v185 = v113;
    _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Result: %{public}@",  buf,  0xCu);
  }

  v117 = (void *)objc_claimAutoreleasedReturnValue([v113 objectForKeyedSubscript:@"sinfs"]);
  v6 = v179;
  if ([v117 count])
  {
    v118 = (void *)objc_claimAutoreleasedReturnValue([v117 firstObject]);
    v119 = (void *)objc_claimAutoreleasedReturnValue([v118 objectForKeyedSubscript:@"sinf"]);

    v120 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v119,  0LL);
    if (!v120)
    {
      uint64_t v130 = ASDLogHandleForCategory(28LL);
      v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        v163 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        *(_DWORD *)buf = 138543362;
        id v185 = v163;
        _os_log_error_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_ERROR,  "[SwitchArcade]: Unable to decode SINF on app with bundleID: %{public}@",  buf,  0xCu);
      }

      uint8_t v129 = 0;
      goto LABEL_119;
    }

    v121 = v120;
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[NSString applicationIdentity](self->_fromUserName, "applicationIdentity"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleURL](self->_fromUserName, "bundleURL"));
    id v194 = v114;
    unsigned int v124 = sub_1001E52B4( (uint64_t)&OBJC_CLASS___IXAppInstallCoordinator,  v122,  (uint64_t)v123,  v121,  (uint64_t)&v194);
    id v125 = v194;

    uint64_t v126 = ASDLogHandleForCategory(28LL);
    v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
    v128 = v127;
    if (v125)
    {
      v6 = v179;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        v162 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        *(_DWORD *)buf = 138543874;
        id v185 = v162;
        __int16 v186 = 1024;
        *(_DWORD *)v187 = v124;
        *(_WORD *)&v187[4] = 2114;
        *(void *)&v187[6] = v125;
        _os_log_error_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_ERROR,  "[SwitchArcade]:Replaced SINF on app with bundleID: %{public}@ result: %d error: %{public}@",  buf,  0x1Cu);
      }

      if ((v124 & 1) == 0)
      {
        uint8_t v129 = 0;
LABEL_121:
        id v114 = v125;
        goto LABEL_122;
      }

- (void).cxx_destruct
{
}

@end